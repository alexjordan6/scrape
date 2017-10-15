function getResultLinks($links)
{
    return ($links | Where-Object outerHTML -match "result-title").href
}

function getPricedResults($links)
{
    return ($links | Where-Object outerHTML -match "result-price")
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