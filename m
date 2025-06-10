Return-Path: <openbmc+bounces-153-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 521D2AD3994
	for <lists+openbmc@lfdr.de>; Tue, 10 Jun 2025 15:41:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGqgP47H5z3bs2;
	Tue, 10 Jun 2025 23:40:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749562849;
	cv=none; b=lJ8lPpLEXPlV17eYGwhN/o8DhFqSEwUEKw863NdJ79LPoEw3z2iLYC4iU3iDBGfb/RldqUFUojs7YWvU3N+DQUdKYEN0XqZY7vRuoZO0GTSmPoJNkU7HfWXMTVFlzby7gzz/D96pwpUThECe+uffUHa7DVnDnRXPkxOaLtdB7TYjO/vknc0BnqgAZ0SS3sbhaiyFSoUkZCfH7nLbgjYCrS2T5VOFPp5+aUgntleWBmXJP7Zj/pg0AqqwHSghgrItwQ4OvE5Phcrap/JhaS7ZoRTb7gpaU3JooEeIvkD+7iIuknCXLG2lHzhBoYReaLPumGaG/9paZnWPQiR72We5xw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749562849; c=relaxed/relaxed;
	bh=mWoFCXxdyA7c9L+6Q53w3jQls4vDgCKDSDiBC3/wteA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jTXUVY177A22KNdLZtURvbLXfymr1AmCxJoO1A/ERkkAogumEN5EpwXGAKq4mQCSWVEovgtv1NXkB5NuK5p9FHtd6RGUiJ8VksC4XhUy/60G4lLECyK4q3gATMzvkbS5aSMlcGVOw04rP39HGTEozs1SEJOSGgIKNr8wWA/O6cGD2BM7a8q7EUIrLYTSnO+bwAhgGS7BKm1Y/Qd6PmRkO29DDkxxHibM173hsQca4chUsspjR5KyoGdy0zONZEu0rTCnO0x8ONU4QRdtFBN2WU7LIaGSb5bHtY6G4XP9cMz0ObHFRVtPozANm88PRk0xf9J6xc2Q+H4Cdrxa3YWXtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BnuNKstN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BnuNKstN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGqgN3lswz3bpL
	for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 23:40:48 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so4085019b3a.1
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 06:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749562847; x=1750167647; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWoFCXxdyA7c9L+6Q53w3jQls4vDgCKDSDiBC3/wteA=;
        b=BnuNKstNyKzFJPVk7NXOPDXk7VP5cGgsaRoFXtBV/HBBfEvr0P8YwYaKKTdib/nFym
         T6tqTv0XASem/8t74tTtO2WmvGpYta+1PpwruZk47iBkEEZYf8YtGRPWuQuulXr4w0T3
         RkdPkrIIqUJ8jH0/tUEFGZv5wr9jz7Pl5IbAmps07JibmsS2RWD6hWXkgZB0PGXr7oej
         /1SHVDApm+ZafH6pSWjaKtC7D0OehnbhLqZ/OLVQnT2ERSeVkOUQYK8vkEX9E3PnsQoF
         Fq7miOTu1ALxi7aeEP5JQhgpSVukA0+CHPIbFCIav5e8bhy3bhh3amhCKTjTn/U/TXRD
         NBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749562847; x=1750167647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mWoFCXxdyA7c9L+6Q53w3jQls4vDgCKDSDiBC3/wteA=;
        b=TWwdPwy2yc9njuPSv6QOq197sdXQSrPkpoVittL4fU235abkgbM/MVM782Qpcpkub4
         ae49Rvn3TbYlpN14rZtaAX6wAUGvi8/nlQSozegxSTzTQ47kDvDnl1ymsNUWdYTP5uwG
         9qLCxvJpJWaNYpPrh1ehL38RRjF7kOLFrLhKctntDCgOssme9MpsBMmc5pTYX1Kgjleu
         0Tr7m5prihTdW4al0J/62jM4RhFieVqhzkANPz2FZWgrPOfWTZ2HZOPvK/lA99iKKIRh
         /D5GsokAjAe9kR6LVkcdrGQatRuXyTgbDzjGiACNCA2vj61mRxIqAyW/+VOg/1sykqsg
         cwZg==
X-Forwarded-Encrypted: i=1; AJvYcCVyOq/w5tp5gYwBhAAVTdq8Isxxuk7RVm0xGyB8k1VRgNujJaeI/IJr0wCyYK76oU52Sqx70aKd@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw3J68VNwN0j0+dSmDk/XGoOQ15X4+OW9VkD5BN6fnz0KLeyrpM
	01H/glJQ6jALPucU/kDTqNsY+HHiuR2DKyi/VNvDmtSAVqFAsXxY7I5R
X-Gm-Gg: ASbGnct8PFiz4ed/A3fIHPrsFbUBzTa9UVd/rKUATQcjaBRRmNBdvddBLzemWINaTf9
	Ct1BtRMiDInyHrog9uwbCapUgVKqH3m+Oiyf7AqNBClxQM3nOwPirURD/gCQkIJK0gftVgIje/9
	jFhAC1Tyxms+ydV7lRsr+X8JXQ79TAdpfxiWFhpOrfv3sNf5DUY3Ws+SSnf4CVNFl8HJXouZ1UL
	ugR0ivQne6ceewjvAeo6qZnXFbi/ni4NiES2ZR4EJsWyCOQGrARKn1c2vgiKlnJxNJ+r+DTXuEX
	CcDWkH5naE4IQPb56BlNJcWF8NwTgSmRAWTMvW40L7Pm9AvdVZr7TNaHp4XPcRKcVCj3cTFpoL0
	ke1cXuEm1/WlzgS7S6JICXQrgCLKfDj0CMBn+ldRfKxkV
