Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 880004330B5
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 10:06:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYRCq05wjz3bmf
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 19:06:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hI4DfCA5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hI4DfCA5; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYRCL2Dc4z2yJN
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 19:06:20 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id s136so15400273pgs.4
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 01:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d+J3c/bJ+2MsNrka8T2vVrJgwI4+vIM/IAoIFQdXuws=;
 b=hI4DfCA5JIEy/M/N/kIdrWGdAdPC8YlVi2QeHY4rQQoqob0kSFGuzHEwX7oLSh2AWk
 5Q9SRGa+eDp4+cELUJan1K51AiHF8Roe57jOYTq6123T48Fweq3fIkewS0pEVEGWNzSp
 GKEvztgLUFsot5r3+Z3XlDJyBovpuRDhtzgZ1WNTspWIRf20qkgppXYSd8NpyWxpNtvF
 X7ctNqxZjxLZrmb4/pNgt8/pDEA8U0ZBKsJHB5TyeYUlzJugQBTmW09vU+l7YC0Y1OKQ
 P68y11tMOpSOl7CrAarH3lyFDiLEZtFkfMADKVEiANZBJyZbiyyWlcPewENh6R7zx+gV
 bMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=d+J3c/bJ+2MsNrka8T2vVrJgwI4+vIM/IAoIFQdXuws=;
 b=yHWctrZPDiTgsk+Sq/V3oQFD1Mo4vXlMJYr2Er4V/p+EfFZlg934NWVf72uJzYMgz/
 k4gL54NWV1HV/JRMTJWYBxiR0gub6WjebdoOEzeJxKRb6232+ugM0TjNsaXj8rF64iLM
 YLprS7KbYd/hV+VJZI07GA8vzTBMGgTJR6EQvXCV1kXPiBQg4vPRWI9HjGIb7WjM+5mS
 HBPay8fd2UC0nE4v/TOryC2Out5cxBtT+Z5CdAseNes+b1UCjCZoh06OudQdkY/F2oVD
 oqvVPMs6DA4Dx/ob+mzTnnEf2+D6VHfyyCpNf5A/EpprUC10A8dyt4PHiHAjPTPjYo6/
 EYJg==
X-Gm-Message-State: AOAM531XwPHfii4DRAE9grmvQW6Xbnb8ZjeySwX3lZGLfHIUvEHm1Mvb
 isL/RSF1r4z/K+tkBGXLUNs=
X-Google-Smtp-Source: ABdhPJx+FRKVdaB8UngRBHpMA8RvRkVNpegYKZ30tjQJ71LIdRQbslpf5DtzunAiwt7PXH319ziyfQ==
X-Received: by 2002:a05:6a00:18a4:b0:44d:cde6:e8c7 with SMTP id
 x36-20020a056a0018a400b0044dcde6e8c7mr11783716pfh.9.1634630776770; 
 Tue, 19 Oct 2021 01:06:16 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id t3sm14536870pgu.87.2021.10.19.01.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 01:06:15 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.u>,
	openbmc@lists.ozlabs.org
Subject: [RFC PATCH] ARM: aspeed: Add secure boot controller support
Date: Tue, 19 Oct 2021 18:36:08 +1030
Message-Id: <20211019080608.283324-1-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This reads out the status of the secure boot controller and exposes it
in sysfs.

An example on a AST2600A3 QEmu model:

 # grep . /sys/bus/soc/devices/soc0/*
 /sys/bus/soc/devices/soc0/abr_image:0
 /sys/bus/soc/devices/soc0/family:AST2600
 /sys/bus/soc/devices/soc0/low_security_key:0
 /sys/bus/soc/devices/soc0/machine:Rainier 2U
 /sys/bus/soc/devices/soc0/otp_protected:0
 /sys/bus/soc/devices/soc0/revision:A3
 /sys/bus/soc/devices/soc0/secure_boot:1
 /sys/bus/soc/devices/soc0/serial_number:888844441234abcd
 /sys/bus/soc/devices/soc0/soc_id:05030303
 /sys/bus/soc/devices/soc0/uart_boot:1

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g6.dtsi    |  5 ++
 drivers/soc/aspeed/aspeed-socinfo.c | 71 +++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index ee171b3364fa..8f947ed47fc5 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -384,6 +384,11 @@ adc1: adc@1e6e9100 {
 				status = "disabled";
 			};
 
