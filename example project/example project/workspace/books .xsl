<?xml version="1.0" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"	version="1.0">
	<xsl:template match="*">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="text()">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="/">
		<html>
			<head>
				<title>Book Page</title>
			</head>
			<body>
				<!--1. All book titles-->
				<h2>All book titles:</h2>
				<xsl:apply-templates select="/catalog/book/title"/>
				
				<!--2. All out of print titles-->
				<h2>Out of Print Titles:</h2>
				<xsl:apply-templates select="/catalog/book/outOfPrint"/>
				
				<!--3. Fantasy book id numbers and Computer books costing more than 40-->
				<h2>Fantasy book id's :</h2>
				<xsl:apply-templates select="/catalog/book/genre[text()='Fantasy']"/>
				
				<!--4. Published after 2001-->
				<h2>Books published after 2001:</h2>
				<xsl:apply-templates select="/catalog/book/publish/publish_date[text()>'2001']"/>
				
				<!--5. Books costing more than 30 -->
				<h2>Books starting with the letter C:</h2>
				<xsl:apply-templates select="/catalog/book/price[text()>'30']"/>
			</body>
		</html>
	</xsl:template>
	
	<!--1. All book titles-->
	<xsl:template match="title">
		<xsl:value-of select="."/>
	</xsl:template>
	<!--2. All out of print titles-->
	<xsl:template match="outOfPrint">
		<xsl:value-of select="../title"/>
	</xsl:template>
	
	<!--3. Fantasy book id numbers-->
	<xsl:template match="genre">
		<xsl:value-of select="../@id"/>
	</xsl:template>
	
	<!--4. Published after 2001-->
	<xsl:template match="publish_date">
		<xsl:value-of select="../../title"/>
	</xsl:template>
		
	<!--5. Books costing more than 30-->
	<xsl:template match="price">
		<xsl:value-of select="../title"/>,
		<xsl:value-of select="../price"/>.
	</xsl:template>
	
</xsl:transform>