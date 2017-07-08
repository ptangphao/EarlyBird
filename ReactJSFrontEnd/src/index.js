import React from 'react';
import ReactDOM from 'react-dom';
import registerServiceWorker from './registerServiceWorker';
import './index.css';

import { Provider } from 'react-redux';
import { createStore, applyMiddleware, compose } from 'redux';
import thunk from 'redux-thunk';
import { BrowserRouter, Route, Switch } from 'react-router-dom';
// import promise from 'redux-promise';
import reducers from './reducers';
import SearchIndex from './containers/search_index';

const createStoreWithMiddleware = compose(applyMiddleware(thunk))(createStore)(reducers);

ReactDOM.render(
  <Provider store={createStoreWithMiddleware}>
    <BrowserRouter>
      <div>
        <Switch>
          <Route path="/" component={SearchIndex} />
        </Switch>
      </div>
    </BrowserRouter>
  </Provider>, 
  document.getElementById('root')
);

registerServiceWorker();
