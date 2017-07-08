import { FETCH_SEARCH_RESULTS } from '../actions';

export default function(state = [], action) {
  switch (action.type) {
  case FETCH_SEARCH_RESULTS:
    if (action.payload.data.data.length === 0) {
      return [{name: 'No results found.'}];
    } else {
      return action.payload.data.data;
    }
  default:
    return state;
  }
}
