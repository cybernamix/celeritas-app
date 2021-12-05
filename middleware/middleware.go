package middleware

import (
	"myapp/data"

	"github.com/cybernamix/celeritas"
)

type Middleware struct {
	App *celeritas.Celeritas
	Models data.Models
}