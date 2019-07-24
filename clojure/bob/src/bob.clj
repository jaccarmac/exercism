(ns bob
  (:require [clojure.string]))

(defn asking? [input]
  (= \? (last input)))

(defn yelling? [input]
  (and (some #(Character/isLetter %) input)
       (= input (clojure.string/upper-case input))))

(defn saying-nothing? [input]
  (= "" input))

(defn response-for [s]
  (let [input (clojure.string/trim s)]
    (cond (saying-nothing? input) "Fine. Be that way!"
          (and (asking? input) (yelling? input))
          "Calm down, I know what I'm doing!"
          (asking? input) "Sure."
          (yelling? input) "Whoa, chill out!"
          :else "Whatever.")))
