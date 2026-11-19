# 1. Configurações de caminhos
$urlZip = "https://github.com"
$arquivoZip = "$env:TEMP\pacote.zip"
$pastaDestino = "$env:TEMP\MeuApp"

# 2. Limpa instalações anteriores se existirem
if (Test-Path $pastaDestino) { Remove-Item -Path $pastaDestino -Recurse -Force }

# 3. Baixa o arquivo ZIP da Release
Write-Host "Baixando arquivos..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $urlZip -OutFile $arquivoZip

# 4. Extrai o ZIP (o .exe e a sua pasta ficarão juntos dentro de $pastaDestino)
Write-Host "Extraindo pacote..." -ForegroundColor Cyan
Expand-Archive -Path $arquivoZip -DestinationPath $pastaDestino -Force

# 5. Executa o .exe definindo a pasta extraída como diretório base
Write-Host "Executando programa..." -ForegroundColor Green
Start-Process -FilePath "$pastaDestino\seu-programa.exe" -WorkingDirectory $pastaDestino -Wait

# 6. Limpa os arquivos temporários após fechar o programa
Remove-Item -Path $arquivoZip, $pastaDestino -Recurse -Force
