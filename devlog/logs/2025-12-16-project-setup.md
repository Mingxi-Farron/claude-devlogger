# Dev Log: Project Setup
**Date:** 2025-12-16
**Session:** #1

## Time
- **Start:** 22:09
- **End:** 23:51
- **Duration:** 1 hour 42 minutes
- **Cumulative Project Time:** 1.7 hours

## Goals
- [x] Set up dev log system
- [x] Research fluid simulation updates from early UE5 to current version 5.7

## Progress
- Created dev log folder structure
- Established documentation workflow with Claude
- Completed comprehensive research on UE5.7 water/fluid simulation systems
- Compared Niagara Fluids vs Fluid Flux for water-centric visuals
- Reviewed Niagara Fluids Content Examples demo level (minimal updates observed)
- Identified Substrate material (released from beta in 5.7) as potential combo with water
- Beginning hands-on testing with Niagara 3D water in editor
- Created initial 3D FLIP test scene:
  - Gravity reduced: -980 → -100 (slower motion for observation)
  - Initial velocity removed
  - Containment: floor + 4 walls collider setup
  - Basic directional light

## Notes
- Project: water2026 (Unreal Engine 5.7)
- Focus: Water fluid simulation where water is the main visual character
- ModelingToolsEditorMode plugin enabled

### Key Research Findings

#### Three Core Water Systems in UE5.7:
1. **Water Plugin** (Free) - Gerstner waves, spline rivers, large bodies
2. **Niagara Fluids** (Free) - FLIP simulation, dynamic interactions
3. **Fluid Flux** ($350) - Shallow water, production-proven (Hellblade II)

#### Niagara Fluids vs Fluid Flux Comparison:

| Aspect | Niagara Fluids | Fluid Flux |
|--------|----------------|------------|
| **Cost** | Free | $349.99 |
| **Algorithm** | FLIP (particle-grid hybrid) | Shallow Water Equations (heightfield) |
| **3D Volumetric** | Yes (3D FLIP) | No |
| **Caustics** | Custom setup | Built-in |
| **Underwater Lighting** | DirectionalLight only | Full scattering (v3.0) |
| **Foam** | Particle-based | Advected foam system |
| **Performance** | 2D: ~0.5ms, 3D: 12ms+ | GPU-optimized, ~similar to 2D |
| **Open World** | Yes | No |
| **Best For** | Splashes, volumetric, cinematics | Coastlines, rivers, interactive surfaces |

#### Decision Framework:
- **Niagara Fluids**: Best for 3D volumetric effects, cinematics, custom workflows, budget projects
- **Fluid Flux**: Best for coastlines, interactive gameplay, complete out-of-box solution

#### Project Decision: Niagara Fluids
Chosen for:
- Free (no additional licensing)
- 3D volumetric water capability
- Official Epic support and documentation
- Open-world compatible
- Cinematic quality potential with 3D FLIP
- Integrated with UE5.7 ecosystem

#### NEW in UE 5.6/5.7:
- Water Advanced plugin with Shallow Water River actor
- Featured in Witcher 4 Tech Demo (Unreal Fest 2025)
- Converts Water Body River to Niagara 2D Fluid Simulation
- **Substrate material system** officially released from beta (potential for enhanced water materials)

#### To Explore:
- Substrate + Niagara Fluids water material combination
- 3D FLIP water simulation hands-on testing

## References

