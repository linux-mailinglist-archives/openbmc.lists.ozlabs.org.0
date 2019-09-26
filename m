Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78206BEC08
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 08:34:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46f4sk1V00zDqmT
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 16:34:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wut8al0B"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46f4ph5xv3zDqm9
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 16:32:12 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id y10so890526plp.2
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 23:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j8hQdm4C+zYbtaBhERaACtb7ruwCDDeqedChaL1Ac38=;
 b=Wut8al0Bsco+RmUJ51Hl0AMLSwmQeUyn4/kZ6RTPpk8U4ugYA9kEopxEOWyvP1zIzs
 N4ti/2TwEOP21qDgklPyU0Hji7vhqfe+7DwXwRV5QxlEsAs/JkeT/pvOjVcdQqnVU8C0
 40ZYiM9ZA+5jaLOupxfXl1JBE2xtclFOjs5tkBctUUBBxNnR87F/1aaa1s6FGKMq27pV
 oC2kzE+8hgyw5LahvXEHjglytkSbPc7/5ko7rDFxlievjxQ1zHyGYl+hFQvWsZJxgiA2
 QF/8qxqKPnO7SP8maGlq3tOrkqyztSyJZ8wSsv6KGJ+jbirHxdtBNmhaLcztB8OxhytV
 hJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=j8hQdm4C+zYbtaBhERaACtb7ruwCDDeqedChaL1Ac38=;
 b=SycqRxPBJnWofbJmaE0zn6cfbxkGui+5B1MVUopcNYaolbhrjGGmrpy4BFKo1pjqNG
 O/KnvVkyf1WjIlrtE+bAjqSbw0rlL7LCTb6U17gSOBHeNj2Q/dXK+XAi4i+TIQ9qF+F5
 Q8DHMSyLItKOEscadFPKsy8Y1c0KHJQgD+YVdlHY5q61xczxbdWx6SnsNZ5vVb/HuC8n
 85axd55fW3gUmQA6GNCXgdjt0el6gmn+AgNycL5TsHtEVs9eRH6D3Bv5wUhIGMIUfaIt
 LWHzUW8g/zebs+WzoJZNb2hC/N6pVLKLmJmGiekgY27/k3kgmXyLgXGaX2hs6iR/RDQR
 C4ZA==
X-Gm-Message-State: APjAAAVvOYMA806BX6gRHzJ/yn3uZI8Cr3eNJwnHiYj3s9Bw+DDsjW4/
 umJz9kGoqsVrZtfJ+10oMO0hYben
X-Google-Smtp-Source: APXvYqwUdhjCHgHIsVJpKP0yHBxoLHzgn7xERhS7pbijmiGqiuN+8ZYFtvZSYe2IwhLnsvlVrADGKA==
X-Received: by 2002:a17:902:59db:: with SMTP id
 d27mr2023569plj.253.1569479529604; 
 Wed, 25 Sep 2019 23:32:09 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id i6sm1899984pfq.20.2019.09.25.23.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 23:32:09 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 2/2] ARM: dts: aspeed: ast2600evb: Use custom
 flash layout
Date: Thu, 26 Sep 2019 16:01:57 +0930
Message-Id: <20190926063157.22743-3-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190926063157.22743-1-joel@jms.id.au>
References: <20190926063157.22743-1-joel@jms.id.au>
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The AST2600 u-boot and kernel images have outgrown the OpenBMC layout.
While BMC machines use 128MB SPI NOR chips, we only have 64MB on the EVB
so use a layout that has a smaller region for the ro and rw filesystems.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-ast2600-evb.dts | 32 +++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
index 7bcafb027afa..0b3d3978c4d3 100644
--- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
@@ -96,7 +96,37 @@
 		m25p,fast-read;
 		label = "bmc";
 		spi-max-frequency = <50000000>;
-#include "openbmc-flash-layout.dtsi"
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			u-boot@0 {
+				reg = <0x0 0xe0000>; // 896KB
+				label = "u-boot";
+			};
+
+			u-boot-env@e0000 {
+				reg = <0xe0000 0x20000>; // 128KB
+				label = "u-boot-env";
+			};
+
+			kernel@100000 {
+				reg = <0x100000 0x900000>; // 9MB
+				label = "kernel";
+			};
+
+			rofs@a00000 {
+				reg = <0xa00000 0x2000000>; // 32MB
+				label = "rofs";
+			};
+
+			rwfs@6000000 {
+				reg = <0x2a00000 0x1600000>; // 22MB
+				label = "rwfs";
+			};
+		};
 	};
 };
 
-- 
2.23.0

