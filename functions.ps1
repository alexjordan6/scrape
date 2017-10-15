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

function getWebResponse($url) {
 

    try {
        $webResponse = Invoke-WebRequest $url -UseBasicParsing
    }
    catch {
        $_
    }
    return $webResponse
}