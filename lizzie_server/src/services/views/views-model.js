const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const viewsSchema = new Schema({
  title: { type: String, required: [true, 'title must exist'] },
  sort:  { type: Number, required: [true, 'sort must exist']},
  english:  {
    title: { type: String },
    body:  { type: String }
  },
  spanish:  {
    title: { type: String },
    body:  { type: String }
  },
  italian:  {
    title: { type: String },
    body:  { type: String }
  },

  schema_version: { type: String, default: '1' },
  created:        { type: Date, default: Date.now() }
});

const viewsModel = mongoose.model('views', viewsSchema);

module.exports = viewsModel;
