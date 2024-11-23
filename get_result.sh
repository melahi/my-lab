root=$1

getMudabbir() {
    echo -n "Mudabbir $1 : "
    echo `grep "Plan found!" -srl $root/*mudabbir/$1/ | wc -l`
}

getFreelunch() {
    echo -n "Freelunch $1 : "
    echo `grep "PLAN FOUND" -srl $root/*freelunch/$1/ | wc -l`
}

getMpC() {
    echo -n "MpC $1 : "
    echo `grep "FOUND" -srl $root/*MpC/$1/ | wc -l`
}

getFF() {
    echo -n "ff $1 : "
    echo `grep "legal" -srl $root/*ff/$1/ | wc -l`
}

getLAMA() {
    echo -n "lama $1 : "
    echo `grep "Solution" -srl $root/*lama/$1/ | wc -l`
}

getForcedFD() {
    echo -n "Forced-FD $1 : "
    echo `grep "Solution" -srl $root/*forced-fd/$1/ | wc -l`
}

getFDSS() {
    echo -n "fdss $1 : "
    echo `grep "Solution" -srl $root/*fdss/$1/ | wc -l`
}

getMaidu() {
    echo -n "maidu $1 : "
    echo `grep "Solution" -srl $root/*maidu/$1/ | wc -l`
}

getSaarplan() {
    echo -n "Saarplan $1 : "
    echo `grep "Solution found" -srl $root/*saarplan/$1/ | wc -l`
}

getCelebes() {
    echo -n "xndl_celebes $1 : "
    echo `grep " PLAN " -srl $root/*xndl_celebes/$1/ | wc -l`
}

getXNDL_SAT() {
    echo -n "xndl_sat $1 : "
    echo `grep '\*\*\*\*\*\*\*\*\*\*\*\*\* PLAN \*\*\*\*\*\*\*\*\\*\*\*\*\*' -srl $root/*xndl_sat/$1/ | wc -l`
}

getBFWSInitstate() {
    echo -n "BFWS initstate relevant $1 : "
    echo `grep "Plan found with cost: [0-9]\+" -srl $root/*_bfws_BFWS-f5-initstate-relevant/$1/ | wc -l`
}

getBFWSGoalCount() {
    echo -n "BFWS goal-count only $1 : "
    echo `grep "Plan found with cost: [0-9]\+" -srl $root/*_bfws_BFWS-goalcount-only/$1/ | wc -l`
}

getBFWSPortfolio() {
    echo -n "BFWS portfolio $1 : "
    echo `grep "Plan found with cost: [0-9]\+" -srl $root/*_bfws_portfolio/$1/ | wc -l`
}

getBFWSF5() {
    echo -n "BFWS f5 $1 : "
    echo `grep "Plan found with cost: [0-9]\+" -srl $root/*_bfws_BFWS-f5/$1/ | wc -l`
}

getBFWSFDInitstate() {
    echo -n "BFWS FD initstate relevant $1 : "
    echo `grep "Plan found with cost: [0-9]\+" -srl $root/*_bfws_fd_BFWS-f5-initstate-relevant/$1/ | wc -l`
}

getBFWSFDGoalCount() {
    echo -n "BFWS FD goal-count only $1 : "
    echo `grep "Plan found with cost: [0-9]\+" -srl $root/*_bfws_fd_BFWS-goalcount-only/$1/ | wc -l`
}

getBFWSFDPortfolio() {
    echo -n "BFWS FD portfolio $1 : "
    echo `grep "Plan found with cost: [0-9]\+" -srl $root/*_bfws_fd_portfolio/$1/ | wc -l`
}

getBFWSFDF5() {
    echo -n "BFWS FD f5 $1 : "
    echo `grep "Plan found with cost: [0-9]\+" -srl $root/*_bfws_fd_BFWS-f5/$1/ | wc -l`
}

getApxBFWSInitstate() {
    echo -n "BFWS Apx initstate relevant $1 : "
    echo `grep "Plan found with cost: [0-9]\+" -srl $root/*approximate_bfws_BFWS-f5-initstate-relevant/$1/ | wc -l`
}

getApxBFWSGoalCount() {
    echo -n "BFWS Apx goal-count only $1 : "
    echo `grep "Plan found with cost: [0-9]\+" -srl $root/*approximate_bfws_BFWS-goalcount-only/$1/ | wc -l`
}

