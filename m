Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A70E53DF0D
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 02:06:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGYgN14lZz3bhs
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 10:06:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=o/N9rigG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=o/N9rigG;
	dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGYdf0XpGz2xvL
	for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2022 10:04:53 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id b135so11439760pfb.12
        for <openbmc@lists.ozlabs.org>; Sun, 05 Jun 2022 17:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cBJOblQf+JBW5eFj6Lve7Uq/sgUNI6IxnxIp+oDj4QY=;
        b=o/N9rigGtk3iQCWqmB4Ien2nuHpDOcLdmdXhy3sWEy/xPLmUDJx3TzDY08fCRCowBB
         MBZpjVpevGHAg28OtVY4ZQg3Jc3SbPdWvE1ffsoKaFqYPoEg7hyzoUCSjcmKcend8U1A
         lrn4U1J1Khtdnv0f3eawytVSnTDqgeiaZwc01aE64yhOVAqqt6LGZLXORZEwb5ERTlFw
         Ik3sLrs52DhGEowfmM5I/VoouanV8rlr0esAN1xPNrfXHy6po2clwWwn8RS0OMH/Olmv
         +1JBmQs01S9/p0LJzBXR+Z3ICZjUiW7o+rkocIUu9KnvH/RHNxt8Y8hGdMRKUAT9+hdz
         eAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=cBJOblQf+JBW5eFj6Lve7Uq/sgUNI6IxnxIp+oDj4QY=;
        b=nBKRQVzHdnM+ulu1DA4Dq2yy5lDStLU/0o+3MvR8ZphYuyg1pVEe911j1n1gVuqh2X
         CHXx4B47gZjd1vWaLl+mOVVRWfcxklZvDKn0i3vClzcaGxizzWwNr2KQ0pYOpcG6OfFl
         X6KqpUPR7tYzSrQ8F/7bEcDP/iRyAZblWD6cedwm231dyoDPcdnYgm0J9A3Ol1/Nl923
         uCem4IlFciS4Vq5ROpc1H8aaxkjNmhKLvqiiZ2TKm5+joh6zP8N7zHH8EbcCB8kVKPhJ
         NDxztxgAQazb4uAXdWvGuQvVK0hqNMRbOdRljC9EHH+UeJVrT1IZeAcaMM98kMuvNh+y
         HaVQ==
X-Gm-Message-State: AOAM5331MnL23hz/dyFimeOAyAxiJO7XzZ7c9Q3uH6dntSniA2v6zK04
	NyM9jNIbURZIePJyKn2+n3A=
X-Google-Smtp-Source: ABdhPJxKB36UarfgYrDThHO5Vl32l768XqfMlHLs/SdjGpIFiFko9uR1Exmk8fytOwC2vsx5Mj+XKg==
X-Received: by 2002:a63:488:0:b0:3fc:d244:2cde with SMTP id 130-20020a630488000000b003fcd2442cdemr18192052pge.426.1654473891797;
        Sun, 05 Jun 2022 17:04:51 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id g19-20020a170902869300b00163b65c9de2sm9187402plo.170.2022.06.05.17.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 17:04:51 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: zweiss@equinix.com,
	eajames@linux.ibm.com,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 2/2] ARM: dts: ast2600: Fix indentation
Date: Mon,  6 Jun 2022 09:34:34 +0930
Message-Id: <20220606000434.1399583-3-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220606000434.1399583-1-joel@jms.id.au>
References: <20220606000434.1399583-1-joel@jms.id.au>
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

These lines were mistakenly added with space indentation instead of
tabs.

Fixes: ba6ce6626286 ("aspeed: Add machine names")
Reported-by: Zev Weiss <zweiss@equinix.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/dts/ast2600-evb.dts    | 4 ++--
 arch/arm/dts/ast2600-fpga.dts   | 4 ++--
 arch/arm/dts/ast2600-ncsi.dts   | 4 ++--
 arch/arm/dts/ast2600-p10bmc.dts | 4 ++--
 arch/arm/dts/ast2600-tacoma.dts | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/dts/ast2600-evb.dts b/arch/arm/dts/ast2600-evb.dts
index 3aeef78df22d..515afa83af69 100644
--- a/arch/arm/dts/ast2600-evb.dts
+++ b/arch/arm/dts/ast2600-evb.dts
@@ -3,8 +3,8 @@
 #include "ast2600-u-boot.dtsi"
 
 / {
-        model = "AST2600 EVB";
-        compatible = "aspeed,ast2600-evb", "aspeed,ast2600";
+	model = "AST2600 EVB";
+	compatible = "aspeed,ast2600-evb", "aspeed,ast2600";
 
 	memory {
 		device_type = "memory";
diff --git a/arch/arm/dts/ast2600-fpga.dts b/arch/arm/dts/ast2600-fpga.dts
index be0788d92473..069a41185597 100644
--- a/arch/arm/dts/ast2600-fpga.dts
+++ b/arch/arm/dts/ast2600-fpga.dts
@@ -3,8 +3,8 @@
 #include "ast2600-u-boot.dtsi"
 
 / {
-        model = "AST2600 FPGA";
-        compatible = "aspeed,ast2600-fpga", "aspeed,ast2600";
+	model = "AST2600 FPGA";
+	compatible = "aspeed,ast2600-fpga", "aspeed,ast2600";
 
 	memory {
 		device_type = "memory";
diff --git a/arch/arm/dts/ast2600-ncsi.dts b/arch/arm/dts/ast2600-ncsi.dts
index f55294cdf95e..dbe888a945e3 100644
--- a/arch/arm/dts/ast2600-ncsi.dts
+++ b/arch/arm/dts/ast2600-ncsi.dts
@@ -3,8 +3,8 @@
 #include "ast2600-u-boot.dtsi"
 
 / {
-        model = "AST2600 EVB w/ NCSI";
-        compatible = "aspeed,ast2600-evb", "aspeed,ast2600";
+	model = "AST2600 EVB w/ NCSI";
+	compatible = "aspeed,ast2600-evb", "aspeed,ast2600";
 
 	memory {
 		device_type = "memory";
diff --git a/arch/arm/dts/ast2600-p10bmc.dts b/arch/arm/dts/ast2600-p10bmc.dts
index d1d78d5c3545..aa9edcd66507 100755
--- a/arch/arm/dts/ast2600-p10bmc.dts
+++ b/arch/arm/dts/ast2600-p10bmc.dts
@@ -5,8 +5,8 @@
 #include "ast2600-u-boot.dtsi"
 
 / {
-        model = "IBM P10 BMC";
-        compatible = "ibm,everest-bmc", "ibm,rainier-bmc", "ibm,p10bmc", "aspeed,ast2600";
+	model = "IBM P10 BMC";
+	compatible = "ibm,everest-bmc", "ibm,rainier-bmc", "ibm,p10bmc", "aspeed,ast2600";
 
 	memory {
 		device_type = "memory";
diff --git a/arch/arm/dts/ast2600-tacoma.dts b/arch/arm/dts/ast2600-tacoma.dts
index 67b3e3013c6b..76f987052140 100755
--- a/arch/arm/dts/ast2600-tacoma.dts
+++ b/arch/arm/dts/ast2600-tacoma.dts
@@ -5,8 +5,8 @@
 #include "ast2600-u-boot.dtsi"
 
 / {
-        model = "Tacoma";
-        compatible = "ibm,tacoma-bmc", "aspeed,ast2600";
+	model = "Tacoma";
+	compatible = "ibm,tacoma-bmc", "aspeed,ast2600";
 
 	memory {
 		device_type = "memory";
-- 
2.35.1

