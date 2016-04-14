#include "pitches.h"

int melody[] = {
    NOTE_FS5, NOTE_D5, NOTE_A4, NOTE_D5, NOTE_E5, NOTE_A5, NOTE_E5, NOTE_FS5, NOTE_E5, NOTE_A4, NOTE_D5
};

int melody2[] = {
    NOTE_ES5, NOTE_C5, NOTE_AS4, NOTE_C5, NOTE_D5, NOTE_AS5, NOTE_D5, NOTE_FS5, NOTE_D5, NOTE_AS4, NOTE_C5
};

float noteDurations[] = {
    4, 4, 4, 4, 4, 1.5, 4 , 4, 4, 4, 2
};
void setup() {}

void loop() {

    for ( int thisNote = 0; thisNote < 11; ++thisNote ) {

        float noteDuration = 1000 / noteDurations[thisNote];
        tone( 22, melody[thisNote], noteDuration );

        float pauseBetweenNotes = noteDuration * 1.40;
        delay( pauseBetweenNotes );

        noTone( 22 );
    }
    delay( 1000 );
    for ( int thisNote2 = 0; thisNote2 < 11; ++thisNote2 ) {

        float noteDuration = 1000 / noteDurations[thisNote2];
        tone( 22, melody2[thisNote2], noteDuration );

        float pauseBetweenNotes = noteDuration * 1.40;
        delay( pauseBetweenNotes );

        noTone( 22 );
    }
    delay( 1000 );
    
}
