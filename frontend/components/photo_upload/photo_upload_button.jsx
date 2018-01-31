import React from 'react';
import PhotoUploadForm from './photo_upload_form';

class PhotoUploadButton extends React.Component {

  render(){
    return (
      <button className='compass-icon-div'
        onClick={() => this.props.openModal(<PhotoUploadForm
          id={this.props.currentUser.id}
          username={this.props.currentUser.username}/>)}>
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
            <circle cx="12" cy="12" r="10" fill="none" stroke="#000" strokeLinecap="round" strokeLinejoin="round" strokeWidth="1"/>
            <polygon points="16.24 7.76 14.12 14.12 7.76 16.24 9.88 9.88 16.24 7.76" fill="none" stroke="#000" strokeLinecap="round" strokeLinejoin="round" strokeWidth="1"/>
        </svg>
      </button>
  );}
}

export default PhotoUploadButton;
