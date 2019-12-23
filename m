Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 958D01296AF
	for <lists+openbmc@lfdr.de>; Mon, 23 Dec 2019 14:53:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hLR66dDkzDqJS
	for <lists+openbmc@lfdr.de>; Tue, 24 Dec 2019 00:53:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iKybZvSV"; 
 dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hLJs54VhzDqLY
 for <openbmc@lists.ozlabs.org>; Tue, 24 Dec 2019 00:47:57 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id m13so7532987pjb.2
 for <openbmc@lists.ozlabs.org>; Mon, 23 Dec 2019 05:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=57Oijn45epfHx8UrEcC/E9dVif2WfR8DVnG0LDbrF+s=;
 b=iKybZvSVXB9CPCxFdTSdnOF/lSw5GP/DWZcUkoBtIt15EeYGBnrNwnbmuDyng1UxLQ
 VJE6wttOZRN7I4s15GswhXiUOLp/zt5vlxCIiRUF7oYOzjosgIdlfk5gvwvA6g12W2X8
 NlDMKipdNVjKmKaWpqAm5QIi9jYs0wR+dfv5tSZ2+tD0VQ6cI5NwJmMmM1lK7GpXn4Xv
 74/ZzoNOiBVfvBcw0KoVqa5lM8lePR8/5LRhvMWDVL5DQpC8SC6Ufpvp4LJK5rfT/HhF
 CWndAlhlxgM+2eHZp3CyriNMP3NCBS8sn9O2nfn/7nePDWakQ+ZZA/haoTKQZtwpCF8I
 XIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=57Oijn45epfHx8UrEcC/E9dVif2WfR8DVnG0LDbrF+s=;
 b=bGa2Nf4xy51+xERQ0V09PapOhVbfvujilTqwG5x89rruCLvIvW0kWEKao7L3IPtDb2
 dkJXH29wFBL6W7fHaoahvHsxCkcJbKFBliir8k8WbN/3zdnWDulYg8T2Hftb9oGuai1d
 YkcxuactjsX1BlL+G+QBAUM1UpKlOdiASZVZHtCncqGg9cLg8S9a2fhwEJyRfi0UoZ00
 CA0fqthriNovU6YS0v6sZFO4s973MsLEGMSYDYsdgEV5OZ7TlBxwC4xb886mxhBXlybi
 Tq9RiEBShdm7sauH04GNfzPqEIdaQwvvHcchN9RcgarfgQekG5Rqk0w6bl4CQKH04KWZ
 xbng==
X-Gm-Message-State: APjAAAUKIIayqnIKtHrUEcJslCnXd6w+e/sePqj4jKRIxF3mXy4JOUwi
 mS706x6hnpKpCbdsMDMumUi3pMjg
X-Google-Smtp-Source: APXvYqzHaDVCi00OKYgVX3Rzmk7AmKK7T8LKS2l4uQSrRzeWVqpIa71+hY7+lENFAUqp5lTqBMq2uA==
X-Received: by 2002:a17:90a:8912:: with SMTP id
 u18mr33696231pjn.21.1577108875120; 
 Mon, 23 Dec 2019 05:47:55 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id b65sm22988588pgc.18.2019.12.23.05.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2019 05:47:54 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.4 4/4] ARM: dts: aspeed-g6: Fix FSI master location
Date: Tue, 24 Dec 2019 00:47:35 +1100
Message-Id: <20191223134735.559200-5-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191223134735.559200-1-joel@jms.id.au>
References: <20191223134735.559200-1-joel@jms.id.au>
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

They were placed incorrectly when rebasing the patches on top of 5.4.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 39 ++++++++++++++++----------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 2af9efa1faa1..99cc7d7ced4d 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -163,26 +163,6 @@
 				spi-max-frequency = <50000000>;
 				status = "disabled";
 			};
-
-			fsim0: fsi@1e79b000 {
-				compatible = "aspeed,ast2600-fsi-master", "fsi-master";
-				reg = <0x1e79b000 0x94>;
-				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&pinctrl_fsi1_default>;
-				clocks = <&syscon ASPEED_CLK_GATE_FSICLK>;
-				status = "disabled";
-			};
-
-			fsim1: fsi@1e79b100 {
-				compatible = "aspeed,ast2600-fsi-master", "fsi-master";
-				reg = <0x1e79b100 0x94>;
-				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&pinctrl_fsi2_default>;
-				clocks = <&syscon ASPEED_CLK_GATE_FSICLK>;
-				status = "disabled";
-			};
 		};
 
 		mdio0: mdio@1e650000 {
@@ -606,6 +586,25 @@
 				ranges = <0 0x1e78a000 0x1000>;
 			};
 
+			fsim0: fsi@1e79b000 {
+				compatible = "aspeed,ast2600-fsi-master", "fsi-master";
+				reg = <0x1e79b000 0x94>;
+				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_fsi1_default>;
+				clocks = <&syscon ASPEED_CLK_GATE_FSICLK>;
+				status = "disabled";
+			};
+
+			fsim1: fsi@1e79b100 {
+				compatible = "aspeed,ast2600-fsi-master", "fsi-master";
+				reg = <0x1e79b100 0x94>;
+				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_fsi2_default>;
+				clocks = <&syscon ASPEED_CLK_GATE_FSICLK>;
+				status = "disabled";
+			};
 		};
 	};
 };
-- 
2.24.0

