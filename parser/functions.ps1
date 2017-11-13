#scans the $inputString until it encounters a node matching $nodeNameRegex
#returns the index of the starting point within the node
function scanToNode {
    [cmdletbinding()]
    param (
        [string]$nodeNameRegex,
        [string]$inputString
    )
    begin{}
    process{
        for($i = 0; $i -lt  $inputString.Length; $i++){
            $char = $inputString[$i]
            if($char -ne "<")
            {
                continue
            }
            else{
                $foundNode = ""
                do {
                    $foundNode += $char
                    $i++
                    $char = $inputString[$i] 
                } until ($char -ne ">")
                if ($foundNode -match $nodeNameRegex)
                {
                    return $i + 1
                }
            }
        }

    }
    end{}
}

function scrapeRow {
    [cmdletbinding()]
    param(
        [string]$inputString
    )
    begin{}
    process{
        $titleStartIndex = scanToNode -nodeNameRegex "<a href=" -inputString $inputString
        $title = ""
        $i = $titleStartIndex
        while ($char -ne "<") {
            $char = $inputScript[$i]
            $title += $char
            $i++
        } 
        $char = ""
        #should have the title by this point
        $priceStartIndex = scanToNode -nodeNameRegex '<span class="result-price">' -inputString $inputString
        $price = ""
        $i = $priceStartIndex
        while ($char -ne "<") {
            $char = $inputScript[$i]
            $title += $char
            $i++
        } 
    }
    end{}
}

#takes input string and returns the index for which the start of a row is
function scanToRows{
    [cmdletbinding()]
    param(
        [string]$inputString
    )
    begin{}
    process{
        $numChars = $inputString.Length
        for($i = 0; $i -lt  $numChars; $i++){
            $char = $inputString[$i]
            #keep advancing until you hit the start of a node
            if($char -ne "<"){
                continue
            }
            #we've hit the beginning of a node
            Write-Verbose "start of node."
            $nodeName = ""
            while($char -ne ">"){
                #acquiring the name of the node
                $nodeName += $char
                $i++
                $char = $inputString[$i]

            }
            #at this point $char -eq ">"
            $nodeName += $char
            #we've acquired the node name at this point
 
            Write-Debug -message "within a $nodeName"
            Write-Debug -message "at: $i"
            Write-Debug -message "current char: $char"

            if($nodeName -eq '<ul class="rows">'){
                Write-Debug "made it to the posts!"
                #returning the 
                return $i + 1
            }
            else{
                continue
            }
        }
    }
    end{}
}
function getNextRow{
    [cmdletbinding()]
    param(
        [string]$inputString
    )
    begin{
    }
    process{
        
    }
    end{}
}
function scan{

    [cmdletbinding()]
    param(
        [object]$webResp
    )
    begin{
    }
    process
    {
        $inputString = $webResp.content.replace("`n","")
        $index = scanToRows -inputString $inputString


    }
    end{}
}