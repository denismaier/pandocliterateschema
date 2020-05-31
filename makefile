# Makefile
#
# Run "make schema" to produce schema
#
# Run "make specs" to produce documentation
#



# Filename (without extension)

input-files=csl-citation-bibliography.md csl-macro.md
schema-output=schema.rnc
specs-output=specification.md

# filters
to-schema=to-schema.lua
to-docs=to-docs.lua


# Pandoc basic settings

pandoc=pandoc
datadir=
# Pandoc options


general_options= 

# To specification options

to-specs-options=--to markdown --standalone --atx-headers -L to-specs.lua

# To schema options

to-schema-options=--to plain -L to-schema.lua

# Rules

schema: 
	$(pandoc) $(general_options) $(to-schema-options) -o $(schema-output) $(input-files)

specs: 
	$(pandoc) $(general_options) $(to-specs-options) -o $(specs-output) $(input-files)