Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C5E197243
	for <lists+openbmc@lfdr.de>; Mon, 30 Mar 2020 03:52:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rFpG1y5JzDqYK
	for <lists+openbmc@lfdr.de>; Mon, 30 Mar 2020 12:52:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=llAT2hhx; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rFnQ2hc3zDqX0
 for <openbmc@lists.ozlabs.org>; Mon, 30 Mar 2020 12:51:54 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id ng8so6881986pjb.2
 for <openbmc@lists.ozlabs.org>; Sun, 29 Mar 2020 18:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GMWEgW+gvwOnhcRdHHV3BSHLj5yAOIL3sM4j9b3VbGE=;
 b=llAT2hhxPjReR+gxol1AR8gxvzJoNiH8ReS8Bjxrvyqq8FTP6/i1lYhpV8c3/+2tc8
 hebQ2Q8VN5DkJG/Hrou0dZb/LTag5wVqGCffuGEm9WUaqkvmUeoUjga5SuJhPSYkt6gv
 8t4arDSqVeoRXNuh65USk3beOJEKbid++zlHBw/Va/Wuw02zl8r5CvGic9bU/zGYEMoR
 tvORuiwRfEa6A+xryv6Vhq5/yPjsDtRw4C6LiSbSBWA/I0qzjzfJZ3e3zcpGRX3oborP
 HtwFu95vKCz06dLsdRuCe9G6ozKXn7jhC6t0iPt5PsMbEQFFs+y5pXfS3FG4rMmJzjpi
 woxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GMWEgW+gvwOnhcRdHHV3BSHLj5yAOIL3sM4j9b3VbGE=;
 b=X96KY7AwFqaAtmhdJYhkyltivCAryaoD7pro2NXSkdsmVv/Hq8LSiiDQEvOgnMtZM/
 6IEuQ140xM7ehbkRmdEqBpDRT5dG8MUCzjek24IZK2RHmYPzJlQ2xTqTzTKbs2/7n99T
 e0QL2HZKgyJsiHUipILo5gjpoBP3QFSoq7+4ce6r9SzJ/CGT95nZRNMAyGTJ49zVjHxK
 khjB1T2OI/v8l/Om28La72jRv2ftO5J3Yrhu5WWHoGXqoveX6NagMYepQSq2Vo5PGAw0
 sa9Kz5HV6WcABRh5Wop8Zp2CoOf5rqUYkLzic8OcldTEDaT7F63MIBCJodxYkcT9Etvh
 FQFg==
X-Gm-Message-State: ANhLgQ0YwRrzg6Q7Rm2UHkrY2fViJZ5NaUK9cyNcJ2dk/Ya7D/VxrT/m
 kpafH1fNo95EsiWUbRLwk/2GHggcluQ=
X-Google-Smtp-Source: ADFU+vtTF2RCwiUVxuHkzLmNW8uL+27bwq7myCM7KPWcZTKNYmP4bLXLJQXcA0Qa0uESBi8kjFkjKA==
X-Received: by 2002:a17:90a:d101:: with SMTP id
 l1mr13148860pju.1.1585533112513; 
 Sun, 29 Mar 2020 18:51:52 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id y17sm8897327pfl.104.2020.03.29.18.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 18:51:52 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 v2 1/2] ARM: dts: aspeed: tacoma: Add GPIOs for
 FSI
Date: Mon, 30 Mar 2020 12:21:41 +1030
Message-Id: <20200330015142.132779-2-joel@jms.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200330015142.132779-1-joel@jms.id.au>
References: <20200330015142.132779-1-joel@jms.id.au>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

GPIO Q7 is no longer used for air/water. It is repurposed on Tacoma to
indicate internal FSI (low) vs cabled (high).

GPIO B0 controls the muxing of FSI to the cable (low) or internal pins
(high).

Acked-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index 194a48220e2f..d0f7693815c6 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -34,12 +34,6 @@
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		air-water {
-			label = "air-water";
-			gpios = <&gpio0 ASPEED_GPIO(Q, 7) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(Q, 7)>;
-		};
-
 		checkstop {
 			label = "checkstop";
 			gpios = <&gpio0 ASPEED_GPIO(E, 3) GPIO_ACTIVE_LOW>;
@@ -146,6 +140,9 @@
 	#address-cells = <2>;
 	#size-cells = <0>;
 
+	fsi-routing-gpios = <&gpio0 ASPEED_GPIO(Q, 7) GPIO_ACTIVE_HIGH>;
+	fsi-mux-gpios = <&gpio0 ASPEED_GPIO(B, 0) GPIO_ACTIVE_HIGH>;
+
 	cfam@0,0 {
 		reg = <0 0>;
 		#address-cells = <1>;
-- 
2.25.1

