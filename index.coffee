$ ->
    
    $.getJSON 'http://ipinfo.io', (data) ->
        $.getJSON "https://restcountries.eu/rest/v1/alpha/#{data.country}", (data) ->
            $('#country').text data.name
        coordinates = data.loc.split ","
        $.getJSON "http://api.openweathermap.org/data/2.5/weather?lat=#{coordinates[0]}&lon=#{coordinates[1]}&appid=8b830aa60de9f4ee837383d344c35185", (data) ->
            $('#city').text data.name
            tempK = data.main.temp
            tempC = Math.round tempK - 273.15
            tempF = Math.round tempK * 9/5 - 459.67
            $("#temp").text tempC

