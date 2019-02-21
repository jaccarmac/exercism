(ns armstrong-numbers)

(defn digits-in [num]
  (->> num
    (iterate #(quot % 10))
    (take-while pos?)
    (mapv #(mod % 10))
    rseq))

(defn sum-of-digits-to-length-power [digits]
  (reduce + (map #(.pow (biginteger %) (count digits)) digits)))

(defn armstrong? [num]
  (let [big (bigint num)]
    (-> big
        digits-in
        sum-of-digits-to-length-power
        (== big))))
