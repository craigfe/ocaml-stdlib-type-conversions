build_dir = ./images
outputs = $(build_dir)/containers.png $(build_dir)/data.png

font = "JetBrainsMono"
node_color = "\#f5f7ff"
line_color = "\#5e6687"

all: $(outputs)

$(outputs): $(build_dir)/%.png: %.dot
	circo -Gfontname=$(font) -Nfontname=$(font) -Efontname=$(font) -Nstyle="filled" \
		-Nfillcolor=$(node_color) -Ncolor=$(line_color) -Nfontcolor=$(line_color) \
		-Ecolor=$(line_color) -Efontcolor=$(line_color) \
		-Tsvg $< > tmp.svg && convert -density 200 tmp.svg $@
	rm tmp.svg

