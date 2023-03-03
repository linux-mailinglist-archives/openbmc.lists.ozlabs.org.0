Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D60246AB381
	for <lists+openbmc@lfdr.de>; Mon,  6 Mar 2023 00:28:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVHvb4lGYz3cFP
	for <lists+openbmc@lfdr.de>; Mon,  6 Mar 2023 10:28:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JC0qTlMT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=tomato1220@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JC0qTlMT;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSdYP3pDQz3cMb
	for <openbmc@lists.ozlabs.org>; Fri,  3 Mar 2023 17:36:57 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id l1so1563603pjt.2
        for <openbmc@lists.ozlabs.org>; Thu, 02 Mar 2023 22:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677825415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUjTuzTTp/FXXoYY/BQnloUngbziX8MGZzy2Wy1/eYQ=;
        b=JC0qTlMTJWmsRiVb1Y+BFH8rXX42ktQzahOVJkBIoDodPtfUJrsYcNFQCwj3l+JXMo
         tRXx2a7UAMiZBe6V4I0bR4UktIV+H0hU7AT9aQomE0ibQx+VGDswpnFYGjPucS1Q3C0p
         hZ7Aj7ybRxjq3scaDaBq/17tvOG7WEG/AES8XOu+PN4CnJ29d2cmnN68iPbWCY1UmDkz
         7r0PxTYEhvv7xwSve25GPBOqcZanmYet/PquzEypPzZRBjUXFjihQR79bCfvbt5PMHsd
         qUOLOmZW3TErqNzmzfgrSogIb5uT6TMDMfbUey0KlDMyAgnA8EOWhXx+F6RFABUohOBh
         UMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677825415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUjTuzTTp/FXXoYY/BQnloUngbziX8MGZzy2Wy1/eYQ=;
        b=ZixSCKhjrxs2gEy9zOILtZkghJmPoxPWBLNFo68Ivqk0Zv2jQvGiXU32BJMDz9lhvP
         F3tUXItQ1CnuxVwMfmIAajYTTCO0HgA7MP0e1Psb8HC7vcBFCd24oWbNDEOYGfix41aq
         JqRkWVwTtjdp4KmCYib+GjHWlvJArXjgyNE2CXULRxsFjuNS/3dWbPMYnY6hwyrv0vzV
         +PnargiFJ8WZagHCeN/cBnO3aCp7dYHu2FsKvL2WNV0GDgABkStOpokB60DX6PKZrPxK
         zF5StlSEtP9jwuDLlk7vWVzNkOrV95hKZVrncDV0iHncoCl8YYn1MQiIRkL4rPKdmryA
         33Bg==
X-Gm-Message-State: AO0yUKWB5jLUi3EAzHQWyMdypfvSJteLhqqyia4OktB3WXlv2uQyGSVT
	CxHODrSzoj8e25HbwberFVE=
X-Google-Smtp-Source: AK7set98WDaa+JVAEEXTa16vJKHXteaKqiwrMQSwBheW7GzCdujgBd/N7Jn1lwBGaRTF/gnffERXJw==
X-Received: by 2002:a17:90a:4e:b0:237:b5d4:c0e5 with SMTP id 14-20020a17090a004e00b00237b5d4c0e5mr582481pjb.27.1677825415298;
        Thu, 02 Mar 2023 22:36:55 -0800 (PST)
Received: from davidwang.dhcpserver.bu9bmc.local (1-34-79-176.hinet-ip.hinet.net. [1.34.79.176])
        by smtp.gmail.com with ESMTPSA id l30-20020a635b5e000000b004ff6b744248sm736348pgm.48.2023.03.02.22.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 22:36:55 -0800 (PST)
From: David Wang <tomato1220@gmail.com>
X-Google-Original-From: David Wang <davidwang@quantatw.com>
To: arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH 3/7] ARM: dts: nuvoton: gbs: Split SPI flash partition
Date: Fri,  3 Mar 2023 14:34:31 +0800
Message-Id: <20230303063435.803097-3-davidwang@quantatw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303063435.803097-1-davidwang@quantatw.com>
References: <20230303063435.803097-1-davidwang@quantatw.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 06 Mar 2023 10:24:04 +1100
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
Cc: devicetree@vger.kernel.org, David Wang <davidwang@quantatw.com>, fran.hsu@quantatw.com, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, linux-arm-kernel@lists.infradead.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Split the primary and secondary BIOS SPI EEPROMs in 2 partitions

Signed-off-by: David Wang <davidwang@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-gbs.dts | 29 ++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
index 9e9eba8bad5e..a33766e430d7 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
@@ -414,7 +414,20 @@ flash@0 {
 		spi-max-frequency = <50000000>;
 		spi-rx-bus-width = <2>;
 		m25p,fast-read;
-		label = "pnor";
+		label = "bios";
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			bios-primary@0 {
+				label = "bios-primary";
+				reg = <0x0000000 0x2000000>;
+			};
+			bios-secondary@2000000 {
+				label = "bios-secondary";
+				reg = <0x2000000 0x2000000>;
+			};
+		};
 	};
 	flash@1 {
 		compatible = "jedec,spi-nor";
@@ -424,6 +437,20 @@ flash@1 {
 		spi-max-frequency = <50000000>;
 		spi-rx-bus-width = <2>;
 		m25p,fast-read;
+		label = "bios-2";
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			bios-2-primary@0 {
+				label = "bios-2-primary";
+				reg = <0x0000000 0x2000000>;
+			};
+			bios-2-secondary@2000000 {
+				label = "bios-2-secondary";
+				reg = <0x2000000 0x2000000>;
+			};
+		};
 	};
 };
 
-- 
2.25.1

