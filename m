Return-Path: <openbmc+bounces-380-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A86B09885
	for <lists+openbmc@lfdr.de>; Fri, 18 Jul 2025 01:46:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjqLn1Fb2z3bnr;
	Fri, 18 Jul 2025 09:46:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752762193;
	cv=none; b=SHUZMscVm01MUmJPMeI4Q2qeA+HUXfULV5sIeSFbobEt2GBpDyccBEsh1yotkII48zuhsUEHPpR0eceoTHe4svsvSWSEagcxZ0QVGlx/SJKbD/WydWQEnCTnQGKHRARvfhFFK1Mygb9pTMoWe+tpWWOePI8ktUbIGHW1MI6Xwm9hNhFsKm5WLiJp1xl9ise7zf9aV5KN+wFKdcJaTbXueNErujbp0PKjVhkXnVL2/6byaCXWfcuI/Y4yulIS7QWfg7huZtc+xmqrcETGLRMa+MMiVNGDUoJpvAd4amGa2wY9R+bSRx9ti1YvBCmgrykdgRnzt2xIFw4j5WOGLoPPLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752762193; c=relaxed/relaxed;
	bh=uC7B9qKhN/4PoZChB8nu5mHDtv7dsKlcLqC+7kIFNiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vq4fqOUYnursh8hWUnUbrtKcQIlyxe1NkvJIKH8GnLh4dVruuAaPP32D/FK42whMjvyOymHfB57N+tKBvgtngUMnQ87859fIGQmSM8pm/WtpJJlqlNCxL5gfn0BMkI4aZWW7KhDgSQpSb4MET40Kry5aU72xGciICLoy2PAHGoOr7rBR12CWB1Kiqx81ZDXRPDElS8dBWP51YDuGA+GgpvVaMULSIWxEE8isM5Y8FVuSDjAiSJh26ZQnOZtOTtjKZaOChhKKf9WfNb5u5XsTUx+EB9Aa5Ih2dMwdfTJ9IF4DzKCaUJM7n13F3XSyaV9v3+NIv0u9wFpyBTcY6N/PxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KiDStoy5; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KiDStoy5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjZsD4bp7z2yPd
	for <openbmc@lists.ozlabs.org>; Fri, 18 Jul 2025 00:23:11 +1000 (AEST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ae34f43be56so18146366b.2
        for <openbmc@lists.ozlabs.org>; Thu, 17 Jul 2025 07:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752762187; x=1753366987; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uC7B9qKhN/4PoZChB8nu5mHDtv7dsKlcLqC+7kIFNiQ=;
        b=KiDStoy58g6aqROsLMAJVuJ8Tl2THH9mSadt7UjH8oPDgUe7dgG7qIv2fGVOaUxe/U
         qcNR9I2t4C7lYWbXhaobVbhSaSskykyxuX/o8H26bVaNRzjeC2TxtbYrhmKUxsUDKaCh
         qvgyC7PLUyHSk/XG9KIjncet6L970hzVQHwd5I5gCScmryRSycFLdF1enI5qWg9YnL8S
         OAJAy/4oAL3Ayt7Y/+abr9zxLfbOtyHV+dmJVhspKmfj3M7urht4PpgoXETgsyFmYBcu
         rUKatnuSJhl3F4Jxpc/eBM19ERiSvaN2oXi40jcaVo6TOmbMw9QLbCDAtSo2VRP23sF/
         vcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762187; x=1753366987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uC7B9qKhN/4PoZChB8nu5mHDtv7dsKlcLqC+7kIFNiQ=;
        b=sy2Pzr8lQoRq9rmSb/WQKsx8ZHhRIx9mOqxig8UCur3ooDJBHMcnW+uHQtNyYH1tBl
         kogTu0h/UYvcwYRVu4yTlgluEUOAelaRZ6ul3/BtoP/kovWLgJlDSdQi4hUzBwNw9fZi
         C22LRCaAwlMMUd7BCHiMNnq2Z5/W4370f72eiOAcUc8S+xD4PK3Q0SPegVU18FqWVw4y
         OHaPSh6W7FmGs//zTSIHeeZVFBToCYdyfM2ZNkGMBW2p5OMbjCXRjt7S+Qgp62FfeDa4
         SNiiYQyoDsu4psGbB0pnhSdL/4sTFdH6FC6UJImGGJyzXNM9FM51+eeS4ZtAabjTeFQH
         f74Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgXd3yTyH9s0M6G81YG4SKNS3F3b9//45hirzgX8ev59dQvX6nUtcVr4fpKIYfJ6GgJTmnO5F1@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwxgEKgkxFSoeC9FU5fumggvW40bMmWKxa9JtF/3Y95vI2xwx9H
	j+c4vbpoypkzdwZNakzt7h5WMa3Mh7xQghWosYw22jWhAYlT34EfQZ7RiRZoUPOVD1Q=
X-Gm-Gg: ASbGncsjF/z+WGOaEQy/5v0DJih9SC5IGH8j/tLUqvPEgCsy6m5K8OCVhqv+ulRvw5w
	hGQz9J7oLuR/DpwmzBZR6XQ8ns5afglrDs8tXC36YXkV+dNiqxVGUhBfTnHkwxwHdx1X4+1A7Jh
	L+GtZAZhg9CeE/VdQ72NQFP+q4O7T52cF2IIq43LSY/tA7NYNAJe+ZuChgjqLdW9NWHwnJVd176
	RXVLy8H8v7X1yZkTPN0ULadob2xvPfodoNW+SXArxfVRksNl7G43udyEM76zDOYJkPm1dsHKJ5O
	iOGz1jehcr/cpQpS4u/XUm7PROXtewbhqNASDEOzpLRKrR0kWn/PimKRqjZ0F8H8ITXkRSEU/Jw
	e1VsWZAF0mLdcTv19uZmL2AI9Adipx+74
X-Google-Smtp-Source: AGHT+IGuuLa3Vb/KSBwUg2zTekQ5l5vJ975p9f4R+T5/YcFzGiBqvq9lyW2cY6LpT2UokeowN2VhEA==
X-Received: by 2002:a17:906:4789:b0:ae3:617a:c52 with SMTP id a640c23a62f3a-ae9c9955332mr273565366b.2.1752762186554;
        Thu, 17 Jul 2025 07:23:06 -0700 (PDT)
Received: from kuoka.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294c0asm1347281266b.127.2025.07.17.07.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:23:06 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: nuvoton: Use generic "ethernet" as node name
Date: Thu, 17 Jul 2025 16:23:02 +0200
Message-ID: <20250717142301.92548-2-krzysztof.kozlowski@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1445; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=5lS5PcV+SW9LtXN/oJ09BpDx+tl0xtlpI3fH+scoObE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoeQdFiZYpYveODGEOcCSwOy+4ytz1aspSwdXmV
 bupbLY4UWCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaHkHRQAKCRDBN2bmhouD
 1+lCD/9N0B5vDrapB44zfaRMBd43QiAg4+VWkXSnAgNQcc6bl6s55kbQqIMGG675vjFEDbDqnHC
 ckMHUTmLHs7sEGIOmymhIPTsXYi2KDDgr9htpgc0Vl+hsyrSFhA0KJU0vtp8mEAJIPY/4UhjPfi
 l2uQ6MQarJHIif3xCNhuBuz3l98DL7zobU/Zetk2c128ecapJZBIQ7tlSsB6V25DqtG692sk/FU
 BrkIlo6aoUscY/dut/b5dK3jKYHXbQ7DeFDMSf3SO8cgH9gQAmkEOcFPBeXHUUMZWY9NfTN7EH5
 R2YVrE+pGK/2CjP/2c07LP3GpFIX60cTWIYsaPZFAChfFCtxoOio4fnZTr5V39Rhx4jknvBcQ2t
 /BwsGtGw8SvF+3bzZbN0xWdiufQXogE8Kfzb2ICBYF1cOcWjQilh7+AEvEINUDTqBvK3QunNoHW
 NeNGWC47Lb7Xah/mo3pSFzfE1z9Z1XhRnxfeE6gK9+U0te37YjFZyBB+ZIodGOBcVMJuvKCR3BO
 oNzzgMsg6C4+UEkiPyK9wfScJNePWJWi1i4ZSomYW8auswpUhBwFNuoYT7k2bdzSBT+L95CIGQi
 OWuFhkloN2hNg6PjOVIYJH4+4hh0tl6luYfLvnMVans/0CM8h3Gn54MhJmKcAcchtb/tt1ElpL6 1qF8eLJ2mQFDk/Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Common name for Ethernet controllers is "ethernet", not "eth", also
recommended by Devicetree specification in "Generic Names
Recommendation".  Verified lack of impact using dtx_diff.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 2 +-
 arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index 791090f54d8b..98c35771534e 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -134,7 +134,7 @@ mc: memory-controller@f0824000 {
 			status = "disabled";
 		};
 
-		gmac0: eth@f0802000 {
+		gmac0: ethernet@f0802000 {
 			device_type = "network";
 			compatible = "snps,dwmac";
 			reg = <0xf0802000 0x2000>;
diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi
index f42ad259636c..65fe3a180bb1 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi
@@ -44,7 +44,7 @@ timer@3fe600 {
 	};
 
 	ahb {
-		gmac1: eth@f0804000 {
+		gmac1: ethernet@f0804000 {
 			device_type = "network";
 			compatible = "snps,dwmac";
 			reg = <0xf0804000 0x2000>;
-- 
2.48.1


