<cffunction name="fixYouTubeEmbed" output="yes" returntype="string">
    <cfargument name="HTMLStr" required="yes" type="string">
    
    <cfset title = getAttrVal(HTMLStr, "title")>
    <cfset width = getAttrVal(HTMLStr, "width")>
    <cfset height = getAttrVal(HTMLStr, "height")>
    <cfset src = getAttrVal(HTMLStr, "src")>
    
    <cfset HTMLClean = '<iframe title="#title#" width="#width#" height="#height#" src="#src#?wmode=transparent" frameborder="0" wmode="opaque" allowfullscreen></iframe>'>
    
    <cfreturn HTMLClean>
</cffunction>
<cffunction name="getAttrVal" output="yes" returntype="string">
    <cfargument name="HTMLStr" required="yes" type="string">
    <cfargument name="attrName" required="yes" type="string">
    
    <cfset attrStart = Right(HTMLStr, Len(HTMLStr) - Find(attrName, HTMLStr) - Len(attrName) - 1)>
    <cfset attrVal = Left(attrStart, Find('"', attrStart) - 1)>
    
    <cfreturn attrVal>
</cffunction>