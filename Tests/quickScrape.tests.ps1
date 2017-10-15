
Describe "quickScrape" {
    Context "running it" {
        $prices = .\quickScrape.ps1 
        It "script returns something" {
            
            ($prices.count -gt 0) | should be $true
        }
        It "all prices have dollar sign" {
            $result = $true 
            foreach($price in $prices)
            {
                if (-not $price.contains("$")){
                    $result = $false
                    break
                }
            }
            $result | should be $true
        }
    }
}