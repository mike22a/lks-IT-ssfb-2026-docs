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
├── pdf/
│   ├── lks-it software solution for bussiness-deskripsi-teknis.pdf  # Original official technical description PDF
│   └── lks-it software solution for bussiness-kisi-kisi.pdf          # Original official competition requirements PDF
│   └── previous-year/                                                      # Previous year competition papers
├── txt/
│   ├── deskripsi-teknis.txt                    # Text copied from original PDF (technical description)
│   ├── kisi-kisi.txt                            # Text copied from original PDF (competition requirements)
│   ├── standar-software.txt                    # Standard software requirements
│   └── training-structure-folder.md             # Training plan folder structure
├── Docs/
│   ├── detailed-breakdown.md                    # Detailed analysis of technical description
│   └── competition-requirements-specification.md  # Detailed technical specifications
├── Docs-id/
│   ├── detailed-breakdown-id.md                # Indonesian translation of detailed-breakdown.md
│   └── competition-requirements-specification-id.md  # Indonesian translation of competition-requirements-specification.md
├── training-plan/
│   ├── agent_plan/
│   │   ├── objective.md                        # Training objectives and success criteria
│   │   ├── training_strategy.md                # Training methodology and strategy
│   │   ├── evaluation_criteria.md              # Evaluation criteria and checkpoints
│   │   └── mentor_notes.md                     # Notes for mentor per session
│   ├── plan/
│   │   ├── session_01.md                       # Session 1: API .NET Foundation
│   │   ├── session_02.md                       # Session 2: API .NET Advanced
│   │   ├── session_03.md                       # Session 3: Desktop Apps Foundation
│   │   ├── session_04.md                       # Session 4: Desktop Apps Database Integration
│   │   ├── session_05.md                       # Session 5: Desktop Apps Advanced Features
│   │   ├── session_06.md                       # Session 6: Mobile Android Foundation
│   │   ├── session_07.md                       # Session 7: Mobile Android API Integration
│   │   └── session_08.md                       # Session 8: Review & Practice
│   ├── assignments/
│   │   ├── hw_01.md                            # Homework for Session 1
│   │   ├── hw_02.md                            # Homework for Session 2
│   │   ├── hw_03.md                            # Homework for Session 3
│   │   ├── hw_04.md                            # Homework for Session 4
│   │   ├── hw_05.md                            # Homework for Session 5
│   │   ├── hw_06.md                            # Homework for Session 6
│   │   ├── hw_07.md                            # Homework for Session 7
│   │   └── hw_08.md                            # Homework for Session 8
│   └── mock_exam/
│       ├── mock_exam_01.md                     # Mock exam: API .NET & Desktop Apps
│       └── mock_exam_02.md                     # Mock exam: Mobile Android Full Integration
├── daily-plans/
│   ├── session-01.md                           # Legacy session files (moved to training-plan/plan/)
│   ├── session-02.md
│   ├── session-03.md
│   ├── session-04.md
│   ├── session-05.md
│   ├── session-06.md
│   ├── session-07.md
│   └── session-08.md
├── plan.md                                      # Overall training plan overview
├── README.md                                    # This file
├── README-id.md                                 # Indonesian version of README.md
└── .gitignore                                   # Git ignore rules
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

## How to Use This Repository

### For Participants
1. **Start with `pdf/lks-it software solution for bussiness-deskripsi-teknis.pdf`** to view the original official competition structure
2. **Review `pdf/lks-it software solution for bussiness-kisi-kisi.pdf`** to view the original official competition requirements
3. **Reference `txt/deskripsi-teknis.txt`** for searchable text copy of the technical description
4. **Reference `txt/kisi-kisi.txt`** for searchable text copy of the competition requirements
5. **Study `Docs/detailed-breakdown.md`** for comprehensive analysis and preparation guidelines
6. **Reference `Docs/competition-requirements-specification.md`** for detailed implementation examples

### For Mentors/Coaches
1. Use `Docs/detailed-breakdown.md` to create training curriculum
2. Use `Docs/competition-requirements-specification.md` for technical guidance
3. Follow the preparation checklist to ensure comprehensive training
4. Focus on key success factors and common pitfalls

### Quick Reference
- **Competition Overview**: See `Docs/detailed-breakdown.md` Section 1
- **Module Details**: See `Docs/detailed-breakdown.md` Section 3
- **Technical Requirements**: See `Docs/detailed-breakdown.md` Section 6
- **Schedule**: See `Docs/detailed-breakdown.md` Section 8
- **Assessment Criteria**: See `Docs/competition-requirements-specification.md` Section 6
- **Code Examples**: See `Docs/competition-requirements-specification.md` Module sections

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

**Last Updated**: 2026  
**Competition**: LKS DIKMEN National 2026 - IT Software Solution for Business
