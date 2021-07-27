Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 954953D6CD4
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 05:33:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYj7l3vQcz30L2
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 13:33:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=X6t5Cd7N;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=X6t5Cd7N; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYj7Q2Dtjz2yyt;
 Tue, 27 Jul 2021 13:33:37 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id t21so14068043plr.13;
 Mon, 26 Jul 2021 20:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sgogXb1SnR/+7JQk31e50axmieq/LTndC4H+WEUwDIw=;
 b=X6t5Cd7NfOGCRbIAFIr3P9GYdw0wu5JRbP6NAYNMt2RPW04bFrn4al2wU1ZT779jZu
 42xhpYW/Xn2mOH5hcVjXJbNaT1jmxr+QbPrWpgZxZUqoYRbi/vUxEmSJr3xxFFT5ZvOh
 iM03F/PXyoL1GGU+UFySIDioBfYXCEwOfZMu367ZtO89tds0xDj2dkDlO5A2IKHayb8A
 W027MTD7MxLEeksSCq2wLo8hVOobuRkYNL2450pqpfAatQnphxwA1BrhTiRKCUR4JVE1
 ej2cH9FczsKOU6worj6A7hV8F1cIKKZGZ0YHYE69aucpBmNqP92mSfPYuvVGmNExci2V
 /dog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sgogXb1SnR/+7JQk31e50axmieq/LTndC4H+WEUwDIw=;
 b=UI7nwCVLd3VC0mh2Lv3YnssKOJ/xUKRoAQIoj2taFmMNpp1S7OmbVqio170BT+ZgpK
 lO4IXH6V7cWCznGqDxR1Xyp9k6F8pmIQ1XkVMuGyH9HzYAoa7HjKoXtMM0TfCc3tO9EA
 ToGfxSbdW52Nx+LuCN9p2zkv9QzBFJhgDs/7kT2Jo+1IH9CbAGK0E4HMqjgVG0MF6Yg+
 Po56WT9jMmqy7CROb0sRXaQS83RR2gl6vVtMebJT7eIA51U4yBACHdWYdSEtbT4pr+VU
 uYqYq+4s6iUenunZ3abQpW/uLlYXT7pLspncLhQcWdnb8ZT4ClqXP9/6hQQMk60YwRmz
 dk3g==
X-Gm-Message-State: AOAM531BiJT2Y8GGVzbye3/Y04klPyFi2tuMg2Fz+oRpM0LAgeXxFG76
 wsAHca1CnnEGpl1fdE0zNVQmNM6RQOc=
X-Google-Smtp-Source: ABdhPJx5l2G6QtAdpW4Jl6gRF8PJvSae7WXoRyi/MOc+INvwcgnB6mIMwiMbQq8WDcsKw98VJx3Q0Q==
X-Received: by 2002:a17:90b:3653:: with SMTP id
 nh19mr2117160pjb.169.1627356814893; 
 Mon, 26 Jul 2021 20:33:34 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id s193sm1528351pfc.183.2021.07.26.20.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 20:33:34 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	andrew@aj.id.au
Subject: [PATCH 1/2] ARM: dts: rainier, everest: Add TPM reset GPIO
Date: Tue, 27 Jul 2021 13:03:18 +0930
Message-Id: <20210727033319.473152-2-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210727033319.473152-1-joel@jms.id.au>
References: <20210727033319.473152-1-joel@jms.id.au>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The GPIO is used to place the BMC-connected TPM in reset. This state is
latched until the BMC is next reset, blocking access to the TPM for that
boot.

On both machines this net is called TPM_RESET_LATCH_B.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 2 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index aa24cac8e5be..4536cd538af9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -253,7 +253,7 @@ &gpio0 {
 	/*O0-O7*/	"","","","","","","","",
 	/*P0-P7*/	"","","","","led-pcieslot-power","","","",
 	/*Q0-Q7*/	"","","","","","","","",
-	/*R0-R7*/	"","","","","","I2C_FLASH_MICRO_N","","",
+	/*R0-R7*/	"bmc-tpm-reset","","","","","I2C_FLASH_MICRO_N","","",
 	/*S0-S7*/	"","","","","","","","",
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","","",
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 481d0ee1f85f..06b3d1573780 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -271,7 +271,7 @@ &gpio0 {
 	/*O0-O7*/	"","","","usb-power","","","","",
 	/*P0-P7*/	"","","","","pcieslot-power","","","",
 	/*Q0-Q7*/	"cfam-reset","","","","","","","",
-	/*R0-R7*/	"","","","","","","","",
+	/*R0-R7*/	"bmc-tpm-reset","","","","","","","",
 	/*S0-S7*/	"presence-ps0","presence-ps1","presence-ps2","presence-ps3",
 				"","","","",
 	/*T0-T7*/	"","","","","","","","",
-- 
2.32.0

