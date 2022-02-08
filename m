Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD73C4AD608
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 12:14:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtL4m4B7Nz3bWG
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 22:14:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pywoWdzx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pywoWdzx; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtL4Q2DLPz2xsq
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 22:14:14 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id m7so15871799pjk.0
 for <openbmc@lists.ozlabs.org>; Tue, 08 Feb 2022 03:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M6dFF/3cb1yBvA33S97Bm5L8BHpbs0JJU1/dX2EpWLI=;
 b=pywoWdzx5v0l5fZ0IgWo2v6rAtlgqxiobSxy26QJ7qO3QybLZHagGooj4E4TuQB2UQ
 pCTYxIkdVOEttgvuvM2i4/MDeTBKBRYnrIHgx1TjBcNgE0sED+VfONxQknKVfo+qRINo
 USf6h5/F0qNSQUgS3Bqppb52D5wq5YZtcF9cSPODkJj1D6N9dv3+2lNxQHST7v2erARv
 OfEGK8EPdlKrzfhY2KEHB7ZL4E7se4vONwbbEB48uYfteoArzqErkfErs1DMrbWa9kM3
 MfT5DEjbO0jMUtCuLpxO6+VaPQqs3FSGv8HrIcDiFO7D2elVLuzNXI8c4nn3rvmaQavN
 fmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=M6dFF/3cb1yBvA33S97Bm5L8BHpbs0JJU1/dX2EpWLI=;
 b=5oF8mFEsIeffEkh6GgVKLombPFNVnZUMD2fVsmtduDB76F3aqPQeRuSOw91SeFIPrS
 EuwvG+E3BF3EoPq6PlKd+wZM0soWvgBd2482o0CROoRy7UbyEAVxpOyiIg9sFFWDtnV8
 OB+Lm+IDYrUP7klMJZ8HCu50MYxNCrDE5oc/lMmy98hwkiwIa53EyfiSHaldaMGER49e
 P4V6e0gHdc7hZrczf8zjDbfKpII1OruCycHDJtoI5z8BJ/Qf7duwK6/PXX7uB5uMnuyG
 c6idUyfVcae5y/AqzSutMkZOGcQLwcSe/nvaegUNu0HUCfT4jjbzxhOFqr1Xq/WY3S4q
 zOsw==
X-Gm-Message-State: AOAM531LR3R5xf8snp8sEGDYtRFhbJMIIvYCRhMPT0Yw9q6qRQwuBYjB
 dBaThBy4+yj+RWV4pXzXJS6rhEtHsJ4=
X-Google-Smtp-Source: ABdhPJxQ1uJjclOnnBJw/eSNTyB5OrIDRhlvlGy8OErXhXrdvjdVx+DtoerNDSasnbdQPMt/BGDxxA==
X-Received: by 2002:a17:903:2344:: with SMTP id
 c4mr3792179plh.104.1644318849207; 
 Tue, 08 Feb 2022 03:14:09 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id mu13sm2837658pjb.28.2022.02.08.03.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:14:07 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] crypto: Restore old driver for
 Aspeed HACE
Date: Tue,  8 Feb 2022 21:43:52 +1030
Message-Id: <20220208111353.200603-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The HACE supports MD5, SHA1 and SHA2 family hash functions. This driver
uses it in a polling mode to perform hash calculations over buffers
placed in DRAM.

It also includes a workaround[1] that performs a reset when error occurs.
This is incompatible with simultaneous operation of the ACRY
hardware, as the HACE reset line is shared with the ACRY hardware. It
should only be used as a workaround for when the ASPEED_HACE driver,
which uses accumulative mode, cannot be used.

 [1] https://lore.kernel.org/r/20210715045258.13912-1-joel@jms.id.au

Currently simulator for support for accumulative mode is not in place,
so this driver exists for supporting machines that must boot in a
simulator.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
OpenBMC has not moved to the latest ASPEED SDK for u-boot as the newer
u-boot contains a backport of the HACE driver that made it to mainline
u-boot, which uses accumulative mode. Troy from ASPEED has posted some
patches for accumulative mode, but that have issues.

