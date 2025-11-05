Return-Path: <openbmc+bounces-840-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FB2C33749
	for <lists+openbmc@lfdr.de>; Wed, 05 Nov 2025 01:18:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1QsY3K85z2yjq;
	Wed,  5 Nov 2025 11:18:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762301921;
	cv=none; b=XLSpLe/LYC1Vp80jeZ9rXpNigQusFylNQjWJzqlGBA6hmvp8EEEuw9dG+MmvmRz8axql8IYOcH7Axh5ddfo0MTc9t3gHd8TbOAFz9jmy/AROgx8IXeIwMS9lKB/l2gKJ//Wnaab0ycdrebDRYRBE68u26IitRBIGohhPt6IUtsMaaQm4umY+Dj/zdvN/+n4mRWyj9nAeGgJvHWiZB2eM8wUZX0lY0cpVoSk1bF90ErpefJfJdSn2XVLAhQgE6widWaMxy4NTjKGrjJcwvVD4yTvLcwAQId2eMmbKqzcFKUP8vmNh0Rrs3+8qryRlqDSz7caSF8PMy/taX9rT3cMnSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762301921; c=relaxed/relaxed;
	bh=YxT7uo4WpVhPRh5y08W+tvrInEmcsLSj28FKI/1TLFo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P/IXLR+ezS15Gaba5QyyY81AB+FviS9DeL1WrQxmhvGzwx9zLLc63INzUcFcfpcAvQkpWPkSLq/3g/TULrTWjUiT+uU0IO7sdAeq/1+cdK2iNbXtTMBvrXrgXeCrH4XGaCwlZ/KT94lNEDutmipZVAIZS0nrf0ox67Rhrd9Rb/xwtc0+9twpGOIGLmWz+H1LZBmXZJ6UwKfp2yQqvKV8/DtMDVP/E+UAbr067+dsAdLrQF4HKGwJLXuN7esi4szvcoCPtJTX6cA+jtW4HrAZCRRrtUP3ReEag6gFi7v3Uq8lN/rKEDi0POJb3ePxNAGNCszgsIaJQKHn1f+avWwZ8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ODs6oSJh; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ODs6oSJh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1QsW5SBLz2yjp
	for <openbmc@lists.ozlabs.org>; Wed,  5 Nov 2025 11:18:38 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-28a5b8b12a1so65709405ad.0
        for <openbmc@lists.ozlabs.org>; Tue, 04 Nov 2025 16:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762301916; x=1762906716; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YxT7uo4WpVhPRh5y08W+tvrInEmcsLSj28FKI/1TLFo=;
        b=ODs6oSJhg+f7NUoRlvMNJVbiAk0zmEoo6p2xq4x7hLyeSSeGsXevMRCX6tQmmir+jX
         O/tqs8siTuViNcXxlwgWrfeQPKxt4U+FCGSsFXa1CfgINqmoi7hYhAIHpcWmVmg0H5WS
         AxmjgueNs8FegvliWktUIZCoyvHtdoEmaJp1+Koiij0tuX4LOzzHlbJH9gRo6FRFQKKF
         6BnhnanJxtOvwmNr34FN2cD8t/odWpHknEe5S1GVgYD8dc+ONF7wDp3E69INYUiPGmoH
         K2HAY/NSOEyzp5NDTjwJ9aee3ZlL6W3Swwer/JMvq7swXrg9RMPuWRuVVwPFN/0ZQCHg
         bOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762301916; x=1762906716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YxT7uo4WpVhPRh5y08W+tvrInEmcsLSj28FKI/1TLFo=;
        b=obXUmOXOHKSYEtfqoWEf5FdZjBMcMTKBnY2UgAq5V7J3aT5vAmkM3dua3vjoKPLBZj
         gOfSEWU9QddjjvI7BadxcqCJ+bsQ3XSkP4LVYbwzldgNc25rR2/K/tuzw7ftJCMVpDgk
         uEEjTri4hgN7QLGGcyEfNoG+ajqEnFIGMWdlVMbWk4T3/CdcR/t7vrr5d4GDA5ADO1rK
         xN84j8thNFUpl+x8UJSUOo5DNo6lLN5ujdZEtab65Dsj98pzOaadv2NRVkNttHb3MXQZ
         skDsumrF+dTl1ZgXGxi/fqy9RlZXk6F8ZqnzwaWWxNkxlwDwd97GDtHka7oibHmpb4bb
         ZxsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU047Ji0iioskCSWKPte6CWvHy1sdq3MUQKAVx0gT1pO71H6h0Qf2fJFCfNTICREwe9D01ia71E@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw3RsRrYUlocff34ctur0ILnfb7RAPfyIXGh77nWNXH+awEYtlE
	E4gWeQiR9rUngmoXvxViLLB8wIClz2qZqrpX4Ixn2U5t43yV2qEDKI0I
