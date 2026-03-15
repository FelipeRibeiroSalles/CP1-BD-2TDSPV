
DECLARE
    v_dano_nevoa NUMBER := 10; -- Dano causado pela névoa
BEGIN

    FOR r IN (
        SELECT id_heroi
        FROM TB_HEROIS
        WHERE status = 'ATIVO'
    ) LOOP

        UPDATE TB_HEROIS
        SET hp_atual = hp_atual - v_dano_nevoa
        WHERE id_heroi = r.id_heroi;

        UPDATE TB_HEROIS
        SET status = 'CAÍDO'
        WHERE id_heroi = r.id_heroi
        AND hp_atual <= 0;
        
    END LOOP;

    COMMIT;
END;