db.createCollection('store', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'store',
      required: ['name', 'order', 'address', 'postal_code', 'locality', 'province', 'worker'],
      properties: {
        name: {
          bsonType: 'string'
        },
        order: {
          bsonType: 'object',
          title: 'object',
          required: ['order_id', 'date_and_time', 'product', 'total_price', 'client', 'delivered', 'paid'],
          properties: {
            order_id: {
              bsonType: 'objectId'
            },
            date_and_time: {
              bsonType: 'timestamp'
            },
            product: {
              bsonType: 'object',
              title: 'object',
              required: ['product_id', 'type', 'name', 'name', 'quantity', 'description', 'image', 'price'],
              properties: {
                product_id: {
                  bsonType: 'objectId'
                },
                type: {
                  bsonType: 'object',
                  title: 'object',
                  properties: {
                    pizza: {
                      bsonType: 'object',
                      title: 'object',
                      properties: {
                        category: {
                          bsonType: 'string'
                        }
                      }
                    },
                    burger: {
                      bsonType: 'string'
                    },
                    drink: {
                      bsonType: 'string'
                    }
                  }
                },
                name: {
                  bsonType: 'string'
                },
                name: {
                  bsonType: 'string'
                },
                quantity: {
                  bsonType: 'int'
                },
                description: {
                  bsonType: 'string'
                },
                image: {
                  bsonType: 'string'
                },
                price: {
                  bsonType: 'decimal'
                }
              }
            },
            total_price: {
              bsonType: 'decimal'
            },
            client: {
              bsonType: 'object',
              title: 'object',
              required: ['client_id', 'name', 'surname', 'phone_number', 'order_type'],
              properties: {
                client_id: {
                  bsonType: 'objectId'
                },
                name: {
                  bsonType: 'string'
                },
                surname: {
                  bsonType: 'string'
                },
                phone_number: {
                  bsonType: 'string'
                },
                order_type: {
                  bsonType: 'object',
                  title: 'object',
                  properties: {
                    takeout: {
                      bsonType: 'string'
                    },
                    home_delivery: {
                      bsonType: 'object',
                      title: 'object',
                      required: ['address', 'postal_code', 'locality', 'province', 'delivery_time', 'deliveryman_id'],
                      properties: {
                        address: {
                          bsonType: 'string'
                        },
                        postal_code: {
                          bsonType: 'string'
                        },
                        locality: {
                          bsonType: 'string'
                        },
                        province: {
                          bsonType: 'string'
                        },
                        delivery_time: {
                          bsonType: 'timestamp'
                        },
                        deliveryman_id: {
                          bsonType: 'objectId'
                        }
                      }
                    }
                  }
                }
              }
            },
            delivered: {
              bsonType: 'bool'
            },
            paid: {
              bsonType: 'bool'
            }
          }
        },
        address: {
          bsonType: 'string'
        },
        postal_code: {
          bsonType: 'string'
        },
        locality: {
          bsonType: 'string'
        },
        province: {
          bsonType: 'string'
        },
        worker: {
          bsonType: 'object',
          title: 'object',
          required: ['worker_id', 'name', 'surname', 'nif', 'phone_number', 'role'],
          properties: {
            worker_id: {
              bsonType: 'objectId'
            },
            name: {
              bsonType: 'string'
            },
            surname: {
              bsonType: 'string'
            },
            nif: {
              bsonType: 'string'
            },
            phone_number: {
              bsonType: 'string'
            },
            role: {
              enum: 'cook',
              'deliveryman'
            }
          }
        }
      }
    }
  }
});
Generated: 9 / 9 / 2024 | 13: 53: 06 by Moon Modeler - www.datensen.com