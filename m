Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1F564E7CE
	for <lists+openbmc@lfdr.de>; Fri, 16 Dec 2022 08:33:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYLSJ37hzz3bYD
	for <lists+openbmc@lfdr.de>; Fri, 16 Dec 2022 18:33:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iy7gtqzY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iy7gtqzY;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYLQf4lcbz304s
	for <openbmc@lists.ozlabs.org>; Fri, 16 Dec 2022 18:32:10 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id w37so1215610pga.5
        for <openbmc@lists.ozlabs.org>; Thu, 15 Dec 2022 23:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/rJpdWzIaY9d1c2EPyFR6eEs/FbkRXh+i26sis/kko=;
        b=iy7gtqzYwFpbrFJZ2i574V5yNAE2LG7GKTuXah46/YCfmlTFEZtKynM91LuatD2Rbl
         Jd79k8VsIJxutcLx0hKZKkhPK8XyakhIIVGL4Hos6QZqztVDMAuj3RziEKVqsmsoCaOD
         hzm2cR9g90qtFeIyRKLwnMQiot3hYQi5tc2J7uxl8rXIAqcRUYCLthfqyjzffE2dWP5z
         /fcZYRhPvSMTaTrRwmZJq/WD9GX3pzSVfWfItJ5nD/mca3lKp8c2pdpgPSdMRN+qjDka
         G3zWrYLC6nR2TUBqrbdiKnop2ztgvFMAJ4dBjAaHd7PaV3BQjAw/OKWNhzLKASlskB/z
         2odQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V/rJpdWzIaY9d1c2EPyFR6eEs/FbkRXh+i26sis/kko=;
        b=eSZOU8dXOXyZbCvFNJ1O3IklqGdAGzj3VBfRQoHS/XeUPckpwErzTMNc0wGYoAmZDJ
         EvjQ1t0dQWi1fCupZqfsyleLktt68fwK7MhjlYt0/m2zPyvGTqGxstd69H9N12B8ulcV
         QkVZzJ06dfQCSkJt0VejSePh6IxN03RV2CovoSYZVhFcCefXuPszdR5JHm7msbs1Mg6C
         HDJDXEAuovCBcby6sC6nGqXcKokUpbv5FcoWsF9aYR9khXV3phpkaH2K5SnmvuMg3Fxf
         9NRaHIJYxe2fYuIDRZsUsj1YAq18W6kw55n1d5Dz/DVRsszlPzMlHgv4kKRaoJ7vRZ4t
         DLtA==
X-Gm-Message-State: ANoB5pnsYLN1v1XkVL2KiAglYeNLReRuL1KvA0dCFRYT2ANiXKbVjnxt
	9BeHnNi2pSu89Z/BSxsYmaE=
X-Google-Smtp-Source: AA0mqf7auwliSwA6t25hCI7z8wM800mt93XecjPKTKJeQL8XeD+TgTEvagUGm1LZ8enEDLc3SBOeHQ==
X-Received: by 2002:aa7:910f:0:b0:57b:5770:fd7e with SMTP id 15-20020aa7910f000000b0057b5770fd7emr11239315pfh.1.1671175928285;
        Thu, 15 Dec 2022 23:32:08 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 193-20020a6217ca000000b00574cf11aaf3sm770123pfx.208.2022.12.15.23.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 23:32:07 -0800 (PST)
From: Marvin Lin <milkfafa@gmail.com>
To: linux-edac@vger.kernel.org,
	rric@kernel.org,
	james.morse@arm.com,
	tony.luck@intel.com,
	mchehab@kernel.org,
	bp@alien8.de,
	robh+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski@linaro.org
Subject: [PATCH v16 1/3] Arm: dts: nuvoton: Add node for NPCM memory controller
Date: Fri, 16 Dec 2022 15:31:39 +0800
Message-Id: <20221216073141.3289309-2-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221216073141.3289309-1-milkfafa@gmail.com>
References: <20221216073141.3289309-1-milkfafa@gmail.com>
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
Cc: KWLIU@nuvoton.com, YSCHU@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com, ctcchien@nuvoton.com, kflin@nuvoton.com, tmaimon77@gmail.com
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

