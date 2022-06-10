Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1140E545F93
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 10:45:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKF0R6jpwz3bxr
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 18:45:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pfrJ5QyU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=medadyoung@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pfrJ5QyU;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKDyn0CgXz3bw6
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 18:44:00 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id gc3-20020a17090b310300b001e33092c737so1519785pjb.3
        for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 01:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+4CVCMjz+0suAt8V5Y2817Osc9g0YmAmWa1n3bUS86Y=;
        b=pfrJ5QyUStgTu3wsdDXoq+1PoBwxIGyoBXPKUo3MNO1LLWKG+tTrVTsF1PYdtPOkEC
         upjiirTkch6w5SwZEDjIIahT/E8W/YT6wj8wfkxr/zCT8Bqb8PNPPNcgl8+a1wfLrG0T
         IMxIViCExU3R3z7tMMZhfgWJCU2aoPx7YJrEJWD5PBAzDnH+r8LS8qHSWgWMPBwprYBK
         3yrlL2Jr6ryzeT1gCZgkeoDZ7S4+7P2ECDMYllx7QuhQvoXzvaDqZqcx1PmuZiqOINX6
         cWZXsbBZFoDDLUh6WLOeF16w/7Q+AUcRBWIz8FWsik2e8+BMmVF4uPSBKi0cD9yTA7dD
         dkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+4CVCMjz+0suAt8V5Y2817Osc9g0YmAmWa1n3bUS86Y=;
        b=PMl//LazHesPSTU5ONBUNBxeMxfW95opbKOLUxmNU/3JoVyPQVCZnxnBVo4CDJx39A
         ZzzTSdXr+fuzBeuI4MixXaOFB7TOh1Rsz4p5F7rxASsRiIG51tJ1ByHr80+XQEXJG9Ex
         2xgahmC3ZCUcckms0Td8mc+XyneVCKKfP2KKJZ+af0O5vkT41H61V4h8FIgnPwtGMYZv
         nD2DxeE1deoh08TcujdI+J3Sh1BUtPq7blvAm2vfTLs3YHER+0bNDQh6pi7IjS8awlji
         Vl80fwD3wTqhYZV1rsVllVQIL+ARkdxIR2ifsDmYaaIIryX6atxx0rn4VOmOfuIlbQ+2
         APBw==
X-Gm-Message-State: AOAM531uLT/JZJzPwBV3TZqklL0zKvPjjdw37Y7Ez98W8UUcJ18QmdRO
	xFiqFwOqEQ05hhnceJVA108=
X-Google-Smtp-Source: ABdhPJx/TGnEIt0E30M3ySae7AHUixMayQamXZWRkpJcKbREZoG5+tZp48aiUg+Dstw02YiyfcYUBg==
X-Received: by 2002:a17:90b:3789:b0:1e3:459a:1202 with SMTP id mz9-20020a17090b378900b001e3459a1202mr7665657pjb.113.1654850638455;
        Fri, 10 Jun 2022 01:43:58 -0700 (PDT)
Received: from localhost.localdomain ([1.200.147.12])
        by smtp.gmail.com with ESMTPSA id c28-20020aa7953c000000b0051c01aa7d31sm11703568pfp.46.2022.06.10.01.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 01:43:57 -0700 (PDT)
From: medadyoung@gmail.com
X-Google-Original-From: ctcchien@nuvoton.com
To: rric@kernel.org,
	james.morse@arm.com,
	tony.luck@intel.com,
	mchehab@kernel.org,
	bp@alien8.de,
	robh+dt@kernel.org,
	benjaminfair@google.com,
	yuenn@google.com,
	venture@google.com,
	KWLIU@nuvoton.com,
	YSCHU@nuvoton.com,
	JJLIU0@nuvoton.com,
	KFTING@nuvoton.com,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	ctcchien@nuvoton.com
Subject: [PATCH v12 2/3] ARM: dts: nuvoton: Add memory controller node
Date: Fri, 10 Jun 2022 16:43:39 +0800
Message-Id: <20220610084340.2268-3-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220610084340.2268-1-ctcchien@nuvoton.com>
References: <20220610084340.2268-1-ctcchien@nuvoton.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Medad CChien <ctcchien@nuvoton.com>

ECC must be configured in the BootBlock header.
Then, you can read error counts via the EDAC kernel framework.

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

