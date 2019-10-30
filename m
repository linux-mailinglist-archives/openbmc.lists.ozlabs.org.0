Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E05CDE966C
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 07:35:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472zGX1vtYzF3VX
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 17:35:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BWJzLIAE"; 
 dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472zCY4Xp0zF3V3
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 17:32:41 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id v19so864859pfm.3
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 23:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oM9LovEotlbaLpWTQ4s+j1JIcDwISrWXIit1SinGRm4=;
 b=BWJzLIAEVHBHI1uHgXcnMcaqhZmHoA1KKPX9PnWWsxzcsgwq1u+awG0DxkxxdSq28r
 uLQhXQVvcVPvYUiPIesrRS4h4yzjKn9RjIOfffQPmpH/IvnGleaOHZbV/PhK3vSxPW0E
 4U1XK7L6MdJbiu3cPn/jrUBlSGRTP//vXODzKY41jtK9/57qNGQc8n0JgBYcPq5rj1fj
 0dgS14VcwhIdkmE40wrfedHeB6E5vfKqVxeGnD8jnh5fdRgrpDPQoBQSrgNBHg9mHRlH
 dX29Q7ZLbeKvtxGs7PJSXEp94DZcwh4siz3vhUhRPuxhMdaKzokDYtUcfOnc/uTDeOzx
 uJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oM9LovEotlbaLpWTQ4s+j1JIcDwISrWXIit1SinGRm4=;
 b=Fn2rCoG6/X7j9U12Y/duqdwEK2FA9rj7MRWcrRKIgnwxB/V2pkG4yyxmucxzric447
 lz9tPd3zwZidb8cPCvStUR15uIaWB8yyldvMW72auhjU6xh3APxuVduXQzKFsWwLfpF+
 AM243E4ZxoEhsGbT3PwjNFmm31sjfbStIt3wscaITnhz+EY+KDC3KM+Ma52XAuuBpcXY
 AwzJdFa3KXBtSHNd/RlW2Ucpl/9uX8vJ+wMKb/FfwGXXDS3mO8pO2PAkRkVSMgC76jtr
 AlHATMt82HOBtMTiZhbeOYcNfza2deD8qaSXZeiXrXZukq+bMLE0xlyT1X80TgHO1rGH
 VDGw==
X-Gm-Message-State: APjAAAVzEXddRecEw2Y6hRsB4Z/8t6vK8fKgv0mEFOZ33PkKRDHSRwPo
 Y1Z5jNVd8nOJEp2ImUAwBz0=
X-Google-Smtp-Source: APXvYqw7CttFm/11TVSYdUggGyTf8S6lcwJtF5jdw3nZBfh52vnxypv8/9aSdfhgSp+sAW9vNX+pSQ==
X-Received: by 2002:a17:90a:f991:: with SMTP id
 cq17mr11993163pjb.30.1572417158848; 
 Tue, 29 Oct 2019 23:32:38 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id i102sm1028018pje.17.2019.10.29.23.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 23:32:38 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Jeremy Kerr <jk@ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot aspeed-dev-v2019.04 2/7] dts: ast2600: Add FSI
 description
Date: Wed, 30 Oct 2019 17:02:20 +1030
Message-Id: <20191030063225.11319-3-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030063225.11319-1-joel@jms.id.au>
References: <20191030063225.11319-1-joel@jms.id.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/dts/ast2600.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/dts/ast2600.dtsi b/arch/arm/dts/ast2600.dtsi
index 070ff87ce619..ab71fcd2d543 100644
--- a/arch/arm/dts/ast2600.dtsi
+++ b/arch/arm/dts/ast2600.dtsi
@@ -600,6 +600,27 @@
 				ranges = <0 0x1e78a000 0x1000>;
 			};
 
+			fsim0: fsi@1e79b000 {
+				compatible = "aspeed,ast2600-fsi-master", "fsi-master";
+				reg = <0x1e79b000 0x94>;
+				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_fsi1_default>;
+				clocks = <&scu ASPEED_CLK_GATE_FSICLK>;
+				status = "disabled";
+			};
+
+			fsim1: fsi@1e79b100 {
+				compatible = "aspeed,ast2600-fsi-master", "fsi-master";
+				reg = <0x1e79b100 0x94>;
+				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_fsi2_default>;
+				clocks = <&scu ASPEED_CLK_GATE_FSICLK>;
+				status = "disabled";
+			};
+
+
 			uart6: serial@1e790000 {
 				compatible = "ns16550a";
 				reg = <0x1e790000 0x20>;
@@ -1065,6 +1086,16 @@
 		groups = "ESPI";
 	};
 
+	pinctrl_fsi1_default: fsi1_default {
+		function = "FSI1";
+		groups = "FSI1";
+	};
+
+	pinctrl_fsi2_default: fsi2_default {
+		function = "FSI2";
+		groups = "FSI2";
+	};
+
 	pinctrl_fwspics1_default: fwspics1_default {
 		function = "FWSPICS1";
 		groups = "FWSPICS1";
-- 
2.23.0

