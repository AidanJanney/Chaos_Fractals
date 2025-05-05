using GMT

# Global Robinson projection, draw medium-res shorelines
coast(region=:global, proj="R12c", resolution=:i,
      shorelines="1/0.5p",   # draw coastline (level 1) at 0.5-pt
      frame=:g)

# you can overlay higher-res as well:
coast!(resolution=:h, shorelines="1/1p")  # high-res outline
