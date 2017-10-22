#importing random functions
. .\functions.ps1

#import parser stuff
. .\parser\import.ps1
$url = "https://madison.craigslist.org/d/atvs%2C-utvs%2C-snowmobiles/search/sna"
$rawWebResponse = getWebResponse -url $url
$scanResult = scan -webResp $rawWebResponse

$rawResults = getPricedResults -rawResults $rawWebResponse.links
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

$postCollection.OutputPosts()