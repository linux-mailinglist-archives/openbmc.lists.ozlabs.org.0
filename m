Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F23C151819F
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 11:48:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KswBx60SJz3bcV
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 19:48:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZVT8AQlu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZVT8AQlu; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ksw9t5kwcz2xKW
 for <openbmc@lists.ozlabs.org>; Tue,  3 May 2022 19:47:46 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id r9so14842583pjo.5
 for <openbmc@lists.ozlabs.org>; Tue, 03 May 2022 02:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=J2a0MMW50oXViY1edzoxXF0rBee0FZ1e4ZEb2hYnjXI=;
 b=ZVT8AQlucwe/23CKJqCvDeAOwvBQmFf2sB/YvwjGyava+dh/iIFUFZqi+DSwQS7mUF
 BYh2LGYWin3cben2xVbBLQSFxJeN/I35iJlTthKId8oah15vmEYse4VzPThPuBmQQgtZ
 395+NMvms9eAq8jXn0ijruZZNonp4UU5AtGDounPl/xtBzQkR9CsUrDLmQy+3XGReDSD
 N5T8ohxbqR3CjamOuq0a5755lGRJBk+UWqOTGpVoBSv4I+5tpnI7YdOLSE8+ZBB6Y4DS
 yZ4bftTBsYeLIHcUkj+9X2S/q44vIdVWwFbNBnL5u8OP9eTkEM3q/OUzljCAFXXXPY6k
 Eidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=J2a0MMW50oXViY1edzoxXF0rBee0FZ1e4ZEb2hYnjXI=;
 b=c4BkVtzNTSNqWxAqu/QPkwenaeTV/bmlSlcfsNUFC6W3eFGmdvyi0yZFYynZin6qle
 15LwH2oLn4AJ6O8nT10KzvVWun/VXOkeV/4iSmPhCWSU4BOuUAoCMOZW92VW5nrjUGAx
 zniYlXdYwMZnIt4MyEH8mrmg23AtOscJRJqSQ0Tt1RyTfCt4TbFn0sH+3vRXwYX5fHPF
 vBlbExieXNjbCDPkwM/X3x6qHaQV2/01r3N/huIAf3kVrY+tPK44oa95DmFRxqmKnEwJ
 T5mkNtIpByUh/M41/ZzVjH9EnvKY0miQQSjsvO5GZ8jotx/svK2jTHmFdyq1MsW3O3SS
 /BwQ==
X-Gm-Message-State: AOAM532xWezUepjtBbA6FkDbT2/X3OMnUIP43iwAm1LkeDpreIKuzn7N
 CLeKiJzFPS4ZPCzqk6whADo=
X-Google-Smtp-Source: ABdhPJzQmrPhiXDWSjASpCvUdxfJ6WR0xMjmoWJ3JOnf9QPzNoa1uQr5bmajgXycXfYA4X7Xr5rdlQ==
X-Received: by 2002:a17:902:aa8e:b0:158:e94b:7c92 with SMTP id
 d14-20020a170902aa8e00b00158e94b7c92mr15858104plr.126.1651571264172; 
 Tue, 03 May 2022 02:47:44 -0700 (PDT)
Received: from cs20-buildserver.lan ([180.217.147.224])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a17090a421300b001d90c8b6141sm1015222pjg.53.2022.05.03.02.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 02:47:43 -0700 (PDT)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, ctcchien@nuvoton.com
Subject: [PATCH v8 1/3] ARM: dts: nuvoton: Add memory controller node
Date: Tue,  3 May 2022 17:47:26 +0800
Message-Id: <20220503094728.926-2-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220503094728.926-1-ctcchien@nuvoton.com>
References: <20220503094728.926-1-ctcchien@nuvoton.com>
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
Reviewed-by: Borislav Petkov <bp@alien8.de>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
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

