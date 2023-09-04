# don't forget to update below variables to point to your Keycloak instance, main realm, and admin user
export KEYCLOAK_URL="http://localhost:8080"
export KEYCLOAK_MAIN_REALM=master
export KEYCLOAK_USER=lb
export KEYCLOAK_PASSWORD=***

# get the access token
access_token=$(curl --silent \
  -d "client_id=admin-cli" \
  -d "username=$KEYCLOAK_USER" \
  -d "password=$KEYCLOAK_PASSWORD" \
  -d "grant_type=password" \
  "$KEYCLOAK_URL/auth/realms/$KEYCLOAK_MAIN_REALM/protocol/openid-connect/token" | jq -r '.access_token')
  
 # create customer100 realm
curl -v -X POST -H "Authorization: bearer $access_token" -H "Content-Type: application/json" --data-binary @new_realm.json $KEYCLOAK_URL/auth/admin/realms 

# check if realm created successfully
curl -H "Authorization: bearer $access_token" $KEYCLOAK_URL/auth/admin/realms/customer100 | jq

# create react client
curl -v -X POST -H "Authorization: bearer $access_token" -H "Content-Type: application/json" --data-binary @new_client.json $KEYCLOAK_URL/auth/admin/realms/customer100/clients

# check if client created successfully
curl -H "Authorization: bearer $access_token" $KEYCLOAK_URL/auth/admin/realms/customer100/clients?clientId=react | jq
