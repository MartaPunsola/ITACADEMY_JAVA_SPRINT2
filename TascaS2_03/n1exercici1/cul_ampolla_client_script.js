db.createCollection('client', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'client',
      required: ['name', 'data', 'last_shopping'],
      properties: {
        name: {
          bsonType: 'string'
        },
        data: {
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
        },
        last_shopping: {
          bsonType: 'object',
          title: 'object',
          required: ['glasses', 'seller', 'date'],
          properties: {
            glasses: {
              bsonType: 'object',
              title: 'object',
              required: ['brand', 'graduation', 'color', 'frame_type', 'price'],
              properties: {
                brand: {
                  bsonType: 'string'
                },
                graduation: {
                  bsonType: 'object',
                  title: 'object',
                  required: ['right_eye', 'left_eye'],
                  properties: {
                    right_eye: {
                      bsonType: 'decimal'
                    },
                    left_eye: {
                      bsonType: 'decimal'
                    }
                  }
                },
                color: {
                  bsonType: 'object',
                  title: 'object',
                  required: ['right_eye', 'left_eye'],
                  properties: {
                    right_eye: {
                      bsonType: 'string'
                    },
                    left_eye: {
                      bsonType: 'string'
                    }
                  }
                },
                frame_type: {
                  enum: ('floating', 'plastic', 'metallic')
                },
                price: {
                  bsonType: 'decimal'
                }
              }
            },
            seller: {
              bsonType: 'string'
            },
            date: {
              bsonType: 'date'
            }
          }
        }
      }
    }
  }
});
Generated: 5 / 9 / 2024 | 16: 11: 57 by Moon Modeler - www.datensen.com