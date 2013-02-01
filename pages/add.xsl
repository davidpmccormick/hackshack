<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/html5.xsl" />

<xsl:template match="data">

<div class="row" style="margin-top:130px;">
	<div class="span7">
		<xsl:choose>
			<xsl:when test="events/login-info/@logged-in = 'true'">
				<form method="post" action="" enctype="multipart/form-data">
				  <input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
				  <label>Title<br />
				    <input name="fields[title]" type="text" />
				  </label>
				  <label>Course<br />
				    <select name="fields[course]">
				      <option value="Main">Main</option>
				      <option value="Starter">Starter</option>
				      <option value="Side">Side</option>
				      <option value="Dessert">Dessert</option>
				      <option value="Baking">Baking</option>
				    </select>
				  </label>
				  <input style="width:100%!important;" name="action[addrecipe]" type="submit" value="Add recipe" />
				</form>
				<a href="{$root}/symphony/logout/">Log out</a>
			</xsl:when>
			<xsl:otherwise>
		   <form action="/symphony/" method="post">
		    <label>Username<br />
		        <input name="username" type="text" />
		    </label>
		    <label>Password<br />
		        <input name="password" type="password" />
		    </label>
		    <input style="width:100%!important;" name="action[login]" type="submit" value="Log in" />
		    <input name="redirect" type="hidden" value="/add" />
			 </form>
			</xsl:otherwise>
		</xsl:choose>
	</div>
</div>

</xsl:template>

</xsl:stylesheet>

