Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 301893D9999
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 01:38:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZqq50q2Hz3bM7
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 09:38:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=I1042sBW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=I1042sBW; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZqpn4FwJz309T;
 Thu, 29 Jul 2021 09:38:09 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id n10so4694088plf.4;
 Wed, 28 Jul 2021 16:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TM1oWFJiQ55sCFQ7wpGHeNKBl5+PgVPl+xUxtGHeuDA=;
 b=I1042sBWKb+QVDCGOEqGBiFnCM3hVK/1s4yYAMaLBBxqae36UPOw+4Jb07vYE6R2dY
 uSDKJLjYAryvvfkAFzo2/Ah9h1X/VkKULWXFySS/2ZWA8xvU+SyNMZsnArfcHvjxhnDq
 V3J+sj4WAS7Gab7twrSEfc6cYAmZExoGPldDWMygvSF/Z704yUK8HHsirr3gUkVeST+N
 KBEltaVshKEf8x/hXIAYvrXFc6senSs5HB+42Hl6jaWckU9rZDD6mlNYh0Yp1vj5p5iW
 vwweQD9S25RgBxLStHcxDvcyeQZEVqE31Z0LZbR7pqEtLQrPY6tXrIpIsuv1LSMnJso9
 ALUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=TM1oWFJiQ55sCFQ7wpGHeNKBl5+PgVPl+xUxtGHeuDA=;
 b=Wq1LxBLVj7cL3NeC1z4sMifqe6sdja+6kYpgxHNLcdowNU9nfnDb5NU67Yfjh8IElu
 K4NTxZimH/3SE6vIcJrTSNvazFMQKQAahgP7mrrSJQW1iCdnEHfOOwiJsknzO5d9lr6R
 taxcg7+nQp+ZP+CHvTCD3tvKk8+068Owb+RobF1obt+Kkry5eDue8GqNDRfh/0ZVe6P5
 zmgfQeZPi9x7j8WANqOuM6knBtXi9lYhGoYMCavJRasfpfnWPnaQusL0+Uq5cyurdGQ+
 gOoHv36bXOYpIsNEto1+b0qiG9sWDoMuwJVE89M8HxRmNFCnUoy8/feKcEKAKvoZrPsU
 rXPw==
X-Gm-Message-State: AOAM533fRs6faKbyxtl/k1YzOijvYxrk1o+mBGoJcnjSkzQ/davo/gnb
 4yJETewschb1kNb1CF0woU8=
X-Google-Smtp-Source: ABdhPJyUkypAjII61agd3+GcR+1EIgkC9yRJLVJ4SSY6U5CP784rDEdPD6XPamhPhWKFzVf/N20poQ==
X-Received: by 2002:a17:90a:ce07:: with SMTP id
 f7mr2139372pju.81.1627515486795; 
 Wed, 28 Jul 2021 16:38:06 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id k37sm1038671pgm.84.2021.07.28.16.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 16:38:06 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 1/6] ARM: dts: Add Facebook BMC 128MB flash layout
Date: Wed, 28 Jul 2021 16:37:50 -0700
Message-Id: <20210728233755.17963-2-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210728233755.17963-1-rentao.bupt@gmail.com>
References: <20210728233755.17963-1-rentao.bupt@gmail.com>
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

This is the layout used by Facebook BMC systems. It describes the fixed
flash layout of a 128MB mtd device.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 .../dts/facebook-bmc-flash-layout-128.dtsi    | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 arch/arm/boot/dts/facebook-bmc-flash-layout-128.dtsi

diff --git a/arch/arm/boot/dts/facebook-bmc-flash-layout-128.dtsi b/arch/arm/boot/dts/facebook-bmc-flash-layout-128.dtsi
new file mode 100644
index 000000000000..7f3652dea550
--- /dev/null
+++ b/arch/arm/boot/dts/facebook-bmc-flash-layout-128.dtsi
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2020 Facebook Inc.
+
+partitions {
+	compatible = "fixed-partitions";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	/*
+	 * u-boot partition: 896KB.
+	 */
+	u-boot@0 {
+		reg = <0x0 0xe0000>;
+		label = "u-boot";
+	};
+
+	/*
+	 * u-boot environment variables: 64KB.
+	 */
+	u-boot-env@e0000 {
+		reg = <0xe0000 0x10000>;
+		label = "env";
+	};
+
+	/*
+	 * image metadata partition (64KB), used by Facebook internal
+	 * tools.
+	 */
+	image-meta@f0000 {
+		reg = <0xf0000 0x10000>;
+		label = "meta";
+	};
+
+	/*
+	 * FIT image: 119 MB.
+	 */
+	fit@100000 {
+		reg = <0x100000 0x7700000>;
+		label = "fit";
+	};
+
+	/*
+	 * "data0" partition (8MB) is used by Facebook BMC platforms as
+	 * persistent data store.
+	 */
+	data0@7800000 {
+		reg = <0x7800000 0x800000>;
+		label = "data0";
+	};
+
+	/*
+	 * Although the master partition can be created by enabling
+	 * MTD_PARTITIONED_MASTER option, below "flash0" partition is
+	 * explicitly created to avoid breaking legacy applications.
+	 */
+	flash0@0 {
+		reg = <0x0 0x8000000>;
+		label = "flash0";
+	};
+};
-- 
2.17.1

