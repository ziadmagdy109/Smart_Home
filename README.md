lib/
 ├── core/
 │    ├── di/               → Dependency Injection setup
 │    ├── helpers/          → Extensions & helper functions
 │    ├── networking/       → API client, endpoints, interceptors
 │    ├── routing/          → Centralized navigation logic
 │    ├── theme/            → App theme, typography, colors
 │    ├── utils/            → Shared constants, assets, utilities
 │    └── widgets/          → Reusable UI components
 │
 ├── features/
 │    ├── auth/
 │    │     ├── data/          → Data sources, DTOs, repositories implementation
 │    │     ├── domain/        → Entities, use cases, abstract repositories
 │    │     └── presentation/  → UI (screens & widgets) + state management
 │    │
 │    ├── home/
 │    │     ├── data/
 │    │     ├── domain/
 │    │     └── presentation/
 │    │
 │    └── onBoarding/
 │          ├── data/ (optional)
 │          ├── domain/ (optional)
 │          └── presentation/  → Views & Cubit for onboarding
 │
 ├── main.dart               → App entry point
 └── my_app.dart             → App setup (MaterialApp, routes, providers)
