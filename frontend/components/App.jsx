import React from 'react';
import Header from './header/header_container';
import SessionForm from './session/session_form_container';
import SessionUserEditForm from './session/session_user_edit_form_container';
import UserShow from './user/user_show_container';
import { Route, Switch, withRouter } from 'react-router-dom';
import { AuthRoute, ProtectedRoute } from '../util/route_util';
import Footer from './footer/footer';
import PhotoIndex from './photo/photo_index_container';
import PhotoShow from './photo/photo_show_container';
import Modal from './modal/modal_container';
import Discover from './discover/discover_container';

const App = () => {

  return (
  <div>
    <Modal/>
      <ProtectedRoute path='/' component={PhotoIndex}/>
      <AuthRoute path="/login" component={SessionForm} />
      <AuthRoute path="/signup" component={SessionForm} />
      <ProtectedRoute exact path='/users/:id' component={UserShow} />
      <ProtectedRoute exact path='/users/:id/edit' component={SessionUserEditForm} />
      <ProtectedRoute exact path='/photos/:id' component={PhotoShow} />
      <ProtectedRoute exact path='/discover' component={Discover} />
    <Footer/>
  </div>
);};

export default withRouter(App);
