<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href='../utilities/html5.xsl'/>
<xsl:import href='../utilities/pagination.xsl'/>

<xsl:template match="data">
	<div style="margin-top:150px;">
		<div class="row">
			<div class="span12">	
				<form action="{$root}/search/" method="get">
				    <label>Search<input style="margin-top:10px;" type="text" name="keywords" /></label>
				</form>		
			</div>
			<div class="span7">
				<xsl:apply-templates select="searchrecipes/entry" />
			</div>
			<div class="span7">
				<xsl:call-template name="pagination">
					<xsl:with-param name="pagination" select="/data/searchrecipes/pagination" />
					<xsl:with-param name="pagination-url">
						<xsl:text>/search/$/?keywords=</xsl:text><xsl:value-of select="$url-keywords" />
					</xsl:with-param>
					<xsl:with-param name="show-navigation" select="true()" />
					<xsl:with-param name="show-range" select="10" />
				</xsl:call-template>
			</div>
		</div>
	</div>
</xsl:template>

<xsl:template match="searchrecipes/entry">
	<h2><a href="{$root}/course/view/{title/@handle}"><xsl:value-of select="title" /></a></h2>
	<xsl:copy-of select="brief-description/node()" />
</xsl:template>

</xsl:stylesheet>