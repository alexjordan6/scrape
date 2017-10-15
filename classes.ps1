class Post {
    [string]$href
    [string]$dataId
    [string]$price
    [string]$title
}

class PostCollection {

    #internal hashtable that stores the Posts
    hidden [System.Collections.Hashtable] $collection = [System.Collections.Hashtable]@{}
    
    [void] Add([Post] $newPost){
        $this.collection.add($newPost.dataId,@{'href' = $newPost.href; 'price' = $newPost.price; 'title' = $newPost.title })
        return 
    }

    [void] OutputPosts(){
        foreach($item in $this.collection.getEnumerator())
        {
            Write-Host $item.value.title
            Write-Host "---" "$($item.Value.title)"
            Write-Host "---" "$($item.Value.price)"
            Write-Host "---" "$($item.Value.href)"
           
            
        }
        return
    }
}