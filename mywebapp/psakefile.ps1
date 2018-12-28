properties {
    [version] $version = $version
    $outputFolder = "$PSScriptRoot\.build"
    $feedUrl = $feedUrl
    $apiKey = $apiKey
}
 
Import-Module ..\automation\common\buildtools 

task default -depends Check, Clean, Version, Restore, Compile, Test, Publish, Package

task Check {
    Invoke-CheckVersion $version
}

task Clean {
    Invoke-Clean $outputFolder 
}

task Version {
    Invoke-Version $version
}

task Restore {
    Invoke-Restore
}

task Compile {
    Invoke-Compile $version
}

task Test {
    Write-Warning "Need to add unit tests"
}

task Publish {
    Invoke-Publish $version
}

task Package {
    Invoke-Package $version $outputFolder
}

task Push {
    Invoke-Push $outputFolder $feedUrl $apiKey
}