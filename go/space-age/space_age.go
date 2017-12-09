package space

type Planet string

const (
	mercury Planet = "Mercury"
	venus   Planet = "Venus"
	earth   Planet = "Earth"
	mars    Planet = "Mars"
	jupiter Planet = "Jupiter"
	saturn  Planet = "Saturn"
	uranus  Planet = "Uranus"
	neptune Planet = "Neptune"
)

const earthYear = 31557600 // in seconds

func Age(seconds float64, planet Planet) float64 {
	earthYears := seconds / earthYear
	switch planet {
	case mercury:
		return earthYears / 0.2408467
	case venus:
		return earthYears / 0.61519726
	case earth:
		return earthYears
	case mars:
		return earthYears / 1.8808158
	case jupiter:
		return earthYears / 11.862615
	case saturn:
		return earthYears / 29.447498
	case uranus:
		return earthYears / 84.016846
	case neptune:
		return earthYears / 164.79132
	}
	return 0
}
