(ns reverse-string)

(defn reverse-string [s]
  (apply str (reduce #(cons %2 %1) nil s)))
