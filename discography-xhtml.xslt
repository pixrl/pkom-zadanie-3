<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xhtml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" indent="yes"/>
	<xsl:template name="musicCollection" match="/">
		<html
			xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl" lang="pl">
			<head>
				<meta charset="utf-8"/>
				<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
				<link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css" integrity="sha384-nn4HPE8lTHyVtfCBi5yW9d20FjT8BJwUXyWZT9InLYax14RDjBj46LmSztkmNP9w" crossorigin="anonymous"/>
				<title>Music collection</title>
			</head>
			<body>
				<div class="pure-g">
					<div class="pure-u-1-5"></div>
					<div class="pure-u-3-5">
						<h2>Authors</h2>
						<xsl:for-each select="musicCollection/information/authorsOfDocument">
							<p>
								<xsl:value-of select="." />
							</p>
						</xsl:for-each>
						<h2>Albums</h2>
						<table class="pure-table">
							<tr>
								<th>Title</th>
								<th>Released</th>
								<th>Artist</th>
								<th>Genre</th>
								<th>Number of songs</th>
								<th>Price</th>
							</tr>
							<xsl:for-each select="musicCollection/cd">
								<tr>
									<td>
										<xsl:value-of select="title"/>
									</td>
									<td>
										<xsl:value-of select="released"/>
									</td>
									<td>
										<xsl:value-of select="artistInfo"/>
									</td>
									<td>
										<xsl:value-of select="genreInfo"/>
									</td>
									<td>
										<xsl:value-of select="songs"/>
									</td>
									<td>
										<xsl:value-of select="price"/>
									</td>
								</tr>
							</xsl:for-each>
						</table>
						<h4>Data</h4>
						<p>
                            Number of albums: <xsl:value-of select="musicCollection/information/data/numberOfAlbums"/>
						</p>
						<p>
                            Number of rap songs: <xsl:value-of select="musicCollection/information/data/numberOfRapSongs"/>
						</p>
						<p>
                            Number of pop songs: <xsl:value-of select="musicCollection/information/data/numberOfPopSongs"/>
						</p>
						<p>
                            Number of hiphop songs: <xsl:value-of select="musicCollection/information/data/numberOfHiphopSongs"/>
						</p>
						<p>
                            Number of trap songs: <xsl:value-of select="musicCollection/information/data/numberOfTrapSongs"/>
						</p>
						<p>
                            Number of swing songs: <xsl:value-of select="musicCollection/information/data/numberOfSwingSongs"/>
						</p>
						<p>
                            Number of jazz songs: <xsl:value-of select="musicCollection/information/data/numberOfJazzSongs"/>
						</p>
						<p>
                            Number of funk songs: <xsl:value-of select="musicCollection/information/data/numberOfFunkSongs"/>
						</p>
						<p>
                            Highest price: <xsl:value-of select="musicCollection/information/data/highestPrice"/>
						</p>
						<p>
                            Lowest price: <xsl:value-of select="musicCollection/information/data/lowestPrice"/>
						</p>
						<p>
                            Date: <xsl:value-of select="musicCollection/information/data/reportDate"/>
						</p>
					</div>
					<div class="pure-u-1-5"></div>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
