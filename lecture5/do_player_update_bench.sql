update player SET nickname='vasya_updated' || id, email='vasya_updated' || id || '@tut.by', updated=now() WHERE id=(SELECT id FROM player TABLESAMPLE SYSTEM (5) LIMIT 1) RETURNING id;
