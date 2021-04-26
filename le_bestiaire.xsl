<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/> <!-- supprime les espaces non voulus-->
    
    <!-- 
        Création des variables utiles 
        notamment pour les chemins vers les templates et le titre
    -->
    <xsl:variable name="path-transcriptions">
        <xsl:text>transcriptions.html</xsl:text>
    </xsl:variable>
    <xsl:variable name="path-notice">
        <xsl:text>notice.html</xsl:text>
    </xsl:variable>
    <xsl:variable name="path-index">
        <xsl:text>index.html</xsl:text>
    </xsl:variable>
    <xsl:variable name="titre">
        <!-- Création du titre en récupérant les données nécessaires -->
        <xsl:value-of select="//title[@type='main']"/>
        <xsl:text> de </xsl:text><xsl:value-of select="//msItem[3]//persName"/>
    </xsl:variable>
    <xsl:variable name="path-index-personnages">
        <xsl:text>index-personnages.html</xsl:text>
    </xsl:variable>
    <xsl:variable name="path-index-event">
        <xsl:text>index-event.html</xsl:text>
    </xsl:variable>
    <xsl:variable name="path-a-propos">
        <xsl:text>apropos.html</xsl:text>
    </xsl:variable>
    <xsl:variable name="path-accueil">
        <xsl:text>accueil.html</xsl:text>
    </xsl:variable>
    
    <!-- TEMPLATES HTML -->
    <xsl:template match="/">
        <!-- ACCUEIL -->
        <xsl:result-document href="{$path-accueil}" method="html" indent="yes">
            <html>
                <style>
                    h5{
                    margin-bottom: 0.5rem;
                    font-weight: 500;
                    line-height: 1.2;
                    color: #5e7bb1;
                    font-weight: 700;
                    font-size: x-large;
                    }
                </style>
                <xsl:copy-of select="$head"/>
                <xsl:call-template name="barreNavigation"/>
                <xsl:call-template name="accueil"/>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
        
        <!--  NOTICE -->
        <xsl:result-document href="{$path-notice}" method="html" indent="yes">
            <html>
                <style>
                    h5{
                    margin-bottom: 0.5rem;
                    font-weight: 500;
                    line-height: 1.2;
                    color: #5e7bb1;
                    font-weight: 700;
                    font-size: x-large;
                    }
                </style>
                <xsl:copy-of select="$head"/>
                <xsl:call-template name="barreNavigation"/>
                <xsl:call-template name="notice"/>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
        
        <!-- TRANSCRIPTIONS (originale et normalisée) -->
        <xsl:result-document href="{$path-transcriptions}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <xsl:call-template name="barreNavigation"/>
                <xsl:call-template name="transcriptions"/>
                <br/>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
        
        <!-- INDEX DES ANIMAUX -->
        <xsl:result-document href="{$path-index}" method="html" indent="yes">
            <html>
                <style>
                    h5{
                    margin-bottom: 0.5rem;
                    font-weight: 500;
                    line-height: 1.2;
                    color: #5e7bb1;
                    font-weight: 700;
                    font-size: x-large;
                    }
                    .btn-margin{
                    margin: 10px;
                    }
                </style>
                <xsl:copy-of select="$head"/>
                <xsl:call-template name="barreNavigation"/>
                
                <div class="container">
                    <button class="btn btn-light btn-margin" >
                        <a href="{$path-index}" style="color: #BDA164;">Animaux</a>
                    </button>
                    <button class="btn btn-light btn-margin">
                        <a href="{$path-index-personnages}" style="color: #DBCFB6">Personnages</a>
                    </button>
                    <button class="btn btn-light btn-margin">
                        <a href="{$path-index-event}" style="color: #DBCFB6">Mythes</a>
                    </button>
                      
                    <div class="tab-content" id="myTabContent">
                        <xsl:call-template name="index"/>
                    </div>
                </div>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>  
        
        <!-- INDEX PERSONNAGES -->
        <xsl:result-document href="{$path-index-personnages}" method="html" indent="yes">
            <html>
                <style>
                    h5{
                    margin-bottom: 0.5rem;
                    font-weight: 500;
                    line-height: 1.2;
                    color: #5e7bb1;
                    font-weight: 700;
                    font-size: x-large;
                    }
                </style>
                <xsl:copy-of select="$head"/>
                <xsl:call-template name="barreNavigation"/>
                
                <div class="container">
                    <button class="btn btn-light" style="margin: 10px;">
                        <a href="{$path-index}" style="color:#DBCFB6;">Animaux</a>
                    </button>
                    <button class="btn btn-light" style="margin: 10px;">
                        <a href="{$path-index-personnages}" style="color: #BDA164;">Personnages</a>
                    </button>
                    <button class="btn btn-light" style="margin: 10px;">
                        <a href="{$path-index-event}" style="color: #DBCFB6;">Mythes</a>
                    </button>
                    
                    <div class="tab-content" id="myTabContent">
                        <xsl:call-template name="index-personnages"/>
                    </div>
                </div>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document> 
        
        <!-- INDEX MYTHES -->
        <xsl:result-document href="{$path-index-event}" method="html" indent="yes">
            <html>
                <style>
                    h5{
                    margin-bottom: 0.5rem;
                    font-weight: 500;
                    line-height: 1.2;
                    color: #5e7bb1;
                    font-weight: 700;
                    font-size: x-large;
                    }
                </style>
                <xsl:copy-of select="$head"/>
                <xsl:call-template name="barreNavigation"/>
                
                <div class="container">
                    <button class="btn btn-light" style="margin: 10px;">
                        <a href="{$path-index}" style="color: #DBCFB6;">Animaux</a>
                    </button>
                    <button class="btn btn-light" style="margin: 10px;">
                        <a href="{$path-index-personnages}" style="color: #DBCFB6;">Personnages</a>
                    </button>
                    <button class="btn btn-light" style="margin: 10px;">
                        <a href="{$path-index-event}" style="color: #BDA164;">Mythes</a>
                    </button>
                    
                    <div class="tab-content" id="myTabContent">
                        <xsl:call-template name="index-event"/>
                    </div>
                </div>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document> 
        
        <!-- À PROPOS -->
        <xsl:result-document href="{$path-a-propos}" method="html" indent="yes">
            <html>
                <style>
                    h5{
                    margin-bottom: 0.5rem;
                    font-weight: 500;
                    line-height: 1.2;
                    color: #5e7bb1;
                    font-weight: 700;
                    font-size: x-large;
                    }
                </style>
                <xsl:copy-of select="$head"/>
                <xsl:call-template name="barreNavigation"/>
                <xsl:call-template name="a-propos"/>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- HEAD contenant notamment les métadonnées -->
    <xsl:variable name="head">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <meta name="author" content="Axelle Lecroq"/>
            <meta name="description" content="Édition numérique de la {$titre}"/>
            <meta name="keywords" content="XSLT,XML,TEI"/>
            <link rel="stylesheet"
                href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                crossorigin="anonymous"/>
            <title>
                <xsl:value-of select="$titre"/>
            </title>
        </head>
    </xsl:variable>
    
    <!-- BARRE DE NAVIGATION -->
    <xsl:template name="barreNavigation">
        <style>
            .navlinks{
            color: #BDA164 ;
            margin-right: 20px;
            font-size:17px;
            font-family: PTSerif;
            }
           .titre-site{
           margin: 0px 25px 0px 15px;
           color: #5e7bb1;
           font-size: 20px;
           font-family: PTSerif;
           }
           .nav-style{
           background-color: #F2E5C9;
           margin-bottom: 50px;
           }
        </style>
        <nav class="navbar navbar-expand-lg nav-style" role="navigation">
            <img src="../img/icon.jpg" style="width: 40px;
                margin-left: 20px;"/>
            <div>
                <a href="{$path-accueil}" class="navbar-brand titre-site"> le bestiaire d'amour</a>
            </div>
            <div class="container-fluid">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="navlinks navbar-brand" href="{$path-notice}">Notice</a>
                    </li>
                    <li class="nav-item">
                        <a class="navlinks navbar-brand" href="{$path-transcriptions}">Transcriptions</a>
                    </li>
                    <li class="nav-item">
                        <a class="navlinks navbar-brand" href="{$path-index}">Textométrie</a>
                    </li>
                </ul>
                <span><a href="{$path-a-propos}"><img src="../img/info-circle.svg" alt="Guidelines" style="color: #5e7bb1"/></a></span>
            </div>
        </nav>
    </xsl:template>
    
    <!-- FOOTER -->
    <xsl:variable name="footer">
        <footer>
            <hr class="style-one" />
            <div class="container">
                <div class="text-center justify-content-center">
                    <p>
                        <a class="navbar-brand" style="font-size:12; color:darkgrey; font-family:monospace" href="https://github.com/axellelecroq/"><xsl:value-of select="//respStmt/persName"/> · 2021</a>
                     </p>
                    <div>
                    <a href="http://www.chartes.psl.eu/"><img src="../img/ENC.png" width="100"/></a>
                    </div>
                </div>
            </div>
            <br/>
        </footer>
    </xsl:variable>
    
    <!-- Mise en page d'une notice, présentant une partie des
    données du teiHeader-->
    <xsl:template match="teiHeader" name="notice">
        <!-- 
            Les informations sur le manuscrit 
            avec les données récupérées du teiHeader
        -->
        <style>
            .about{
            font-variant: small-caps;
            font-weight: 400;
            }
            .about-item{
            padding-left:10px;
            padding-right:10px
            }
        </style>
        <div style="margin-left: 100px;
            margin-right: 200px;">
            <h5 class="about">Le manuscrit</h5>
        <table>
            <tr>
                <td class="about-item">Contient</td>
                <td><xsl:for-each select="//msItem">
                    <xsl:number count="msItem" level="any" format=" 1° "/>
                    <xsl:value-of select="rubric/text()"/>
                    <xsl:if test="position() != last()"> ; </xsl:if>
                </xsl:for-each></td>
            </tr>
            <tr>
                <td class="about-item">Date d'origine</td>
                <td>
                    <xsl:value-of select="//history"/>
                </td>
            </tr>
            <tr>
                <td class="about-item">Format</td>
                <td>
                    <xsl:value-of select="//physDesc//support"/>
                    <xsl:text> - </xsl:text>
                    <xsl:value-of select="//decoDesc"/>
                </td>
            </tr>
            <tr>
                <td class="about-item">Identifiant</td>
                <td>
                    <xsl:value-of select="//msDesc//idno"/>
                </td>
            </tr>
            <tr>
                <td class="about-item">Source</td>
                <td>
                    <xsl:value-of select="//msDesc//repository"/>
                </td>
            </tr>
            <tr>
                <td class="about-item">Provenance</td>
                <td>
                    <xsl:value-of select="//msDesc//settlement"/>
                </td>
            </tr>
            <tr>
                <td class="about-item">Droits</td>
                <td>
                   <a target="_blank">
                       <xsl:attribute name="href">
                           <xsl:value-of select="//publicationStmt/idno"/>
                       </xsl:attribute>
                       <xsl:text>Consultable sur internet</xsl:text>
                   </a>
                </td>
            </tr>
        </table>
            <br/>
            <!-- 
            Les informations sur l'auteur 
            avec les données récupérées du teiHeader
            -->
            <h5 class="about">L'auteur : <xsl:value-of select="//msItem[3]//persName"/></h5>
            <table>
                <tr>
                    <td class="about-item">Naissance</td>
                    <td>
                        <xsl:value-of select="//msItem[3]//date[1]"/>
                    </td>
                </tr>
                <tr>
                    <td class="about-item">
                    Décès</td>
                    <td>
                        <xsl:value-of select="//msItem[3]//date[2]"/>
                    </td>
                </tr>
                <tr>
                    <td class="about-item">Status</td>
                    <td>
                        <xsl:value-of select="//msItem[3]//note"/>
                    </td>
                </tr>
            </table>
            <br/> 
        </div>
        <br/>
    </xsl:template>


    <!-- Mise en page d'un à propos, présentant les données
    du teiHeader au sujet de l'édition numérique-->
    <xsl:template match="teiHeader" name="a-propos">
            <!--  Les informations sur l'édition numérique -->
        <div style="margin: 50px 350px 0px 350px" align="justify">
            <p><xsl:text>L'</xsl:text>
                <xsl:value-of select="//respStmt/resp"/>
                <xsl:text>. L'édition numérique a été réalisée
                dans le cadre du cours d'XSLT, cours dans la continuité du
                celui de XML. </xsl:text>
                </p>
                <p><xsl:text>Ces travaux ont été produits par </xsl:text>
                    <a style="color: #BDA164;" href="https://github.com/axellelecroq" target="_blank"><xsl:value-of select="//respStmt/persName"/></a>
                <xsl:text> au cours de l'année 2021.</xsl:text></p>
                <p>Si vous souhaitez connaître les guidelines utilisées lors de l'encodage en XML-tei de cette édition, veuillez 
                    cliquer sur ce <a style="color: #BDA164;" href="../documentation/le-bestiaire_odd.html">lien</a>.</p>
            <br/> 
        </div>
        <br/>
    </xsl:template>
    
    <!-- Création de la page d'accueil -->
    <xsl:template match="teiHeader" name="accueil">
        <style>
            .image-style{
            height: 100;
            margin-right: 10;
            }
        </style>
        <div align="center">
            <img class="image-style" src="../img/lion.jpg"/>
            <img class="image-style" src="../img/castor.jpg"/>
            <img class="image-style" src="../img/icon.jpg"/>
            <img class="image-style" src="../img/hirondelle.jpg"/>
            <img class="image-style" src="../img/vache.jpg"/>
            <img class="image-style" src="../img/paon.jpg"/>
        </div>
        <div style="margin: 50px 350px 0px 350px" align="justify">
            <h4>Édition numérique du <i>Bestiaire d'amour</i></h4>
            <p>Ce site édite numériquement un extrait du <i>Bestiaire d'amour</i> de
                <xsl:value-of select="//msItem[3]//persName"/> tiré du manuscrit 
                <i><xsl:value-of select="//title[@type='main']"/></i> (<xsl:value-of select="//repository"/>).
                Une transcription originale et normalisée sont proposées et la mise en page permet
            de pouvoir les comparer. </p>
            
            <p>L'onglet notice apporte de plus amples informations concernant le manuscrit
            et son auteur.</p>
            <p>Une analyse textométrique est proposée également et indexe les différents animaux notifiés ainsi que les mythes et personnages
            dont le texte fait référence.</p>
            <p>Afin d'en savoir plus sur l'encodage et cette édition d'une manière générale, n'hésitez pas à cliquer sur le <a href="{$path-a-propos}"><img src="../img/info-circle.svg"/></a>.</p>
        </div>
        <br/>
    </xsl:template>

    <!-- Création de la page des transcriptions
    avec une proposition de transcription originale
    et une transcription normalisée -->
    <xsl:template match="//body/div" name="transcriptions">
        <!-- 
            On divise la présentation en deux colonnes qui contient
            chacune une transcription : la transcription facsimilaire 
            qui comprendra la transcription originale et la transcription
            normalisée.
        -->
        <html>
            <style>
                .trans-titre {
                color:#5e7bb1;
                font-size: inherit;
                font-variant: small-caps;
                font-weight: 400;
                margin-bottom: 0px;
                text-align:center
                }
            </style>
            <table style="margin-left: auto;
                margin-right: auto;">
                <tr>
                    <td class="column">
                        <div type="orig" style="padding-right: 100px">
                            <h2 class="trans-titre">Transcription facsimilaire</h2>
                            <xsl:apply-templates select ="//body" mode="orig"/>
                        </div>
                    </td>
                    <td class="column">
                        <div type="reg">
                            <h2 class="trans-titre">Transcription normalisée</h2>
                            <xsl:apply-templates select ="//body" mode="reg"/>
                        </div>
                    </td>
                </tr>
            </table>  
        </html>
    </xsl:template>
    
    <xsl:template match="choice" mode="orig">
        <xsl:value-of select=".//orig/text() | .//abbr/text()"/>
    </xsl:template>
    
    <xsl:template match="choice" mode="reg">
        <xsl:value-of select=".//reg/text() | .//expan"/>
    </xsl:template>
    
    <!--Le standoff ne s'affichera pas à la suite du teiHeader-->
    <xsl:template match="standOff"/>
    
    
    <!-- Numérotation des lignes par la balise <lb> peut importe sa position.
    Dans l'encodage XML, celle -ci se trouve directement dans l'élément <p> mais
    aussi dans d'autres sous-éléments comme <rs> ou encore <persName>. Cette règle
    prend en compte tous les emplacements dans laquelle la balise <lb> se trouve.-->
    <xsl:template match="//p/lb | //p/persName/lb | //rs/lb | //rs/persName/lb" mode="#all">
        <xsl:variable name="line-number">
            <xsl:value-of select="@n"/>
        </xsl:variable>
        <br/>
        <!-- Seules les lignes finissants par 0 ou 5 sont
        numérotées afin d'avoir une numération de 5 en 5.-->
        <xsl:choose>
            <xsl:when test="ends-with($line-number, '0')">
                <small style="margin-left: 3px; margin-right:10px">
                    <xsl:value-of select="$line-number"/>
                </small>
            </xsl:when>
            <xsl:when test="ends-with($line-number, '5')">
                <small style="margin-left: 3px; margin-right:10px">
                    <xsl:value-of select="$line-number"/>
                </small>
            </xsl:when>
            <xsl:otherwise>
                <span style="margin-right:25px">
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <!--     TEXTOMÉTRIE
        Divisée en 3 parties : Animaux ; Personnages ; Mythes
    Le premier index (animaux) est commenté. Les étapes sont 
    sensiblement les mêmes, bien que plus simples, pour les deux index suivants.
    Les étapes sont numértotées afin d'aider le lecteur à se retrouver, le vocabulaire
    pour chacune d'entre elles est à adapter en fonction de l'index dans lequel
    on se trouve. -->
    <!-- ANIMAUX -->
    <xsl:template name="index">
        <style>
            .liste-titre{
            font-variant: small-caps;
            font-weight: 400;
            }
        </style>
        <div style="margin-left: 100px;">
            <h5 class="h5 liste-titre">Liste des animaux</h5>
        <div style="margin-left:50px">
        <xsl:for-each select="//orth[@xml:lang='fr']">
            <!-- 1# Stockage de l'ixml:id dans une variable
            afin de pouvoir référencer les occurences-->
            <xsl:variable name="idNym">
                <xsl:value-of select="parent::nym/@xml:id"/>
            </xsl:variable>
            <p>
                <!-- 2# On récupère la valeur actuelle qui est
                l'orthographe en français des noms d'animaux.-->
                <b><xsl:value-of select="."/></b>
                <!-- Si l'animal possède une orthographe ancien-français de 
                son nom alors celle-ci est récupérée.
                Pour information, tous les animaux possèdent une orthographe
                en ancien-français sauf les petits des animaux
                tels les hirondeaux ou les lionceaux qui sont tous deux appelés
                faons dans le texte. -->
                <xsl:if test="parent::nym/orth[2]">
                    <i><xsl:value-of select="concat(' · ', parent::nym/orth[@xml:lang='fro'])"/></i>
                </xsl:if>
                </p>
            <div style="margin: 0px 450px 15px 50px">
            <p >
                <!-- 3# On récupère la définition -->
                <xsl:value-of select="parent::nym/def"/>
            </p>
                <p>
                <xsl:if test="parent::nym/p">
                    <xsl:value-of select="parent::nym/p"/>
                </xsl:if>
                </p>
                <p>
                    <xsl:text>Occurences : </xsl:text>
                 <!-- 4# On référence les occurences:
                 dans ce sens, on utilise la variable de l'id
                 et on récupère le numéro de ligne qui sera envoyé
                 au le fichier de sortie.-->
                <xsl:for-each select="ancestor::TEI//rs[@nymRef=concat('#', $idNym)]">
                    <xsl:value-of select="preceding-sibling::lb[1]/@n"/>
                    <!-- S'il ne s'agit pas de la dernière occurence,
                    alors un point-virgule est juxtaposé pour plus de lisibilité. -->
                    <xsl:if test="position() != last()"> ; </xsl:if>
                </xsl:for-each>
            </p>
            </div>
        </xsl:for-each>
        </div>
        </div>
    </xsl:template>
    
    <!-- PERSONNAGES -->
    <xsl:template name="index-personnages">
        <style>
            .liste-titre{
            font-variant: small-caps;
            font-weight: 400;
            }
            .identation{
            margin-left:50px;
            margin-right:450px
            }
        </style>
        <div style="margin-left: 100px;">
            <h5 class="h5 liste-titre">Liste des personnages</h5>
            <div style="margin-left:50px">
                <xsl:for-each select="//listPerson/person">
                    <!-- 1# -->
                    <xsl:variable name="idPerson">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:variable>
                    <p>
                        <!-- 2# -->
                        <b><xsl:value-of select="persName"/></b>
                    </p>
                    <p class="identation">
                        <!-- 3# -->
                        <xsl:value-of select="note"/>
                        <p class="identation">
                            <!-- 4 # -->
                            <xsl:text>Occurences : </xsl:text>
                            <xsl:for-each select="ancestor::TEI//body//p/persName[@ref=concat('#', $idPerson)] | ancestor::TEI//body//p/rs/persName[@ref=concat('#', $idPerson)] ">
                                <xsl:value-of select="preceding-sibling::lb[1]/@n"/>
                                <xsl:if test="position() != last()"> ; </xsl:if>
                            </xsl:for-each>
                        </p>
                    </p>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>
    
    <!-- MYTHES -->
    <xsl:template name="index-event">
        <style>
            .identation{
            margin-left:50px;
            margin-right:450px
            }
            .liste-titre{
            font-variant: small-caps;
            font-weight: 400;
            }
        </style>
        <div style="margin-left: 100px;">
            <h5 class="h5 liste-titre">Liste des mythes</h5>
            <div style="margin-left:50px">
                <!-- 1# -->
                <xsl:variable name="idEvent">
                    <xsl:value-of select="//listEvent/event/@xml:id"/>
                </xsl:variable>
                <p>
                    <!-- 2# -->
                    <b><xsl:value-of select="//listEvent/event/@source"/></b>
                </p>
                <p class="identation">
                    <!-- 3# -->
                    <xsl:value-of select="//listEvent//desc"/>
                    <p class="identation">
                        <!-- 4# -->
                        <xsl:text>Occurence : </xsl:text>
                        <xsl:for-each select="//body//rs[@ref=concat('#', $idEvent)]">
                            <xsl:value-of select="preceding-sibling::lb[1]/@n"/>
                            <xsl:text> - </xsl:text>
                            <xsl:value-of select="following-sibling::lb[1]/@n"/>
                        </xsl:for-each>
                    </p>
                </p>
            </div>
        </div>
    </xsl:template>
    
</xsl:stylesheet>