curl -s --request GET --url 'http://localhost:4000/api/systems' | jq

curl -s -X POST 'http://localhost:4000/api/systems' \
    -H 'Content-Type: application/vnd.api+json' \
    -H "Accept: application/vnd.api+json" \
    -d \
    '{
        "data": {
            "attributes": {
                "name": "Viable Coop",
                "level": "one",
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
                "level": "five",
                "description": "When we meet every year"
            },
            "relationships": {
                "parent": {"data": {"id": "0cc29d74-2e7e-483b-b121-745024241e9b", "type": "system"}}
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
                "level": "four",
                "description": "When we get together and look for new cooperatives to reach out to"
            },
            "relationships": {
                "parent": {"data": {"id": "0cc29d74-2e7e-483b-b121-745024241e9b", "type": "system"}}
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
                "level": "three",
                "description": "Where we look over our backlog and decide what to schedule for the next cycle"
            },
            "relationships": {
                "parent": {"data": {"id": "0cc29d74-2e7e-483b-b121-745024241e9b", "type": "system"}}
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
                "level": "three_star",
                "description": ""
            },
            "relationships": {
                "parent": {"data": {"id": "0cc29d74-2e7e-483b-b121-745024241e9b", "type": "system"}}
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
                "level": "two",
                "description": "Where we check the task list and make sure not to take another person''s task"
            },
            "relationships": {
                "parent": {"data": {"id": "0cc29d74-2e7e-483b-b121-745024241e9b", "type": "system"}}
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
                "level": "one",
                "description": "They figure out the math for algedonic signals"
            },
            "relationships": {
                "parent": {"data": {"id": "0cc29d74-2e7e-483b-b121-745024241e9b", "type": "system"}}
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
                "level": "one",
                "description": "They work with our partner organizations"
            },
            "relationships": {
                "parent": {"data": {"id": "0cc29d74-2e7e-483b-b121-745024241e9b", "type": "system"}}
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
                "level": "one",
                "description": "They build the website"
            },
            "relationships": {
                "parent": {"data": {"id": "0cc29d74-2e7e-483b-b121-745024241e9b", "type": "system"}}
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
                "name": "Propaganda (marketing) team",
                "level": "one",
                "description": "They deal with communications!"
            },
            "relationships": {
                "parent": {"data": {"id": "0cc29d74-2e7e-483b-b121-745024241e9b", "type": "system"}}
            }
        }
    }'
