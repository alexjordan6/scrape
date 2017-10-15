. .\classes.ps1


function getResultLinks($links)
{
    return ($links | Where-Object outerHTML -match "result-title").href
}

function getPricedResults($links)
{
    return ($links | Where-Object outerHTML -match "result-price")
}

function getPrice($rawResult)
{
    return ([xml]$rawResult.outerHTML).a.span.innerText
}

function getDataId($rawResult){
    $hrefString = $rawResult.href 
    $hrefSplit= = $hrefString.split("/")
    $result = $hrefSplit[$hrefSplit.length-1]
    $result = $result.substring(0,$result.lastindexof("."))

    return $result

}

function getWebResponse($url) {
 
    $webResponse = $null
    $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
    try {
      $webResponse = Invoke-WebRequest $url -UseBasicParsing
    }
    catch {
        $_
    }
    finally {
        $stopwatch.stop()
        $stopwatch.elapsed.totalmilliseconds
    }
    return $webResponse
    
}