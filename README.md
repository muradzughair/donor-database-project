# Donor Tracking System – Database Design and Development:
  - This repository contains a comprehensive backend solution for managing donor information, event participation, donation tracking, and communication history for organizations involved in charitable work or education support.

# overview:

The Donor Tracking System is designed to serve as a centralized backend platform that enables efficient management of:

- Donor profiles and contact details
- Donation records and history
- Event participation tracking
- Communication and engagement history
- System-level relationships and data integrity

The project focuses on the complete database design and development cycle, from initial requirements to a fully functioning relational database system.

# Core Features

- **Relational Database Design** using proper ER modeling and normalization
- **Five+ Interrelated Tables** with well-defined keys and relationships
- **Referential Integrity** via primary and foreign keys
- **Data Validation Rules** implemented in schema design
- **Query Support** for complex reporting and data extraction
- **Security Features** including user privilege control and maintenance procedures
- **Testing Plan** to validate data integrity and access control

# Database Structure

## Entities:

- **Donors**: stores donor details (name, contact info, occupation, etc.)
- **Events**: information about events organized by the foundation
- **Donations**: logs of all donor contributions
- **Participation**: tracks donor involvement in specific events
- **Communication**: records of interactions and outreach with donors


## Design Highlights

- **ER Model** created with clear cardinalities and participation constraints
- **Normalized Tables** to at least 3NF to remove redundancy and anomalies
- **Logical Design** with accurate SQL schema reflecting real-world use cases
- **Security and Maintenance** measures built into design (e.g., role-based access control)

# Sample Queries

- List of top donors by amount and frequency
- Events with highest donor engagement
- Donor communication history within a date range
- Total contributions by donor over time
- Monthly donation summaries by event

## Testing and Evaluation

- Unit tests for table integrity and relationship enforcement
- Security privilege validation
- Assessment of query accuracy and output relevance
- Flexibility analysis for future scaling and schema extensions

## echnologies Used

- **MySQL**
- **SQL DDL and DML**
- **Draw.io for designing 



## Documentation

- Technical documentation includes schema explanation, diagrams, normalization steps, and flowcharts
