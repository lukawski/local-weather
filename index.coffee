$ ->
    $.getJSON 'http://ipinfo.io', (data) ->
        coordinates = data.loc.split ","
        console.log coordinates
        $.getJSON "http://api.openweathermap.org/data/2.5/weather?lat=#{coordinates[0]}&lon=#{coordinates[1]}&appid=8b830aa60de9f4ee837383d344c35185", (data) ->
            console.log data

