-- 

CREATE OR REPLACE FUNCTION charge_attack_details(attack VARCHAR)
  RETURNS TEXT
  AS $$
    DECLARE
      j JSON;
    BEGIN
      SELECT TO_JSON(a) INTO j
	    FROM 
      (
        SELECT 
          *
        FROM pvp_charge_moves AS pcm, type_effectiveness AS te
		WHERE pcm.name = attack
		  AND te.attacking_type = pcm.type
      ) AS a;
    RETURN CAST(j AS TEXT);
	  END
  $$
  LANGUAGE PLPGSQL;

-- SELECT charge_attack_details('Hyper Beam');

CREATE OR REPLACE FUNCTION fast_attack_details(attack VARCHAR)
  RETURNS TEXT
  AS $$
    DECLARE 
      j JSON;
    BEGIN
      SELECT TO_JSON(a) INTO j
	    FROM 
      (
        SELECT 
          *
        FROM pvp_fast_moves AS pfm, type_effectiveness AS te
		WHERE pfm.name = attack
		  AND te.attacking_type = pfm.type
      ) AS a;

    RETURN CAST(j AS TEXT);
	  END
  $$
  LANGUAGE PLPGSQL;

-- SELECT fast_attack_details('Quick Attack');


-- DROP FUNCTION pokemondata;
CREATE OR REPLACE FUNCTION pokemondata(pokemon_name VARCHAR)
  RETURNS TABLE (j json)
  AS $$
    BEGIN
      RETURN QUERY SELECT TO_JSON(a) 
	    FROM 
      (
        SELECT 
          s.pokemon_id,
          s.form,
          s.base_attack,
          s.base_defense,
          s.base_stamina,
          s.name,
          ARRAY_AGG(DISTINCT(fast_attack_details(fm.fast_move_id))) AS fast_moves,
          ARRAY_AGG(DISTINCT(charge_attack_details(cm.charge_move_id))) AS charged_moves,
          ARRAY_AGG(DISTINCT(fast_attack_details(efm.fast_move_id))) AS elite_fast_moves,
          ARRAY_AGG(DISTINCT(charge_attack_details(ecm.charge_move_id))) AS elite_charged_moves
        FROM pokemon_stats AS s
        LEFT JOIN pokemon_fast_moves AS fm
        ON s.pokemon_id = fm.pokemon_id
        AND s.form = fm.form
        LEFT JOIN pokemon_charge_moves AS cm
        ON cm.pokemon_id = fm.pokemon_id
        AND cm.form = fm.form
        LEFT JOIN pokemon_elite_charge_moves AS ecm
        ON ecm.pokemon_id = fm.pokemon_id
        AND ecm.form = fm.form
        LEFT JOIN pokemon_elite_fast_moves AS efm
        ON efm.pokemon_id = fm.pokemon_id
        AND efm.form = fm.form
        WHERE s.name = pokemon_name
        GROUP BY s.pokemon_id, s.form
        ORDER BY s.pokemon_id ASC
      ) AS a;
	  END
  $$
  LANGUAGE PLPGSQL;

