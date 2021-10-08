# title: bwafaas_login.sh
# author: bwolmarans@barracuda.com
# description: This is a utility script to set the WAF-as-a-Service API key as an environment variable
# requirements: just bash and optionally pyton to pretty print
# usage: source bwafaas_login.sh username password
#
# Note: YOU HAVE TO SOURCE THIS FILE NOT EXECUTRE IT OR ELSE IT WILL NOT SET THE ENVIRONMENT VARIABLE
#
echo ""
export WAAS_API_KEY=`curl "https://api.waas.barracudanetworks.com/v2/waasapi/api_login/" -X POST -d "email=$1&password=$2" | grep -Po '"key": *\K"[^"]*"' | sed -e 's/^"//' -e 's/"$//'`
echo ""
echo "Assuming you sourced this script, this script has set an environment variable named WAAS_API_KEY as follows:"
echo ""
echo WAAS_API_KEY=$WAAS_API_KEY
echo ""
echo "Example of using this to get the list of applications on WAFaaS:"
echo ""
echo "curl \"https://api.waas.barracudanetworks.com/v2/waasapi/applications/\" -H \"accept: application/json\" -H \"Content-Type: application/json\" -H \"auth-api: \$WAAS_API_KEY\" | python -m json.tool"
echo ""
echo "Go ahead, copy that curl line and try it right now!"
echo ""
