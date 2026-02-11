# CareConnect (Flutter) — Week 6: Accessibility & UI Testing

SWEN 661 — Week 6
Team Scenario: **STML (Short-Term Memory Loss)**
Scope: **Accessibility improvements + UI testing** for the Flutter CareConnect app (built in Week 4).

## 1) Week 6 Requirements (Flutter)

This week we implemented **WCAG 2.1 Level AA** accessibility improvements and expanded **UI test coverage**.

Minimum expectations implemented:

* **Accessible labels** for images, icons, and interactive controls
* **Color contrast** improvements (WCAG AA target)
* **Logical focus / navigation order** across screens
* **Screen reader compatibility** using:

  * **TalkBack (Android)**
  * **VoiceOver (iOS)**
* **UI tests + coverage report generation**

## 2) App Flow (Screen Order)

Onboarding (before tabs):

1. Welcome
2. Role Selection
3. Login

Main App (bottom nav tabs):
4. Home
5. Tasks
6. Calendar
7. Health Logs
8. Messages
9. Profile

Full order: **Welcome → Role → Login → Tabs**

## 3) Accessibility Enhancements (What We Changed)

Across all screens, we focused on:

* Adding semantic labels to buttons/icons/controls (TalkBack/VoiceOver-readable)
* Ensuring logical swipe order (top-to-bottom, primary actions first)
* Improving contrast for key UI elements (buttons, selected states, text)
* Avoiding unlabeled icon-only controls
* Improving “where am I?” clarity to support STML users:

  * Clear screen titles
  * Consistent primary CTA wording
  * Predictable navigation patterns

## 4) How to Run (Flutter)

### Prerequisites

* Flutter SDK installed
* Android Studio / Xcode (for iOS)
* Emulator or physical device

### Install & Run

1. Install dependencies:

   * `flutter pub get`
2. Run the app:

   * `flutter run`

## 5) Screen Reader Testing

### Android (TalkBack)

* Enable TalkBack:

  * Settings → Accessibility → TalkBack → On
* Test:

  * Swipe right/left to move focus
  * Verify labels, roles, and order on each screen

### iOS (VoiceOver)

* Enable VoiceOver:

  * Settings → Accessibility → VoiceOver → On
* Test:

  * Swipe to navigate
  * Verify labels, order, and announcements

## 6) UI Testing + Coverage

### Run Tests

* `flutter test`

### Generate Coverage

* `flutter test --coverage`

### (Optional) Generate HTML Coverage Report

If `lcov` is available:

* `genhtml coverage/lcov.info -o coverage/html`
  Then open:
* `coverage/html/index.html`

## 7) Evidence (Required Artifacts)

Week 6 proof artifacts are stored in:

* `week6-evidence/flutter/`

Expected files:

* `talkback_onboarding.mp4`
* `talkback_tabs.mp4`
* `voiceover_onboarding.mp4`
* `voiceover_tabs.mp4`
* `screenshots/` (labels being read)
* `coverage.txt` (final coverage % and command output)

## 8) Week 6 Checklist (Flutter)

### Accessibility (WCAG 2.1 AA)

* [ ] All buttons/icons/interactive controls have accessible labels
* [ ] All form fields have accessible labels (not placeholder-only)
* [ ] Focus/swipe order is logical on **every screen**
* [ ] Color contrast meets WCAG AA on key UI elements (text/buttons/selected states)
* [ ] No icon-only controls without labels
* [ ] Screen titles are announced clearly

### Screen Reader Validation

* [ ] TalkBack tested on Android (Onboarding flow)
* [ ] TalkBack tested on Android (All 6 tabs)
* [ ] VoiceOver tested on iOS (Onboarding flow)
* [ ] VoiceOver tested on iOS (All 6 tabs)
* [ ] Screen reader evidence captured and saved in `week6-evidence/flutter/`

### Testing & Coverage

* [ ] UI tests added/updated for Week 6
* [ ] `flutter test` passes
* [ ] Coverage generated (`flutter test --coverage`)
* [ ] Final coverage % recorded in `week6-evidence/flutter/coverage.txt`
* [ ] Coverage meets target threshold (team target: **75%+**)

### Submission Readiness

* [ ] Evidence folder complete and organized
* [ ] Changes summarized in Week 6 write-up (what + why + results)
* [ ] App runs cleanly in emulator and can be demoed live

## 9) Git Branching Rules (Week 6)

We use a strict branching workflow:

* `main` = protected / stable / final-ready only
* `develop` = active integration branch (all Week 6 work merges here first)
* Feature branches = created **only from `develop`**
* Branch naming convention = `feature_<INITIALS>` (no additional text)

### Create a New Feature Branch (Always from develop)

1. Make sure you are on `develop` and up to date:

* `git checkout develop`
* `git pull origin develop`

2. Create your feature branch using the required naming convention:

* `git checkout -b feature_JR`

3. Push your branch to GitHub:

* `git push -u origin feature_JR`

### Merging Rules

* Open a Pull Request (PR) **into `develop`**
* Only merge to `main` when:

  * Week 6 work is complete
  * Both apps meet requirements
  * Tests pass and coverage reports are generated
  * Evidence package is complete

Main takes **final, develop-ready code only**.

---

Maintained by: Team CareConnect (STML Variant) — SWEN 661
