var funnyVar:String = 'blood';

function onNoteCreation(event:NoteCreationEvent) {

    if(PlayState.SONG.meta.displayName == 'milk') funnyVar = 'cereal';
    event.note.splash = funnyVar;
}