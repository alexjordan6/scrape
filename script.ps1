function getResultPages($links)
{
    return ($links | Where-Object outerHTML -match "result-title").href
}
$url = "https://madison.craigslist.org/d/atvs%2C-utvs%2C-snowmobiles/search/sna"

try {
    $webResponse = Invoke-WebRequest $url -UseBasicParsing
    $links = $webResponse.links
    $resultPages = getResultPages -links $links
    $resultPages
    

}
catch {
    $_
}