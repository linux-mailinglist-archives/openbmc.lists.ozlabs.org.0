Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE2D5A595F
	for <lists+openbmc@lfdr.de>; Tue, 30 Aug 2022 04:23:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGrhs2g7zz3brF
	for <lists+openbmc@lfdr.de>; Tue, 30 Aug 2022 12:23:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Pfeyo1U5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Pfeyo1U5;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGrgm1Rx1z2xs1
	for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2022 12:22:59 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id f24so6996268plr.1
        for <openbmc@lists.ozlabs.org>; Mon, 29 Aug 2022 19:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=VJ968BoY2rUzhLmsHDPQEskN2/sLj9tYLwAiHbWfm18=;
        b=Pfeyo1U5xFkfRwohUHDvx+COd5YtApoO4czjrwwTzQ/9v1hAlbtkYRqOJHzbt94Ddm
         SbF+QDMx5TNCHY1DijR0F3ftlEChbxGIN/bR4pIubqKu+Lqw+Eb/qvtd1+I4061auP87
         97VSZlYW1hx5Azn9Ls4Eyn19FAMUdKLgSxsxHLbLGJ1Lrj1yNvoR8boQ3g7huDlpH0yv
         JE6RpjJungZEo3C8szILZHqwD83F9it4NbP/SHyvx/Ff5JeSHsqpLSFRf+wjW9rbdO1z
         lsxLNMQEvBKtffuGKFH+jz99UtW7EIpqC3L2X2nCgQrYb3XimaHJko9CnYBKtCvxWx+X
         fiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=VJ968BoY2rUzhLmsHDPQEskN2/sLj9tYLwAiHbWfm18=;
        b=KPMZ12Wg+a2OG/0iZSwF5YtML4hgHBB/o7EQf4+SPGV/fZQeWvEiV1gRDnOSC81dkx
         aEBBVfSmJVb4G4steLtdVuigEa3rCsgHUpqZIqzwrpYuKUBEMoXr0zalEILQCau3bOm1
         TwVTfTFn7ELy5+cYp/VUcTK5Fzjb0lmCXpjAw5TH9YlaYT40WGW4bzutFp+CUv+ASvEZ
         gwZBetTrBBvmuXEJVFOTICWLNb2+3np7ucDE5/xFE7eyDSa8t2F5vX8QnAi9thzrUSI6
         cg+ypt0CxZUlI8ROqYFlrgUmT/2PRUaQn2SfwzG//5SZGX1xXZA4J/PQ+Dj+au27Q1OS
         AlXg==
X-Gm-Message-State: ACgBeo2Nt2GrVllVaZOmpIk4lgeefbbTNXwcU/ociu/fX2+I5clW2YZX
	ncQ3kLNR6uBE6PoN8Iu7kpo=
X-Google-Smtp-Source: AA6agR5/dbSMlyjBlWjZEzKrJ8faCJwCcsd9bGaFn7fYBs8x3A0ZfgjKQQMdQraEkcEPZAqEVzyg5A==
X-Received: by 2002:a17:903:1ce:b0:16f:1c1f:50e5 with SMTP id e14-20020a17090301ce00b0016f1c1f50e5mr19679299plh.132.1661826177793;
        Mon, 29 Aug 2022 19:22:57 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id c78-20020a621c51000000b00536531536adsm7916841pfc.47.2022.08.29.19.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 19:22:57 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: linux-edac@vger.kernel.org,
	rric@kernel.org,
	james.morse@arm.com,
	tony.luck@intel.com,
	mchehab@kernel.org,
	bp@alien8.de,
	robh+dt@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v14 1/3] arm: dts: nuvoton: Add node for NPCM memory controller
Date: Tue, 30 Aug 2022 10:22:36 +0800
Message-Id: <20220830022238.28379-2-milkfafa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220830022238.28379-1-milkfafa@gmail.com>
References: <20220830022238.28379-1-milkfafa@gmail.com>
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
Cc: KWLIU@nuvoton.com, YSCHU@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, benjaminfair@google.com, devicetree@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, KFTING@nuvoton.com, JJLIU0@nuvoton.com, tali.perry1@gmail.com, ctcchien@nuvoton.com, kflin@nuvoton.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add node for memory controller present on Nuvoton NPCM SoCs. The memory
controller supports single bit error correction and double bit error
detection.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index c7b5ef15b716..d875e8ac1e09 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -179,6 +179,13 @@
 			status = "disabled";
 		};
 
+		mc: memory-controller@f0824000 {
+			compatible = "nuvoton,npcm750-memory-controller";
+			reg = <0xf0824000 0x1000>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		apb {
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.17.1

