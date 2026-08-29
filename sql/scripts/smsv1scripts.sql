CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `address_line1` varchar(255) DEFAULT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1


CREATE TABLE `attendance` (
  `attendance_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `class_id` int NOT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`attendance_id`),
  KEY `attendance_student_idx` (`student_id`),
  KEY `attendance_class_idx` (`class_id`),
  CONSTRAINT `attendance_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  CONSTRAINT `attendance_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1


CREATE TABLE `classes` (
  `class_id` int NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1


CREATE TABLE `departments` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  KEY `department_parent_id_idx` (`parent_id`),
  CONSTRAINT `department_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COMMENT='	'


CREATE TABLE `exams` (
  `exam_id` int NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(45) DEFAULT NULL,
  `class_id` int NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`exam_id`),
  KEY `exam_class_idx` (`class_id`),
  CONSTRAINT `exam_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1


CREATE TABLE `fees_payments` (
  `fees_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `total_fee` double DEFAULT NULL,
  `fee_applicable` double DEFAULT NULL,
  `term1_fee_applicable` double DEFAULT NULL,
  `term1_paid_amt` double DEFAULT NULL,
  `term1_collected_by` varchar(255) DEFAULT NULL,
  `term1_collected_date` date DEFAULT NULL,
  `term2_fee_applicable` double DEFAULT NULL,
  `term2_paid_amt` double DEFAULT NULL,
  `term2_collected_by` varchar(255) DEFAULT NULL,
  `term2_collected_date` date DEFAULT NULL,
  `term3_fee_applicable` double DEFAULT NULL,
  `term3_paid_amt` double DEFAULT NULL,
  `term3_collected_by` varchar(255) DEFAULT NULL,
  `term3_collected_date` date DEFAULT NULL,
  `total_paid_amt` double DEFAULT NULL,
  `total_balance_amt` double DEFAULT NULL,
  `is_sainik_training` bit(1) DEFAULT NULL,
  `sainik_training_fee` double DEFAULT NULL,
  PRIMARY KEY (`fees_id`),
  KEY `feespayment_student_idx` (`student_id`),
  CONSTRAINT `feespayment_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1


CREATE TABLE `fees_structure` (
  `fees_structure_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int DEFAULT NULL,
  `academic_fee` double DEFAULT NULL,
  `residential_fee` double DEFAULT NULL,
  `sainik_training_fee` double DEFAULT NULL,
  `additional_fee` double DEFAULT NULL,
  `total_fee` double DEFAULT NULL,
  `term1_due_date` date DEFAULT NULL,
  `term2_due_date` date DEFAULT NULL,
  `term3_due_date` date DEFAULT NULL,
  PRIMARY KEY (`fees_structure_id`),
  KEY `feesstructure_class_idx` (`class_id`),
  CONSTRAINT `feesstructure_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='		'


CREATE TABLE `notification_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `notification_type` varchar(20) NOT NULL,
  `recipient_number` varchar(20) NOT NULL,
  `student_name` varchar(150) DEFAULT NULL,
  `status` enum('SUCCESS','FAILURE') NOT NULL,
  `message` varchar(500) DEFAULT NULL,
  `failure_reason` varchar(500) DEFAULT NULL,
  `sent_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_notification_type` (`notification_type`),
  KEY `idx_status` (`status`),
  KEY `idx_sent_at` (`sent_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `parents` (
  `parent_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `father_guardianname` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `alt_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`parent_id`),
  UNIQUE KEY `UKe39jv4a2bx4qoy9vg1vt8tq76` (`address_id`),
  KEY `parent_user_idx` (`user_id`),
  CONSTRAINT `parent_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `parent_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1


CREATE TABLE `results` (
  `result_id` int NOT NULL AUTO_INCREMENT,
  `exam_id` int NOT NULL,
  `student_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `marks_obtained` int DEFAULT NULL,
  `grade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`result_id`),
  KEY `results_exam_idx` (`exam_id`),
  KEY `results_student_idx` (`student_id`),
  KEY `results_subject_idx` (`subject_id`),
  CONSTRAINT `results_exam` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`),
  CONSTRAINT `results_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  CONSTRAINT `results_subject` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='				'


CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1


CREATE TABLE `section` (
  `section_id` int NOT NULL AUTO_INCREMENT,
  `section_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1


CREATE TABLE `staff` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `department_id` int NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `emp_no` int DEFAULT NULL,
  `marital_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `UK8r6ihd5gnrnbsnb3ah7flatwi` (`address_id`),
  KEY `staff_user_idx` (`user_id`),
  KEY `staff_department_idx` (`department_id`),
  CONSTRAINT `staff_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `staff_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `staff_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1


CREATE TABLE `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `admission_no` varchar(255) DEFAULT NULL,
  `roll_no` int DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `class_id` int NOT NULL,
  `parent_id` int NOT NULL,
  `admission_date` date DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  `total_fee` double DEFAULT NULL,
  `is_fees_paid` bit(1) DEFAULT NULL,
  `student_type` varchar(255) DEFAULT NULL,
  `old_school_name` varchar(255) DEFAULT NULL,
  `old_school_address` varchar(255) DEFAULT NULL,
  `paid_term` varchar(255) DEFAULT NULL,
  `paid_status` varchar(255) DEFAULT NULL,
  `is_semi_residential` bit(1) DEFAULT NULL,
  `semi_residential_fee` double DEFAULT NULL,
  `bus_no` varchar(255) DEFAULT NULL,
  `transport_fee` double DEFAULT NULL,
  `joining_class` varchar(255) DEFAULT NULL,
  `mother_tongue` varchar(255) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `caste` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `pen` varchar(255) DEFAULT NULL,
  `apaar_id` varchar(255) DEFAULT NULL,
  `aadhar_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `student_user_idx` (`user_id`),
  KEY `student__parent_idx` (`parent_id`),
  KEY `student_class_idx` (`class_id`),
  CONSTRAINT `student_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_parent` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`parent_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1


CREATE TABLE `subjects` (
  `subject_id` int NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(100) DEFAULT NULL,
  `class_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  PRIMARY KEY (`subject_id`),
  KEY `subject_class_idx` (`class_id`),
  KEY `subject_teacher_idx` (`teacher_id`),
  CONSTRAINT `subject_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  CONSTRAINT `subject_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1


CREATE TABLE `teachers` (
  `teacher_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `department_id` int NOT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`),
  KEY `teacher_department_idx` (`department_id`),
  KEY `teacher_class_idx` (`user_id`),
  CONSTRAINT `teacher_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1


CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `role_id` int NOT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_role_idx` (`role_id`),
  CONSTRAINT `user_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1