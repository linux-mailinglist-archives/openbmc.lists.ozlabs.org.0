Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB254E372C
	for <lists+openbmc@lfdr.de>; Tue, 22 Mar 2022 04:03:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMxBH44xXz2yMj
	for <lists+openbmc@lfdr.de>; Tue, 22 Mar 2022 14:03:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mcndclZ6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mcndclZ6; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMx9H6wy5z2xt0
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2022 14:02:11 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id z16so17115494pfh.3
 for <openbmc@lists.ozlabs.org>; Mon, 21 Mar 2022 20:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=s3REtX15upPnaASwcpch/4bkCB1kjQjGAtbk3icoBvk=;
 b=mcndclZ69T0N48qXn3ceqE3elir7q/YFhadCs2NZmgLS1czEwYBRPnAonk8gJmv+CH
 biCecHAXQ4XsJ8d83S22Y85lBLDnxHiDRsaqDQJEEVumyAPkrZ5dODcOU2fES7LjurgJ
 UHh++9GEvUEVju+NaSlSkx6ae3t7A0LBEBOWD7f4QgIuP7C6HR9v4ulXRSPGKTDxX4iI
 K+OwMPvZC7ZP5V8ZnPqFob5ocbpDz024DL9L0sCEIWYtaNS/mB6aPW3NhACio3JJuEeu
 +yCQjieURIgRpX+QypeKKzia8FRGSPMXk7WGjiCck5vhVF8my7vwcr3r83L2gu2yAJoE
 mx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=s3REtX15upPnaASwcpch/4bkCB1kjQjGAtbk3icoBvk=;
 b=OcpBS3JkpUyLTPjy6KHgHx/m6FkcZmflBGB+cb4NFdX9fT2h0cb1OiNjuLOBEM8C5a
 uVARTTpAhXfHi/T1o2fK9aBcR/tiNUZfVxjWp1Lz4i1QC2tAqmcsVPbYP9z+zAHuDuXs
 J8F2sql1nQ4od+0OBsfxesOQmg7n2wbgMJIOeUqy0Uqfj8a9ld3086w9zRM9dsYLxkIh
 pvds+myoantuUX6fKRdepHiKNinpFl8T0wrD0QlUuSr9CB0SOg3rN61sly52blEh4bm3
 H/cnhrbssS0QqgeRE9lj+9V5ihpJo971a1sFvphBitMy1uQFNux5nLO755zC0qCn6gMH
 55Kg==
X-Gm-Message-State: AOAM530L4rSCyPnwYMlX5opOV3gw7t4bTqp8+LBn5i/5pVcGQT1JxtDo
 vIl1Brk+PlCUzn2wYnWi/QQ=
X-Google-Smtp-Source: ABdhPJyoXPtKfUenn/xWqn5BuvfbSmEYH2OdT5G+2Ewk4e5v6O/GVygjcaeUs0wedFSBivf8Y2pDcg==
X-Received: by 2002:a65:524b:0:b0:383:1b87:2d21 with SMTP id
 q11-20020a65524b000000b003831b872d21mr1665757pgp.482.1647918129605; 
 Mon, 21 Mar 2022 20:02:09 -0700 (PDT)
Received: from localhost.localdomain ([180.217.158.152])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a056a0022ce00b004fabe9fac23sm16660pfj.151.2022.03.21.20.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 20:02:09 -0700 (PDT)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, ctcchien@nuvoton.com
Subject: [PATCH v6 1/3] ARM: dts: nuvoton: Add memory controller node
Date: Tue, 22 Mar 2022 11:01:50 +0800
Message-Id: <20220322030152.19018-2-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220322030152.19018-1-ctcchien@nuvoton.com>
References: <20220322030152.19018-1-ctcchien@nuvoton.com>
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
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

ECC must be configured in the BootBlock header.
Then, you can read error counts via
the EDAC kernel framework.

Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index 3696980a3da1..ba542b26941e 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -106,6 +106,13 @@
 		interrupt-parent = <&gic>;
 		ranges;
 
+		mc: memory-controller@f0824000 {
+			compatible = "nuvoton,npcm750-memory-controller";
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

