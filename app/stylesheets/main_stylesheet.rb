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
    st.view.titleLabel.numberOfLines = 4
    st.view.titleLabel.frame = [[5,5], [30, 70]]
    st.view.titleLabel.textAlignment = NSTextAlignmentCenter
    # This only works with line set to 1 and linbreak off
    #st.view.titleLabel.adjustsFontSizeToFitWidth = true
    st.view.titleLabel.lineBreakMode = NSLineBreakByWordWrapping
    st.background_color = rmq.color.from_rgba(0, 0, 0, 0.8)
  end

end
