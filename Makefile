# ----------------
# User commands
# ----------------

BUILD_DIR=build
LATEXINDENT_ARGS=-l latexindent.yaml -c $(BUILD_DIR)
LATEXMK_ARGS=-halt-on-error -time -xelatex -outdir=build -shell-escape

all: build

# Build latex files in root directory
build:
	latexmk main.tex $(LATEXMK_ARGS)
	cp build/main.pdf .

# Format tex files in root directory
format:
	latexindent main.tex -w $(LATEXINDENT_ARGS)

# Clean temporary files
clean:
	latexmk -C $(LATEXMK_ARGS)

# ----------------
# Developer commands
# ----------------

# Format all tex and dtx files
format-dev:
	.github/ci/format.sh $(LATEXINDENT_ARGS)

# Clean all temporary files and generated files
clean-dev:
	latexmk -C
	cd src && l3build clean
	git clean -dfX

# Build all covers to `cover.pdf`
build-cover:
	.github/ci/gen_cover.sh $(LATEXMK_ARGS)
	cp build/cover.pdf .

# Build sjtuthesis package
build-dev:
	cd src && l3build ctan

# Generate `.sty` files and copy resources
generate:
	cd sjtuthesis/source && xetex sjtuthesis.dtx -output-directory=../../$(BUILD_DIR)/sjtuthesis

.PHONY: build format clean
