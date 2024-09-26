#!/bin/bash

# Define version arrays
pytorch_versions=("2.5" "2.4" "2.3" "2.2" "2.1")
tensorflow_versions=("2.17.0" "2.16.1" "2.15.1" "2.15.0" "2.14.0" "2.12.0")
python_versions=("3.9" "3.10" "3.11" "3.12")
cuda_versions=("12.4" "12.2" "12.1" "11.8")

# Map of TensorFlow versions to allowed PyTorch versions
declare -A tf_pt_map
tf_pt_map["2.17.0"]="2.5"
tf_pt_map["2.16.1"]="2.5"
tf_pt_map["2.15.1"]="2.5"
tf_pt_map["2.15.0"]="2.4"
tf_pt_map["2.14.0"]="2.3 2.2 2.1"
tf_pt_map["2.12.0"]="2.5 2.4"

# Iterate over combinations
for cuda in "${cuda_versions[@]}"; do
    for python in "${python_versions[@]}"; do
        for tf in "${tensorflow_versions[@]}"; do
            for pt in ${tf_pt_map[$tf]}; do
                # Check if Python version is valid for the current combination
                case $pt in
                    "2.5")
                        [[ "$python" == "3.12" ]] && continue
                        ;;
                    "2.4")
                        [[ "$python" == "3.9" ]] && continue
                        ;;
                    "2.3")
                        [[ "$python" == "3.12" ]] && continue
                        ;;
                esac

                # Define Docker tag
                tag="pytorch${pt}-tensorflow${tf}-python${python}-cuda${cuda}"

                # Run Docker build command
                echo "Building Docker image: $tag"
                docker build --file Dockerfiles/Dockerfile.torch-tf2-conda . -t "$tag" \
                    --build-arg PYTORCH_VERSION=$pt \
                    --build-arg TENSORFLOW_VERSION=$tf \
                    --build-arg PYTHON_VERSION=$python \
                    --build-arg CUDA_VERSION="cu${cuda//./}"
            done
        done
    done
done
