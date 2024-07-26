$Supported_Java_Versions = @("java8", "java11", "java17")
$Selected_Java_Version = Read-Host "Enter a java version (no spaces, i.e: java11)"

$Selected_Java_Version = $Selected_Java_Version.toLower()

if ($Supported_Java_Versions -contains $Selected_Java_Version) {
	$Path_To_Jdk = ""
	
	switch ($Selected_Java_Version) {
		"java8" {$Path_To_Jdk = "c:\Program Files\Java\jdk1.8.0_291"}
		"java11" {$Path_To_Jdk = "c:\dev\jdk-11.0.19"}
		"java17" {$Path_To_Jdk = "c:\dev\jdk-17.0.8"}
	}
	
	[Environment]::SetEnvironmentVariable("JAVA_HOME", $Path_To_Jdk, "Machine")
	Write-Host "Java version set to $Selected_Java_Version on path $env:JAVA_HOME"
} else {
	Write-Host "The selected Java version is not supported"
}
