Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D6691B29C
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 01:18:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CLkKi/Zf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9Dz15CPrz3cYt
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 09:18:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CLkKi/Zf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8pdn2TvTz3cJl
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 16:32:29 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1fa3bdd91c1so32849595ad.2
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 23:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719469948; x=1720074748; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDIfl9HjVykS0hpfBMS083uA+ZwP9ghS/a+IaSxCQC8=;
        b=CLkKi/ZfyqO252b7xVquq/KNyZnFubMpugH4nhbZuQwyDqbAKkwVEgGuw12TY+9N+s
         jR9jFEmnmvHLfSNStds3UklbQrrE+vHWwpMFjYDq/fN5xAQG34vFViSuZ6wqfpcDuwTI
         10dqtYhQdHC4jOtNK5qiIv9tiPMZXd1vxH4B51OTM4rI0K+YG2zNX7OCmpTIHz6WfxBD
         Yru8IWPDB2EymmdijCs9oqxGlTShUut/q4HSiszL5LV6n7dzdQx4S8f7vG5zEz+xr5m4
         EjcnW8VDUxI2J8ajpJWWCUweImVirKJmNrQS67fc9pQkHg5n+++ti5JRnFQaysM9rlAE
         T6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719469948; x=1720074748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDIfl9HjVykS0hpfBMS083uA+ZwP9ghS/a+IaSxCQC8=;
        b=puVSJuvu5+5DV6uw2BukElLqqurRjxkVgpon509l1vrSDdVhoht6y2sj2SvWwc9Mx2
         21/RDIQYUH5+G33H6ed7p7qLk8XuApfdeSRYN6c/nMRmfUbqaXNQAdSBV7z413+pzGEl
         q92AkIifbjyfvqx8cNv2+uQAB9xANOhR/bNCkveokLeVSsO5BZDXpw/0vt5g92gUrkOK
         FXaLrRXX1xwddyxdOfxTcLkoHiA1xUx1E4b+IbPfEhuMzwAMnk1v7U8uu27qUqJtMP06
         Ynn+kWWKtY3nTOS+bKgBaUBhTUCSzmzIcnIbmF1J6lj+JhR9dg2GtQw9wlxXZvbngkGR
         qRHg==
X-Gm-Message-State: AOJu0YwLWEsks6pCWSy1KQF3MpOIVGwAFn5zZELhOEfRuMrWYdwpLVsB
	jpGOA3jnZJVL/trutczZEPznaMRqa+hpIpXYlGQMS3VDYecGPi40nYeLJpRS
X-Google-Smtp-Source: AGHT+IHv27QSzZVsJC32MXLqb5wXQ8pvJiH8BGFAno75n4OV6W+ZqcgutIaK2/IYQ0EYfJP4KdwPsQ==
X-Received: by 2002:a17:903:2446:b0:1fa:2760:c3d7 with SMTP id d9443c01a7336-1fa2760d3f8mr149603905ad.13.1719469948637;
        Wed, 26 Jun 2024 23:32:28 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac97a122sm5403235ad.176.2024.06.26.23.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 23:32:28 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 17/17] ARM: dts: aspeed: minerva: Add spi-gpio
Date: Thu, 27 Jun 2024 14:29:51 +0800
Message-Id: <20240627062951.936256-18-yangchen.openbmc@gmail.com>
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

Add spi-gpio for TPM device.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 8180fa5c1854..f5ac248097b4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -23,6 +23,8 @@ aliases {
 		i2c19 = &imux19;
 		i2c20 = &imux20;
 		i2c21 = &imux21;
+
+		spi1 = &spi_gpio;
 	};
 
 	chosen {
@@ -74,6 +76,25 @@ led-4 {
 			default-state = "off";
 		};
 	};
+
+	spi_gpio: spi {
+		status = "okay";
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sck-gpios = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
+
+		tpm@0 {
+			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+			spi-max-frequency = <33000000>;
+			reg = <0>;
+		};
+	};
 };
 
 &uart6 {
-- 
2.34.1

