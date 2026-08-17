# We designed a custom theme for all the figures in the master thesis. We
# load it whenever we need it sourcing this file.

# To learn more about the style decisions we made, check dataviz_decisions.qmd

# Graph theme
# ===========
theme_tfm <- theme_minimal(
  # Base text family:
  base_family = "Atkinson Hyperlegible Next",
  # Change base text size (default is 11):
  base_size = 10
  ) +
  theme(
    # Set the font for geom_text(), geom_label() (and all geom elements
    # with text in general):
    geom = element_geom(family = "Atkinson Hyperlegible Next"),
    # Make facet names bold and aligned left:
    strip.text = element_text(face = "bold", hjust = 0),
    # Add some extra space between the x axis labels and x axis titles:
    axis.title.x = element_text(margin = margin(t = 10)),
    # Remove the minor lines from the grid:
    panel.grid.minor = element_blank())



# Map theme
# =========

# For the maps we will do some different things, but want to keep some things
# the same (for example, font family and sizes). So instead of creating it
# from zero we add it with theme_tfm + theme(). This allows us to only
# change global settings once to change them everywhere.

theme_tfm_map <- theme_tfm +
  theme(
    # Drop the coordinates and the coordinates grid:
    axis.text = element_blank(),
    panel.grid = element_blank(),
    # Position the legend on the left, on top of the space left above
    # the Canary Islands:
    legend.position = "inside",
    legend.position.inside = c(0.12, 0.75),
    # Title centered on top, and bold:
    plot.title = element_text(hjust = 0.5, face = "bold")
    )