X-Google-Smtp-Source: AGHT+IGhws8NBY0Agkx9p4pEUZSMwyawAyEsisGxde5dMucNr8FFbtcloKezoCNrle/ZT+hqJ5ho4Q==
X-Received: by 2002:a05:6a00:2a0e:b0:748:6a12:1b47 with SMTP id d2e1a72fcca58-7486a121c07mr958876b3a.10.1749562846820;
        Tue, 10 Jun 2025 06:40:46 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0842c0sm7401955b3a.73.2025.06.10.06.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:40:45 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [dev-6.6 v2 5/5] ARM: dts: aspeed: Harma: revise sgpio line name
Date: Tue, 10 Jun 2025 21:38:30 +0800
Message-Id: <20250610133830.2704829-6-peteryin.openbmc@gmail.com>
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

power-card-enable
power-fault-n
power-hsc-good
power-chassis-good

asic0-card-type-detection0-n
asic0-card-type-detection1-n
asic0-card-type-detection2-n
presence-cmm

uart-switch-button
uart-switch-lsb
uart-switch-msb

reset-control-cmos-clear

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
Link: https://patch.msgid.link/20240909080459.3457853-3-peteryin.openbmc@gmail.com
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
(cherry picked from commit cb3f397b17bbda3f2998eff9e54b040c8fa85cc9)
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 36 +++++++++----------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 92068c65eae4..9cb511a846e3 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -393,12 +393,6 @@ gpio@31 {
 		reg = <0x31>;
 		gpio-controller;
 		#gpio-cells = <2>;
-
-		gpio-line-names =
-		"","","","",
-		"","","presence-cmm","",
-		"","","","",
-		"","","","";
 	};
 
 	// PTTV FRU
@@ -422,12 +416,6 @@ gpio@31 {
 		reg = <0x31>;
 		gpio-controller;
 		#gpio-cells = <2>;
-
-		gpio-line-names =
-		"","","","",
-		"","","presence-cmm","",
-		"","","","",
-		"","","","";
 	};
 
 	// Aegis FRU
@@ -566,7 +554,7 @@ &gpio0 {
 	/*B0-B7*/	"","","","",
 			"bmc-spi-mux-select-0","led-identify","","",
 	/*C0-C7*/	"reset-cause-platrst","","","","",
-			"cpu0-err-alert","","",
+			"power-hsc-good","power-chassis-good","",
 	/*D0-D7*/	"","","sol-uart-select","","","","","",
 	/*E0-E7*/	"","","","","","","","",
 	/*F0-F7*/	"","","","","","","","",
@@ -585,14 +573,16 @@ &gpio0 {
 	/*O0-O7*/	"","","","","","","","",
 	/*P0-P7*/	"power-button","power-host-control",
 			"reset-button","","led-power","","","",
-	/*Q0-Q7*/	"","","","","","power-chassis-control","","",
+	/*Q0-Q7*/
+			"","","","",
+			"","power-chassis-control","","uart-switch-button",
 	/*R0-R7*/	"","","","","","","","",
 	/*S0-S7*/	"","","","","","","","",
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","led-identify-gate","",
 	/*V0-V7*/	"","","","",
 			"rtc-battery-voltage-read-enable","",
-			"power-chassis-good","",
+			"","",
 	/*W0-W7*/	"","","","","","","","",
 	/*X0-X7*/	"","","","","","","","",
 	/*Y0-Y7*/	"","","","","","","","",
@@ -673,7 +663,7 @@ &sgpiom0 {
 	"presence-asic-modules-0","rt-cpu0-p1-force-enable",
 	"presence-asic-modules-1","bios-debug-msg-disable",
 	"","uart-control-buffer-select",
-	"","ac-control-n",
+	"presence-cmm","ac-control-n",
 	/*G0-G3 line 96-103*/
 	"FM_CPU_CORETYPE2","",
 	"FM_CPU_CORETYPE1","",
@@ -685,7 +675,7 @@ &sgpiom0 {
 	"FM_BOARD_REV_ID2","",
 	"FM_BOARD_REV_ID1","",
 	/*H0-H3 line 112-119*/
-	"FM_BOARD_REV_ID0","",
+	"FM_BOARD_REV_ID0","reset-control-cmos-clear",
 	"","","","","","",
 	/*H4-H7 line 120-127*/
 	"","",
@@ -700,7 +690,7 @@ &sgpiom0 {
 	/*I4-I7 line 136-143*/
 	"","","","","","","","",
 	/*J0-J3 line 144-151*/
-	"","","","","","","","",
+	"","","power-card-enable","","","","","",
 	/*J4-J7 line 152-159*/
 	"SLOT_ID_BCB_0","",
 	"SLOT_ID_BCB_1","",
@@ -716,9 +706,15 @@ &sgpiom0 {
 	"cpu0-thermtrip-alert","",
 	"reset-cause-pcie","",
 	/*L4-L7 line 184-191*/
-	"pvdd11-ocp-alert","","","","","","","",
+	"pvdd11-ocp-alert","",
+	"power-fault-n","",
+	"asic0-card-type-detection0-n","",
+	"asic0-card-type-detection1-n","",
 	/*M0-M3 line 192-199*/
-	"","","","","","","","",
+	"asic0-card-type-detection2-n","",
+	"uart-switch-lsb","",
+	"uart-switch-msb","",
+	"","",
 	/*M4-M7 line 200-207*/
 	"","","","","","","","",
 	/*N0-N3 line 208-215*/
-- 
2.43.0


