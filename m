Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6502959EB
	for <lists+openbmc@lfdr.de>; Thu, 22 Oct 2020 10:11:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CH0Rt2bgTzDqfW
	for <lists+openbmc@lfdr.de>; Thu, 22 Oct 2020 19:11:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XBAyohM/; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CH0Qt0dGvzDqcy
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2020 19:10:10 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id j18so672165pfa.0
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2020 01:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7S4k5yVcaPNKEgbuN+FwAgT3Wa6YAs64vx6hY7de4w8=;
 b=XBAyohM/FN81mlQ4Qb+NWWMFq3pateluw3mTAWos8CtrdIKGtUJjPi7gpgfUpYAEsh
 RKfsp/npuUEkz5uwBNB7eLBHhjlzoputr5UL+HWZFUQI+4IGEUIEfG4F0alvjOicCxcW
 awWzgfUtemtMCl68/5N6L6Vl8RPgfv+wPCLptFpB0gjPfhLQk7SrTwdW0EPVG/CixZfn
 xik+5iFmCnybxUTjANbvkJjcE72KgrU7bio2QUgY5X/hohP6eKCmKSsinEeFOEfThBi3
 FE4RFcbAkYSoPRScLUGg9Gjx1sb+jYqOzK6/dOqdC/dnfwAZPoWnd6uVhtksDpGsG8cA
 e8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7S4k5yVcaPNKEgbuN+FwAgT3Wa6YAs64vx6hY7de4w8=;
 b=UVTc9391bndHFXLzaGIBEcCPTDJRtL+9UlO/hN2pLA8q0+e2V2euns3C7ox9vkTFO5
 nxN/dSEhEyA1ZmxFfLqinkSRwsUEn1GiOBwj9C5w0ToS+cZnlxlP4phd+oGexlkH1mlZ
 1AcigAr+PR3lDJF4kGGXXwhiUY/Z7aXqEKoY25tLGxC8x77sfC3gyjpPLpz1Zan4YdPz
 xV9LutVnTAB+yvLsISBXgfjjXnY/Dpu0QR73o0gvSytowJwRKOE+B156ZEjH/YDtcWCN
 rE8Mgb8WIk557v7GJ/pIbcY4I7c7Vyj7MMV6hjNWY2QqhXzigqcpTyAfF8HkYQlsX+mW
 AGlw==
X-Gm-Message-State: AOAM532EVTeDyvr9ufy5FYyuZNPEDvltQO7BEA/Mi73LqKY7Dk3RaXmx
 R3z3d+lQJpcf3naofg8eLbjWemFJ+kmImh0n62M=
X-Google-Smtp-Source: ABdhPJz8yTCWn2vmR2A8dJasDCOdCNsYtR+Rrn1xr56kmj/nZA3XVAz+JIf5KSNND80Aokv+GoVxrg==
X-Received: by 2002:a65:4bcb:: with SMTP id p11mr1246806pgr.253.1603354206681; 
 Thu, 22 Oct 2020 01:10:06 -0700 (PDT)
Received: from localhost (95.169.4.245.16clouds.com. [95.169.4.245])
 by smtp.gmail.com with ESMTPSA id v3sm1189291pjk.23.2020.10.22.01.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 01:10:06 -0700 (PDT)
From: George Liu <liuxiwei1013@gmail.com>
X-Google-Original-From: George Liu <liuxiwei@inspur.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH] ARM: dts: Fix label address for 64MiB OpenBMC flash layout
Date: Thu, 22 Oct 2020 16:10:02 +0800
Message-Id: <20201022081002.2665132-1-liuxiwei@inspur.com>
X-Mailer: git-send-email 2.25.1
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

Signed-off-by: George Liu <liuxiwei@inspur.com>
---
 arch/arm/boot/dts/openbmc-flash-layout-64.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi b/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
index c8e0409d889e..91163867be34 100644
--- a/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
+++ b/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
@@ -13,22 +13,22 @@ u-boot@0 {
 		label = "u-boot";
 	};
 
-	u-boot-env@e0000 {
+	u-boot-env@60000 {
 		reg = <0x60000 0x20000>; // 128KB
 		label = "u-boot-env";
 	};
 
-	kernel@100000 {
+	kernel@80000 {
 		reg = <0x80000 0x500000>; // 5MB
 		label = "kernel";
 	};
 
-	rofs@a00000 {
+	rofs@580000 {
 		reg = <0x580000 0x2a80000>; // 42.5MB
 		label = "rofs";
 	};
 
-	rwfs@6000000 {
+	rwfs@3000000 {
 		reg = <0x3000000 0x1000000>; // 16MB
 		label = "rwfs";
 	};
-- 
2.25.1

