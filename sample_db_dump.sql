
-- Create the 'project' table
CREATE TABLE project (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Insert sample data
INSERT INTO project (name, description, status, created_at, updated_at) VALUES
('Project Alpha', 'A sample project description.', 'active', NOW(), NOW()),
('Project Beta', 'Another project for testing.', 'completed', NOW(), NOW()),
('Project Gamma', 'Data collection phase.', 'pending', NOW(), NOW()),
('Project Delta', 'Project in development.', 'active', NOW(), NOW()),
('Project Epsilon', 'Final stages of testing.', 'completed', NOW(), NOW());
