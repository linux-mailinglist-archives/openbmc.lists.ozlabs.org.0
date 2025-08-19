Return-Path: <openbmc+bounces-481-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CB6B2D006
	for <lists+openbmc@lfdr.de>; Wed, 20 Aug 2025 01:35:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c65Xk2ZYQz30Qb;
	Wed, 20 Aug 2025 09:35:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755609456;
	cv=none; b=dCPljPxZxcJqSOP37WTHZ4LAsge5soo2VrgWLqM8GGU2zKqTCTGhTU3xz0gb14R1JuU32oba5hOe6krgP5IM4dQP4yIS6PkR9DV9CKhK7KPUY58Il0+U/TcugD/b9h4ajadyCPJV2yueiR/vqD1xws7n1eo9RKFDny6gH6dJKaXRLB9jnED9FHknx7sZi4rQYNdApOXBrQHFdNxMywaGfS6RbkGFmar4oSKYFg2hzmqbrLha/2OBxSMzPVtYg0Uw682lT2bZ33ZM4EsyyPg45W30/W9gjhCaYb49ssfPYFy7pBamBt1PNpfNFgRx5fCzbi9wJvxhfnlUClClyGYejw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755609456; c=relaxed/relaxed;
	bh=oLZdKJG7O7Ehre+Qc9i4124u/zsW2vIpuZVf+PiEblg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fhp4/yfmK0M3dQSF3nTz9kwISjXD/Sn+gwL9fJLbebP5Xn0Jb3wUYMXOvpSOnkeoeko7Dexm9MNH8lkUa6u499mNGZ+cxNpqj/mGJQ7e3jDg/XAKD9cVf21dhke2Hu97SzHM2Y3VJrThvFQPlzg7t9Cdtm1lQwyXmFE0oGQuUSFuVkn/JeTUcIspO/ZSNOJkTHHZZVrjfbdWy3VOGiuTYOynOB2BpPXj1FpnvfxWXdcasPA57qcYNdbNNaM9uKWb9z27elZ7zu6dqmAUF5IhJnCVBNUZLbkf3JAS0YDI+3FaI466kJNn8aVxAaW7qJxZTfUBQJ0lUrxiLBkud42DvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y15IzUAi; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y15IzUAi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5qrF732yz3d3M
	for <openbmc@lists.ozlabs.org>; Tue, 19 Aug 2025 23:17:33 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-afcb7a5cff3so97926966b.3
        for <openbmc@lists.ozlabs.org>; Tue, 19 Aug 2025 06:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609450; x=1756214250; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oLZdKJG7O7Ehre+Qc9i4124u/zsW2vIpuZVf+PiEblg=;
        b=y15IzUAinuz94riVGnxvEZh3vzqdEniarjD8RDE9Rmsm393VYjevXAHskctBKUyVr8
         0Ny2ZQ6p1JSUsARltURdpqWG7cW7HcBzkosvon6n3cwWK1QiOtTMHfn2Pp6iWx3TBcku
         xUUmIWS7glAkNFxlgV7Y2gHF8V8YZGlKeKFrGYV34ZwDCs1mUPjVsenLcLn/fPfyRHLz
         0CkKZNaSXmoxQMvw5N0JX8SUzNdKAz1Y80t/0DHf3s5t0wlCAiy+O4jtZB/Xybu2stuX
         j0tv4S0zg403wqW9YKitgP3DtuhKHuT2ItBISC2q81eWsp6WU7xtm1yvUQm1eI0a5ufy
         Hu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609450; x=1756214250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLZdKJG7O7Ehre+Qc9i4124u/zsW2vIpuZVf+PiEblg=;
        b=VZlxzfj7u1K42pMVDee35T5fGbnRdxDEVH9JHYAMrh893fBOwhYNo0Mxiivl5nWlHE
         w+hz4l8UwqRwQplt0ohS761k/LI+lB55X0d2wCvgbg/QaLdvHHrqrP+s16fdqMSOqRPZ
         idJ0ICn8sUtaB/19C+fqKj2BfpOLbo6VlMDdLknklsizkThLTN47MKRY5gm0Bo+tnLy7
         DOZq+Yt4KkGxfv7DQR9FVOpLWcu3TlGdeIiqgHI2cXYmza9J5bTh/XDWHLLRQlTnpb41
         VNpI0noYGUJ8CWFte/rKRVODym+ncVk3JT9JVfXwdtW/p9H6MmIWq5Wvdoh7IqT3KqnZ
         KoPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrsTZTW9/WIB6zli5bOPztGQ6nv6AUVfkg3tKAvGI7VYX+FkLIC6Isn51s6O+jRcsMX7IwtDNP@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxjxzEWQGV/VaKzVuzhlLUxIhIPY5TJ371BAcHy+HBzVHOkoIxB
	P7ci4SzxUypnn+B1ph+3tl2YAapjS5P/hw+pQPsiROjaXJiV4NW3+4XGm4wNzpGEQlQ=
