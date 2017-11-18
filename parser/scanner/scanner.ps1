class Scanner {
    [string] $Delimiter = "<"
    hidden [int] $position
    hidden [string] $InputSource
    
    Scanner ($Delimiter, $InputSource){
        $this.Delimiter = $Delimiter
        $this.InputSource = $InputSource
    }

    [string] next(){
        
        $this.InputSource
    }
    
}