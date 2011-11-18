<!--
	The simplest method would be to create a stylesheet parameter named
	something like 'stylesheet.dir' and put the path into it manually.  If you
	have a static setup, that could work. As a parameter, it could also be reset
	on the command line at run time.  Then you just use that parameter value in
	the paths to your image files.

	But I suspect you wanted something that would automatically handle the
	location of the stylesheet. XSLT doesn't have a function that returns the
	path of the stylesheet file, but there are Saxon and Xalan extension
	functions that do.  This bit of code uses those extension functions to get
	the full path of the stylesheet file, then uses the docbook utility template
	named 'getdir' to lop off the filename, leaving the directory path.
	
	The use of document('') opens the current xsl file, and the xsl:for-each
	temporarily switches the current context to that file. Then it tests for the
	existance of each function before trying to use it.  You'll need to put the
	namespace declarations in the root element of the stylesheet file as well.
	If you aren't using Saxon or Xalan, then this won't work for you.
	
	Bob Stayton
	Sagehill Enterprises
-->
<xsl:param name="stylesheet.dir">
  <xsl:call-template name="getdir">
    <xsl:with-param name="filename">
      <xsl:for-each select="document('')">
        <xsl:choose>
          <xsl:when test="function-available('saxon:systemId')">
            <xsl:value-of select="saxon:systemId()"/>
          </xsl:when>
          <xsl:when test="function-available('NodeInfo:systemId')">
            <xsl:value-of select="NodeInfo:systemId()"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:message terminate="yes">
              <xsl:text>WARNING: cannot compute stylesheet path</xsl:text>
            </xsl:message>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </xsl:with-param>
  </xsl:call-template>
</xsl:param>