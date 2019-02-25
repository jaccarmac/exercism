// Package twofer generates a custom phrase based on a name.
package twofer

// ShareWith generates a phrase with an optional name spliced in.
// To use a default instead of a name, pass the empty string.
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}
	return "One for " + name + ", one for me."
}
