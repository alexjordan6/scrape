$url = "https://madison.craigslist.org/d/atvs%2C-utvs%2C-snowmobiles/search/sna"

try {
    $results = Invoke-WebRequest $url -UseBasicParsing
    
}
catch {
    $_
}