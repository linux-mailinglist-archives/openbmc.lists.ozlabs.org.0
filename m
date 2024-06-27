Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C2891B291
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 01:15:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DeK2iKcB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9Dv11MZMz3cXC
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 09:15:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DeK2iKcB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8pdf583hz3cFN
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 16:32:22 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-706524adf91so4651620b3a.2
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 23:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719469941; x=1720074741; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFnW83iqY1HB4cJgk5aFgy/mNrqSGdVHCnuN+DvNVUw=;
        b=DeK2iKcBRwoaav62BYCyt97lq02laJNGPD4Nrpbea1kVBJeRpVkgJomBkN2nzzeH5c
         LSdp3QEM6b9NufeC8G4t2a9WExuVEKlWZiowH34yumySwsYdHB/vOPNL7N3A+30RqpUa
         t+TPBPhdsX+IaCTA/8TJPgKE4NTs0JXD15tBedcQmsdN9fVUDR+ljwX6U/hvpCciSbKB
         O3VCwZcIjHUl+9ww3mlBJvRQiDpi6trwuLqjhSvdZLcYT6BSDdBau+C/fquoOBx/Wl5E
         F3DmeUxmJuNKs0iFOfFeAMmJ83ZLUOzUiSgccnOxp0YleitqP7OuQI0WIO/7CAdmZuWP
         ZBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719469941; x=1720074741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFnW83iqY1HB4cJgk5aFgy/mNrqSGdVHCnuN+DvNVUw=;
        b=QxjYr6AnlmPKVAjI4yeJgGqEvKdafygSUwPOA9yynU1C37Gp35A59P73jlfxvELlmP
         gSTlRVW2MUgGIk4kxjlf6j6W34RNGaxEbIvjqzug+jAGXCg17xjwxV6WJSrDfPLr0QoV
         lbSb8+4+ux5EZQRWVcRdFjI1fKN0m1Pg/HT43gu8ib55titUu+8TpcX3u8N2VZAHlJS4
         wLHO5Ii0vaeIfLNbj+m3eT6T5EYyx1UEkqlhJHT4Ox75QlL8pPr4Zz9sg1Ou7iOz1YT9
         qdyTSOB9i0s1L4Cct7/pdwZ0ZcNFK6J2j1Y4DCpvi3BL9IDl2M98W9jS8FFCYQtXpMLR
         s9uQ==
X-Gm-Message-State: AOJu0YwchdTcvhP5K3xwG8eBgXP3PUBltJjUKZvzu7pfBhCwbzMd/z/c
	jm8wpbZBvrs9/5eqO/QeenIiwj7vjHzSJE8dV7kFstYr1tUg8Oe/TVSSJJVq
X-Google-Smtp-Source: AGHT+IGro+fgTWRcL5Es6K+BceMbuQ/GEUUBrWLUUc/8FMCVoDvXBseGNqBSGtcx+phyOWohyg+2Ow==
X-Received: by 2002:a05:6a20:1796:b0:1bd:22e0:f725 with SMTP id adf61e73a8af0-1bd22e0fa0cmr5928387637.29.1719469941209;
        Wed, 26 Jun 2024 23:32:21 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac97a122sm5403235ad.176.2024.06.26.23.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 23:32:20 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 13/17] ARM: dts: aspeed: minerva: revise sgpio line name
Date: Thu, 27 Jun 2024 14:29:47 +0800
Message-Id: <20240627062951.936256-14-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627062951.936256-1-yangchen.openbmc@gmail.com>
References: <20240627062951.936256-1-yangchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 Jun 2024 09:03:24 +1000
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
Cc: Jerry.Lin@quantatw.com, yang.chen@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Yang Chen <yang.chen@quantatw.com>

