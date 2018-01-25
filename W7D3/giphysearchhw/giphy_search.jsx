import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

import {fetchSearchGiphys} from './util/api_util.js';
console.log("adkfhjd");
console.log(fetchSearchGiphys);
document.addEventListener("DOMContentLoaded", ()=> {
  window.fetchSearchGiphys = fetchSearchGiphys;
});
