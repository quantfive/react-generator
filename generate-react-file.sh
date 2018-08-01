#!/bin/bash

POSITIONAL=()

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -r|--redux)
    REDUX=true
    shift
    ;;
    *)    # Positional Argument
    POSITIONAL+=("$1")
    shift
    ;;
esac
done

set -- "${POSITIONAL[@]}" # get back arguments

if [ $REDUX ]
then
echo "
/***
 *
 * @patr
 */

import React from 'react';

// NPM Modules
import { StyleSheet, css } from 'aphrodite';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

class $1 extends React.Component {
  render() {
    return (
      
    );
  }
}

var styles = StyleSheet.create({
  
})

const mapStateToProps = state => ({
  auth: state.auth,
})

const mapDispatchToProps = (dispatch) => ({
  authActions: bindActionCreators(AuthActions, dispatch),
});

export default connect(mapStateToProps, mapDispatchToProps)($1)
" > "$1.js"
else
echo "
import React from 'react';

// NPM Modules
import { StyleSheet, css } from 'aphrodite';

export default class $1 extends React.Component {
  render() {
    return (
      
    );
  }
}

var styles = StyleSheet.create({
  
})
" > "$1.js"
fi

