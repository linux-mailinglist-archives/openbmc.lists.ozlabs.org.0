Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6255BE2B4
	for <lists+openbmc@lfdr.de>; Tue, 20 Sep 2022 12:10:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWy354jDvz3bkR
	for <lists+openbmc@lfdr.de>; Tue, 20 Sep 2022 20:10:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=LRWpj2xp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=patrick.rudolph@9elements.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=LRWpj2xp;
	dkim-atps=neutral
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWy1M0wW0z308B
	for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2022 20:08:37 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id y3so4958739ejc.1
        for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2022 03:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=oS2XC6fdTXuWOLrVDXR1a2AzA8BB4cDv+VOxEeSMDbQ=;
        b=LRWpj2xpolbd7t30vPp3thnfGcFeXHGQa4rJ5MnP0MLl+XHyx0Q1CV+WmHdLTmrDL+
         2cSnOnp5LqZD2b5HxaSVjlqI2Vf/zo3qHReYb9isIjhSPfOtjYsLk13R2EYbuLGJUGJT
         jV71sQO2+3ZPVGDX9xnVSUBBK9GOvks0BTmCxTvyMLaLYzj/LJ2NwoqfOydmGZl/oLP8
         7718LQSFeURHdrkTbOhAHF9CAsirkXLhWhtOz8ld78rPb9BqEdaGZlI7DWWMjAusSb4+
         +4Q4znXc2EwcH3I0Gn2n2GGy2T62gSQliGKvikWo6P98LfC3QaTdlby+vvBYESpOLt+G
         p4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=oS2XC6fdTXuWOLrVDXR1a2AzA8BB4cDv+VOxEeSMDbQ=;
        b=1qUszOHh6Hvo7E4KLIkicRfN1kVvOPoGdgVPpHdiAWbbEuH5ILDkNj/1COgLCCYpf1
         jbjWn2nnrHlyQsx+Cqly/cCk7lO2TVR7l0vCe4YYbAYn6ASTEAjgr4JV+z0TBtfcnzK+
         BUh+wHeZtb20uDVaOIP7aUK3GrRHxL5H4852wGryRBODJGg3vwVs2WYMcmhYLVNF4zmT
         4x6JtZuq6HKhybGrQTMRdOlLNfcm1Xbhvg2YAreGAs10tPTlLjHMorzEqjhvkdT+7lx6
         eXy4BvsRS56tiF+URVrLBd5ImGSof0B82WeHfWuNpUwtoI3T6OzyshK6H5GuEa8MSBfO
         mmRQ==
X-Gm-Message-State: ACrzQf0SBs2KzcdAwyCTbJaG4v/Kat44nveHSGfoBdoz8fBYqt5+f39S
	uzpwbMo8Uz9guYTOw5WcyykD6w==
X-Google-Smtp-Source: AMsMyM7NWpMt2b43yGGraEcOo0xAQNOOuPTLm1TLb3mDSwvlQRqWpFzaIFsX8x7QO4y8rOyQFA5N9w==
X-Received: by 2002:a17:906:cc18:b0:77b:9653:464d with SMTP id ml24-20020a170906cc1800b0077b9653464dmr16216360ejb.583.1663668513781;
        Tue, 20 Sep 2022 03:08:33 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-094-114-232-236.um31.pools.vodafone-ip.de. [94.114.232.236])
        by smtp.gmail.com with ESMTPSA id fi19-20020a056402551300b004545287d464sm993475edb.14.2022.09.20.03.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 03:08:33 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [RESEND][PATCH u-boot v2019.04-aspeed-openbmc v6 1/2] arm/dts: Add IBM Genesis3 board
Date: Tue, 20 Sep 2022 12:08:18 +0200
Message-Id: <20220920100819.1198148-2-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220920100819.1198148-1-patrick.rudolph@9elements.com>
References: <20220920100819.1198148-1-patrick.rudolph@9elements.com>
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
Cc: andrew@aj.id.au, christian.walter@9elements.com, takken@us.ibm.com, Patrick Rudolph <patrick.rudolph@9elements.com>, zweiss@equinix.com
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
index 6c34b83336..db479c059b 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -680,6 +680,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2400-palmetto.dtb \
 	ast2500-evb.dtb \
 	ast2500-romulus.dtb \
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
2.37.1