X-Gm-Gg: ASbGncuqQM/teG+WPeZunX1d/YDSnvxxcfNPHFXRrD3l6NuRQpOmVzST8jeSur4mDmv
	srof5ZfAn5NA+H3wSITSEMcYCoycoUKzJ6AMlddkqxpaWVVvpXbcswzu5gqtuNeUG0mVS4fpvxy
	muMoJiM8Owb4csl64lUWYtubzdYLLslyEZGEyemK0ZzKIPN5Y7UUA4BikVMSugKaH1diseePw/P
	yKpP/Nm3YWdlu1idi6gyZ0/PtyqPOc6B7JfXCMXBtygT79Ob9X+POrndfd0Cu8ifeRPN8fSaMTg
	UElK2/DTuIjLg9HA36AHnLda6WEVIRXjNSwEpGlHAamd3SEs/GG5AhI4ilHBM9vd66AeoPQA3TQ
	oeFZva0AWeQhnFx05VAjV08Py8K7PyzXHCoErqzrRP69z2OHvc16oGDB2+Ocd1ZVhkSZrL+hamP
	4OZhHPYiNU9mu3doUxrROHQSYKTG4iGzXGbKAA+Dk/uwMBB6Z5D5YZ
X-Google-Smtp-Source: AGHT+IEfMKK/d8Ugs6NB6s0wg8G5VCoNuU9Mk43wJDaBnrbfEa5SDxsHhPErfW+oh7v1NYglbhcyRA==
X-Received: by 2002:a17:902:d543:b0:294:fc77:f021 with SMTP id d9443c01a7336-2962adb98ddmr20961085ad.49.1762301916337;
        Tue, 04 Nov 2025 16:18:36 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601998893sm40707155ad.40.2025.11.04.16.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 16:18:35 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
X-Google-Original-From: Potin Lai <potin.lai@quantatw.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	openbmc@lists.ozlabs.org,
	Patrick Williams <patrick@stwcx.xyz>
Cc: Potin Lai <potin.lai@quantatw.com>
Subject: [PATCH 1/1] Revert "ARM: dts: aspeed: catalina: add pdb cpld io expander"
Date: Wed,  5 Nov 2025 08:16:06 +0800
Message-Id: <20251105001606.1110649-1-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.31.1
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
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,WEIRD_QUOTING
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This reverts commit 252f39cc0de48040d36bef6a24f24db9116f11e9.

The reverted commit duplicated the PDB CPLD I/O expander
definitions, causing io_expander[9-14] gpio-line-names to be
defined twice. Removing it restores the correct configuration.

Signed-off-by: Potin Lai <potin.lai@quantatw.com>

---
 .../aspeed/aspeed-bmc-facebook-catalina.dts   | 71 -------------------
 1 file changed, 71 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 368ac95e87f0..14dd0ab64130 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -1220,74 +1220,3 @@ &io_expander14 {
 		"FAB_BMC_REV_ID2","FAB_BMC_REV_ID1",
 		"FAB_BMC_REV_ID0","";
 };
