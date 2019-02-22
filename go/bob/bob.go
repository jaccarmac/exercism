// Package bob provides the responses of Bob, a lackadaisical teenager.
package bob

import "strings"

const upperAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

// Hey returns Bob's response to a remark.
func Hey(remark string) string {
	remarkStripped := strings.TrimSpace(remark)
	remarkRunes := []rune(remarkStripped)
	if len(remarkRunes) == 0 {
		return "Fine. Be that way!"
	}
	yellingp := remarkStripped == strings.ToUpper(remarkStripped) &&
		strings.ContainsAny(remarkStripped, upperAlphabet)
	questionp := remarkRunes[len(remarkRunes)-1] == '?'
	switch {
	case yellingp && questionp:
		return "Calm down, I know what I'm doing!"
	case yellingp:
		return "Whoa, chill out!"
	case questionp:
		return "Sure."
	}
	return "Whatever."
}
