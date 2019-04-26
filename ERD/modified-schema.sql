CREATE TABLE `issue_labels` (
`label_id` int(11) NOT NULL,
`issue_id` int(11) NOT NULL,
PRIMARY KEY (`issue_id`, `label_id`) ,
INDEX `issue_labels_ibfk_1` (`label_id` ASC) USING BTREE
)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Fixed;
CREATE TABLE `issues` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`repo_id` int(11) NULL DEFAULT NULL,
`reporter_id` int(11) NULL DEFAULT NULL,
`assignee_id` int(11) NULL DEFAULT NULL,
`pull_request` tinyint(1) NOT NULL,
`pull_request_id` int(11) NULL DEFAULT NULL,
`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`issue_id` int(11) NOT NULL,
PRIMARY KEY (`id`) ,
INDEX `issues_ibfk_1` (`repo_id` ASC) USING BTREE,
INDEX `issues_ibfk_2` (`reporter_id` ASC) USING BTREE,
INDEX `issues_ibfk_3` (`assignee_id` ASC) USING BTREE,
INDEX `issues_ibfk_4` (`pull_request_id` ASC) USING BTREE
)
ENGINE = MyISAM
AUTO_INCREMENT = 87987040
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Fixed;
CREATE TABLE `organization_members` (
`org_id` int(11) NOT NULL,
`user_id` int(11) NOT NULL,
`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (`org_id`, `user_id`) ,
INDEX `organization_members_ibfk_2` (`user_id` ASC) USING BTREE
)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Fixed;
CREATE TABLE `project_languages` (
`project_id` int(11) NOT NULL,
`language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`bytes` int(11) NULL DEFAULT NULL,
`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
INDEX `project_id` (`project_id` ASC) USING BTREE
)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Dynamic;
CREATE TABLE `project_topics` (
`project_id` int(11) NOT NULL,
`topic_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`deleted` tinyint(1) NOT NULL DEFAULT 0,
PRIMARY KEY (`project_id`, `topic_name`) 
)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Dynamic;
CREATE TABLE `projects` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`owner_id` int(11) NULL DEFAULT NULL,
`name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`forked_from` int(11) NULL DEFAULT NULL,
`deleted` tinyint(1) NOT NULL DEFAULT 0,
`updated_at` timestamp NOT NULL DEFAULT '1970-01-01 01:00:01',
PRIMARY KEY (`id`) ,
INDEX `projects_ibfk_1` (`owner_id` ASC) USING BTREE,
INDEX `projects_ibfk_2` (`forked_from` ASC) USING BTREE,
INDEX `name` (`name` ASC) USING BTREE
)
ENGINE = MyISAM
AUTO_INCREMENT = 114811906
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Dynamic;
CREATE TABLE `repo_labels` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`repo_id` int(11) NULL DEFAULT NULL,
`name` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
PRIMARY KEY (`id`) ,
INDEX `repo_labels_ibfk_1` (`repo_id` ASC) USING BTREE
)
ENGINE = MyISAM
AUTO_INCREMENT = 299720027
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Dynamic;
CREATE TABLE `repo_milestones` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`repo_id` int(11) NULL DEFAULT NULL,
`name` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
PRIMARY KEY (`id`) ,
INDEX `repo_milestones_ibfk_1` (`repo_id` ASC) USING BTREE
)
ENGINE = MyISAM
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Dynamic;
CREATE TABLE `users` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`login` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'USR',
`fake` tinyint(1) NOT NULL DEFAULT 0,
`deleted` tinyint(1) NOT NULL DEFAULT 0,
`long` decimal(11,8) NULL DEFAULT NULL,
`lat` decimal(10,8) NULL DEFAULT NULL,
`country_code` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`id`) ,
UNIQUE INDEX `login` (`login` ASC) USING BTREE
)
ENGINE = MyISAM
AUTO_INCREMENT = 47149986
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Dynamic;
CREATE TABLE `watchers` (
`repo_id` int(11) NOT NULL,
`user_id` int(11) NOT NULL,
`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (`repo_id`, `user_id`) ,
INDEX `watchers_ibfk_2` (`user_id` ASC) USING BTREE
)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Fixed;

ALTER TABLE `issue_labels` ADD CONSTRAINT `fk_issue_labels_issues_1` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`id`);
ALTER TABLE `issues` ADD CONSTRAINT `fk_issues_projects_1` FOREIGN KEY (`repo_id`) REFERENCES `projects` (`id`);
ALTER TABLE `watchers` ADD CONSTRAINT `fk_watchers_projects_1` FOREIGN KEY (`repo_id`) REFERENCES `projects` (`id`);
ALTER TABLE `organization_members` ADD CONSTRAINT `fk_organization_members_users_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
ALTER TABLE `project_topics` ADD CONSTRAINT `fk_project_topics_projects_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`);
ALTER TABLE `repo_milestones` ADD CONSTRAINT `fk_repo_milestones_projects_1` FOREIGN KEY (`repo_id`) REFERENCES `projects` (`id`);
ALTER TABLE `repo_labels` ADD CONSTRAINT `fk_repo_labels_projects_1` FOREIGN KEY (`repo_id`) REFERENCES `projects` (`id`);
ALTER TABLE `project_languages` ADD CONSTRAINT `fk_project_languages_projects_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`);
ALTER TABLE `watchers` ADD CONSTRAINT `fk_watchers_users_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
ALTER TABLE `users` ADD CONSTRAINT `fk_users_projects_1` FOREIGN KEY (`id`) REFERENCES `projects` (`owner_id`);
ALTER TABLE `issues` ADD CONSTRAINT `fk_issues_users_1` FOREIGN KEY (`reporter_id`) REFERENCES `users` (`id`);

