// Package gigasecond allows the addition of a gigasecond to a given time.Time.
package gigasecond

import "time"

// AddGigasecond returns a time.Time a gigasecond after the given one.
func AddGigasecond(t time.Time) time.Time {
	return t.Add(1e9 * time.Second)
}
