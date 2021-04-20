Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EDB365289
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 08:48:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPZ515T8rz304d
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 16:48:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mSu7Z5Mx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mSu7Z5Mx; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPZ3z55G1z2ysv
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 16:47:11 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id h11so7221142pfn.0
 for <openbmc@lists.ozlabs.org>; Mon, 19 Apr 2021 23:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ig0Ym6PMR7G/oGGRTNZihy/FFDZqPcRU6Xt7+riU+aI=;
 b=mSu7Z5Mx+LIPw0RHYP2UTBDmKKf99e1xUDPU1apCMSS3jYS4pMkKzaah7G06/3xAoI
 x60ShgFWG4f7HIbCYG5Enat0sxtemFDmcJAReDcJ7pC2zap6Tmp1RY85a0uVwEgTWdXF
 Q0/xwmda+NEOzNfWSCSWkEATkPAs6rLA39QrId6uVCW72aDvRuJevd6HVrYIF3s4Uc+q
 p7CglkenNeMw9wGBb0QEBIv0EpPCZhMIrFF+gQt93VNYDjSPYvP5g4r3bsTwk2kgS3Ap
 rCKYJGJ3NbXmqEQmmvx2cIUPLakA0+ouW8Ke8qTVr0z/6hivaRjNOilVBxEI9fyBPiDH
 6HBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ig0Ym6PMR7G/oGGRTNZihy/FFDZqPcRU6Xt7+riU+aI=;
 b=gP67eXJ+5LL+3XcSxU9jPPRWiwa/z1iCR+OpGjyzsA13dCUxaxr/n2K4Tn+L9PA85l
 iDU3N/sq6Cfuu0dbt1b3IHqHsaXgeHv/X24h21auu8vmzIo47hppK0yTLoO/hcOJG170
 llmlmwp7LIGCa2FRK6Crl5OZXOaZ7cSOV8+gVL+c8Ga18choFw4J3xKipbyg1Aj84egE
 qbshVLcpCYvmR0Ob1utjQFV+WGkStb/JW8upgzQWyoUgCUA4xD0FCTAZrVTJncF7Mmh0
 xE5E5Z1YL0QUy/4goBpZRXHQ4AVcrSU/6SW0E2FDXjfKh4JjxLOnhGsRvlg8BjWf6tsA
 B68g==
X-Gm-Message-State: AOAM532/YUv3v5OORCqELz0PSvEyPMwUq3UqvQPVCXLGf+ezdl+HHIPJ
 EPrGmpX6oVoLg9lbyMAAte/2UBP1HJw=
X-Google-Smtp-Source: ABdhPJwXDI9KLCsNkeEda/4lw72t0D8hdmZQbYPUjulSvnDMEanQYyQYWv1+oK1+oyfT/pSHfenTVQ==
X-Received: by 2002:a63:1a07:: with SMTP id a7mr731432pga.139.1618901228501;
 Mon, 19 Apr 2021 23:47:08 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id d12sm582311pjj.50.2021.04.19.23.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 23:47:07 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 02/10] crypto: Add driver
 for Aspeed HACE
Date: Tue, 20 Apr 2021 16:16:40 +0930
Message-Id: <20210420064648.994075-3-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420064648.994075-1-joel@jms.id.au>
References: <20210420064648.994075-1-joel@jms.id.au>
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The HACE supports MD5, SHA1 and SHA2 family hash functions. This driver
uses it in a polling mode to perform hash calculations over buffers
placed in DRAM.

Co-developed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 configs/ast2600_openbmc_spl_emmc_defconfig |   1 +
 drivers/crypto/Kconfig                     |  19 ++
 drivers/crypto/Makefile                    |   1 +
 drivers/crypto/aspeed_hace.c               | 266 +++++++++++++++++++++
 4 files changed, 287 insertions(+)
 create mode 100644 drivers/crypto/aspeed_hace.c

diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
index 5a4d66da1cea..f58a677f1914 100644
--- a/configs/ast2600_openbmc_spl_emmc_defconfig
+++ b/configs/ast2600_openbmc_spl_emmc_defconfig
@@ -97,6 +97,7 @@ CONFIG_SYSCON=y
 CONFIG_SPL_OF_TRANSLATE=y
 CONFIG_CLK=y
 CONFIG_SPL_CLK=y
+CONFIG_ASPEED_HACE=y
 CONFIG_DM_GPIO=y
 CONFIG_ASPEED_GPIO=y
 CONFIG_DM_I2C=y
diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 1ea116be7503..e92037d88906 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -2,4 +2,23 @@ menu "Hardware crypto devices"
 
 source drivers/crypto/fsl/Kconfig
 
+config ASPEED_HACE
+	bool "ASPEED Hash and Crypto Engine"
+	depends on ASPEED_AST2600
+	imply SHA_HW_ACCEL
+	imply SHA_PROG_HW_ACCEL
+	imply SHA512
+	imply SHA512_ALGO
+	imply CMD_HASH
+	help
+	 Select this option to enable a driver for using the SHA engine in
+	 the ASPEED BMC SoCs.
+
+	 Enabling this allows the use of SHA operations in hardware without requiring the
+	 SHA software implementations, saving code size.
+
+	 Due to hardware limitations it cannot be used with a FIT placed in SPI
+	 FLASH. Data can only be hashed if it is in SDRAM, making this relevant
+	 for MMC and network boot only.
+
 endmenu
diff --git a/drivers/crypto/Makefile b/drivers/crypto/Makefile
index efbd1d3fca05..ac93b1295954 100644
--- a/drivers/crypto/Makefile
+++ b/drivers/crypto/Makefile
@@ -4,5 +4,6 @@
 # 	http://www.samsung.com
 
 obj-$(CONFIG_EXYNOS_ACE_SHA)	+= ace_sha.o
+obj-$(CONFIG_ASPEED_HACE)	+= aspeed_hace.o
 obj-y += rsa_mod_exp/
 obj-y += fsl/
diff --git a/drivers/crypto/aspeed_hace.c b/drivers/crypto/aspeed_hace.c
new file mode 100644
index 000000000000..a99fb7c249be
--- /dev/null
+++ b/drivers/crypto/aspeed_hace.c
@@ -0,0 +1,266 @@
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
+	return aspeed_hace_wait_completion(base + ASPEED_HACE_STS,
+			HACE_HASH_ISR,
+			1000 + (length >> 3));
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
2.30.2

