import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { fetchSearchGiphys } from './util/api_util';
import { receiveSearchGiphys } from './actions/giphy_actions.js';

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  const rootEl = document.getElementById('root');
  // ReactDOM.render(<Root store={ store }/>, rootEl);
  window.store = store;
  window.fetchSearchGiphys = fetchSearchGiphys;
  window.receiveSearchGiphys = receiveSearchGiphys;
});
