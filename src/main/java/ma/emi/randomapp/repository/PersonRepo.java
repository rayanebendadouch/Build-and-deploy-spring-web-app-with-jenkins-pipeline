package ma.emi.randomapp.repository;

import ma.emi.randomapp.model.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface PersonRepo extends JpaRepository<Person, Integer> {

}
