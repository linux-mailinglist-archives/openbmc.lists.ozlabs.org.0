Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC3435D9B9
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 10:12:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKJHZ69spz3c4t
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 18:12:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ZGC7dths;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZGC7dths; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKJCF72SDz3bcf
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 18:08:41 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so8584839pjv.1
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 01:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eQZ/wAduD5eem6ThninarLD+PrB4HMa1t+U0aEExpc4=;
 b=ZGC7dthsOt12WyWIaDrOHd8NkOGhYCiExCYGGHI+kBL6b3wgtWb6cVLSbLfhLtzQrb
 59i5JDvEGjjK+uZ2LZpjSc2YWAR4NMZ2DL4NlY7e1mqV28wTwNB90TnWtQZEmSMchlr0
 E2snfiivDwGqJYyBkLeYb+k/rfEvNVZ4j4mklnYPpvD5tJ2Q/lkd0zfeBl97RMduTfZu
 PueZ4CkABdvKm3OXWsFh3tkYB50oj+5yBlsODOaM69zEcVm77RNOkwHW50nlRXUfl067
 F6Uh6UwfOWJ9mKX4bebFp4FVwd5YpeVGYUVGWRwi2sQNZEtP5tELfYs0yPduApSmG9uD
 GleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eQZ/wAduD5eem6ThninarLD+PrB4HMa1t+U0aEExpc4=;
 b=d+sda+aobwmA4XHhRHpcWUo5QoWv0xZr8m3Ru4VmaL6tiBTiiAHgAIqFZPJXFcPNm0
 mC4fQFddlsmbFTSAtOMJcy+Ky2XTXwqGXsQSoVXpVVcCAizN8HA3/v6CjQ8u7nM3r3Xb
 VkOp/Wm3InA0X/5UXNo55VDUSMVBhvk2NJQb9jaov/bvGq0Jlt3XAKQkFwV6Eu2zap1Z
 I1cjKVwZvylaCCHhHIec4WlvXe2rgN/F135hC2mRu2UZHsFGEImPkpE/kOUY908RLpT6
 +rd+PqfSESgP5t003LLgfk6LkT/0MqY+u/jmn6pK/Xpgy/fJA4h+FW39oDnKfKsdhHc7
 gyHw==
X-Gm-Message-State: AOAM533ivNH/zBzTsgX6ovNxYELbUQpNq3phOLbAIUjdZ87WH19NR1kA
 DUcnYnjQfZVo7hr0yOpzU2goTHG9dL8=
X-Google-Smtp-Source: ABdhPJw3EfANKup4r+3gQdmHJB18njpcGzvsJbLqVEgZ73GlVZzDhMIn33tCGUg6Dl1Q2IQmCBzicg==
X-Received: by 2002:a17:902:8487:b029:e9:a884:7450 with SMTP id
 c7-20020a1709028487b02900e9a8847450mr22550611plo.49.1618301319107; 
 Tue, 13 Apr 2021 01:08:39 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id nh24sm1443507pjb.38.2021.04.13.01.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 01:08:38 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 10/11] crypto: Add driver for
 Aspeed HACE
Date: Tue, 13 Apr 2021 17:37:54 +0930
Message-Id: <20210413080755.73572-11-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413080755.73572-1-joel@jms.id.au>
References: <20210413080755.73572-1-joel@jms.id.au>
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
 drivers/crypto/Kconfig       |  16 +++
 drivers/crypto/Makefile      |   1 +
 drivers/crypto/aspeed_hace.c | 250 +++++++++++++++++++++++++++++++++++
 3 files changed, 267 insertions(+)
 create mode 100644 drivers/crypto/aspeed_hace.c

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 1ea116be7503..f78e41e0e9e7 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -2,4 +2,20 @@ menu "Hardware crypto devices"
 
 source drivers/crypto/fsl/Kconfig
 
+config ASPEED_HACE
+	bool "ASPEED Hash and Crypto Engine"
+	select SHA_HW_ACCEL
+	select SHA_PROG_HW_ACCEL
+	depends on ASPEED_AST2600
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
index 000000000000..473d4d7391b7
--- /dev/null
+++ b/drivers/crypto/aspeed_hace.c
@@ -0,0 +1,250 @@
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
+	struct aspeed_sg list[ASPEED_MAX_SG] __attribute__((aligned(8)));
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
+	ctx = calloc(1, sizeof(*ctx));
+
+	if (ctx == NULL) {
+		debug("Cannot allocate memory for context\n");
+		return -ENOMEM;
+	}
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

