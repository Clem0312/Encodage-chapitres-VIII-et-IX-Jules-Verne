<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <!-- Output = HTML -->
    <xsl:output method="html" indent="yes"/>
    
    <!-- Les variables des fichiers de sortie-->
    <xsl:variable name="home ">
        <xsl:value-of select="concat('Le_Tour_du_monde_en_quatre-vingts-jours_home', '.html')"/>
    </xsl:variable>
    
    <xsl:variable name="chapitre8">
        <xsl:value-of select="concat('Le_Tour_du_monde_en_quatre-vingts_jours_chapitre_8', '.html')"/>
    </xsl:variable>
    
    <xsl:variable name="chapitre9">
        <xsl:value-of select="concat('Le_Tour_du_monde_en_quatre-vingts_jours_chapitre_9', '.html')"/>
    </xsl:variable>
    
    <xsl:variable name="personnages">
        <xsl:value-of select="concat('Le_Tour_du_monde_en_quatre-vingts_jours_liste_personnages', '.html')"/>
    </xsl:variable>
    
    <xsl:variable name="lieux">
        <xsl:value-of select="concat('Le_Tour_du_monde_en_quatre-vingts_jours_liste_lieux', '.html')"/>
    </xsl:variable>
    
    <!-- Les variables avec les chemins de retour -->
    <xsl:variable name="return_home">
        <a href="{concat('./', $home)}">Accueil</a>
    </xsl:variable>
    
    <xsl:variable name="return_personnages">
        <a href="{concat('./', $personnages)}">Liste des personnages</a>
    </xsl:variable>
    
    <xsl:variable name="return_lieux">
        <a href="{concat('./', $lieux)}">Liste des lieux</a>
    </xsl:variable>
    
    <xsl:variable name="return_chapitre8">
        <a href="{concat('./', $chapitre8)}">Chapitre 8</a>
    </xsl:variable>
    
    <xsl:variable name="return_chapitre9">
        <a href="{concat('./', $chapitre9)}">Chapitre 9</a>
    </xsl:variable>
    
    <!-- VARIABLE AVEC LE <HEAD> -->
    <xsl:variable name="header">
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <title><xsl:value-of select="//TEI/teiHeader/fileDesc/titleStmt/title"/></title>
            <meta name="description">
                <xsl:attribute name="content">
                    <xsl:value-of select="//titleStmt/title"/><xsl:text> par </xsl:text><xsl:value-of select="//titleStmt/author"/>
                </xsl:attribute>
            </meta>
            <meta name="author">
                <xsl:attribute name="content">
                    <xsl:value-of select="//TEI/teiHeader/fileDesc/titleStmt/respStmt/persName"/>
                </xsl:attribute>
            </meta>
            <link rel="icon" type="image/x-icon" href="favicon.ico"/>
            <link rel="stylesheet" type="text/css" href="style.css"/>
        </head>
    </xsl:variable>
    
    <!-- VARIABLE AVEC LE <FOOTER> -->
    <xsl:variable name="footer">
        <footer>
            <p><xsl:value-of select="//TEI/teiHeader/fileDesc/titleStmt/respStmt/resp"/></p>
        </footer>
    </xsl:variable>
    
    
    <!-- Variable de la barre de navigation -->
    <xsl:variable name="body_header">
        <header>
            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/Verne_Tour_du_Monde.jpg/500px-Verne_Tour_du_Monde.jpg" alt="Le Tour du monde en quatre-vingts jours, édition Hetzel" class="img"/>
            <nav>
                <xsl:copy-of select="$return_home"/>
                <xsl:copy-of select="$return_chapitre8 "/>
                <xsl:copy-of select="$return_chapitre9"/>
                <xsl:copy-of select="$return_personnages"/>
                <xsl:copy-of select="$return_lieux"/>
            </nav>
        </header>
    </xsl:variable>
    
    <!-- Variable du titre de la page -->
    <xsl:variable name="body_titre">
        <div class="haut">
            <h1><xsl:value-of select="//TEI/teiHeader/fileDesc/titleStmt/title"/></h1>
            <h2 class="author"><xsl:value-of select="//TEI/teiHeader/fileDesc/titleStmt/author"/></h2>
        </div>
        
    </xsl:variable>
    
    <!-- Le template qui appelle les templates -->
    <xsl:template match="/">
        <xsl:call-template name="home"/>
        <xsl:call-template name="chapitre8"/>
        <xsl:call-template name="chapitre9"/>
        <xsl:call-template name="personnages"/>
        <xsl:call-template name="lieux"/>
    </xsl:template>
    
    
    <!-- Le template de la page d'accueil -->
    <xsl:template name="home">
        <xsl:result-document href="{$home}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                
                <body>
                    <xsl:copy-of select="$body_header"/>
                    <main>
                        <xsl:copy-of select="$body_titre"/>
                        <h3><xsl:text>Édition numérique </xsl:text></h3>
                        <p>Cet encodage a été réalisé à partir de la numérisation du journal 
                            Le Temps disponible sur Gallica. Il se focalise sur les chapitres VIII 
                            et IX du roman-feuilleton Le tour du monde en quatre-vingts jours écrit 
                            par Jules Verne en 1872. Le texte a été retrancrit fidèlement, 
                            à l'exception des paragraphes qui ont été modifiés dans un souci de clarté.</p>
                        
                    </main>
                    
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- Les templates des chapitres -->
    <!-- CHAPITRE 8 -->
    <xsl:template name="chapitre8">
        <xsl:result-document href="{$chapitre8}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                
                <body>
                    <xsl:copy-of select="$body_header"/>
                    <main>
                        <xsl:copy-of select="$body_titre"/>
                        <h3>
                            
                            <xsl:value-of select="upper-case(//div[@n ='8']/head)"/>
                            
                        </h3>
                        
                        
                        <div class="chapitre8">
                            <xsl:for-each select=".//div[@n = '8']/p">   
                                <p>
                                    <xsl:value-of select="."/>
                                </p>
                            </xsl:for-each>
                        </div>
                    </main>
                    
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- CHAPITRE 9 -->
    <xsl:template name="chapitre9">
        <xsl:result-document href="{$chapitre9}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                
                <body>
                    <xsl:copy-of select="$body_header"/>
                    <main>
                        <xsl:copy-of select="$body_titre"/>
                        <h3>
                            <p><xsl:value-of select="upper-case(//div[@n ='9']/head)"/></p>
                        </h3>
                        
                        <div class="chapitre9"> <xsl:for-each select=".//div[@n = '9']/p"> 
                            <p>
                                <xsl:value-of select="."/>
                            </p>
                        </xsl:for-each></div>
                        
                    </main>
                    
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- Un template pour la liste des personnages -->
    <xsl:template name="personnages">
        <xsl:result-document href="{$personnages}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                
                <body>
                    <xsl:copy-of select="$body_header"/>
                    
                    <main>
                        <xsl:copy-of select="$body_titre"/>
                        <h3>Liste des personnages</h3>
                        <div class="index">
                            <xsl:for-each select="//listPerson/person">
                                <p>
                                    <xsl:value-of select="./persName"/>
                                    <xsl:if test="./note">
                                    <xsl:value-of select=".//note"/>
                                    </xsl:if>
                                </p>
                            </xsl:for-each>
                        </div>
                    </main>
                    <xsl:copy-of select="$footer"/>  
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- Le template pour la liste des lieux -->
    <xsl:template name="lieux">
        <xsl:result-document href="{$lieux}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                
                <body>
                    <xsl:copy-of select="$body_header"/>
                    <main>
                        <xsl:copy-of select="$body_titre"/>
                        <h3> Liste des lieux fréquentés par les personnages </h3>
                        <div class="index">      
                            <xsl:for-each select="//listPlace/place">
                                <p>
                                    <xsl:value-of select="./placeName/name"/>
                                    <xsl:value-of select=".//note"/>
                                    
                                </p>
                            </xsl:for-each>
                        </div>
                    </main>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
        
    </xsl:template>
    
</xsl:stylesheet>