X-Gm-Gg: ASbGncvNDUjDPPmzAFNbqxlgETnBH00/Er2ih3GXLMiZ8GwVL9XREht6yUT9cD1bMFz
	zw/6KEG/7KtACi9ZUo4CkKqufMOFFINtfhu4GS9Yr3YPTOP4gMtK7xoRlizJUsaYAKoeR3AE/4R
	lp13l/9ZuLcq+6XxPMWAbDYbSgUtBpN1hBB6eOEwg1O9v1Ugq5cu/YBp8Esu8BTTXgbvKR9P/jo
	FLjUgUiLsrx6TYGoGi6HUKxR/pzrHnFMf60pJxcfbCVMg0hvyLeX2eueqBRwaGJSMy7+prhC/fL
	CWLZhBj6O/MppFENtPtDpemLZC2EsIRU63g6EXNUnA6tSuBrHSZWlXKbpwm1fMEd02vLeyFDKqT
	P12mZjcOSw7VaZcSf9uIatw1nkwzgz6wNI3liW0ys/8/K
X-Google-Smtp-Source: AGHT+IFIWiubby8P54yyZ+NEDm49d/HfNfJgTlf8XBWHA6lj9Z1eblfmQfpYt6YpsbvQ/KV+F2nOQw==
X-Received: by 2002:a17:906:3087:b0:ae3:bd92:e6aa with SMTP id a640c23a62f3a-afddd1e42fdmr111924566b.6.1755609450475;
        Tue, 19 Aug 2025 06:17:30 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd04de2csm1023271666b.111.2025.08.19.06.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:17:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ARM: dts: nuvoton: Minor whitespace cleanup
Date: Tue, 19 Aug 2025 15:17:26 +0200
Message-ID: <20250819131725.86770-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=FEspt0iVKZ8yfRYHrWhEsNIN4cLzv4KYS3eGc/EoYA4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHlmVyXrlyiIY/gFdHxz3MbWI6HNQCV5+WQeJ
 gzzOwzjrN6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5ZgAKCRDBN2bmhouD
 1zEfD/4o1kY/URGy1Rv0/7JJOv4u7J3qfRTUUAcvGf1S2qKzsmGl39EaMnzjXjDqu2GnGA1Fm2O
 GmV19bSHZUVoEn1ABR09+K/nGH43plaLaRHvynGhdnmYmiW4Z++g/wsflv09sjgO3gh5kK7hhpe
 41Q780e27VHbgHqJOq5FYnMK03fIBIBoIzpK/xmYgbKsp7Og42bOMs/3qpWONN8S9PpYtmw11UE
 6vBMez9FzgDaTMR/6D6ujfScd+XcqLIFTNGi1RtkcXvWg3BEtKWPOkgZnerWRH/QZAbs6CWAGRN
 7Q5bZBA1Mhgu4+N4NqQXjBUvTUo5gpSaM5wdeHjY7L/r8dpaIbMics5iakPqy9kdBx5LRys2g+C
 lsECQcD7EhfdcEAiiBE5F5sU+1THfw0JiP6xokGCV7GS5w7DpRL4LS5pjTIRVuyVJtUe5YKSL0t
 5LQyQdFFm5PVBV3iQbvfQjj+kP1nMnCikBf1eZap5T/Lm9r4k3i3Ciim1aMWDPsCkrk8v2fBqU+
 iNAPadd5dI1tbNhZX7wPTxiIyHx7Muu5TJb4R8QBWavrXGo/V3rRQWNBSit/GcmcVMrb1iKbCkY
 yRBQEAw4aZsSdD8N2qtXth7FQfZ/oyHJOkFvXEaPSOx0stPWUbeW5BV+neA9J8n3opFCUxHCXob forjO0sLkEolgSA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The DTS code coding style expects exactly one space around '='
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index 98c35771534e..ab3c3c5713ae 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -154,7 +154,7 @@ sdmmc: mmc@f0842000 {
 			status = "disabled";
 			reg = <0xf0842000 0x200>;
 			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
-			clocks =  <&clk NPCM7XX_CLK_AHB>;
+			clocks = <&clk NPCM7XX_CLK_AHB>;
 			clock-names = "clk_mmc";
 			pinctrl-names = "default";
 			pinctrl-0 = <&mmc8_pins
@@ -166,7 +166,7 @@ sdhci: mmc@f0840000 {
 			status = "disabled";
 			reg = <0xf0840000 0x200>;
 			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
-			clocks =  <&clk NPCM7XX_CLK_AHB>;
+			clocks = <&clk NPCM7XX_CLK_AHB>;
 			clock-names = "clk_sdhc";
 			pinctrl-names = "default";
 			pinctrl-0 = <&sd1_pins>;
-- 
2.48.1


