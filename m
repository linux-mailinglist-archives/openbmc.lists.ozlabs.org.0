Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 436704DBCC7
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 03:00:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJr1y13kYz30KR
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 13:00:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TMdefDfE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TMdefDfE; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJr0x4f8tz2y8P
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 12:59:13 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id o23so1542463pgk.13
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2022 18:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=s3REtX15upPnaASwcpch/4bkCB1kjQjGAtbk3icoBvk=;
 b=TMdefDfEnXg9fSYoW/nR7FkPzThM2vj7YfZWpJnnmWhU7GjFNC30XIdWhdxwMAV9Xi
 xDkp6kPsoS2/ooMfEiLzDQ9nP6o/WWnIVHHKM/4LMh+HgDji/nNth4KMeWWd0JZtzf1v
 H55UJrOKP6OKBs2gCo3+O5YOo/oYncJcl87HBmezTsOOtLkzfKcQUz3/90uflBhJUtm9
 SZLydcnwY3t0xjsa7EYFBJvJREjE+1QbPhWOMkd8Xc9Lp6zDhvO9FcOOJtBEXid01Eyj
 OvycwB33PUA2r0ca566SR4c4ElTDx/dElhO6VSxlnIZk+qjqkc2vsjWHSY3gQm2MYvA3
 7AhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=s3REtX15upPnaASwcpch/4bkCB1kjQjGAtbk3icoBvk=;
 b=YfZfYQTvwvJ+9rN6tKlyi6NMJi/vbC4cuLm5lNPYTfKiWhvff/SVKEuof5730DK4O4
 +RuTxtB6MI+uwizrrwJMMekhlNB7JcSdxKTRl/lduySGQtvnfoUwuCMYzAeEjpc9O21g
 PLjsUxcdh5gGur54Y1hd8TfC75N2rc5pUF3FoikBEzx9wf4SFRJ74ygu/iFT31TDEou2
 8CSxlKxUuIabLZ0SWs2C5i75eP4mQIbE3u1X1Kv/mcm5r/+95nbmbxfHBRBsqGJnJlOA
 9aKfcE4MKmn9ztWDGBdd/9pdLxGOsL0+DmrskpGmwMhVt7TQjfr99hyQasDTgnvQEedY
 DlcA==
X-Gm-Message-State: AOAM5305KoAHHjRmwdaK1gIPVQR3swRap5RBF9NsuUG5XTrZkCHpKHAk
 dc9hbHaoHxns4ds3/AuEjJY=
X-Google-Smtp-Source: ABdhPJyB3IAXLEijQfRy1kS/pAuXHeG5lluXUNlksA/nDfe5ml0jiTFgTTinaETeSbOaVCeIjshTHg==
X-Received: by 2002:a63:ce51:0:b0:362:c4fd:273b with SMTP id
 r17-20020a63ce51000000b00362c4fd273bmr1858353pgi.540.1647482351327; 
 Wed, 16 Mar 2022 18:59:11 -0700 (PDT)
Received: from localhost.localdomain ([116.89.135.255])
 by smtp.gmail.com with ESMTPSA id
 nn15-20020a17090b38cf00b001bfceefd8cfsm7945528pjb.48.2022.03.16.18.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 18:59:10 -0700 (PDT)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, ctcchien@nuvoton.com
Subject: [PATCH v5 1/3] ARM: dts: nuvoton: Add memory controller node
Date: Thu, 17 Mar 2022 09:58:52 +0800
Message-Id: <20220317015854.18864-2-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220317015854.18864-1-ctcchien@nuvoton.com>
References: <20220317015854.18864-1-ctcchien@nuvoton.com>
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

