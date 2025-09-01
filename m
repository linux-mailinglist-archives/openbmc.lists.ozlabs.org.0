Return-Path: <openbmc+bounces-552-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 626FDB3E4BD
	for <lists+openbmc@lfdr.de>; Mon,  1 Sep 2025 15:24:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFqNP6XFnz2ywh;
	Mon,  1 Sep 2025 23:24:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756733077;
	cv=none; b=oqhUK0naM7lwVgyi6LPmNxWQMeloe0OXYF27AHCuLBLgj4NYjTG/XPRG+zX+DWMM1/UHJiJg3UOk1ZcEpHfeZ7G0/pAjpXt2IVwUP1sBilWaZAurWCqNJV/cCfPP4ad7vFX0FZw+VSuqVRX6NsGYYdgaaUfJre29PV064E2K45mlV/+gUFddJJKZjOrTI/NRN8F1rS3GxuOljFdwlHt3CFxBgA1JxpxlvqM+UESk6pXBobebLOgelAI+XR2W6d3+B5TDIM25N+kRwmJQSQa0mlk+zxlWGf3REwS284/3hotfH6DugARCXuRoz9hUiXIKuXfjfpNJksECjeuW+E2ykQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756733077; c=relaxed/relaxed;
	bh=qcztVxGVnrCnJstyxMe9QKMd8mGJlLFli+mnzkxgSgo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VUC4zdTehnbkaqPQdXvz2jSrZemx5sW3ydtsvPhvPfDoq4y2Ch8Us57u8CPxKgCAbQ52VEHlP/rUS17Uce0ZPP8SS3aiJkmeg5aXJKaQyHaLIkLqF/XkDPqf97S6eX0OU1wip2b8ixDM/8C28QATSes8fIlJMq74U+BjGDn02+lTzBAHdHcFsUAgAxX6LGH6OFtyg65ee5mB6bHwv5UmrtKNYHc+8yVynkK1h+xL3uG+Ie/+DtBQkh5c1Lzq2tUkm2MVDn6VRMwjaTpA2JRKT+nxjvdGeLex5tvtooKs4xjdynJ7FFY81G9pb5XEjONlfXGoUvUr5qJHtDNwyiYsfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l7SnXdmi; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l7SnXdmi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFqNN1QsLz2yt0
	for <openbmc@lists.ozlabs.org>; Mon,  1 Sep 2025 23:24:35 +1000 (AEST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3d1bf79d7acso1270127f8f.0
        for <openbmc@lists.ozlabs.org>; Mon, 01 Sep 2025 06:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756733072; x=1757337872; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcztVxGVnrCnJstyxMe9QKMd8mGJlLFli+mnzkxgSgo=;
        b=l7SnXdmiIEhV71c5r3puFNEk25hz88vh9ynlGzEdkM3u7l8WoZyzV7f8s8NsARdQoW
         IU2qPA7N13CrASaRlayrkViulJ7Twbc40Mri6RHOGV7S6Ouey9z+zI6fCT0t6ccLuyI9
         sJJ5TEyd7V6RzE0sgFDVbVRgCKV2NQqU0RNlRUiKuoKO0TvwXVoiOQrD5ojl5vM9whoU
         YAkVRvoE6IYgDdub1DLgKGU9C/PGPGra49hkpHJIEHUG4f9f6yGpye9ixi2mAhz/H4q0
         7JAV//wA/+qMgKEL4HfkFKd3zehNwouMwFV6VuTU+QgiKaDf8g9Rp2iczfUhtNUNWDvI
         eKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756733072; x=1757337872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcztVxGVnrCnJstyxMe9QKMd8mGJlLFli+mnzkxgSgo=;
        b=fIe3kxKenLogFLv1s29HeWEYjULDqGmm3HMUhm2EXbm4P8rgS6YRMmI3uQSuwybqp+
         H1tYFQ22yz6LVPmoXnIS2rgxramtFhRGtEPh6aw/W30oFkb31N/a7NiTkOPbdx32wM80
         uks9OIKCrZLh0vQlUWsTTerrX3lGAFpIayfJd7m96AYjlRbur9tcsCJpDUKhFryaOYbN
         5Ea+ZzsvzEpMKVuPmKUSAkOYrPPHHGkPKkarpwK1a5/uTQ408Q+RXci4hWrNGDq+lz5Z
         Qe5duT5kb2gieFmr2YrZkNQ7jsQs9GDTR+1iu2/qWL321/L4WPoiYs/I/u2MUs3Cm1cf
         99iQ==
X-Gm-Message-State: AOJu0YxKiY7smQhrn6OPH1zTTEtpVT/LD0LBmq4FFd6/E3huNs+K/we/
	Sr5EzLzZ7j/rLsfOR8LyW9YkIOmbctjmqArINbWmYPP9ioDessX0BLs2
X-Gm-Gg: ASbGnctzhPTM6hAH6U4Deb8OEfi0+0uolO368PpCWtaZtVpyMUIASW8P523uzapfjwa
	PnJlIoaeMp2c0ktjfdiPb38XPg+tEXVWOUWD6qKVXFzc3uotMWgo2GieqqlSsFkf5yKNatB8cZe
	YgMvOT8t1u0FK/VCuRv8oTiuWGHk0uIKSSvnZx/PKW+sUgXDP8PRjvO7U1DDfpuiSC687NDFZ+z
	XVp/fm/MDHe3mObjeStXo+SaWp2RP06JaWSMNzDQsl1THljh6yKcgiQuijVMIRgUz1+y4v9zsxD
	r3FyBiIzCM7UsbsMdszhqeOXtInRAiI/LPN+wpguWw+trxek2dwBljR+2h4YU5FdiJLZ4c1X2St
	F1ecyWKRVqQTPAnXAmP/XUmRcEJx8k1RDTw==
X-Google-Smtp-Source: AGHT+IGCJKS8iM+ASa83jD+sOeqBGUpNKKuTuJv1DDyMOXcN7dLD/1V0f4dRjY2Vr7DmztyE2Gq3bw==
X-Received: by 2002:a5d:5849:0:b0:3cb:3ca5:8717 with SMTP id ffacd0b85a97d-3d1de4b5ae8mr7181153f8f.23.1756733072370;
        Mon, 01 Sep 2025 06:24:32 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b8f2d3c88sm24359635e9.19.2025.09.01.06.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 06:24:31 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	avifishman70@gmail.com,
	tali.perry1@gmail.com,
	joel@jms.id.au,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH RESEND v2 1/2] arm64: dts: nuvoton: combine NPCM845 reset and clk nodes
