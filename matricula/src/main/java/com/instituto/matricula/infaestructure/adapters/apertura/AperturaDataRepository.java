package com.instituto.matricula.infaestructure.adapters.apertura;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface AperturaDataRepository extends JpaRepository<AperturaData, String> {
    Optional<AperturaData> findByUidProfesorAndUidCurso(String uidProfesor, String uidCurso);
}
