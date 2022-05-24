Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E891353290B
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 13:31:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6sTp62BBz3fbk
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 21:31:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=gUoIlqQd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::52c;
 helo=mail-ed1-x52c.google.com; envelope-from=patrick.rudolph@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256
 header.s=google header.b=gUoIlqQd; dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6sCH3frGz3fMD
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 21:18:50 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id c12so22581273eds.10
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 04:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UVoz6gb5+ZYg50/JM3nRFn2u8M2CQq/OmxVkCTV0yNA=;
 b=gUoIlqQdtWcyZ2tlLFma9jzFXaNlvEnLyPzHVkS2bE2NCA09j2g6osQzscfuXpRIQx
 5t7mS7fnpzHrMtGpJ5YcLHRd190VWg6NAiP2jUg76kX1dQQBta8ywFb1YGg2aIIsl+aS
 DYbzFpsaNt6Re++vQ3hxHUV89V1geoG7IXiKCnfYTt8KM4w/lfbYWoEpSaYhc0u5n4QA
 3cI3+UEvi7q3IIIw8vjCZNYm1GzQTHBKLFupvQfgR8+t9MnYgCP/XIEsmuW92HIADZZN
 Yno44VOgNMmc9XBe26SPDj/nAoX8ZS9pkZVqiZsCiiZcdhxpJBSF0aS6SLYAIqpv0xtL
 g5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UVoz6gb5+ZYg50/JM3nRFn2u8M2CQq/OmxVkCTV0yNA=;
 b=uF6yXbOzNraQqL+bLnhyQ0LMFOwmb5BdIdoVoh0JFsZADaiOEgXnrcbwq1lkXbZ8Og
 4sure3mhKH+UzjvuDztr01ZTRlbhaCYc4VIsyYvDCsiBfvsI8rTWnjQSdCc+4MeD/xvO
 T7VYvKwLA6ZLIj/h23oEXJuIhCMKdlHJ3MKxnSUPaJXUgZ+PjuBDVOIxMNgT9k7AUGK2
 qkgi7uw6TbV6lxI76T07YE4cB1e1S3IPjv2i7yPGgUx3nMYxRIeannOwB1/epBpcNsz7
 N2Q9EmLyq1VXyxspgcVJfdZVTRa/+VG8iKEUE3fY36WVPtc2yAaKQq6Gg84JaLcKQHLX
 uJzw==
X-Gm-Message-State: AOAM530UI2m3MnkpcLxU91pzSb8PNh8+eXp0O/GwFkttto7nPEeXJlIB
 MK6DOzG/sT/7eP4YO54Cg8eJZw==
X-Google-Smtp-Source: ABdhPJy6yWALmRTUKBpdSOMOnBoiI+RnvzG4AyYgShQUvF2R0JuEL9kaX2Ec5ZptspHDDuqQMwvAqg==
X-Received: by 2002:a05:6402:b34:b0:42b:7c29:dbc with SMTP id
 bo20-20020a0564020b3400b0042b7c290dbcmr5009046edb.113.1653391126137; 
 Tue, 24 May 2022 04:18:46 -0700 (PDT)
Received: from fedora.sec.9e.network
 (ip-088-153-019-247.um27.pools.vodafone-ip.de. [88.153.19.247])
 by smtp.gmail.com with ESMTPSA id
 y20-20020aa7c254000000b0042ac4089dabsm9181607edo.17.2022.05.24.04.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 04:18:45 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v5 1/2] arm/dts: Add IBM
 Genesis3 board
Date: Tue, 24 May 2022 13:18:40 +0200
Message-Id: <20220524111841.627400-2-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220524111841.627400-1-patrick.rudolph@9elements.com>
References: <20220524111841.627400-1-patrick.rudolph@9elements.com>
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
Cc: christian.walter@9elements.com, takken@us.ibm.com,
 Patrick Rudolph <patrick.rudolph@9elements.com>, zev@bewilderbeest.net,
 Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add devicetree source file. It uses the evb-ast2500 board files.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Reviewed-by: Zev Weiss <zweiss@equinix.com>
---
 arch/arm/dts/Makefile             |  1 +
 arch/arm/dts/ast2500-genesis3.dts | 28 ++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 arch/arm/dts/ast2500-genesis3.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 3515100c65..ed9714d832 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -678,6 +678,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2400-evb.dtb \
 	ast2400-ahe-50dc.dtb \
 	ast2500-evb.dtb \
+	ast2500-genesis3.dtb \
 	ast2600a0-evb.dtb \
 	ast2600a1-evb.dtb \
 	ast2600-bletchley.dtb \
diff --git a/arch/arm/dts/ast2500-genesis3.dts b/arch/arm/dts/ast2500-genesis3.dts
new file mode 100644
index 0000000000..544758c5b8
--- /dev/null
+++ b/arch/arm/dts/ast2500-genesis3.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * IBM Genesis3
+ *
+ * Copyright (C) 2022 9elements GmbH
+ */
+
+#include "ast2500-evb.dts"
+
+/ {
+	model = "IBM Genesis3";
+	compatible = "ibm,genesis3-bmc", "aspeed,ast2500";
+};
+
+&spi1 {
+	status = "disabled";
+};
+
+&fmc {
+	flash@0 {
+		compatible = "spansion,s25fl256l", "spi-flash";
+	};
+
+	flash@1 {
+		compatible = "spansion,s25fl256l", "spi-flash";
+	};
+};
+
-- 
2.35.3

