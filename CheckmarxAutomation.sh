#!/bin/bash

usage()
{
   echo "usage: dlBitbucketRepos
      [[-o|--output] <outputFolder>] Default value is the current folder
      [-h|--help]"
}


case $1 in
   -o | --output)
      shift
      outputFolder="$1"
      ;;
   -h | --help)
      usage
      exit
      ;;
   *)
      usage
      exit
esac

#Retrieve the User Checkmarx Password securely
read -s -p "Please, Fill in your Checkmarx Password : " checkmarxAppPassword

# The link to the Checkmarx server instance
cxServer="https://my.checkmarx.server.url/"

# The inforation about the Git repository we want to analyze
locationPrivateKey="/git/repository/private/key/absolute/path"
locationUrl="https://github.com/Name/repository.git"
locationBranch="master"

#Launch the Checkmarx Scan
echo 
echo Starting Scan on Checkmarx...
echo ./CxConsolePlugin/CxConsolePlugin-8.90.0/runCxConsole.sh Scan -Projectname "SP/Cx/Engine/AST/SecurityScanTest" -CxServer $cxServer -cxuser $checkmarxLogin -cxpassword $checkmarxAppPassword -locationtype GIT -locationprivatekey $locationPrivateKey -locationurl $locationUrl -locationbranch $locationBranch -preset All -comment 'Scan de test' -reportpdf ~/SecurityScanTest.pdf
./CxConsolePlugin/CxConsolePlugin-8.90.0/runCxConsole.sh Scan -Projectname "SP/Cx/Engine/AST/SecurityScanTest" -CxServer $cxServer -cxuser $checkmarxLogin -cxpassword $checkmarxAppPassword -locationtype GIT -locationprivatekey $locationPrivateKey -locationurl $locationUrl -locationbranch $locationBranch -preset All -comment 'Scan de test' -reportpdf ~/SecurityScanTest.pdf