getApxBFWSPortfolio() {
    echo -n "BFWS Apx portfolio $1 : "
    echo `grep "Plan found with cost: [0-9]\+" -srl $root/*approximate_bfws_portfolio/$1/ | wc -l`
}

getApxBFWSF5() {
    echo -n "BFWS Apx f5 $1 : "
    echo `grep "Plan found with cost: [0-9]\+" -srl $root/*approximate_bfws_BFWS-f5/$1/ | wc -l`
}

getApxBFWSF5OLC() {
    echo -n "BFWS Apx f5 OLC $1 : "
    echo `grep "Plan found with cost: [0-9]\+" -srl $root/*approximate_bfws_BFWS-f5-OLC/$1/ | wc -l`
}

getApxBFWSFDInitstate() {
    echo -n "BFWS Apx FD initstate relevant $1 : "
    echo `grep "Plan found with cost: [0-9]\+" -srl $root/*approximate_bfws_fd_BFWS-f5-initstate-relevant/$1/ | wc -l`
}

getApxBFWSFDGoalCount() {
    echo -n "BFWS Apx FD goal-count only $1 : "
    echo `grep "Plan found with cost: [0-9]\+" -srl $root/*approximate_bfws_fd_BFWS-goalcount-only/$1/ | wc -l`
}

getApxBFWSFDPortfolio() {
    echo -n "BFWS Apx FD portfolio $1 : "
    echo `grep "Plan found with cost: [0-9]\+" -srl $root/*approximate_bfws_fd_portfolio/$1/ | wc -l`
}

getApxBFWSFDF5() {
    echo -n "BFWS Apx FD f5 $1 : "
    echo `grep "Plan found with cost: [0-9]\+" -srl $root/*approximate_bfws_fd_BFWS-f5/$1/ | wc -l`
}

getApxBFWSFDF5OLC() {
    echo -n "BFWS Apx FD f5 OLC $1 : "
    echo `grep "Plan found with cost: [0-9]\+" -srl $root/*approximate_bfws_fd_BFWS-f5-OLC/$1/ | wc -l`
}

getBFWSLAMAPortfolio() {
    echo -n "BFWS-LAMA portfolio $1 : "
    echo `grep -e "Plan found with cost: [0-9]\+" -e "Solution" -srl $root/*bfws_lama_portfolio/$1/ | wc -l`
}

getPowerlifted() {
    echo -n "powerlifted $1 : "
    echo `grep "Solution found." -srl $root/*powerlifted/$1/ | wc -l`
}

if [ -d $root/*MpC ]
then
    getMpC
    for domain in $root/*MpC/*/
    do
        getMpC `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*mudabbir ]
then
    getMudabbir
    for domain in $root/*mudabbir/*/
    do
        getMudabbir `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*freelunch ]
then
    getFreelunch
    for domain in $root/*freelunch/*/
    do
        getFreelunch `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*ff ]
then
    getFF
    for domain in $root/*ff/*/
    do
        getFF `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*fdss ]
then
    getFDSS
    for domain in $root/*fdss/*/
    do
        getFDSS `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*maidu ]
then
    getMaidu
    for domain in $root/*maidu/*/
    do
        getMaidu `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*lama ]
then
    getLAMA
    for domain in $root/*lama/*/
    do
        getLAMA `basename "$domain"`
    done
    echo "---------------------------------"
fi
 
if [ -d $root/*forced-fd ]
then
    getForcedFD
    for domain in $root/*forced-fd/*/
    do
        getForcedFD `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*bfws_BFWS-goalcount-only ]
then
    getBFWSGoalCount
    for domain in $root/*bfws_BFWS-goalcount-only/*/
    do
        getBFWSGoalCount `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*bfws_fd_BFWS-goalcount-only ]
then
    getBFWSFDGoalCount
    for domain in $root/*bfws_fd_BFWS-goalcount-only/*/
    do
        getBFWSFDGoalCount `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d  $root/*bfws_BFWS-f5-initstate-relevant ]
then
    getBFWSInitstate
    for domain in $root/*bfws_BFWS-f5-initstate-relevant/*/
    do
        getBFWSInitstate `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*bfws_fd_BFWS-f5-initstate-relevant ]
