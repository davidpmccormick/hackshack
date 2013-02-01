<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href='../utilities/html5.xsl'/>

<xsl:template match="data">
	<div class="row">
		<div class="span4 clearfix">
			<ul class="horizontal liststylenone caps">
				<xsl:apply-templates select="courses/entry" />
			</ul>
		</div>
		
		<div class="span4 offset4 clearfix">
			<ul class="horizontal liststylenone caps right">
				<li>
					<xsl:if test="$difficulty = ''">
						<xsl:attribute name="class">
							<xsl:text>active</xsl:text>
						</xsl:attribute>
					</xsl:if>
					<a href="{$root}/{$root-page}/tag/{$tag}/{$course}">
						All
					</a>
				</li>
				<xsl:apply-templates select="difficulties/entry" />
			</ul>
		</div>
		
		<div class="span3">
			<xsl:choose>
				<xsl:when test="$course != ''">
					<ul class="horizontal liststylenone caps">
						<li>
							<a style="font-weight:900;" class="caps" href="{$root}/{$root-page}/{$course}">Back to all <xsl:value-of select="$course" /></a>
						</li>
					</ul>
				</xsl:when>
				<xsl:otherwise>
					<a style="font-weight:900;" class="caps" href="{$root}/{$root-page}">Back</a>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</div>
	<div class="row maincontent">
		<div class="isotopecontainer" style="padding-top:20px;padding-bottom:20px;">
			<xsl:apply-templates select="tagrecipes/entry" />
		</div>
		
		<div class="span12 tagsection" style="clear:both;margin-top:20px">
			<xsl:if test="tagrecipes/entry/tags/item[not(. = following::item[ancestor::tagrecipes]) and not(./@handle= $tag)] != ''">
				<h2>Also tagged with &#8216;<span style="text-transform:lowercase;"><xsl:value-of select="alltags/entry/tags/item[@handle = $tag]" /></span>&#8217;</h2>
			</xsl:if>
			<ul class="horizontal liststylenone clearfix" style="margin-bottom:20px;">
				<xsl:apply-templates select="tagrecipes/entry/tags/item[not(. = following::item[ancestor::tagrecipes]) and not(./@handle= $tag)]">
					<xsl:sort select="." order="ascending" />
				</xsl:apply-templates>
			</ul>
		</div>
		<div class="span12 clearfix" style="clear:both;margin-top:20px">
			<xsl:if test="$course != '' and alltags/entry/tags !=''">
				<h2>All tags for <xsl:value-of select="$course" /></h2>
			</xsl:if>
			<ul class="horizontal liststylenone clearfix" style="margin-bottom:20px;">
				<xsl:apply-templates select="alltags/entry/tags/item[not(. = following::item[ancestor::alltags])]">
					<xsl:sort select="." order="ascending" />
				</xsl:apply-templates>
			</ul>
		</div>

	</div>
</xsl:template>

<xsl:template match="courses/entry">
	<li>
		<a href="{$root}/{$root-page}/tag/{$tag}/{title/@handle}">
			<xsl:if test="$course = title/@handle">
				<xsl:attribute name="class">
					<xsl:text>active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:value-of select="title" />
		</a>
	</li>
</xsl:template>


<xsl:template match="tagrecipes/entry">
	<div class="span3">
		<a href="{$root}/{$root-page}/view/{title/@handle}">
			<div>
				<xsl:attribute name="class">
					<xsl:text>recipeouter relative</xsl:text>
				</xsl:attribute>
				<xsl:if test="serves != ''">
					<div class="servestab">
						<p>Serves <xsl:value-of select="serves" /></p>
					</div>
				</xsl:if>
				<xsl:if test="cost != ''">
					<div class="pricetab">
						<p>&#163;<xsl:value-of select="cost" /></p>
					</div>
				</xsl:if>
				<xsl:if test="cook-time != '' and prep-time != ''">
					<div class="timetab">
						<p>
							<xsl:value-of select="format-number((floor((prep-time + cook-time) div 60)), '00')" />
							<xsl:text>:</xsl:text>
							<xsl:value-of select="format-number(((prep-time + cook-time) mod 60), '00')" />
						</p>
					</div>
				</xsl:if>
				<div>
					<xsl:attribute name="class">
						<xsl:for-each select="tags/item">
							<xsl:value-of select="./@handle" />
							<xsl:text> </xsl:text>
						</xsl:for-each>
						<xsl:text>thumbimagebox relative</xsl:text>
					</xsl:attribute>
					<div class="titleblock" style="">
						<h2><xsl:value-of select="title" /></h2>
					</div>
					<div class="highlightbox alternatecolor">
						<div class="padded">
							<xsl:copy-of select="brief-description/node()" />
						</div>
					</div>
					<xsl:choose>
						<xsl:when test="thumbnail-image != ''">
							<img src="{$root}/image/2/300/200/5/assets/images/{thumbnail-image}" width="100%" height="auto" />
						</xsl:when>
						<xsl:otherwise>
								<xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
								<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
								<xsl:variable name="courseimage" select="translate(course,  $uppercase, $smallcase)" />
							<img src="{$root}/image/2/300/200/5/assets/images/{$courseimage}.png" width="100%" height="auto" />
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</div>
		</a>
	</div>
</xsl:template>

<xsl:template match="tagrecipes/entry/tags/item[not(. = following::item[ancestor::tagrecipes])]">
	<li>
			<xsl:attribute name="class">
				<xsl:text>taglink</xsl:text>
				<xsl:if test="./@handle = $tag">
						<xsl:text> active</xsl:text>
				</xsl:if>
			</xsl:attribute>
		<xsl:attribute name="rel">
			<xsl:value-of select="./@handle" />
		</xsl:attribute>
		<a href="{$root}/{$root-page}/tag/{./@handle}/{$course}"><xsl:value-of select="." /></a>
	</li>
</xsl:template>

<xsl:template match="alltags/entry/tags/item[not(. = following::item[ancestor::alltags])]">
	<li>
			<xsl:attribute name="class">
				<xsl:text>taglink</xsl:text>
				<xsl:if test="./@handle = $tag">
						<xsl:text> active</xsl:text>
				</xsl:if>
			</xsl:attribute>
		<xsl:attribute name="rel">
			<xsl:value-of select="./@handle" />
		</xsl:attribute>
		<a href="{$root}/{$root-page}/tag/{./@handle}/{$course}"><xsl:value-of select="." /></a>
	</li>
</xsl:template>


<xsl:template match="difficulties/entry">
	<li>
		<a href="{$root}/{$root-page}/tag/{$tag}/{$course}/{title/@handle}">
			<xsl:if test="title/@handle = $difficulty">
				<xsl:attribute name="class">
					<xsl:text>active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:value-of select="title" />
		</a>
	</li>
</xsl:template>

</xsl:stylesheet>