This patch is a compromise in order to ship the latest fixes for other
parts of the u-boot tree.

 configs/ast2600_openbmc_spl_emmc_defconfig |   2 +-
 drivers/crypto/Kconfig                     |  19 ++
 drivers/crypto/Makefile                    |   1 +
 drivers/crypto/aspeed_hace_v1.c            | 275 +++++++++++++++++++++
 4 files changed, 296 insertions(+), 1 deletion(-)
 create mode 100644 drivers/crypto/aspeed_hace_v1.c

diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
index fb8e8a9549d8..4ea0f34148d0 100644
--- a/configs/ast2600_openbmc_spl_emmc_defconfig
+++ b/configs/ast2600_openbmc_spl_emmc_defconfig
@@ -93,7 +93,7 @@ CONFIG_SYSCON=y
 CONFIG_SPL_OF_TRANSLATE=y
 CONFIG_CLK=y
 CONFIG_SPL_CLK=y
-CONFIG_ASPEED_HACE=y
+CONFIG_ASPEED_HACE_V1=y
 CONFIG_DM_GPIO=y
 CONFIG_SPL_GPIO_HOG=y
 CONFIG_ASPEED_GPIO=y
diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index c4dba459fb20..8ed7f51d3337 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -1,5 +1,24 @@
 menu "Hardware crypto devices"
 
+config ASPEED_HACE_V1
+	bool "ASPEED Hash and Crypto Engine (V1)"
+	depends on ASPEED_AST2600
+	depends on !ASPEED_HACE
+	depends on !ASPEED_ACRY
+	imply SHA_HW_ACCEL
+	imply SHA_PROG_HW_ACCEL
+	imply CMD_HASH
+	help
+	 Select this option to enable a driver for using the SHA engine in
+	 the ASPEED BMC SoCs.
+
+	 This driver is not compatible with simultaneous operation of the ACRY
+	 hardware. It should only be used when the ASPEED_HACE driver, which
+	 uses accumulative mode, cannot be used.
+
+	 Enabling this allows the use of SHA operations in hardware without
+	 requiring the SHA software implementations, saving code size.
+
 config ASPEED_HACE
 	bool "ASPEED Hash and Crypto Engine"
 	depends on ASPEED_AST2600
diff --git a/drivers/crypto/Makefile b/drivers/crypto/Makefile
index e0af482dc232..2a5f9d5186a2 100644
--- a/drivers/crypto/Makefile
+++ b/drivers/crypto/Makefile
@@ -6,6 +6,7 @@
 obj-$(CONFIG_EXYNOS_ACE_SHA)	+= ace_sha.o
 obj-y += rsa_mod_exp/
 obj-y += fsl/
+obj-$(CONFIG_ASPEED_HACE_V1) += aspeed_hace_v1.o
 obj-$(CONFIG_ASPEED_HACE) += aspeed_hace.o
 obj-$(CONFIG_ASPEED_ACRY) += aspeed_acry.o
 obj-$(CONFIG_RSA_ASPEED_EXP) += aspeed_rsa.o