Revise the SGPIO naming to mapping the SGPIO from the CPLD.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 236 +++++++++---------
 1 file changed, 118 insertions(+), 118 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 0c305ddf7011..7a790e347853 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -610,118 +610,118 @@ &sgpiom0 {
 	gpio-line-names =
 	/*"input pin","output pin"*/
 	/*A0 - A7*/
-	"PRSNT_MTIA_BLADE0_N","PWREN_MTIA_BLADE0_EN",
-	"PRSNT_MTIA_BLADE1_N","PWREN_MTIA_BLADE1_EN",
-	"PRSNT_MTIA_BLADE2_N","PWREN_MTIA_BLADE2_EN",
-	"PRSNT_MTIA_BLADE3_N","PWREN_MTIA_BLADE3_EN",
-	"PRSNT_MTIA_BLADE4_N","PWREN_MTIA_BLADE4_EN",
-	"PRSNT_MTIA_BLADE5_N","PWREN_MTIA_BLADE5_EN",
-	"PRSNT_MTIA_BLADE6_N","PWREN_MTIA_BLADE6_EN",
-	"PRSNT_MTIA_BLADE7_N","PWREN_MTIA_BLADE7_EN",
+	"PRSNT_MTIA_BLADE0_N","PWREN_MTIA_BLADE0_EN_N",
+	"PRSNT_MTIA_BLADE1_N","PWREN_MTIA_BLADE1_EN_N",
+	"PRSNT_MTIA_BLADE2_N","PWREN_MTIA_BLADE2_EN_N",
+	"PRSNT_MTIA_BLADE3_N","PWREN_MTIA_BLADE3_EN_N",
+	"PRSNT_MTIA_BLADE4_N","PWREN_MTIA_BLADE4_EN_N",
+	"PRSNT_MTIA_BLADE5_N","PWREN_MTIA_BLADE5_EN_N",
+	"PRSNT_MTIA_BLADE6_N","PWREN_MTIA_BLADE6_EN_N",
+	"PRSNT_MTIA_BLADE7_N","PWREN_MTIA_BLADE7_EN_N",
 	/*B0 - B7*/
-	"PRSNT_MTIA_BLADE8_N","PWREN_MTIA_BLADE8_EN",
-	"PRSNT_MTIA_BLADE9_N","PWREN_MTIA_BLADE9_EN",
-	"PRSNT_MTIA_BLADE10_N","PWREN_MTIA_BLADE10_EN",
-	"PRSNT_MTIA_BLADE11_N","PWREN_MTIA_BLADE11_EN",
-	"PRSNT_MTIA_BLADE12_N","PWREN_MTIA_BLADE12_EN",
-	"PRSNT_MTIA_BLADE13_N","PWREN_MTIA_BLADE13_EN",
-	"PRSNT_MTIA_BLADE14_N","PWREN_MTIA_BLADE14_EN",
-	"PRSNT_MTIA_BLADE15_N","PWREN_MTIA_BLADE15_EN",
+	"PRSNT_MTIA_BLADE8_N","PWREN_MTIA_BLADE8_EN_N",
+	"PRSNT_MTIA_BLADE9_N","PWREN_MTIA_BLADE9_EN_N",
+	"PRSNT_MTIA_BLADE10_N","PWREN_MTIA_BLADE10_EN_N",
+	"PRSNT_MTIA_BLADE11_N","PWREN_MTIA_BLADE11_EN_N",
+	"PRSNT_MTIA_BLADE12_N","PWREN_MTIA_BLADE12_EN_N",
+	"PRSNT_MTIA_BLADE13_N","PWREN_MTIA_BLADE13_EN_N",
+	"PRSNT_MTIA_BLADE14_N","PWREN_MTIA_BLADE14_EN_N",
+	"PRSNT_MTIA_BLADE15_N","PWREN_MTIA_BLADE15_EN_N",
 	/*C0 - C7*/
-	"PRSNT_NW_BLADE0_N","PWREN_NW_BLADE0_EN",
-	"PRSNT_NW_BLADE1_N","PWREN_NW_BLADE1_EN",
-	"PRSNT_NW_BLADE2_N","PWREN_NW_BLADE2_EN",
-	"PRSNT_NW_BLADE3_N","PWREN_NW_BLADE3_EN",
-	"PRSNT_NW_BLADE4_N","PWREN_NW_BLADE4_EN",
-	"PRSNT_NW_BLADE5_N","PWREN_NW_BLADE5_EN",
-	"PRSNT_FCB_TOP_0_N","PWREN_MTIA_BLADE0_HSC_EN",
-	"PRSNT_FCB_TOP_1_N","PWREN_MTIA_BLADE1_HSC_EN",
+	"PRSNT_NW_BLADE0_N","PWREN_NW_BLADE0_EN_N",
+	"PRSNT_NW_BLADE1_N","PWREN_NW_BLADE1_EN_N",
+	"PRSNT_NW_BLADE2_N","PWREN_NW_BLADE2_EN_N",
+	"PRSNT_NW_BLADE3_N","PWREN_NW_BLADE3_EN_N",
+	"PRSNT_NW_BLADE4_N","PWREN_NW_BLADE4_EN_N",
+	"PRSNT_NW_BLADE5_N","PWREN_NW_BLADE5_EN_N",
+	"PRSNT_FCB_TOP_0_N","PWREN_MTIA_BLADE0_HSC_EN_N",
+	"PRSNT_FCB_TOP_1_N","PWREN_MTIA_BLADE1_HSC_EN_N",
 	/*D0 - D7*/
-	"PRSNT_FCB_MIDDLE_0_N","PWREN_MTIA_BLADE2_HSC_EN",
-	"PRSNT_FCB_MIDDLE_1_N","PWREN_MTIA_BLADE3_HSC_EN",
-	"PRSNT_FCB_BOTTOM_0_N","PWREN_MTIA_BLADE4_HSC_EN",
-	"PRSNT_FCB_BOTTOM_1_N","PWREN_MTIA_BLADE5_HSC_EN",
-	"PWRGD_MTIA_BLADE0_PWROK_L_BUF","PWREN_MTIA_BLADE6_HSC_EN",
-	"PWRGD_MTIA_BLADE1_PWROK_L_BUF","PWREN_MTIA_BLADE7_HSC_EN",
-	"PWRGD_MTIA_BLADE2_PWROK_L_BUF","PWREN_MTIA_BLADE8_HSC_EN",
-	"PWRGD_MTIA_BLADE3_PWROK_L_BUF","PWREN_MTIA_BLADE9_HSC_EN",
+	"PRSNT_FCB_MIDDLE_0_N","PWREN_MTIA_BLADE2_HSC_EN_N",
+	"PRSNT_FCB_MIDDLE_1_N","PWREN_MTIA_BLADE3_HSC_EN_N",
+	"PRSNT_FCB_BOTTOM_1_N","PWREN_MTIA_BLADE4_HSC_EN_N",
+	"PRSNT_FCB_BOTTOM_0_N","PWREN_MTIA_BLADE5_HSC_EN_N",
+	"PWRGD_MTIA_BLADE0_PWROK_N","PWREN_MTIA_BLADE6_HSC_EN_N",
+	"PWRGD_MTIA_BLADE1_PWROK_N","PWREN_MTIA_BLADE7_HSC_EN_N",
+	"PWRGD_MTIA_BLADE2_PWROK_N","PWREN_MTIA_BLADE8_HSC_EN_N",
+	"PWRGD_MTIA_BLADE3_PWROK_N","PWREN_MTIA_BLADE9_HSC_EN_N",
 	/*E0 - E7*/
-	"PWRGD_MTIA_BLADE4_PWROK_L_BUF","PWREN_MTIA_BLADE10_HSC_EN",
-	"PWRGD_MTIA_BLADE5_PWROK_L_BUF","PWREN_MTIA_BLADE11_HSC_EN",
-	"PWRGD_MTIA_BLADE6_PWROK_L_BUF","PWREN_MTIA_BLADE12_HSC_EN",
-	"PWRGD_MTIA_BLADE7_PWROK_L_BUF","PWREN_MTIA_BLADE13_HSC_EN",
-	"PWRGD_MTIA_BLADE8_PWROK_L_BUF","PWREN_MTIA_BLADE14_HSC_EN",
-	"PWRGD_MTIA_BLADE9_PWROK_L_BUF","PWREN_MTIA_BLADE15_HSC_EN",
-	"PWRGD_MTIA_BLADE10_PWROK_L_BUF","PWREN_NW_BLADE0_HSC_EN",
-	"PWRGD_MTIA_BLADE11_PWROK_L_BUF","PWREN_NW_BLADE1_HSC_EN",
+	"PWRGD_MTIA_BLADE4_PWROK_N","PWREN_MTIA_BLADE10_HSC_EN_N",
+	"PWRGD_MTIA_BLADE5_PWROK_N","PWREN_MTIA_BLADE11_HSC_EN_N",
+	"PWRGD_MTIA_BLADE6_PWROK_N","PWREN_MTIA_BLADE12_HSC_EN_N",
+	"PWRGD_MTIA_BLADE7_PWROK_N","PWREN_MTIA_BLADE13_HSC_EN_N",
+	"PWRGD_MTIA_BLADE8_PWROK_N","PWREN_MTIA_BLADE14_HSC_EN_N",
+	"PWRGD_MTIA_BLADE9_PWROK_N","PWREN_MTIA_BLADE15_HSC_EN_N",
+	"PWRGD_MTIA_BLADE10_PWROK_N","PWREN_NW_BLADE0_HSC_EN_N",
+	"PWRGD_MTIA_BLADE11_PWROK_N","PWREN_NW_BLADE1_HSC_EN_N",
 	/*F0 - F7*/
-	"PWRGD_MTIA_BLADE12_PWROK_L_BUF","PWREN_NW_BLADE2_HSC_EN",
-	"PWRGD_MTIA_BLADE13_PWROK_L_BUF","PWREN_NW_BLADE3_HSC_EN",
-	"PWRGD_MTIA_BLADE14_PWROK_L_BUF","PWREN_NW_BLADE4_HSC_EN",
-	"PWRGD_MTIA_BLADE15_PWROK_L_BUF","PWREN_NW_BLADE5_HSC_EN",
-	"PWRGD_NW_BLADE0_PWROK_L_BUF","PWREN_FCB_TOP_L_EN",
-	"PWRGD_NW_BLADE1_PWROK_L_BUF","PWREN_FCB_TOP_R_EN",
-	"PWRGD_NW_BLADE2_PWROK_L_BUF","PWREN_FCB_MIDDLE_L_EN",
-	"PWRGD_NW_BLADE3_PWROK_L_BUF","PWREN_FCB_MIDDLE_R_EN",
+	"PWRGD_MTIA_BLADE12_PWROK_N","PWREN_NW_BLADE2_HSC_EN_N",
+	"PWRGD_MTIA_BLADE13_PWROK_N","PWREN_NW_BLADE3_HSC_EN_N",
+	"PWRGD_MTIA_BLADE14_PWROK_N","PWREN_NW_BLADE4_HSC_EN_N",
+	"PWRGD_MTIA_BLADE15_PWROK_N","PWREN_NW_BLADE5_HSC_EN_N",
+	"PWRGD_NW_BLADE0_PWROK_N","PWREN_FCB_TOP_0_EN_N",
+	"PWRGD_NW_BLADE1_PWROK_N","PWREN_FCB_TOP_1_EN_N",
+	"PWRGD_NW_BLADE2_PWROK_N","PWREN_FCB_MIDDLE_0_EN_N",
+	"PWRGD_NW_BLADE3_PWROK_N","PWREN_FCB_MIDDLE_1_EN_N",
 	/*G0 - G7*/
-	"PWRGD_NW_BLADE4_PWROK_L_BUF","PWREN_FCB_BOTTOM_L_EN",
-	"PWRGD_NW_BLADE5_PWROK_L_BUF","PWREN_FCB_BOTTOM_R_EN",
-	"PWRGD_FCB_TOP_0_PWROK_L_BUF","FM_CMM_AC_CYCLE_N",
-	"PWRGD_FCB_TOP_1_PWROK_L_BUF","MGMT_SFP_TX_DIS",
-	"PWRGD_FCB_MIDDLE_0_PWROK_L_BUF","",
-	"PWRGD_FCB_MIDDLE_1_PWROK_L_BUF","RST_I2CRST_MTIA_BLADE0_1_N",
-	"PWRGD_FCB_BOTTOM_0_PWROK_L_BUF","RST_I2CRST_MTIA_BLADE2_3_N",
-	"PWRGD_FCB_BOTTOM_1_PWROK_L_BUF","RST_I2CRST_MTIA_BLADE4_5_N",
+	"PWRGD_NW_BLADE4_PWROK_N","PWREN_FCB_BOTTOM_1_EN_N",
+	"PWRGD_NW_BLADE5_PWROK_N","PWREN_FCB_BOTTOM_0_EN_N",
+	"PWRGD_FCB_TOP_0_PWROK_N","FM_CMM_AC_CYCLE_N",
+	"PWRGD_FCB_TOP_1_PWROK_N","MGMT_SFP_TX_DIS",
+	"PWRGD_FCB_MIDDLE_0_PWROK_N","FM_MDIO_SW_SEL",
+	"PWRGD_FCB_MIDDLE_1_PWROK_N","FM_P24V_SMPWR_EN",
+	"PWRGD_FCB_BOTTOM_1_PWROK_N","",
+	"PWRGD_FCB_BOTTOM_0_PWROK_N","",
 	/*H0 - H7*/
-	"LEAK_DETECT_MTIA_BLADE0_N_BUF","RST_I2CRST_MTIA_BLADE6_7_N",
-	"LEAK_DETECT_MTIA_BLADE1_N_BUF","RST_I2CRST_MTIA_BLADE8_9_N",
-	"LEAK_DETECT_MTIA_BLADE2_N_BUF","RST_I2CRST_MTIA_BLADE10_11_N",
-	"LEAK_DETECT_MTIA_BLADE3_N_BUF","RST_I2CRST_MTIA_BLADE12_13_N",
-	"LEAK_DETECT_MTIA_BLADE4_N_BUF","RST_I2CRST_MTIA_BLADE14_15_N",
-	"LEAK_DETECT_MTIA_BLADE5_N_BUF","RST_I2CRST_NW_BLADE0_1_2_N",
-	"LEAK_DETECT_MTIA_BLADE6_N_BUF","RST_I2CRST_NW_BLADE3_4_5_N",
-	"LEAK_DETECT_MTIA_BLADE7_N_BUF","RST_I2CRST_FCB_N",
+	"LEAK_DETECT_MTIA_BLADE0_N","",
+	"LEAK_DETECT_MTIA_BLADE1_N","",
+	"LEAK_DETECT_MTIA_BLADE2_N","",
+	"LEAK_DETECT_MTIA_BLADE3_N","",
+	"LEAK_DETECT_MTIA_BLADE4_N","",
+	"LEAK_DETECT_MTIA_BLADE5_N","",
+	"LEAK_DETECT_MTIA_BLADE6_N","",
+	"LEAK_DETECT_MTIA_BLADE7_N","",
 	/*I0 - I7*/
-	"LEAK_DETECT_MTIA_BLADE8_N_BUF","RST_I2CRST_FCB_B_L_N",
-	"LEAK_DETECT_MTIA_BLADE9_N_BUF","RST_I2CRST_FCB_B_R_N",
-	"LEAK_DETECT_MTIA_BLADE10_N_BUF","RST_I2CRST_FCB_M_L_N",
-	"LEAK_DETECT_MTIA_BLADE11_N_BUF","RST_I2CRST_FCB_M_R_N",
-	"LEAK_DETECT_MTIA_BLADE12_N_BUF","RST_I2CRST_FCB_T_L_N",
-	"LEAK_DETECT_MTIA_BLADE13_N_BUF","RST_I2CRST_FCB_T_R_N",
-	"LEAK_DETECT_MTIA_BLADE14_N_BUF","BMC_READY",
-	"LEAK_DETECT_MTIA_BLADE15_N_BUF","wFM_88E6393X_BIN_UPDATE_EN_N",
+	"LEAK_DETECT_MTIA_BLADE8_N","RST_I2CRST_FCB_BOTTOM_1_N",
+	"LEAK_DETECT_MTIA_BLADE9_N","RST_I2CRST_FCB_BOTTOM_0_N",
+	"LEAK_DETECT_MTIA_BLADE10_N","RST_I2CRST_FCB_MIDDLE_0_N",
+	"LEAK_DETECT_MTIA_BLADE11_N","RST_I2CRST_FCB_MIDDLE_1_N",
+	"LEAK_DETECT_MTIA_BLADE12_N","RST_I2CRST_FCB_TOP_0_N",
+	"LEAK_DETECT_MTIA_BLADE13_N","RST_I2CRST_FCB_TOP_1_N",
+	"LEAK_DETECT_MTIA_BLADE14_N","BMC_READY",
+	"LEAK_DETECT_MTIA_BLADE15_N","FM_88E6393X_BIN_UPDATE_EN_N",
 	/*J0 - J7*/
-	"LEAK_DETECT_NW_BLADE0_N_BUF","WATER_VALVE_CLOSED_N",
-	"LEAK_DETECT_NW_BLADE1_N_BUF","",
-	"LEAK_DETECT_NW_BLADE2_N_BUF","",
-	"LEAK_DETECT_NW_BLADE3_N_BUF","",
-	"LEAK_DETECT_NW_BLADE4_N_BUF","",
-	"LEAK_DETECT_NW_BLADE5_N_BUF","",
-	"MTIA_BLADE0_STATUS_LED","",
-	"MTIA_BLADE1_STATUS_LED","",
+	"LEAK_DETECT_NW_BLADE0_N","WATER_VALVE_CLOSED_N",
+	"LEAK_DETECT_NW_BLADE1_N","",
+	"LEAK_DETECT_NW_BLADE2_N","",
+	"LEAK_DETECT_NW_BLADE3_N","",
+	"LEAK_DETECT_NW_BLADE4_N","",
+	"LEAK_DETECT_NW_BLADE5_N","",
+	"PWRGD_MTIA_BLADE0_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE1_HSC_PWROK_N","",
 	/*K0 - K7*/
-	"MTIA_BLADE2_STATUS_LED","",
-	"MTIA_BLADE3_STATUS_LED","",
-	"MTIA_BLADE4_STATUS_LED","",
-	"MTIA_BLADE5_STATUS_LED","",
-	"MTIA_BLADE6_STATUS_LED","",
-	"MTIA_BLADE7_STATUS_LED","",
-	"MTIA_BLADE8_STATUS_LED","",
-	"MTIA_BLADE9_STATUS_LED","",
+	"PWRGD_MTIA_BLADE2_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE3_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE4_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE5_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE6_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE7_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE8_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE9_HSC_PWROK_N","",
 	/*L0 - L7*/
-	"MTIA_BLADE10_STATUS_LED","",
-	"MTIA_BLADE11_STATUS_LED","",
-	"MTIA_BLADE12_STATUS_LED","",
-	"MTIA_BLADE13_STATUS_LED","",
-	"MTIA_BLADE14_STATUS_LED","",
-	"MTIA_BLADE15_STATUS_LED","",
-	"NW_BLADE0_STATUS_LED","",
-	"NW_BLADE1_STATUS_LED","",
+	"PWRGD_MTIA_BLADE10_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE11_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE12_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE13_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE14_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE15_HSC_PWROK_N","",
+	"PWRGD_NW_BLADE0_HSC_PWROK_N","",
+	"PWRGD_NW_BLADE1_HSC_PWROK_N","",
 	/*M0 - M7*/
-	"NW_BLADE2_STATUS_LED","",
-	"NW_BLADE3_STATUS_LED","",
-	"NW_BLADE4_STATUS_LED","",
-	"NW_BLADE5_STATUS_LED","",
+	"PWRGD_NW_BLADE2_HSC_PWROK_N","",
+	"PWRGD_NW_BLADE3_HSC_PWROK_N","",
+	"PWRGD_NW_BLADE4_HSC_PWROK_N","",
+	"PWRGD_NW_BLADE5_HSC_PWROK_N","",
 	"RPU_READY","",
 	"IT_GEAR_RPU_LINK_N","",
 	"IT_GEAR_LEAK","",
@@ -729,28 +729,28 @@ &sgpiom0 {
 	/*N0 - N7*/
 	"VALVE_STS0","",
 	"VALVE_STS1","",
-	"VALVE_STS2","",
-	"VALVE_STS3","",
-	"CR_TOGGLE_BOOT_BUF_N","",
-	"CMM_LC_RDY_LED_N","",
-	"CMM_LC_UNRDY_LED_N","",
+	"PCA9555_IRQ0_N","",
+	"PCA9555_IRQ1_N","",
+	"CR_TOGGLE_BOOT_N","",
+	"IRQ_FCB_TOP0_N","",
+	"IRQ_FCB_TOP1_N","",
 	"CMM_CABLE_CARTRIDGE_PRSNT_BOT_N","",
 	/*O0 - O7*/
 	"CMM_CABLE_CARTRIDGE_PRSNT_TOP_N","",
 	"BOT_BCB_CABLE_PRSNT_N","",
 	"TOP_BCB_CABLE_PRSNT_N","",
-	"CHASSIS0_LEAK_Q_N","",
-	"CHASSIS1_LEAK_Q_N","",
-	"LEAK0_DETECT","",
-	"LEAK1_DETECT","",
-	"MGMT_SFP_PRSNT_N","",
+	"IRQ_FCB_MID0_N","",
+	"IRQ_FCB_MID1_N","",
+	"CHASSIS_LEAK0_DETECT_N","",
+	"CHASSIS_LEAK1_DETECT_N","",
+	"VALVE_RMON_A_1","",
 	/*P0 - P7*/
-	"MGMT_SFP_TX_FAULT","",
-	"MGMT_SFP_RX_LOS","",
-	"","",
-	"","",
-	"","",
-	"","",
-	"","",
-	"","";
+	"VALVE_RMON_A_2","",
+	"VALVE_RMON_B_1","",
+	"VALVE_RMON_B_2","",
+	"RPU_READY_SPARE","",
+	"IT_GEAR_LEAK_SPARE","",
+	"IT_GEAR_RPU_LINK_SPARE_N","",
+	"IRQ_FCB_BOT0_N","",
+	"IRQ_FCB_BOT0_N","";
 };
-- 
2.34.1

