Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D68A509787
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 08:29:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkSM20cYBz3bWm
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 16:29:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R54cezI/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=R54cezI/; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkSKy64YMz2xZB
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 16:28:54 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id iq10so307430pjb.0
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2022 23:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=J2a0MMW50oXViY1edzoxXF0rBee0FZ1e4ZEb2hYnjXI=;
 b=R54cezI/TzlUp+E6pXQAmw5yUojZ7Rh/adS5QJm9OuEnpDia5sL+2xhX4np38Et+QM
 oe05M1HSglIQIAwCi1SvS670xlCwCbGkH9CqftMfmpPsFhCghPZXjJmsFWpI2InDcbsh
 DwSpsQJ+PW1rBu7JrAdw84uT2Fm3NFGhiIO+2osxlNLSfKyxV7KmKfdExS9X8r/sgXqr
 6pJRaPuKlAu6a5571OmY/maOxm80No8QBTbNoZ8x3pHc7Qmcr37t3CC+N/aKKlWRCGdx
 c4uJWfOYDq2ZB+4OIv/z3gXxjTJsADjmFtehVuZqrLvl0/J8YE0srN0PYNKUYPw7KHa0
 FNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=J2a0MMW50oXViY1edzoxXF0rBee0FZ1e4ZEb2hYnjXI=;
 b=5mizMKrBCbM24/fITDcfLKop+6A6IxDTTamq8+i2mLpjRQoWcaKswdiB3o0lMQhyPV
 +lwkHPRiA4Lh61HTo+xoNj47rsVqW0Uc24sJTMJIXTbaPvQcGf1tY/dMX/We6BZVIOfz
 L1sl0Hmry3AhoxctFCA3b9/Kwb6gNKhv/cWym7f6EG43QeBFO4SY2/RzeacNxlduJy5t
 ZLVssYtobXh/kwlzrthuIfatBsgg1iiU8geuvoO3MoBjJW7QiR1OuDPFo8pqYqzcEVr7
 ClGsj+9T72zUwPC1yc/xhSerWdfqkhsA9S9SkEC95qoWhdJWGKXtetfSzVOQ7wJqRugx
 OJhA==
X-Gm-Message-State: AOAM530KMh53t7xpK/aMCQgxKYvorAfjESSd1hNOaad3kuT9NWRLJbF6
 z4O/BRSuu0H3j4HvSZazWFU=
X-Google-Smtp-Source: ABdhPJz2mc6NvIPZCX18YFDJlxDUGPRkzTSoFcrVSseegzz7vvHoVhXryWneL2P9HbYKwJ9ZYEFvGQ==
X-Received: by 2002:a17:902:da8b:b0:158:fd5f:2b35 with SMTP id
 j11-20020a170902da8b00b00158fd5f2b35mr17721269plx.42.1650522531988; 
 Wed, 20 Apr 2022 23:28:51 -0700 (PDT)
Received: from cs20-buildserver.lan ([1.200.153.245])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a17090adf9700b001d6e0fe8d28sm273305pjv.22.2022.04.20.23.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 23:28:51 -0700 (PDT)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, ctcchien@nuvoton.com
Subject: [PATCH v7 1/3] ARM: dts: nuvoton: Add memory controller node
Date: Thu, 21 Apr 2022 14:28:34 +0800
Message-Id: <20220421062836.16662-2-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220421062836.16662-1-ctcchien@nuvoton.com>
References: <20220421062836.16662-1-ctcchien@nuvoton.com>
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

