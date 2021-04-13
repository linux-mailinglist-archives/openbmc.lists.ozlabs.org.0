Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DE335D9B3
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 10:11:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKJGj1v5wz3c6s
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 18:11:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=L5dPEhT+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=L5dPEhT+; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKJC73RRgz3brS
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 18:08:35 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id q10so11365069pgj.2
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 01:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4XXHGV5/Fb896/kDcQ/qoU2AI/sxq+eqpgf3QaBwT9I=;
 b=L5dPEhT+xHIW+3H5e/WVGnq+j+XciVgdETra9TLREgxdJDGevBmybr401hGePsP+U0
 grb227ig/+qzluUNMMF4cUC8GM+NH9zIT6YmTNQ6YLsxbRGeVequSSIvttTsqy5ZcfU2
 X+K6j3i8rfSuXv9OCizk+x5gUlyM5wq25N/bfNrUfhuHb9mX9xFSlIzyDAu/CBRtJoM8
 FSJCjdqCYCzySPyCrNQU6B9QtJTnBXDlUJc3n/+qFF56TOK1pESvT77gLUzMrGtEvIw8
 vJOgTeMdMsvjsxYbEoqTuSoS6OAVaFImkMDQsVyhrKC5nKGA62jVjlwyoq1hpDuGmcp5
 ZGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4XXHGV5/Fb896/kDcQ/qoU2AI/sxq+eqpgf3QaBwT9I=;
 b=q/OUF3wPg7Y+VXiUVtpe4U0LQpTXE39G2qarPHPW2W5hmnZdy0zPqE76aBv5hw67n+
 RMrV8ichdn0QsHwG2I30FkqXQnazrEkgY7tdkOM6kxxOGhynxH7Hi2ks1iziKpY7ucmq
 KAS6MlmmyzRFGjliBafUOKXi+vLjcswyWuDCUFWrlqKWR0HCWGb3nhG+JfHj9p+qj9EV
 WLFiahA9HpNbs2a9LDd5WcUBRwlDStcAAVk90MVDe3FmpFCbXwW0dQ+XzW+qQn4IO+9b
 mr3Xa9AW/ZMMWtVs2HszJ2ep9hi5GgOpiJzluFNIM3jOhUCMDfSffYSC5mIPU3pfF7i1
 gHsw==
X-Gm-Message-State: AOAM530ACc1UCYYFcjT5yAsbf4wDGbArrpy7j1B9XSq4skUq5YeQGgRw
 fhfiC1ByOT1nFkgyiOhWc1Lqyz3GN/Y=
X-Google-Smtp-Source: ABdhPJwA58NmVq8EMSnL34Y8vz+6kW+hd2blWbgqCBl7VIWAdx4gGtSMGlMEJ8Oov8xPZuqSzje1qA==
X-Received: by 2002:a05:6a00:2ce:b029:246:f904:a94 with SMTP id
 b14-20020a056a0002ceb0290246f9040a94mr18408457pft.56.1618301312689; 
 Tue, 13 Apr 2021 01:08:32 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id nh24sm1443507pjb.38.2021.04.13.01.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 01:08:31 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 08/11] ast2600: Add HACE to
 device tree
Date: Tue, 13 Apr 2021 17:37:52 +0930
Message-Id: <20210413080755.73572-9-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413080755.73572-1-joel@jms.id.au>
References: <20210413080755.73572-1-joel@jms.id.au>
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

HACE is the Hash and Crypto Egine in the AST2600.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/dts/ast2600-rainier.dts | 5 +++++
 arch/arm/dts/ast2600-tacoma.dts  | 5 +++++
 arch/arm/dts/ast2600.dtsi        | 9 +++++++++
 arch/arm/dts/ast2600a1-evb.dts   | 4 ++++
 4 files changed, 23 insertions(+)

diff --git a/arch/arm/dts/ast2600-rainier.dts b/arch/arm/dts/ast2600-rainier.dts
index 67e177baf1bd..aae507b4c23d 100755
--- a/arch/arm/dts/ast2600-rainier.dts
+++ b/arch/arm/dts/ast2600-rainier.dts
@@ -103,3 +103,8 @@
 	pinctrl-0 = <&pinctrl_emmc_default>;
 	sdhci-drive-type = <1>;
 };
+
+&hace {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
diff --git a/arch/arm/dts/ast2600-tacoma.dts b/arch/arm/dts/ast2600-tacoma.dts
index 85d1e3902b11..c8ed5e35a74c 100755
--- a/arch/arm/dts/ast2600-tacoma.dts
+++ b/arch/arm/dts/ast2600-tacoma.dts
@@ -94,3 +94,8 @@
 	pinctrl-0 = <&pinctrl_emmc_default>;
 	sdhci-drive-type = <1>;
 };
+
+&hace {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
diff --git a/arch/arm/dts/ast2600.dtsi b/arch/arm/dts/ast2600.dtsi
index e619f7118886..57ea98a47b67 100644
--- a/arch/arm/dts/ast2600.dtsi
+++ b/arch/arm/dts/ast2600.dtsi
@@ -304,6 +304,15 @@
 
 			};
 
+			hace: hace@1e6d0000 {
+				compatible = "aspeed,ast2600-hace";
+				reg = <0x1e6d0000 0x200>;
+				interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scu ASPEED_CLK_GATE_YCLK>;
+				clock-names = "yclk";
+				status = "disabled";
+			};
+
 			smp-memram@0 {
 				compatible = "aspeed,ast2600-smpmem", "syscon";
 				reg = <0x1e6e2180 0x40>;
diff --git a/arch/arm/dts/ast2600a1-evb.dts b/arch/arm/dts/ast2600a1-evb.dts
index 2827e00c0eb4..2ae6e3bdf192 100644
--- a/arch/arm/dts/ast2600a1-evb.dts
+++ b/arch/arm/dts/ast2600a1-evb.dts
@@ -301,3 +301,7 @@
 &display_port {
 	status = "okay";
 };
+
+&hace {
+	status = "okay";
+};
-- 
2.30.2

