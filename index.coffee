$ ->
    $.getJSON 'http://ipinfo.io', (data) ->
        coordinates = data.loc.split ","
        console.log coordinates
        

