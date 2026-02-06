# ProjectLLM Command-Line Interface (CLI)

ProjectLLM on the command-line.

More details on the [wiki](https://github.com/nomic-ai/ProjectLLM/wiki/Python-CLI).

## Quickstart

The CLI is based on the `ProjectLLM` Python bindings and the `typer` package.

The following shows one way to get started with the CLI, the documentation has more information.
Typically, you will want to replace `python` with `python3` on _Unix-like_ systems and `py -3` on
_Windows_. Also, it's assumed you have all the necessary Python components already installed.

The CLI is a self-contained Python script named [app.py] ([download][app.py-download]). As long as
its package dependencies are present, you can download and run it from wherever you like.

[app.py]: https://github.com/nomic-ai/ProjectLLM/blob/main/ProjectLLM-bindings/cli/app.py
[app.py-download]: https://raw.githubusercontent.com/nomic-ai/ProjectLLM/main/ProjectLLM-bindings/cli/app.py

```shell
# optional but recommended: create and use a virtual environment
python -m venv ProjectLLM-cli
```
_Windows_ and _Unix-like_ systems differ slightly in how you activate a _virtual environment_:
- _Unix-like_, typically: `. ProjectLLM-cli/bin/activate`
- _Windows_: `ProjectLLM-cli\Scripts\activate`

Then:
```shell
# pip-install the necessary packages; omit '--user' if using a virtual environment
python -m pip install --user --upgrade ProjectLLM typer
# run the CLI
python app.py repl
```
By default, it will automatically download the `Mistral Instruct` model to `.cache/ProjectLLM/` in your
user directory, if necessary.

If you have already saved a model beforehand, specify its path with the `-m`/`--model` argument,
for example:
```shell
python app.py repl --model /home/user/my-ProjectLLM-models/mistral-7b-instruct-v0.1.Q4_0.gguf
```
