(defun diplacusis (s)
  (sim (s-rest 0) (at (/ 0.025 (get-duration 1))(cue s))))

(defun tinnitus()
  (loud -10 (osc-tri 11000)))

(vector
   (sim (aref *track* 0) (tinnitus))
   (sim (diplacusis (cue (aref *track* 1)) ) (tinnitus)))
