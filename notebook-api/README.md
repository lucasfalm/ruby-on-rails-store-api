# Notebooks API for testing Ruby on Rails API
### curl with POST
curl 'localhost:3000/auths' -d "name=Lucas" -H 'Accept: application/json' -X POST 

### curl with PATCH
curl 'localhost:3000/contact/2/phone' -d "number=48988088001&id=3" -H 'Accept: application/json' -X PATCH 

### curl with GET
curl 'localhost:3000/contact/2/phone' -H 'Accept: application/json' -X GET

### curl with DELETE
curl 'localhost:3000/contact/2/phone' -d "id=3" -H 'Accept: application/json' -X DELETE 
