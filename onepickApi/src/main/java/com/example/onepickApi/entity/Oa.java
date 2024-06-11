package com.example.onepickApi.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Data;

@Entity
@Data
public class Oa extends BaseEntity{

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long ono;

	@ManyToOne
	@JoinColumn(name = "rno", referencedColumnName = "rno", nullable = false)
	private Resume resume;

	@ManyToOne
	@JoinColumn(name = "uid", referencedColumnName = "username", nullable = false)
	private User user;
	@Column(nullable = false)
    private String type;
    private String content;
    
}
