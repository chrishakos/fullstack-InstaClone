import * as APIUtil from '../util/search_api_util';
export const RECEIVE_SEARCH_RESULT = "RECEIVE_SEARCH_RESULT";

export const searchUsers = (query) => (dispatch) => {
  return (APIUtil.searchUsers(query)
    .then(result => dispatch(receiveSearchResult(result))
  ));
};

export const receiveSearchResult = (result) => {
  return {
    type: RECEIVE_SEARCH_RESULT,
    result: result
  }
}
