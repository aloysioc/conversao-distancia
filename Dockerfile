# Use uma imagem base com Python
FROM python:3.13.0

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia o arquivo de dependências para o container
COPY requirements.txt .

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código para o diretório de trabalho
COPY . .

# Definir a porta de execução
EXPOSE 5000

# Define o comando padrão para iniciar a aplicação
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
