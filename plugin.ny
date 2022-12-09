;nyquist plug-in
;version 4
;type process
;name "Diplacusis Echoica w/ Tinnitus"

;control freq "Tinnitus frequency" int "" 7500 20 20000
;control text "Diplacusis Echoica delay:"
;control left "left" int "(milliseconds)" 0 0 100
;control right "right" int "(milliseconds)" 20 0 100
;author "Kalin Kadiev"

(defun diplacusis (sound delay)
  (sim
    (s-rest 0)
    (at 
      (/
        (/ (float delay) 1000)
        (get-duration 1)) 
      (cue sound))))

(defun tinnitus (sound freq)
  (sim
    (cue sound)
    (scale
      0.2
      (osc-tri freq))))
  

(defun process (sound delay freq)
  (diplacusis
    (tinnitus sound freq)
    delay))

(vector
  (process
    (aref *track* 0)
    left
    freq)
  (process
    (aref *track* 1)
    right
    freq))
