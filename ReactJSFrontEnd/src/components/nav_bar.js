import React from 'react';

const homeLink = 'https://early-bird-search.herokuapp.com/'

export default (props) => {
  return (
    <nav className="navbar navbar-inverse bg-primary">
      <a href={homeLink} className="navbar-brand">
        <img id="favicon" src="favicon.ico" alt="favicon" className="d-inline-block align-top" />
      </a>
      <a id="early-bird-title" href={homeLink} className="navbar-brand">Early Bird</a>
    </nav>
  );
}
