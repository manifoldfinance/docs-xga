# [docs.xga.com](https://docs.xga.com)

> mkdocs

## Contributing

_See Guidelines_

## Guidelines

> TODO

### Commit message guidelines

The plugin assumes that you're using the Angular semantic versioning format to create the commits. Adapted to a
documentation repository such as the digital gardens, the structure would be:

```
{type_of_change}({file_changed}): {short_description}

{full_description}
Where:

type_of_change is one of:
```

`feat`: Add new content to the repository, it can be a new file or new content on an existent file. `fix`: Correct
existing content. `perf`: Improve existing content. `refactor`: Reorder the articles content. `style`: Correct grammar,
orthography or broken links. `ci`: Change the continuous integration pipelines. `chore`: Update the dependencies
required to build the site. `file_changed`: Name of the changed file (without the .md extension).

`short_description`: A succinct description of the change. It doesn't need to start with a capitalize letter nor end
with a dot. `full_description`: A summary of the added changes. For example:

```
feat(adr): introduce the Architecture Decision Records

[ADR](https://github.com/joelparkerhenderson/architecture_decision_record) are
short text documents that captures an important architectural decision made
along with its context and consequences.
Only changes of type feat, fix, perf or refactor will be added to the newsletter. The reader is not interested in the others.
```
