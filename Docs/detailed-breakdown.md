# LKS IT Software Solution for Business - Detailed Breakdown

## 1. Competition Overview

### 1.1 Competition Name
**Teknologi Informasi Piranti Lunak untuk Bisnis (IT Software Solution for Business)**

### 1.2 Competition Description
This competition focuses on developing software solutions to improve business productivity. It encompasses various skills and disciplines, with emphasis on:
- Awareness of rapidly changing industry characteristics
- Ability to keep up with technological changes
- Working closely with clients to modify existing systems or create new ones
- Backend-oriented development work

### 1.3 Target Competency
The competition measures knowledge and understanding through performance-based testing. The difficulty level is adjusted to:
- DIKMEN education curriculum
- Average participant ability (based on previous LKS National data)
- Participant comfort in completing test projects
- WorldSkills Occupational Standards (WSOS) compliance

---

## 2. Competition Structure & Schedule

### 2.1 Module Breakdown

| Module | Duration | Day | Weight | Technology |
|--------|----------|-----|--------|------------|
| A: Mobile Applications (Android) | 3 hours | Day 1 | 25% | Android Studio, Kotlin, Jetpack Compose |
| B: Desktop Applications (.NET) | 3 hours | Day 1 | 30% | Visual Studio 2026, .NET 8, Windows Forms |
| C: Mobile Applications (Android) | 3 hours | Day 2 | 25% | Android Studio, Kotlin, Jetpack Compose |
| D: Software Design | 3 hours | Day 2 | 20% | Draw.io, UML Diagrams |
| **Total** | **12 hours** | **2 days** | **100%** | |

### 2.2 Detailed Schedule

#### Pre-Competition (30 days before)
- **Technical Meeting 1** (1 hour): Technical competition discussion (Judges, Mentors & Participants)

#### H-1 Competition
- **Technical Meeting 2** (1 hour): Competition implementation discussion (Judges, Mentors & Participants)
- **Familiarization** (2 hours): Tools and materials familiarization

#### Day 1 (H1)
- **07:00 - 07:30**: Briefing Module A: Mobile Applications (Android) - 30 minutes
- **07:30 - 10:30**: Competition Module A: Mobile Applications (Android) - 3 hours
- **10:30 - 11:30**: Break, Prayer and Meal - 1 hour
- **11:30 - 12:00**: Briefing Module B: Desktop Applications (.NET) - 30 minutes
- **12:00 - 15:00**: Competition Module B: Desktop Applications (.NET) - 3 hours

#### Day 2 (H2)
- **07:00 - 07:30**: Briefing Module C: Mobile Applications (Android) - 30 minutes
- **07:30 - 10:30**: Competition Module C: Mobile Applications (Android) - 3 hours
- **10:30 - 11:30**: Break, Prayer and Meal - 1 hour
- **11:30 - 12:00**: Briefing Module D: Software Design - 30 minutes
- **12:00 - 15:00**: Competition Module D: Software Design - 3 hours

#### Day 3 (H3)
- **08:00 - 09:00**: Closing and Competition Evaluation - 1 hour

---

## 3. Module Details & Requirements

### 3.1 Module A & C: Mobile Applications (Android)

#### Flow Process
```
1. Requirements Analysis
   ↓
2. Database Design
   ↓
3. API Development
   ↓
4. Mobile UI Implementation
   ↓
5. API Integration
   ↓
6. Testing & Validation
```

#### Detailed Requirements

**Database & API Development:**
- Design database schema based on requirements
- Build API according to endpoint contract
- Implement correct business logic for each endpoint
- Define API endpoints with proper:
  - HTTP methods (GET, POST, PUT, DELETE)
  - Headers (Content-Type, Authorization)
  - Parameters (query params, path params)
  - Request bodies (JSON format)
  - Response codes (200, 201, 400, 401, 404, 500)
  - Response headers and bodies

**API Response Standards:**
- Consistent response format across all endpoints
- Handle negative cases (invalid input, missing data)
- Proper error handling with meaningful error messages
- Consumable API responses for mobile integration

**Mobile Application Development:**
- Analyze requirements and implement in mobile app
- Create UI components based on requirements
- Implement proper UI/UX principles
- Follow Material Design guidelines

**Data Operations:**
- Integrate mobile app with API
- Implement CRUD operations (Create, Read, Update, Delete)
- Implement searching functionality
- Implement filtering functionality
- Export data to external files (CSV, PDF, etc.)

