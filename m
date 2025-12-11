Return-Path: <openbmc+bounces-1000-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D09EECB5360
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 09:49:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRmSP2Bdkz2yG5;
	Thu, 11 Dec 2025 19:47:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765442869;
	cv=none; b=A3bwVHqjZ0mfIx2ITW++Tu3sQ8A80kh9gVxAJOPIoZwJmJ9Lxjym+IcxOmocPQjFjhk+6J3zJGIbsVFGthTHjTAe3eDed6+TNOtmTjZoLedWBuIpV8ZUGjm4xq94ERjIXAq/sKh9NLCpgQDUFnew6SzVpykKJQO0wIaD0Bz0SG+AAyflYsStzeZ8PmH9Tca9kImAt1v6N7a0E9m9o5ZjGWpE4iDog5sz6PlcpthusPHZyyjAIqj4AsspZWYMihjyy1SDuPGDu3ieeiwaJQSKmF4aeHKGZFAetfegBGGfLQYT+Jbnd4l6RU9MclMeKv6hEgbGPW3EEqiel7YgZW5EEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765442869; c=relaxed/relaxed;
	bh=Iu4TPpF+5DGJ5DsE0F1CuqneX0MF156KpXyPhzX8E5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hM4xz5pSIC5T27AR4Ht2pn1qal3BQNO52N8hxdIKUOTy8d+DIbPU1xWEwouPNt2fj0OoNFFHxs9juat0UxNPgIaOgxiTUAR9jgIPRWmDuKSb5VH8yGPFcRKLXYqG79wmvXvart28+5xWkwWL0w+ajeQkmR0/CHwvGBORB7tTMz4yN11k8OXikw8bmJG7envnEOhVPiKEDlX7/x7YJ0L3WsbOD9dJ9iMBuuFRf1ZN54ZcxDdOWKtpso92XXNLjk+cAduHfB5yOJ6Xu8/X0DBwwF2xpibBrTVPDPRRMB8jgndW4jhb3sK3NotJ5fs+r8ijFtvZB+DaidLrI4dNtk5QuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=N1eYzek2; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=N1eYzek2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRmSN6Fhgz2yFj;
	Thu, 11 Dec 2025 19:47:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442868;
	bh=Iu4TPpF+5DGJ5DsE0F1CuqneX0MF156KpXyPhzX8E5g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=N1eYzek21eihrgNsj8tfP6CntNClLcV40Yb1a51mjY7eg0yL/BrWQNrdx9pLiWhkv
	 +KxqQcpc4uO2vTRr/CDKxIwJwUjVZbciI+mbbY+fuaKUhBEiQunPivRGTgFDjHYjoz
	 bDogU7VIRPjZxrkyzdG5rS5D5rZxxK2TGpgixjqSB/a/Ku8N5+ldco7oaUunkhI54r
	 KRVQAhnFYyF7m451J7ZK4fYDvovtQiUXGyyJN74EYUbVUfaZqHFh0C0dgJUoL66Xih
	 kRsciCepHt/QvVh7vnqTDAq9u4nXM1s3XLB3cGb1OQaKIbnQA63Tez0mwQsFWmRO2I
	 Xd39AR6ftlHPg==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 60BD77D6B0;
	Thu, 11 Dec 2025 16:47:43 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:57 +0900
Subject: [PATCH RFC 15/16] ARM: dts: aspeed: g6: Drop clocks property from
 arm,armv7-timer
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
Message-Id: <20251211-dev-dt-warnings-all-v1-15-21b18b9ada77@codeconstruct.com.au>
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

The property is not specified by the binding, nor used by the driver.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 4583c68748c2..567f8040eb8f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -68,7 +68,6 @@ timer {
 			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
-		clocks = <&syscon ASPEED_CLK_HPLL>;
 		arm,cpu-registers-not-fw-configured;
 		always-on;
 	};

-- 
2.47.3


