Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51284C4B59
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 12:25:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jsj40sHvzDqV1
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 20:25:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AdSKqFEo"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jsg63s4HzDqLV
 for <openbmc@lists.ozlabs.org>; Wed,  2 Oct 2019 20:23:46 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id h195so10098086pfe.5
 for <openbmc@lists.ozlabs.org>; Wed, 02 Oct 2019 03:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PUYB1ajQjQLl2NirN0tR3x/KE85d+eVnJ16gozw+g0k=;
 b=AdSKqFEon2XWIGqOG0KyAjBOuoBe4vMRwQIvbwVwYNsaCOZ8GyCVp2N9sChiawE+Fz
 5HpoZqLCL0qci+GiTLsbZIJmGIGdz4hROiXqHthXSjQBMkZ03EfacOrKGDl5SHVFsPNm
 Zcb09cOfcwIlT9rKCRexhpQmSFNf8Jhxa6cYBXG2NvT3rIFyYWwPc2CJOEJkpjLfHbDj
 cXuwExPAvnAZ9/FxH0x9+LAmaRcSWU8IgsyuEDaDTtKVLLg6jK250qAn5bDLPynM2HX2
 4FvQibMBgeQeWTHIp8Pdui5gkG048/roagF9YVx1U/Vt1L5P6GxHjQDz80itAd19kmTH
 nV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PUYB1ajQjQLl2NirN0tR3x/KE85d+eVnJ16gozw+g0k=;
 b=DaMXaKBV3OYiV2zkI69XtwaK4Itq55EGjM+UwXhXM0bxVbDwbz86NZLV9XXsEEWRrP
 A2QYmHivK11576LR1WrCUlF3Xx79gcA7uCszDstvsEZKgRgj/mRWeAw5hq3XrEBA2SXt
 j3KAA8XNK3IPYzAFOcItpnESbsp+gSiKHeyTkQh2IEIqG2FiaxQ1ekGC+I/eEhdB471S
 YX1vzKtVI6VGD86gb3vEe4WzVesFLeKljur8YcU5STb41A/aHZXqXuHDyIPmCd68lehC
 PoD64bG837NA+43zlAS9oCqI+EGfbSOH10O11Gail8Y0XNXpm3qH8UjnA+PsYropcR1N
 +5lQ==
X-Gm-Message-State: APjAAAWudkCYEYyG98/jj8UeV1o7G0lb51bzttJ9Yn5BLLD2KUcSvl7d
 41MFGaJdGtS+bNUnlJ0H2jNRyh53amI=
X-Google-Smtp-Source: APXvYqzIYlPzSgZXbrPXsBkxT3oqkwsycPCujfLx4kykK+WFnEo6nC0Pj6nVX778ExoK7UpXsK3rTQ==
X-Received: by 2002:a17:90a:fe04:: with SMTP id
 ck4mr3511090pjb.74.1570011823397; 
 Wed, 02 Oct 2019 03:23:43 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id i74sm24187091pfe.28.2019.10.02.03.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 03:23:42 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 1/4] ARM: dts: aspeed-g6: Add VUART descriptions
Date: Wed,  2 Oct 2019 19:53:25 +0930
Message-Id: <20191002102328.5196-2-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191002102328.5196-1-joel@jms.id.au>
References: <20191002102328.5196-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The AST2600 has two VUART devices.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 5bea04b67b5c..2ad90a906266 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -29,6 +29,8 @@
 		i2c14 = &i2c14;
 		i2c15 = &i2c15;
 		serial4 = &uart5;
+		serial5 = &vuart1;
+		serial6 = &vuart2;
 	};
 
 
@@ -475,6 +477,26 @@
 				};
 			};
 
+			vuart1: serial@1e787000 {
+				compatible = "aspeed,ast2500-vuart";
+				reg = <0x1e787000 0x40>;
+				reg-shift = <2>;
+				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_APB1>;
+				no-loopback-test;
+				status = "disabled";
+			};
+
+			vuart2: serial@1e788000 {
+				compatible = "aspeed,ast2500-vuart";
+				reg = <0x1e788000 0x40>;
+				reg-shift = <2>;
+				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_APB1>;
+				no-loopback-test;
+				status = "disabled";
+			};
+
 			i2c: bus@1e78a000 {
 				compatible = "simple-bus";
 				#address-cells = <1>;
-- 
2.23.0

