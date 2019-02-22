// Package acronym creates acronyms from long names.
package acronym

import (
	"strings"
	"unicode"
)

type stateFn func(*phraseState) stateFn

type phraseState struct {
	phrase  []rune
	acronym string
}

// Abbreviate returns the acronym for a long string.
func Abbreviate(s string) string {
	thisPhraseState := createPhraseState(s)
	for state := startState; state != nil; {
		state = state(&thisPhraseState)
	}
	return thisPhraseState.acronym
}

func createPhraseState(phrase string) phraseState {
	return phraseState{[]rune(phrase), ""}
}

func startState(state *phraseState) stateFn {
	if len(state.phrase) == 0 {
		return nil
	}
	thisRune := state.phrase[0]
	if unicode.IsLetter(thisRune) {
		return startOfWordState
	}
	return skipSpaceState
}

func startOfWordState(state *phraseState) stateFn {
	thisRune := state.phrase[0]
	state.phrase = state.phrase[1:]
	state.acronym = state.acronym + strings.ToUpper(string(thisRune))
	if len(state.phrase) == 0 {
		return nil
	}
	return skipUntilSpaceState
}

func skipSpaceState(state *phraseState) stateFn {
	thisRune := state.phrase[0]
	if unicode.IsLetter(thisRune) {
		return startOfWordState
	}
	state.phrase = state.phrase[1:]
	if len(state.phrase) == 0 {
		return nil
	}
	return skipSpaceState
}

func skipUntilSpaceState(state *phraseState) stateFn {
	thisRune := state.phrase[0]
	if thisRune == ' ' || thisRune == '-' {
		return skipSpaceState
	}
	state.phrase = state.phrase[1:]
	if len(state.phrase) == 0 {
		return nil
	}
	return skipUntilSpaceState
}
