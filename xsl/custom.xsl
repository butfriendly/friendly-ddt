<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!--// Import base stylesheet // -->
	<xsl:import href="../lib/docbook-xsl/xhtml/chunk.xsl"/>

	<!--// Customization vars //-->
	<xsl:param name="draft.mode">no</xsl:param>
	<xsl:param name="funcsynopsis.style">ansi</xsl:param>
	<xsl:param name="html.stylesheet">../api-manual.css</xsl:param>
	<xsl:param name="id.warnings">0</xsl:param>

	<xsl:param name="generate.toc">
	appendix  toc,title
	article/appendix  nop
	article   toc,title
	book      toc,title,figure,equation
	chapter   toc,title
	part      toc,title
	preface   toc,title
	qandadiv  toc
	qandaset  toc
	reference toc,title
	sect1     toc
	sect2     toc
	sect3     toc
	section   toc
	set       toc,title
	</xsl:param>

	<xsl:param name="l10n.gentext.default.language">en</xsl:param>
	<xsl:param name="generate.meta.abstract">1</xsl:param>

	<xsl:param name="section.autolabel">1</xsl:param>
	<xsl:param name="section.label.includes.component.label">1</xsl:param>

	<xsl:param name="chunk.section.depth">2</xsl:param>
	<xsl:param name="chunk.first.sections">1</xsl:param>

	<xsl:param name="generate.id.attributes">1</xsl:param>
	<xsl:param name="css.decoration">0</xsl:param>
	<xsl:param name="table.borders.with.css">0</xsl:param>

</xsl:stylesheet>