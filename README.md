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

## GitHub Action

> TODO

```yaml
name: github pages

on:
push:
    branches:
    - master
schedule:
    - cron: 11 08 * * *

jobs:
deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
        with:
        persist-credentials: false
        # Number of commits to fetch. 0 indicates all history.
        # Default: 1
        fetch-depth: 0

    - name: Setup Python
        # https://github.com/actions/virtual-environments/issues/1202
        # uses: actions/setup-python@v1
        # with:
        #   python-version: '3.8'
        uses: actions/setup-python@v2
        with:
        python-version: 3.10
        architecture: x64

    - name: Cache dependencies
        uses: actions/cache@v4
        with:
        path: ~/.cache/pip
        key: ${{ runner.os }}-pip-${{ hashFiles('**/requirements.txt') }}
        restore-keys: |
            ${{ runner.os }}-pip-

    - name: Install dependencies
        run: pip install pip-tools

    - name: Update requirements
        run: make update

    - name: Make the site
        run: make build-docs

    - name: Commit files
        run: |
        git config --local user.email "action@github.com"
        git config --local user.name "GitHub Action"
        git add requirements.txt
        git add docs/newsletter
        git diff-index --quiet HEAD \
            || git commit -m "chore: update dependency and publish newsletters"

    - name: Push changes
        uses: ad-m/github-push-action@master
        with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        branch: master

    - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        with:
        deploy_key: ${{ secrets.ACTIONS_DEPLOY_KEY }}
        publish_dir: ./site
```


## License

Copyright 2024, Manifold Finance Inc.