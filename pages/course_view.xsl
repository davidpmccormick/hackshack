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
				<li><a href="{$root}/{$root-page}/{recipe/entry/course/item/@handle}">All</a></li>
				<xsl:apply-templates select="difficulties/entry" />
			</ul>
		</div>
	</div>
	<div class="row maincontent">
		<xsl:apply-templates select="recipe/entry" />
	</div>
</xsl:template>

<xsl:template match="difficulties/entry">
	<li>
		<a href="{$root}/{$root-page}/{/data/recipe/entry/course/item/@handle}/{title/@handle}">
			<xsl:if test="title/@handle = /data/recipe/entry/difficulty/item/@handle">
				<xsl:attribute name="class">
					<xsl:text>active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:value-of select="title" />
		</a>
	</li>
</xsl:template>

<xsl:template match="recipe/entry">

	<div class="visible-phone">

		<ul class="nav nav-tabs">
		  <li class="active"><a href="#ingredients" data-toggle="tab"><h2>Ingredients</h2></a></li>
		  <li><a href="#method" data-toggle="tab"><h2>Method</h2></a></li>
		</ul>
		<div class="tab-content">
		  <div class="tab-pane active" id="ingredients">
				<div class="span3">
					<h2 class="visible-phone"><xsl:value-of select="title" /></h2>
					<ul class="liststylenone ingredientslist" style="margin-bottom:20px;">
						<xsl:apply-templates select="ingredients/item" />
					</ul>
				</div>
		  </div>
		  <div class="tab-pane" id="method">
				<div class="span3">
					<xsl:if test="method != ''">
						<h2>Method</h2>
						<xsl:copy-of select="method/node()" />
					</xsl:if>
				</div>
		  </div>
		</div>

	</div>

	<div class="hidden-phone">
		<div class="span3">
			<h2 class="visible-phone"><xsl:value-of select="title" /></h2>
			<h2>Ingredients</h2>
			<ul class="liststylenone ingredientslist" style="margin-bottom:20px;">
				<xsl:apply-templates select="ingredients/item" />
			</ul>
		</div>


		<div class="span6">
			<h2 class="hidden-phone"><xsl:value-of select="title" /></h2>
			<xsl:if test="main-images/item !=''">
				<div class="cyclewrapper clearfix">
					<div class="cyclethis">
						<xsl:apply-templates select="main-images/item" />
					</div>
				</div>
			</xsl:if>
			<xsl:if test="method != ''">
				<h2>Method</h2>
				<xsl:copy-of select="method/node()" />
			</xsl:if>
			<xsl:if test="/data/events/login-info/@logged-in = 'true'">
				<a class="editbutton" href="{$root}/symphony/publish/recipes/edit/{/data/recipe/entry/@id}">edit</a>
			</xsl:if>
		</div>
	</div>

	<xsl:if test="cost != '' or serves != '' or prep-time != '' or cook-time != '' or goes-with != '' or tags != ''">
		<div class="span3">
			<div class="rightcol clearfix">
				<xsl:if test="cost != ''">
					<h3>Price</h3>
					<p>&#163;<xsl:value-of select="cost" /></p>
				</xsl:if>
				<xsl:if test="serves != ''">
					<h3>Serves</h3>
					<xsl:value-of select="serves" />
					<xsl:choose>
						<xsl:when test="serves = '1'">
							<xsl:text> person</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text> people</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="prep-time != ''">
				<h3>Preparation time</h3>
				<xsl:choose>
					<xsl:when test="prep-time &gt;= 60">
						<p><xsl:value-of select="(floor(prep-time div 60))" />h:<xsl:value-of select="(prep-time mod 60)" /></p>
					</xsl:when>
					<xsl:otherwise>
						<p><xsl:value-of select="prep-time" />  minutes</p>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
			<xsl:if test="cook-time != ''">
				<h3>Cooking time</h3>
				<xsl:choose>
					<xsl:when test="cook-time &gt;= 60">
						<p><xsl:value-of select="(floor(cook-time div 60))" />h:<xsl:value-of select="format-number((cook-time mod 60), '00')" /></p>
					</xsl:when>
					<xsl:otherwise>
						<p><xsl:value-of select="cook-time" />  minutes</p>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
			<xsl:if test="goes-with != ''">
				<h3>Goes with</h3>
				<ul class="horizontal liststylenone clearfix">
					<xsl:apply-templates select="goes-with/item" />
				</ul>
			</xsl:if>
			<xsl:if test="tags != ''">
				<h3>Tags</h3>
				<ul class="horizontal liststylenone clearfix">
					<xsl:apply-templates select="tags" />
				</ul>
			</xsl:if>
		</div><!-- end .rightcol -->
	</div>
</xsl:if>

</xsl:template>

<xsl:template match="courses/entry">
	<li>
		<a href="{$root}/{$root-page}/{title/@handle}">
			<xsl:if test="/data/recipe/entry/course/item/@handle = title/@handle">
				<xsl:attribute name="class">
					<xsl:text>active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:value-of select="title" />
		</a>
	</li>
</xsl:template>

<xsl:template match="recipe/entry/ingredients/item">
	<li><xsl:value-of select="quantity" /><xsl:text> </xsl:text><xsl:value-of select="ingredient" /></li>
</xsl:template>

<xsl:template match="recipe/entry/main-images/item">
	<div style="width:100%;">
		<div class="mainimagebox">
			<img src="{$root}/image/main/{image/@path}/{image/filename}" width="100%" height="auto" />
		</div>
	</div>
</xsl:template>

<xsl:template match="goes-with/item">
	<li><a href="{$root}/course/view/{title/@handle}"><xsl:value-of select="title" /></a></li>
</xsl:template>

<xsl:template match="recipe/entry/tags/item">
	<li class="taglink"><a href="{$root}/{$root-page}/tag/{./@handle}/{../../course/item/@handle}"><xsl:value-of select="." /></a></li>
</xsl:template>

</xsl:stylesheet>