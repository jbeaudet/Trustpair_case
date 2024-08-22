class OpendatasoftClient
  class << self 
    def get_company_state(evaluation)
      uri = URI("https://public.opendatasoft.com/api/records/1.0/search/?dataset=economicref-france-sirene-v3" \
      "&q=#{evaluation.value}&sort=datederniertraitementetablissement" \
      "&refine.etablissementsiege=oui")
      response = Net::HTTP.get(uri)
      parsed_response = JSON.parse(response)
      puts "##" + parsed_response["records"].first["fields"]["etatadministratifetablissement"] + "##"
      parsed_response["records"].first["fields"]["etatadministratifetablissement"]
    end
  end
end