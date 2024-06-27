Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A79D91B287
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 01:11:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gA4zSWAE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9Dny3M0kz2xjL
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 09:11:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gA4zSWAE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8pdT6fPFz3cLk
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 16:32:13 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-6e3741519d7so5203740a12.2
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 23:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719469932; x=1720074732; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdGXb9xaxS+at5MNG5psiNQJLwy+4zAvvWhthDyzcbA=;
        b=gA4zSWAEy9NUce4/bcYCVyW2I6wyTpiVxwlZ77GPYuAV2mlatZVbc0wsR/VAZ8OCkz
         RzspClL/yBGIqdA/somL2QHfk8zLoLyjN4vu1M9/mf5DAaCH84WDTv3SHBLLGVuLfzu9
         2bpGTtWkxfoOBSNgdAc82K/oOe34yplKHKFYZ1o6L3ntLa07qTf6KVw31Dd9vvNRer/R
         WSF7eKObjWINLJJqO6R42Zb/bcNCDl+D7TEL6K7n+4K4GrAfVKnEvYXUNiinpO5CEuvA
         cmgOlia/YZt5lIluQ8LTsSlDx88ltB31QxrjyebzPjHeDjfRQ4NXRVp0z/MapgYfTfSy
         uUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719469932; x=1720074732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BdGXb9xaxS+at5MNG5psiNQJLwy+4zAvvWhthDyzcbA=;
        b=SHcgkD0veQFsXqU2UMGTJ/1rAH5U8dMRuHTREVJxVW0zfQKmY8aRENWhqqc8/VxjUi
         +8HS9XL8kod8Dx8F5clEi0fdwUCzKUxMKHJA68qRm3+Ylh44pgIE9RjrTv17hOnoe/o1
         NGgQdPZwiHATjfVL4fc43OXmEHlVG1oxwZBNHl/ve5x9RdyJOdugmj4omwfe6npoT/J1
         mF0Q5Ql0KvIsFcGiCLJ0eoopZzAwTOSft73WqEkeIed7qzg2shu8ASV1smeRczBwmhY2
         afQupi2DZE4ziCN6wVZDIci/6CDOkdKlIpwjUfcUk5E3EMZ33EPVa5151QbktcIB3F5W
         z3Pg==
X-Gm-Message-State: AOJu0YzExTDlxjz+wQCk7pbl2S0Jvnaxmch2DiO/jzzfSjmJS9gIVHd5
	bKKfUtKEe75hUypostLy6lsxgDzcv/XfBKRZx51o+3sVBG05pVxXTs1fWpP+
X-Google-Smtp-Source: AGHT+IGEdnJIyzw9/p7+mTbNqBmMI0pHL9Ts1ciV1vS5nRyvGxZZyDVI//qlHuAUibHfapTVko3WrQ==
X-Received: by 2002:a05:6a20:8c16:b0:1bd:2ce9:9e41 with SMTP id adf61e73a8af0-1bd2ce9a0f3mr3893420637.46.1719469932000;
        Wed, 26 Jun 2024 23:32:12 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac97a122sm5403235ad.176.2024.06.26.23.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 23:32:11 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 08/17] ARM: dts: aspeed: minerva: Add adc sensors for fan board
Date: Thu, 27 Jun 2024 14:29:42 +0800
Message-Id: <20240627062951.936256-9-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627062951.936256-1-yangchen.openbmc@gmail.com>
References: <20240627062951.936256-1-yangchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 Jun 2024 09:03:24 +1000
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
Cc: Jerry.Lin@quantatw.com, yang.chen@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Yang Chen <yang.chen@quantatw.com>

Add ina238 support to read the sensors in front of fans.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index dfea0025e6ce..86d319d7edcd 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -207,6 +207,30 @@ pwm@5e{
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
+
+			power-sensor@40 {
+				compatible = "ti,ina238";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@41 {
+				compatible = "ti,ina238";
+				reg = <0x41>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@44 {
+				compatible = "ti,ina238";
+				reg = <0x44>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@45 {
+				compatible = "ti,ina238";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
 		};
 
 		imux17: i2c@1 {
@@ -225,6 +249,30 @@ pwm@5e{
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
+
+			power-sensor@40 {
+				compatible = "ti,ina238";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@41 {
+				compatible = "ti,ina238";
+				reg = <0x41>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@44 {
+				compatible = "ti,ina238";
+				reg = <0x44>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@45 {
+				compatible = "ti,ina238";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
 		};
 
 		imux18: i2c@2 {
@@ -243,6 +291,30 @@ pwm@5e{
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
+
+			power-sensor@40 {
+				compatible = "ti,ina238";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@41 {
+				compatible = "ti,ina238";
+				reg = <0x41>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@44 {
+				compatible = "ti,ina238";
+				reg = <0x44>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@45 {
+				compatible = "ti,ina238";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
 		};
 
 		imux19: i2c@3 {
@@ -261,6 +333,30 @@ pwm@5e{
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
+
+			power-sensor@40 {
+				compatible = "ti,ina238";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@41 {
+				compatible = "ti,ina238";
+				reg = <0x41>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@44 {
+				compatible = "ti,ina238";
+				reg = <0x44>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@45 {
+				compatible = "ti,ina238";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
 		};
 
 		imux20: i2c@4 {
@@ -279,6 +375,30 @@ pwm@5e{
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
+
+			power-sensor@40 {
+				compatible = "ti,ina238";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@41 {
+				compatible = "ti,ina238";
+				reg = <0x41>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@44 {
+				compatible = "ti,ina238";
+				reg = <0x44>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@45 {
+				compatible = "ti,ina238";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
 		};
 
 		imux21: i2c@5 {
@@ -297,6 +417,30 @@ pwm@5e{
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
+
+			power-sensor@40 {
+				compatible = "ti,ina238";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@41 {
+				compatible = "ti,ina238";
+				reg = <0x41>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@44 {
+				compatible = "ti,ina238";
+				reg = <0x44>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@45 {
+				compatible = "ti,ina238";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
 		};
 	};
 };
-- 
2.34.1

