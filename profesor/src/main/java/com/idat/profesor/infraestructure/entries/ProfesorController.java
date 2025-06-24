package com.idat.profesor.infraestructure.entries;

import com.idat.profesor.domain.model.Profesor;
import com.idat.profesor.domain.service.ProfesorService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/instituto/profesor/")
public class ProfesorController {

    private final ProfesorService profesorService;

    public ProfesorController(ProfesorService profesorService) {
        this.profesorService = profesorService;
    }

    @GetMapping
    public ResponseEntity<List<Profesor>> findAll() {
        return ResponseEntity.ok(profesorService.findAll());
    }

    @GetMapping("/{uid}")
    public ResponseEntity<Profesor> findByUid(@PathVariable("uid") String uid) {
        Profesor profesor = profesorService.findById(uid);
        if (profesor != null) {
            return ResponseEntity.ok(profesor);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping
    public ResponseEntity<Profesor> save(@RequestBody Profesor profesor) {
        Profesor saved = profesorService.save(profesor);
        return ResponseEntity.status(HttpStatus.CREATED).body(saved);
    }

    @PutMapping("/{uid}")
    public ResponseEntity<Profesor> update(@PathVariable String uid, @RequestBody Profesor profesor) {
        Profesor updated = profesorService.update(uid, profesor);
        if (updated != null) {
            return ResponseEntity.ok(updated);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
