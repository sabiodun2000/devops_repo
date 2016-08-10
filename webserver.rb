# Update cache daily
#

name "webserver"

description "This webserver serves http and https"

run_list(
    "recipe[apache2]" ,
    "recipe[apache2::mod_ssl]"
)
default_attributes(
    "apache" => {
        "listen" => ["*.80", "*.443"]
    }
)

file '/var/www/html/index.html' do
    content '<html>
    <head>
        <title>Hello World</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
    </html>'
end

