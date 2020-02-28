class CharityBaseService
  
  require 'net/http'

  @@fields = 'id
            names {
              value
              primary
            }
            numPeople {
              employees
              trustees
              volunteers
            }
            geo {
              longitude
              latitude
            }
            contact {
              email
            }
            website
            finances {
              income
              spending
            }
            causes {
		      id
              name
            }
            operations {
		      id
              name
            }
          }'
  
  def sendRequest(data = {})
    
#    
#    data = {
#      'query' => 'query SearchCharities($num: [ID]) {
#        CHC {
#          getCharities( filters: { 
#            id: $num
#          }) { 
#            list(limit: 1) {
#              '+self.fields+'
#          }
#        }
#      }',
#      'variables' => { 'num' => 1182239 }
#    }
    
    apikey = '41f6fde1-7ab2-47bd-a069-39112c1d4339'
    
    uri = URI.parse("https://charitybase.uk/api/graphql")
    
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.request_uri, initheader = {
      'Accept' => "application/json",
      'Content-Type' => "application/json",
      'Authorization' => "Apikey #{apikey}",
      
    })
    request.body = data.to_json

    response = http.request(request)
    
    return JSON.parse response.body
  end
  
  def getCharityByNum(charity_num)
    @@fields
    response = self.sendRequest({
      'query' => 'query SearchCharities($num: [ID]) {
                    CHC {
                      getCharities(filters: {
                        id: $num
                      }) {
                        list(limit: 1) {'+@@fields+'
                      }
                    }
                  }',
      'variables' => {
          'num' => charity_num
        }
    });

    return response['data']['CHC']['getCharities']['list'][0]
  end
end