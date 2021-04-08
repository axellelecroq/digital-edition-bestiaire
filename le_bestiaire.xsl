<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/> <!-- supprime les espaces non voulus-->
    

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
    
    <xsl:template match="/">
        
        <xsl:result-document href="{$path-notice}" method="html" indent="yes">
            <html>
                <style>
                    h4{
                    margin-bottom: 0.5rem;
                    font-weight: 500;
                    line-height: 1.2;
                    color: #5e7bb1;
                    font-weight: 700;
                    font-size: x-large;
                    }
                </style>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" />
                <link rel="stylesheet" href="https://cedricvb.be/wp-content/pages/xslt/catalog.css" />
                
                <xsl:call-template name="barreNavigation"/>
                <xsl:call-template name="notice"/>
            </html>
        </xsl:result-document>
        
        <xsl:result-document href="{$path-transcriptions}" method="html" indent="yes">
            <html>
                <style>
                    .transcription {
                    font-family: Georgia, serif;
                    }
                </style>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" />
                <link rel="stylesheet" href="https://cedricvb.be/wp-content/pages/xslt/catalog.css" />
                
                <xsl:call-template name="barreNavigation"/>
                <xsl:call-template name="transcriptions"/>
                <br/>
            </html>
        </xsl:result-document>
        
        <xsl:result-document href="{$path-index}" method="html" indent="yes">
            <html>
                <style>
                    h4{
                    margin-bottom: 0.5rem;
                    font-weight: 500;
                    line-height: 1.2;
                    color: #5e7bb1;
                    font-weight: 700;
                    font-size: x-large;
                    }
                </style>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" />
                <link rel="stylesheet" href="https://cedricvb.be/wp-content/pages/xslt/catalog.css" />
                
                <xsl:call-template name="barreNavigation"/>
                
                <div class="container">
                    <button type="button" class="btn btn-light" style="margin: 10px;">
                        <a href="{$path-index}" style="color: black;">Animaux</a>
                    </button>
                    <button type="button" class="btn btn-light" style="margin: 10px;">
                        <a href="{$path-index-personnages}" style="color: black;">Personnages</a>
                    </button>
                    <button type="button" class="btn btn-light" style="margin: 10px;">
                        <a href="{$path-index-event}" style="color: black;">Mythes</a>
                    </button>
                      
                    <div class="tab-content" id="myTabContent">
                        <xsl:call-template name="index"/>
                    </div>
                </div>
            </html>
        </xsl:result-document>  
        
        <xsl:result-document href="{$path-index-personnages}" method="html" indent="yes">
            <html>
                <style>
                    h4{
                    margin-bottom: 0.5rem;
                    font-weight: 500;
                    line-height: 1.2;
                    color: #5e7bb1;
                    font-weight: 700;
                    font-size: x-large;
                    }
                </style>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" />
                <link rel="stylesheet" href="https://cedricvb.be/wp-content/pages/xslt/catalog.css" />
                
                <xsl:call-template name="barreNavigation"/>
                
                <div class="container">
                    <button type="button" class="btn btn-light" style="margin: 10px;">
                        <a href="{$path-index}" style="color: black;">Animaux</a>
                    </button>
                    <button type="button" class="btn btn-light" style="margin: 10px;">
                        <a href="{$path-index-personnages}" style="color: black;">Personnages</a>
                    </button>
                    <button type="button" class="btn btn-light" style="margin: 10px;">
                        <a href="{$path-index-event}" style="color: black;">Mythes</a>
                    </button>
                    
                    <div class="tab-content" id="myTabContent">
                        <xsl:call-template name="index-personnages"/>
                    </div>
                </div>
            </html>
        </xsl:result-document> 
        
        <xsl:result-document href="{$path-index-event}" method="html" indent="yes">
            <html>
                <style>
                    h4{
                    margin-bottom: 0.5rem;
                    font-weight: 500;
                    line-height: 1.2;
                    color: #5e7bb1;
                    font-weight: 700;
                    font-size: x-large;
                    }
                </style>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" />
                <link rel="stylesheet" href="https://cedricvb.be/wp-content/pages/xslt/catalog.css" />
                
                <xsl:call-template name="barreNavigation"/>
                
                <div class="container">
                    <button type="button" class="btn btn-light" style="margin: 10px;">
                        <a href="{$path-index}" style="color: black;">Animaux</a>
                    </button>
                    <button type="button" class="btn btn-light" style="margin: 10px;">
                        <a href="{$path-index-personnages}" style="color: black;">Personnages</a>
                    </button>
                    <button type="button" class="btn btn-light" style="margin: 10px;">
                        <a href="{$path-index-event}" style="color: black;">Mythes</a>
                    </button>
                    
                    <div class="tab-content" id="myTabContent">
                        <xsl:call-template name="index-event"/>
                    </div>
                </div>
            </html>
        </xsl:result-document> 
        
        <xsl:result-document href="{$path-a-propos}" method="html" indent="yes">
            <html>
                <style>
                    h4{
                    margin-bottom: 0.5rem;
                    font-weight: 500;
                    line-height: 1.2;
                    color: #5e7bb1;
                    font-weight: 700;
                    font-size: x-large;
                    }
                </style>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" />
                <link rel="stylesheet" href="https://cedricvb.be/wp-content/pages/xslt/catalog.css" />
                
                <xsl:call-template name="barreNavigation"/>
                <xsl:call-template name="a-propos"/>
            </html>
        </xsl:result-document>
        
    </xsl:template>
    
    <xsl:template name="barreNavigation">
        <style>
            .navlinks{
            color: #BDA164 ;
            }
        </style>
        <nav class="navbar navbar-dark bg-dark" role="navigation" style="background-color: #F2E5C9">
            <div style="margin: 10px 0px 5px 25px;
                color: #5e7bb1;
                font-family: Georgia, serif;
                font-size: 20px;
                font-variant: small-caps;">
                <xsl:value-of select="$titre"/>
            </div>
            <div class="container-fluid" style="margin-bottom:30px">
                <ul class="navbar-nav mr-auto" style="margin-bottom: 10px;">
                    <li class="navlinks" style="margin-right:25px">
                        <a class="navlinks" href="{$path-notice}">Notice</a>
                    </li>
                    <li class="navlinks" style="margin-right:25px">
                        <a class="navlinks" href="{$path-transcriptions}">Transcriptions</a>
                    </li>
                    <li class="navlinks" style="margin-right:25px">
                        <a class="navlinks" href="{$path-index}">Textométrie</a>
                    </li>
                    <li class="navlinks" style="margin-right:25px">
                        <a class="navlinks" href="{$path-a-propos}">À propos</a>
                    </li>
                </ul>
            </div>
        </nav>
    </xsl:template>
    
    <!-- Mise en page d'une notice, présentant une partie des
    données du teiHeader-->
    <xsl:template match="teiHeader" name="notice">
        <!-- 
            Les informations sur le manuscrit 
            avec les données récupérés du teiHeader
        -->
        <div style="margin-left: 100px;
            margin-right: 200px;">
            
            <h4 style="font-variant-caps: petite-caps;
                font-family: Georgia">À propos du manuscrit</h4>
        <table>
            <tr>
                <td style="padding-left:10px; padding-right:10px">Contient</td>
                <td><xsl:for-each select="//msItem">
                    <xsl:number count="msItem" level="any" format=" 1° "/>
                    <xsl:value-of select="rubric/text()"/>
                    <xsl:if test="position() != last()"> ; </xsl:if>
                </xsl:for-each></td>
            </tr>
            <tr>
                <td style="padding-left:10px; padding-right:10px">Date d'origine</td>
                <td>
                    <xsl:value-of select="//history"/>
                </td>
            </tr>
            <tr>
                <td style="padding-left:10px; padding-right:10px">Format</td>
                <td>
                    <xsl:value-of select="//physDesc//support"/>
                    <xsl:text> - </xsl:text>
                    <xsl:value-of select="//decoDesc"/>
                </td>
            </tr>
            <tr>
                <td style="padding-left:10px; padding-right:10px">Identifiant</td>
                <td>
                    <xsl:value-of select="//msDesc//idno"/>
                </td>
            </tr>
            <tr>
                <td style="padding-left:10px; padding-right:10px">Source</td>
                <td>
                    <xsl:value-of select="//msDesc//repository"/>
                </td>
            </tr>
            <tr>
                <td style="padding-left:10px; padding-right:10px">Provenance</td>
                <td>
                    <xsl:value-of select="//msDesc//settlement"/>
                </td>
            </tr>
            <tr>
                <td style="padding-left:10px; padding-right:10px">Droits</td>
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
            avec les données récupérés du teiHeader
        -->
            <h4 style="font-variant-caps: petite-caps;
                font-family: Georgia">Au sujet de l'auteur : <xsl:value-of select="//msItem[3]//persName"/></h4>
            <table>
                <tr>
                    <td style="padding-left:10px; padding-right:10px">Naissance</td>
                    <td>
                        <xsl:value-of select="//msItem[3]//date[1]"/>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left:10px; padding-right:10px">
                    Décès</td>
                    <td>
                        <xsl:value-of select="//msItem[3]//date[2]"/>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left:10px; padding-right:10px">Status</td>
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
                cours de XML. </xsl:text>
                </p>
                <p><xsl:text>Ces travaux ont été produits par </xsl:text>
                <a href="https://github.com/axellelecroq" target="_blank"><xsl:value-of select="//respStmt/persName"/></a>
                <xsl:text> au cours de l'année 2021.</xsl:text></p>
            <br/> 
        </div>
        <br/>
    </xsl:template>



    <xsl:template match="//body/div" name="transcriptions">
        <!-- 
            On divise la présentation en deux colonnes qui contient
            chacune une transcription : la transcription facsimilaire 
            qui comprendra la transcription originale et la transcription
            normalisée.
        -->
        <table style="margin-left: auto;
            margin-right: auto;">
         <tr>
        <td class="column">
            <div type="orig" style="padding-right: 100px">
                <h2 style="color:#5e7bb1;
                    font-size: inherit;
                    font-variant: small-caps;
                    margin-bottom: 0px;
                    font-family:Georgia">Transcription facsimilaire</h2>
            <xsl:apply-templates select ="//body" mode="orig"/>
            </div>
        </td>
        <td class="column">
            <div type="reg">
                <h2 style="color:#5e7bb1;
                    font-size: inherit;
                    font-variant: small-caps;
                    margin-bottom: 0px;
                    font-family:Georgia">Transcription normalisée</h2>
                <xsl:apply-templates select ="//body" mode="reg"/>
            </div>
        </td>
            </tr>
        </table>        
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
        

        
        <!-- <xsl:for-each select="parent::p/">
            <xsl:choose>
                <xsl:when test="hi/@rend='color(red)'">
                    <span style="color:red;">
                        <xsl:value-of select="text()"/>
                    </span>
                </xsl:when>
                    <xsl:otherwise>
                        <span>
                            <xsl:value-of select="text()"/>
                        </span>
                    </xsl:otherwise>
                
                
                <xsl:when test="@rend='color(blue) case(caps)'">
                    <span style="color:red;">
                        <xsl:value-of select="text()"/>
                    </span>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>-->
    </xsl:template>
    
    
    <!--     TEXTOMÉTRIE
        Divisée en 3 parties : Animaux ; Personnes ; Mythes
    Le premier index (animaux) est commenté. Les étapes sont 
    sensibellement les mêmes, bien que plus simple, pour les deux autres index.
    J'ai numéro les étapes afin d'aider le lecteur à ce retrouver, le voculaire
    pour chacune d'entre elles est à adapter en fonction de l'index dans lequel
    on se trouve. -->
    <xsl:template name="index">
        <div style="margin-left: 100px;">
            <h4 class="h4" style="
                font-variant: small-caps;
                font-family: Georgia;">Liste des animaux</h4>
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
                en ancien-français sauf les enfants des animaux eux-mêmes
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
                 <!-- 4# On référence les occurences.
                 Dans ce sens, on utilise la variable de l'id
                 et on récupère le numéro de ligne qui sera envoyé
                 au le fichier de sortie.-->
                <xsl:for-each select="ancestor::TEI//rs[@nymRef=concat('#', $idNym)]">
                    <xsl:value-of select="preceding-sibling::lb[1]/@n"/>
                    <!-- S'il ne s'agit pas de la dernière occurence,
                    alors on joint un point-virgule pour plus de lisibilité. -->
                    <xsl:if test="position() != last()"> ; </xsl:if>
                </xsl:for-each>
            </p>
            </div>
        </xsl:for-each>
        </div>
        </div>
    </xsl:template>
    
    <xsl:template name="index-personnages">
        <div style="margin-left: 100px;">
            <h4 class="h4" style="
                font-variant: small-caps;
                font-family: Georgia;">Liste des personnages</h4>
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
                    <p style="margin-left:50px; margin-right:450px">
                        <!-- 3# -->
                        <xsl:value-of select="note"/>
                        <p style="margin-left:50px; margin-right:450px">
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
    
    <xsl:template name="index-event">
        <div style="margin-left: 100px;">
            <h4 class="h4" style="
                font-variant: small-caps;
                font-family: Georgia;">Liste des mythes</h4>
            <div style="margin-left:50px">
                <!-- 1# -->
                <xsl:variable name="idEvent">
                    <xsl:value-of select="//listEvent/event/@xml:id"/>
                </xsl:variable>
                <p>
                    <!-- 2# -->
                    <b><xsl:value-of select="//listEvent/event/@source"/></b>
                </p>
                <p style="margin-left:50px; margin-right:450px">
                    <!-- 3# -->
                    <xsl:value-of select="//listEvent//desc"/>
                    <p style="margin-left:50px; margin-right:450px">
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