# Flutter Custom Animated Bottom Sheet

A reusable custom bottom sheet built with Flutter widgets, featuring highly rounded top corners and animated colored shadows — without using external packages.

## ✨ Features

- Customizable background color.
- Highly rounded top corners.
- Two customizable shadow colors.
- Animated shadow appearance.
- Adjustable shadow spread and transparency.
- Customizable padding and content.
- Reusable widget to avoid code duplication.

## 🛠 Built With

- `AnimationController`
- `CurvedAnimation`
- `AnimatedBuilder`
- `BoxShadow`
- `Backdrop` — N/A
- `showModalBottomSheet`

## 🎬 Preview

https://github.com/user-attachments/assets/2324ff0d-426a-47a4-9e70-f0718f3911a4


## 🚀 Usage

### 1. Show the Bottom Sheet

Set `backgroundColor: Colors.transparent` in `showModalBottomSheet` to allow the shadow effect to appear outside the sheet.

```dart
showModalBottomSheet(
  context: context,
  backgroundColor: Colors.transparent,
  isScrollControlled: true,
  builder: (context) {
    return CustomCircularBottomSheet(
      backgroundColor: Colors.white,
      firstShadowColor: Colors.purple,
      secondShadowColor: Colors.deepPurple,
      widget: const YourContentWidget(),
    );
  },
);
```

### 2. Customize It

| Property | Description |
|---|---|
| `backgroundColor` | Background color of the bottom sheet |
| `widget` | Content displayed inside the sheet |
| `padding` | Optional custom padding |
| `firstShadowColor` | Color of the first shadow |
| `secondShadowColor` | Color of the second shadow |

## 💡 Implementation

The shadow effect is animated using `AnimationController` and `CurvedAnimation`. `AnimatedBuilder` rebuilds the animated section as the animation progresses, while `BoxShadow`, `spreadRadius`, and alpha values control the shadow's appearance.

## 📌 Notes

- The widget uses Flutter's built-in animation.
- `flutter_screenutil` is used in the provided implementation for responsive dimensions.
- The preview path above is a placeholder.
