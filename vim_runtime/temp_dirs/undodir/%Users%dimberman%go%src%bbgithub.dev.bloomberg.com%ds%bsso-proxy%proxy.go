Vim�UnDo� �$֪�^���.����Q���:gTǊc��   E                                   [��c    _�                             ����                                                                                                                                                                                                                                                                                                                                                             [��a     �                	log.Println("pryingsdfsdfl")5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             [��b    �               E   package main       import (   	"log"   	"net/http"   	"net/http/httputil"   
	"net/url"   
	"strings"   )       //Proxy creates a reverse proxy   type Proxy struct {   #	proxy       *httputil.ReverseProxy   	publicPaths []string   }       =func proxyTo(urlString string, publicPaths []string) *Proxy {   	url, _ := url.Parse(urlString)   D	return &Proxy{httputil.NewSingleHostReverseProxy(url), publicPaths}   }       Efunc (p Proxy) proxyHandler(w http.ResponseWriter, r *http.Request) {   6	session, err := newSessionStore().Get(r, sessionName)   	if err != nil {   &		p.handleUnauthenticatedRequest(w, r)   		return   	}   $	value := session.Values["username"]   	username, ok := value.(string)   		if !ok {   5		log.Println("username in session is not a string!")   &		p.handleUnauthenticatedRequest(w, r)   		return   	}   	if username == "" {   U		log.Println("Could not retrieve username from session store! Redirecting to BSSO.")   &		p.handleUnauthenticatedRequest(w, r)   		return   	}       !	p.forwardRequest(w, r, username)   }       Ufunc (p Proxy) handleUnauthenticatedRequest(w http.ResponseWriter, r *http.Request) {   	if p.isPublicURL(r) {   D		log.Println("No existing session for public URL; passing through")   		p.forwardRequest(w, r, "")   		} else {   5		log.Println("No existing session; sending to BSSO")   		redirectToBSSO(w, r)   	}   }       2func (p Proxy) isPublicURL(r *http.Request) bool {   %	for _, path := range p.publicPaths {   *		if strings.HasPrefix(r.URL.Path, path) {   			return true   		}   	}   	return false   }       Xfunc (p Proxy) forwardRequest(w http.ResponseWriter, r *http.Request, username string) {   e	log.Printf("%s: forwarding request for %q from BSSO user %q.\n", r.RemoteAddr, r.URL.Path, username)   	if username != "" {   *		r.Header.Set("X-WEBAUTH-USER", username)   	}   	p.proxy.ServeHTTP(w, r)   }5��