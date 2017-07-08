import React from 'react';
import Loading from 'react-loading';

const LoadingComponent = ({ type, color }) => (
  <Loading type={type} color={color} id="loader" />
);

export default LoadingComponent;
