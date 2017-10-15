#importing stuff
. .\functions.ps1

$url = "https://madison.craigslist.org/d/atvs%2C-utvs%2C-snowmobiles/search/sna"
$webResp = getWebResponse -url $url

$pricedResults = getPricedResults -links $webResp.links

foreach($result in $pricedResults)
{
    getPrice -link $result
}

