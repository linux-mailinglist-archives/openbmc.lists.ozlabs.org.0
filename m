Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC115AAB63
	for <lists+openbmc@lfdr.de>; Fri,  2 Sep 2022 11:28:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJszs1ZMXz2ypn
	for <lists+openbmc@lfdr.de>; Fri,  2 Sep 2022 19:28:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JldIlUqa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JldIlUqa;
	dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJsyL29jxz2xmm
	for <openbmc@lists.ozlabs.org>; Fri,  2 Sep 2022 19:27:38 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id f12so1261174plb.11
        for <openbmc@lists.ozlabs.org>; Fri, 02 Sep 2022 02:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=5QZAVY6PtM/UpT2AqmdEYUtNqMVpy95nBAyLFnaLaDs=;
        b=JldIlUqaOwQcgjZbTKgSvf6/UuDaDHa8T9vLQU8/w6tbTd3pk8fhQie7WjkNMhIXMx
         hQuc7uwMiX9g0E9iZ9Ox8pw5NjOJBl9d8+2z4zAPwKZ/HUVEpU3thuu6ewp8mCWZvAtz
         l41CRKOBsvoetLap/HYcN/8xHzqnQRekxZkcPa9GPWpEGDTbcAqH5K43jQAj6ttoPdbN
         51bAJtFskRMworNKcgKTYVgRPnw0e6ZTn043yR+b8geSXLhW2jvIllM/C8/fAVnyTIM5
         fllIdXOob54U9xfeFfmG/STlT4QzKNeazdePwCi6OycmsY3U9P+Sav2kd8r8rf6JhfsI
         iRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5QZAVY6PtM/UpT2AqmdEYUtNqMVpy95nBAyLFnaLaDs=;
        b=qd+onIcgQc8fTozaG1K5Q42CYIhR1q/dV0rn7pjz6csjQSRmU7g7/9t2Cc86w35iof
         2xfamqHxw+XzerCpooLMOcwHPz3k7G4XcEMsE+nM1G6YYOeSpOZtsl19VApP82j+xFdW
         1AJzgLcFDeNVRmwbA3VdVUmOLn2WT3ylYVs9pYLb0df/5Y177+BTeyTRVXuOxg18TNE5
         I+cfvOvYJOFaF+W57stvBFb3Y0Qw4cKXwcXoy0oPqKj7MGzqXE6tDwIuxVeAajQPBWDN
         r4uxeZMrIn6evRTCsXlKW5WCo/UMrGUm7fqEVj0iTRfAZRiKLoki2tLjcF0L1RJEV1k2
         pjsg==
X-Gm-Message-State: ACgBeo135qlCyuiIccobG/DrB5rn+E1KWlLpViV1lG9LWrcBIG7O+2WZ
	HysxO4/TR9uklz1oLJCO5Bo=
X-Google-Smtp-Source: AA6agR42oHmxraepUihQpdHUzAKLeBHv7VvYtEUbOz9GzLUaTxRE8KShE5PZ5/F7NLx/4oyi0NInvQ==
X-Received: by 2002:a17:90b:35c5:b0:1fd:9087:6a70 with SMTP id nb5-20020a17090b35c500b001fd90876a70mr3940310pjb.158.1662110855969;
        Fri, 02 Sep 2022 02:27:35 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id s62-20020a625e41000000b005350ea966c7sm1169315pfb.154.2022.09.02.02.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 02:27:35 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: linux-edac@vger.kernel.org,
	rric@kernel.org,
	james.morse@arm.com,
	tony.luck@intel.com,
	mchehab@kernel.org,
	bp@alien8.de,
	robh+dt@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v15 1/3] arm: dts: nuvoton: Add node for NPCM memory controller
Date: Fri,  2 Sep 2022 17:27:12 +0800
Message-Id: <20220902092714.3683980-2-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902092714.3683980-1-milkfafa@gmail.com>
References: <20220902092714.3683980-1-milkfafa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
@@ -179,6 +179,13 @@ fiux: spi@fb001000 {
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
2.34.1

