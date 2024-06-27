Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1000591B286
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 01:10:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O8QkIpH8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9Dmw3m6Mz3cb0
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 09:10:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O8QkIpH8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8pdS2ypLz2ysc
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 16:32:12 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-70670fb3860so3819185b3a.1
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 23:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719469930; x=1720074730; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bV2dcDDnQmUqF9lNzCGX3CGaBRrLRWxvY3uAb50Y988=;
        b=O8QkIpH8C8i2GEyiQVKCiIHGrfCA4nb9Ju874hsVvZHIfJ0HV5T71bXBSfkVj+d2wX
         d0jZ7TiGmvBsLWxVcutO4yAH9C42ZFqatDzV0hOVQxT9dMd8X3K1fLd6e6CASsoqnqw/
         vqMFlkFShdTDHiKSc2BEKtI8x7hbiewCyGe38rJ0gZFE51m8ar163VEROqfM6CGZX79d
         +LPCg8Zitgdkjk2dZKAGTjusezAyfIMvAuVoYljY2qYAVrp9t0Q4pu3GOzYbmdh6cTJp
         fme1Bua7llsARVbc1AayT2iZzN9HOUuX7ETc1v0V4SEYmaVxjTnIzB69f9DA06NiQ8sI
         h14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719469930; x=1720074730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bV2dcDDnQmUqF9lNzCGX3CGaBRrLRWxvY3uAb50Y988=;
        b=lGFCgiH+kopco/w9ucAucWZ1WFtZgumIuE/14PCVa57/a7S3qVSIrCg6MswPxr0Irs
         59he56ZoM5vDXjV749gQ9TDd7a+nQT91lVtw4f925RKWR143JoSonVUfoWRDm5YkVa2/
         JvIgmBiEuyde7G1QiJbDbrZTwQ6d8svL/lUIZynTgA7yT6FwcpeXE9/+0boyrvFLObvX
         e7H2rCbwQI+QdWyn9BIDJ2enpBfTP1ODbUV8OQN/QXbWFsIqDHAiKXDa30dX4nxsKsGh
         gAPX94xM0c4CnY8ic1QiEYj/TgPHos1nOPLjaFHyGc9ACx4mCFiOIrMjIFM8z8sjseWG
         XZGA==
X-Gm-Message-State: AOJu0YzjgvUVC/+5bVEQitcx/HNK5TnC+BaC67BuNT3CCZsFT0Ww3sjF
	rzE1pfkwQq9G8G2cZvNzGi7P5XxSUTNp5dQcyGxIvSGIIGtmWn6eAYrD4kug
X-Google-Smtp-Source: AGHT+IEfRDr9LO3MgUQ/Ys+K+cq1fvVDmRB7Ie2d3VOuA31Fa/sqzYz9hn3T6XP6wrElqxz+vNE/CA==
X-Received: by 2002:a05:6a20:3941:b0:1b7:edea:e36 with SMTP id adf61e73a8af0-1bcee6edfccmr14848834637.22.1719469930234;
        Wed, 26 Jun 2024 23:32:10 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac97a122sm5403235ad.176.2024.06.26.23.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 23:32:09 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 07/17] ARM: dts: aspeed: minerva: Define the LEDs node name
Date: Thu, 27 Jun 2024 14:29:41 +0800
Message-Id: <20240627062951.936256-8-yangchen.openbmc@gmail.com>
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

Define the LEDs node name.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 28 +++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index bc323bfbe514..dfea0025e6ce 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -44,11 +44,35 @@ iio-hwmon {
 	leds {
 		compatible = "gpio-leds";
 
-		led-fan-fault {
-			label = "led-fan-fault";
+		led-0 {
+			label = "bmc_heartbeat_amber";
+			gpios = <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led-1 {
+			label = "fp_id_amber";
+			default-state = "off";
+			gpios = <&gpio0 ASPEED_GPIO(B, 5) GPIO_ACTIVE_HIGH>;
+		};
+
+		led-2 {
+			label = "power_blue";
+			default-state = "off";
+			gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_HIGH>;
+		};
+
+		led-3 {
+			label = "fan_status_led";
 			gpios = <&leds_gpio 9 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
+
+		led-4 {
+			label = "fan_fault_led_n";
+			gpios = <&leds_gpio 10 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
 	};
 };
 
-- 
2.34.1

