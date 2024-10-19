package org.home_service.rest;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeRestController {

    @GetMapping("/isAlive")
    public ResponseEntity<String> isAlive() {
        return ResponseEntity.ok("Service is online");
    }

}
