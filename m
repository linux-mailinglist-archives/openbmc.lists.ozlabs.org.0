Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D275618BE
	for <lists+openbmc@lfdr.de>; Thu, 30 Jun 2022 13:09:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYbFP1ccZz3cBy
	for <lists+openbmc@lfdr.de>; Thu, 30 Jun 2022 21:09:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=dBBHANqI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=patrick.rudolph@9elements.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=dBBHANqI;
	dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYbCd0Jf1z2ywV
	for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2022 21:07:56 +1000 (AEST)
Received: by mail-ej1-x634.google.com with SMTP id g26so38276240ejb.5
        for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2022 04:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UVoz6gb5+ZYg50/JM3nRFn2u8M2CQq/OmxVkCTV0yNA=;
        b=dBBHANqIOYSLg4loKeNF6w3iIpla/3OgEV4RsL/F4qG2kzJVw35WEbK9XDzRxRVmCq
         dif3VSLfafyY2EjDfZfBvGzP4IXNVuoqC2W3AWtoujIE/BjTepT/9vVu7lRM79jt2DYD
         kytNAk5vkJKZElv5bKzV51hthxSjPaxFwyg+K5aNkeeVk6wU4paxhX5MOfZ9TE320ZKm
         9bDy0d2PjWsx7lsdSQ9O4gSuOuQVpPbnmtr85ra+U9hk6ng0+CJ3YUSGmMAFvCvAYgee
         C21UlxN1vknT6teMDAHxU48WfQPj7kwe0WIFW+YPx9FaM8gOKcQez5GoHKVDmaQ0zBFU
         vbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UVoz6gb5+ZYg50/JM3nRFn2u8M2CQq/OmxVkCTV0yNA=;
        b=tAqKDSiXfGhlQyQgZvtsuiOLvSId/Y1xeV/8U4ODliieALTM4SA3KTFgPPAFB7qLAT
         ymQE8FBHjRIAVfIqMmIS3QeT25AC7WVECwCzTlNlDYLqjcuVlz2b2zSa8HSrVSMF0f5s
         4C1+oCiNiP5FV9UG5QR/HZSmU9uEJcEGmjU9vCKTWPLxuNJEn6EjvFHWFzGKIMhRycUQ
         PYmnauG0CB2CgdFdChy218vNe4A2UnStbvWJnw8oKjqwSpCG3SzqssFzZiqCYRyQb74y
         9vubLAmZBPkfkfIApjUt2cdbcHCW0yto8so9QoApZG0AWC4sVlEnDdwlVel7zSnQPnkC
         nEtg==
X-Gm-Message-State: AJIora+9kwBvz70eVawMNH7Kwr6P/AP5zOWb6JEdYH+BOFqSTfK51EUw
	eJVTxP9ibksK4dYu7od0hvLWmp4w6GeU0w==
X-Google-Smtp-Source: AGRyM1sG8xDZwY4uEarq9bfgxMtZEyIihilv+nGdzo6+RyfPwy5H5l4iMTmphomLqsr7QpwFpMpPYQ==
X-Received: by 2002:a17:907:2be7:b0:72a:4272:66f7 with SMTP id gv39-20020a1709072be700b0072a427266f7mr6244994ejc.209.1656587269747;
        Thu, 30 Jun 2022 04:07:49 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-088-153-019-247.um27.pools.vodafone-ip.de. [88.153.19.247])
        by smtp.gmail.com with ESMTPSA id j20-20020a056402239400b00439645915a4sm174594eda.49.2022.06.30.04.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 04:07:49 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [RESEND][PATCH u-boot v2019.04-aspeed-openbmc v5 1/2] arm/dts: Add IBM Genesis3 board
Date: Thu, 30 Jun 2022 13:07:44 +0200
Message-Id: <20220630110745.345705-2-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220630110745.345705-1-patrick.rudolph@9elements.com>
References: <20220630110745.345705-1-patrick.rudolph@9elements.com>
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
Cc: christian.walter@9elements.com, takken@us.ibm.com, Patrick Rudolph <patrick.rudolph@9elements.com>, zweiss@equinix.com
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