then
    getBFWSFDInitstate
    for domain in $root/*bfws_fd_BFWS-f5-initstate-relevant/*/
    do
        getBFWSFDInitstate `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*bfws_portfolio ]
then
    getBFWSPortfolio
    for domain in $root/*bfws_portfolio/*/
    do
        getBFWSPortfolio `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*bfws_fd_portfolio ]
then
    getBFWSFDPortfolio
    for domain in $root/*bfws_fd_portfolio/*/
    do
        getBFWSFDPortfolio `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*bfws_lama_portfolio ]
then
    getBFWSLAMAPortfolio
    for domain in $root/*bfws_lama_portfolio/*/
    do
        getBFWSLAMAPortfolio `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*bfws_BFWS-f5 ]
then
    getBFWSF5
    for domain in $root/*bfws_BFWS-f5/*/
    do
        getBFWSF5 `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*bfws_fd_BFWS-f5 ]
then
    getBFWSFDF5
    for domain in $root/*bfws_fd_BFWS-f5/*/
    do
        getBFWSFDF5 `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*approximate_bfws_BFWS-goalcount-only ]
then
    getApxBFWSGoalCount
    for domain in $root/*approximate_bfws_BFWS-goalcount-only/*/
    do
        getApxBFWSGoalCount `basename "$domain"`
    done
    echo "---------------------------------"
fi
 
if [ -d $root/*approximate_bfws_fd_BFWS-goalcount-only ]
then
    getApxBFWSFDGoalCount
    for domain in $root/*approximate_bfws_fd_BFWS-goalcount-only/*/
    do
        getApxBFWSFDGoalCount `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*approximate_bfws_BFWS-f5-initstate-relevant ]
then
    getApxBFWSInitstate
    for domain in $root/*approximate_bfws_BFWS-f5-initstate-relevant/*/
    do
        getApxBFWSInitstate `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*approximate_bfws_fd_BFWS-f5-initstate-relevant ]
then
    getApxBFWSFDInitstate
    for domain in $root/*approximate_bfws_fd_BFWS-f5-initstate-relevant/*/
    do
        getApxBFWSFDInitstate `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*approximate_bfws_portfolio ]
then
    getApxBFWSPortfolio
    for domain in $root/*approximate_bfws_portfolio/*/
    do
        getApxBFWSPortfolio `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*approximate_bfws_fd_portfolio ]
then
    getApxBFWSFDPortfolio
    for domain in $root/*approximate_bfws_fd_portfolio/*/
    do
        getApxBFWSFDPortfolio `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*approximate_bfws_BFWS-f5 ]
then
    getApxBFWSF5
    for domain in $root/*approximate_bfws_BFWS-f5/*/
    do
        getApxBFWSF5 `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*approximate_bfws_fd_BFWS-f5 ]
then
    getApxBFWSFDF5
    for domain in $root/*approximate_bfws_fd_BFWS-f5/*/
    do
        getApxBFWSFDF5 `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*approximate_bfws_BFWS-f5 ]
then
    getApxBFWSF5OLC
    for domain in $root/*approximate_bfws_BFWS-f5/*/
    do
        getApxBFWSF5OLC `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*approximate_bfws_fd_BFWS-f5 ]
then
    getApxBFWSFDF5OLC
    for domain in $root/*approximate_bfws_fd_BFWS-f5/*/
    do
        getApxBFWSFDF5OLC `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*powerlifted ]
then
    getPowerlifted
    for domain in $root/*powerlifted/*/
    do
        getPowerlifted `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*saarplan ]
then
    getSaarplan
    for domain in $root/*saarplan/*/
    do
        getSaarplan `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*xndl_celebes ]
then
    getCelebes
    for domain in $root/*xndl_celebes/*/
    do
        getCelebes `basename "$domain"`
    done
    echo "---------------------------------"
fi

if [ -d $root/*xndl_sat ]
then
    getXNDL_SAT
    for domain in $root/*xndl_sat/*/
    do
        getXNDL_SAT `basename "$domain"`
    done
    echo "---------------------------------"
fi


# Checking!
# grep "warning" -ir $root | grep -v "Atom bond(c3, c4)"
# grep "RPython traceback:" -r $root
# grep "Python traceback:" -r $root
# grep "AssertionError" -r $root
# grep "error" -ir $root
grep "Cannot send after transport endpoint shutdown" -r $root
grep "command not found" -r $root
grep "Failed plans:" -r $root
grep 'No plan found!' -r $root  # For Mudabbir
