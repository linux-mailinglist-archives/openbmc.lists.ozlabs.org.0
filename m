Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FBD66578F
	for <lists+openbmc@lfdr.de>; Wed, 11 Jan 2023 10:34:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsMw00pQSz3cdG
	for <lists+openbmc@lfdr.de>; Wed, 11 Jan 2023 20:34:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PuwOwmy/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PuwOwmy/;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsMtL3FVmz2xH6
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2023 20:33:14 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id cp9-20020a17090afb8900b00226a934e0e5so3237956pjb.1
        for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2023 01:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/rJpdWzIaY9d1c2EPyFR6eEs/FbkRXh+i26sis/kko=;
        b=PuwOwmy/u+HrxevdZjRX5deiNgIKXyH+IEixBVNqDoCHCU8DNlbvQ0w3csiuzeeRET
         XVKBngCbVEaJTjuKU5s7p22DnatmncfhOLyicBCD0X/WqkPFPRJmyhhAyKhNdSFLjHO9
         v1Y5vbPQZmi0tj4wjb0883cDT4tkXn2aWwDuXZtXsHT93rtwyHCpsVqxmRC7e8yA9938
         7EjlsQLTVQapdpbML3tuOMmYUvYMLUCM7NMzK5AtBptRqEwsXDEceJd5bzfmFFQOPA0U
         NvD9KGFMAM2c26JuYuAyKMn2pKvOrKlIuHvgqQYYUPe6T0xhyB+6jL1dmgRlLuf0pqOL
         2gKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V/rJpdWzIaY9d1c2EPyFR6eEs/FbkRXh+i26sis/kko=;
        b=U4iWIoMziwhizXY14Ebt3KVpGzCGzPVKf5tSEkdkCOxzOb7WH6uSpPrJmFwd9j8PNY
         XS2aW+viUGloJVjPHhLA3KsK203trPQ5PQnIO9bqleJHifgn9s5rshNHs85nOd/Od5F2
         YoceJhFqOCcjfcZHLxrOpy2+sXLEsm8oOzRuUoZEk7D9XItw3v/n+H2/g8Szvr+viV3h
         3WVNlJyxZLZyRt4OCNBbvdz2vWo+ek18ceMb9HcrsuAsFJ5U1F9t+0VDQsmheIu+mhED
         XnVsaOnWicOSeK4TRdorNjvrbUez0spq8RyEsewzznrzWWouOu3zdiECds+HuqiIhdOy
         DIwA==
X-Gm-Message-State: AFqh2kqkSS9RWJsFvDTROLcLcf66LojyDTQmOSe5k/48GDReR5smwFP3
	jB0gzAsGhQtKCoaMHax/gl8=
X-Google-Smtp-Source: AMrXdXuABVDv8CvIEbPtZ37RZbF6M6ibvQnFCYocTUZGQ8CZX64i+RSx0EueHceCmkpJhXDpIWlx0w==
X-Received: by 2002:a17:902:b713:b0:191:2a9c:52a1 with SMTP id d19-20020a170902b71300b001912a9c52a1mr72544630pls.19.1673429592130;
        Wed, 11 Jan 2023 01:33:12 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id u6-20020a170902714600b001769e6d4fafsm2001341plm.57.2023.01.11.01.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 01:33:11 -0800 (PST)
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
Subject: [PATCH v18 1/3] ARM: dts: nuvoton: Add node for NPCM memory controller
Date: Wed, 11 Jan 2023 17:32:43 +0800
Message-Id: <20230111093245.318745-2-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230111093245.318745-1-milkfafa@gmail.com>
References: <20230111093245.318745-1-milkfafa@gmail.com>
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