-
-&io_expander9 {
-	gpio-line-names =
-		"LEAK3_DETECT_R","LEAK1_DETECT_R",
-		"LEAK2_DETECT_R","LEAK0_DETECT_R",
-		"CHASSIS3_LEAK_Q_N_PLD","CHASSIS1_LEAK_Q_N_PLD",
-		"CHASSIS2_LEAK_Q_N_PLD","CHASSIS0_LEAK_Q_N_PLD",
-		"P12V_AUX_FAN_ALERT_PLD_N","P12V_AUX_FAN_OC_PLD_N",
-		"P12V_AUX_FAN_FAULT_PLD_N","LEAK_DETECT_RMC_N_R",
-		"RSVD_RMC_GPIO3_R","SMB_RJ45_FIO_TMP_ALERT",
-		"","";
-};
-
-&io_expander10 {
-	gpio-line-names =
-		"FM_P12V_NIC1_FLTB_R_N","FM_P3V3_NIC1_FAULT_R_N",
-		"OCP_V3_2_PWRBRK_FROM_HOST_ISO_PLD_N",
-		"P12V_AUX_NIC1_SENSE_ALERT_R_N",
-		"FM_P12V_NIC0_FLTB_R_N","FM_P3V3_NIC0_FAULT_R_N",
-		"OCP_SFF_PWRBRK_FROM_HOST_ISO_PLD_N",
-		"P12V_AUX_NIC0_SENSE_ALERT_R_N",
-		"P12V_AUX_PSU_SMB_ALERT_R_L","P12V_SCM_SENSE_ALERT_R_N",
-		"NODEB_PSU_SMB_ALERT_R_L","NODEA_PSU_SMB_ALERT_R_L",
-		"P52V_SENSE_ALERT_PLD_N","P48V_HS2_FAULT_N_PLD",
-		"P48V_HS1_FAULT_N_PLD","";
-};
-
-&io_expander11 {
-	gpio-line-names =
-		"FAN_7_PRESENT_N","FAN_6_PRESENT_N",
-		"FAN_5_PRESENT_N","FAN_4_PRESENT_N",
-		"FAN_3_PRESENT_N","FAN_2_PRESENT_N",
-		"FAN_1_PRESENT_N","FAN_0_PRESENT_N",
-		"PRSNT_CHASSIS3_LEAK_CABLE_R_N","PRSNT_CHASSIS1_LEAK_CABLE_R_N",
-		"PRSNT_CHASSIS2_LEAK_CABLE_R_N","PRSNT_CHASSIS0_LEAK_CABLE_R_N",
-		"PRSNT_RJ45_FIO_N_R","PRSNT_HDDBD_POWER_CABLE_N",
-		"PRSNT_OSFP_POWER_CABLE_N","";
-};
-
-&io_expander12 {
-	gpio-line-names =
-		"RST_OCP_V3_1_R_N","NIC0_PERST_N",
-		"OCP_SFF_PERST_FROM_HOST_ISO_PLD_N","OCP_SFF_MAIN_PWR_EN",
-		"FM_OCP_SFF_PWR_GOOD_PLD","OCP_SFF_AUX_PWR_PLD_EN_R",
-		"HP_LVC3_OCP_V3_1_PWRGD_PLD","HP_OCP_V3_1_HSC_PWRGD_PLD_R",
-		"RST_OCP_V3_2_R_N","NIC1_PERST_N",
-		"OCP_V3_2_PERST_FROM_HOST_ISO_PLD_N","OCP_V3_2_MAIN_PWR_EN",
-		"FM_OCP_V3_2_PWR_GOOD_PLD","OCP_V3_2_AUX_PWR_PLD_EN_R",
-		"HP_LVC3_OCP_V3_2_PWRGD_PLD","HP_OCP_V3_2_HSC_PWRGD_PLD_R";
-};
-
-&io_expander13 {
-	gpio-line-names =
-		"NODEA_NODEB_PWOK_PLD_ISO_R","PWR_EN_NICS",
-		"PWRGD_P12V_AUX_FAN_PLD","P12V_AUX_FAN_EN_PLD",
-		"PWRGD_P3V3_AUX_PLD","PWRGD_P12V_AUX_PLD_ISO_R",
-		"FM_MAIN_PWREN_FROM_RMC_R","FM_MAIN_PWREN_RMC_EN_ISO_R",
-		"PWRGD_RMC_R","PWRGD_P12V_AUX_FAN_PLD",
-		"P12V_AUX_FAN_EN_PLD","FM_SYS_THROTTLE_N",
-		"HP_LVC3_OCP_V3_2_PRSNT2_PLD_N","HP_LVC3_OCP_V3_1_PRSNT2_PLD_N",
-		"","";
-};
-
-&io_expander14 {
-	gpio-line-names =
-		"","","","","","","","",
-		"FM_BOARD_BMC_SKU_ID3","FM_BOARD_BMC_SKU_ID2",
-		"FM_BOARD_BMC_SKU_ID1","FM_BOARD_BMC_SKU_ID0",
-		"FAB_BMC_REV_ID2","FAB_BMC_REV_ID1",
-		"FAB_BMC_REV_ID0","";
-};
-- 
2.31.1


