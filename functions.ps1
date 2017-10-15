function getResultLinks($links)
{
    return ($links | Where-Object outerHTML -match "result-title").href
}

function getPricedResults($links)
{
    return ($links | Where-Object outerHTML -match "result-price")
}

function getPrice($link)
{
    return ([xml]$link.outerHTML).a.span.innerText
}

function getDataId($hrefString){
    $hrefSplit= = $hrefString.split("/")
    $result = $hrefSplit[$hrefSplit.length-1]
    $result = $result.substring(0,$result.lastindexof("."))

    return $result

}
function getResultsHashTable($links)
{
    $results = @{}
    foreach ($link in $links)
    {
        $href = $link.href
        $DataId =getDataId($href)
        $results.add($DataId,@{"PageLink" = $href; })
    }
}
function getWebResponse($url) {
 

    try {
        $webResponse = Invoke-WebRequest $url -UseBasicParsing
    }
    catch {
        $_
    }
    return $webResponse
}