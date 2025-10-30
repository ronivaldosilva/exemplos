CREATE FUNCTION dbo.Lord_SUPER_TRIM(@Texto NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS
BEGIN
    -- Declara uma variável para armazenar o resultado final.
    DECLARE @Resultado NVARCHAR(MAX);

    -- Verifica se o texto de entrada é nulo para evitar erros.
    -- Se for nulo, retorna nulo imediatamente.
    IF @Texto IS NULL
        RETURN NULL;

    -- Executa o processo de dividir, filtrar strings vazias e agregar novamente.
    SELECT
        -- LIMPA OS EXESSOS DE ESPAÇOS POR PALAVRA. 
        -- AGRUPA TEXTO USANDO ESPAÇO COMO DELIMITADOR
        @Resultado = STRING_AGG(TRIM(value), ' ') 
    FROM
        -- SEPARA TEXTO POR STRING ESPAÇO
        STRING_SPLIT(@Texto, ' ')
    WHERE
        value <> ''; -- Crucial para remover linhas vazias de espaços múltiplos

    -- Retorna a string limpa.
    RETURN @Resultado;
END;
GO
