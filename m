Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D446535BE9
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 10:48:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8dks5hmkz3bmL
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 18:48:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dABeN5Ih;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=medadyoung@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dABeN5Ih;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8dhr3DRmz3bpy
	for <openbmc@lists.ozlabs.org>; Fri, 27 May 2022 18:47:08 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id u12-20020a17090a1d4c00b001df78c7c209so6562553pju.1
        for <openbmc@lists.ozlabs.org>; Fri, 27 May 2022 01:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1jpCtih8HJgyW68o6KR64V8GJ0VawxK3es6v7QRKyJw=;
        b=dABeN5IhaNbT0d/E0jQ6AQ+j/QJ2a/m+7l8zd3WnZsxikFHdXpKZ/l5IYlu7MISXy8
         pH1PdzQ/aY9uvdYdNicd8qSKn4x/McWBOvcwpwEZ7tquvUyTax5relYVFD+ScaB4eVpU
         iZAbCp/rbiWxE/XUYqqWoPF+95qJWaDEbRIuP5W1NvJAl9lqHTGJJBrmauATwFtNJaeY
         3GHtjEH1zTnINj4jvLbqyR+03jv6vOkUQnp8tbUVItc3v7HYcyOiWxfarWfPC1Dm5yEy
         PHcSN6B7uSI2LXPhqgmUoS6o1LmBRAJDaQbeDMR7XnUKrc8RsVtS+PkI/lLuCr+/InaS
         YkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1jpCtih8HJgyW68o6KR64V8GJ0VawxK3es6v7QRKyJw=;
        b=nCkp5BC2gVarlWzeGwmU02a6VssI1xh0gq/qDRsHvFceQOhUlA7IyVAyTrV0OObUK3
         DJldWoLN4wNX8JnWU0NnF+SL/eQcl7ukdTpAtL0PYtnrmAlvSpAXB4f3j6fPOfpSRVb/
         T5Gc+NO5KOyxVmR5K4sOVAuqZO/DPEp5c67HWBzL+bdESlr1jlnZAq+zf7mHjJiLDREH
         1b81OC8HAuM4lVJX99uq1LkwCVpi2p3aIaNRNYih0Tv3gXkQqjaQ4q61hTMayHi+VUKj
         xac1/89i1D8YpHHWT33JKbjtMBBJJOQXrWf8b5CdaGeb7cten2SQwMESgZ5aU6w8vL6U
         fo0w==
X-Gm-Message-State: AOAM532GoDRucwOREqP/TmLWA7TxFnbw2mLbLZPBLZ4r3bwSr7iJ6nt0
	FvumBZY/xsImzItHGEC4eYI=
X-Google-Smtp-Source: ABdhPJx6GvW0RO3NwO0M/fzfJ3EnUsw1iHAYB7WXItKjDWOstPlptVPAkObWMd/Krn0l+S7ZVFGHSA==
X-Received: by 2002:a17:90b:224a:b0:1e0:f91:3a3f with SMTP id hk10-20020a17090b224a00b001e00f913a3fmr7217159pjb.62.1653641225636;
        Fri, 27 May 2022 01:47:05 -0700 (PDT)
Received: from localhost.localdomain ([116.89.143.231])
        by smtp.gmail.com with ESMTPSA id k12-20020a170902d58c00b0015e8d4eb1ebsm3003254plh.53.2022.05.27.01.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 01:47:05 -0700 (PDT)
From: medadyoung@gmail.com
X-Google-Original-From: ctcchien@nuvoton.com
To: benjaminfair@google.com,
	yuenn@google.com,
	venture@google.com,
	tali.perry1@gmail.com,
	tmaimon77@gmail.com,
	avifishman70@gmail.com,
	robh+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	a.zummo@towertech.it,
	KWLIU@nuvoton.com,
	YSCHU@nuvoton.com,
	JJLIU0@nuvoton.com,
	KFTING@nuvoton.com,
	ctcchien@nuvoton.com
Subject: [PATCH v3 2/3] ARM: dts: nuvoton: Add nuvoton RTC3018Y node
Date: Fri, 27 May 2022 16:46:46 +0800
Message-Id: <20220527084647.30835-3-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220527084647.30835-1-ctcchien@nuvoton.com>
References: <20220527084647.30835-1-ctcchien@nuvoton.com>
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Medad CChien <ctcchien@nuvoton.com>

Add nuvoton real time clock RTC3018Y in I2C node

Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
index 0334641f8829..d59fcd558665 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
@@ -202,6 +202,10 @@
 		reg = <0x48>;
 		status = "okay";
 	};
+	rtc0: rtc@6f {
+		compatible = "nuvoton,nct3018y";
+		reg = <0x6f>;
+	};
 };
 
 /* lm75 on EB */
-- 
2.17.1

