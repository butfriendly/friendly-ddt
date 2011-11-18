<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:fo="http://www.w3.org/1999/XSL/Format">
	
	<!-- ////////////////////////////////////////////////////////////////////// 
	// See 
	// - https://fisheye.springframework.org/browse/spring-net/trunk/doc/reference/lib/docbook-xsl-snapshot/fo/springnet.xsl?r=trunk 
	// - http://docbook.sourceforge.net/release/xsl/current/doc/fo/
	////////////////////////////////////////////////////////////////////// -->

	<!-- /////////////////////////////////////////////
	// Import base stylesheet                       //
	///////////////////////////////////////////// -->
	
	<xsl:import href="../lib/docbook-xsl/fo/docbook.xsl"/>

	<!-- /////////////////////////////////////////////
	// DRAFT                                        //
	///////////////////////////////////////////// -->
	
	<xsl:param name="draft.mode">0</xsl:param>
	<xsl:param name="draft.watermark.image">assets/images/draft.png</xsl:param>
	
	
	<!-- /////////////////////////////////////////////
	// PAPER & PAGE SIZE                            //
	///////////////////////////////////////////// -->
	
	<xsl:param name="paper.type">A4</xsl:param>
	<xsl:param name="double.sided">0</xsl:param>
	
	<!-- Space between paper border and content (chaotic stuff, don't touch) -->
	<!-- See http://docbook.sourceforge.net/release/xsl/current/doc/fo/general.html -->

	<!-- Top margin -->
	<xsl:param name="page.margin.top">5mm</xsl:param>
	<xsl:param name="region.before.extent">10mm</xsl:param>
	<xsl:param name="body.margin.top">15mm</xsl:param>
	
	<!-- Bottom margin -->
	<xsl:param name="page.margin.bottom">5mm</xsl:param>
	<xsl:param name="region.after.extent">10mm</xsl:param>
	<xsl:param name="body.margin.bottom">15mm</xsl:param>
	
	<xsl:param name="page.margin.outer">18mm</xsl:param>
	<xsl:param name="page.margin.inner">18mm</xsl:param>
	
	<xsl:param name="body.start.indent">10mm</xsl:param>
	<xsl:param name="body.end.indent">0pt</xsl:param>
	
	<!-- No intendation of Titles -->
	<xsl:param name="title.margin.left">0pc</xsl:param>

	<xsl:attribute-set name="formal.title.properties" use-attribute-sets="normal.para.spacing">
		<xsl:attribute name="font-weight">normal</xsl:attribute>
		<xsl:attribute name="font-size">
			<xsl:value-of select="$body.font.small * 1.0"/>
			<xsl:text>pt</xsl:text>
		</xsl:attribute>
		<xsl:attribute name="hyphenate">false</xsl:attribute>
		<xsl:attribute name="space-after.minimum">0.4em</xsl:attribute>
		<xsl:attribute name="space-after.optimum">0.6em</xsl:attribute>
		<xsl:attribute name="space-after.maximum">0.8em</xsl:attribute>
	</xsl:attribute-set>
	
	<!-- Don't show headers and footers on blank pages -->
	<xsl:param name="headers.on.blank.pages">0</xsl:param>
	<xsl:param name="footers.on.blank.pages">0</xsl:param>
	
	<!-- /////////////////////////////////////////////
	// EXTENSIONS                                   //
	///////////////////////////////////////////// -->
	
	<xsl:param name="use.extensions">1</xsl:param>
	<xsl:param name="tablecolumns.extension">0</xsl:param>
	<xsl:param name="callout.extensions">1</xsl:param>
	<xsl:param name="fop1.extensions">1</xsl:param>
	
	<!-- /////////////////////////////////////////////
	// Fonts & Styles                               //
	///////////////////////////////////////////// -->
	
	<!-- Font faces -->
	<xsl:param name="title.font.family">DINLight</xsl:param>
	<xsl:param name="body.font.family">Helvetica</xsl:param>
	<xsl:param name="title.font.family">$body.font.family</xsl:param>
	
	<!-- Font sizes -->
	<xsl:param name="body.font.master">10</xsl:param>
	<xsl:param name="body.font.small">8</xsl:param>
	<xsl:param name="footnote.font.size">8</xsl:param>
<!--	
	<xsl:attribute-set name="verbatim.properties">
		<xsl:attribute name="font-size">
			<xsl:value-of select="$body.font.master * 0.9"/>
			<xsl:text>pt</xsl:text>
		</xsl:attribute>
	</xsl:attribute-set>
-->
	<!-- Monospaced fonts are smaller than regular text -->
	<!--
	<xsl:attribute-set name="monospace.properties">
		<xsl:attribute name="font-family">
			<xsl:value-of select="$monospace.font.family"/>
		</xsl:attribute>
		<xsl:attribute name="font-size">
			<xsl:value-of select="$body.font.small * 0.9"/>
			<xsl:text>pt</xsl:text>
		</xsl:attribute>
	</xsl:attribute-set>
	-->
	
	<!-- Text appearance -->
	<xsl:param name="line-height">1.5em</xsl:param>
	<xsl:param name="alignment">left</xsl:param>

	<xsl:param name="title.color">#4a5d75</xsl:param>
	<xsl:param name="chaptertitle.color" select="$title.color" />
	<xsl:param name="section.level1.title.color" select="$title.color" />
	
	<xsl:attribute-set name="section.title.level1.properties">
		<xsl:attribute name="font-size">
			<xsl:value-of select="$body.font.master * 1.6"/>
			<xsl:text>pt</xsl:text>
		</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="section.title.level2.properties">
		<xsl:attribute name="font-size">
			<xsl:value-of select="$body.font.master * 1.4"/>
			<xsl:text>pt</xsl:text>
		</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="section.title.level3.properties">
		<xsl:attribute name="font-size">
			<xsl:value-of select="$body.font.master * 1.2"/>
			<xsl:text>pt</xsl:text>
		</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="section.title.level4.properties">
		<xsl:attribute name="font-size">
			<xsl:value-of select="$body.font.master * 1.0"/>
			<xsl:text>pt</xsl:text>
		</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
	</xsl:attribute-set>
	
	<!-- /////////////////////////////////////////////
	// Tables                                       //
	///////////////////////////////////////////// -->
	
	<!-- Only hairlines as frame and cell borders in tables -->
	<xsl:param name="table.frame.border.thickness">0.1pt</xsl:param>
	<xsl:param name="table.cell.border.thickness">0.1pt</xsl:param>
	
	<xsl:template name="table.cell.block.properties">
		<xsl:attribute name="font-size">
			<xsl:value-of select="$body.font.master * 1.0"/>
			<xsl:text>pt</xsl:text>
		</xsl:attribute>
	</xsl:template>
	
	<!-- /////////////////////////////////////////////
	// Labels & Numbering                           //
	///////////////////////////////////////////// -->
	
	<xsl:param name="chapter.autolabel">1</xsl:param>
	<xsl:param name="section.autolabel">1</xsl:param>
	
	<xsl:param name="section.label.includes.component.label">1</xsl:param>
	<xsl:param name="section.autolabel.max.depth">3</xsl:param>

	<!-- /////////////////////////////////////////////
	// Admonitions                                  //
	///////////////////////////////////////////// -->
	
	<!-- You can add a distinctive admonition graphic before 
	the label by setting the admon.graphics parameter to non-zero -->
	
	<xsl:param name="admon.graphics">1</xsl:param>
	<xsl:param name="admon.textlabel">0</xsl:param>
	<xsl:param name="admon.graphics.extension">.svg</xsl:param>
	<!--
	<xsl:param name="admon.graphics.path">assets/images/admons/</xsl:param>
	-->

	<!-- /////////////////////////////////////////////
	// Callouts                                     //
	///////////////////////////////////////////// -->
	
	<!-- Replace the callout icons with plain text numbers -->
	<xsl:param name="callout.graphics">1</xsl:param>
	<xsl:param name="callout.graphics.path">assets/images/callouts/</xsl:param>
	
	<!-- /////////////////////////////////////////////
	// Highlighting                                 //
	///////////////////////////////////////////// -->
	
	<xsl:param name="highlight.source">1</xsl:param>
	<xsl:param name="highlight.default.language">php</xsl:param>

	<xsl:attribute-set name="verbatim.properties">
		<xsl:attribute name="space-before.minimum">1em</xsl:attribute>
		<xsl:attribute name="space-before.optimum">1em</xsl:attribute>
		<xsl:attribute name="space-before.maximum">1em</xsl:attribute>
		<xsl:attribute name="border-color">#444444</xsl:attribute>
		<xsl:attribute name="border-style">solid</xsl:attribute>
		<xsl:attribute name="border-width">0.1pt</xsl:attribute>
		<xsl:attribute name="padding-top">0.5em</xsl:attribute>
		<xsl:attribute name="padding-left">0.5em</xsl:attribute>
		<xsl:attribute name="padding-right">0.5em</xsl:attribute>
		<xsl:attribute name="padding-bottom">0.5em</xsl:attribute>
		<xsl:attribute name="margin-left">0.5em</xsl:attribute>
		<xsl:attribute name="margin-right">0.5em</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="monospace.verbatim.properties" use-attribute-sets="verbatim.properties monospace.properties">
		<xsl:attribute name="font-family">
			<xsl:value-of select="$monospace.font.family"/>
		</xsl:attribute>
		<xsl:attribute name="font-size">
			<xsl:value-of select="$body.font.small * 0.9"/>
			<xsl:text>pt</xsl:text>
		</xsl:attribute>

		<xsl:attribute name="border-color">#cccccc</xsl:attribute>
		<xsl:attribute name="border-style">solid</xsl:attribute>
		<xsl:attribute name="border-width">3pt</xsl:attribute>
		
		<xsl:attribute name="line-height">1.1em</xsl:attribute>
		
		<!-- Wrap lines at verbatim blocks -->
		<xsl:attribute name="wrap-option">wrap</xsl:attribute>
		<xsl:attribute name="hyphenation-character">&#x25BA;</xsl:attribute>
	</xsl:attribute-set>
	
	<!-- Shade (background) programlistings -->
	<xsl:param name="shade.verbatim">0</xsl:param>
	
	<xsl:attribute-set name="shade.verbatim.style">
		<!--
		<xsl:attribute name="background-color">#EFEFEF</xsl:attribute> -->
		<xsl:attribute name="border-width">0.5pt</xsl:attribute>
		<xsl:attribute name="border-style">solid</xsl:attribute>
		<xsl:attribute name="border-color">#333333</xsl:attribute>
		<xsl:attribute name="padding">1em</xsl:attribute>
	</xsl:attribute-set>

	<!-- /////////////////////////////////////////////
	// VARIOUS                                      //
	///////////////////////////////////////////// -->
	
	<xsl:param name="funcsynopsis.style">ansi</xsl:param>
	<xsl:param name="id.warnings">0</xsl:param>

	<!-- Format Variable Lists as Blocks (prevents horizontal overflow) -->
	<xsl:param name="variablelist.as.blocks">1</xsl:param>
	
	<!-- The horrible list spacing problems -->
	<xsl:attribute-set name="list.block.spacing">
		<xsl:attribute name="space-before.optimum">0.8em</xsl:attribute>
		<xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
		<xsl:attribute name="space-before.maximum">0.8em</xsl:attribute>
		<xsl:attribute name="space-after.optimum">0.1em</xsl:attribute>
		<xsl:attribute name="space-after.minimum">0.1em</xsl:attribute>
		<xsl:attribute name="space-after.maximum">0.1em</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="list.item.spacing">
		<xsl:attribute name="space-before.optimum">1em</xsl:attribute>
		<xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
		<xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
	</xsl:attribute-set>

</xsl:stylesheet>