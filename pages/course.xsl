<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href='../utilities/html5.xsl'/>
<xsl:import href='../utilities/pagination.xsl'/>

<xsl:template match="data">
	<div class="row">
		<div class="span4 clearfix">
			<ul class="horizontal liststylenone caps">
				<xsl:apply-templates select="courses/entry" />
			</ul>
		</div>
		<div class="span4 offset4 clearfix relative">
			<div class="sorttab">
				<a href="{$root}{$current-path}?sort=date-added&amp;order=desc">
				<xsl:attribute name="class">
					<xsl:if test="$url-sort = 'date-added'">
						<xsl:text>selected </xsl:text>
					</xsl:if>
					<xsl:text>datesort</xsl:text>
				</xsl:attribute>
				<xsl:text>date</xsl:text>
				</a>
				<a>
					<xsl:choose>
						<xsl:when test="($url-order = 'asc' or $url-order = '') and ($url-sort = 'title' or $url-sort = '')">
							<xsl:attribute name="href">?order=desc&amp;sort=title</xsl:attribute>
						</xsl:when>
						<xsl:when test="($url-order = 'asc') and ($url-sort = 'date-added')">
							<xsl:attribute name="href">?order=desc&amp;sort=date-added</xsl:attribute>
						</xsl:when>
						<xsl:when test="($url-order = 'desc') and ($url-sort = 'title')">
							<xsl:attribute name="href">?order=asc&amp;sort=title</xsl:attribute>
						</xsl:when>
						<xsl:when test="($url-order = 'desc') and ($url-sort = 'date-added')">
							<xsl:attribute name="href">?order=asc&amp;sort=date-added</xsl:attribute>
						</xsl:when>
						<xsl:when test="($url-order = 'asc')">
							<xsl:attribute name="href">?order=desc</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="href">?order=asc</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:attribute name="class">
						<xsl:if test="$url-order = 'asc' or ($url-order = '' and $url-sort = 'title') or ($url-order = '' and $url-sort = '')">
							<xsl:text>selected </xsl:text>
						</xsl:if>
						<xsl:text>ascdesc</xsl:text>
					</xsl:attribute>
					<xsl:text>&#8226;</xsl:text>
				</a>
				<a class="titlesort selected" href="{$root}{$current-path}?sort=title">
					<xsl:attribute name="class">
						<xsl:if test="$url-sort = '' or $url-sort = 'title'">
							<xsl:text>selected </xsl:text>
						</xsl:if>
						<xsl:text>titlesort</xsl:text>
					</xsl:attribute>
					<xsl:text>title</xsl:text>
				</a>
			</div>
			<xsl:choose>
				<xsl:when test="$course != ''">
					<ul class="horizontal liststylenone caps right">
						<li>
							<xsl:if test="$difficulty = ''">
								<xsl:attribute name="class">
									<xsl:text>active</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<a href="{$root}/{$root-page}/{$course}">
								All
							</a>
						</li>
						<xsl:apply-templates select="difficulties/entry" />
					</ul>
				</xsl:when>
				<xsl:otherwise>
					<ul class="horizontal liststylenone caps">
						<li>PICK A COURSE</li>
					</ul>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</div> <!-- end .row -->
	
	<div class="row maincontent">
		<div class="isotopecontainer" style="padding-top:20px;">
			<xsl:apply-templates select="recipes/entry" />
		</div>
		
		<div class="span12 clearfix" style="clear:both;margin-top:20px">
			<xsl:call-template name="pagination">
				<xsl:with-param name="pagination" select="/data/recipes/pagination" />
				
				<xsl:with-param name="pagination-url">
					<xsl:value-of select="$root" /><xsl:text>/course/</xsl:text><xsl:value-of select="$course" />
					<xsl:if test="$difficulty != ''">
						<xsl:text>/</xsl:text><xsl:value-of select="$difficulty" />
					</xsl:if>
					<xsl:text>?p=$</xsl:text>
					<xsl:if test="$url-sort != ''">
						<xsl:text>&amp;sort=</xsl:text><xsl:value-of select="$url-sort" />
					</xsl:if>
					<xsl:if test="$url-order != ''">
						<xsl:text>&amp;order=</xsl:text><xsl:value-of select="$url-order" />
					</xsl:if>
				</xsl:with-param>
				
				<xsl:with-param name="show-navigation" select="true()" />
				<xsl:with-param name="show-range" select="10" />
			</xsl:call-template>
		</div>
		
		<div class="span12 clearfix tagsection" style="clear:both;margin-top:20px">
			<xsl:if test="$course != '' and alltags/entry/tags != ''">
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
		<a href="{$root}/{$root-page}/{title/@handle}">
			<xsl:if test="$course = title/@handle">
				<xsl:attribute name="class">
					<xsl:text>active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:value-of select="title" />
		</a>
	</li>
</xsl:template>

<xsl:template match="difficulties/entry">
	<li>
		<a href="{$root}/{$current-page}/{$course}/{title/@handle}">
			<xsl:if test="title/@handle = $difficulty">
				<xsl:attribute name="class">
					<xsl:text>active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:value-of select="title" />
		</a>
	</li>
</xsl:template>

<xsl:template match="recipes/entry">
	<div class="span3">
		<a href="{$root}/{$current-page}/view/{title/@handle}">
			<div>
				<xsl:attribute name="class">
					<xsl:text>recipeouter relative</xsl:text>
				</xsl:attribute>
				<div class="thumbimagebox relative">
					<div class="titleblock">
						<h2><xsl:value-of select="title" /></h2>
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

<xsl:template match="alltags/entry/tags/item[not(. = following::item[ancestor::alltags])]">
	<li>
			<xsl:attribute name="class">
				<xsl:text>taglink</xsl:text>
			</xsl:attribute>
		<xsl:attribute name="rel">
			<xsl:value-of select="./@handle" />
		</xsl:attribute>
		<a href="{$root}/{$root-page}/tag/{./@handle}/{$course}"><xsl:value-of select="." /></a>
	</li>
</xsl:template>


</xsl:stylesheet>