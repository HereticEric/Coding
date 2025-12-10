# Overview

This is a simple Pygame application that displays "hello" text centered on a blue window. It's a minimal example demonstrating basic Pygame functionality including window creation, text rendering, and the game loop pattern.

# User Preferences

Preferred communication style: Simple, everyday language.

# System Architecture

## Frontend Architecture
- **Game Engine**: Pygame library for 2D graphics and window management
- **Rendering**: Single-threaded game loop running at 60 FPS
- **Display**: Fixed 800x600 pixel window with software rendering
- **Event Handling**: Pygame's event queue system for user input (currently only handles window close events)

## Application Structure
- **Single Module Design**: All code in `main.py` - appropriate for this minimal application
- **Game Loop Pattern**: Standard initialize-loop-cleanup structure
  - Initialization: Pygame setup, window creation, font/text preparation
  - Main Loop: Event processing, rendering, display update
  - Cleanup: Proper Pygame shutdown on exit
- **Frame Rate Control**: Clock-based timing to maintain consistent 60 FPS

## Graphics System
- **Color Management**: RGB tuples for color definitions (WHITE, BLACK, BLUE)
- **Text Rendering**: Pre-rendered text surface for efficiency (avoids re-rendering each frame)
- **Coordinate System**: Standard Pygame coordinates with (0,0) at top-left

# External Dependencies

## Core Library
- **pygame**: Python game development library
  - Provides windowing, graphics, event handling, and timing utilities
  - Version not specified (recommend pinning version in requirements.txt for production)

## Python Standard Library
- **sys**: Used for clean application exit via `sys.exit()`

## Notes
- No database, API, or external service integrations
- No network functionality
- Self-contained application with no configuration files
- No asset files (fonts, images, sounds) beyond Pygame defaults