// Package bob provides the responses of Bob, a lackadaisical teenager.
package bob

import "strings"

const upperAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

// Hey returns Bob's response to a remark.
func Hey(remark string) string {
	remarkStripped := strings.TrimSpace(remark)
	remarkRunes := []rune(remarkStripped)
	switch {
	case remarkStripped == "":
		return "Fine. Be that way!"
	case remarkStripped == strings.ToUpper(remarkStripped) &&
		strings.ContainsAny(remarkStripped, upperAlphabet):
		return "Whoa, chill out!"
	case remarkRunes[len(remarkRunes)-1] == '?':
		return "Sure."
	}
	return "Whatever."
}