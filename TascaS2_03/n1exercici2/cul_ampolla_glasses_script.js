db.createCollection('glasses', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'glasses',
      required: ['brand', 'frame_type', 'provider', 'price', 'bought_by'],
      properties: {
        brand: {
          bsonType: 'string'
        },
        frame_type: {
          enum: ('floating', 'plastic', 'metallic')
        },
        provider: {
          bsonType: 'object',
          title: 'object',
          required: ['name', 'address', 'phone_number', 'fax', 'nif'],
          properties: {
            name: {
              bsonType: 'string'
            },
            address: {
              bsonType: 'object',
              title: 'object',
              required: ['street', 'number', 'floor', 'door', 'postal_code', 'country'],
              properties: {
                street: {
                  bsonType: 'string'
                },
                number: {
                  bsonType: 'int'
                },
                floor: {
                  bsonType: 'string'
                },
                door: {
                  bsonType: 'string'
                },
                postal_code: {
                  bsonType: 'string'
                },
                country: {
                  bsonType: 'string'
                }
              }
            },
            phone_number: {
              bsonType: 'string'
            },
            fax: {
              bsonType: 'string'
            },
            nif: {
              bsonType: 'string'
            }
          }
        },
        price: {
          bsonType: 'decimal'
        },
        bought_by: {
          bsonType: 'object',
          title: 'object',
          required: ['client_name', 'client_data'],
          properties: {
            client_name: {
              bsonType: 'string'
            },
            client_data: {
              bsonType: 'object',
              title: 'object',
              required: ['address', 'phone_number', 'email', 'registration_date'],
              properties: {
                address: {
                  bsonType: 'string'
                },
                phone_number: {
                  bsonType: 'string'
                },
                email: {
                  bsonType: 'string'
                },
                registration_date: {
                  bsonType: 'date'
                }
              }
            },
            recommended_by_client_id: {
              bsonType: 'int'
            }
          }
        }
      }
    }
  }
});
Generated: 5 / 9 / 2024 | 17: 40: 01 by Moon Modeler - www.datensen.com