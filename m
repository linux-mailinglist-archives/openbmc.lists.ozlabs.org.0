Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94668A5DA43
	for <lists+openbmc@lfdr.de>; Wed, 12 Mar 2025 11:14:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZCRKh0MR2z3g0p
	for <lists+openbmc@lfdr.de>; Wed, 12 Mar 2025 21:13:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741774403;
	cv=none; b=NHOAC/UslypEDZNqgHYZ4DVE/NsgF4bN4jimi8i3Em5RRsGWOopkuKXvDFaZuNowiEcnZUB0kbQjbYhJYqA+wyQVQVTNm22FfWUKKUQnAcvvFn67M9NyhpLYgyINQbmaildLCM07GjHK8rR9hU1KWbZEjFjXGb8rG5Z/IyDiFtxk2xAjF96S5OUaVXP9sb6LORTD4PSfNtKjc0p0O1klKQT73j88uaV2sw3nmQqOpghp7hx5b1TFS6EJ6OwyZiBkDEEJy7wBKcVNteATLypAgmI8mCnyYeqvi08cWuBTUIgDASeY4o93tBIam1txozGB0TPLkTk0NtpobfvAbR9Fdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741774403; c=relaxed/relaxed;
	bh=wwQP93Q/BVImMWEeBCM6Wdp9Gy5hvS++O25BvsMytIg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b01Xpx0KUA6wurPO5l7mIh8173uQR93pKuTWFNSBH6aRLDOlZdk7UTUQEe9WQaPEwsUBf/0LltgWs13+en38SGhzAaIqOuCnJUI/4qtVZik2G6v0xl7YpBjyA6Y5h02yQygFLweILYJhscRoKQ7bsXaFD+G0alc/V/36J88lrSTMU/eR1WjAjHzU6xhghAIuThrzNp7x4nNSHsOkJrF3naFw/3RSZHKEyWuAt9FQ6dfP540nBDZDqj1QG5FjzCUGEW3Zj/bJyXt5B6TwJfJ5yPcuflQxYZFQObaBFsJGwHCQ3eSN1WFGCaDRy8GBCWWtAybxS+uG59FuiRQLCreteQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FXNEM0+m; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FXNEM0+m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZCRKY5SVnz3fnD
	for <openbmc@lists.ozlabs.org>; Wed, 12 Mar 2025 21:13:21 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-224191d92e4so113672015ad.3
        for <openbmc@lists.ozlabs.org>; Wed, 12 Mar 2025 03:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741774399; x=1742379199; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwQP93Q/BVImMWEeBCM6Wdp9Gy5hvS++O25BvsMytIg=;
        b=FXNEM0+msqGGFw0/o5uw1LqH2Mt3ROq80nJdIwplgbxlrQ4R5wmGuxj5AJooKdx7lW
         TqTUjf7cixl6iwZhrXGXrgmezGXheLln6wh8pXNgDe4DDuIj5AwyKGmMbwIild/Fu5ix
         HIaOSOtUut3bnC1RAV8rgSRzQENYRTZq/oN89Ee2GbVE+HZg82Q8UcK6JigDip9vqZA+
         k6eW7GEy141eIZPPwJQzDS2o58zQL9RGYElN4qWfboQyKMUwvZGRC3LdvSvQFvuPogc4
         VkXi6pCkvSOonfLJHoxY2SmTdAGlYG9hEUBrG/a/fomXxgVQ9wnXfky9EDugpYFVvK+Q
         7BSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741774399; x=1742379199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wwQP93Q/BVImMWEeBCM6Wdp9Gy5hvS++O25BvsMytIg=;
        b=LMPAiaS5N/SBzm4Kj8nrG2u76tsYv9z+95EFnHuT1roZ+jeQtYk7AJyS7q8rH8ypS2
         yNV5LIqT/EQ6/P9h190kgB/Elj4hYrM84LgSUiSVcKMlAlPRiqvGK+8707xGLGL20OSJ
         EXk/IhU3Ij4gXmZppxevA/hwV/fPUL36TMk0CPu7stCMSCRfuYhAErP2frD1oLOTUPXW
         icmCb0EpUbzrgmtF6b9u/f0yUDMK/P5WDtzDeeXLePm5vBEbKtsEFAKouIvRQEc5r1c1
         SKlq+bns1HVwl7YNdlvc7m3hMMi0SULDSy5FLDGLNtVVPA5nxAAPQaPbnEKH3sLapa/0
         A//A==
X-Gm-Message-State: AOJu0YzYFrEmwibeGHDmjHC8gLrlSd8cvPCPi20Lp0EVFMag3E0HiZ0J
	BKMw7vf3/huxVyITHpT6rA1FlJO7iSlF+428EdUUQkhnYNAg3oVV8S3bzg==
X-Gm-Gg: ASbGnct7X2CoYgJLSrQ5l/e9XLtrcR4MMNG9bbHN6dhfl89h1mTHWKJlO7zp1pAma5i
	OOK0a7FOsf4TTXY1FTXsYZihFcXIHb19Re1Z8aqh5Aa0ZcHGfUA/DJiQZB3tE2c88xAXN1/8KIh
	C47QaHVR/Amr9oJoWCW1+fvnTwrZWU+4gDsehs76fQ9D0IVtzQB/kOIThWWBGntW3aUvxr0uXqM
	18EZtw4f13Ip/6AjcqX5AmWmY04HhrOboeJEtc+sgZeVZdyPrUQm4rC6HjafQhDIixCQfJsTnNl
	arBfLO2jhicLEK1TWXfUdFlq7OFcmnYRAkVyj1DlG9OLH9oIvrZ8/PT8YcokVWOXPX44sNhVbgS
	ihixC9ULEIFM6Kz3FSiOs6+1C1eD8e/3WKS6VeE5H2l/JOpj5kmJk3drs8F8pxH17
