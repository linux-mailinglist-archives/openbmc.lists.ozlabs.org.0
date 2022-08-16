Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0113C5956F8
	for <lists+openbmc@lfdr.de>; Tue, 16 Aug 2022 11:48:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6RCj6t0tz3bZY
	for <lists+openbmc@lfdr.de>; Tue, 16 Aug 2022 19:48:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Mc0DJiit;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Mc0DJiit;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6RBc6DjBz30LS
	for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2022 19:47:04 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id u22so461657plq.12
        for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2022 02:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=VJ968BoY2rUzhLmsHDPQEskN2/sLj9tYLwAiHbWfm18=;
        b=Mc0DJiitfZOS7yCuxHzYvAvxlxSXcfp4aULNBPnyc9MWQPwOM+x1ti8LNP+vpV6e2m
         uy2GmvN+b6M8Ro4qtjJ4r0hwOvKLverubGhrSjaMcfIIVFSdHmdJUfVj1FZL4nmguh83
         ml/5Uon6NXQI5SqHGyPbr9SfXfD90gFwujntLmmslNVRYapTZ5oTs7BAXc9rAUck56dr
         OWtim8Ag4JsLk0czDZBsqRAkFQcVBs6y3LYEE1snuEv0XHrjWeVsXuwzQYDereRUsrEz
         Otk0mWwa3pRihAdSKyAWg/cbzFR4MLJeNXAQLWxzemq+TvOIOssNXkO4R0EIub/Bz3IG
         Un1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=VJ968BoY2rUzhLmsHDPQEskN2/sLj9tYLwAiHbWfm18=;
        b=nRGOLumQQj80QLcGgjUnFlBm5CplHdyFFUjDVmkYZVIRYyBcPCJf4HHMVIKHnwFYRT
         3J8H7R3q49dg76MA82faB1qSK85Qd0L3TNXaYEp0dMMdxLgm6i87tao6IM8kMimzvgdB
         AKu5cTjwH0V8powraPvouvhIodIDxVUEkXL/fLz27dyhlgu/GXQbc5OEI4uz6uNO1tI+
         +VkG79HBl42tTij6ZtYpQtDELPPI8bKMAmdgR0reamibCFTeLSnrxGFIk4VIXiV+phik
         MHGZoDttmMxnm+QFTDv1InO7oo9iY0crDVmyr6FeGp1GJbzhqF9v5S6cE293SvxOYBa0
         b4RQ==
X-Gm-Message-State: ACgBeo3qNHA+ZRxpIScPHjemkor17/Ak7OYLowhx1/cYAEFBVaG2bg+z
	+ZaCP+XAklsj2z2I0uNahpM=
X-Google-Smtp-Source: AA6agR7cUWZTBQOpiOYX6A7EaMt6CjvbcvtlD61oa6kpcAIGsXGbRz+Ybp6LF76hf3q2v1MC8dFI4Q==
X-Received: by 2002:a17:90a:c782:b0:1f7:a4ed:11a1 with SMTP id gn2-20020a17090ac78200b001f7a4ed11a1mr23516647pjb.12.1660643221832;
        Tue, 16 Aug 2022 02:47:01 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id f12-20020a170902e98c00b0016bee668a5asm8578767plb.161.2022.08.16.02.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 02:47:01 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: linux-edac@vger.kernel.org,
	rric@kernel.org,
	james.morse@arm.com,
	tony.luck@intel.com,
	mchehab@kernel.org,
	bp@alien8.de,
	robh+dt@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v13 1/3] arm: dts: nuvoton: Add node for NPCM memory controller
Date: Tue, 16 Aug 2022 17:46:39 +0800
Message-Id: <20220816094641.8484-2-milkfafa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220816094641.8484-1-milkfafa@gmail.com>
References: <20220816094641.8484-1-milkfafa@gmail.com>
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

