Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC20B4CA0AC
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 10:25:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7pd15Y76z3brJ
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 20:25:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cHV1lPfo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=cHV1lPfo; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7pc62Hlbz3bqt
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2022 20:24:54 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id o23so1107950pgk.13
 for <openbmc@lists.ozlabs.org>; Wed, 02 Mar 2022 01:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Zp2ZyHLiVwn9zzywILbOxMKzjj2ZvgI+yMGcT3sB0gw=;
 b=cHV1lPfo7NWy7+g7/8TTLoHJHpSTVpNrlzJkw97UMC9K+1NahHHlxEb+r6XI/Gy6yx
 j7uYa+hMwtJ4rBSvyJme89vP2cH1C2xVYc66i/IR2t1LcBAr9BNiTPklecIMThKhnCOP
 ad+AGtu9O8Nk09jE//YtiN2QzH/H9DzuVhUqVVdK7PHs417GpFJ7YJmh5P/rnvwBsw5I
 472kM4Pbhqxis+EmQy5w2QQswCH0dTEjEsKVYti42+hoh0fUO3poqTvBw6Bz9724jgfb
 WdfyRjXLAwfAovhDa1TBvH+pT08ze/Y0gz2VYSUR+8cFfeuTWVhsrdtMx4gwAdsYJq/r
 GYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Zp2ZyHLiVwn9zzywILbOxMKzjj2ZvgI+yMGcT3sB0gw=;
 b=vszcolV/hfV436Mk6qsO5hFMwT1RStO49uwrbLpXS9/xHgo1gVHhxKhfZvKEyyV1DQ
 gfHRO0nLQM88KsfrTH98kivEWr3+7drkUDoTQqhgLJEWzoEwODV6TwJ+eQmopxaKLbZ/
 QE4tCgonbmeET8CH04njJuz+4yZvD3Ud+1aq4LcQJKmaIQHZy2dGsnwXFvQqZ34np6K1
 KKnnfXjIQ1tOpHGCVoTaAHyAZ/P7KNp46FaTee8Iva6ojW/dDB9+us16cjzzQfMhD9ml
 Cz2mjNTKxG3WJcTWhrIbYVk9NOZDY7Y55DWhmPA9DDy8M6u6ObIEYbN2PfKcD4rskrbA
 bUNw==
X-Gm-Message-State: AOAM532Pgbd9InW5Hh/fYUQc3D7LY/htXDDJD9nXpSQoO8qjMDumV8R8
 SXD02hah1buyxERxvGeo7/o=
X-Google-Smtp-Source: ABdhPJwRt9E0DiTyG+pojpoz77f1Nh6CdiqHiMmsUUfeNWQCbGRiF0emFTgEmQuirY6wBn6qVa4PQg==
X-Received: by 2002:a65:6251:0:b0:374:6621:9fe8 with SMTP id
 q17-20020a656251000000b0037466219fe8mr25817981pgv.254.1646213088704; 
 Wed, 02 Mar 2022 01:24:48 -0800 (PST)
Received: from localhost.localdomain ([112.78.94.140])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a056a00085600b004f397d1f3b5sm21351153pfk.171.2022.03.02.01.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 01:24:48 -0800 (PST)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com
Subject: [PATCH v2 1/3] ARM: dts: nuvoton: Add new device node
Date: Wed,  2 Mar 2022 17:24:32 +0800
Message-Id: <20220302092434.16625-2-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220302092434.16625-1-ctcchien@nuvoton.com>
References: <20220302092434.16625-1-ctcchien@nuvoton.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Medad CChien <ctcchien@nuvoton.com>, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

 Add NPCM7xx EDAC device node

Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index 3696980a3da1..b2871856f913 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -106,6 +106,13 @@
 		interrupt-parent = <&gic>;
 		ranges;
 
+		mc: memory-controller@f0824000 {
+			compatible = "nuvoton,npcm7xx-memory-controller";
+			reg = <0x0 0xf0824000 0x0 0x1000>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		rstc: rstc@f0801000 {
 			compatible = "nuvoton,npcm750-reset";
 			reg = <0xf0801000 0x70>;
-- 
2.17.1

