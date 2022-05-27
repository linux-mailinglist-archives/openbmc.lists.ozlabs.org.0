Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ABC535928
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 08:13:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8ZHg6RwBz3bmF
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 16:13:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lmx3tX9k;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=medadyoung@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lmx3tX9k;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8ZG132TDz3bmV
	for <openbmc@lists.ozlabs.org>; Fri, 27 May 2022 16:12:08 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id i1so3310520plg.7
        for <openbmc@lists.ozlabs.org>; Thu, 26 May 2022 23:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+4CVCMjz+0suAt8V5Y2817Osc9g0YmAmWa1n3bUS86Y=;
        b=lmx3tX9k6AOSJoTkQGbpLdrtvI5ZaVwsxfP8bjVoTWLSo1dHqzIeYMJRHxhuk0UJT+
         gBjA2TGNxuz/p2KTF/x+Tcg0akDRYfKBeBc6Jt6UBetR45v0/ZLVkXhI7pK/xG9fynEK
         DU04BZDDEE4e2R66ds4FvQsDr/5pW3D1wTcCbopRTWTCWk8NE7f6mQqgICtPonOwvUKF
         WSzPseu2Aqv/1rpB81PkZ8b+z4f4NbRYt4+NBs/jYsu0nGrzTmgPR+m92u1gjUxb3PFd
         wb2KIEuBDEpdhA91CF7JrEGR7NRs5oIfiH+ap/jdB8T24hVIjwoTrGZI+xrqatKuK5+U
         SiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+4CVCMjz+0suAt8V5Y2817Osc9g0YmAmWa1n3bUS86Y=;
        b=yWCJZ0lto8d69L5+7xTQxTos9sapVIqk79CD5NYq5NHGwQSdAuEBz9nzOds2BIU3qF
         8g5JE04uW6yGNYa6yi4HoqaM+jgwnWUalldBTYDwm4FtOeiKCv5jj/D1i4RGpsyQ43a/
         5BHvQT/FQdH0USpAQNx9gY6s4MmlJ2wcuoYSe2cQRRLj3V9CM0jjAvmP0IXscV2t6xjm
         EZ+geigE3yUC+KcohYya1tKU3pIjwa2AZI+LoKitXazcmkNtq6VTLSCzfESbAuvk6Zhd
         Z9a+hSFuoyScyZVW8H4AA5njQ3CaH1Wrthufz7ntySDQ7YEaPpcV0LJsHlTDzd4y0V64
         Yubw==
X-Gm-Message-State: AOAM531dXJLdUxmdN718RMJYwoWr9AeG7thexAP6XENLJNcK5LG0paRv
	XwQzfGHPHCx8K8DHr5Jn1Rc=
X-Google-Smtp-Source: ABdhPJwtkCLtZ2CB5urQeAYdWHsx1ni1FVx1r1wiewSN4VgwYDNIbHlVcbXShbFrKd0rLdmjAGETgg==
X-Received: by 2002:a17:902:d501:b0:162:4f2d:d32f with SMTP id b1-20020a170902d50100b001624f2dd32fmr14935527plg.6.1653631926577;
        Thu, 26 May 2022 23:12:06 -0700 (PDT)
Received: from localhost.localdomain ([116.89.143.231])
        by smtp.gmail.com with ESMTPSA id b10-20020a1709027e0a00b0015e8d4eb2c2sm2636306plm.268.2022.05.26.23.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 23:12:06 -0700 (PDT)
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
Subject: [PATCH v11 2/3] ARM: dts: nuvoton: Add memory controller node
Date: Fri, 27 May 2022 14:11:47 +0800
Message-Id: <20220527061148.14948-3-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220527061148.14948-1-ctcchien@nuvoton.com>
References: <20220527061148.14948-1-ctcchien@nuvoton.com>
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

