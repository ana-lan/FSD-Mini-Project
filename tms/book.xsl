<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- xsl stylesheet for books.xml -->
<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes" />
<xsl:template match="/">
<html>
<head>
<title>Book</title>
</head>
<body>
<h1>Book</h1>
<table border="1">
<tr>
<th>Title</th>
<th>Author</th>
<th>Price</th>
</tr>
<xsl:for-each select="book/book">
<tr>
<td>
<xsl:value-of select="title" />
</td>
<td>
<xsl:value-of select="author" />

</td>
<td>
<xsl:value-of select="price" />
</td>
</tr>
</xsl:for-each>
</table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>