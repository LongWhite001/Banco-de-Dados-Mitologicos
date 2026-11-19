# Define o link direto do executável (obtido no Passo 1)
$url = "https://github.com/LongWhite001/Banco-de-Dados-Mitologicos/releases/download/1.0/Banco.de.Dados.Mitologicos.exe"

# Define onde o arquivo será salvo temporariamente
$destino = "$env:TEMP\seu-programa.exe"

# Baixa o arquivo
Write-Host "Baixando o instalador..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $url -OutFile $destino

# Executa o arquivo
Write-Host "Iniciando a execucao..." -ForegroundColor Green
Start-Process -FilePath $destino -Wait

# Opcional: Remove o arquivo temporário após fechar o programa
Remove-Item -Path $destino -Force
