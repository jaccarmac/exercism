(ns rna-transcription
  (:require [clojure.set :refer [union]]))

(defn dna? [dna]
  (let [valid #{\G \T \A \C}]
    (= valid (union valid (set dna)))))

(defn to-rna [dna]
  (if-not (dna? dna)
    (throw (AssertionError. "Bad nucleotide."))
    (apply str (map {\G \C, \T \A, \A \U, \C \G} dna))))
