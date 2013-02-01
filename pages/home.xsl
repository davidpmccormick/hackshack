<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href='../utilities/html5.xsl'/>

<xsl:template match="data">
	<div class="row mainbuttons">
		<div class="span2 offset1">
			<a href="{$root}/course/starter"><h2>STARTER</h2></a>
		</div>
		<div class="span2">
			<a href="{$root}/course/main"><h2>MAIN</h2></a>
		</div>
		<div class="span2">
			<a href="{$root}/course/dessert"><h2>DESSERT</h2></a>
		</div>
		<div class="span2">
			<a href="{$root}/course/side"><h2>SIDE</h2></a>
		</div>
		<div class="span2">
			<a href="{$root}/course/baking"><h2>BAKING</h2></a>
		</div>
	</div>
</xsl:template>

</xsl:stylesheet>