Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBAD91B28B
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 01:13:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BKrH6Gi3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9Ds04Gm8z3ccf
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 09:13:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BKrH6Gi3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8pdZ2zDkz3cPS
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 16:32:18 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-706524adf91so4651594b3a.2
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 23:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719469937; x=1720074737; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhXK344Q+BpjbqsqUSHdDG5MpVvT/P130hkel56cMb8=;
        b=BKrH6Gi3Vwvr/l+EYInAjkj0dSdMIZOUvkKe6FahO/HJDtp/YxznXDGKVjrYWsgS6n
         H8/TvKltkM/ckr5LPmnxqAnMg/Pi6XgoqD7Icmgnl7GtFc6yuPpxOfiDQXj/nU+MshLO
         8lAf7pHOfq5bT6tbXBoh6muaYyGB2p1FflWcM17COE/x19FI6/CB2L7YxbTW3tV89fiu
         W9Fsec9yPIG5+oYaIfenOUzKnPzIyiGKDlk4OwIZPgTA7ibNrHZ9FZ9NIhnOJUF59whz
         cSx+IcsczqxlcMKo1v8hjppQ5A2L2W4U5PhIYDuYD/F8e1MN+RTPNh5AHrSDG8t5qamI
         YNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719469937; x=1720074737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhXK344Q+BpjbqsqUSHdDG5MpVvT/P130hkel56cMb8=;
        b=T3hchCG1ModbX9HWWSxHN7J5VyKH/Egyun1zPY2D1b4VMdfY0meM/itJ8lhGtLgQVt
         X3et4Tc+qeqdSTKa7Bx+0ByPtf8eScJhY8wx9F9f7lS+7DLIiYmXatq94z4r9bdd6k2D
         V0+zh+yei2HJ+9r3NK5Dlzmo8SypdvBtI1P2lMCSiniEE0rdHMonARmbi9NDWnAGbIqp
         z6QmRQhZj05DAK8g4+p5EULxtgkogmVFXiSZNuBq1rLQbrj2R+Rlnkkg+Yus6+3Qif28
         QA4zbJHZVylmnIo6c3m9lEi0eI3iyZbrWBzdEJTJIm08egl8yrlk2t27PL5r6/EFbFWF
         U4dg==
X-Gm-Message-State: AOJu0YxAQ5fcf49S2oAPvtMFl1SkXDkDSkkIIHf/4bJUShR3IWLRZ8en
	NHDNjAUrJTIZwTJ9SlfOynxPfSsflNOAGusN+tmBQcmh+0kRUo9Ayk2SYIcg
X-Google-Smtp-Source: AGHT+IFr5aQcdMGmTcYHx0mlASIb7WyLJ43PqYEmuV68d3rNCOvbrt8tgFHtSn8pIeQsG6xj3HzI3w==
X-Received: by 2002:a05:6a20:4993:b0:1bd:27b9:b63f with SMTP id adf61e73a8af0-1bd27b9b674mr5339031637.37.1719469937381;
        Wed, 26 Jun 2024 23:32:17 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac97a122sm5403235ad.176.2024.06.26.23.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 23:32:16 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 11/17] ARM: dts: aspeed: minerva: add tmp75 sensor
Date: Thu, 27 Jun 2024 14:29:45 +0800
Message-Id: <20240627062951.936256-12-yangchen.openbmc@gmail.com>
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

Add tmp75 sensor on the i2c bus connect to each fan board.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index fd769578f826..3d80993885b7 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -231,6 +231,11 @@ power-sensor@45 {
 				reg = <0x45>;
 				shunt-resistor = <1000>;
 			};
+
+			temperature-sensor@4b {
+				compatible = "ti,tmp75";
+				reg = <0x4b>;
+			};
 		};
 
 		imux17: i2c@1 {
@@ -273,6 +278,11 @@ power-sensor@45 {
 				reg = <0x45>;
 				shunt-resistor = <1000>;
 			};
+
+			temperature-sensor@4b {
+				compatible = "ti,tmp75";
+				reg = <0x4b>;
+			};
 		};
 
 		imux18: i2c@2 {
@@ -315,6 +325,11 @@ power-sensor@45 {
 				reg = <0x45>;
 				shunt-resistor = <1000>;
 			};
+
+			temperature-sensor@4b {
+				compatible = "ti,tmp75";
+				reg = <0x4b>;
+			};
 		};
 
 		imux19: i2c@3 {
@@ -357,6 +372,11 @@ power-sensor@45 {
 				reg = <0x45>;
 				shunt-resistor = <1000>;
 			};
+
+			temperature-sensor@4b {
+				compatible = "ti,tmp75";
+				reg = <0x4b>;
+			};
 		};
 
 		imux20: i2c@4 {
@@ -399,6 +419,10 @@ power-sensor@45 {
 				reg = <0x45>;
 				shunt-resistor = <1000>;
 			};
+			temperature-sensor@4b {
+				compatible = "ti,tmp75";
+				reg = <0x4b>;
+			};
 		};
 
 		imux21: i2c@5 {
@@ -441,6 +465,10 @@ power-sensor@45 {
 				reg = <0x45>;
 				shunt-resistor = <1000>;
 			};
+			temperature-sensor@4b {
+				compatible = "ti,tmp75";
+				reg = <0x4b>;
+			};
 		};
 	};
 };
-- 
2.34.1

