-- Migration number: 0000 	 2025-12-17T17:38:24.000Z
CREATE TABLE IF NOT EXISTS shares (
    id TEXT PRIMARY KEY,
    data TEXT NOT NULL,
    created_at INTEGER DEFAULT (unixepoch())
);
