import React, { Component } from 'react';
import { connect } from 'react-redux';

class ResultList extends Component {
  renderResults(resultData) {
    const name = resultData.name;
    const url = resultData.url;

    return (
      <div key={name} className={url ? 'card col-md-4' : 'card col-md-12'}>
        <div className="card-block well">
          <h4 className="card-title">{name}</h4>
          {url && <p><a href={url} target="_blank" rel="noopener noreferrer" className="btn btn-danger">Yelp Page</a></p>}
        </div>
      </div>
    );
  }

  render() {
    return (
      <div className="card-group">
        {this.props.results.map(this.renderResults)}
      </div>
    );
  }
}

function mapStateToProps(state) {
  return { results: state.searchResults };  
}

export default connect(mapStateToProps)(ResultList);
