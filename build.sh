#!/usr/bin/env bash

set -o -u

echo " ✔︎ Staring Build process.."
echo ""
#check_mark="\033[1;32m✔\033[0m"

header() { echo -e "\n\033[1m$1\033[0m"; }


header "Loading Build Enviornment...\n"


git fetch --unshallow 
git config user.name github-actions[bot]
git config user.email 41898282+github-actions[bot]@users.noreply.github.com
python3 -m venv docs-venv
# shellcheck source=docs-venv/bin/activate
# shellcheck disable=SC1091
source docs-venv/bin/activate
pip3 install -r requirements.txt
pip3 install git+https://${GH_TOKEN}@github.com/squidfunk/mkdocs-material-insiders.git


mkdir -p site/.well-known
INSIDERS=1 mkdocs build --clean --site-dir site/
date "+%Y-%m-%dT%H:%M:%S%z" > site/build_id.txt
cp sitemap.xml site/sitemap.xml
cp sitemap.txt site/sitemap.txt

#TZ=UTC git show --quiet --date="format-local:%Y.%-m.%-d" --format="nightly-%cd" > site/.well-known/nightly-release.txt
#cp nightly-release.txt site/.well-known/nightly-release.txt
# git config user.name github-actions[bot]
#export GIT_COMMITTER_NAME='github-actions[bot]'
# git config user.email 41898282+github-actions[bot]@users.noreply.github.com

#export GIT_COMMITTER_EMAIL='41898282+github-actions[bot]@users.noreply.github.com'
#export GIT_COMMITTER_DATE=2024-04-26

#GIT_COMMITTER_EMAIL='41898282+github-actions[bot]@users.noreply.github.com' GIT_AUTHOR_DATE="Fri Apr 26 23:36:15 PDT 2024" GIT_COMMITTER_DATE="Fri Apr 26 23:36:15 PDT 2024" git init && git add . && git commit --allow-empty --allow-empty-message -m '' && git branch -M gh-pages
# mike deploy --push --ignore-remote-status --allow-empty --update-aliases 0.2.1 latest
# 
#mike deploy v0.1.1


#p platform-docs.xml site/.well-known/platform-docs.xml
#cp commit-ts.txt site/.well-known/commit-ts.txt
#cp sitemap.xml site/sitemap.xml


header "Next Steps\n"
echo "Build Artifact is available at: site/build_id.txt"

sleep 1

echo "Build completed successfully"
exit 0