class MainStylesheet < ApplicationStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_image = rmq.image.resource("boat")
  end

  def row(st)
    st.frame = {w: app_width, h: 80, t: 40}
  end

  def cell(st)
    st.frame = {h: 80}
    st.view.numberOfLines = 4
    st.view.frame = [[5,5], [30, 70]]
    st.view.textAlignment = NSTextAlignmentCenter
    st.view.lineBreakMode = NSLineBreakByWordWrapping
    st.background_color = rmq.color.bingo_cell
  end

end
