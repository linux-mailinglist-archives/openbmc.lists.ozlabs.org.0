Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BE8365292
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 08:50:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPZ7X3QRNz2ysw
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 16:50:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=MmraR7Xf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MmraR7Xf; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPZ4J4BF2z2yxR
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 16:47:28 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id s14so14458255pjl.5
 for <openbmc@lists.ozlabs.org>; Mon, 19 Apr 2021 23:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+HhgpnEun99PWqFA1LBFr7BYvEd5x5pSH6OnjmjU+7k=;
 b=MmraR7XfOv9b3tSzGHoBnIVIgY5iCFDZpjpepqeChxwcbNwDVqGrhcS62B9dgzi8F3
 UT8j9Ss28wO2aVW3f5hTuDj+EcSzY0v2ijCYYHo+BPn2n3tGi41/YiMyCTRssQxHFA5L
 sJFXhrtj4msHNkTx7ynSLsV5x7kcJPVSBtnHH/mkgxQL7/0evoN6x0QdhR+0e8e9qA88
 zJoyaT05U37vCYAfi7d2DO/kZQaPAHEiOcVhlULAF2V8JWVZg24l9BsknVRGw/44J66K
 vlJajVHciqNYevICiSqJbIZubi9caZ1Jb7ukp7rKQFx+EPXZ34/syFaJPm/1JCJAVGjF
 f3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+HhgpnEun99PWqFA1LBFr7BYvEd5x5pSH6OnjmjU+7k=;
 b=GyLhZmkXkUPAK2uaZn8w9HDkqEGw2jv01XkznGwuXe/qCtxyGER/5LE6By2yQz4WOx
 HoVC0eIiG1RUsa285uW6KLZdY8ArtG6UVccH8VNE1cyioUXDoPP1chsLj5AD0p49FAGA
 3CWlntIlq2Jnxwho/WF4GeavYFrtsadcbA9DRLwUJlzGQjEURZywcBP7Gse+4Idf1AK3
 sgVjzhvvwL8wMptZSUBPoCbjrSzLlO0IzG9czYIIF1AB9bSluDfvKPx6aBxsjCfo5xm2
 02pBZe1akkhOS61RlMOEw2f3y8/1WR7XrOY6nt8Ykm0soVVYCagiUwtup73qDRJ1wHlo
 vbnA==
X-Gm-Message-State: AOAM531Qn7uJu3fR6u+BqDR4u7ONYcxtRDZD602jeEZhduOZitef20Hu
 0UfgYuPSysKLrremPlmuk476SX+n56g=
X-Google-Smtp-Source: ABdhPJzwKDetODcAYRbuXRovk9aYLJkZRSOVi0nB71jkT3rYVbUj66WKB8/32Naz293/dSBpLHmZDA==
X-Received: by 2002:a17:902:ce90:b029:eb:a5fa:3ace with SMTP id
 f16-20020a170902ce90b02900eba5fa3acemr23885281plg.43.1618901245411; 
 Mon, 19 Apr 2021 23:47:25 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id d12sm582311pjj.50.2021.04.19.23.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 23:47:24 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 07/10] ast2600: spl: Support
 common boot loader features
Date: Tue, 20 Apr 2021 16:16:45 +0930
Message-Id: <20210420064648.994075-8-joel@jms.id.au>
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

Enable the common SPL code for loading boot images from various devices
that the system can be configured to use. These loaders are used when
not using the custom ASPEED loaders.

The system will try to boot from the strapped device, but fall back to
the UART.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/ast2600/spl.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/mach-aspeed/ast2600/spl.c b/arch/arm/mach-aspeed/ast2600/spl.c
index 40eabca683c2..778b326755ba 100644
--- a/arch/arm/mach-aspeed/ast2600/spl.c
+++ b/arch/arm/mach-aspeed/ast2600/spl.c
@@ -61,11 +61,26 @@ u32 spl_boot_device(void)
 	default:
 		break;
 	}
+#else
+	switch (aspeed_bootmode()) {
+	case AST_BOOTMODE_EMMC:
+		return BOOT_DEVICE_MMC1;
+	case AST_BOOTMODE_SPI:
+		return BOOT_DEVICE_SPI;
+	case AST_BOOTMODE_UART:
+		return BOOT_DEVICE_UART;
+	}
 #endif
 
 	return BOOT_DEVICE_NONE;
 }
 
+void board_boot_order(u32 *spl_boot_list)
+{
+	spl_boot_list[0] = spl_boot_device();
+	spl_boot_list[1] = ASPEED_BOOT_DEVICE_UART;
+}
+
 #ifdef CONFIG_SPL_OS_BOOT
 int spl_start_uboot(void)
 {
-- 
2.30.2

