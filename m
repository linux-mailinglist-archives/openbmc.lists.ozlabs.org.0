Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EA153F266
	for <lists+openbmc@lfdr.de>; Tue,  7 Jun 2022 01:10:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LH8Nk6Gsrz3bd4
	for <lists+openbmc@lfdr.de>; Tue,  7 Jun 2022 09:10:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MQxtYQU2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MQxtYQU2;
	dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LH8M43g4Dz2ywl
	for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2022 09:09:20 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id x4so5346406pfj.10
        for <openbmc@lists.ozlabs.org>; Mon, 06 Jun 2022 16:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G71rmfFFf3Y9jxiLks9f6a7lGQHRCUTE/08dNh6lnNc=;
        b=MQxtYQU2lBdvTSbZcE9xTYtXjuF2SQzzcPrjyPGe6GcszVwNvOk7W9TEAnCfR26Wx1
         HF9rnmQbdeo8t6ghXokd97EydH7sCCmWFaDrarlmEYW1gdsxJ3gDvGRjTRLKt8Rj5ov5
         II4CZPWc3VHTDVRwpBN8PfvK1i0vTy4yi1LrlBrXU7ItRJF8EfEJOub8zxAnWWhyOprr
         HvoGZ5/NzYbk221g2Ct3lwqlsDCuu5TDDcKeLKQ017KvGKbWiPxEre1CEuN3zkmOrkZv
         5oB0rs/ghjJHi7itNiVkT5NuE/ZZackKwNPsO5WmbopC032SKkP5s2RqDVLE/qNRvORc
         r6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=G71rmfFFf3Y9jxiLks9f6a7lGQHRCUTE/08dNh6lnNc=;
        b=R7qXvZU8d3zFSCInSmxvDBOPRsvLEJGpreieZz8wr/HS3gw7Tdxr0wRUEPHc1YMuv2
         w8cjzGs2I2FhqqQmZz+yAF113vVUT71EhJOJzaDxqO1e2ngCqZU7CrneQbzUseNNdmGA
         Mi3im20re9Z1MepABJIW3J19/TbR+by/5LfisoXeRxaAYS+ug+TLB4cHvYLQ/w+a+zT3
         MvfQBY+ZTueZPa5sQd0OzInkff141zFgUxT0jFwTKJbxPrLXtyJH0x1GR8f0ElGyKZgJ
         YcwOSk/C9fLeEOyoXAnPd72QIvKb+RA6pa1DzOjhgszxcx85ZG3qKXksiCNZEJUn0UdC
         wsuw==
X-Gm-Message-State: AOAM530aojMsR6VS2OHS78ZplQW4VjaQiq0TLmwfTu0qWMxuURDxnMsL
	yFGdU0BWjnlnAfbYT8v6AiFAF8tGvsw=
X-Google-Smtp-Source: ABdhPJwYZ1KA1ZLvKX45GyOSCa7yqJvHAqwdqUg+Cs0+Jw1H77Z+4lNKGmZz9hRAuWzMUvldLGy4Ig==
X-Received: by 2002:a63:a55:0:b0:3fd:e492:354e with SMTP id z21-20020a630a55000000b003fde492354emr3653530pgk.416.1654556957693;
        Mon, 06 Jun 2022 16:09:17 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id jc20-20020a17090325d400b0015e8d4eb20dsm10926972plb.87.2022.06.06.16.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 16:09:16 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	eajames@linux.ibm.com,
	Zev Weiss <zweiss@equinix.com>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v3 2/2] ARM: dts: ast2600: Fix indentation
Date: Tue,  7 Jun 2022 08:39:01 +0930
Message-Id: <20220606230901.1641522-3-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220606230901.1641522-1-joel@jms.id.au>
References: <20220606230901.1641522-1-joel@jms.id.au>
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
Reviewed-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3: Also fix ast2400-evb, ast2500-evb, ast2600a0-evb and ast2600a1-evb

 arch/arm/dts/ast2400-evb.dts    | 4 ++--
 arch/arm/dts/ast2500-evb.dts    | 4 ++--
 arch/arm/dts/ast2600-evb.dts    | 4 ++--
 arch/arm/dts/ast2600-fpga.dts   | 4 ++--
 arch/arm/dts/ast2600-ncsi.dts   | 4 ++--
 arch/arm/dts/ast2600-p10bmc.dts | 4 ++--
 arch/arm/dts/ast2600-tacoma.dts | 4 ++--
 arch/arm/dts/ast2600a0-evb.dts  | 4 ++--
 arch/arm/dts/ast2600a1-evb.dts  | 4 ++--
 9 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm/dts/ast2400-evb.dts b/arch/arm/dts/ast2400-evb.dts
index 2ba15d17deda..96a73c32d4e3 100644
--- a/arch/arm/dts/ast2400-evb.dts
+++ b/arch/arm/dts/ast2400-evb.dts
@@ -3,8 +3,8 @@
 #include "ast2400-u-boot.dtsi"
 
 / {
-        model = "AST2400 EVB";
-        compatible = "aspeed,ast2400-evb", "aspeed,ast2400";
+	model = "AST2400 EVB";
+	compatible = "aspeed,ast2400-evb", "aspeed,ast2400";
 
 	memory {
 		device_type = "memory";
diff --git a/arch/arm/dts/ast2500-evb.dts b/arch/arm/dts/ast2500-evb.dts
index f668eec5c137..1dcad9ed76b9 100644
--- a/arch/arm/dts/ast2500-evb.dts
+++ b/arch/arm/dts/ast2500-evb.dts
@@ -3,8 +3,8 @@
 #include "ast2500-u-boot.dtsi"
 
 / {
-        model = "AST2500 EVB";
-        compatible = "aspeed,ast2500-evb", "aspeed,ast2500";
+	model = "AST2500 EVB";
+	compatible = "aspeed,ast2500-evb", "aspeed,ast2500";
 
 	memory {
 		device_type = "memory";
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
diff --git a/arch/arm/dts/ast2600a0-evb.dts b/arch/arm/dts/ast2600a0-evb.dts
index b242215536a5..859808a10d7a 100644
--- a/arch/arm/dts/ast2600a0-evb.dts
+++ b/arch/arm/dts/ast2600a0-evb.dts
@@ -3,8 +3,8 @@
 #include "ast2600-u-boot.dtsi"
 
 / {
-        model = "AST2600 EVB";
-        compatible = "aspeed,ast2600-evb", "aspeed,ast2600";
+	model = "AST2600 EVB";
+	compatible = "aspeed,ast2600-evb", "aspeed,ast2600";
 
 	memory {
 		device_type = "memory";
diff --git a/arch/arm/dts/ast2600a1-evb.dts b/arch/arm/dts/ast2600a1-evb.dts
index 6bd498d471e2..a5576a004f2d 100644
--- a/arch/arm/dts/ast2600a1-evb.dts
+++ b/arch/arm/dts/ast2600a1-evb.dts
@@ -3,8 +3,8 @@
 #include "ast2600-u-boot.dtsi"
 
 / {
-        model = "AST2600 EVB";
-        compatible = "aspeed,ast2600-evb", "aspeed,ast2600";
+	model = "AST2600 EVB";
+	compatible = "aspeed,ast2600-evb", "aspeed,ast2600";
 
 	memory {
 		device_type = "memory";
-- 
2.35.1

