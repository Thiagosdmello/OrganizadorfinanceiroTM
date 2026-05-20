-- ════════════════════════════════════════════════════
-- SALÁRIO ORGANIZER — Setup do banco de dados Supabase
-- Execute este SQL no SQL Editor do seu projeto Supabase
-- ════════════════════════════════════════════════════

-- 1. Criar tabela principal
CREATE TABLE IF NOT EXISTS sal_meses (
  id          uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id     uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  mes         smallint NOT NULL CHECK (mes >= 0 AND mes <= 11),
  ano         smallint NOT NULL CHECK (ano >= 2000 AND ano <= 2100),
  dados       jsonb NOT NULL DEFAULT '{}',
  updated_at  timestamptz DEFAULT now(),
  UNIQUE (user_id, mes, ano)
);

-- 2. Índice para buscas rápidas por usuário
CREATE INDEX IF NOT EXISTS idx_sal_meses_user ON sal_meses (user_id, ano DESC, mes DESC);

-- 3. Habilitar Row Level Security (RLS) — obrigatório!
ALTER TABLE sal_meses ENABLE ROW LEVEL SECURITY;

-- 4. Policies: cada usuário só acessa os próprios dados
CREATE POLICY "select_own" ON sal_meses
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "insert_own" ON sal_meses
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "update_own" ON sal_meses
  FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "delete_own" ON sal_meses
  FOR DELETE USING (auth.uid() = user_id);

-- ════════════════════════════════════════════════════
-- CONFIGURAÇÕES DE AUTH (faça no painel do Supabase)
-- ════════════════════════════════════════════════════
-- Authentication > Settings:
--   • "Confirm email" → DESLIGADO (para não precisar confirmar e-mail)
--   • Site URL        → https://seu-app.vercel.app
--   • Redirect URLs   → https://seu-app.vercel.app/**
-- ════════════════════════════════════════════════════
