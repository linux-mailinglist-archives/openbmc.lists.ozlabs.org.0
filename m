Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A97A5DA44
	for <lists+openbmc@lfdr.de>; Wed, 12 Mar 2025 11:14:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZCRKl2f2Zz3g8l
	for <lists+openbmc@lfdr.de>; Wed, 12 Mar 2025 21:13:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741774407;
	cv=none; b=SkSNFXYhMhCATRHnJM759+0G3yFoLWe3WeV0GsRk3zYtMDvp8dQbsF0MLiEYWFVgj0MlwfSpcoiPNDVk5M3Lb8usNEQ2yAGOnXenJJvaEQIv5/PZauxRXpvqxGA+Sq0Hp1bJQyWWLDxMAIqgRj/hjYmKpTUI4XKPMg06CxvFNKzXdnSfU9xO7nyMIr0SRIKQ9PRlqUzcwkppiS60yr0d9DX9xB5hVCgiT2uREUV0elEKwkies0YUVgxXi7C6LxjSVxn/NyD+WHlsqfmT/+WFGOuiQEhTYdVgz+MqjN7NcO/aJ3FcO655Vu/3HMwKl+qcdUjp2gOc3CamoYrdjpOz7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741774407; c=relaxed/relaxed;
	bh=no2GPhrLomQNdxDyBKp2kSb6KXlqLaEdujKWhWxSGtQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WU2f8N+Pr6+mqBpnAYkxRFKvQQbPVNYVyN992gy7T8PhkkB7lFO77OSqemUFNpgIxul9GV85LfTiDyPJqmXcWZO+6QsvES3wwMuIgjk94b4XZZmVbvvGta7bPZ+GUjURydiKnUaHbE4U56XuqGggkR6d3baRr1rgEq+Ayw4BR2n/26K0EsHE67rDJk+buL8V039/+AAEU8zlwsQZuLk2FdTksR45xVrWgAREBnEeOe2PL5THOupJteMdeACpdOeR0mHrlgrEoMAkuecXCEhxDJhisbyCszEj2e8ewpLwCC4ZY+eMH0ANRzvul6TUdI8L1lmo1I5d1rlf3pB7SAeRBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R1IuM9x6; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R1IuM9x6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZCRKd6cDsz3fvZ
	for <openbmc@lists.ozlabs.org>; Wed, 12 Mar 2025 21:13:25 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2239c066347so115527715ad.2
        for <openbmc@lists.ozlabs.org>; Wed, 12 Mar 2025 03:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741774404; x=1742379204; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=no2GPhrLomQNdxDyBKp2kSb6KXlqLaEdujKWhWxSGtQ=;
        b=R1IuM9x69q2pzvJEP8D+gNcMFFtDaFvCe7T7XqBzw+ZBTvk8srC0yd07HOCH3R7f92
         43wWQbEazfSA9IN7Efy5Ffso68FDd87dEPXkk9RBwnaGmfpYM6LBUIIF2ScM8s0kWxoE
         oL420NC0eNjl+9mOv2JpUZbcJePyQ29YNCJWTQcJnypiyZG0E7FQVVg9hiy15KZFvkAB
         mNFgob1b9Gv7RSZQEHVzfYl+SAauVPvxIY36Ap8JEywvUQ8Vee+jWsehFKrNybWj+vmN
         /i6Ea8rUM76Q3MAeiQJlm/+9Q1FvUiFRV5ymDfwDFtvrL/OL5tvwVma+wqdiqQeGJHNi
         qKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741774404; x=1742379204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=no2GPhrLomQNdxDyBKp2kSb6KXlqLaEdujKWhWxSGtQ=;
        b=ukcj5n5dWqOPPm7s8gcSeaaH7X7F9U5BZnA5TA1JQJ5M0LMrXa9poO3gwpcafTLM2F
         7RVX8PYb4xJOvVGt3KEnGo7ymwGJst+chHGEjyFmPsTk5vZdgseV/U6ty0zb+SoHlkKL
         eDvggXIB3THvGfUIm+vrvOv3Ci0mfo2uLpsk/sLQP2vblkfy1Dt9pf3/4b98NhLonRBh
         bl/6ILsdqEw+NWZkXq8004ww13z8EYxKqqO+AJKr8VmfQBw4IIGkzdm6Lq6b5QVtpFT0
         nu9fUENuikoGxaZWujqyfj+RJ+deRQ3oaVOIzs0ewoAwVvJhbE4gbaIt4Mcs3f4A59O7
         zIcg==
X-Gm-Message-State: AOJu0YzMEiZ6/IrAW9nXLWtagWEUos/ShHDtWSCYtawJkUJJTMWRjGP/
	FbjOMteM7TRW2IQaQKtu8gjIKvwvvOqTEzk2VCHY6gmvrFxgvZluaNiKig==
X-Gm-Gg: ASbGnct6WqTEDGWlH5OegTRPkjJQ9/hCEmMREkViv6XzvQpIfMZoehsVuw9RItk+XXk
	cdQ5nfT0fROgXV2JVSA4naxuHakCtYLWmFgaq877qF1fo3WBKIhHNUcjvqRNC37L82RgLzSILrG
	Hkx4kGbQAfjRwg7fVpDhj331XiXTE0s/7aMkVw72w380ie4YPAuNp2e75xF0uShfmuVfLmwMiPF
	jbpGSgPLaCB8aj7J1JL+UDQO6g90IhhaifE87+gXhlVRdqkleK8O04aLnfT4LsgnbksGI9RZOoE
	zeC4JKthMBSb1kJ1PnYD8olqPRSy16JwO5tBY+iqUH5cTEyK6+wjynvMRXe9idYNVEI3O8/Y/B3
	KcumCVwZdTIZs9ftxNzxag2BGE/TFriaAmW414am4O2G0J4XRA0zOB8ugbW26mJAJ
X-Google-Smtp-Source: AGHT+IGnpHLRFzMh4YJSt+7xdSh2Es0Qx+YvY6o347JSOrB2uoWgGIiXRYCIAc9X2hsWY8uHUqmsDQ==
X-Received: by 2002:a17:902:e80f:b0:215:8809:b3b7 with SMTP id d9443c01a7336-2242888068emr252860305ad.7.1741774403906;
        Wed, 12 Mar 2025 03:13:23 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e35c-4352-93e5-842e-726b-dd46.emome-ip6.hinet.net. [2001:b400:e35c:4352:93e5:842e:726b:dd46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109dd5edsm112595815ad.37.2025.03.12.03.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:13:23 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Subject: [linux,dev-6.6 4/4] ARM: dts: aspeed: Harma: update sgpio line name
Date: Wed, 12 Mar 2025 18:12:50 +0800
Message-Id: <20250312101250.3238182-5-peteryin.openbmc@gmail.com>
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

lore:https://lore.kernel.org/all/20240909080459.3457853-3-peteryin.openbmc@gmail.com/

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
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
2.25.1

