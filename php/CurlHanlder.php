<?php

namespace H2gAsApi\Service;

//Todo write doc
class CURLHandler {
    private $baseUrl;

    private $handler;

    private $requestUri = "";

    private $apiKey;

    private $user;

    public function setBaseURL($baseUrl) {
        $this->baseUrl = $baseUrl;
    }

    private function initOpt() {
        $this->handler = curl_init();
        $opt = array();
        if ($this->user && $this->apiKey) {
            $authString = $this->user . ":" . $this->apiKey;
            $opt[CURLOPT_USERPWD] = $authString;
        }
        $opt[CURLOPT_RETURNTRANSFER] = true;
        $opt[CURLOPT_ENCODING] = "UTF-8";
        $opt[CURLOPT_SSL_VERIFYPEER] = false;
        $opt[CURLOPT_URL] = $this->baseUrl . $this->requestUri;

        curl_setopt_array($this->handler, $opt);
    }


    public function setAuth($user, $key) {
        $this->user = $user;
        $this->apiKey = $key;
    }


    public function setRequestUri($uri) {
        $uri = $this->checkRequestURL($uri);
        $this->requestUri = $uri;
    }


    public function checkRequestURL($uri) {
        $firstRequestUriLetter = substr($uri, 0, 1);
        $lastBaseUrlLetter = substr($this->baseUrl, -1);
        if ($lastBaseUrlLetter == "/" && $firstRequestUriLetter == "/") {
            return substr($uri, 1);
        } elseif ($lastBaseUrlLetter != "/" && $firstRequestUriLetter != "/") {
            return "/" . $uri;
        } else {
            return $uri;
        }
    }


    public function getData() {
        $this->initOpt();
        $data = curl_exec($this->handler);
        curl_close($this->handler);
        return $data;
    }

}