**General Requirements:**
- Proper validation for all inputs
- Clear error messages
- Scrollbars when content exceeds screen
- ISO date format (YYYY-MM-DD)
- Proper naming conventions
- Centered forms/reports
- Modal dialogs disable background forms

#### Technology Stack
- **IDE**: Android Studio (Panda Stable Version)
- **Language**: Kotlin with Jetpack Compose
- **SDK**: Android SDK API Level 34
- **Emulator**: AVD Manager (Pixel/Pixel XL - API 34)
- **Build Tools**: Platform-Tools, Build-Tools

#### Assessment Criteria (25% each for Modules A & C)
- **Measurement (100%)**: Binary scoring (1 if meets criteria, 0 if not)
  - Proper UI implementation
  - Validation implementation
  - API integration
  - CRUD operations
  - Search and filter functionality
  - Data export capability

---

### 3.2 Module B: Desktop Applications (.NET)

#### Flow Process
```
1. Database Import/Setup
   ↓
2. Windows Forms Creation
   ↓
3. Data Connection Implementation
   ↓
4. CRUD Operations Implementation
   ↓
5. Query Implementation (JOIN, Aggregate)
   ↓
6. Data Visualization (Charts)
   ↓
7. Access Control & Security
   ↓
8. Testing & Validation
```

#### Detailed Requirements

**Database Integration:**
- Import databases from external sources (database files or API)
- Build and manage desktop application connection to MS SQL Server
- Support both direct connection and API-based connection
- Handle connection pooling and error management

**Windows Forms Development:**
- Create Windows Forms based on requirements
- Design UI components (TextBox, ComboBox, DataGridView, Buttons, etc.)
- Implement proper layout and navigation
- Apply consistent styling across forms

**Data Operations:**
- Display and manage database records
- Implement CRUD operations (Create, Read, Update, Delete)
- Implement search functionality
- Implement filtering functionality
- Use DataGridView for data manipulation

**Advanced Query Operations:**
- Process data using relational queries
- Implement JOIN queries (INNER, LEFT, RIGHT, FULL)
- Implement aggregate queries (COUNT, SUM, AVG, MIN, MAX)
- Handle complex data relationships

**Data Visualization:**
- Present data in visual formats
- Implement charts (Bar, Line, Pie, etc.)
- Configure chart properties (labels, legends, colors)
- Handle dynamic data updates in charts

**Security & Access Control:**
- Implement user role-based menu access restrictions
- Apply input validation
- Implement basic security measures
- Handle errors gracefully

**General Requirements:**
- Proper validation for all inputs
- Clear error messages
- Scrollbars when content exceeds screen
- ISO date format (YYYY-MM-DD)
- Proper naming conventions
- Centered forms/reports
- Modal dialogs disable background forms

#### Technology Stack
- **IDE**: Microsoft Visual Studio Community Edition 2026
- **Framework**: .NET 8 SDK
- **Workloads**: 
  - .NET Desktop Development
  - ASP.NET and Web Development
  - .NET Multi-platform App UI (.NET MAUI) - optional
- **Database**: Microsoft SQL Server 2022 (RTM)
- **DB Management**: SQL Server Management Studio 21
- **NuGet Packages**:
  - Microsoft.EntityFrameworkCore
  - Microsoft.EntityFrameworkCore.SqlServer
  - Microsoft.EntityFrameworkCore.Tools
  - Swashbuckle.AspNetCore
  - Microsoft.AspNetCore.Authentication.JwtBearer

#### Assessment Criteria (30%)
- **Measurement (100%)**: Binary scoring (1 if meets criteria, 0 if not)
  - Database connection implementation
  - CRUD operations
  - Query implementation (JOIN, aggregate)
  - Data visualization (charts)
  - Input validation
  - Search and filter functionality
  - Access control implementation
  - Error handling

---

### 3.3 Module D: Software Design

#### Flow Process
```
1. Requirements Analysis
   ↓
2. Requirements Documentation
   ↓
3. Use Case Development
   ↓
4. Activity Diagram Creation
   ↓
5. UI Design (Desktop & Mobile)
   ↓
6. Documentation & Presentation
```

#### Detailed Requirements

**Requirements Analysis & Documentation:**
- Analyze requirements based on user needs
- Analyze requirements based on system needs
- Document requirements clearly and comprehensively
- Identify functional and non-functional requirements
- Define system boundaries and scope

**Use Case Development:**
- Develop use cases representing user-system interactions
- Identify actors (users, external systems)
- Define use case scenarios (happy path, alternative paths)
- Document use case descriptions
- Create use case diagrams

