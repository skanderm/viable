curl -s --request GET --url 'http://localhost:4000/api/systems' | jq

curl -s -X POST 'http://localhost:4000/api/systems' \
    -H 'Content-Type: application/vnd.api+json' \
    -H "Accept: application/vnd.api+json" \
    -d \
    '{
        "data": {
            "attributes": {
                "name": "Viable Coop",
                "type": "one",
                "description": "The whole org"
            },
            "type": "system"
        }
    }' | jq


curl -s -X POST 'http://localhost:4000/api/systems' \
    -H 'Content-Type: application/vnd.api+json' \
    -H "Accept: application/vnd.api+json" \
    -d \
    '{
        "data": {
            "type": "system",
            "attributes": {
                "name": "General assembly",
                "type": "five",
                "description": "When we meet every year"
            }
        }
    }' | jq


curl -s -X POST 'http://localhost:4000/api/systems' \
    -H 'Content-Type: application/vnd.api+json' \
    -H "Accept: application/vnd.api+json" \
    -d \
    '{
        "data": {
            "type": "system",
            "attributes": {
                "name": "Monthly news survey",
                "type": "four",
                "description": "When we get together and look for new cooperatives to reach out to"
            }
        }
    }' | jq

curl -s -X POST 'http://localhost:4000/api/systems' \
    -H 'Content-Type: application/vnd.api+json' \
    -H "Accept: application/vnd.api+json" \
    -d \
    '{
        "data": {
            "type": "system",
            "attributes": {
                "name": "Biweekly planning and budgeting meeting",
                "type": "three",
                "description": "Where we look over our backlog and decide what to schedule for the next cycle"
            }
        }
    }' | jq

curl -s -X POST 'http://localhost:4000/api/systems' \
    -H 'Content-Type: application/vnd.api+json' \
    -H "Accept: application/vnd.api+json" \
    -d \
    '{
        "data": {
            "type": "system",
            "attributes": {
                "name": "End of week happy hour",
                "type": "three_star",
                "description": ""
            }
        }
    }' | jq

curl -s -X POST 'http://localhost:4000/api/systems' \
    -H 'Content-Type: application/vnd.api+json' \
    -H "Accept: application/vnd.api+json" \
    -d \
    '{
        "data": {
            "type": "system",
            "attributes": {
                "name": "Daily group task updates",
                "type": "two",
                "description": "Where we check the task list and make sure not to take another person''s task"
            }
        }
    }' | jq

curl -s -X POST 'http://localhost:4000/api/systems' \
    -H 'Content-Type: application/vnd.api+json' \
    -H "Accept: application/vnd.api+json" \
    -d \
    '{
        "data": {
            "type": "system",
            "attributes": {
                "name": "Data science team",
                "type": "one",
                "description": "They figure out the math for algedonic signals"
            }
        }
    }' | jq

curl -s -X POST 'http://localhost:4000/api/systems' \
    -H 'Content-Type: application/vnd.api+json' \
    -H "Accept: application/vnd.api+json" \
    -d \
    '{
        "data": {
            "type": "system",
            "attributes": {
                "name": "Organizers",
                "type": "one",
                "description": "They work with our partner organizations"
            }
        }
    }' | jq

curl -s -X POST 'http://localhost:4000/api/systems' \
    -H 'Content-Type: application/vnd.api+json' \
    -H "Accept: application/vnd.api+json" \
    -d \
    '{
        "data": {
            "type": "system",
            "attributes": {
                "name": "Web app team",
                "type": "one",
                "description": "They build the website"
            }
        }
    }' | jq
