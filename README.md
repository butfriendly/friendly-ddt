Docbook Documentation Toolkit - DDT
===================================

The DDT is used internally for generating HTML and PDF docs from 
DocBook XML documents.

Only tested on MAC OS X currently.

Requirements
------------

1. xmllint
2. xsltproc
3. Apache FOP
4. Docbook XSL

Setup Apache FOP
----------------

1. Download Apache FOP

$ cp fop-0.94/build/fop.jar ~/Library/Java/Extensions
$ cp fop-0.94/lib/*.jar ~/Library/Java/Extensions

Setup Docbook XSL
-----------------

1. Download Docbook XSL to lib
2. Extract
3. Symlink docbook-xsl-1.X.X to docbook-xsl

Convert TrueType Fonts
----------------------

$ java org.apache.fop.fonts.apps.TTFReader XX.ttf XX.xml

Conversion
----------

All the magic happens at bin/dtk

Generate PDF

bin/dtk convert -p src/manual/master.xml dest

Type bin/dtk help for help

Convert the example doc by calling

bin/dtk convert -p src/api_manual_en/master.xml api