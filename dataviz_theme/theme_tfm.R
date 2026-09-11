# We designed a custom theme for all the figures in the master thesis. We
# load it whenever we need it sourcing this file.

# To learn more about the style decisions we made, check dataviz_decisions.qmd


# Font
# ====

# Our font is not available to R by default, so we download it from Google
# fonts:
sysfonts::font_add_google("Atkinson Hyperlegible Next",
                          family = "Atkinson Hyperlegible Next")
showtext::showtext_auto()


# Saving figures 
# ==============

# "RStudio’s Plot pane uses a resolution of only 96 DPI for speed reasons,
# but ggsave() uses a default of 300 DPI, which is the standard quality for
# printing. The issue with showtext is that DPI is not automatically detected",
# and "it needs to be set manually for higher DPIs".
# See: Ucar (2022, Oct. 5). Data Visualization | MSc CSS: 05. Themes. 
# Retrieved from https://csslab.uc3m.es/dataviz/tutorials/05/

# So we create a wrapper function around ggsave() to avoid having to that 
# manually on every chunk (and still get correct visualization at default
# 96 DPI):

ggsave_tfm <- function(file_name, plot_to_save, ...) {
  # To avoid the font looking too small when exporting, we raise the DPI of
  # showtext to 300 (the default on ggsave):
  showtext::showtext_opts(dpi = 300)
  # Then run ggsave normally:
  ggplot2::ggsave(file_name,
                  plot_to_save,
                  # We want to export to a pdf to get an easy vectorial
                  # import in LaTeX:
                  device = grDevices::cairo_pdf, ...)
  # Set back to default DPI for the rest of the figures below:
  showtext::showtext_opts(dpi = 96)
}


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
