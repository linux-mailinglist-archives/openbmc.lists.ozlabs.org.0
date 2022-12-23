Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BE1654BC2
	for <lists+openbmc@lfdr.de>; Fri, 23 Dec 2022 04:31:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NdXlB3xCmz3bW0
	for <lists+openbmc@lfdr.de>; Fri, 23 Dec 2022 14:31:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SK/wRJeE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SK/wRJeE;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NdXjZ1jZ5z307C
	for <openbmc@lists.ozlabs.org>; Fri, 23 Dec 2022 14:29:38 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id jn22so3785950plb.13
        for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2022 19:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/rJpdWzIaY9d1c2EPyFR6eEs/FbkRXh+i26sis/kko=;
        b=SK/wRJeEnjG9XTKlKKVDmw9UOLZs3kaFkZd1Zuxq+hfvIf1F7tBQwCSnjXRTkSsLJl
         xrfcJyu6PsWdCT7b1SloQtIdQpUW1LtaLtIbMOb67VIUpFACmenU+/Eum+38Au9dwq+x
         5HhfTlKUfg/UaaGXai/Rjihun5iM3+ABXg9pshb7tYQNA4moHf/Tbz+gk1I8zCnXwSh2
         RSCc0AB7qHVZ6JKrFo8HYmiUE2ChxBva/co2bsDrenIzQxt57dQsW/2hW8mqc4dGqnkF
         VpLMUJyJj4cRw79bz5JKHfYn2cWlnanyHsSiiMKh56QXHciYQI1acWHp8dU5ylK/JwS4
         qTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V/rJpdWzIaY9d1c2EPyFR6eEs/FbkRXh+i26sis/kko=;
        b=MKd0Qo8pWMol60jynAPtDQAyd7TcZlEtR+oL357D48lrzXVH1UXiPT18AwWjG64oUw
         gxi0euvFW6iqJY7a2kdqcESpIoncZHqHjrmnbm7ZG9AT49kQye5mUHOWkx91s13V5Quw
         k6dKgJ6UYVFNYOgMnW0wQr2pgYQ6dT7bC3JzF/gFVx7r/+bBc/cgCawFDP53eBF1BA+Z
         Z6YGd00tAIgbuO5waCICEeInOSib6k2wMEqNqqX4iSF/eIXzJm2JRqzhx//2B0AHczup
         /uKwgMyHRUaOyVba+0LOfDAgDuatTffQFlx+QnWyNqijOH+YDaKp/XMETLxHdR0gmSZV
         SOag==
X-Gm-Message-State: AFqh2krBK5Ex0dYWhh1uduGStuEHBI96EkgHjtH/yYV/wjIL+rZxUOSC
	Qv2XEEnegtT/EQpAnD2GXp0=
X-Google-Smtp-Source: AMrXdXv45rm1v+XCWDM7o/5xmwHkciOA779S4Um6cM+38t7bt2rNOgQgNOZTlJFSoBENSWU7mWHeXw==
X-Received: by 2002:a05:6a20:1b1d:b0:ac:5429:e609 with SMTP id ch29-20020a056a201b1d00b000ac5429e609mr8422226pzb.32.1671766175897;
        Thu, 22 Dec 2022 19:29:35 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id w192-20020a6282c9000000b00575448ab0e9sm1376854pfd.123.2022.12.22.19.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 19:29:35 -0800 (PST)
From: Marvin Lin <milkfafa@gmail.com>
To: krzysztof.kozlowski@linaro.org,
	robh+dt@kernel.org,
	bp@alien8.de,
	tony.luck@intel.com,
	james.morse@arm.com,
	mchehab@kernel.org,
	rric@kernel.org,
	benjaminfair@google.com,
	yuenn@google.com,
	venture@google.com,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com
Subject: [PATCH v17 1/3] ARM: dts: nuvoton: Add node for NPCM memory controller
Date: Fri, 23 Dec 2022 11:28:57 +0800
Message-Id: <20221223032859.3055638-2-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221223032859.3055638-1-milkfafa@gmail.com>
References: <20221223032859.3055638-1-milkfafa@gmail.com>
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
Cc: KWLIU@nuvoton.com, YSCHU@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, ctcchien@nuvoton.com, kflin@nuvoton.com, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add node for memory controller present on Nuvoton NPCM SoCs. The
memory controller supports single bit error correction and double bit
error detection.

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

