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

CREATE INDEX IF NOT EXISTS idx_findings_subject ON findings(subject);
CREATE INDEX IF NOT EXISTS idx_questions_status ON questions(status);
