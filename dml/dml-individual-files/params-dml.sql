-- params
-- modifique los valores de las ulr y puertos de acuerdo a las configuraciones de su entorno de producción
INSERT INTO opx.params(params_id, params_value, params_description) VALUES('umbral-validador', '1000', 'Umbral para alcanzar rol Validador');
INSERT INTO opx.params(params_id, params_value, params_description) VALUES('umbral-proyectista', '5000', 'Umbral para alcanzar rol Proyectista');
INSERT INTO opx.params(params_id, params_value, params_description) VALUES('aporte-positivo-encuesta', '50', 'Puntos Aporte Encuesta');
INSERT INTO opx.params(params_id, params_value, params_description) VALUES('aporte-positivo-cartografia', '100', 'Puntos Aporte Cartografia');
INSERT INTO opx.params(params_id, params_value, params_description) VALUES('aporte-negativo-encuesta', '-50', 'Aporte negativo encuesta');
INSERT INTO opx.params(params_id, params_value, params_description) VALUES('aporte-negativo-cartografia', '-100', 'Aporte negativo cartografia');
INSERT INTO opx.params(params_id, params_value, params_description) VALUES('kobo-token', 'Token 9e65dbdf164fbcee05f739d5e2d269e908760d8d', 'Token para los request a KOBO');
INSERT INTO opx.params(params_id, params_value, params_description) VALUES('kobo-kpi', 'kf.oim-opc.pre', 'URL API REST KOBO KPI');
INSERT INTO opx.params(params_id, params_value, params_description) VALUES('kobo-kobocat', 'kc.oim-opc.pre', 'URL API REST KOBO KoboCAT');
INSERT INTO opx.params(params_id, params_value, params_description) VALUES('kobo-puerto', '80', 'puerto del API REST de KOBO');
INSERT INTO opx.params(params_id, params_value, params_description) VALUES('tm', 'oim-opc.pre', 'URL API REST Tasking Manager');
INSERT INTO opx.params(params_id, params_value, params_description) VALUES('tm-puerto', '30802', 'puerto del API REST de Tasking Manager');
INSERT INTO opx.params(params_id, params_value, params_description) VALUES('tm-token', 'Token T1RNM09UQTJOUS5FVi1xemcuUk5MZUIzVHY4bHQ4cnhOR0dWUXNMSVNaTnpR', 'Token Tasking Manager');
INSERT INTO opx.params(params_id, params_value, params_description) VALUES('timeout-request', '10', 'Timeout en segundos para solicitudes HTTP');
INSERT INTO opx.params(params_id, params_value, params_description) VALUES('osm-api-url', 'master.apis.dev.openstreetmap.org', 'URL API REST OSM');
