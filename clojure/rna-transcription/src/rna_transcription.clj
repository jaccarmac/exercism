(ns rna-transcription)

(def complement
  {\G \C
   \T \A
   \A \U
   \C \G})

(defn to-rna [dna]
  (apply str (map #(doto (complement %) (assert "Bad nucleotide.")) dna)))
