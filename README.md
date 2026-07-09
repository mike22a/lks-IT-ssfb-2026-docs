# LKS IT Software Solution for Business - Competition Preparation

## Overview

This repository contains comprehensive documentation and analysis for the **LKS DIKMEN National 2026** competition in the category of **IT Software Solution for Business**. The documents provide detailed technical specifications, requirements, and implementation guidelines for participants preparing for the competition.

## Competition Information

- **Competition Name**: Teknologi Informasi Piranti Lunak untuk Bisnis (IT Software Solution for Business)
- **Level**: LKS DIKMEN National 2026
- **Duration**: 12 hours (2 days)
- **Modules**: 4 (Mobile Applications x2, Desktop Applications, Software Design)
- **Technology Stack**: Android/Kotlin, .NET/C#, SQL Server, UML Design

## Project Structure

```
lks-IT-ssfb-2026-docs/
├── pdf/                         # Official competition PDFs
├── txt/                         # Searchable text copies
├── Docs/                        # English analysis documents
├── Docs-id/                     # Indonesian analysis documents
├── training-plan/               # ← MAIN TRAINING CONTENT
│   ├── agent_plan/              # Strategy & mentor documents
│   │   ├── objective.md         # Training goals & KPIs
│   │   ├── training_strategy.md # Methodology (20% theory, 30% demo, 40% practice)
│   │   ├── evaluation_criteria.md # Checkpoints & scoring
│   │   ├── mentor_notes.md      # Per-session prep & tips for mentor
│   │   └── mentor_cheatsheet.md # Quick-reference: commands, templates, checklist
│   ├── plan/                    # Session-by-session plans
│   │   ├── session_01.md        # Sesi 1: API Kickoff + Clean Architecture
│   │   ├── session_02.md        # Sesi 2: Application + Infrastructure Layer
│   │   ├── session_03.md        # Sesi 3: Controllers + Business Logic
│   │   ├── session_04.md        # Sesi 4: WinForm + Android Integration
│   │   └── session_05.md        # Sesi 5: Full Integration + Competition Simulation
│   ├── assignments/             # Homework per session
│   │   ├── hw_01.md  → hw_05.md # Homework after each session
│   ├── mock_exam/               # Practice exams (competition simulation)
│   │   ├── mock_exam_01.md      # Mock: API + Desktop Apps (3 hours)
│   │   └── mock_exam_02.md      # Mock: Mobile Android Full Integration (3 hours)
│   └── dotnet-api-example/      # Step-by-step API implementation guides
│       ├── 01-BookstoreApi-GUIDE.md  # Level 1: Basic Clean Architecture
│       ├── 02-LibraryApi-GUIDE.md   # Level 2: Role-based auth + business rules
│       └── 03-HotelApi-GUIDE.md     # Level 3: State machine + reports
├── README.md                    # This file (English)
└── README-id.md                 # Indonesian version
```

## Document Descriptions

### 1. deskripsi-teknis.txt
**Text Copy of Official Technical Description PDF**

This file contains the text copied from the original PDF document (`pdf/lks-it software solution for bussiness-deskripsi-teknis.pdf`) from the competition organizers containing:
- Competition overview and description
- Module specifications and weights
- Assessment criteria and scoring methods
- Technical requirements (hardware/software)
- Competition schedule and timeline
- Health and safety (K3) requirements
- Document flow and information distribution

**Sections**:
1. Pendahuluan (Introduction)
2. Standar Kompetensi Bidang Lomba (Competition Standards)
3. Sistem Penilaian (Assessment System)
4. Format/Struktur Proyek Uji (Test Project Format)
5. Daftar Alat (Equipment List)
6. Daftar Bahan (Materials List)
7. Layout dan Bahan Layout (Layout Specifications)
8. Jadwal Bidang Lomba (Competition Schedule)
9. Prosedur Kesehatan dan Keselamatan Kerja (K3)

### 2. kisi-kisi.txt
**Text Copy of Official Competition Requirements PDF**

This file contains the text copied from the original PDF document (`pdf/lks-it software solution for bussiness-kisi-kisi.pdf`) and outlines the general requirements for each module:
- General requirements (validation, UI standards, naming conventions)
- Desktop Applications (.NET) requirements
- Mobile Applications (Android) requirements
- Software Design requirements

### 3. detailed-breakdown.md
**Detailed Analysis of Technical Description**

This document provides a comprehensive breakdown of the official technical description with:
- Competition structure and schedule
- Detailed module requirements and flows
- Technical requirements (hardware/software)
- Competition rules and restrictions
- Assessment criteria breakdown
- Preparation checklist
- Key success factors

**Key Features**:
- Flow diagrams for each module
- Detailed technology stack specifications
- Assessment criteria with scoring methods
- Preparation timeline and checklist

### 4. competition-requirements-specification.md
**Detailed Technical Specifications**

This document expands on the kisi-kisi with implementation details:
- Detailed requirements for each module
- Code examples and implementation patterns
- API design and development guidelines
- UI/UX design principles
- Database design guidelines
- Assessment criteria with scoring breakdown

