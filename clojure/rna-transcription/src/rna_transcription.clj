(ns rna-transcription)

(def complement
  {\G \C
   \T \A
   \A \U
   \C \G})

(defn to-rna [dna]
  (->> dna
       (map #(doto (complement %) (assert "Bad nucleotide.")))
       (apply str)))
