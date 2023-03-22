param(
    [string]$image_name,
    [string]$container_name,
    [string]$docker_file,
    [int]$container_port,
    [int]$host_port
)
properties {
    $version_build=0
    $full_tag=""
  }

Task Default -Depends RunContainer

Task RunContainer -Depends BuildImage{
    
    
    $portMapping="$container_port"+":"+"$host_port"
    $full_tag=$image_name+":"+ $version_build
    Write-Host("Running container "+ $container_name + " on " + $portMapping +" .....")
   Exec{ docker run --name $container_name -d -p $portMapping  $full_tag }
    $version_build++

}

Task BuildImage  {

    
    $full_tag=$image_name+":"+ $version_build
    Write-Host("Building image " + $image_name + " .....")
   Exec{ docker build -f $docker_file  -t $full_tag . }
   

}