**Key Features**:
- Code examples for .NET and Android
- API endpoint specifications
- Database schema examples
- UML diagram guidelines
- Cross-module considerations

## Competition Modules

### Module A: Mobile Applications (Android)
- **Duration**: 3 hours
- **Day**: Day 1
- **Weight**: 25%
- **Focus**: Database design, API development, mobile UI, API integration

### Module B: Desktop Applications (.NET)
- **Duration**: 3 hours
- **Day**: Day 1
- **Weight**: 30%
- **Focus**: Windows Forms, CRUD operations, SQL queries, data visualization

### Module C: Mobile Applications (Android)
- **Duration**: 3 hours
- **Day**: Day 2
- **Weight**: 25%
- **Focus**: Similar to Module A with different requirements

### Module D: Software Design
- **Duration**: 3 hours
- **Day**: Day 2
- **Weight**: 20%
- **Focus**: Requirements analysis, use cases, activity diagrams, UI design

## Technology Stack

### Mobile Applications (Android)
- **IDE**: Android Studio (Panda Stable Version)
- **Language**: Kotlin with Jetpack Compose
- **SDK**: Android SDK API Level 34
- **Emulator**: AVD Manager (Pixel/Pixel XL - API 34)

### Desktop Applications (.NET)
- **IDE**: Microsoft Visual Studio Community Edition 2026
- **Framework**: .NET 8 SDK
- **Database**: Microsoft SQL Server 2022 (RTM)
- **DB Management**: SQL Server Management Studio 21

### Software Design
- **Tool**: Draw.io Desktop Version
- **Documentation**: Microsoft Office 365

## Assessment System

### Measurement (80%)
- Applied to Modules A, B, C
- Binary scoring (0 or 1)
- Based on specific criteria completion
- Deductions for missing components

### Judgement (20%)
- Applied to Module D (Software Design)
- Scaled scoring (0-3)
- Based on quality and industry standards
- Evaluates design effectiveness

## Competition Rules

### Internet & AI Restrictions
- **Internet**: Restricted usage (only for technical needs)
- **AI Tools**: Strictly prohibited (ChatGPT, Copilot, Cursor, Gemini, Claude, etc.)
- **Penalty**: Score reduction up to disqualification

### General Requirements
- ISO date format (YYYY-MM-DD)
- Proper validation and error handling
- Scrollbars for overflowing content
- Centered forms/reports
- Modal dialogs disable background forms
- Proper naming conventions

## Preparation Timeline

### 30 Days Before Competition
- Study technical description and kisi-kisi
- Install and configure development environment
- Practice all module types
- Prepare physical dictionary (English)

### H-1 Competition
- Attend technical meetings
- Attend familiarization session (2 hours)
- Verify all software installations
- Test database connections
- Test development environments

### Competition Days
- **Day 1**: Modules A & B (6 hours total)
- **Day 2**: Modules C & D (6 hours total)
- **Day 3**: Closing and evaluation (1 hour)

## 🎓 Training Hub

> All training materials are located in the [`training-plan/`](./training-plan/) folder.
> Start from the API guides below, then follow the session plans and homework in order.

---

### 📚 Step-by-Step API Guides (Start Here)

Three progressively complex projects — each a complete, runnable example of Clean Architecture:

| Level | Guide | Complexity | Key Features |
|-------|-------|------------|--------------|
| Level 1 | [BookstoreApi Guide](./training-plan/dotnet-api-example/01-BookstoreApi-GUIDE.md) | ⭐ Basic | CRUD, JWT Auth, Repository Pattern |
| Level 2 | [LibraryApi Guide](./training-plan/dotnet-api-example/02-LibraryApi-GUIDE.md) | ⭐⭐ Medium | Role-based Auth, Fine Calculation, Stock Management |
| Level 3 | [HotelApi Guide](./training-plan/dotnet-api-example/03-HotelApi-GUIDE.md) | ⭐⭐⭐ Advanced | State Machine, Date Availability, Revenue Reports |

---

### 🗓️ Training Sessions (5 × 2 Hours)

| Session | Topic | Session Plan | Homework |
|---------|-------|--------------|----------|
| Sesi 1 (10 Jul) | API Kickoff + Clean Architecture Foundation | [session_01.md](./training-plan/plan/session_01.md) | [hw_01.md](./training-plan/assignments/hw_01.md) |
| Sesi 2 (11 Jul) | Application + Infrastructure Layer | [session_02.md](./training-plan/plan/session_02.md) | [hw_02.md](./training-plan/assignments/hw_02.md) |
| Sesi 3 (12 Jul) | Controllers + Business Logic + Error Handling | [session_03.md](./training-plan/plan/session_03.md) | [hw_03.md](./training-plan/assignments/hw_03.md) |
| Sesi 4 (13 Jul) | WinForm + Android Kotlin Integration | [session_04.md](./training-plan/plan/session_04.md) | [hw_04.md](./training-plan/assignments/hw_04.md) |
| Sesi 5 (14 Jul) | Full Integration + Competition Simulation | [session_05.md](./training-plan/plan/session_05.md) | [hw_05.md](./training-plan/assignments/hw_05.md) |

