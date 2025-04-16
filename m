Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0E7A8AC83
	for <lists+openbmc@lfdr.de>; Wed, 16 Apr 2025 02:14:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZchMv6l8Tz3cPp
	for <lists+openbmc@lfdr.de>; Wed, 16 Apr 2025 10:14:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::435"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744762440;
	cv=none; b=DngCJDhuQzoFKrrMAeTDJlF76Bu4hGLN80XLjvfmriflctwe4q6LQiJCpnW9Z/pQjPoVNmGyBIBvmEWc2MKWFknJVH5h4AulOkg20CsE+elOG0qB43BLTL8ZasHY5mJ1cEyK7VWvBXPMm1dAhn2xZh0UECWB3PrdAsQBoDyWOvscN6AZ14E6nUrh/UblC/Dc6H6jQyJDb80mbHA3kpsWiYPdag7tb6NJn9hsMV4a39U7v7Z81z5G6+Eee0Pba8N+SgWZeUGpJiivPxkuj/khymZ8bb7mcV2yW5pVfSkg3oPUx1j2B8/V/WJrtxN5j2lvhx/bTIhauH3GxKftndqUUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744762440; c=relaxed/relaxed;
	bh=4Hrq/5jnsaS2UvAtZ8/+V6NwQKUrA7NpnKCyv2FlWdc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j7sqFuycqKKsx/8N18U66wR3ZqxbthFut1GfnMVIRyJd7EDIXCLECywfpen9r9dtuvz3UCIN26KC+oJ/Wyews0LEDDeiyIZb3PClnZs22Lam7XPB5r1ZjFp5i2jfBduD7sG2UThKIt/6R/QmGlPtsTC/JkewouCmuaN1SEHVKCrerchtDuQaJWA3/zDpDuM538it3LeUnZdVs/+R7AXf8glfyucU2bCfonClkC6FmJdam09Og0aHtPHqfI63dH7MMo9nDeiuNfJbkyPbKtD47/83VRFuyAqkHs2TCB1D32/wnY5l7rz9SrjR0d5zaDBlC58PfLyPERMTKhpxlBsqfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=yyCdqDl+; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=yyCdqDl+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZchMq5kDNz2yYq
	for <openbmc@lists.ozlabs.org>; Wed, 16 Apr 2025 10:13:58 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso7660562b3a.2
        for <openbmc@lists.ozlabs.org>; Tue, 15 Apr 2025 17:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1744762436; x=1745367236; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Hrq/5jnsaS2UvAtZ8/+V6NwQKUrA7NpnKCyv2FlWdc=;
        b=yyCdqDl+Hj4IX6zs2Bz1Rdh67v8CyE5N7dP+sAn0ZGelJrS3yiaeqeU4kMlErovT8h
         i5mBcrOGsdrsoZCWUUap81AxKsz9HewYLbZS5vVOGme96ckz9bALQO7ZkltFaXOmM/5l
         BsEdcDm+v0nIHiv+sZt1NR3QXoYa6whiUh2M7239t73jv+wy3ISw0EQbY25lqUIsugyt
         MjOAvc5Y7AgZUUlOF141DF3bx7nKbyZQ3jr85dTWyW9JDTdn/gfMp2Ao58xu/VYlMN6N
         GNzu/u0VycVfuibh2EX18E5+sMMBE1Gg6ffAfuzTftpaABZzjqOoE1ya1xzTptcSRPAS
         9QIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744762436; x=1745367236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Hrq/5jnsaS2UvAtZ8/+V6NwQKUrA7NpnKCyv2FlWdc=;
        b=eqGnBBM7/ybxFe6dneQMxDEkk61DK/rI4JSuifGrq5JTpFWs2QA49JGro83dXQPws6
         CMTVJZyLxwL2ZEdHsu0NA0cTknWQ1Kpb7prI61r1LbBydV0lgXgO+v+MOR3a/Ch5GkTn
         +H2tTkiPwEP38V8oK3L/T2PXgOJD2R1uJtjSpg0DqHSCsBDD0MOdr+177Ta0fFyr/NHj
         a1m3GKERAuADGf+lVTxeSHA5AQyOEgGEqK4UKjXUy0IFh2qEri/fxgtEX1e2i2gDrM6+
         41AVesB37fGPLC5RxoSzhy60SCJbcUWh6WY5zCnHtovzPqsiA/6CqxBfmV39mfZlROQb
         oPkA==
X-Gm-Message-State: AOJu0YzpzHo6b2bADri9drqxH6vNv/FfSt8X/pF1mLHVNEsiS9+owhxq
	xpJBY4EDf+UfssC+vEu1vCBcZqAp2RVouUAjPih3Jk2mBCq6LlsXYBa/aLhWI6w=
X-Gm-Gg: ASbGncsVT7C0ruwJIgMPL6w6FA1rBZbW1gO6Tij0TYXt5R65PWGWAibekJ4wtayCKNM
	oqzzroEI0JqOXT/IuOpURkhBwLE6K1Jn4we2TJEhzRZR/8yMTSfwGo3A8EqUTOM/oGx7mScHM/B
	6R//cQGl12Ol4Qh9Zmh7uR2zJ/NbGdoyJ7TH98cyBOUKvIyNsuAbs9/RJBwHzxNrywkdYXDHlxh
	XjGsP3bf1N977LKqr5/1IsrPquQBCGycnofntYrmlfTEVRvVha6dELEBR5/X+x/B3zV6iNxUdpC
	GUHoJ5hR3emO1oX49kLlmXqfuqsOmv2Z+SIiPUzTXgEjgmgbm8gAoXw3HIF2aZSneB91n5LdawN
	YGAv7GF9uEjeGR7HecR3cg59gD+R0tl3PGpnMCg==
X-Google-Smtp-Source: AGHT+IFuikzPoPqd7B8f1cnRj42JNiLHhSl7BeBI58QZ7SkDEfmP4xHkdJrszDfHnU7WZaegvbF/OA==
X-Received: by 2002:a05:6a00:ad0:b0:730:99cb:7c2f with SMTP id d2e1a72fcca58-73c1f922615mr1633304b3a.6.1744762435765;
        Tue, 15 Apr 2025 17:13:55 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:ef0:9d76:c8a5:f522])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f1040sm9413386b3a.98.2025.04.15.17.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 17:13:55 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH] arm64: dts: nuvoton: Add EDAC controller
Date: Tue, 15 Apr 2025 17:13:49 -0700
Message-ID: <20250416001350.2066008-1-william@wkennington.com>
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

We have the driver support but need a common node for all the 8xx
platforms that contain this device.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 4da62308b274..ccebcb11c05e 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -56,6 +56,13 @@ clk: rstc: reset-controller@f0801000 {
 			#clock-cells = <1>;
 		};
 
+		mc: memory-controller@f0824000 {
+			compatible = "nuvoton,npcm845-memory-controller";
+			reg = <0x0 0xf0824000 0x0 0x2000>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		apb {
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.49.0.604.gff1f9ca942-goog

