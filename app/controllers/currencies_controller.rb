class CurrenciesController < ActionController::Base
  def first_currency
    currencies_url = "https://api.exchangerate.host/symbols"
    currencies_raw_file = open(currencies_url).read
    currencies_parsed_file = JSON.parse(currencies_raw_file)
    @unique_currencies = currencies_parsed_file['symbols'].keys
    render({:template => "currency_templates/step_one.html.erb"})
  end

  def second_currency
    currencies_url = "https://api.exchangerate.host/symbols"
    currencies_raw_file = open(currencies_url).read
    currencies_parsed_file = JSON.parse(currencies_raw_file)
    @unique_currencies = currencies_parsed_file['symbols'].keys
    @first_currency = params.fetch("first_currency") 
    render({:template => "currency_templates/step_two.html.erb"})
  end

  def exchange_rate
    @first_currency = params.fetch("first_currency") 
    @second_currency = params.fetch("second_currency") 
    exchange_rate_url = "https://api.exchangerate.host/convert?from=#{@first_currency}&to=#{@second_currency}"
    exchange_rate_raw_file = open(exchange_rate_url).read
    exchange_rate_parsed_file = JSON.parse(exchange_rate_raw_file)
    @exchange_rate = exchange_rate_parsed_file['info']['rate']
    render({:template => "currency_templates/step_three.html.erb"})
  end
end
