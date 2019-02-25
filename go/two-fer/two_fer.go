// Package twofer generates a custom phrase based on a name.
package twofer

// ShareWith generates a phrase with an optional name spliced in.
// To use a default instead of a name, pass the empty string.
func ShareWith(optionalName string) string {
	name := optionalName
	if name == "" {
		name = "you"
	}
	return "One for " + name + ", one for me."
}
