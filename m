Return-Path: <openbmc+bounces-998-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AF7CB5345
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 09:49:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRmSB4BTPz2yYs;
	Thu, 11 Dec 2025 19:47:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765442858;
	cv=none; b=bcm+CYlboEASK3XoVuHShnzwu8LCsKzWW3l1MhDWo80enn1L9WhZ4PhxbWoeEyUqalwFhfL3EOErhCM2EKbq/NjQGHNZREngBupzwExMky0izNaw+2FMXkhke2kb2r5JzThKzyyBAkssUTZ6ypK+GeVNvvhP80OPkXTpu3x9g9nVm69vlyi5NmGcsVlTTxC5oEMb98iVSDZti43xyKzu3rE9HlgHU8MwKyMVo29ar4G9ofsckOY5tm5nBV3bDT4RXCBiTUvU3P8q1yAwF1fo8IAu3kY0D7/dWb2+VswJ4QG9xqjokGJ9LJGUXJefQoedxZFxoZSOdYxpfg/RRMY08g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765442858; c=relaxed/relaxed;
	bh=rpT9+i/Mb1SzFndodK6pjHk1FnR6Em20V+C0liaihVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gI8idlLIegNC8/FXHVgSO/QC20UCm+ZLEQRRGdJE20RuxJqmQ5NZyjvOUkt3Wq51K67dyKrjN0KB2b9RwO8L51c+N9zYHvPlnNWqua+bTo4myxXD56/L98gO2fap24OHWcBMGt4kVKVLmsfhPUBDtOAsVfgQsDe/weTFqYafs0En7q4aQNjYoeYhjSmc55rFZDJM98IluFLDIeFZtjjzEj01+1p3qtVt5zayq3ja26DLmoKdhz823VWlq39MYTPuQywt5gS67i5LCWMAYl8lA0pOI2ouZ1Br8KZ7iqtEmmo2r4mTaCxcrgLlYYO+g/Jm/woXQKohq5nVLjeH+82uvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=mPJU9qQD; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=mPJU9qQD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRmSB0FNrz2yYq;
	Thu, 11 Dec 2025 19:47:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442857;
	bh=rpT9+i/Mb1SzFndodK6pjHk1FnR6Em20V+C0liaihVU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mPJU9qQDNoqh6NyKrVyLU5d/zHaZ3HmrsgYxTaXWxGDJqrLl9XCO5Kyym/D44eTwb
	 kw3QVLMOGJo0VhETRgFYBiU0uaQUx/4B831bSKtILSHUHMLX+9NU2qc8owG/48faS6
	 VfbuLxJRbGLUJmhfw01dlr+OJrYK1h2k8VVY2ycPQoJ2PKNEt0i/Kwu4GcaJ7cWDly
	 XJuikW9rtL/XPJF8nFDxgHeOM2duqxRRlLO0KUMuRt19FeCfqi0gKNNF7nhS7kCgoi
	 GgnaR3/gCJhRcVhSrYyWsnBQTrJxgkhKzdlt5wthe8DSysaNhnzafs8KSTLLOmIGop
	 ZgjwksnDNe0Tg==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B49F87D6B0;
	Thu, 11 Dec 2025 16:47:32 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:55 +0900
Subject: [PATCH RFC 13/16] ARM: dts: aspeed: ast2600-evb: Tidy up A0
 work-around for UART5
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-dev-dt-warnings-all-v1-13-21b18b9ada77@codeconstruct.com.au>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-iio@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.3
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Changing the compatible changes the properties allowed -
snps,dw-apb-uart doesn't specify no-loopback-test, so remove it.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
index c51977dcb56b..3f2ca9da0be2 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
@@ -205,6 +205,7 @@ flash@0 {
 &uart5 {
 	// Workaround for A0
 	compatible = "snps,dw-apb-uart";
+	/delete-property/ no-loopback-test;
 };
 
 &i2c0 {

-- 
2.47.3


