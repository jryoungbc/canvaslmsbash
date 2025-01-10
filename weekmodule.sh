#A simple script to add a module for a set number of weeks.  Add you token and course number and the number of weeks you would like to create.

token=

course=

weeks=

ids=()

for ((i = 1; i <= $weeks; i++)); do
  echo $i

  RESPONSE=$(curl -s https://benedictine.instructure.com/api/v1/courses/$course/modules \
                -X POST \
                -H "Authorization: Bearer $token" \
                -d "module[name]=WEEK $i")
  
  ID=$(echo "$RESPONSE" | jq -r '.id')
  
  ids+=("$ID")

done

echo "Collected IDs: ${ids[@]}"