+			sbc: secure-boot-controller@1e6f2000 {
+				compatible = "aspeed,ast2600-sbc";
+				reg = <0x1e6f2000 0x1000>;
+			};
+
 			gpio0: gpio@1e780000 {
 				#gpio-cells = <2>;
 				gpio-controller;
diff --git a/drivers/soc/aspeed/aspeed-socinfo.c b/drivers/soc/aspeed/aspeed-socinfo.c
index 1ca140356a08..6fa0c891f3cb 100644
--- a/drivers/soc/aspeed/aspeed-socinfo.c
+++ b/drivers/soc/aspeed/aspeed-socinfo.c
@@ -9,6 +9,8 @@
 #include <linux/slab.h>
 #include <linux/sys_soc.h>
 
+static u32 security_status;
+
 static struct {
 	const char *name;
 	const u32 id;
@@ -74,6 +76,54 @@ static const char *siliconid_to_rev(u32 siliconid)
 	return "??";
 }
 
+#define SEC_STATUS		0x14
+#define ABR_IMAGE_SOURCE	BIT(13)
+#define OTP_PROTECTED		BIT(8)
+#define LOW_SEC_KEY		BIT(7)
+#define SECURE_BOOT		BIT(6)
+#define UART_BOOT		BIT(5)
+
+static ssize_t abr_image_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%d\n", !!(security_status & ABR_IMAGE_SOURCE));
+}
+static DEVICE_ATTR_RO(abr_image);
+
+static ssize_t low_security_key_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%d\n", !!(security_status & LOW_SEC_KEY));
+}
+static DEVICE_ATTR_RO(low_security_key);
+
+static ssize_t otp_protected_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%d\n", !!(security_status & OTP_PROTECTED));
+}
+static DEVICE_ATTR_RO(otp_protected);
+
+static ssize_t secure_boot_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%d\n", !!(security_status & SECURE_BOOT));
+}
+static DEVICE_ATTR_RO(secure_boot);
+
+static ssize_t uart_boot_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	/* Invert the bit, as 1 is boot from SPI/eMMC */
+	return sprintf(buf, "%d\n", !(security_status & UART_BOOT));
+}
+static DEVICE_ATTR_RO(uart_boot);
+
+static struct attribute *aspeed_attrs[] = {
+	&dev_attr_abr_image.attr,
+	&dev_attr_low_security_key.attr,
+	&dev_attr_otp_protected.attr,
+	&dev_attr_secure_boot.attr,
+	&dev_attr_uart_boot.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(aspeed);
+
 static int __init aspeed_socinfo_init(void)
 {
 	struct soc_device_attribute *attrs;
@@ -81,6 +131,7 @@ static int __init aspeed_socinfo_init(void)
 	struct device_node *np;
 	void __iomem *reg;
 	bool has_chipid = false;
+	bool has_sbe = false;
 	u32 siliconid;
 	u32 chipid[2];
 	const char *machine = NULL;
@@ -109,6 +160,20 @@ static int __init aspeed_socinfo_init(void)
 	}
 	of_node_put(np);
 
+	/* AST2600 only */
+	np = of_find_compatible_node(NULL, NULL, "aspeed,ast2600-sbc");
+	if (of_device_is_available(np)) {
+		void *base = of_iomap(np, 0);
+		if (!base) {
+			of_node_put(np);
+			return -ENODEV;
+		}
+		security_status = readl(base + SEC_STATUS);
+		has_sbe = true;
+		iounmap(base);
+		of_node_put(np);
+	}
+
 	attrs = kzalloc(sizeof(*attrs), GFP_KERNEL);
 	if (!attrs)
 		return -ENODEV;
@@ -135,6 +200,9 @@ static int __init aspeed_socinfo_init(void)
 		attrs->serial_number = kasprintf(GFP_KERNEL, "%08x%08x",
 						 chipid[1], chipid[0]);
 
+	if (has_sbe)
+		attrs->custom_attr_group = aspeed_groups[0];
+
 	soc_dev = soc_device_register(attrs);
 	if (IS_ERR(soc_dev)) {
 		kfree(attrs->soc_id);
@@ -148,6 +216,9 @@ static int __init aspeed_socinfo_init(void)
 			attrs->revision,
 			attrs->soc_id);
 
+	if (has_sbe && (security_status & SECURE_BOOT))
+		pr_info("AST2600 secure boot enabled\n");
+
 	return 0;
 }
 early_initcall(aspeed_socinfo_init);
-- 
2.33.0

