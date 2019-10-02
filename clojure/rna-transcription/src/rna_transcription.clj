(ns rna-transcription)

(def complement
  {\G \C
   \T \A
   \A \U
   \C \G})

(defn to-rna [dna]
  (doto (apply str (map complement dna))
        (#(assert (= (count %) (count dna)) "Bad nucleotide."))))
