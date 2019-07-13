(ns reverse-string)

(defn reverse-string [s]
  (apply str (reduce (fn [r c] (cons c r)) "" s)))
