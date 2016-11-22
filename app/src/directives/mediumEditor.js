Vue.directive('medium-editor', {
  bind: function() {
    var editor = new MediumEditor(this.el);

    editor.subscribe('editableInput', function (event, editable) {
        //Medium Editor api for capture on change div contenteditable
        console.log(editor.serialize());
    });
  }
});