**Activity Diagram Modeling:**
- Model system workflows using activity diagrams
- Represent business processes and logic flows
- Show decision points and branching
- Include start and end points
- Follow UML standards

**UI Design:**
- Design user interfaces for desktop applications
- Design user interfaces for mobile applications
- Ensure designs meet functional requirements
- Apply usability principles
- Create wireframes/mockups
- Consider responsive design for mobile

**General Requirements:**
- Proper naming conventions
- Clear documentation
- Follow UML standards
- Wireframes are reference only (modifications permitted if functionality unaffected)
- Pay attention to time management

#### Technology Stack
- **Diagram Tool**: Draw.io Desktop Version
- **Documentation**: Microsoft Office 365 Home/Education

#### Assessment Criteria (20%)
- **Judgement (100%)**: Subjective scoring (0-3 scale)
  - **0**: Performance below industry standard
  - **1**: Performance meets industry standard
  - **2**: Performance exceeds industry standard
  - **3**: Extraordinary performance matching or exceeding current industry expectations

**Aspects Assessed:**
- Effectiveness of visual communication
- Clarity of requirements documentation
- Completeness of use cases
- Accuracy of activity diagrams
- Usability of UI designs
- Overall design quality

---

## 4. General Requirements (All Modules)

### 4.1 Validation & Error Handling
- Each module must include proper validation
- Clear and meaningful error messages
- Handle negative cases appropriately
- Graceful error recovery

### 4.2 UI/UX Standards
- Scrollbars must be displayed when content exceeds screen
- All forms/reports must be centered on screen
- When a form/dialog is in focus, other forms must be disabled
- Wireframes are reference only (modifications permitted if functionality unaffected)

### 4.3 Data Standards
- Use ISO-compliant date format: YYYY-MM-DD for all date fields
- Proper naming conventions for all submitted materials
- Consistent data formatting across modules

### 4.4 Time Management
- Pay close attention to allocated working time
- Manage available time effectively
- Prioritize tasks based on weight and complexity

---

## 5. Assessment System

### 5.1 Assessment Methods
Two assessment methods are used:

#### Judgement Assessment
- **Purpose**: Assess performance quality where subjective differences may exist
- **Scale**: 0-3 points
  - 0: Below industry standard (including not attempted)
  - 1: Meets industry standard
  - 2: Exceeds industry standard
  - 3: Extraordinary, matches or exceeds current industry expectations
- **Usage**: Software Design module (Module D)

#### Measurement Assessment
- **Purpose**: Assess accuracy, precision, and objectively measurable performance
- **Scale**: Binary (1 if meets criteria, 0 if not)
- **Usage**: Mobile Applications (Modules A & C) and Desktop Applications (Module B)

### 5.2 Score Conversion
- Initial score: 0-100 scale
- Converted to WorldSkills scale: 0-700
- Ranking determination:
  - Juara 1, 2, 3 based on converted scores
  - Medallion of Excellence for scores above 700
  - Overall ranking of all participants

### 5.3 Assessment Composition

| Module | Judgement | Measurement | Total |
|--------|-----------|-------------|-------|
| A: Mobile Applications | 0% | 25% | 25% |
| B: Desktop Applications | 0% | 30% | 30% |
| C: Mobile Applications | 0% | 25% | 25% |
| D: Software Design | 20% | 0% | 20% |
| **Total** | **20%** | **80%** | **100%** |

---

## 6. Technical Requirements

### 6.1 Hardware Requirements (Participant Provided)

#### Computer/Laptop
- **Processor**: Intel Core i5 8th generation or higher
- **RAM**: Minimum 16 GB
- **Storage**: SSD minimum 256 GB
- **Network**: Wi-Fi dongle (optional for desktop without internal Wi-Fi)
- **Monitor**: 20-24 inches (required for desktop users)
- **Quantity**: 1 device (backup recommended)
- **Condition**: Fresh install recommended (no personal data)

#### Input Devices
- **Mouse**: Wired, non-programmable, no memory (1 + 1 backup)
- **Keyboard**: Wired, non-programmable, no memory (1 + 1 backup)

#### Camera
- **Type**: External Web Camera
- **Resolution**: Minimum 1024 x 768
- **Frame Rate**: 30 FPS
- **Mount**: Tripod stand
- **Quantity**: 2 units (laptop webcam can substitute for one)

### 6.2 Software Requirements (Participant Provided)

