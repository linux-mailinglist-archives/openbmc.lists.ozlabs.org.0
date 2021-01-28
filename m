Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1525A30744B
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 12:02:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRHcQ1yC1zDqDq
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 22:02:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=s680F0K1; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRHQC0DZyzDrBg
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 21:53:38 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id r38so4024600pgk.13
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 02:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CQmJfb0doAc9mnAjP3USaBwVfn6zHLXNiBhxeD+XCA0=;
 b=s680F0K1kJPTAXYPR2SKhLs7C0ASZn12sRab8fchP8OIS7jyGGHN/1P+1HkSQeIkUI
 uJmuhAVpsi6lZyuE8uzcVDgzisvKcUSho3v19KMflTpo9b3ZeelRqm7Gg7H073KBsZ5v
 lv/iFyisFT9v0jKnzRcSVscL1uoB2Hq4xuyjn2xS4YkZJRJQpyuKg9VzT63HQiSHRpPs
 pUsC0DkGM6Z9Hk7HHpC1dpd4KxBDWTVa1dKKRX8/hs/kt8GZVyYQAxPL3YWkcX9jdbLc
 wKc+EE4bmPHFJhtbjUx3d2R1xNNDRIkXLtRDmWMf+LpOvK7ow19NZwj5nOCPGS73vZcH
 VhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CQmJfb0doAc9mnAjP3USaBwVfn6zHLXNiBhxeD+XCA0=;
 b=ctlh2JTMRdeDv+13+W96OOVB/TsiRYOIluZpqjx0A8QZ+CBLAMa5Q87povO9//DGBA
 FQ1gI3r+8QGE3PuuN2nCDygPTtObgd2nhVlNJjmaFchUzlgz0Pp2cIWkfv+T8ajPHwAF
 OORoZtrGtb2qHz71TvLCdudgiFEITK34jsOcq/+269fD3Jaa5JHWPxaMFl4Zegjijr3B
 gIF4AOAriL9rTV0LHV4+wlif9mrX70q3275VT/qtHLm6agL6D9Z6QlnUJpHMYyn+Z3gP
 kNKkTX9oXMbwkHs2eBZ6dKHTZ6kLvsdpfunmU3oFV067MgGsf0/qMe9w7f9Wa9AVKpxC
 zs7Q==
X-Gm-Message-State: AOAM531L+sZ+s+SsnL3ZXdRoXHj3df9wXU/gw6cq9SyKsaVl8nuHKXzo
 El0rwGndjRd2coCjgqf10yptnzeHIso=
X-Google-Smtp-Source: ABdhPJzhqCu2NwUxfzQM9qeHAY57RoT3lrrrHxcIdiyblwQ5Hah/kd42MJxz5Tk7oYVGYFxP/hvh6w==
X-Received: by 2002:a63:a301:: with SMTP id s1mr14897445pge.325.1611831215691; 
 Thu, 28 Jan 2021 02:53:35 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id q197sm5102748pfc.155.2021.01.28.02.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 02:53:34 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 5/7] Add support for SHA384 and
 SHA512
Date: Thu, 28 Jan 2021 21:23:02 +1030
Message-Id: <20210128105304.401058-6-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128105304.401058-1-joel@jms.id.au>
References: <20210128105304.401058-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Reuben Dowle <reubendowle0@gmail.com>

The current recommendation for best security practice from the US government
is to use SHA384 for TOP SECRET [1].

This patch adds support for SHA384 and SHA512 in the hash command, and also
allows FIT images to be hashed with these algorithms, and signed with
sha384,rsaXXXX and sha512,rsaXXXX

The SHA implementation is adapted from the linux kernel implementation.

[1] Commercial National Security Algorithm Suite
http://www.iad.gov/iad/programs/iad-initiatives/cnsa-suite.cfm

Signed-off-by: Reuben Dowle <reuben.dowle@4rf.com>
(cherry picked from commit d16b38f42704fe3cc94fbee1601be96045013151)
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Kconfig                       |  26 ++-
 common/hash.c                 |  85 +++++++-
 common/image-fit.c            |   9 +
 common/image-sig.c            |  26 ++-
 common/spl/Kconfig            |  34 ++-
 include/hash.h                |   4 +
 include/image.h               |  18 ++
 include/u-boot/rsa-checksum.h |   1 +
 include/u-boot/sha512.h       |  38 ++++
 lib/Kconfig                   |  23 ++
 lib/Makefile                  |   1 +
 lib/sha512.c                  | 383 ++++++++++++++++++++++++++++++++++
 tools/Makefile                |   2 +
 13 files changed, 633 insertions(+), 17 deletions(-)
 create mode 100644 include/u-boot/sha512.h
 create mode 100644 lib/sha512.c

diff --git a/Kconfig b/Kconfig
index 68cc2d97b4ed..c3dfa8de47c8 100644
--- a/Kconfig
+++ b/Kconfig
@@ -283,12 +283,26 @@ config FIT_ENABLE_SHA256_SUPPORT
 	help
 	  Enable this to support SHA256 checksum of FIT image contents. A
 	  SHA256 checksum is a 256-bit (32-byte) hash value used to check that
