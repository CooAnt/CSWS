package com.example.csws.repository.domain;

import com.example.csws.entity.domain.Domain;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface JpaDomainRepository extends JpaRepository<Domain, Long>, DomainRepository {
    // instanceId 로 domain 조회
    public Domain findByInstanceId(String instanceId);

    // 도메인 저장
    public Domain save(Domain domain);

    // 도메인 삭제
    public void deleteById(int instanceId);
}