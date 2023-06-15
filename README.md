# Tools-UniversalSequenceClassifier
This repo collects sequence classifiers that have (fairly) good zero-shot transfer learning ability. 
The idea behind this is to create a reusable component for various projects. 

UIE (the paper is for sequence tagging. this application is a variance of it for sequence classification)
## List of models
### Universal Text Classification (UTC) (idea from [the USM paper](https://arxiv.org/abs/2301.03282), [docs](https://github.com/PaddlePaddle/PaddleNLP/blob/develop/applications/zero_shot_text_classification/README_en.md) in [PaddleNLP](https://github.com/PaddlePaddle/PaddleNLP))
- No dedicated paper for UTC. It is a variant of USM. 
- Base model is ERNIE
- The training scheme of UTC explicitly allow users to define a set of labels for the model to choose from.
- which is enabled by semantic similarity search: comparing representations of each label and the aggregated sentence representation.
- fine-tunable with few examples (this is a pretty cool feature for different requirements)


## Troubleshooting
- If you encounter illegal hardware instruction error with a Mac M1 machine, please refer to [this](https://github.com/PaddlePaddle/Paddle/issues/49567#:~:text=python%20%2Dm%20pip%20download%20paddlepaddle%3D%3D2.4.1%20%2Df%20https%3A//www.paddlepaddle.org.cn/whl/mac/openblas/noavx/stable.html%20%20%2D%2Dno%2Dindex%20%2D%2Dno%2Ddeps).


## Something from the heart
The quality of predictions heavily depends on how you phrase the scheme. Therefore, we can not guarantee you with high-quality predictions. 

More specifically, the model learns to compare the embeddings of sentences and the embeddings of each individual label defined in the scheme. The default scheme is 
```
default_scheme = ["Earthquake", "Flooding", "Tropical storm", "Explosion", "Shooting", "Wildfire", "Hostage",
                  "Pandemic", "War", "Inflation"]
```
If no match is found, an `out-of-scope` class will be used. 