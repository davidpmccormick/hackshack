<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/xml-json.xsl" />

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="data">
	<xsl:call-template name="xml-to-json">
		<xsl:with-param name="xml">
			<xsl:apply-templates select="json-recipes/entry" />
		</xsl:with-param>
	</xsl:call-template>
</xsl:template>

<xsl:template match="json-recipes/entry">
	<node>
		<id><xsl:value-of select="@id" /></id>
		<title><xsl:value-of select="title" /></title>
		<urltitle><xsl:value-of select="title/@handle" /></urltitle>
		<course><xsl:value-of select="course" /></course>
		<method><xsl:value-of select="method" /></method>
		<serves><xsl:value-of select="serves" /></serves>
		<prep-time><xsl:value-of select="prep-time" /></prep-time>
		<cook-time><xsl:value-of select="cook-time" /></cook-time>
		<total-time><xsl:value-of select="number(cook-time)+number(prep-time)" /></total-time>
		<thumbnail-image><xsl:text>image/2/300/200/5/assets/images/</xsl:text><xsl:value-of select="thumbnail-image" /></thumbnail-image>
		<main-images>
			<xsl:apply-templates select="main-images" />
		</main-images>
		<ingredients>
			<xsl:apply-templates select="ingredients/item" />
		</ingredients>
	</node>
</xsl:template>

<xsl:template match="main-images/item">
	<xsl:if test="position() = 1">
		<!-- fake item to force an array -->
		<!-- ignore it using {{#if real}} -->
		<items>
			<image>test</image>
			<real>false</real>
		</items>
	</xsl:if>
	<items>
		<image><xsl:text>image/main/assets/images/</xsl:text><xsl:value-of select="image/filename" /></image>
		<real>true</real>
	</items>
</xsl:template>

<xsl:template match="ingredients/item">
	<items>
		<quantity><xsl:value-of select="quantity" /></quantity>
		<ingredient><xsl:value-of select="ingredient" /></ingredient>
	</items>
</xsl:template>


</xsl:stylesheet>