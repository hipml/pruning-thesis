#!/bin/bash
#SBATCH --partition=secondary
#SBATCH --gres=gpu:1
#SBATCH --time=04:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=128G
#SBATCH --job-name=helptheadmins
#SBATCH --output=logs/%x/%j/%a.out
#SBATCH --nodelist=ccc0424
#SBATCH --error=logs/%x/%j/%a.err

# debug mode
# set -e
# set -x

module load anaconda3/2024.06-Jun
module load cuda/12.4
module load texlive/2019
source /home/lamber10/.bashrc
export BNB_CUDA_VERSION=124
conda activate res_env
cd /projects/illinois/eng/cs/juliahmr/thesis-lamber10

mkdir -p logs

MODEL_NAME="$1"
TASK="$2"
NUM="$3"

python src/train.py --model "$MODEL_NAME" --task "$TASK" --nltp "$NUM"