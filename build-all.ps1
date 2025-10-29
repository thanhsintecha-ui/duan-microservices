# Build script for all microservices
Write-Host "Building all microservices..." -ForegroundColor Green

$services = @(
    "eureka-server",
    "api-gateway",
    "order-service",
    "user-service",
    "product-service",
    "cart-service",
    "notification-service"
)

foreach ($service in $services) {
    Write-Host "`nBuilding $service..." -ForegroundColor Yellow
    Set-Location $service
    
    if (Test-Path "mvnw.cmd") {
        .\mvnw.cmd clean package -DskipTests
    } elseif (Get-Command mvn -ErrorAction SilentlyContinue) {
        mvn clean package -DskipTests
    } else {
        Write-Host "Error: Neither mvnw.cmd nor mvn found for $service" -ForegroundColor Red
        Set-Location ..
        exit 1
    }
    
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error building $service" -ForegroundColor Red
        Set-Location ..
        exit 1
    }
    
    Set-Location ..
}

Write-Host "`nAll services built successfully!" -ForegroundColor Green
Write-Host "You can now run: docker-compose up --build" -ForegroundColor Cyan

