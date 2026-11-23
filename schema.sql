
-- Peak Performance Personal Training
-- ISM3232 Week 13 Final Project

CREATE TABLE IF NOT EXISTS training_packages (
    package_id TEXT PRIMARY KEY,
    package_name TEXT NOT NULL,
    sessions_included INTEGER NOT NULL,
    price REAL NOT NULL
);

CREATE TABLE IF NOT EXISTS appointments (
    appointment_id TEXT PRIMARY KEY,
    client_name TEXT NOT NULL,
    trainer_name TEXT NOT NULL,
    session_date TEXT NOT NULL,
    status TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS change_requests (
    request_id INTEGER PRIMARY KEY AUTOINCREMENT,
    appointment_id TEXT NOT NULL,
    requested_date TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'waiting'
);

-- Sample training packages
INSERT OR IGNORE INTO training_packages
(package_id, package_name, sessions_included, price)
VALUES
('P001', 'Single Session', 1, 60.00),
('P002', 'Five Sessions', 5, 275.00),
('P003', 'Ten Sessions', 10, 500.00),
('P004', 'Two Sessions', 2, 115.00),
('P005', 'Twenty Sessions', 20, 950.00);

-- Sample appointments
INSERT OR IGNORE INTO appointments
(appointment_id, client_name, trainer_name, session_date, status)
VALUES
('A101', 'Jordan Lee', 'Alex Smith', '2026-12-01 10:00', 'scheduled'),
('A102', 'Taylor Reed', 'Alex Smith', '2026-12-02 11:00', 'scheduled'),
('A103', 'Morgan Hill', 'Sam Davis', '2026-12-03 09:00', 'scheduled'),
('A104', 'Casey Brown', 'Sam Davis', '2026-12-04 14:00', 'scheduled'),
('A105', 'Jamie Clark', 'Alex Smith', '2026-12-05 15:00', 'scheduled');
