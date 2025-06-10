Return-Path: <openbmc+bounces-152-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B412DAD3990
	for <lists+openbmc@lfdr.de>; Tue, 10 Jun 2025 15:41:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGqgL39Zkz3brR;
	Tue, 10 Jun 2025 23:40:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749562846;
	cv=none; b=MfVnuNO1tSG3uWvlPu6mBIMBPyApfcV6QKC3NuO7l5wjSw1pJKwQ04d0ecZmV4T1BVkaAFnNjs2/lh6GFyU2HK0lIfWig6vBtsK1h0YdOPrOlb7XQk89EcPPm5OzZAMpcGjg2oPMdyEhhkYflXzm+xpo0iZC7MtZCMVsVq26FSphZFhz7aXYoWZLdgD/S0XKLutFGVvUhU/N3G7loykgFWpi/+zWVw/D3HuuMx1utXlP01svXUKKfXMEfrIWU2sNlt9Qxc8lRHA9RUFYZnj/PO4XTr8IzS8X2abPdn+D9PyqXAUmz8umWr7nzc9EP0wz1DECgQBJHSZBltB/ykGLlg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749562846; c=relaxed/relaxed;
	bh=Qm3GaFaCBRhvOWVsS+JDdif1LBS7uuVIGfKCM4AOn/A=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UGpApYMdlDO4yYz7zPf/FUQJBzzfqGdABznXhD8Yt1wk33zpSm1gRfJWV1WQp1VCP/gF/bEEUN57BRJ7mxMX9ep+4/jNegBUgOywGlLCwQJ3ttsOK+NHf9cnnxbpZ25UNCZH7ZRdW4EANcmvXUBi6wCOh1G7TXbZHf+810qzCbK5y4A30kw2b0mA4uNM9Dz7sbP7cy8fQDFNQ6pi4VAcZR7MgYhGVZDfdhclOMrY+hDl39msDO1VLgDntBRFc2X+JIys1PqF7FUR/U9CuC4eWu3Y6iJVMafRCT+bVLZYm0nQaQSciIXs1EOv64H6GKjXDIZY17r3zErAxAO/jK8rGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dacKX0Hj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dacKX0Hj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGqgK55k3z3bpL
	for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 23:40:45 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-745fe311741so6000331b3a.0
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 06:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749562844; x=1750167644; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qm3GaFaCBRhvOWVsS+JDdif1LBS7uuVIGfKCM4AOn/A=;
        b=dacKX0HjTruh8jU/bgtmGGzvTMGy0tGynHQCqM8qv2m3/rKiPeZUeJKAT0opL2aCBQ
         MOjFA2aYHSLOWOD+JYBJje8dnzaRxdV6XZqDKQPfK6GMqW4EvMqRcaZskEGBVCIzyBJi
         LTtq9RISkYmEPyuaQtW1fKVEoVEAWq0x5XWgOZZqMwkK1z1Kqn5keVYu0/4y2m6rAu82
         +BnpJ7WhdoFtA4PD/jP1tm4zaQTCVp8NGCrRXvuuxp9gsbIf1lP0fgeLJQrAfG6jihKA
         1rhKWTPFLFD0W0q2IEk3H3CUKF0Jx+4A4a7XmxdZk1zxEooGPbZcgqTg0bSK3ymDlOra
         jwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749562844; x=1750167644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qm3GaFaCBRhvOWVsS+JDdif1LBS7uuVIGfKCM4AOn/A=;
        b=DN3N/lw+z5GR/QKEQ5sPWCH1NBfLGs+Ah2qF3W3/CdilReTeJD6b+CKYTPr02H5I74
         Zi2zs1ExfkKXIFTGDp6pfwX9NSjLN1zfgtjdV7RJywqM14O317Eh2s8VT1qOoS+F8b89
         qOR3dyCcJY+i+EowpQ0SC3YRjGdjFsmSwMsOlK4/HvabtE8tTtsByrZvtwzIh6sLO5CY
         Vw/YlPh2SW05SDwbz1e/uqj1LzDzdVeUTmy4vsBPhYARyC03lkTXDqLbcJvApKzGJ1vR
         Z9xb2O06ekYTB0hCiDW1EKZBtG24d8+S7uU2dzFnZ4aFYftTcja4k+jEL2Umeuzx8mAY
         evnw==
X-Forwarded-Encrypted: i=1; AJvYcCWXBv0+48wARPfZASznNYEZK8W2vdshXvrEiCAydaznAkrGuxXGf9bLlEYf9/vHlUAPU3doH/L6@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyq9OMAHJbfGZonQzA+vJv9QNm0ICTKT6T0nIE/7efKMAZqPxav
	Y3cufeOSe7pKKrQZsW/MB5nyo9R4Z09GddKy3SXPs4Z8aufnPcXljqJQG3H2rg==
X-Gm-Gg: ASbGncvqooWmVF0Y5Q7tJ2QiI1GyaGDGuKqxzxa5MnQVM2iFrSE2YR8B6EToc9pvu09
	fAbuU5/UnJvIBVMo+nUHX+gDbUiRuGOQ2OwxfzTD1jkknt5tS2T9AfkGJZ5qXxzi7pEZ5bomklD
	cnFL+BxJ8ibwficXKnmDKQRc0gQyVn9FjuUskFFbc1geu0TpEBJu54iMy1uhMjfNa9a5qBHHBJ9
	K0SYIiZnLuELp8U6DfzDvdl5m8AmvSUmmWi0xCK6LhFYVIHohaECmUlDpPzyb6uIHLKCVsYp2FV
	5UCZJQR12xjcT36r+pWfnoGxoobyLwcW4td2tFQoSp1bw7p2m+fPYMCQdvNg/oef4WKwD6abJib
	pl/tA5JtLG75b6TX4bTsmYphLBAAgN1wVTo42BxO+WngX
X-Google-Smtp-Source: AGHT+IGxfkxZ6nOkTKOB0myygC+MgvP7KZxEPajn0VwDO5G6oTZcUvWGYF5Jvx0PYucaEEQpNvi10Q==
X-Received: by 2002:a05:6a00:21c9:b0:742:b3a6:db09 with SMTP id d2e1a72fcca58-748618bb478mr3455532b3a.16.1749562843784;
        Tue, 10 Jun 2025 06:40:43 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0842c0sm7401955b3a.73.2025.06.10.06.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:40:43 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [dev-6.6 v2 4/5] ARM: dts: aspeed: Harma: Modify GPIO line name
Date: Tue, 10 Jun 2025 21:38:29 +0800
Message-Id: <20250610133830.2704829-5-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250610133830.2704829-1-peteryin.openbmc@gmail.com>
References: <20250610133830.2704829-1-peteryin.openbmc@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,WEIRD_QUOTING autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add:
"reset-cause-platrst", "cpu0-err-alert", "leakage-detect-alert",
"presence-post-card", "ac-power-button", "P0_I3C_APML_ALERT_L",
"irq-uv-detect-alert", "irq-hsc-alert", "cpu0-prochot-alert",
"cpu0-thermtrip-alert", "reset-cause-pcie", "pvdd11-ocp-alert"

Rename:
"power-cpu-good" to "host0-ready",
"host-ready-n" to "post-end-n

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
Link: https://lore.kernel.org/r/20240412091600.2534693-13-peteryin.openbmc@gmail.com
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
(cherry picked from commit 4424cd4db6c8f2cb2d965b6b0e20fd99653acc72)
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
2.43.0


