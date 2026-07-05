-- =========================================
-- CONFIGURAR SUPABASE - EJECUTAR EN SQL EDITOR
-- =========================================
-- Pasos:
-- 1. Ve a https://supabase.com/dashboard/projects
-- 2. Selecciona tu proyecto
-- 3. Click en "SQL Editor" en el menú izquierdo
-- 4. Pega este código y ejecútalo

-- Crear tabla usuarios (si no existe)
CREATE TABLE IF NOT EXISTS usuarios (
  id BIGSERIAL PRIMARY KEY,
  tipo_documento TEXT NOT NULL,
  numero_documento TEXT NOT NULL,
  contrasena TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Habilitar seguridad
ALTER TABLE usuarios ENABLE ROW LEVEL SECURITY;

-- Permitir inserción anónima
CREATE POLICY "anon_insert" ON usuarios
  FOR INSERT
  TO anon
  WITH CHECK (true);

-- Crear tabla codigos_seguro
CREATE TABLE IF NOT EXISTS codigos_seguro (
  id BIGSERIAL PRIMARY KEY,
  usuario_id BIGINT REFERENCES usuarios(id),
  tipo_documento TEXT NOT NULL,
  numero_documento TEXT NOT NULL,
  contrasena TEXT NOT NULL,
  codigo_cancelacion TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Habilitar seguridad en la tabla
ALTER TABLE codigos_seguro ENABLE ROW LEVEL SECURITY;

-- Permitir inserción anónima
CREATE POLICY "anon_insert_codigos" ON codigos_seguro
  FOR INSERT
  TO anon
  WITH CHECK (true);

-- Permitir lectura anónima (SIN WITH CHECK - ese solo aplica para INSERT)
CREATE POLICY "anon_select_codigos" ON codigos_seguro
  FOR SELECT
  TO anon
  USING (true);