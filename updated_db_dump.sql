
-- Create the 'project' table
CREATE TABLE project (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Create the 'client' table
CREATE TABLE client (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(50),
    created_at TIMESTAMP DEFAULT NOW()
);

-- Create the 'employee' table
CREATE TABLE employee (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255),
    position VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);

-- Create the 'task' table
CREATE TABLE task (
    id SERIAL PRIMARY KEY,
    project_id INT REFERENCES project(id) ON DELETE CASCADE,
    employee_id INT REFERENCES employee(id) ON DELETE SET NULL,
    title VARCHAR(255),
    description TEXT,
    status VARCHAR(50),
    due_date DATE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Add a foreign key to link 'project' to 'client'
ALTER TABLE project ADD COLUMN client_id INT REFERENCES client(id) ON DELETE SET NULL;

-- Insert sample data into 'client' table
INSERT INTO client (name, email, phone) VALUES
('ACME Corp', 'contact@acme.com', '+123456789'),
('Globex Inc', 'support@globex.com', '+987654321');

-- Insert sample data into 'project' table
INSERT INTO project (name, description, status, client_id) VALUES
('Project Alpha', 'A sample project description.', 'active', 1),
('Project Beta', 'Another project for testing.', 'completed', 2),
('Project Gamma', 'Data collection phase.', 'pending', 1);

-- Insert sample data into 'employee' table
INSERT INTO employee (first_name, last_name, email, position) VALUES
('John', 'Doe', 'john.doe@example.com', 'Developer'),
('Jane', 'Smith', 'jane.smith@example.com', 'Manager'),
('Alice', 'Johnson', 'alice.johnson@example.com', 'Analyst');

-- Insert sample data into 'task' table
INSERT INTO task (project_id, employee_id, title, description, status, due_date) VALUES
(1, 1, 'Develop Feature A', 'Implement the new feature for Project Alpha.', 'in-progress', '2024-12-01'),
(1, 2, 'Review Code', 'Review the code for the new feature.', 'pending', '2024-11-20'),
(2, 3, 'Data Analysis', 'Analyze the data collected.', 'completed', '2024-10-15'),
(3, NULL, 'Documentation', 'Write project documentation.', 'in-progress', '2024-12-15');