diff --git a/drivers/crypto/aspeed_hace_v1.c b/drivers/crypto/aspeed_hace_v1.c
new file mode 100644
index 000000000000..f40779c08816
--- /dev/null
+++ b/drivers/crypto/aspeed_hace_v1.c
@@ -0,0 +1,275 @@
+/*
+ * (C) Copyright ASPEED Technology Inc.
+ * Copyright 2021 IBM Corp.
+ *
+ * SPDX-License-Identifier:	GPL-2.0-or-later
+ */
+
+#include <common.h>
+#include <clk.h>
+
+#include <log.h>
+#include <asm/io.h>
+#include <malloc.h>
+#include <hash.h>
+
+#include <dm/device.h>
+#include <dm/fdtaddr.h>
+
+#include <linux/bitops.h>
+#include <linux/delay.h>
+#include <linux/kernel.h>
+#include <linux/iopoll.h>
+
+#define ASPEED_HACE_STS			0x1C
+#define  HACE_RSA_ISR			BIT(13)
+#define  HACE_CRYPTO_ISR		BIT(12)
+#define  HACE_HASH_ISR			BIT(9)
+#define  HACE_RSA_BUSY			BIT(2)
+#define  HACE_CRYPTO_BUSY		BIT(1)
+#define  HACE_HASH_BUSY			BIT(0)
+#define ASPEED_HACE_HASH_SRC		0x20
+#define ASPEED_HACE_HASH_DIGEST_BUFF	0x24
+#define ASPEED_HACE_HASH_KEY_BUFF	0x28
+#define ASPEED_HACE_HASH_DATA_LEN	0x2C
+#define  HACE_SG_LAST			BIT(31)
+#define ASPEED_HACE_HASH_CMD		0x30
+#define  HACE_SHA_BE_EN			BIT(3)
+#define  HACE_MD5_LE_EN			BIT(2)
+#define  HACE_ALGO_MD5			0
+#define  HACE_ALGO_SHA1			BIT(5)
+#define  HACE_ALGO_SHA224		BIT(6)
+#define  HACE_ALGO_SHA256		(BIT(4) | BIT(6))
+#define  HACE_ALGO_SHA512		(BIT(5) | BIT(6))
+#define  HACE_ALGO_SHA384		(BIT(5) | BIT(6) | BIT(10))
+#define  HACE_SG_EN			BIT(18)
+
+#define ASPEED_MAX_SG			32
+
+struct aspeed_sg {
+	u32 len;
+	u32 addr;
+};
+
+struct aspeed_hash_ctx {
+	u32 method;
+	u32 digest_size;
+	u32 len;
+	u32 count;
+	struct aspeed_sg list[ASPEED_MAX_SG]; /* Must be 8 byte aligned */
+};
+
+struct aspeed_hace {
+	struct clk clk;
+};
+
+static phys_addr_t base;
+
+static int aspeed_hace_wait_completion(u32 reg, u32 flag, int timeout_us)
+{
+	u32 val;
+
+	return readl_poll_timeout(reg, val, (val & flag) == flag, timeout_us);
+}
+
+static int digest_object(const void *src, unsigned int length, void *digest,
+		  u32 method)
+{
+	if (!((u32)src & BIT(31))) {
+		debug("HACE src out of bounds: can only copy from SDRAM\n");
+		return -EINVAL;
+	}
+
+	if ((u32)digest & 0x7) {
+		debug("HACE dest alignment incorrect: %p\n", digest);
+		return -EINVAL;
+	}
+
+
+	if (readl(base + ASPEED_HACE_STS) & HACE_HASH_BUSY) {
+		debug("HACE error: engine busy\n");
+		return -EBUSY;
+	}
+
+	/* Clear pending completion status */
+	writel(HACE_HASH_ISR, base + ASPEED_HACE_STS);
+
+	writel((u32)src, base + ASPEED_HACE_HASH_SRC);
+	writel((u32)digest, base + ASPEED_HACE_HASH_DIGEST_BUFF);
+	writel(length, base + ASPEED_HACE_HASH_DATA_LEN);
+	writel(HACE_SHA_BE_EN | method, base + ASPEED_HACE_HASH_CMD);
+
+	/* SHA512 hashing appears to have a througput of about 12MB/s */
+	aspeed_hace_wait_completion(base + ASPEED_HACE_STS, HACE_HASH_ISR,
+				    1000 + (length >> 3));
+
+	if (readl(base + ASPEED_HACE_STS)) {
+		debug("\nHACE error 0x%08x, resetting\n", readl(base + 0x1c));
+
+		writel(0x10, 0x1e6e2040);
+		mdelay(5);
+		writel(0x10, 0x1e6e2044);
+	}
+
+	return 0;
+}
+
+void hw_sha1(const unsigned char *pbuf, unsigned int buf_len,
+	       unsigned char *pout, unsigned int chunk_size)
+{
+	int rc;
+
+	rc = digest_object(pbuf, buf_len, pout, HACE_ALGO_SHA1);
+	if (rc)
+		debug("HACE failure: %d\n", rc);
+}
+
+void hw_sha256(const unsigned char *pbuf, unsigned int buf_len,
+	       unsigned char *pout, unsigned int chunk_size)
+{
+	int rc;
+
+	rc = digest_object(pbuf, buf_len, pout, HACE_ALGO_SHA256);
+	if (rc)
+		debug("HACE failure: %d\n", rc);
+}
+
+void hw_sha512(const unsigned char *pbuf, unsigned int buf_len,
+	       unsigned char *pout, unsigned int chunk_size)
+{
+	int rc;
+
+	rc = digest_object(pbuf, buf_len, pout, HACE_ALGO_SHA512);
+	if (rc)
+		debug("HACE failure: %d\n", rc);
+}
+
+#if IS_ENABLED(CONFIG_SHA_PROG_HW_ACCEL)
+int hw_sha_init(struct hash_algo *algo, void **ctxp)
+{
+	struct aspeed_hash_ctx *ctx;
+	u32 method;
+
+	if (!strcmp(algo->name, "sha1")) {
+		method = HACE_ALGO_SHA1;
+	}
+	else if (!strcmp(algo->name, "sha256")) {
+		method = HACE_ALGO_SHA256;
+	}
+	else if (!strcmp(algo->name, "sha512")) {
+		method = HACE_ALGO_SHA512;
+	}
+	else  {
+		return -ENOTSUPP;
+	}
+
+	ctx = memalign(8, sizeof(*ctx));
+	memset(ctx, '\0', sizeof(*ctx));
+
+	if (ctx == NULL) {
+		debug("HACE error: Cannot allocate memory for context\n");
+		return -ENOMEM;
+	}
+
+	if (((uintptr_t)ctx->list & 0x3) != 0) {
+		printf("HACE error: Invalid alignment for input data\n");
+		return -EINVAL;
+	}
+
+	ctx->method = method | HACE_SG_EN;
+	ctx->digest_size = algo->digest_size;
+	*ctxp = ctx;
+
+	return 0;
+}
+
+int hw_sha_update(struct hash_algo *algo, void *hash_ctx, const void *buf,
+		  unsigned int size, int is_last)
+{
+	struct aspeed_hash_ctx *ctx = hash_ctx;
+	struct aspeed_sg *sg = &ctx->list[ctx->count];
+
+	if (ctx->count >= ARRAY_SIZE(ctx->list)) {
+		debug("HACE error: Reached maximum number of hash segments\n");
+		free(ctx);
+		return -EINVAL;
+	}
+
+	sg->addr = (u32)buf;
+	sg->len = size;
+	if (is_last)
+		sg->len |= HACE_SG_LAST;
+
+	ctx->count++;
+	ctx->len += size;
+
+	return 0;
+}
+
+int hw_sha_finish(struct hash_algo *algo, void *hash_ctx, void *dest_buf, int size)
+{
+	struct aspeed_hash_ctx *ctx = hash_ctx;
+	int rc;
+
+	if (size < ctx->digest_size) {
+		debug("HACE error: insufficient size on destination buffer\n");
+		free(ctx);
+		return -EINVAL;
+	}
+
+	rc = digest_object(ctx->list, ctx->len, dest_buf, ctx->method);
+	if (rc)
+		debug("HACE Scatter-Gather failure\n");
+
+	free(ctx);
+
+	return rc;
+}
+#endif
+
+static int aspeed_hace_probe(struct udevice *dev)
+{
+	struct aspeed_hace *hace = dev_get_priv(dev);
+	int ret;
+
+	ret = clk_get_by_index(dev, 0, &hace->clk);
+	if (ret < 0) {
+		debug("Can't get clock for %s: %d\n", dev->name, ret);
+		return ret;
+	}
+
+	ret = clk_enable(&hace->clk);
+	if (ret) {
+		debug("Failed to enable fsi clock (%d)\n", ret);
+		return ret;
+	}
+
+	/* As the crypto code does not pass us any driver state */
+	base = devfdt_get_addr(dev);
+
+	return ret;
+}
+
+static int aspeed_hace_remove(struct udevice *dev)
+{
+	struct aspeed_hace *hace = dev_get_priv(dev);
+
+	clk_disable(&hace->clk);
+
+	return 0;
+}
+
+static const struct udevice_id aspeed_hace_ids[] = {
+	{ .compatible = "aspeed,ast2600-hace" },
+	{ }
+};
+
+U_BOOT_DRIVER(aspeed_hace) = {
+	.name		= "aspeed_hace",
+	.id		= UCLASS_MISC,
+	.of_match	= aspeed_hace_ids,
+	.probe		= aspeed_hace_probe,
+	.remove 	= aspeed_hace_remove,
+	.priv_auto_alloc_size = sizeof(struct aspeed_hace),
+	.flags  = DM_FLAG_PRE_RELOC,
+};
-- 
2.34.1

