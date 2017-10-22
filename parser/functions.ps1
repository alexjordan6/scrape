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
    process{}
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