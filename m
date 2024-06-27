Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EF591B282
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 01:07:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h3XSEz8M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9Djq08Vyz3d8Y
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 09:07:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h3XSEz8M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8pdK5mWZz2ygY
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 16:32:05 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1f9de13d6baso54435175ad.2
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 23:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719469925; x=1720074725; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvuY3ldSDbcqRp6kVC4EYjFVqjffzG4NqWLDYEbzrrs=;
        b=h3XSEz8MXYM4Wqui0Tj95P0UDytXR+ncqQCS1HWuvBI/ZVQ2UJvbHaOG84z2L7ji1Y
         75qWikIZw7zdGrbXuxzwNrO7fw+RP3lAW7zzaSCqz0crEOG9FT8ISp+hxZxYMzuJxIK5
         lLMs0+E3M0LK7K4A8ksWEADOTjn2Ka/wQrd0AHdpUb13tJdcmO9QkDCIocBOBGsrvI2g
         xhDTbvjfZFvvHDOzAGvh7nAI2PKlPrviW796B/kBs2CV+/u7XM76iveEfBOQkn+eXUiC
         Dnts80na8MKVsDyZfy2hU+IHCl0kBK2wFYrUrjfXAwz1rEVnPscUj+JVIQwqS2wCNMHV
         o1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719469925; x=1720074725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvuY3ldSDbcqRp6kVC4EYjFVqjffzG4NqWLDYEbzrrs=;
        b=HH3VYVPikwXipFTLOerRTiwsaBZ1JSrw1Mh5cuX9rYKWAh+N+qOa381ngktp+LiKcG
         Ha6u9hgPibrr0aa4UhrlLYx4SIMie8Pop8p6AuItG8QR2GmkxshOOLBD8U5ACRx4WEg2
         Por/OZ3pszCpuFn62AvDGTeAFrwWop2CdC641I++cbA4JQhWBlcHRzWBYB1yrCH+DgQT
         uzU0a23GupCh07GGjBSJktbIBOjjur9ADdA66qRA2czfUM6iVnp59ANRAeCIgUQIlrAW
         tgZCbvOST9iauwybI4tjnlR2xfAVQav1OydN8Nte3Ns9ew8dyrXttjK3xw69lfFMHe4m
         gSMw==
X-Gm-Message-State: AOJu0YzXe9GxUmPwcvE0K/gZnQOV/RZJzPRwpuzoX7LxK+ljssZLEFGT
	9gQgL4Vuzw+sotUpF5uk0/vbuV85pJOu6uLB3Oxqo5M784LNvzIqFhYqzb0J
X-Google-Smtp-Source: AGHT+IHsdDjvL5glg3fQZWfS9vvnevRfMoX1V0RQTqjsqYSyB77qi94+ILY43U4nuBOt4pc9mI4J7w==
X-Received: by 2002:a17:903:2281:b0:1f9:cf4c:e699 with SMTP id d9443c01a7336-1fa240e7465mr133158355ad.55.1719469923133;
        Wed, 26 Jun 2024 23:32:03 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac97a122sm5403235ad.176.2024.06.26.23.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 23:32:02 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 04/17] ARM: dts: aspeed: minerva: change RTC reference
Date: Thu, 27 Jun 2024 14:29:38 +0800
Message-Id: <20240627062951.936256-5-yangchen.openbmc@gmail.com>
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

Change the RTC reference from on-chip to externel on i2c bus 9 and address
is 0x51.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 60002b8cffc6..cd321482aa09 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -95,10 +95,6 @@ flash@1 {
 	};
 };
 
-&rtc {
-	status = "okay";
-};
-
 &sgpiom0 {
 	status = "okay";
 	ngpios = <128>;
@@ -308,6 +304,11 @@ eeprom@50 {
 		compatible = "atmel,24c64";
 		reg = <0x50>;
 	};
+
+	rtc@51 {
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+	};
 };
 
 &i2c10 {
-- 
2.34.1

