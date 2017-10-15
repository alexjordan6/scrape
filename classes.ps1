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

    [string] ToString(){
        return ($this.collection.getEnumerator | out-string)
    }
}