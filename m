Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 687CEA8AC91
	for <lists+openbmc@lfdr.de>; Wed, 16 Apr 2025 02:18:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZchT0686wz3cQ4
	for <lists+openbmc@lfdr.de>; Wed, 16 Apr 2025 10:18:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744762705;
	cv=none; b=S0MDmoDRTi8m2dryP+HcRWuRStb+7XOyZnluvYZ30BBFfA+l0ToIBQYbUtDreNRG7JfF2XCmH7LcGWjo9lPIP8fsiPkB56brAw/4w5gVE00Ew4z+0YPjV48U0Qtk1B3QfOgt925asrh8zy6sI2a0e+exP0pJwjQa25jSgcU9+mBhIxDUSvuGn/Gf54cPTAB2qxhERuwlBAyWlBzQ5p9RYxtJ1D9aVoJaUHx7HWadPXgt+4ptKOe20M6GGb/r0l7txo9kQeePWmDaByy3AAZf/1yg1LKJDJDhOYo7/cVDD32/Zy2b2KpzwB/xiI2YszlqGV3wlIYPw2GeLQReOeJNFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744762705; c=relaxed/relaxed;
	bh=FHHVQpsIbnuDeKLq5XWbb0Gf2JvVP4rP5NZ4ZE1yCzU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nQpQ2tK5XF3AlthwYydn75nyU141FOVhXBJTfJyIlESyauSu4i1U/3/nW4fVvIES4NRcX5CQMK1x6vCFZO5bIYts4T6CJrNSl1++WpdCDVP88kzs2f3/C4dFdYwuMbIDuIVk/r7r9yOZTXeRCIqoIe8LaNuuOddrFdCtgZXv12hzPOV/PBbASz+pZ8sVarxr+/YKuZcIKmKM3YocxPJvwDAY+4TkdjcB6Ll1rdwtAYy8Dl5VmK4aRKijg31zUEFW2wxjy07+PuP8eRLt+yrH2kUQdp6CoGFGCDsUw/nDwPiKO16rgGIV8T8mjseeI+T7oBIXl256rX+9dNXmEA6e+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=l/gNcf1J; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=l/gNcf1J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZchSw6VDVz2yYq
	for <openbmc@lists.ozlabs.org>; Wed, 16 Apr 2025 10:18:24 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-af91fc1fa90so5661238a12.0
        for <openbmc@lists.ozlabs.org>; Tue, 15 Apr 2025 17:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1744762702; x=1745367502; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FHHVQpsIbnuDeKLq5XWbb0Gf2JvVP4rP5NZ4ZE1yCzU=;
        b=l/gNcf1JjhDGd/1LE58KcBGTl+G+Wc6rtyvvgr8g7UQwaCq4jxDW59o8Ghidy0Qi0w
         PEgOD04CT7nMpwInZHLaQPFRifdNS4JZsHanhA+l5P9pcR+AIkKzmaw0C1Acfi1nW2Ix
         cK0yzws7R7u1eLXw6SZT5eSZNLEKZZ2HYxWt9WVVfHCK2rsnJOCts2UB2ULopkocUnZ5
         gvJPrjXF1dKvfillarJ5lC+rnLoqu/yihA8qDfUHE47ozWk1yEjTlVMmF4ODFoJc1bvw
         0eCB26BQqIVCHeZtEX3Chp9I/3WDC0GLJZpme6pnlvtQOq7oelc89Rl323UKHZ09tXp7
         wgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744762702; x=1745367502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHHVQpsIbnuDeKLq5XWbb0Gf2JvVP4rP5NZ4ZE1yCzU=;
        b=s9YJArmg6nILMN0XsFMQqPKrEhsgEsXXzme1u4wma8bzGAOKiK0ks3TAkQJjQg/KiT
         pcrm5P9KKoJI2wj0E4WdvUxsk0FtqH3t5tOmrb+XxbflWUF/xhXVcd2QdW//w3YD7IbL
         mR6/yyH6TOcFt+W0qgOkabX42ITb9iGK/CFF99JdfL8jvkiSwOzQtsY7n1yMFyTKLOBv
         AM2Jg6zl8nM4Semrr70pOP3tTbgweHAUZVtY3q0GFA2XZsKsAw8nMR/mTHHq6aeLRN8k
         zcS1mhemJNK3svjXEVVNdOUG/aD99XCrJAfSxKTnC+vhyhp0/32mHQROOcO8Tck6R36f
         qqCg==
X-Gm-Message-State: AOJu0YwGXR/aI9D+DpikWihJ4RETdYxRZzmsGVOe8wFiRdl20HtteFzN
	GLV8PtlhyTpQ0fETkLT55GzQ/eb2gzd5FngpikzEvS7DNw82b7llCrmJOtPkOvw=
X-Gm-Gg: ASbGncsW9sulk4GWJbTPJKBzEI+hMLNUoKjmvM3VeLiBdi80QzlAzmAzSaIJo4Cgx3m
	e/cQAvYxcYsdGLythPktiTf6F0x/3kuwcojrPnBvYdypWuT6uv7LSRz9/KoLt1dzC74q0zMVAW1
	BUG65iruc+MDP8QZm7b5hvcW6mAxj3tjqrL7SyRaKzfh5SNjh4OOc1o5TOIXrVTuvuQi6NyMe8e
	QXiNpKwnxz2wEmMy9MnwMQIybQQ9YyVYwUh+ji7VZeHFCd74uxL0ZFFLo0FYYman3HD0KmguBVQ
	tKozgRWxVvrMlKQVqBb1YMhM6oyMEWtF1aoqp+GRqj6PoQqJNY/mOZrP4eB89pR6JOBvOs79alp
	9MbO8LsEh8qLQPOvyzEVxpkxtZqNrGhcnXcSHFA==
X-Google-Smtp-Source: AGHT+IGQXrJZHPMM6LWgvsAdy/QqF14UAcREUTDQh9qmmvkciafZVu0XO4QDGktN8+p6wVAyj4lUMg==
X-Received: by 2002:a17:90b:2b88:b0:301:98fc:9b5a with SMTP id 98e67ed59e1d1-3085ee93fdcmr1396898a91.6.1744762702268;
        Tue, 15 Apr 2025 17:18:22 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:ef0:9d76:c8a5:f522])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613cb073sm211726a91.45.2025.04.15.17.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 17:18:21 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH] arm64: dts: nuvoton: Add USB Hosts
Date: Tue, 15 Apr 2025 17:18:18 -0700
Message-ID: <20250416001818.2067486-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, "William A. Kennington III" <william@wkennington.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The npcm 8xx chip has 2 EHCI and 2 OHCI hosts with driver support
already existing in the kernel.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index ccebcb11c05e..b2595f5c146b 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -63,6 +63,34 @@ mc: memory-controller@f0824000 {
 			status = "disabled";
 		};
 
+		ehci0: usb@f0828100 {
+			compatible = "nuvoton,npcm750-ehci";
+			reg = <0x0 0xf0828100 0x0 0xf00>;
+			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		ehci1: usb@f082a100 {
+			compatible = "nuvoton,npcm750-ehci";
+			reg = <0x0 0xf082a100 0x0 0xf00>;
+			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		ohci0: usb@f0829000 {
+			compatible = "generic-ohci";
+			reg = <0x0 0xf0829000 0x0 0x1000>;
+			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		ohci1: usb@f082b000 {
+			compatible = "generic-ohci";
+			reg = <0x0 0xf082b000 0x0 0x1000>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		apb {
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.49.0.604.gff1f9ca942-goog

