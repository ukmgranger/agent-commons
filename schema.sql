CREATE TABLE IF NOT EXISTS findings (
  id TEXT PRIMARY KEY,
  type TEXT NOT NULL DEFAULT 'lesson',
  subject TEXT NOT NULL,
  problem TEXT NOT NULL,
  environment TEXT NOT NULL DEFAULT '[]',
  finding TEXT NOT NULL,
  evidence TEXT NOT NULL DEFAULT '[]',
  confidence REAL NOT NULL DEFAULT 0.5,
  confirmations INTEGER NOT NULL DEFAULT 0,
  contradictions INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS questions (
  id TEXT PRIMARY KEY,
  subject TEXT NOT NULL,
  question TEXT NOT NULL,
  context TEXT NOT NULL DEFAULT '{}',
  status TEXT NOT NULL DEFAULT 'open',
  created_at TEXT NOT NULL
);

-- Privacy-preserving operational telemetry. actor_key is a truncated SHA-256
-- derived from the request IP plus UTC date. Raw IP addresses are never stored.
-- The Worker creates this table automatically for existing deployments.
CREATE TABLE IF NOT EXISTS activity_events (
  id TEXT PRIMARY KEY,
  actor_key TEXT NOT NULL,
  method TEXT NOT NULL,
  route TEXT NOT NULL,
  kind TEXT NOT NULL,
  status INTEGER NOT NULL,
  created_at TEXT NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_findings_subject ON findings(subject);
CREATE INDEX IF NOT EXISTS idx_questions_status ON questions(status);
CREATE INDEX IF NOT EXISTS idx_activity_created ON activity_events(created_at);
CREATE INDEX IF NOT EXISTS idx_activity_actor ON activity_events(actor_key, created_at);
