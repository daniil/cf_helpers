<cfscript>
function stripHTML(str) {
   return REReplaceNoCase(str,"<[^>]*>","","ALL");
}
</cfscript>