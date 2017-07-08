import axios from 'axios';

export const FETCH_SEARCH_RESULTS = 'fetch_search_results';

const ROOT_URL = 'https://earlybirdsearch.herokuapp.com/?';

export function fetchSearchResults(term, location, callback) {
  return (dispatch) => {
    axios.get(`${ROOT_URL}business=${term}&location=${location}`)
    .then((response) => {
      callback();
      dispatch({
        type: FETCH_SEARCH_RESULTS,
        payload: response
      }) 
    })
    .catch((error) => {
      callback()
      console.log(error);
    }) 
  }
}
