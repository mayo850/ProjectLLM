# Developing the CLI
## Documentation
Documentation can be found in three places:
- `app.py` docstrings & comments
- a Readme: `ProjectLLM-bindings/cli/README.md`
- the actual CLI documentation: `ProjectLLM-bindings/python/docs/ProjectLLM_cli.md`

The _docstrings_ are meant for programmatic use. Since the CLI is primarily geared towards users and
not to build on top, they're kept terse.

The _Readme_ is mostly meant for users and includes:
- a link to the _CLI documentation_ (on the [website])
- a Quickstart section with some guidance on how to get started with a sane setup

The _CLI documentation_ and other documentation are located in the above mentioned `docs/` folder.
They're in Markdown format and built for the [website]. Of the three, they should be the most
detailed.

[website]: https://docs.ProjectLLM.io/ProjectLLM_cli.html


## Versioning
The version number should now follow the `ProjectLLM` PyPI package, so compatibility is more clear.

The one place to change it is the `namedtuple` called `VERSION_INFO`.
