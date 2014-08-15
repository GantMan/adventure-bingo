class MainStylesheet < ApplicationStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def row(st)
    st.frame = {w: app_width, h: 80, t: 40}
  end

  def cell(st)
    st.frame = {l: 0, t: 0, w: 0, h: 80}
    st.view.titleLabel.numberOfLines = 0
    st.view.titleLabel.frame = [[0,0], [40, 80]]
    st.view.titleLabel.textAlignment = NSTextAlignmentCenter
    st.view.titleLabel.adjustsFontSizeToFitWidth = true
    st.view.titleLabel.lineBreakMode = NSLineBreakByWordWrapping
  end

end
