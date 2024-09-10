Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FF6974529
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2024 23:59:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3Hfb1GgFz3cF6
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2024 07:59:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726005555;
	cv=none; b=it3nHpdB/hPbpX056H2pobu88HDd4q/hvKdY8c/CmEZitzEC3wfZ4gMse+oSS0pKcBAdWQPcEAs5104Jy8oXOOFMKOeqRsNm5bnbzY8VC7umnm44exMok29VtcYpFAN463hLZHsMAgAXoVCTjjFYLe+iyCPl0JVgBl8hSeQLK7pU2/pgxtRahHE5An5ipNzuP3mSHpRi2ml46jUtJVogRpKHUSGNBj0bqoiwGiUQJ+7MBzz8TfZnD7B1OwA47QtEx7W4JjFoatnhhHKb0EaDw8EkSlmqDCDWay1YURvYSvAPtM5QnETKPjaZ6w5KcE3+5fAU42rHwkyBHS4T8dVsuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726005555; c=relaxed/relaxed;
	bh=dwSs+yrWJKVxcqnO+AY6VJTsUac1dl/tuI8PMZ+YMWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TNZg/JpnBnYqLbTrxdqj0XjkUYyu4s5yxCvkGzqnScrERAjC/nsWz6LTjFQud0aMbj1vRXHWanXlwetmZH4wAC3St/d9mFRtelwyk0vnAZpWQAt26GS+XyA7eZBC6bt3ATuo48PD4teTYR9z/PP0SSHz77FIDg4gGcsIkBk5hhAeHbH0mv8fbksdC/EVqRe2bVCl4q3+qgsIN8JssyXuqYAKp0dz56mukDBsViSQ02eMyMr/JxbqERkruyIoj/zQsmi81/Yp99Z7tQol7T89TFycWr0ofUxfwZP4H3Ds355QY2rKvK7iXrbBQwn3wOBpvqpRhhCWMey+7A2YXA6Y/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J+nMxCdK; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J+nMxCdK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3HfW1tDCz2yK9
	for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2024 07:59:15 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 07DBE5C02E8;
	Tue, 10 Sep 2024 21:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4D5C4CECC;
	Tue, 10 Sep 2024 21:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726005551;
	bh=7AFvbcy3UjqEHFil4fdBdZNCaMatS/8Gq0uXJoP2qFE=;
	h=From:To:Cc:Subject:Date:From;
	b=J+nMxCdK+K5MtMcUKJRG+itpwP4ZWd4Y9D/2K7dyxdfmOO1I/gAOmiVcY6pvUnE6H
	 48CvmZO/CUpILGaQxyw4eKayK5ID6pDAbh1F7T57NlDvH9fD8e1wkl74QV3m07PTl/
	 f6jkfiXM3WHjUEeWAz1rsmfecCzVyTrqpX2v4y66VRFQafGgTVEMiwqSgBCVB7U3z9
	 Y/3X93YuK0S3T0jO+ROlKZpdc+Nz83lNQBpsKvE+VODjdv2czeuq2DrAYrTO4za4nn
	 Ner/Obz/rYtz4fiOSavBB8mkEtdaU8vYDDQHSRVjNHpFsBNtnbVm3oV5yR/7J0Nz9w
	 3O4H/9SolprRg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH] ARM: dts: nuvoton: Fix at24 EEPROM node names
Date: Tue, 10 Sep 2024 16:59:05 -0500
Message-ID: <20240910215905.823337-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
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

at24.yaml defines the node name for at24 EEPROMs as 'eeprom'.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts           | 6 +++---
 .../arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts b/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts
index 9f64c85e1c20..c3501786d600 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts
@@ -661,7 +661,7 @@ &i2c5 {
 	clock-frequency = <100000>;
 	status = "okay";
 
-	mb_fru@50 {
+	eeprom@50 {
 		compatible = "atmel,24c64";
 		reg = <0x50>;
 	};
@@ -704,7 +704,7 @@ max31725@5d {
 				reg = <0x5d>;
 				status = "okay";
 			};
-			fan_fru@51 {
+			eeprom@51 {
 				compatible = "atmel,24c64";
 				reg = <0x51>;
 			};
@@ -714,7 +714,7 @@ i2c5_hsbp_fru_3: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
-			hsbp_fru@52 {
+			eeprom@52 {
 				compatible = "atmel,24c64";
 				reg = <0x52>;
 				status = "okay";
diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts
index 087f4ac43187..f67ede148209 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts
@@ -824,7 +824,7 @@ tmp75@4a {
 		reg = <0x4a>;
 		status = "okay";
 	};
-	m24128_fru@51 {
+	eeprom@51 {
 		compatible = "atmel,24c128";
 		reg = <0x51>;
 		pagesize = <64>;
-- 
2.45.2

