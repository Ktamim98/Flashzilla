# Flashzilla
Flashzilla App is an iOS application built using the SwiftUI framework. It is a tool to help users memorize information using digital flashcards. Users can create and edit their own flashcards, and then test themselves on the content. The app has support for voiceover and differentiation without color for accessibility, haptic feedback for better user experience, and animations to make the app more visually appealing.

## Features
### Creating and Editing Cards
- Users can add new flashcards by entering a prompt and an answer.
- The app saves the cards using the UserDefaults API.
- Users can delete cards by swiping on them and confirming the action.
- The app supports the addition of cards with empty fields.
### Flashcard View
- Users can view their flashcards by swiping left or right.
- The app supports a feature to show the answer by tapping on the card.
- The app supports rotation effects and animations on the flashcards.
- The app supports the use of UINotificationFeedbackGenerator for haptic feedback when swiping.
### Accessibility
- The app supports accessibilityDifferentiateWithoutColor and accessibilityVoiceOverEnabled.
- The app has a feature to increase the font size of the text in the flashcard view.
- The app uses accessibilityAddTraits to add the button trait to the flashcards, making them easier to use with VoiceOver.
## Code Overview
The app consists of two SwiftUI views: EditCards and CardView.

### EditCards
This view displays a list of flashcards, allows users to add and delete flashcards, and saves them to UserDefaults. It has the following features:

- @Environment(\.dismiss) variable is used to dismiss the view.
- @State variables are used to store the array of flashcards, the prompt and answer entered by the user.
- NavigationLink is used to present the list of cards.
- Section is used to separate the different sections of the view.
- TextField is used to take user input.
- Button is used to add a new flashcard.
- List is used to display the list of flashcards and enable swiping to delete.
- onDelete is used to delete the selected flashcard.
- onAppear is used to load the data from UserDefaults.
- saveData and loadData functions are used to save and load the data respectively.
### CardView
This view displays a flashcard with a prompt and an answer. It has the following features:

 - @State variables are used to store the current state of the flashcard, and to animate the card.
- @Environment variables are used to differentiate the colors for accessibility, and to enable VoiceOver.
- UINotificationFeedbackGenerator is used to provide haptic feedback when swiping the card.
- RoundedRectangle is used to create the shape of the card.
- VStack is used to arrange the prompt and answer text.
- if-else statement is used to display different text based on the current state of the flashcard.
- padding is used to add space around the text.
- gesture is used to enable swiping and to trigger the haptic feedback.
- accessibilityAddTraits is used to add the button trait to the card.
- onTapGesture is used to toggle the state of the flashcard.
- animation is used to animate the rotation and the opacity of the card.

## Credit
This project was made by the part of "100 Days of SwiftUi" course.

