ALTER DATABASE agarcia707 CHARACTER SET utf8 COLLATE utf8_unicode_ci;

DROP TABLE IF EXISTS `articleTag`;
DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS article;
DROP TABLE IF EXISTS author;


CREATE TABLE author(
	authorId BINARY(16) NOT NULL,
	authorActivationToken CHAR(32),
	authorAvatarUrl BINARY(16) NOT NULL,
	authorEmail VARCHAR(128) NOT NULL,
	authorHash CHAR(97) NOT NULL,
	authorUsername BINARY(16) NOT NULL,

	UNIQUE(authorEmail),

	PRIMARY KEY(authorId)
);


CREATE TABLE article(
	articleId BINARY(32) NOT NULL,
	articleAuthorId BINARY(32) NOT NULL,
	articleContent VARCHAR(256) NOT NULL,
	articleDate DATETIME(6) NOT NULL,
	articleImage VARCHAR(256)

	FOREIGN KEY(articleAuthorId) REFERENCES author(authorId)

	PRIMARY KEY(articleId)
);


CREATE TABLE tag(
	tagId BINARY(32) NOT NULL,
	tagName VARCHAR(150) NOT NULL
);


CREATE TABLE articleTag(
	articleTagArticleId BINARY(32) NOT NULL,
	articleTagTagId BINARY(32) NOT NULL
);

