import { combineReducers } from 'redux';
import { reducer as formReducer } from 'redux-form';
import SearchResultsReducer from './reducer_search';

const rootReducer = combineReducers({
  searchResults: SearchResultsReducer,
  form: formReducer
});

export default rootReducer;
