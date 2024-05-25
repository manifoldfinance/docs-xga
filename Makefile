.PHONY: update
update:
    @echo "-------------------------"
    @echo "- Updating dependencies -"
    @echo "-------------------------"

    rm requirements.txt
    touch requirements.txt
    pip-compile -Ur requirements.in --allow-unsafe

    pip install -r requirements.txt

    @echo ""

.PHONY: build-docs
build-docs:
    @echo "--------------------------"
    @echo "- Building documentation -"
    @echo "--------------------------"

    mkdocs build

    @echo ""