| Software | Specification |
|----------|---------------|
| **Operating System** | Windows 10 or 11, 64-bit |
| **Microsoft Office** | Microsoft Office 365 Home/Education |
| **Visual Studio 2026** | Community Edition with workloads: <br>• .NET Desktop Development <br>• ASP.NET and Web Development <br>• .NET MAUI (optional) <br>• .NET 8 SDK <br>NuGet Packages: <br>• Microsoft.EntityFrameworkCore <br>• Microsoft.EntityFrameworkCore.SqlServer <br>• Microsoft.EntityFrameworkCore.Tools <br>• Swashbuckle.AspNetCore <br>• Microsoft.AspNetCore.Authentication.JwtBearer |
| **SQL Server** | Microsoft SQL Server 2022 (RTM) |
| **SSMS** | SQL Server Management Studio 21 |
| **Android Studio** | Panda Stable Version with: <br>• Android SDK (Platform-Tools, Build-Tools) <br>• Android SDK API Level 34 <br>• AVD Manager (Pixel/Pixel XL - API 34) <br>• Kotlin with Jetpack Compose |
| **Draw.io** | Desktop Version |
| **Browser** | Google Chrome latest version |
| **Zoom** | Zoom Workplace |

### 6.3 Software Installation Requirements
- All software must be installed before familiarization session
- Dependencies must be verified during familiarization
- Any changes during competition require jury approval

---

## 7. Layout dan Bahan Layout

**Note**: This section contains technical layout and venue specifications for the competition committee/organizers. It is not directly relevant to participant preparation but is included for document completeness.

### 7.1 Layout Requirements
- Competition venue layout must consider evacuation routes to safe areas
- Exit access and placement of goods must follow safety standards
- Layout design must accommodate all competition requirements

### 7.2 Material Layout
- Electrical installations must meet high safety standards
- Cable layout must follow proper specifications
- Component quality, cable paths, connections, MCB and terminal installations must comply with specifications
- High humidity or water-containing items must be placed away from electrical components

**Note**: Detailed layout specifications and material requirements are managed by the competition committee and are not part of participant assessment criteria.

---

## 8. Schedule and Timeline

### 8.1 Pre-Competition (30 days before)
- **Technical Meeting 1** (1 hour): Technical competition discussion (Judges, Mentors & Participants)

### 8.2 H-1 Competition
- **Technical Meeting 2** (1 hour): Competition implementation discussion (Judges, Mentors & Participants)
- **Familiarization** (2 hours): Tools and materials familiarization

### 8.3 Day 1 (H1)
- **07:00 - 07:30**: Briefing Module A: Mobile Applications (Android) - 30 minutes
- **07:30 - 10:30**: Competition Module A: Mobile Applications (Android) - 3 hours
- **10:30 - 11:30**: Break, Prayer and Meal - 1 hour
- **11:30 - 12:00**: Briefing Module B: Desktop Applications (.NET) - 30 minutes
- **12:00 - 15:00**: Competition Module B: Desktop Applications (.NET) - 3 hours

### 8.4 Day 2 (H2)
- **07:00 - 07:30**: Briefing Module C: Mobile Applications (Android) - 30 minutes
- **07:30 - 10:30**: Competition Module C: Mobile Applications (Android) - 3 hours
- **10:30 - 11:30**: Break, Prayer and Meal - 1 hour
- **11:30 - 12:00**: Briefing Module D: Software Design - 30 minutes
- **12:00 - 15:00**: Competition Module D: Software Design - 3 hours

### 8.5 Day 3 (H3)
- **08:00 - 09:00**: Closing and Competition Evaluation - 1 hour

---

## 9. Competition Rules & Restrictions

### 9.1 Format & Delivery
- Competition conducted online (daring)
- Each participant uses their own computer/laptop at competition location
- Material Test Project (MTP) measures all competency specifications
- Test project is closed and only opened during competition
- MTP presented in English (physical dictionary allowed for translation)

### 9.2 Internet & AI Restrictions
- **Internet Usage**: Restricted
  - Not allowed for browsing references
  - Not allowed for searching solutions
  - Not allowed for AI tools usage
  - Allowed only for: competition platform access, result submission, Gradle sync (Android module)

- **AI Tools**: Strictly prohibited
  - ChatGPT
  - GitHub Copilot
  - Cursor AI
  - Gemini
  - Claude
  - Any AI autocomplete features
  - **Penalty**: Score reduction up to disqualification

