. .\classes.ps1
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
function getResultsHashTable($rawLinks)
{
    $post = New-Object Post
    $post.href = $rawLink.href
    $post.dataId = getDataId -hrefString $post.href
    $post.price = getPrice -link $rawLink
    $post.title = "unknown"
    $results = @{}
    foreach ($rawLink in $rawLinkslinks)
    {
        $href = $rawLink.href
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