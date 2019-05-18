(ns reverse-string)

(defn reverse-string [s]
  (->> [s ""]
       (iterate (fn [[in out]]
                  [(rest in) (cons (first in) out)]))
       (some #(when (empty? (first %)) (second %)))
       (apply str)))
