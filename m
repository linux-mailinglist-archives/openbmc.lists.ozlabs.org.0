Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF61036528D
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 08:48:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPZ5t0DZjz302K
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 16:48:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=csXDHCFU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=csXDHCFU; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPZ45579Gz2yxv
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 16:47:17 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id lr7so3162160pjb.2
 for <openbmc@lists.ozlabs.org>; Mon, 19 Apr 2021 23:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4OeJlYCoCGnHF6hizfuv8a0FZhs9GdbJ+qiASElExaQ=;
 b=csXDHCFU9kXNGb6KDaYquP94N+3e/0mgHkwH5Hl7hFGptiS381fv9XfsR/J5OhLszu
 8nCe+bkoFhuNeRBvQwbl0BXyKZN/0vkKya2quUqnkycLzcwzK5/Z/UvG2L63J6aQWwHB
 H6Dl09ZBbBOU1sSqU77eSsQohX8OXXqTgV1ezxXoqV9kKPCaY/tB6hVMHixMCOp1DxWF
 ip0Ir7dhPkaA/0+fPD6a8l936FH+akkTzgnqMOiXTtKu8hovTB/dYDuNrx74t3WT1+Kf
 datzH8A9sefTx5zNXe1frPbHK5kf5JA5J67saZagfZ2fbRLnKzMyqo0wS5JgAivsr7lU
 8Y1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4OeJlYCoCGnHF6hizfuv8a0FZhs9GdbJ+qiASElExaQ=;
 b=KjfCbuM+JaSx7eKHE8DW2LemRzhMka8zpAXk3DofEsfJsJwxtTqtgSz8SAFeU6NXhn
 ZRK7J3kR8VEoeK36zpZTIy7fPiBjMl/RagGYZ9qpsmBmJ/Q+QDrtJFRcL5pQdnlN32Zk
 fnsRK1Lu0C8aTaMopAiHZnV4XFZo/NqNDNAHXe7KOm5ziZ1vpXuxXq79bptD8f7o1PYT
 z41xwYmJ+4ID8WZjcKdEde3EvXOx/vBWaxqu1z7D4f+erKNLP02Tf4aRARl7XdTILPX/
 Ri5VBsPDuQWNUAC7Qn2ykeBedQSnOnv1ARFEGGZ7csOeFFmucX2d0hg8Lb08PEdQYnr0
 AK4g==
X-Gm-Message-State: AOAM531nzeUEcZ2uM5G9F6FG53z9ZYtEba2XUNDuSdoCdRVuCBtsVNSJ
 n0gXszV06dND0MzSqTo8NfaZf3x1cw4=
X-Google-Smtp-Source: ABdhPJysqeMrYlW8Xdudh40+7+R7uD0iGJwJb6CCSzrX/2q5ijgSE4LskM7UslGxKaxiqbN8MwBexA==
X-Received: by 2002:a17:90a:9404:: with SMTP id
 r4mr3258938pjo.64.1618901234945; 
 Mon, 19 Apr 2021 23:47:14 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id d12sm582311pjj.50.2021.04.19.23.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 23:47:14 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 04/10] ast2600: Add HACE to
 device tree
Date: Tue, 20 Apr 2021 16:16:42 +0930
Message-Id: <20210420064648.994075-5-joel@jms.id.au>
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

HACE is the Hash and Crypto Egine in the AST2600.

Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/dts/ast2600-rainier.dts | 5 +++++
 arch/arm/dts/ast2600-tacoma.dts  | 5 +++++
 arch/arm/dts/ast2600.dtsi        | 9 +++++++++
 arch/arm/dts/ast2600a1-evb.dts   | 4 ++++
 4 files changed, 23 insertions(+)

diff --git a/arch/arm/dts/ast2600-rainier.dts b/arch/arm/dts/ast2600-rainier.dts
index 67e177baf1bd..aae507b4c23d 100755
--- a/arch/arm/dts/ast2600-rainier.dts
+++ b/arch/arm/dts/ast2600-rainier.dts
@@ -103,3 +103,8 @@
 	pinctrl-0 = <&pinctrl_emmc_default>;
 	sdhci-drive-type = <1>;
 };
+
+&hace {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
diff --git a/arch/arm/dts/ast2600-tacoma.dts b/arch/arm/dts/ast2600-tacoma.dts
index 85d1e3902b11..c8ed5e35a74c 100755
--- a/arch/arm/dts/ast2600-tacoma.dts
+++ b/arch/arm/dts/ast2600-tacoma.dts
@@ -94,3 +94,8 @@
 	pinctrl-0 = <&pinctrl_emmc_default>;
 	sdhci-drive-type = <1>;
 };
+
+&hace {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
diff --git a/arch/arm/dts/ast2600.dtsi b/arch/arm/dts/ast2600.dtsi
index e619f7118886..57ea98a47b67 100644
--- a/arch/arm/dts/ast2600.dtsi
+++ b/arch/arm/dts/ast2600.dtsi
@@ -304,6 +304,15 @@
 
 			};
 
+			hace: hace@1e6d0000 {
+				compatible = "aspeed,ast2600-hace";
+				reg = <0x1e6d0000 0x200>;
+				interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scu ASPEED_CLK_GATE_YCLK>;
+				clock-names = "yclk";
+				status = "disabled";
+			};
+
 			smp-memram@0 {
 				compatible = "aspeed,ast2600-smpmem", "syscon";
 				reg = <0x1e6e2180 0x40>;
diff --git a/arch/arm/dts/ast2600a1-evb.dts b/arch/arm/dts/ast2600a1-evb.dts
index 2827e00c0eb4..2ae6e3bdf192 100644
--- a/arch/arm/dts/ast2600a1-evb.dts
+++ b/arch/arm/dts/ast2600a1-evb.dts
@@ -301,3 +301,7 @@
 &display_port {
 	status = "okay";
 };
+
+&hace {
+	status = "okay";
+};
-- 
2.30.2

