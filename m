Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA989123E7A
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 05:23:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47d22C12xqzDqVF
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 15:23:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zi7r2yzb"; 
 dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47d21R4C0wzDqQQ
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 15:23:05 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id j11so262721pjs.1
 for <openbmc@lists.ozlabs.org>; Tue, 17 Dec 2019 20:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/Lce3sorYi1Qxb4wvaP/A1wpcmzH2DP+oFLJvH2RzyE=;
 b=Zi7r2yzbQ+0cJWvvM5QJgIF/LDTvQCxItiarblKNtn8glxvFPaBnnQdxGEn7k8iZ2S
 bHpHlyt/ms+alK+3HbvaZLSSCje2/japNSShltTmH9Yuvc6+Vx+QYTZPuPfh1HwxdBGN
 D+E5ZImOWCiY9VlqlZ+CtzCKnkgmjQbudcaPjEqJfXypuKaE2FddUcadeCuoxBlbYrmB
 Tz/gz3FBQah4H7t35Nl+DRUq0VrQ/OLQ56CFzLEiclfFKWISxX/HJmT9p6+8rLad0+Zs
 5xQXEy78AAl7wz2ppXIifEnY3uFtQvYvblA4CR9LQBOzDZJtmpKv9LbEmIH12W+8l3M5
 JIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/Lce3sorYi1Qxb4wvaP/A1wpcmzH2DP+oFLJvH2RzyE=;
 b=ThjN52AsuLxpMIDaOm71POESDXLnotAT0KsBNnrB8zUYV/B/QlT86M4P6xf5Df3AAd
 Z1XN5lzQRfVYmbVk8/NIbx5FvrhUD3Woj3WAFOIeZsg3Q2CyhZriKdk/2Sr6mXVf/vXl
 216TSKrl7mUV52Ul9AFkxVmkDCkKubaB6srID4bfQ4jrlPsKLI6TMGPqm0X8UddKKrAj
 Gjm30T9mwwpZZkcDgw+bYIuwy3gBzG72l2SBt6hPHPir5K/olsSSZebybBAuHB2fJBVY
 Uj5nmBa4rrE7FQ1VaxrdO53bvwqD9/6jBbRGD9w8qrHq/bwkzJHr7eghXrCDjXjV7YyB
 +PoA==
X-Gm-Message-State: APjAAAXQ6xwB9N3zjmOpE0lSDB5VhlwT/ZhHPWjkY8Cgx87npCrp8eiR
 pDxlo7/RoK8P016zpUUuMbY=
X-Google-Smtp-Source: APXvYqyhnjvUWR43lIgsTtE16tAnwoQgUL68n+ZMs62pMMI3HwxAcYJzdG1Y888UxzOe8Vs5kMxb8g==
X-Received: by 2002:a17:90a:e291:: with SMTP id
 d17mr318906pjz.116.1576642981791; 
 Tue, 17 Dec 2019 20:23:01 -0800 (PST)
Received: from voyager.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id t63sm776722pfb.70.2019.12.17.20.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 20:23:01 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH linux dev-5.4] ARM: dts: nuvoton: Update EVB for new PECI
 layout
Date: Wed, 18 Dec 2019 15:22:50 +1100
Message-Id: <20191218042250.456677-1-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
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

The PECI device tree layout changed, breaking the EVB.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 25 ++++++++++++-----------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
index de9c668c6e9a..e02c04910ef0 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
@@ -492,18 +492,6 @@
 				};
 			};
 
-			peci: peci-bus@100000 {
-				cmd-timeout-ms = <1000>;
-				pull-down = <0>;
-				host-neg-bit-rate = <15>;
-				status = "okay";
-				intel-peci-dimmtemp@30 {
-					compatible = "intel,peci-client";
-					reg = <0x30>;
-					status = "okay";
-				};
-			};
-
 			spi0: spi@200000 {
 				cs-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
 				status = "okay";
@@ -610,3 +598,16 @@
 		idle-states = <2>; /* Serial port mode 3 (takeover) */
 	};
 };
+
+&peci0 {
+	cmd-timeout-ms = <1000>;
+	pull-down = <0>;
+	host-neg-bit-rate = <15>;
+	status = "okay";
+
+	intel-peci-dimmtemp@30 {
+		compatible = "intel,peci-client";
+		reg = <0x30>;
+		status = "okay";
+	};
+};
-- 
2.24.0

