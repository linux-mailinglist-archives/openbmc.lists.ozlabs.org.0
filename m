Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4D88D69BF
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2024 21:31:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VB7wcl3j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrYCK6p5Vz3fmB
	for <lists+openbmc@lfdr.de>; Sat,  1 Jun 2024 05:31:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VB7wcl3j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrYBl37Wvz3dLd
	for <openbmc@lists.ozlabs.org>; Sat,  1 Jun 2024 05:31:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E4F6562E02;
	Fri, 31 May 2024 19:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770BDC4AF08;
	Fri, 31 May 2024 19:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717183868;
	bh=aQ8gzOeuRTghVVqbbLrrVe8iWbU0R6iLu7KgCeY1I2Y=;
	h=From:To:Cc:Subject:Date:From;
	b=VB7wcl3js0H751wiNr6J+mwUtsOprAHtIuWmBg0P2MvFNrF0/nKQtgpsxF63vDVwC
	 HPcKYLhGD44OvOI1MpAghKd5Lk2AIdaNtkTFyWG2VbkDzfhqYTuv85DIlxS31mmBAb
	 zV5URaNzB01Eh+XNQHLv726Sv3qXqair9/aomH+ug5PhaaWIN+5N5fZbBiUcC/ixGo
	 c+BbD0aFrXcFZEbqbd+nMgokFQzxnDCTa9I9KqyTX1lYHhZ1TWiA71wwsCHrFB/XnX
	 gDdYwIBL5+wmtlqQb8q0ZvLqjDUeHBjQnsY9EsdRth4zna6zQfSndmUar39Y002IA8
	 KIjyddTRQTSgA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH] arm: dts: nuvoton: Use standard 'i2c' bus node name
Date: Fri, 31 May 2024 14:31:04 -0500
Message-ID: <20240531193104.3814663-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The standard node name for I2C buses is 'i2c'.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../boot/dts/nuvoton/nuvoton-npcm730-kudo.dts | 22 +++++++++----------
 .../nuvoton-npcm750-runbmc-olympus.dts        | 22 +++++++++----------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts b/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts
index 5787ae95d3b4..1f07ba382910 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts
@@ -525,7 +525,7 @@ max31790@58 {
 			};
 		};
 
-		i2c-bus@4 {
+		i2c@4 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <4>;
@@ -537,7 +537,7 @@ lm75@5c {
 			};
 		};
 
-		i2c-bus@5 {
+		i2c@5 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <5>;
@@ -549,7 +549,7 @@ lm75@5c {
 			};
 		};
 
-		i2c-bus@6 {
+		i2c@6 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <6>;
@@ -561,7 +561,7 @@ lm75@5c {
 			};
 		};
 
-		i2c-bus@7 {
+		i2c@7 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <7>;
@@ -580,7 +580,7 @@ i2c-mux@77 {
 		reg = <0x77>;
 		i2c-mux-idle-disconnect;
 
-		i2c-bus@2 {
+		i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
@@ -620,7 +620,7 @@ i2c-mux@77 {
 		reg = <0x77>;
 		i2c-mux-idle-disconnect;
 
-		i2c-bus@0 {
+		i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
@@ -632,7 +632,7 @@ adm1266@40 {
 			};
 		};
 
-		i2c-bus@1 {
+		i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
@@ -691,7 +691,7 @@ i2c-mux@77 {
 		reg = <0x77>;
 		i2c-mux-idle-disconnect;
 
-		i2c-bus@3 {
+		i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
@@ -703,7 +703,7 @@ lm75@28 {
 			};
 		};
 
-		i2c-bus@4 {
+		i2c@4 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <4>;
@@ -715,7 +715,7 @@ lm75@29 {
 			};
 		};
 
-		i2c-bus@5 {
+		i2c@5 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <5>;
@@ -726,7 +726,7 @@ lm75@28 {
 				reg = <0x28>;
 			};
 		};
-		i2c-bus@6 {
+		i2c@6 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <6>;
diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts
index baa39d0c1032..087f4ac43187 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts
@@ -215,43 +215,43 @@ i2c-mux@70 {
 		reg = <0x70>;
 		i2c-mux-idle-disconnect;
 
-		i2c_slot1a: i2c-bus@0 {
+		i2c_slot1a: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
 		};
 
-		i2c_slot1b: i2c-bus@1 {
+		i2c_slot1b: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
 		};
 
-		i2c_slot2a: i2c-bus@2 {
+		i2c_slot2a: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
 		};
 
-		i2c_slot2b: i2c-bus@3 {
+		i2c_slot2b: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
 		};
 
-		i2c_slot3: i2c-bus@4 {
+		i2c_slot3: i2c@4 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <4>;
 		};
 
-		i2c_slot4: i2c-bus@5 {
+		i2c_slot4: i2c@5 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <5>;
 		};
 
-		i2c_slot5: i2c-bus@6 {
+		i2c_slot5: i2c@6 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <6>;
@@ -265,24 +265,24 @@ i2c-mux@71 {
 		#size-cells = <0>;
 		i2c-mux-idle-disconnect;
 
-		i2c_m2_s1: i2c-bus@0 {
+		i2c_m2_s1: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
 		};
 
-		i2c_m2_s2: i2c-bus@1 {
+		i2c_m2_s2: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
 		};
-		i2c_m2_s3: i2c-bus@2 {
+		i2c_m2_s3: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
 		};
 
-		i2c_m2_s4: i2c-bus@3 {
+		i2c_m2_s4: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
-- 
2.43.0

