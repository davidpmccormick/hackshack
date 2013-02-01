<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/page-title.xsl"/>
<xsl:import href="../utilities/navigation.xsl"/>
<xsl:import href="../utilities/date-time.xsl"/>

<xsl:output method="html" omit-xml-declaration="yes" indent="no" />

<xsl:variable name="is-logged-in" select="/data/events/login-info/@logged-in"/>
<xsl:variable name="url-keywords" select="''" />
<xsl:variable name="url-sort" select="''" />
<xsl:variable name="url-order" select="''" />
<xsl:template match="/">
	<xsl:text disable-output-escaping="yes">&lt;</xsl:text>!DOCTYPE html<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
	<html lang="en">
		<head>
			<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
			
			<meta charset="utf-8" />
			<meta name="title" content="{$page-title}" />
			<meta name="description" content="" />
			<meta name="tags" content="" />
			<title><xsl:call-template name="page-title"/></title>
			
			<link rel="apple-touch-icon-precomposed" href="{$workspace}/assets/images/iphone-icon.png" />
			
			<link rel="shortcut icon" href="/favicon.ico" />
			<link rel="icon" type="images/png" href="{$workspace}/assets/images/favicon.png" />
			<link rel="stylesheet" media="screen" href="{$workspace}/css/bootstrap.min.css" />
			<link rel="stylesheet" media="screen" href="{$workspace}/css/bootstrap-responsive.min.css" />
			<link rel="stylesheet" media="screen" href="{$workspace}/css/hsa.css" />

			<script type="text/javascript" src="//use.typekit.net/ltj3bef.js"></script>
			<script type="text/javascript">try{Typekit.load();}catch(e){}</script>

			<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
			<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js"></script>
			<script src="{$workspace}/js/bootstrap.min.js"></script>
			<script src="{$workspace}/js/jquery.isotope.min.js"></script>
			<script src="{$workspace}/js/onmediaquery.min.js"></script>
			<script src="{$workspace}/js/mqchange.js"></script>
			<script src="{$workspace}/js/cyclelite.js"></script>
			<script src="{$workspace}/js/jquery.animate-shadow.min.js"></script>
			<script src="{$workspace}/js/hsa.js"></script>
			<xsl:if test="$current-page-id = 1">
				<script src="{$workspace}/js/jquery.arctext.js"></script>
			</xsl:if>
			
			
			<xsl:comment><![CDATA[[if lt IE 9]><script type="text/javascript" src="]]><xsl:value-of select="$root"/><![CDATA[/workspace/js/html5shiv.min.js"></script><![endif]]]></xsl:comment>
			<xsl:comment><![CDATA[[if (gte IE 6)&(lte IE 8)]><script type="text/javascript" src="]]><xsl:value-of select="$root"/><![CDATA[/workspace/js/selectivizr.min.js"></script><![endif]]]></xsl:comment>
		</head>
		
		<body id="{$current-page}-page">
			<div class="container">
				<header class="header">
					<div class="awning" />
					<a href="{$root}">
						<h1>
							<xsl:attribute name="class">
								<xsl:text>logo</xsl:text>
								<xsl:if test="$current-page-id != 1">
									<xsl:text> hidden-phone</xsl:text>
								</xsl:if>
							</xsl:attribute>
							hackshack
						</h1>
					</a>
					<a href="{$root}">
						<h1>
							<xsl:attribute name="class">
								<xsl:text>mobilelogo hidden-desktop hidden-tablet</xsl:text>
							</xsl:attribute>
							<xsl:if test="$current-page-id = 1">
								<xsl:attribute name="style">
									<xsl:text>display:none!important;</xsl:text>
								</xsl:attribute>
							</xsl:if>
							hackshack
						</h1>
					</a>
					<xsl:if test="$current-page-id != 1 and $current-page-id != 7 and $current-page-id != 15 and //tags != ''">
						<a class="tagtab" href="#">tags</a>
					</xsl:if>
				</header>

				<div id="content" class="clearfix">
					<xsl:apply-templates/>
				</div>
				
				<xsl:if test="/data/events/login-info/@logged-in='true'">
					<a href="{$root}/add"><div class="addbutton">add</div></a>
				</xsl:if>
				
				<a href="{$root}/search"><div class="searchbutton">search</div></a>
				
				<xsl:if test="$current-page-id != 1">
					<footer>
						<xsl:attribute name="class">
							<xsl:text>footer clearfix</xsl:text>
							<xsl:if test="/data/events/login-info/@logged-in='true'">
								<xsl:text> loggedin</xsl:text>
							</xsl:if>
						</xsl:attribute>
						<small>&#169;hackshack <xsl:value-of select="$this-year" /></small>
					</footer>
				</xsl:if>
			</div> <!-- end .container -->
		</body>
	</html>
</xsl:template>

<xsl:strip-space elements="*"/>

</xsl:stylesheet>