Date: Mon,  1 Sep 2025 16:24:25 +0300
Message-Id: <20250901132426.3081648-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250901132426.3081648-1-tmaimon77@gmail.com>
References: <20250901132426.3081648-1-tmaimon77@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Combine the NPCM845 reset and clock controller nodes into a single node
with compatible "nuvoton,npcm845-reset" in nuvoton-common-npcm8xx.dtsi,
using the auxiliary device framework to provide clock functionality.

Update the register range to 0xC4 to cover the shared reset and clock
registers at 0xf0801000.

Remove the separate nuvoton,npcm845-clk node, as the reset driver now
handles clocks via an auxiliary device.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi      | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index acd3137d2464..e4053ffefe90 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -42,17 +42,12 @@ ahb {
 		interrupt-parent = <&gic>;
 		ranges;
 
-		rstc: reset-controller@f0801000 {
+		clk: rstc: reset-controller@f0801000 {
 			compatible = "nuvoton,npcm845-reset";
-			reg = <0x0 0xf0801000 0x0 0x78>;
-			#reset-cells = <2>;
+			reg = <0x0 0xf0801000 0x0 0xC4>;
 			nuvoton,sysgcr = <&gcr>;
-		};
-
-		clk: clock-controller@f0801000 {
-			compatible = "nuvoton,npcm845-clk";
+			#reset-cells = <2>;
 			#clock-cells = <1>;
-			reg = <0x0 0xf0801000 0x0 0x1000>;
 		};
 
 		apb {
-- 
2.34.1


