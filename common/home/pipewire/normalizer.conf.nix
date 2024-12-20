pkgs: ''
  context.modules = [
  {   name = libpipewire-module-filter-chain
      args = {
          node.description = "system output normalized"
          media.name       = "system output normalized"
          filter.graph = {
              nodes = [
                  {
                      type   = ladspa
                      name   = compressor
                      plugin = ${pkgs.ladspaPlugins}/lib/ladspa/sc4_1882.so
                      label  = sc4
                      control = { "RMS/peak" = 0 "Attack time (ms)" = 60 "Release time (ms)" = 600 "Threshold level (dB)" = -12 "Ratio (1:n)" = 12 "Knee radius (dB)" = 2 "Makeup gain (dB)" = 12 }
                  }
                  {
                      type   = ladspa
                      name   = limiter
                      plugin = ${pkgs.ladspaPlugins}/lib/ladspa/fast_lookahead_limiter_1913.so
                      label  = fastLookaheadLimiter
                      control = { "Input gain (dB)" = 6 "Limit (dB)" = -6 "Release time (s)" = 0.8 }
                  }
              ]
              links = [
                  { output = "compressor:Left output" input = "limiter:Input 1" }
                  { output = "compressor:Right output" input = "limiter:Input 2" }
              ]
              inputs  = [ "compressor:Left input" "compressor:Right input" ]
              outputs = [ "limiter:Output 1" "limiter:Output 2" ]
          }
          capture.props = {
              node.name      = "effect_input.normalized"
              media.class    = Audio/Sink
              audio.channels = 2
              audio.position = [ FL FR ]
          }
          playback.props = {
              node.name      = "effect_output.normalized"
              node.passive   = true
              audio.channels = 2
              audio.position = [ FL FR ]
              node.target    = "alsa_output.target"
          }
      }
  }
  ]
''
