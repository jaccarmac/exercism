(ns rna-transcription
  (:require [clojure.set :refer [union]]))

(def complement
  {\G \C
   \T \A
   \A \U
   \C \G})

(defn to-rna [dna]
  (apply str (reduce #(if-let [n (complement %2)]
                        (conj %1 n)
                        (throw (AssertionError. "Bad nucleotide.")))
                     []
                     dna)))
