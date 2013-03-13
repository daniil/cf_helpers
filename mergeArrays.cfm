<cffunction name="mergeArrays" returntype="array">
	<cfargument name="aggregateArray" type="array">
    <cfargument name="keyName" type="string">
    <cfargument name="valueName" type="string">
    
    <cfset returnArr = ArrayNew(1)>
    
    <cfloop from="1" to="#ArrayLen(aggregateArray)#" index="i">
        <cfloop from="1" to="#ArrayLen(aggregateArray[i])#" index="j">
            <cfset currPos = 0>
            <cfloop from="1" to="#ArrayLen(returnArr)#" index="k">
                <cfif returnArr[k][keyName] EQ aggregateArray[i][j][keyName]>
                    <cfset currPos = k>
                </cfif>
            </cfloop>
            <cfif currPos GT 0>
                <cfset returnArr[currPos][valueName] = returnArr[currPos][valueName] + aggregateArray[i][j][valueName]>
            <cfelse>
                <cfset currStruct = StructNew()>
                <cfset currStruct[keyName] = aggregateArray[i][j][keyName]>
                <cfset currStruct[valueName] = aggregateArray[i][j][valueName]>
                <cfset tempArr = ArrayAppend(returnArr, currStruct)>
            </cfif>
        </cfloop>
    </cfloop>
    
    <cfreturn returnArr>
    
</cffunction>