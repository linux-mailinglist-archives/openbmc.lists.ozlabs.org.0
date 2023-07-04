Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0547469E4
	for <lists+openbmc@lfdr.de>; Tue,  4 Jul 2023 08:46:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=sJ5ni6HR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwCx25M83z3bwR
	for <lists+openbmc@lfdr.de>; Tue,  4 Jul 2023 16:45:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=sJ5ni6HR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwCvN6cb5z2xwH
	for <openbmc@lists.ozlabs.org>; Tue,  4 Jul 2023 16:44:31 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-55adfa61199so3868117a12.2
        for <openbmc@lists.ozlabs.org>; Mon, 03 Jul 2023 23:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688453068; x=1691045068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbS7rm6AM4XH8UoO3ynpeSvV1hwaSm51g+RnnML8YOM=;
        b=sJ5ni6HRmSdFcP4rsLYzD7qefh6dZC38ZNahYQDga7z4XmmjcdWJST7FF9e/ArQHaq
         4WmGTdMNjpE5mf8+5Xgev5djoutsGJntI94SBxLUS9fFqbwtdkSoz/nEzGio+/ZWQhJk
         wmvzItKUWPK+SYdWBKiLZqLXS8UO+U/3Zc0xuukmHr3lHixUMcF3i/b9vMfXJQLVlZrX
         Z0e6ismh4Nyz4giFL13D/dOs6pj7XJv6LeVhkM43Kmecs+upVazBPXFs8SvsiIcUKWBF
         DtpDUvOXb5M2brjwop6wckH1K0nI5wrPXVsxp2qeUttLl8PAUCJje8HH+k5heK/gQVty
         ijaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688453068; x=1691045068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbS7rm6AM4XH8UoO3ynpeSvV1hwaSm51g+RnnML8YOM=;
        b=P30Le4oqJWwVMNpwYUd3UgUSx+3kY1WlALneK/MANqsB0yuCwKu9KVjbAzK6g//pMk
         0hRD4MmgbSshBagVvlnp69wURDp7EQvGy9G6AzA+UPa+c+/oowwqbwW6OLo0mTXxktyT
         SR4GCVDZc82qPN4BPH7xzHQezp9fJIDK59Ip1NWG5Uw57+yI7ol/oaC3zFbNkN5TpLFI
         +wYigZ60IMcehQA1V9N4xA+eruAtm/hFso7PZBwA0k84B3trJXcczcfBU9Dik9iKYSX0
         c5tD5lRkmcAW1qKwDHs3zmWuE6OFX6NvcSiGXo9U6O6Lpsd24rKVJ3euK5AfFqStNMBH
         rAyg==
X-Gm-Message-State: ABy/qLZZDSD7BopXp3vsEX3BrSFMISJTEWy1eXgHNBioKoCPKj4vGoNt
	HGCw8eBDhn7yU8RfmAMI/40=
X-Google-Smtp-Source: APBJJlHaFp+boEpHow3asBQL1qclJo2h+8NqCMr5bAu+/83eM9Os+Y+now5vXRCrBrSP046LHxQkvA==
X-Received: by 2002:a05:6a21:6da4:b0:121:e573:3680 with SMTP id wl36-20020a056a216da400b00121e5733680mr16069056pzb.62.1688453068088;
        Mon, 03 Jul 2023 23:44:28 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id u2-20020aa78382000000b00668652b020bsm14863429pfm.105.2023.07.03.23.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 23:44:27 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	andrzej.p@collabora.com
Subject: [PATCH v13 1/7] ARM: dts: nuvoton: Add node for NPCM VCD and ECE engine
Date: Tue,  4 Jul 2023 14:44:06 +0800
Message-Id: <20230704064412.2145181-2-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230704064412.2145181-1-milkfafa@gmail.com>
References: <20230704064412.2145181-1-milkfafa@gmail.com>
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, kflin@nuvoton.com, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add node for Video Capture/Differentiation Engine (VCD) and Encoding
Compression Engine (ECE) present on Nuvoton NPCM SoCs. Tested with
Nuvoton NPCM750 evaluation board.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 .../dts/nuvoton/nuvoton-common-npcm7xx.dtsi   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index c7b5ef15b716..13a76689e14a 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -179,6 +179,24 @@ fiux: spi@fb001000 {
 			status = "disabled";
 		};
 
+		vcd: vcd@f0810000 {
+			compatible = "nuvoton,npcm750-vcd";
+			reg = <0xf0810000 0x10000>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_VCD>;
+			nuvoton,sysgcr = <&gcr>;
+			nuvoton,sysgfxi = <&gfxi>;
+			nuvoton,ece = <&ece>;
+			status = "disabled";
+		};
+
+		ece: video-codec@f0820000 {
+			compatible = "nuvoton,npcm750-ece";
+			reg = <0xf0820000 0x2000>;
+			resets = <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_ECE>;
+			status = "disabled";
+		};
+
 		apb {
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -554,6 +572,11 @@ i2c15: i2c@8f000 {
 				pinctrl-0 = <&smb15_pins>;
 				status = "disabled";
 			};
+
+			gfxi: gfxi@e000 {
+				compatible = "nuvoton,npcm750-gfxi", "syscon";
+				reg = <0xe000 0x100>;
+			};
 		};
 	};
 
-- 
2.34.1

