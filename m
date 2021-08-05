Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 937A73E1EB0
	for <lists+openbmc@lfdr.de>; Fri,  6 Aug 2021 00:28:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgjvD3KYDz3ccJ
	for <lists+openbmc@lfdr.de>; Fri,  6 Aug 2021 08:28:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=YqmtBVNo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YqmtBVNo; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ggjtq19hFz3bWJ;
 Fri,  6 Aug 2021 08:28:33 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so18408579pjb.3; 
 Thu, 05 Aug 2021 15:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=l9GKlJXENJ+NEavpSz/rpIPnYrBdVQY2pEFyg+IrfTI=;
 b=YqmtBVNokX+oXdyXQ2LyXpjGfk56n7Wniukfoi6MKU30C4kiXU6GDU7M1SDPfL3HBq
 MI8OBrFBCwiWUkH/IE4r0WpcfklvaPeniYVkSFqshowg2ngwRmbh/bIi5iDfAE8CNK61
 2Xm6RNqcH9efaFf7L7RIBGluXE/IgXpgUzXjP6WJA4OtJ14+PwwRsKzXkr6TGc0Ej433
 Hnh84NEB8gewUXSN/+Ifai2pjp+uJ+8adeqlUGjlTFMkvgs251gkLfTTy2JB9uZBa1QD
 TAt+F2e943VmMcmVBIpCEHF9fhE1GnfyvcdmfE+FsNsv1bHOdA7kAUn6iJEc3eBO93JU
 VdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=l9GKlJXENJ+NEavpSz/rpIPnYrBdVQY2pEFyg+IrfTI=;
 b=TpdS+pc5I2541c7h/ov24rcxQjgu1YVfFT34UT33n6Rwb1HZxcsa2M455htx5Po+eF
 dk9DSPCIjDcLL8YzCj+PorrNnf7ZdtTcgi30XSEfBQBApDn/NyfSYwICNR3tCcmsLSEw
 mAm3bZcCAaOXcUAZaXgrTkwqMhl/sqH+sNQvcCfzBvWo0PFYFBcC8z15ppUxuUP/Hs3X
 3IS/zwdHbxxy8Cj0yjWAgLA/Id1YgFl5FwrgUrQ6CNExqwzDpvX6X64TiZExaZFHfeDr
 JZaSeNKhzYPiGHbvUXDFz68dCcXx87VfyS+rnCbJpMAZqRE7BIqTlwkyyPlb9Y0M3rrY
 Q1Jw==
X-Gm-Message-State: AOAM531VtePZY5ZxJ73apFsvfjPRX5y4Ql35p4+fnyY/rMj3zvzH/RHf
 vbzcM4PymGa5LJsekwcTIKA=
X-Google-Smtp-Source: ABdhPJzQJp51jXanZDAwkUbCB9TjOsTXFSFj+xqsyn+Y10RvKJSFBk9BehdJOkgqmaLp/2H3ZcufnQ==
X-Received: by 2002:aa7:9f06:0:b029:3c6:c469:9135 with SMTP id
 g6-20020aa79f060000b02903c6c4699135mr6137357pfr.27.1628202511172; 
 Thu, 05 Aug 2021 15:28:31 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id b26sm8082292pfo.47.2021.08.05.15.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 15:28:30 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH v2 2/6] ARM: dts: aspeed: wedge400: Use common flash layout
Date: Thu,  5 Aug 2021 15:28:14 -0700
Message-Id: <20210805222818.8391-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210805222818.8391-1-rentao.bupt@gmail.com>
References: <20210805222818.8391-1-rentao.bupt@gmail.com>
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

Simplify wedge400 flash layout by using the common layout defined in
"facebook-bmc-flash-layout-128.dtsi".

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 Changes in v2:
  - None.

 .../boot/dts/aspeed-bmc-facebook-wedge400.dts | 48 +------------------
 1 file changed, 1 insertion(+), 47 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
index 63a3dd548f30..a901c8be49b9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
@@ -91,53 +91,7 @@
  * Both firmware flashes are 128MB on Wedge400 BMC.
  */
 &fmc_flash0 {
-	partitions {
-		compatible = "fixed-partitions";
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		/*
-		 * u-boot partition: 384KB.
-		 */
-		u-boot@0 {
-			reg = <0x0 0x60000>;
-			label = "u-boot";
-		};
-
-		/*
-		 * u-boot environment variables: 128KB.
-		 */
-		u-boot-env@60000 {
-			reg = <0x60000 0x20000>;
-			label = "env";
-		};
-
-		/*
-		 * FIT image: 123.5 MB.
-		 */
-		fit@80000 {
-			reg = <0x80000 0x7b80000>;
-			label = "fit";
-		};
-
-		/*
-		 * "data0" partition (4MB) is reserved for persistent
-		 * data store.
-		 */
-		data0@7c00000 {
-			reg = <0x7c00000 0x400000>;
-			label = "data0";
-		};
-
-		/*
-		 * "flash0" partition (covering the entire flash) is
-		 * explicitly created to avoid breaking legacy applications.
-		 */
-		flash0@0 {
-			reg = <0x0 0x8000000>;
-			label = "flash0";
-		};
-	};
+#include "facebook-bmc-flash-layout-128.dtsi"
 };
 
 &fmc_flash1 {
-- 
2.17.1

