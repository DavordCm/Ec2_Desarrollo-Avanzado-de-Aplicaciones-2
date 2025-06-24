package com.idat.profesor.infraestructure.adapter.profesor;

import com.idat.profesor.domain.model.Profesor;
import com.idat.profesor.domain.model.ProfesorRepository;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class ProfesorAdapter implements ProfesorRepository {

    private final ProfesorDataRepository profesorDataRepository;

    public ProfesorAdapter(ProfesorDataRepository profesorDataRepository) {
        this.profesorDataRepository = profesorDataRepository;
    }

    @Override
    public List<Profesor> getProfesores() {
        return profesorDataRepository.findAll()
                .stream()
                .filter(profesorData -> profesorData.getActive() == 1)
                .map(ProfesorMapper.MAPPER::toModel)
                .toList();
    }

    @Override
    public Profesor findById(String id) {
        Optional<ProfesorData> profesorOptional = profesorDataRepository.findById(id);
        if (profesorOptional.isPresent() && profesorOptional.get().getActive() == 1) {
            return ProfesorMapper.MAPPER.toModel(profesorOptional.get());
        }
        return null;
    }

    @Override
    public Profesor save(Profesor profesor) {
        ProfesorData entity = ProfesorMapper.MAPPER.toEntity(profesor);
        entity.setActive(1);
        ProfesorData saved = profesorDataRepository.save(entity);
        return ProfesorMapper.MAPPER.toModel(saved);
    }

    @Override
    public Profesor update(String uid, Profesor profesor) {
        Optional<ProfesorData> optionalData = profesorDataRepository.findById(uid);
        if (optionalData.isPresent()) {
            ProfesorData existing = optionalData.get();
            ProfesorData updated = ProfesorMapper.MAPPER.toEntity(profesor);
            updated.setUid(existing.getUid());
            updated.setActive(existing.getActive());
            ProfesorData saved = profesorDataRepository.save(updated);
            return ProfesorMapper.MAPPER.toModel(saved);
        }
        return null;
    }
    @Override
    public void delete(String uid) {
    }
}

