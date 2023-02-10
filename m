Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0B5691A30
	for <lists+openbmc@lfdr.de>; Fri, 10 Feb 2023 09:43:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCnM8651bz3f3g
	for <lists+openbmc@lfdr.de>; Fri, 10 Feb 2023 19:43:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QDYxg/Q0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=lesly895@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QDYxg/Q0;
	dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCnLX6MSnz3c7X
	for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2023 19:42:58 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id s20so3037257pfe.2
        for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2023 00:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FzUG7pn9uTm2Et2NuLX0QIcTXtgkaO6E6HsSAnvxDjY=;
        b=QDYxg/Q0l1qGwONKJkDEgfytfTLyxtWZQxK6KQQ86ZmnHi2Lqatw4DrYE1LebSXB/E
         j2RrodOtBjlZ2LXb2QE+N5K853qM4rUErNkLVY5n7eFBUHioKZ91PiB/5dZJSmTaDQka
         Iqa4ZZr2QV5OYnK4B9Np0+nIungQABmnwFBNV3RFtGfu/nrsEciAkUdGUIzc+ondhXQs
         3ECIV7husuYKSaEfDjuH7jxBK75FUFAml7iU0PeQsGqjjohJnpoKLf/w6XYhbWmTSL7G
         wmMDCGbQgsgnrfXh0KzsP70dZ42u/yArWBnlmNLot5VtMJCPwq7Sf6zYpk8PbztGpJdf
         h3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzUG7pn9uTm2Et2NuLX0QIcTXtgkaO6E6HsSAnvxDjY=;
        b=o8+ROXXtrTxx9iCCSwH42pmBrr+lVX+KXt5ZhlTQEPwsx0O5x8YGkQtbVKDj074SDh
         BfHfaGeRdASu7ipS72qQZw9Da4ibbER0pJ5KIFYZqNRyVEeMtzs1/gag2WwBxqpIFjK1
         ejqHs/Qar4D1vLee9dzNgsKk30ZhwUmJ/FhvOJ5cFiE1RCyc9RJFcSfltLCEbWbfsmCw
         z3GZMYR6GRAjf3SUngsYYLnt3wUelTiww2bDDkDkqnWOzuG4jofWjDP69cnxlUYfXxlt
         eMwRdyQwcVRn6+2WJ4I7BGkhAS7oq/e74ekYijZVFUt7cBWotvDVJuWYnZuiEWzMfSUX
         GWFg==
X-Gm-Message-State: AO0yUKU4qSjK1ol7v/I6e7GcNluW4V7PClnvClB1b8pmXRI+iGURr3+Y
	a4Kwl685g067paLg1oXHOmXg7OleRwQ=
X-Google-Smtp-Source: AK7set8InxCxLmyl1g/loNdPzrvUqk8sbUGLER7NeEwK9POKaMAtWXErEtPVUD7ZakcCja7Eu76gLA==
X-Received: by 2002:a62:1d44:0:b0:5a8:4c9d:6237 with SMTP id d65-20020a621d44000000b005a84c9d6237mr7129274pfd.21.1676018575346;
        Fri, 10 Feb 2023 00:42:55 -0800 (PST)
Received: from localhost.localdomain (61-220-204-242.hinet-ip.hinet.net. [61.220.204.242])
        by smtp.gmail.com with ESMTPSA id y25-20020aa78559000000b0059275411af8sm2774047pfn.62.2023.02.10.00.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 00:42:54 -0800 (PST)
From: lesly895@gmail.com
X-Google-Original-From: ryans@supermicro.com.tw
To: openbmc@lists.ozlabs.org
Subject: [PATCH 2/2] [PATCH 2/2] ARM: dts: aspeed: remove redundant definition on Supermicro X13DEM
Date: Fri, 10 Feb 2023 16:42:50 +0800
Message-Id: <20230210084250.5081-1-ryans@supermicro.com.tw>
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
Cc: andrew@aj.id.au, linux-arm-kernel@lists.infradead.org, Ryan Sie <ryans@supermicro.com.tw>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Ryan Sie <ryans@supermicro.com.tw>

Signed-off-by: Ryan Sie <ryans@supermicro.com.tw>
---
 .../boot/dts/aspeed-bmc-supermicro-x13dem.dts | 37 +------------------
 1 file changed, 1 insertion(+), 36 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts b/arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts
index 7c0771904544..606c6dfcb282 100644
--- a/arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts
@@ -31,14 +31,6 @@ video_engine_memory: video {
 			compatible = "shared-dma-pool";
 			reusable;
 		};
-
-		gfx_memory: framebuffer {
-			size = <0x01000000>;
-			alignment = <0x01000000>;
-			compatible = "shared-dma-pool";
-			reusable;
-		};
-
 	};
 
 	leds {
@@ -118,7 +110,7 @@ partitions {
 			#size-cells = <1>;
 			all-bios@0 {
 				label = "all_part_bios";
-				reg = <0x000000000 0x02000000>;
+				reg = <0x00000000 0x02000000>;
 			};
 		};
 	};
@@ -300,15 +292,6 @@ &mac0 {
 	pinctrl-0 = <&pinctrl_rgmii1_default>;
 };
 
-&mdio1 {
-	status = "disabled";
-
-	ethphy1: ethernet-phy@0 {
-		compatible = "ethernet-phy-ieee802.3-c22";
-		reg = <0>;
-	};
-};
-
 &mac1 {
 	status = "disabled";
 	pinctrl-names = "default";
@@ -317,15 +300,6 @@ &mac1 {
 	phy-handle = <&ethphy1>;
 };
 
-&mdio2 {
-	status = "disabled";
-
-	ethphy2: ethernet-phy@0 {
-		compatible = "ethernet-phy-ieee802.3-c22";
-		reg = <0>;
-	};
-};
-
 &mac2 {
 	status = "okay";
 	pinctrl-names = "default";
@@ -333,15 +307,6 @@ &mac2 {
 	use-ncsi;
 };
 
-&mdio3 {
-	status = "disabled";
-
-	ethphy3: ethernet-phy@0 {
-		compatible = "ethernet-phy-ieee802.3-c22";
-		reg = <0>;
-	};
-};
-
 &mac3 {
 	status = "disabled";
 	pinctrl-names = "default";
-- 
2.25.1

