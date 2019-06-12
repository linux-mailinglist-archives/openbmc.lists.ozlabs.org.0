Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 737E14214C
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 11:47:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45P28X5CdbzDr1m
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 19:47:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=franhsutw@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tVFLDWIk"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45P27z3hdNzDr1C
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 19:46:38 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id a186so9335585pfa.5
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 02:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=96CUmVtXRol9GFe8blMGiPgnkxOTlmwzTTnIcg5Ov0E=;
 b=tVFLDWIkgQyUybWf4OG3yycMZGesL3WG58gjs3XHE5o9b+9fjun9kX3Y7AlxdA/DXB
 k/GbODdU/JhLcYa6G8FVbbLOwAJ7D6pGKfODPMynK7xHiVhyqueUA7BDKDxhH2GTdzec
 2sfiuIN5rS2fVu4eDDmxy3wevfCdccdUBKieFnlUtL8VqiEWYVj/TVeGrFAKX5zmzQiN
 SZTahkc7g15G1TvTXxVbqW5Lb+HebYPYIs8+Rg6GgVXj+3SpeaEbdoDDKvGbpKvbol70
 MMRlFRypCqZSm+3qketd+rzpHZpRCr7VKE+HS5IGAUK/GEmwQ0CKBaoNV0ANlbInk0D7
 YoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=96CUmVtXRol9GFe8blMGiPgnkxOTlmwzTTnIcg5Ov0E=;
 b=X9nEOzQqmBO+iVDN0wbq9mMD7ykIHzPzCqS5ymLXAF7Ci8o2B09egPnl9MX2cx9AdT
 U286vlAgSVux1/KHHS7k04Y9fhZIDRpczy15htdkPD5LvWJl0XHRTl8wEfigNA5v+9cw
 bAtVA8+gjURBurklGAUBhQM9icrtmf5yxHAgOy5IZkN/zHBM2XoyNAdu0g0HuGIOB0wJ
 HD88uEyYIiDqLScn4uYyq7n2eqlZr7qXiLIxb2Mr9Jcmya8DRTtLMRXWnMojzSBE4+sD
 8/nZ8+2HKpygB2SSLCTSiOzxswI6LI6PrCAFr+kSxM57FERJyusckf7KHYuj/yZVktTW
 7j1Q==
X-Gm-Message-State: APjAAAUd/tKDQgoLqKlaaYBc+f8yHkd60BOs7V9LtL/erAeo7nzi4Bjv
 1xty+QAHE/kleeMPUJuxiYo=
X-Google-Smtp-Source: APXvYqzpVCAXdg4t5ddeIvRy7hshSDForQ3fkCJll6HwZ+UlTBExw/fnWliOUniqe8VhtKcmXjcSbQ==
X-Received: by 2002:a63:4c0f:: with SMTP id z15mr24050026pga.245.1560332795378; 
 Wed, 12 Jun 2019 02:46:35 -0700 (PDT)
Received: from localhost.localdomain (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id k184sm6160960pgk.7.2019.06.12.02.46.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 12 Jun 2019 02:46:34 -0700 (PDT)
From: Fran Hsu <franhsutw@gmail.com>
X-Google-Original-From: Fran Hsu <Fran.Hsu@quantatw.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH dev-5.1 v8] ARM: dts: nuvoton: Update Quanta GSJ BMC Device
 Tree.
Date: Wed, 12 Jun 2019 17:44:30 +0800
Message-Id: <20190612094430.33073-1-Fran.Hsu@quantatw.com>
X-Mailer: git-send-email 2.21.0
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
Cc: openbmc@lists.ozlabs.org, Fran Hsu <Fran.Hsu@quantatw.com>,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch cleans up the warning message when build GSJ device tree.
1. Remove the part of i2c-slave-mqueue from GSJ device tree.
2. Thanks for Joel's reminder I also remove the nodes of
   disabled i2c bus from GSJ device tree.

Tested:
  Build Quanta GSJ image and load on the GSJ BMC module.
  Ensure that BMC boots to console successful.

Signed-off-by: Fran Hsu <Fran.Hsu@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 62 +----------------------
 1 file changed, 1 insertion(+), 61 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
index 380d0d382395..801ed73d962c 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
@@ -5,7 +5,7 @@
 #include "nuvoton-npcm730.dtsi"
 #include "nuvoton-npcm730-gsj-gpio.dtsi"
 / {
-	model = "Quanta GSJ Board (Device Tree v11)";
+	model = "Quanta GSJ Board (Device Tree v12)";
 	compatible = "nuvoton,npcm750";
 
 	aliases {
@@ -13,21 +13,15 @@
 		ethernet1 = &gmac0;
 		serial3 = &serial3;
 		udc9 = &udc9;
-		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
 		i2c4 = &i2c4;
-		i2c5 = &i2c5;
-		i2c6 = &i2c6;
-		i2c7 = &i2c7;
 		i2c8 = &i2c8;
 		i2c9 = &i2c9;
 		i2c10 = &i2c10;
 		i2c11 = &i2c11;
 		i2c12 = &i2c12;
-		i2c13 = &i2c13;
-		i2c14 = &i2c14;
 		i2c15 = &i2c15;
 		fiu0 = &fiu0;
 	};
@@ -162,13 +156,6 @@
 				status = "okay";
 			};
 
-			i2c0: i2c@80000 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				bus-frequency = <100000>;
-				status = "disabled";
-			};
-
 			i2c1: i2c@81000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -217,27 +204,6 @@
 				};
 			};
 
-			i2c5: i2c@85000 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				bus-frequency = <100000>;
-				status = "disabled";
-			};
-
-			i2c6: i2c@86000 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				bus-frequency = <100000>;
-				status = "disabled";
-			};
-
-			i2c7: i2c@87000 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				bus-frequency = <100000>;
-				status = "disabled";
-			};
-
 			i2c8: i2c@88000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -296,32 +262,6 @@
 				};
 			};
 
-			i2c13: i2c@8d000 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				bus-frequency = <100000>;
-				status = "okay";
-
-				ipmb@40000010 {
-					compatible = "slave-mqueue";
-					reg = <0x40000010>;
-					status = "okay";
-				};
-			};
-
-			i2c14: i2c@8e000 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				bus-frequency = <100000>;
-				status = "okay";
-
-				ipmb@40000012 {
-					compatible = "slave-mqueue";
-					reg = <0x40000012>;
-					status = "okay";
-				};
-			};
-
 			i2c15: i2c@8f000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.21.0

