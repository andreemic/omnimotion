# for runpod instances: install conda to /workspace/anaconda3
wget https://repo.anaconda.com/archive/Anaconda3-2022.10-Linux-x86_64.sh
bash Anaconda3-2022.10-Linux-x86_64.sh -b -p /workspace/anaconda3

git clone --recurse-submodules https://github.com/qianqianwang68/omnimotion/
cd omnimotion/
conda create -n omnimotion python=3.8
conda activate omnimotion
pip install torch==1.10.0+cu111 torchvision==0.11.0+cu111 torchaudio==0.10.0 -f https://download.pytorch.org/whl/torch_stable.html
pip install matplotlib tensorboard scipy opencv-python tqdm tensorboardX configargparse ipdb kornia imageio[ffmpeg]

apt update && apt upgrade -y
apt install ffmpeg