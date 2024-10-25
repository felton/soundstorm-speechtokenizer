#!/usr/bin/env bash

echo "Downloading software/models"
cd /workspace
mkdir SoundStorm
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
apt-get install -y vim git-lfs
git lfs install
git clone https://huggingface.co/fnlp/SpeechTokenizer
wget -qO ./SoundStorm/SoundStorm_best_dev.pt --content-disposition "https://huggingface.co/fnlp/USLM/resolve/main/SoundStorm_LibriSpeech/SoundStorm_best_dev.pt?download=true"
wget -qO- "https://www.openslr.org/resources/12/dev-clean.tar.gz" | tar -xz --no-same-owner
git clone https://github.com/felton/soundstorm-speechtokenizer.git
cd soundstorm-speechtokenizer
pip install .
git checkout runpod
export $(cat .env | xargs)

echo "Done"