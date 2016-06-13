$ ->
    tempC = 0
    tempK = 0
    tempF = 0
    $.getJSON 'http://ipinfo.io', (data) ->
        $.getJSON "https://restcountries.eu/rest/v1/alpha/#{data.country}", (data) ->
            $('#country').text data.name
        coordinates = data.loc.split ","
        $.getJSON "http://api.openweathermap.org/data/2.5/weather?lat=#{coordinates[0]}&lon=#{coordinates[1]}&appid=8b830aa60de9f4ee837383d344c35185", (data) ->
            console.log data
            $('#city').text data.name
            tempK = data.main.temp
            tempC = Math.round tempK - 273.15
            tempF = Math.round tempK * 9/5 - 459.67
            $("#temp").text tempC
    $(document).ajaxStop ->
        if tempC > 20
            $('body').css 'background', 'url(https://source.unsplash.com/WLUHO9A_xik/1920x1080) no-repeat center'
        else if tempC <= 20 && tempC > 0
            $('body').css 'background', 'url(https://source.unsplash.com/rZsqmXfM3qQ/1920x1080) no-repeat center'
        else if tempC < 0
            $('body').css 'background', 'url(https://source.unsplash.com/JACEkXaAay0/1920x1080) no-repeat center'
            $('body').css 'color', '#333333'
        setTimeout ->
            $('#loaderStatus').removeClass 'active'
            $('.loader').animate {backgroundColor: 'transparent'}, 2000
            setTimeout ->
                $('.loader').css 'display', 'none'
            , 2050
            $("#degree").click ->
                currentD = $(this).attr 'data-degree'
                if currentD == 'c'
                    $(this).attr 'data-degree', 'f'
                    $(this).html '&#8457;'
                    $('#temp').text tempF
                else
                    $(this).attr 'data-degree', 'c'
                    $(this).html '&#8451;'
                    $('#temp').text tempC
        , 5000