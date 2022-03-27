#!/bin/bash

# Get all systems
curl -s 'http://localhost:4000/api/systems' | jq

# Filter by level: -g option is needed for square brackets
curl -g -s 'http://localhost:4000/api/systems?filter[level]=five' | jq

# Create parent system
parent_id=$(curl -s -X POST 'http://localhost:4000/api/systems' \
    -H 'Content-Type: application/vnd.api+json' \
    -H "Accept: application/vnd.api+json" \
    -d \
    '{
        "data": {
            "attributes": {
                "name": "Viable Coop Accelerator",
                "level": "one",
                "description": "The whole org"
            },
            "type": "system"
        }
    }' | jq .data.id)


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
                "parent": {"data": {"id": '$parent_id', "type": "system"}}
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
                "parent": {"data": {"id": '$parent_id', "type": "system"}}
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
                "name": "Quarterly planning and budgeting meeting",
                "level": "three",
                "description": "Where we decide which coops need more resources"
            },
            "relationships": {
                "parent": {"data": {"id": '$parent_id', "type": "system"}}
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
                "name": "Consultation services",
                "level": "three_star",
                "description": "Regular meetings requested by coops for help navigating thier struggles"
            },
            "relationships": {
                "parent": {"data": {"id": '$parent_id', "type": "system"}}
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
                "name": "Internal discussion forum",
                "level": "two",
                "description": "For disseminating helpful information and asking for help"
            },
            "relationships": {
                "parent": {"data": {"id": '$parent_id', "type": "system"}}
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
                "name": "Local food coop",
                "level": "one",
                "description": "Worker-owned and operated grocery store"
            },
            "relationships": {
                "parent": {"data": {"id": '$parent_id', "type": "system"}}
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
                "name": "Ride share platform coop",
                "level": "one",
                "description": "Serves most cities, run by drivers and platform developers"
            },
            "relationships": {
                "parent": {"data": {"id": '$parent_id', "type": "system"}}
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
                "name": "Cooperative consulting group",
                "level": "one",
                "description": "Apply the VSM to other cooperatives"
            },
            "relationships": {
                "parent": {"data": {"id": '$parent_id', "type": "system"}}
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
                "name": "Credit union",
                "level": "one",
                "description": "Banking, etc"
            },
            "relationships": {
                "parent": {"data": {"id": '$parent_id', "type": "system"}}
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
                "name": "Crowdfunding tech coop",
                "level": "one",
                "description": "Fundraising for worker-owned enterprises"
            },
            "relationships": {
                "parent": {"data": {"id": '$parent_id', "type": "system"}}
            }
        }
    }' | jq
