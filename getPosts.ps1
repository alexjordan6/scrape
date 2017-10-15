. .\functions.ps1
$url = "https://madison.craigslist.org/d/atvs%2C-utvs%2C-snowmobiles/search/sna"
$rawWebResponse = getWebResponse -url $url
$rawResults = getResultLinks -links $rawWebResponse.links
$postCollection = [PostCollection]::new()
foreach($rawResult in $rawResults)
{
    $post = [Post]::new()
    $post.href = $rawResult.href
    $post.price = getPrice -rawResult $rawResult
    $post.title = "unknown"
    $post.dataId = getDataId -rawResult $rawResult

    $postCollection.Add($post)
}

Write-Host $postCollection.ToString()