X-Google-Smtp-Source: AGHT+IEh/xdSOIVbYeJplkNXDkEWi0W/4mSDEeATuUNTmmLQboBNtLdVMd+BT2u0Oj5pxXSs8AO8ww==
X-Received: by 2002:a17:902:e845:b0:225:ac99:ae08 with SMTP id d9443c01a7336-225ac99c05bmr22298235ad.5.1741774399099;
        Wed, 12 Mar 2025 03:13:19 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e35c-4352-93e5-842e-726b-dd46.emome-ip6.hinet.net. [2001:b400:e35c:4352:93e5:842e:726b:dd46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109dd5edsm112595815ad.37.2025.03.12.03.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:13:18 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Subject: [linux,dev-6.6 3/4] ARM: dts: aspeed: Harma: Modify GPIO line name
Date: Wed, 12 Mar 2025 18:12:49 +0800
Message-Id: <20250312101250.3238182-4-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250312101250.3238182-1-peteryin.openbmc@gmail.com>
References: <20250312101250.3238182-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,WEIRD_QUOTING autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Add:
"reset-cause-platrst", "cpu0-err-alert", "leakage-detect-alert",
"presence-post-card", "ac-power-button", "P0_I3C_APML_ALERT_L",
"irq-uv-detect-alert", "irq-hsc-alert", "cpu0-prochot-alert",
"cpu0-thermtrip-alert", "reset-cause-pcie", "pvdd11-ocp-alert"

Rename:
"power-cpu-good" to "host0-ready",
"host-ready-n" to "post-end-n

link lore:https://lore.kernel.org/all/20240412091600.2534693-13-peteryin.openbmc@gmail.com/

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 38 ++++++++++++++-----
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 7331b501c30a..92068c65eae4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -393,6 +393,12 @@ gpio@31 {
 		reg = <0x31>;
 		gpio-controller;
 		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"","","","",
+		"","","presence-cmm","",
+		"","","","",
+		"","","","";
 	};
 
 	// PTTV FRU
@@ -559,7 +565,8 @@ &gpio0 {
 	/*A0-A7*/	"","","","","","","","",
 	/*B0-B7*/	"","","","",
 			"bmc-spi-mux-select-0","led-identify","","",
-	/*C0-C7*/	"","","","","","","","",
+	/*C0-C7*/	"reset-cause-platrst","","","","",
+			"cpu0-err-alert","","",
 	/*D0-D7*/	"","","sol-uart-select","","","","","",
 	/*E0-E7*/	"","","","","","","","",
 	/*F0-F7*/	"","","","","","","","",
@@ -568,7 +575,8 @@ &gpio0 {
 	/*I0-I7*/	"","","","","","","","",
 	/*J0-J7*/	"","","","","","","","",
 	/*K0-K7*/	"","","","","","","","",
-	/*L0-L7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","",
+			"leakage-detect-alert","","","",
 	/*M0-M7*/	"","","","","","","","",
 	/*N0-N7*/	"led-postcode-0","led-postcode-1",
 			"led-postcode-2","led-postcode-3",
@@ -588,7 +596,16 @@ &gpio0 {
 	/*W0-W7*/	"","","","","","","","",
 	/*X0-X7*/	"","","","","","","","",
 	/*Y0-Y7*/	"","","","","","","","",
-	/*Z0-Z7*/	"","","","","","","","";
+	/*Z0-Z7*/	"","","","","","","presence-post-card","";
+};
+
+&gpio1 {
+	gpio-line-names =
+	/*18A0-18A7*/ "ac-power-button","","","","","","","",
+	/*18B0-18B7*/ "","","","","","","","",
+	/*18C0-18C7*/ "","","","","","","","",
+	/*18D0-18D7*/ "","","","","","","","",
+	/*18E0-18E3*/ "","","","","","","","";
 };
 
 &sgpiom0 {
@@ -636,10 +653,10 @@ &sgpiom0 {
 	"","reset-control-cpu0-p1-mux",
 	"","reset-control-e1s-mux",
 	"power-host-good","reset-control-mb-mux",
-	"power-cpu-good","reset-control-smb-e1s-0",
+	"host0-ready","reset-control-smb-e1s-0",
 	/*E0-E3 line 64-71*/
 	"","reset-control-smb-e1s-1",
-	"host-ready-n","reset-control-srst",
+	"post-end-n","reset-control-srst",
 	"presence-e1s-0","reset-control-usb-hub",
 	"","reset-control",
 	/*E4-E7 line 72-79*/
@@ -690,13 +707,16 @@ &sgpiom0 {
 	"SLOT_ID_BCB_2","",
 	"SLOT_ID_BCB_3","",
 	/*K0-K3 line 160-167*/
-	"","","","","","","","",
+	"","","","","","","P0_I3C_APML_ALERT_L","",
 	/*K4-K7 line 168-175*/
-	"","","","","","","","",
+	"","","","","","","irq-uv-detect-alert","",
 	/*L0-L3 line 176-183*/
-	"","","","","","","","",
+	"irq-hsc-alert","",
+	"cpu0-prochot-alert","",
+	"cpu0-thermtrip-alert","",
+	"reset-cause-pcie","",
 	/*L4-L7 line 184-191*/
-	"","","","","","","","",
+	"pvdd11-ocp-alert","","","","","","","",
 	/*M0-M3 line 192-199*/
 	"","","","","","","","",
 	/*M4-M7 line 200-207*/
-- 
2.25.1

