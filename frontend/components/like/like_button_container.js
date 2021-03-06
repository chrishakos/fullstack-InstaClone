import { connect } from 'react-redux';
import LikeButton from './like_button';
import { createLike, deleteLike } from '../../actions/photo_actions';

const mapStateToProps = (state, ownProps) => {
  return({
    likeId: ownProps.likeId,
    liked: ownProps.liked,
    photoId: ownProps.photoId,
    userId: state.session.currentUser.id
  });
};

const mapDispatchToProps = dispatch => {
  return({
  createLike: (like) => dispatch(createLike(like)),
  deleteLike: (id) => dispatch(deleteLike(id))
  });
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(LikeButton);