---

### 🏁 Practice Exams (Competition Simulation)

| Mock Exam | Focus | Duration |
|-----------|-------|----------|
| [Mock Exam 01](./training-plan/mock_exam/mock_exam_01.md) | API (Clean Architecture) + Desktop WinForm | 3 hours |
| [Mock Exam 02](./training-plan/mock_exam/mock_exam_02.md) | Mobile Android Full Integration | 3 hours |

---

### 🧑‍🏫 Mentor Resources

| Document | Purpose |
|----------|---------|
| [mentor_cheatsheet.md](./training-plan/agent_plan/mentor_cheatsheet.md) | 🔑 One-page reference: all CLI commands, code templates, competition checklist |
| [mentor_notes.md](./training-plan/agent_plan/mentor_notes.md) | Per-session prep tips, common pitfalls, troubleshooting |
| [training_strategy.md](./training-plan/agent_plan/training_strategy.md) | Training methodology & adaptation strategy |
| [evaluation_criteria.md](./training-plan/agent_plan/evaluation_criteria.md) | Checkpoints, scoring rubric, pass/fail criteria |
| [objective.md](./training-plan/agent_plan/objective.md) | Training goals, KPIs, success criteria |

---

### For Participants
1. **Start with `pdf/lks-it software solution for bussiness-deskripsi-teknis.pdf`** to view the original official competition structure
2. **Review `pdf/lks-it software solution for bussiness-kisi-kisi.pdf`** to view the original official competition requirements
3. **Study `Docs/detailed-breakdown.md`** for comprehensive analysis and preparation guidelines
4. **Follow the session plans** in order: `session_01.md` → `session_05.md`
5. **Complete each homework** before the next session
6. **Practice with mock exams** after Sesi 5 to simulate competition conditions

### For Mentors/Coaches
1. 📋 Open **[mentor_cheatsheet.md](./training-plan/agent_plan/mentor_cheatsheet.md)** — keep it open during every session for fast copy-paste
2. 📝 Read **[mentor_notes.md](./training-plan/agent_plan/mentor_notes.md)** before each session for per-session tips
3. 📖 Show students the **API Guides** as living references they can run and modify
4. ⏱️ Use **Mock Exams** in Sesi 5 with a real timer to simulate competition pressure

## Key Success Factors

### Technical Skills
- Strong database design skills
- API development expertise
- Mobile application development (Android/Kotlin)
- Desktop application development (.NET/C#)
- SQL query optimization
- UI/UX design principles
- Software documentation skills

### Time Management
- Effective task prioritization
- Quick requirement analysis
- Efficient coding practices
- Proper testing within time constraints

### Quality Standards
- Clean code practices
- Proper error handling
- Consistent naming conventions
- Comprehensive validation
- User-friendly interfaces

### Compliance
- Strict adherence to competition rules
- No AI tool usage
- Proper internet usage
- Following technical specifications
- Meeting all assessment criteria

## Important Notes

- All documents are based on LKS DIKMEN National 2026 official specifications
- Original official PDF documents are located in the `pdf/` folder
- Text files in `txt/` folder are searchable text copies extracted from the original PDFs
- Markdown analysis documents in `Docs/` folder are analysis documents for preparation purposes
- Always refer to the original PDF documents in `pdf/` folder for final competition requirements
- Updates may be published on the official Puspresnas website

## Official Resources

- **Official Website**: https://smk.pusatprestasinasional.kemdikbud.go.id/lks
- **Document Publication**: Technical Description and Kisi-kisi published via Puspresnas
- **Test Project Distribution**: Download from Puspresnas using participant/mentor accounts

## Document Versions

- **pdf/lks-it software solution for bussiness-deskripsi-teknis.pdf**: Official document from LKS DIKMEN National 2026
- **pdf/lks-it software solution for bussiness-kisi-kisi.pdf**: Official document from LKS DIKMEN National 2026
- **txt/deskripsi-teknis.txt**: Text copy extracted from original PDF
- **txt/kisi-kisi.txt**: Text copy extracted from original PDF
- **Docs/detailed-breakdown.md**: Version 1.0 (Analysis document)
- **Docs/competition-requirements-specification.md**: Version 1.0 (Specification document)
- **README.md**: Version 1.0

## License

This repository contains analysis documents for competition preparation purposes. The official competition documents (PDF files in the `pdf/` folder) are property of LKS DIKMEN National 2026 organizers.

## Contact

For official competition information, please contact the LKS DIKMEN National organizers through the official Puspresnas website.

---

**Last Updated**: 9 Juli 2026
**Competition**: LKS DIKMEN National 2026 - IT Software Solution for Business
**Training Period**: 10 – 14 Juli 2026 | **Competition Day**: 27 Juli 2026 (earliest)