### 9.3 Tool Usage
- Must use specified devices, software, and environment
- Cannot replace or use tools outside competition requirements
- Special changes require jury approval
- Jury can reject unnecessary or non-compliant changes

### 9.4 Familiarization Session
- Duration: Maximum 2 hours on H-1
- Purpose: Verify devices, software, dependencies, and technical needs
- Ensure everything works properly before competition starts

---

## 10. Health & Safety (K3) Requirements

### 10.1 General Principles
- Health and safety are priority principles for all parties
- Refers to LKS DIKMEN National 2026 Technical Guidelines

### 10.2 Specific Requirements
- Always prioritize health and safety during competition
- Layout must consider evacuation routes to safe areas
- Electrical installations must meet high safety standards
- Attention to component quality, cable layout, connections
- All parties must monitor activities and movement to prevent damage
- High humidity or water-containing items must be kept away from electrical components
- Mineral water cannot be stored open or near electrical components during competition

---

## 11. Document Flow & Information Distribution

### 11.1 Document Publication
- Technical Description and Question Grid published via Puspresnas: https://smk.pusatprestasinasional.kemdikbud.go.id/lks
- Any updates or improvements republished on the same page

### 11.2 Test Project Distribution
- Test projects uploaded to Puspresnas website
- Participants and mentors download using participant/mentor accounts
- Download timing specified in General Guidelines

### 11.3 Related Documents
- General Technical Guidelines for competition
- Information in participant, mentor, and contingency accounts:
  - Technical Description of Competition Field
  - Question Grid
  - Material Requirements Form
  - Material Requirements Sheet

---

## 12. Preparation Checklist

### 12.1 Pre-Competition (30 days before)
- [ ] Attend Technical Meeting 1
- [ ] Study Technical Description document
- [ ] Study Question Grid (Kisi-kisi)
- [ ] Prepare all required software
- [ ] Install and configure development environment
- [ ] Practice all module types
- [ ] Prepare physical dictionary (English)

### 12.2 H-1 Competition
- [ ] Attend Technical Meeting 2
- [ ] Attend Familiarization session (2 hours)
- [ ] Verify all software installations
- [ ] Test database connections
- [ ] Test Android Studio and AVD
- [ ] Test Visual Studio and .NET environment
- [ ] Verify camera setup
- [ ] Ensure fresh computer state (no personal data)

### 12.3 Day 1 Competition
- [ ] Attend Module A briefing
- [ ] Complete Module A: Mobile Applications (3 hours)
- [ ] Attend Module B briefing
- [ ] Complete Module B: Desktop Applications (3 hours)

### 12.4 Day 2 Competition
- [ ] Attend Module C briefing
- [ ] Complete Module C: Mobile Applications (3 hours)
- [ ] Attend Module D briefing
- [ ] Complete Module D: Software Design (3 hours)

### 12.5 Day 3 Competition
- [ ] Attend closing and evaluation session

---

## 13. Key Success Factors

### 13.1 Technical Skills
- Strong database design skills
- API development expertise
- Mobile application development (Android/Kotlin)
- Desktop application development (.NET/C#)
- SQL query optimization
- UI/UX design principles
- Software documentation skills

### 13.2 Time Management
- Effective task prioritization
- Quick requirement analysis
- Efficient coding practices
- Proper testing within time constraints

### 13.3 Quality Standards
- Clean code practices
- Proper error handling
- Consistent naming conventions
- Comprehensive validation
- User-friendly interfaces

### 13.4 Compliance
- Strict adherence to competition rules
- No AI tool usage
- Proper internet usage
- Following technical specifications
- Meeting all assessment criteria

---

## 14. Summary of Core Competencies

### Module A & C: Mobile Applications (Android) - 50% Total
- Database design and API development
- API endpoint implementation with proper contracts
- Consistent API responses with error handling
- Mobile UI implementation based on requirements
- API integration for data operations (CRUD, search, filter, export)

### Module B: Desktop Applications (.NET) - 30%
- Database connection management (direct or via API)
- Data display and manipulation (CRUD, DataGridView)
- Advanced queries (JOIN, aggregate)
- Input validation and access control
- Data visualization (charts)
- Basic security and error handling

### Module D: Software Design - 20%
- Requirements analysis and documentation
- Use case development
- Activity diagram modeling
- UI design for desktop and mobile
- Adherence to usability principles

---

**Document Version**: 1.0  
**Based on**: LKS DIKMEN National 2026 Technical Description  
**Competition**: IT Software Solution for Business  
**Last Updated**: 2026
