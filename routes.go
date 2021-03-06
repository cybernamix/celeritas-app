package main

import (
	"net/http"

	"github.com/go-chi/chi/v5"
)

func (a *application) routes() *chi.Mux {
	// middleware must come before any routes

	//uncomment following if activating authenticated Logins
	//a.use(a.Middleware.CheckRemember)

	// add routes here - can use the shortcut of a.get... / a.post... and use the convenience function rather than the complete a.App.Routes.Get.....

	a.get("/", a.Handlers.Home)

	// static routes
	fileServer := http.FileServer(http.Dir("./public"))
	a.App.Routes.Handle("/public/*", http.StripPrefix("/public", fileServer))

	return a.App.Routes
}