-	  the image contents have not been corrupted. SHA256 is recommended
-	  for use in secure applications since (as at 2016) there is no known
-	  feasible attack that could produce a 'collision' with differing
-	  input data. Use this for the highest security. Note that only the
-	  SHA256 variant is supported: SHA512 and others are not currently
-	  supported in U-Boot.
+	  the image contents have not been corrupted.
+
+config FIT_ENABLE_SHA384_SUPPORT
+	bool "Support SHA384 checksum of FIT image contents"
+	default n
+	select SHA384
+	help
+	  Enable this to support SHA384 checksum of FIT image contents. A
+	  SHA384 checksum is a 384-bit (48-byte) hash value used to check that
+	  the image contents have not been corrupted. Use this for the highest
+	  security.
+
+config FIT_ENABLE_SHA512_SUPPORT
+	bool "Support SHA512 checksum of FIT image contents"
+	default n
+	select SHA512
+	help
+	  Enable this to support SHA512 checksum of FIT image contents. A
+	  SHA512 checksum is a 512-bit (64-byte) hash value used to check that
+	  the image contents have not been corrupted.
 
 config FIT_SIGNATURE
 	bool "Enable signature verification of FIT uImages"
diff --git a/common/hash.c b/common/hash.c
index 413a5bfcdae5..d32cd9fa1c18 100644
--- a/common/hash.c
+++ b/common/hash.c
@@ -27,6 +27,7 @@
 #include <u-boot/crc.h>
 #include <u-boot/sha1.h>
 #include <u-boot/sha256.h>
+#include <u-boot/sha512.h>
 #include <u-boot/md5.h>
 
 #if defined(CONFIG_SHA1) && !defined(CONFIG_SHA_PROG_HW_ACCEL)
@@ -85,6 +86,65 @@ static int hash_finish_sha256(struct hash_algo *algo, void *ctx, void
 }
 #endif
 
