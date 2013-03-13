<cffunction name="generateRandomPassword" access="remote" returntype="string" output="false">
    <cfargument name="passwordLength" type="numeric" default="0">
    
    <cfset strIntegers = "0123456789" />
	<cfset strLowerCaseAlpha = "abcdefghijklmnopqrstuvwxyz" />
    <cfset strUpperCaseAlpha = UCase( strLowerCaseAlpha ) />
    
    <cfset strAllValidChars = (
		strIntegers &
        strLowerCaseAlpha &
        strUpperCaseAlpha
    ) />
    
    <cfset arrPassword = ArrayNew(1) />
    
    <cfloop index="intChar" from="#(ArrayLen( arrPassword ) + 1)#" to="#passwordLength#" step="1">
        <cfset arrPassword[ intChar ] = Mid(
            strAllValidChars,
            RandRange( 1, Len( strAllValidChars ) ),
            1
        ) />
    </cfloop>
    
    <cfset CreateObject( "java", "java.util.Collections" ).Shuffle(arrPassword) />
    
    <cfset strPassword = ArrayToList(arrPassword, "") />
    
    <cfreturn strPassword>
</cffunction>