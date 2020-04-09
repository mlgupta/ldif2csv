###############################################################################
# @(#)ldif2csv.awk	1.3 07/20/05 13:47:10
###############################################################################
# File: ldif2csv.awk
# Create csv dump for whole database
#
BEGIN {
	dn			= ""
        givenName               = ""
        postalCode		= ""
        displayName		= ""
        sn			= ""
        cn			= ""
        mail			= ""
        description		= ""
        departmentNumber	= ""
        employeeID		= ""
        ou			= ""
        name			= ""
        printf("dn,employeeID,mail,ou\n");
}
/^givenName: /          {givenName=$2}
/^postalCode: /         {postalCode=$2}
/^displayName: /        {displayName=$2}
/^sn: /                 {sn=$2}
/^cn: /                 {cn=$2}
/^mail: /               {mail=$2}
/^description: /        {description=$2}
/^departmentNumber: /   {departmentNumber=$2}
/^employeeID: /     {employeeID=$2}
/^ou: /                 {ou=$2}
/^name: /               {name=$2}
/^dn/ {
	split(dn,dnarray,",")
	ou=dnarray[2]
        if(sn != "" && sn != "Admin" && employeeID != "" && employeeID != "000000") printf("\"%s\",\"%s\",\"%s\",\"%s\"\n",dn,employeeID,mail,ou)
	dn			= $2
        givenName		= ""
        postalCode		= ""
        displayName		= ""
        sn			= ""
        cn			= ""
        mail			= ""
        description		= ""
        departmentNumber	= ""
        employeeID		= ""
        ou			= ""
        name			= ""
}
# Capture last dn
END {
#        if(sn != "" && sn != "Admin") printf("\"%s\",\"%s\",\"%s\",\"%s\"\n",dn,employeeID,mail,ou)
        if(sn != "" && sn != "Admin" && employeeID != "" && employeeID != "000000") printf("\"%s\",\"%s\",\"%s\",\"%s\"\n",dn,employeeID,mail,ou)
}
