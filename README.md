# docker-hub
Contains all my docker base images to simplify CI/CD workflows in my remaining repositories.

https://www.tensorflow.org/install/source

| PyTorch Version | TensorFlow Version | Python Versions | CUDA Version | cuDNN Version |
|-----------------|--------------------|-----------------|--------------|---------------|
| 2.5             | 2.17.0 - 2.16.1    | 3.9 - 3.12      | 12.4         | 9.1.0.70      | CUDNN missmatch
| 2.5             | 2.17.0 - 2.15.1    | 3.9 - 3.12      | 12.2         | 9.1.0.70      | CUDNN missmatch
| 2.5             | 2.17.0 - 2.12.0    | 3.9 - 3.11      | 11.8         | 9.1.0.70      | CUDNN missmatch
| 2.4             | 2.15.0 - 2.12.0    | 3.8 - 3.12      | 12.1         | 9.1.0.70      | CUDNN missmatch (9 for torch, 8.9 for tf)
| 2.3             | 2.14.0             | 3.9 - 3.11      | 11.8         | 8.7.0.84      | Technically only valid combinations
| 2.2             | 2.14.0             | 3.8 - 3.11      | 12.1 (exp)   | 8.9.2.26      |
| 2.1             | 2.14.0             | 3.8 - 3.11      | 12.1 (exp)   | 8.9.2.26      |