### Official Niagara Fluids Documentation
- [Niagara Fluids Quick Start Guide](https://dev.epicgames.com/documentation/en-us/unreal-engine/niagara-fluids-quick-start-guide-for-unreal-engine)
- [Niagara Fluids Reference](https://dev.epicgames.com/documentation/en-us/unreal-engine/niagara-fluids-reference-in-unreal-engine)
- [Niagara Fluids Learning Path](https://dev.epicgames.com/community/learning/paths/mZ/unreal-engine-niagara-fluids)
- [Water System Documentation](https://dev.epicgames.com/documentation/en-us/unreal-engine/water-system-in-unreal-engine)

### Niagara Fluids Tutorials
- [Interactive Water in 5 Minutes](https://dev.epicgames.com/community/learning/tutorials/LZen/unreal-engine-interactive-water-with-niagara-fluids-in-5-minutes)
- [Shallow Water Simulation](https://dev.epicgames.com/community/learning/tutorials/Ddwx/unreal-engine-shallow-water-simulation-with-niagara-fluids)
- [UE5.6 Water Body to Niagara Fluids](https://dev.epicgames.com/community/learning/tutorials/OZMa/new-in-unreal-engine-5-6-turn-your-water-body-river-into-a-game-ready-niagara-2d-fluid-simulation)
- [Advanced Niagara VFX - Unreal Fest 2024](https://dev.epicgames.com/community/learning/talks-and-demos/pLpM/unreal-engine-advanced-niagara-vfx-fluids-simulation-stages-and-more-unreal-fest-gold-coast-2024)
- [Free Niagara Fluids Course - RedefineFX](https://redefinefx.com/blast/)
- [Working with Niagara Fluids - 80.lv](https://80.lv/articles/working-with-niagara-fluids-to-create-water-simulations)

### Fluid Flux Resources
- [Fluid Flux on Fab](https://www.fab.com/listings/196c70cd-1283-4249-bf6b-c3019d1cbe11)
- [Fluid Flux Documentation](https://imaginaryblend.com/2025/01/10/fluid-flux-documentation/)
- [Fluid Flux 3.0 Release Notes](https://imaginaryblend.com/2024/11/21/fluid-flux-3-0-release-notes/)
- [Official Tutorial - Epic Community](https://dev.epicgames.com/community/learning/tutorials/Yaem/unreal-engine-fluid-flux-fluid-simulation-setup-official-tutorial)
- [Fluid Flux 3.0 Overview - 80.lv](https://80.lv/articles/fluid-flux-3-0-arrives-with-a-glass-system-underwater-lighting-decals-rain-more)

### Case Studies
- [Still Wakes the Deep - Water Mechanics](https://www.unrealengine.com/en-US/spotlights/making-waves-developing-realistic-water-mechanics-for-still-wakes-the-deep-in-ue5)
- [Hellblade II Visual Breakdown](https://yelzkizi.org/hellblade-2-and-unreal-engine-5/)

### Expert Resources
- [Asher Zhu (Epic Senior Tech Artist)](https://asher.gg/category/niagara/)
- [UE5 Water Tool & Niagara Fluid Course](https://www.cgcircuit.com/tutorial/ue5-environments-water-tool-niagara-fluid)

## Media
Screenshots and recordings for this session:
- `../media/2025-12-16/Screenshot 2025-12-16 232537.png` - Initial 3D FLIP test scene (top-down view of water in containment box)
- `../media/2025-12-16/Screenshot 2025-12-16 233724.png` - Niagara parameters affecting water amount
- `../media/2025-12-16/Screenshot 2025-12-16 234012.png` - Visual result: water amount baseline test (good fill, surface ripples, cube collision object)

### Property Control List

**Goal 1: Amount of Water (Particle Count)**

Parameters identified:
| Parameter | Current Value | Effect |
|-----------|---------------|--------|
| Particle Spawn Mult | 3.0 | Overall spawn rate multiplier |
| Particles Per Cell | USER | Density per simulation cell |
| Water Height | USER | Height of water volume |
| Render Grid Resolution Mult | 2.0 | Grid resolution for rendering |
| SDF Particle Size Mult | 2.0 | Surface particle size |
| SDF Smoothing Radius | 1 | Surface smoothing |

**Backup list (future exploration):**
- Viscosity, Surface tension, Gravity, Collision response, Color/transparency, Foam, Flow velocity, Splash behavior
