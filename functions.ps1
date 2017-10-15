. .\classes.ps1


function getResultLinks($links)
{
    return ($links | Where-Object outerHTML -match "result-title")
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
    $hrefSplit = $hrefString.split("/")
    $temp = $hrefSplit[$hrefSplit.length-1]
    $dataId = $temp.substring(0,$temp.lastindexof("."))

    return $dataId

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