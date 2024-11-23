#!/usr/bin/python3

import os
import sys
from typing import List, Tuple
from subprocess import run
from dataclasses import dataclass, field
from copy import deepcopy


######################  CONFIGURATION  ###################### 
TIME_LIMIT = 30
MEMORY_LIMIT = "8G"

lama = "lama"
fdss = "fdss"
maidu = "maidu"
ff = "ff"
mudabbir = "mudabbir"

# BFWS Family
bfws_initstate = "bfws BFWS-f5-initstate-relevant"
bfws_goal_count = "bfws BFWS-goalcount-only"
bfws_portfolio = "bfws_portfolio"
bfws_f5 = "bfws BFWS-f5"
bfws_fd_initstate = "bfws_fd BFWS-f5-initstate-relevant"
bfws_fd_goal_count = "bfws_fd BFWS-goalcount-only"
bfws_fd_portfolio = "bfws_fd_portfolio"
bfws_fd_f5 = "bfws_fd BFWS-f5"
apx_bfws_initstate = "approximate_bfws BFWS-f5-initstate-relevant"
apx_bfws_goal_count = "approximate_bfws BFWS-goalcount-only"
apx_bfws_portfolio = "approximate_bfws_portfolio"
apx_bfws_f5 = "approximate_bfws BFWS-f5"
apx_bfws_f5_OLC = "approximate_bfws BFWS-f5-OLC"
apx_bfws_fd_initstate = "approximate_bfws_fd BFWS-f5-initstate-relevant"
apx_bfws_fd_goal_count = "approximate_bfws_fd BFWS-goalcount-only"
apx_bfws_fd_portfolio = "approximate_bfws_fd_portfolio"
apx_bfws_fd_f5 = "approximate_bfws_fd BFWS-f5"
apx_bfws_fd_f5_OLC = "approximate_bfws_fd BFWS-f5-OLC"

bfws_lama_portfolio = "bfws_lama_portfolio"

experiment = f"experiment {MEMORY_LIMIT} {TIME_LIMIT} {{}}"

classical_domains_dir = os.path.expanduser("/scratch/work/elahim1/classical-domains/classical/")

IPC14 = ["barman-sat14-strips",
         "openstacks-sat14-strips",
         "childsnack-sat14-strips",
         "parking-sat14-strips",
         "tetris-sat14-strips",
         "floortile-sat14-strips",
         "thoughtful-sat14-strips",
         "ged-sat14-strips",
         "transport-sat14-strips",
         "hiking-sat14-strips",
         "visitall-sat14-strips"]

IPC18 = ["agricola-sat18",
         "caldera-sat18",
         "caldera-split-sat18",
         "data-network-sat18",
         "flashfill-sat18",
         "nurikabe-sat18",
         "organic-synthesis-sat18",
         "organic-synthesis-split-sat18",
         "settlers-sat18",
         "snake-sat18",
         "spider-sat18",
         "termes-sat18"]

IPC23 = ["folding",
         "labyrinth",
         "quantum-layout",
         "recharging-robots",
         "ricochet-robots",
         "rubiks-cube",
         "slitherlink"]


############################################################# 

#  1) Planners
##################


planners = []


planners += [lama, fdss, maidu]
planners += [ff]
planners += [mudabbir]


# 2) Domains
##################

domains_dir = classical_domains_dir
domains = IPC14 + IPC18 + IPC23


# 3) Output
##################

result_dir = "first"

############################################################# 


planners = [experiment.format(p) for p in planners] 


@dataclass
class Domain:
    name: str
    problems: List[Tuple[str, str]] = field(default_factory=list)

class Domains:
    def __init__(self, root_dir):
        sys.path.append(root_dir)
        self.__root_dir = root_dir
        self.__domains = []

    def __len__(self):
        length = 0
        for domain in self.__domains:
            length += len(domain.problems)
        return length

    def __call__(self):
        return deepcopy(self.__domains)

    def add_domain(self, domain_dir):
        new_domains = __import__(domain_dir, globals(), locals(), ['api']).api
        for domain in new_domains.domains:
            self.__domains.append(Domain(domain["name"]))
            for domain_file, problem_file in domain["problems"]:
                self.__domains[-1].problems.append((os.path.join(self.__root_dir, domain_file),
                                                    os.path.join(self.__root_dir, problem_file)))


class Runner:

    __TIME_COMMAND = "/usr/bin/time -o $output.time --verbos"

    def __init__(self, planner: str, domains: Domains):
        self.__planner = planner
        self.__domains = domains

    def __write_script(self, script_path, result_dir):
        with open(script_path, mode="w") as script:
            script.write(f'#!/bin/bash\n')
            script.write(f'#SBATCH --mem={MEMORY_LIMIT}\n')
            script.write(f'#SBATCH --time={TIME_LIMIT}\n')
            script.write(f'#SBATCH --output={os.path.join(result_dir, "result.%A.txt")}\n')
            script.write(f'#SBATCH --open-mode=append\n')
            script.write(f'#SBATCH --cpus-per-task=1\n')
            # script.write(f'#SBATCH --partition=batch-csl\n')
            script.write(f'#SBATCH --array=1-{len(self.__domains)}\n')
            script.write(f'\n')
            script.write(f'case $SLURM_ARRAY_TASK_ID in\n')
            index = 1
            for domain_data in self.__domains():
                output_dir = os.path.join(result_dir, domain_data.name)
                os.makedirs(output_dir, exist_ok=False)
                for domain, problem in domain_data.problems:
                    output = os.path.join(output_dir, f'{os.path.basename(problem)}.out')
                    script.write(f'\t{index}) problem={problem}; domain={domain}; output={output};;\n')
                    index += 1
            script.write(f'esac\n')
            script.write(f'\n')
            script.write(f'srun {self.__TIME_COMMAND} {self.__planner} $domain $problem &> $output')

    def run_solver(self, results_dir: str):
        os.makedirs(results_dir, exist_ok=False)
        script_path = os.path.join(results_dir, "script.sh")
        self.__write_script(script_path, results_dir)
        run(['sbatch', script_path])


def main():
    all_domains = Domains(domains_dir)
    for domain in domains:
        all_domains.add_domain(domain)
    for planner in planners:
        runner = Runner(planner, all_domains)
        runner.run_solver(os.path.join(result_dir, os.path.basename(planner).replace(" ", "_")))


if __name__ == "__main__":
    main()
