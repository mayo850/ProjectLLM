## Training ProjectLLM-J

### Technical Reports

<p align="center">
<a href="https://ProjectLLM.io/reports/ProjectLLM_Technical_Report_3.pdf">:green_book: Technical Report 3: ProjectLLM Snoozy and Groovy </a>
</p>

<p align="center">
<a href="https://static.nomic.ai/ProjectLLM/2023_ProjectLLM-J_Technical_Report_2.pdf">:green_book: Technical Report 2: ProjectLLM-J </a>
</p>

<p align="center">
<a href="https://s3.amazonaws.com/static.nomic.ai/ProjectLLM/2023_ProjectLLM_Technical_Report.pdf">:green_book: Technical Report 1: ProjectLLM</a>
</p>

### ProjectLLM-J Training Data

- We are releasing the curated training data for anyone to replicate ProjectLLM-J here: [ProjectLLM-J Training Data](https://huggingface.co/datasets/nomic-ai/ProjectLLM-j-prompt-generations)
   - [Atlas Map of Prompts](https://atlas.nomic.ai/map/ProjectLLM-j-prompts-curated)
   - [Atlas Map of Responses](https://atlas.nomic.ai/map/ProjectLLM-j-response-curated)
   
We have released updated versions of our `ProjectLLM-J` model and training data. 

- `v1.0`: The original model trained on the v1.0 dataset
- `v1.1-breezy`: Trained on a filtered dataset where we removed all instances of AI language model
- `v1.2-jazzy`: Trained on a filtered dataset where we also removed instances like I'm sorry, I can't answer... and AI language model

The [models](https://huggingface.co/nomic-ai/ProjectLLM-j) and [data](https://huggingface.co/datasets/nomic-ai/ProjectLLM-j-prompt-generations) versions can be specified by passing a `revision` argument.

For example, to load the `v1.2-jazzy` model and dataset, run:

```python
from datasets import load_dataset
from transformers import AutoModelForCausalLM

dataset = load_dataset("nomic-ai/ProjectLLM-j-prompt-generations", revision="v1.2-jazzy")
model = AutoModelForCausalLM.from_pretrained("nomic-ai/ProjectLLM-j", revision="v1.2-jazzy")
```

### ProjectLLM-J Training Instructions

```bash
accelerate launch --dynamo_backend=inductor --num_processes=8 --num_machines=1 --machine_rank=0 --deepspeed_multinode_launcher standard --mixed_precision=bf16  --use_deepspeed --deepspeed_config_file=configs/deepspeed/ds_config_gptj.json train.py --config configs/train/finetune_gptj.yaml
```
