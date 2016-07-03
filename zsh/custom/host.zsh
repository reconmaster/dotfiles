# Here are host specific configurations

###################################
# Dirac
###################################

if [[ "$HOST" == "dirac" ]]
then
research=$HOME/research
fi

###################################
# Midway
###################################

if [[ "$HOST" =~ "midway*" ]]
then
cpel=$HOME/cpel
jobs=/home/amdavis/research/trajectories/iterative/job
research=$HOME/research
scratch=$HOME/scratch-midway
fi

###################################
# Nether
###################################

if [[ "$HOST" =~ "nether*" ]]
then
research=$HOME/research
scratch=$research/scratch
icrime=$scratch/trajectories/icrime
pytomo=$scratch/trajectories/lib/pytomo3d
fi

###################################
# Titan
###################################

if [[ "$HOST" =~ "titan*" ]]
then
research=$HOME/research
scratch=$research/scratch1
icrime=$scratch/trajectories/icrime
fi