+#if defined(CONFIG_SHA384)
+static int hash_init_sha384(struct hash_algo *algo, void **ctxp)
+{
+	sha512_context *ctx = malloc(sizeof(sha512_context));
+	sha384_starts(ctx);
+	*ctxp = ctx;
+	return 0;
+}
+
+static int hash_update_sha384(struct hash_algo *algo, void *ctx,
+			      const void *buf, unsigned int size, int is_last)
+{
+	sha384_update((sha512_context *)ctx, buf, size);
+	return 0;
+}
+
+static int hash_finish_sha384(struct hash_algo *algo, void *ctx, void
+			      *dest_buf, int size)
+{
+	if (size < algo->digest_size)
+		return -1;
+
+	sha384_finish((sha512_context *)ctx, dest_buf);
+	free(ctx);
+	return 0;
+}
+#endif
+
+#if defined(CONFIG_SHA512)
+static int hash_init_sha512(struct hash_algo *algo, void **ctxp)
+{
+	sha512_context *ctx = malloc(sizeof(sha512_context));
+	sha512_starts(ctx);
+	*ctxp = ctx;
+	return 0;
+}
+
+static int hash_update_sha512(struct hash_algo *algo, void *ctx,
+			      const void *buf, unsigned int size, int is_last)
+{
+	sha512_update((sha512_context *)ctx, buf, size);
+	return 0;
+}
+
+static int hash_finish_sha512(struct hash_algo *algo, void *ctx, void
+			      *dest_buf, int size)
+{
+	if (size < algo->digest_size)
+		return -1;
+
+	printf("hello world\n");
+
+	sha512_finish((sha512_context *)ctx, dest_buf);
+	free(ctx);
+	return 0;
+}
+#endif
+
+
 static int hash_init_crc16_ccitt(struct hash_algo *algo, void **ctxp)
 {
 	uint16_t *ctx = malloc(sizeof(uint16_t));
@@ -185,6 +245,28 @@ static struct hash_algo hash_algo[] = {
 		.hash_finish	= hash_finish_sha256,
 #endif
 	},
+#endif
+#ifdef CONFIG_SHA384
+	{
+		.name		= "sha384",
+		.digest_size	= SHA384_SUM_LEN,
+		.chunk_size	= CHUNKSZ_SHA384,
+		.hash_func_ws	= sha384_csum_wd,
+		.hash_init	= hash_init_sha384,
+		.hash_update	= hash_update_sha384,
+		.hash_finish	= hash_finish_sha384,
+	},
+#endif
+#ifdef CONFIG_SHA512
+	{
+		.name		= "sha512",
+		.digest_size	= SHA512_SUM_LEN,
+		.chunk_size	= CHUNKSZ_SHA512,
+		.hash_func_ws	= sha512_csum_wd,
+		.hash_init	= hash_init_sha512,
+		.hash_update	= hash_update_sha512,
+		.hash_finish	= hash_finish_sha512,
+	},
 #endif
 	{
 		.name		= "crc16-ccitt",
@@ -208,7 +290,8 @@ static struct hash_algo hash_algo[] = {
 
 /* Try to minimize code size for boards that don't want much hashing */
 #if defined(CONFIG_SHA256) || defined(CONFIG_CMD_SHA1SUM) || \
-	defined(CONFIG_CRC32_VERIFY) || defined(CONFIG_CMD_HASH)
+	defined(CONFIG_CRC32_VERIFY) || defined(CONFIG_CMD_HASH) || \
+	defined(CONFIG_SHA384) || defined(CONFIG_SHA512)
 #define multi_hash()	1
 #else
 #define multi_hash()	0
diff --git a/common/image-fit.c b/common/image-fit.c
index c40169331c16..be4d9dc9c3b1 100644
--- a/common/image-fit.c
+++ b/common/image-fit.c
@@ -28,6 +28,7 @@ DECLARE_GLOBAL_DATA_PTR;
 #include <u-boot/md5.h>
 #include <u-boot/sha1.h>
 #include <u-boot/sha256.h>
+#include <u-boot/sha512.h>
 
 /*****************************************************************************/
 /* New uImage format routines */
@@ -1150,6 +1151,14 @@ int calculate_hash(const void *data, int data_len, const char *algo,
 		sha256_csum_wd((unsigned char *)data, data_len,
 			       (unsigned char *)value, CHUNKSZ_SHA256);
 		*value_len = SHA256_SUM_LEN;
+	} else if (IMAGE_ENABLE_SHA384 && strcmp(algo, "sha384") == 0) {
+		sha384_csum_wd((unsigned char *)data, data_len,
+			       (unsigned char *)value, CHUNKSZ_SHA384);
+		*value_len = SHA384_SUM_LEN;
+	} else if (IMAGE_ENABLE_SHA512 && strcmp(algo, "sha512") == 0) {
+		sha512_csum_wd((unsigned char *)data, data_len,
+			       (unsigned char *)value, CHUNKSZ_SHA512);
+		*value_len = SHA512_SUM_LEN;
 	} else if (IMAGE_ENABLE_MD5 && strcmp(algo, "md5") == 0) {
 		md5_wd((unsigned char *)data, data_len, value, CHUNKSZ_MD5);
 		*value_len = 16;
diff --git a/common/image-sig.c b/common/image-sig.c
index 44c797530d0e..e4bbac55c17e 100644
--- a/common/image-sig.c
+++ b/common/image-sig.c
@@ -49,7 +49,31 @@ struct checksum_algo checksum_algos[] = {
 		.calculate_sign = EVP_sha256,
 #endif
 		.calculate = hash_calculate,
-	}
+	},
+#ifdef CONFIG_SHA384
+	{
+		.name = "sha384",
+		.checksum_len = SHA384_SUM_LEN,
+		.der_len = SHA384_DER_LEN,
+		.der_prefix = sha384_der_prefix,
+#if IMAGE_ENABLE_SIGN
+		.calculate_sign = EVP_sha384,
+#endif
+		.calculate = hash_calculate,
+	},
+#endif
+#ifdef CONFIG_SHA512
+	{
+		.name = "sha512",
+		.checksum_len = SHA512_SUM_LEN,
+		.der_len = SHA512_DER_LEN,
+		.der_prefix = sha512_der_prefix,
+#if IMAGE_ENABLE_SIGN
+		.calculate_sign = EVP_sha512,
+#endif
+		.calculate = hash_calculate,
+	},
+#endif
 
 };
 
diff --git a/common/spl/Kconfig b/common/spl/Kconfig
index 533e4ef8d3c1..e7425983aee3 100644
--- a/common/spl/Kconfig
+++ b/common/spl/Kconfig
@@ -284,7 +284,7 @@ config SPL_MD5_SUPPORT
 	  secure as it is possible (with a brute-force attack) to adjust the
 	  image while still retaining the same MD5 hash value. For secure
 	  applications where images may be changed maliciously, you should
-	  consider SHA1 or SHA256.
+	  consider SHA256 or SHA384.
 
 config SPL_SHA1_SUPPORT
 	bool "Support SHA1"
@@ -295,8 +295,8 @@ config SPL_SHA1_SUPPORT
 	  checksum is a 160-bit (20-byte) hash value used to check that the
 	  image contents have not been corrupted or maliciously altered.
 	  While SHA1 is fairly secure it is coming to the end of its life
-	  due to the expanding computing power avaiable to brute-force
-	  attacks. For more security, consider SHA256.
+	  due to the expanding computing power available to brute-force
+	  attacks. For more security, consider SHA256 or SHA384.
 
 config SPL_SHA256_SUPPORT
 	bool "Support SHA256"
@@ -305,12 +305,28 @@ config SPL_SHA256_SUPPORT
 	help
 	  Enable this to support SHA256 in FIT images within SPL. A SHA256
 	  checksum is a 256-bit (32-byte) hash value used to check that the
-	  image contents have not been corrupted. SHA256 is recommended for
-	  use in secure applications since (as at 2016) there is no known
-	  feasible attack that could produce a 'collision' with differing
-	  input data. Use this for the highest security. Note that only the
-	  SHA256 variant is supported: SHA512 and others are not currently
-	  supported in U-Boot.
+	  image contents have not been corrupted.
+
+config SPL_SHA384_SUPPORT
+	bool "Support SHA384"
+	depends on SPL_FIT
+	select SHA384
+	select SHA512_ALGO
+	help
+	  Enable this to support SHA384 in FIT images within SPL. A SHA384
+	  checksum is a 384-bit (48-byte) hash value used to check that the
+	  image contents have not been corrupted. Use this for the highest
+	  security.
+
+config SPL_SHA512_SUPPORT
+	bool "Support SHA512"
+	depends on SPL_FIT
+	select SHA512
+	select SHA512_ALGO
+	help
+	  Enable this to support SHA512 in FIT images within SPL. A SHA512
+	  checksum is a 512-bit (64-byte) hash value used to check that the
+	  image contents have not been corrupted.
 
 config SPL_FIT_IMAGE_TINY
 	bool "Remove functionality from SPL FIT loading to reduce size"
diff --git a/include/hash.h b/include/hash.h
index f4019a979189..6e0cf0a53a0a 100644
--- a/include/hash.h
+++ b/include/hash.h
@@ -10,7 +10,11 @@
  * Maximum digest size for all algorithms we support. Having this value
  * avoids a malloc() or C99 local declaration in common/cmd_hash.c.
  */
+#if defined(CONFIG_SHA384) || defined(CONFIG_SHA512)
+#define HASH_MAX_DIGEST_SIZE	64
+#else
 #define HASH_MAX_DIGEST_SIZE	32
+#endif
 
 enum {
 	HASH_FLAG_VERIFY	= 1 << 0,	/* Enable verify mode */
diff --git a/include/image.h b/include/image.h
index 765ffecee0a7..937c7eee8ffb 100644
--- a/include/image.h
+++ b/include/image.h
@@ -32,8 +32,12 @@ struct fdt_region;
 #define CONFIG_FIT_VERBOSE	1 /* enable fit_format_{error,warning}() */
 #define CONFIG_FIT_ENABLE_RSASSA_PSS_SUPPORT 1
 #define CONFIG_FIT_ENABLE_SHA256_SUPPORT
+#define CONFIG_FIT_ENABLE_SHA384_SUPPORT
+#define CONFIG_FIT_ENABLE_SHA512_SUPPORT
 #define CONFIG_SHA1
 #define CONFIG_SHA256
+#define CONFIG_SHA384
+#define CONFIG_SHA512
 
 #define IMAGE_ENABLE_IGNORE	0
 #define IMAGE_INDENT_STRING	""
@@ -93,6 +97,20 @@ struct fdt_region;
 #define IMAGE_ENABLE_SHA256	0
 #endif
 
+#if defined(CONFIG_FIT_ENABLE_SHA384_SUPPORT) || \
+	defined(CONFIG_SPL_SHA384_SUPPORT)
+#define IMAGE_ENABLE_SHA384	1
+#else
+#define IMAGE_ENABLE_SHA384	0
+#endif
+
+#if defined(CONFIG_FIT_ENABLE_SHA512_SUPPORT) || \
+	defined(CONFIG_SPL_SHA512_SUPPORT)
+#define IMAGE_ENABLE_SHA512	1
+#else
+#define IMAGE_ENABLE_SHA512	0
+#endif
+
 #endif /* IMAGE_ENABLE_FIT */
 
 #ifdef CONFIG_SYS_BOOT_GET_CMDLINE
diff --git a/include/u-boot/rsa-checksum.h b/include/u-boot/rsa-checksum.h
index 02b814d34e32..54e6a73744e1 100644
--- a/include/u-boot/rsa-checksum.h
+++ b/include/u-boot/rsa-checksum.h
@@ -10,6 +10,7 @@
 #include <image.h>
 #include <u-boot/sha1.h>
 #include <u-boot/sha256.h>
+#include <u-boot/sha512.h>
 
 /**
  * hash_calculate() - Calculate hash over the data
diff --git a/include/u-boot/sha512.h b/include/u-boot/sha512.h
new file mode 100644
index 000000000000..516729d77506
--- /dev/null
+++ b/include/u-boot/sha512.h
@@ -0,0 +1,38 @@
+#ifndef _SHA512_H
+#define _SHA512_H
+
+#define SHA384_SUM_LEN          48
+#define SHA384_DER_LEN          19
+#define SHA512_SUM_LEN          64
+#define SHA512_DER_LEN          19
+#define SHA512_BLOCK_SIZE       128
+
+#define CHUNKSZ_SHA384	(16 * 1024)
+#define CHUNKSZ_SHA512	(16 * 1024)
+
+typedef struct {
+	uint64_t state[SHA512_SUM_LEN / 8];
+	uint64_t count[2];
+	uint8_t buf[SHA512_BLOCK_SIZE];
+} sha512_context;
+
+extern const uint8_t sha512_der_prefix[];
+
+void sha512_starts(sha512_context * ctx);
+void sha512_update(sha512_context *ctx, const uint8_t *input, uint32_t length);
+void sha512_finish(sha512_context * ctx, uint8_t digest[SHA512_SUM_LEN]);
+
+void sha512_csum_wd(const unsigned char *input, unsigned int ilen,
+		unsigned char *output, unsigned int chunk_sz);
+
+extern const uint8_t sha384_der_prefix[];
+
+void sha384_starts(sha512_context * ctx);
+void sha384_update(sha512_context *ctx, const uint8_t *input, uint32_t length);
+void sha384_finish(sha512_context * ctx, uint8_t digest[SHA384_SUM_LEN]);
+
+void sha384_csum_wd(const unsigned char *input, unsigned int ilen,
+		unsigned char *output, unsigned int chunk_sz);
+
+
+#endif /* _SHA512_H */
diff --git a/lib/Kconfig b/lib/Kconfig
index 366d164cd760..984a783fd16f 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -247,6 +247,29 @@ config SHA256
 	  The SHA256 algorithm produces a 256-bit (32-byte) hash value
 	  (digest).
 
+config SHA512_ALGO
+	bool "Enable SHA512 algorithm"
+	help
+	  This option enables support of internal SHA512 algorithm.
+
+config SHA512
+	bool "Enable SHA512 support"
+	depends on SHA512_ALGO
+	help
+	  This option enables support of hashing using SHA512 algorithm.
+	  The hash is calculated in software.
+	  The SHA512 algorithm produces a 512-bit (64-byte) hash value
+	  (digest).
+
+config SHA384
+	bool "Enable SHA384 support"
+	depends on SHA512_ALGO
+	help
+	  This option enables support of hashing using SHA384 algorithm.
+	  The hash is calculated in software.
+	  The SHA384 algorithm produces a 384-bit (48-byte) hash value
+	  (digest).
+
 config SHA_HW_ACCEL
 	bool "Enable hashing using hardware"
 	help
diff --git a/lib/Makefile b/lib/Makefile
index 47829bfed52d..c2923810a016 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -56,6 +56,7 @@ endif
 obj-$(CONFIG_RSA) += rsa/
 obj-$(CONFIG_SHA1) += sha1.o
 obj-$(CONFIG_SHA256) += sha256.o
+obj-$(CONFIG_SHA512_ALGO) += sha512.o
 
 obj-$(CONFIG_$(SPL_)ZLIB) += zlib/
 obj-$(CONFIG_$(SPL_)GZIP) += gunzip.o
diff --git a/lib/sha512.c b/lib/sha512.c
new file mode 100644
index 000000000000..f1e2acf0fbcb
--- /dev/null
+++ b/lib/sha512.c
@@ -0,0 +1,383 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * FIPS-180-2 compliant SHA-512 and SHA-384 implementation
+ *
+ * SHA-512 code by Jean-Luc Cooke <jlcooke@certainkey.com>
+ *
+ * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
+ * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
+ * Copyright (c) 2003 Kyle McMartin <kyle@debian.org>
+ * Copyright (c) 2020 Reuben Dowle <reuben.dowle@4rf.com>
+ */
+
+#ifndef USE_HOSTCC
+#include <common.h>
+#include <linux/string.h>
+#else
+#include <string.h>
+#endif /* USE_HOSTCC */
+#include <watchdog.h>
+#include <u-boot/sha512.h>
+
+const uint8_t sha384_der_prefix[SHA384_DER_LEN] = {
+	0x30, 0x41, 0x30, 0x0d, 0x06, 0x09, 0x60, 0x86,
+	0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x02, 0x05,
+	0x00, 0x04, 0x30
+};
+
+const uint8_t sha512_der_prefix[SHA512_DER_LEN] = {
+	0x30, 0x51, 0x30, 0x0d, 0x06, 0x09, 0x60, 0x86,
+	0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x03, 0x05,
+	0x00, 0x04, 0x40
+};
+
+#define SHA384_H0	0xcbbb9d5dc1059ed8ULL
+#define SHA384_H1	0x629a292a367cd507ULL
+#define SHA384_H2	0x9159015a3070dd17ULL
+#define SHA384_H3	0x152fecd8f70e5939ULL
+#define SHA384_H4	0x67332667ffc00b31ULL
+#define SHA384_H5	0x8eb44a8768581511ULL
+#define SHA384_H6	0xdb0c2e0d64f98fa7ULL
+#define SHA384_H7	0x47b5481dbefa4fa4ULL
+
+#define SHA512_H0	0x6a09e667f3bcc908ULL
+#define SHA512_H1	0xbb67ae8584caa73bULL
+#define SHA512_H2	0x3c6ef372fe94f82bULL
+#define SHA512_H3	0xa54ff53a5f1d36f1ULL
+#define SHA512_H4	0x510e527fade682d1ULL
+#define SHA512_H5	0x9b05688c2b3e6c1fULL
+#define SHA512_H6	0x1f83d9abfb41bd6bULL
+#define SHA512_H7	0x5be0cd19137e2179ULL
+
+static inline uint64_t Ch(uint64_t x, uint64_t y, uint64_t z)
+{
+        return z ^ (x & (y ^ z));
+}
+
+static inline uint64_t Maj(uint64_t x, uint64_t y, uint64_t z)
+{
+        return (x & y) | (z & (x | y));
+}
+
+static const uint64_t sha512_K[80] = {
+        0x428a2f98d728ae22ULL, 0x7137449123ef65cdULL, 0xb5c0fbcfec4d3b2fULL,
+        0xe9b5dba58189dbbcULL, 0x3956c25bf348b538ULL, 0x59f111f1b605d019ULL,
+        0x923f82a4af194f9bULL, 0xab1c5ed5da6d8118ULL, 0xd807aa98a3030242ULL,
+        0x12835b0145706fbeULL, 0x243185be4ee4b28cULL, 0x550c7dc3d5ffb4e2ULL,
+        0x72be5d74f27b896fULL, 0x80deb1fe3b1696b1ULL, 0x9bdc06a725c71235ULL,
+        0xc19bf174cf692694ULL, 0xe49b69c19ef14ad2ULL, 0xefbe4786384f25e3ULL,
+        0x0fc19dc68b8cd5b5ULL, 0x240ca1cc77ac9c65ULL, 0x2de92c6f592b0275ULL,
+        0x4a7484aa6ea6e483ULL, 0x5cb0a9dcbd41fbd4ULL, 0x76f988da831153b5ULL,
+        0x983e5152ee66dfabULL, 0xa831c66d2db43210ULL, 0xb00327c898fb213fULL,
+        0xbf597fc7beef0ee4ULL, 0xc6e00bf33da88fc2ULL, 0xd5a79147930aa725ULL,
+        0x06ca6351e003826fULL, 0x142929670a0e6e70ULL, 0x27b70a8546d22ffcULL,
+        0x2e1b21385c26c926ULL, 0x4d2c6dfc5ac42aedULL, 0x53380d139d95b3dfULL,
+        0x650a73548baf63deULL, 0x766a0abb3c77b2a8ULL, 0x81c2c92e47edaee6ULL,
+        0x92722c851482353bULL, 0xa2bfe8a14cf10364ULL, 0xa81a664bbc423001ULL,
+        0xc24b8b70d0f89791ULL, 0xc76c51a30654be30ULL, 0xd192e819d6ef5218ULL,
+        0xd69906245565a910ULL, 0xf40e35855771202aULL, 0x106aa07032bbd1b8ULL,
+        0x19a4c116b8d2d0c8ULL, 0x1e376c085141ab53ULL, 0x2748774cdf8eeb99ULL,
+        0x34b0bcb5e19b48a8ULL, 0x391c0cb3c5c95a63ULL, 0x4ed8aa4ae3418acbULL,
+        0x5b9cca4f7763e373ULL, 0x682e6ff3d6b2b8a3ULL, 0x748f82ee5defb2fcULL,
+        0x78a5636f43172f60ULL, 0x84c87814a1f0ab72ULL, 0x8cc702081a6439ecULL,
+        0x90befffa23631e28ULL, 0xa4506cebde82bde9ULL, 0xbef9a3f7b2c67915ULL,
+        0xc67178f2e372532bULL, 0xca273eceea26619cULL, 0xd186b8c721c0c207ULL,
+        0xeada7dd6cde0eb1eULL, 0xf57d4f7fee6ed178ULL, 0x06f067aa72176fbaULL,
+        0x0a637dc5a2c898a6ULL, 0x113f9804bef90daeULL, 0x1b710b35131c471bULL,
+        0x28db77f523047d84ULL, 0x32caab7b40c72493ULL, 0x3c9ebe0a15c9bebcULL,
+        0x431d67c49c100d4cULL, 0x4cc5d4becb3e42b6ULL, 0x597f299cfc657e2aULL,
+        0x5fcb6fab3ad6faecULL, 0x6c44198c4a475817ULL,
+};
+
+static inline uint64_t ror64(uint64_t word, unsigned int shift)
+{
+	return (word >> (shift & 63)) | (word << ((-shift) & 63));
+}
+
+#define e0(x)       (ror64(x,28) ^ ror64(x,34) ^ ror64(x,39))
+#define e1(x)       (ror64(x,14) ^ ror64(x,18) ^ ror64(x,41))
+#define s0(x)       (ror64(x, 1) ^ ror64(x, 8) ^ (x >> 7))
+#define s1(x)       (ror64(x,19) ^ ror64(x,61) ^ (x >> 6))
+
+/*
+ * 64-bit integer manipulation macros (big endian)
+ */
+#ifndef GET_UINT64_BE
+#define GET_UINT64_BE(n,b,i) {				\
+	(n) = ( (unsigned long long) (b)[(i)    ] << 56 )	\
+	    | ( (unsigned long long) (b)[(i) + 1] << 48 )	\
+	    | ( (unsigned long long) (b)[(i) + 2] << 40 )	\
+	    | ( (unsigned long long) (b)[(i) + 3] << 32 )	\
+	    | ( (unsigned long long) (b)[(i) + 4] << 24 )	\
+	    | ( (unsigned long long) (b)[(i) + 5] << 16 )	\
+	    | ( (unsigned long long) (b)[(i) + 6] <<  8 )	\
+	    | ( (unsigned long long) (b)[(i) + 7]       );	\
+}
+#endif
+#ifndef PUT_UINT64_BE
+#define PUT_UINT64_BE(n,b,i) {				\
+	(b)[(i)    ] = (unsigned char) ( (n) >> 56 );	\
+	(b)[(i) + 1] = (unsigned char) ( (n) >> 48 );	\
+	(b)[(i) + 2] = (unsigned char) ( (n) >> 40 );	\
+	(b)[(i) + 3] = (unsigned char) ( (n) >> 32 );	\
+	(b)[(i) + 4] = (unsigned char) ( (n) >> 24 );	\
+	(b)[(i) + 5] = (unsigned char) ( (n) >> 16 );	\
+	(b)[(i) + 6] = (unsigned char) ( (n) >>  8 );	\
+	(b)[(i) + 7] = (unsigned char) ( (n)       );	\
+}
+#endif
+
+static inline void LOAD_OP(int I, uint64_t *W, const uint8_t *input)
+{
+	GET_UINT64_BE(W[I], input, I*8);
+}
+
+static inline void BLEND_OP(int I, uint64_t *W)
+{
+	W[I & 15] += s1(W[(I-2) & 15]) + W[(I-7) & 15] + s0(W[(I-15) & 15]);
+}
+
+static void
+sha512_transform(uint64_t *state, const uint8_t *input)
+{
+	uint64_t a, b, c, d, e, f, g, h, t1, t2;
+
+	int i;
+	uint64_t W[16];
+
+	/* load the state into our registers */
+	a=state[0];   b=state[1];   c=state[2];   d=state[3];
+	e=state[4];   f=state[5];   g=state[6];   h=state[7];
+
+	/* now iterate */
+	for (i=0; i<80; i+=8) {
+		if (!(i & 8)) {
+			int j;
+
+			if (i < 16) {
+				/* load the input */
+				for (j = 0; j < 16; j++)
+					LOAD_OP(i + j, W, input);
+			} else {
+				for (j = 0; j < 16; j++) {
+					BLEND_OP(i + j, W);
+				}
+			}
+		}
+
+		t1 = h + e1(e) + Ch(e,f,g) + sha512_K[i  ] + W[(i & 15)];
+		t2 = e0(a) + Maj(a,b,c);    d+=t1;    h=t1+t2;
+		t1 = g + e1(d) + Ch(d,e,f) + sha512_K[i+1] + W[(i & 15) + 1];
+		t2 = e0(h) + Maj(h,a,b);    c+=t1;    g=t1+t2;
+		t1 = f + e1(c) + Ch(c,d,e) + sha512_K[i+2] + W[(i & 15) + 2];
+		t2 = e0(g) + Maj(g,h,a);    b+=t1;    f=t1+t2;
+		t1 = e + e1(b) + Ch(b,c,d) + sha512_K[i+3] + W[(i & 15) + 3];
+		t2 = e0(f) + Maj(f,g,h);    a+=t1;    e=t1+t2;
+		t1 = d + e1(a) + Ch(a,b,c) + sha512_K[i+4] + W[(i & 15) + 4];
+		t2 = e0(e) + Maj(e,f,g);    h+=t1;    d=t1+t2;
+		t1 = c + e1(h) + Ch(h,a,b) + sha512_K[i+5] + W[(i & 15) + 5];
+		t2 = e0(d) + Maj(d,e,f);    g+=t1;    c=t1+t2;
+		t1 = b + e1(g) + Ch(g,h,a) + sha512_K[i+6] + W[(i & 15) + 6];
+		t2 = e0(c) + Maj(c,d,e);    f+=t1;    b=t1+t2;
+		t1 = a + e1(f) + Ch(f,g,h) + sha512_K[i+7] + W[(i & 15) + 7];
+		t2 = e0(b) + Maj(b,c,d);    e+=t1;    a=t1+t2;
+	}
+
+	state[0] += a; state[1] += b; state[2] += c; state[3] += d;
+	state[4] += e; state[5] += f; state[6] += g; state[7] += h;
+
+	/* erase our data */
+	a = b = c = d = e = f = g = h = t1 = t2 = 0;
+}
+
+static void sha512_block_fn(sha512_context *sst, const uint8_t *src,
+				    int blocks)
+{
+	while (blocks--) {
+		sha512_transform(sst->state, src);
+		src += SHA512_BLOCK_SIZE;
+	}
+}
+
+static void sha512_base_do_update(sha512_context *sctx,
+					const uint8_t *data,
+					unsigned int len)
+{
+	unsigned int partial = sctx->count[0] % SHA512_BLOCK_SIZE;
+
+	sctx->count[0] += len;
+	if (sctx->count[0] < len)
+		sctx->count[1]++;
+
+	if (unlikely((partial + len) >= SHA512_BLOCK_SIZE)) {
+		int blocks;
+
+		if (partial) {
+			int p = SHA512_BLOCK_SIZE - partial;
+
+			memcpy(sctx->buf + partial, data, p);
+			data += p;
+			len -= p;
+
+			sha512_block_fn(sctx, sctx->buf, 1);
+		}
+
+		blocks = len / SHA512_BLOCK_SIZE;
+		len %= SHA512_BLOCK_SIZE;
+
+		if (blocks) {
+			sha512_block_fn(sctx, data, blocks);
+			data += blocks * SHA512_BLOCK_SIZE;
+		}
+		partial = 0;
+	}
+	if (len)
+		memcpy(sctx->buf + partial, data, len);
+}
+
+static void sha512_base_do_finalize(sha512_context *sctx)
+{
+	const int bit_offset = SHA512_BLOCK_SIZE - sizeof(uint64_t[2]);
+	uint64_t *bits = (uint64_t *)(sctx->buf + bit_offset);
+	unsigned int partial = sctx->count[0] % SHA512_BLOCK_SIZE;
+
+	sctx->buf[partial++] = 0x80;
+	if (partial > bit_offset) {
+		memset(sctx->buf + partial, 0x0, SHA512_BLOCK_SIZE - partial);
+		partial = 0;
+
+		sha512_block_fn(sctx, sctx->buf, 1);
+	}
+
+	memset(sctx->buf + partial, 0x0, bit_offset - partial);
+	bits[0] = cpu_to_be64(sctx->count[1] << 3 | sctx->count[0] >> 61);
+	bits[1] = cpu_to_be64(sctx->count[0] << 3);
+	sha512_block_fn(sctx, sctx->buf, 1);
+}
+
+#if defined(CONFIG_SHA384)
+void sha384_starts(sha512_context * ctx)
+{
+	ctx->state[0] = SHA384_H0;
+	ctx->state[1] = SHA384_H1;
+	ctx->state[2] = SHA384_H2;
+	ctx->state[3] = SHA384_H3;
+	ctx->state[4] = SHA384_H4;
+	ctx->state[5] = SHA384_H5;
+	ctx->state[6] = SHA384_H6;
+	ctx->state[7] = SHA384_H7;
+	ctx->count[0] = ctx->count[1] = 0;
+}
+
+void sha384_update(sha512_context *ctx, const uint8_t *input, uint32_t length)
+{
+	sha512_base_do_update(ctx, input, length);
+}
+
+void sha384_finish(sha512_context * ctx, uint8_t digest[SHA384_SUM_LEN])
+{
+	int i;
+
+	sha512_base_do_finalize(ctx);
+	for(i=0; i<SHA384_SUM_LEN / sizeof(uint64_t); i++)
+		PUT_UINT64_BE(ctx->state[i], digest, i * 8);
+}
+
+/*
+ * Output = SHA-512( input buffer ). Trigger the watchdog every 'chunk_sz'
+ * bytes of input processed.
+ */
+void sha384_csum_wd(const unsigned char *input, unsigned int ilen,
+		unsigned char *output, unsigned int chunk_sz)
+{
+	sha512_context ctx;
+#if defined(CONFIG_HW_WATCHDOG) || defined(CONFIG_WATCHDOG)
+	const unsigned char *end;
+	unsigned char *curr;
+	int chunk;
+#endif
+
+	sha384_starts(&ctx);
+
+#if defined(CONFIG_HW_WATCHDOG) || defined(CONFIG_WATCHDOG)
+	curr = (unsigned char *)input;
+	end = input + ilen;
+	while (curr < end) {
+		chunk = end - curr;
+		if (chunk > chunk_sz)
+			chunk = chunk_sz;
+		sha384_update(&ctx, curr, chunk);
+		curr += chunk;
+		WATCHDOG_RESET();
+	}
+#else
+	sha384_update(&ctx, input, ilen);
+#endif
+
+	sha384_finish(&ctx, output);
+}
+
+#endif
+
+#if defined(CONFIG_SHA512)
+void sha512_starts(sha512_context * ctx)
+{
+	ctx->state[0] = SHA512_H0;
+	ctx->state[1] = SHA512_H1;
+	ctx->state[2] = SHA512_H2;
+	ctx->state[3] = SHA512_H3;
+	ctx->state[4] = SHA512_H4;
+	ctx->state[5] = SHA512_H5;
+	ctx->state[6] = SHA512_H6;
+	ctx->state[7] = SHA512_H7;
+	ctx->count[0] = ctx->count[1] = 0;
+}
+
+void sha512_update(sha512_context *ctx, const uint8_t *input, uint32_t length)
+{
+	sha512_base_do_update(ctx, input, length);
+}
+
+void sha512_finish(sha512_context * ctx, uint8_t digest[SHA512_SUM_LEN])
+{
+	int i;
+
+	sha512_base_do_finalize(ctx);
+	for(i=0; i<SHA512_SUM_LEN / sizeof(uint64_t); i++)
+		PUT_UINT64_BE(ctx->state[i], digest, i * 8);
+}
+
+/*
+ * Output = SHA-512( input buffer ). Trigger the watchdog every 'chunk_sz'
+ * bytes of input processed.
+ */
+void sha512_csum_wd(const unsigned char *input, unsigned int ilen,
+		unsigned char *output, unsigned int chunk_sz)
+{
+	sha512_context ctx;
+#if defined(CONFIG_HW_WATCHDOG) || defined(CONFIG_WATCHDOG)
+	const unsigned char *end;
+	unsigned char *curr;
+	int chunk;
+#endif
+
+	sha512_starts(&ctx);
+
+#if defined(CONFIG_HW_WATCHDOG) || defined(CONFIG_WATCHDOG)
+	curr = (unsigned char *)input;
+	end = input + ilen;
+	while (curr < end) {
+		chunk = end - curr;
+		if (chunk > chunk_sz)
+			chunk = chunk_sz;
+		sha512_update(&ctx, curr, chunk);
+		curr += chunk;
+		WATCHDOG_RESET();
+	}
+#else
+	sha512_update(&ctx, input, ilen);
+#endif
+
+	sha512_finish(&ctx, output);
+}
+#endif
diff --git a/tools/Makefile b/tools/Makefile
index d377d85f74e7..81aa374a32dd 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -110,6 +110,7 @@ dumpimage-mkimage-objs := aisimage.o \
 			lib/crc16.o \
 			lib/sha1.o \
 			lib/sha256.o \
+			lib/sha512.o \
 			common/hash.o \
 			ublimage.o \
 			zynqimage.o \
@@ -209,6 +210,7 @@ HOSTCFLAGS_crc8.o := -pedantic
 HOSTCFLAGS_md5.o := -pedantic
 HOSTCFLAGS_sha1.o := -pedantic
 HOSTCFLAGS_sha256.o := -pedantic
+HOSTCFLAGS_sha512.o := -pedantic -DCONFIG_SHA512 -DCONFIG_SHA384
 
 quiet_cmd_wrap = WRAP    $@
 cmd_wrap = echo "\#include <../$(patsubst $(obj)/%,%,$@)>" >$@
-- 
2.29.2

