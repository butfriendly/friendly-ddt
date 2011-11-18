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

Download Apache FOP and extract it. Afterwards copy the jar and libs to
your Java extensions directory.

    $ cp fop-0.94/build/fop.jar ~/Library/Java/Extensions
    $ cp fop-0.94/lib/*.jar ~/Library/Java/Extensions

Setup Docbook XSL
-----------------

You can obtain the latest release of Docbook-XSL from http://docbook.sourceforge.net/.

1. Download Docbook XSL to lib
2. Extract
3. Symlink ``docbook-xsl-1.X.X`` to ``docbook-xsl``

Convert TrueType Fonts
----------------------

Before you can make use of TrueType fonts you have to convert them. 
Put them in ``assets/fonts``.

    $ cd assets/fonts
    $ java org.apache.fop.fonts.apps.TTFReader XX.ttf XX.xml

Conversion
----------

All the magic happens at ``bin/dtk``

Generate PDF

    bin/dtk convert -p src/manual/master.xml dest

Type ``bin/dtk help`` for help

Convert the example doc by calling

    bin/dtk convert -p src/api_manual_en/master.xml api