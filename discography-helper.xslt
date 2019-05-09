<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template name="MusicCollection" match="/music">
        <xsl:element name="musicCollection">
            <xsl:call-template name="Raport" />
            <xsl:apply-templates select="catalog"/>
        </xsl:element>
    </xsl:template>
    <xsl:template name="Raport">
        <xsl:element name="information">
            <xsl:element name="data">
                <xsl:element name="numberOfAlbums">
                    <xsl:value-of select="count(catalog/cd)"/>
                </xsl:element>
                <xsl:element name="numberOfRapSongs">
                    <xsl:variable name="varRapCount" select="count(catalog/cd/genreInfo[@type = 'RAP'])" />
                    <xsl:value-of select="$varRapCount" />
                </xsl:element>
                <xsl:element name="numberOfPopSongs">
                    <xsl:variable name="varPopCount" select="count(catalog/cd/genreInfo[@type = 'POP'])" />
                    <xsl:value-of select="$varPopCount" />
                </xsl:element>
                <xsl:element name="numberOfHiphopSongs">
                    <xsl:variable name="varHiphopCount" select="count(catalog/cd/genreInfo[@type = 'HIPHOP'])" />
                    <xsl:value-of select="$varHiphopCount" />
                </xsl:element>
                <xsl:element name="numberOfTrapSongs">
                    <xsl:variable name="varTrapCount" select="count(catalog/cd/genreInfo[@type = 'TRAP'])" />
                    <xsl:value-of select="$varTrapCount" />
                </xsl:element>
                <xsl:element name="numberOfSwingSongs">
                    <xsl:variable name="varSwingCount" select="count(catalog/cd/genreInfo[@type = 'SWING'])" />
                    <xsl:value-of select="$varSwingCount" />
                </xsl:element>
                <xsl:element name="numberOfJazzSongs">
                    <xsl:variable name="varJazzCount" select="count(catalog/cd/genreInfo[@type = 'JAZZ'])" />
                    <xsl:value-of select="$varJazzCount" />
                </xsl:element>
                <xsl:element name="numberOfFunkSongs">
                    <xsl:variable name="varFunkCount" select="count(catalog/cd/genreInfo[@type = 'FUNK'])" />
                    <xsl:value-of select="$varFunkCount" />
                </xsl:element>
                <xsl:element name="highestPrice">
                    <xsl:variable name="varHighestPrice" select="max(catalog/cd/price)" />
                    <xsl:value-of select="concat($varHighestPrice, ' ', catalog/cd[price=$varHighestPrice]/price/@currency)" />
                </xsl:element>
                <xsl:element name="lowestPrice">
                    <xsl:variable name="varLowestPrice" select="min(catalog/cd/price)" />
                    <xsl:value-of select="concat($varLowestPrice, ' ', catalog/cd[price=$varLowestPrice]/price/@currency)" />
                </xsl:element>
                <xsl:element name="reportDate">
                    <xsl:value-of select="format-dateTime(current-dateTime(), '[D01].[M01].[Y0001] [H01]:[m01]')" />
                </xsl:element>
            </xsl:element>
            <xsl:element name="authorsOfDocument">
                <xsl:for-each select="info/authors/person">
                    <xsl:element name="person">
                        <xsl:value-of select="concat(name, ' ', surname)"/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template name="Catalog" match="catalog">
        <xsl:apply-templates select="cd">
            <xsl:sort select="title" />
        </xsl:apply-templates>
    </xsl:template>
    <xsl:template name="CDs" match="cd">
        <xsl:element name="cd">
            <xsl:apply-templates select="title"/>
            <xsl:apply-templates select="artistInfo/@artistId" />
            <xsl:apply-templates select="released"/>
            <xsl:apply-templates select="genreInfo/@type"/>
            <xsl:apply-templates select="price"/>
            <xsl:apply-templates select="songs"/>
        </xsl:element>
    </xsl:template>
    <xsl:template name="Title" match="title">
        <xsl:element name="title">
            <xsl:value-of select="." />
        </xsl:element>
    </xsl:template>
    <xsl:template name="artistInfo" match="artistInfo/@artistId">
        <xsl:element name="artistInfo">
            <xsl:variable name="artistId" select="." />
            <xsl:value-of select="/music/artists/artist[@artistId = $artistId]/name" />
        </xsl:element>
    </xsl:template>
    <xsl:template name="released" match="released">
        <xsl:element name="released">
            <xsl:value-of select="." />
        </xsl:element>
    </xsl:template>
    <xsl:template name="genreInfo" match="genreInfo/@type">
        <xsl:element name="genreInfo">
            <xsl:variable name="type" select="." />
            <xsl:value-of select="/music/genres/genre[@type = $type]/@genreName" />
        </xsl:element>
    </xsl:template>
    <xsl:template name="price" match="price">
        <xsl:element name="price">
            <xsl:value-of select="concat(. , ' ', ./@currency)" />
        </xsl:element>
    </xsl:template>
    <xsl:template name="songs" match="songs">
        <xsl:element name="songs">
            <xsl:value-of select="count(song)"/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
