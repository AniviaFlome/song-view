-- Migration number: 0000 	 2024-01-01T00:00:00.000Z
CREATE TABLE IF NOT EXISTS shares (
    id TEXT PRIMARY KEY,
    data TEXT NOT NULL,
    created_at INTEGER DEFAULT (unixepoch())
);
