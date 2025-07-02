Return-Path: <openbmc+bounces-305-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB50AF07E5
	for <lists+openbmc@lfdr.de>; Wed,  2 Jul 2025 03:24:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bX2HT0V60z305n;
	Wed,  2 Jul 2025 11:24:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751419460;
	cv=none; b=CihJnUrCID121cVMcjA1h0eOH6zj/Ln6cjtZpPKJjfBEGE0CobLN8afPOrd6PE3X/XI0HW9Sktn+TIgT886Fm6tX4H/YC7Q01Bd5bjr6/Rj3r+356nPd4Gh3dy/w14RTHbkLY1reb/3LA4Wp02Tb8KZFzD3vHx5/3a1BFarrldSptn20iLsFLCrr8wGd8afxE9ZOKzDHtM4ICv5L+vsr1ij60cnbYScJBOWMjm/2wAl/Uj5x5YitHsDvG7DUAEz+ssHKDpRNg6z+a8U2NoTNR/metq5PGEQCqCP4TC6E3xY89GTs+CGpNG4yb0a2SRKJOiuEz1PonedivO5DmGibFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751419460; c=relaxed/relaxed;
	bh=lqupIVmUfM/FwKL2CtGRCLXKXJXt++c24hQ1CeX4PTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KeTlAB9AJNBrMiiWBXh+xghxBZDEHIEQyOaQqTiR7bjWEato+Tp+KdShamgirnyaE8nmFZj9O5UPu+igrDXDo0u9jvImPJK7Mmt04i4pPQW1gxRPrQ3dN8aXVhESMIjjR9qEWuEnov0Ka4ZQFetts+6f6UkNs5qwzyXAASCqKRoi2G/QkjxZrsAGXU2GpkNSsN0R0jCKNWlEmJJZiUUrdQppW+jzJFZrlP8Wz8ZihJODtBpPahU/PIsUPYVoUYigYyDInCo2i4LAp0l6mXj0P5MywrDDbAUJYklqAc0jyCSF3D7ppItKt96zeYooSxjJSuxEJTzBPb2biB5K72EdTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jEMMyiHt; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jEMMyiHt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bX2HR6KqDz2yQH;
	Wed,  2 Jul 2025 11:24:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1751419458;
	bh=lqupIVmUfM/FwKL2CtGRCLXKXJXt++c24hQ1CeX4PTg=;
	h=From:Date:Subject:To:Cc;
	b=jEMMyiHttf9+780o3EE1L0TRtmlzNa50LTyif7nkuZquu0MMdgyPMQXZIdm7MNFA6
	 EPsT3n/sTdRIh2VMmtQ+I3K5YD0AhQntiv1/9WmfCsLsS7aC2elVM39SUpsaC14FT/
	 wrAeaNGbm4ZjuqaSP34+E2pQVgt+Z3LoZPRXXS3ysQozss7vN4+crr3VhCMqMklN/B
	 8OmnudSbGaRM/j+DB/p1PYqkHp1hSQOBX2w3gp0MXqiilY42vKId8mtoPXI2BCK7n+
	 Zr/fWEUcM1L4Y7YVOCkEPLBR6K6x5uWKnIDDbHWHlfYP5tNOeUOf+TOQIcKKaerPD8
	 HAmJAM88iNKoQ==
Received: from [127.0.1.1] (unknown [180.150.112.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C1B25640B4;
	Wed,  2 Jul 2025 09:24:17 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Wed, 02 Jul 2025 10:53:54 +0930
Subject: [PATCH] MAINTAINERS: Switch ASPEED tree to shared BMC repository
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
Message-Id: <20250702-bmc-tree-update-v1-1-c270cd8af0ab@codeconstruct.com.au>
X-B4-Tracking: v=1; b=H4sIACmKZGgC/x3MOwqAMBBF0a3I1A7EwR9uRSw0eeoUfkhUBHHvB
 stT3PtQgFcEapKHPC4Nuq0RWZqQnft1AquLJjFSmMoID4vlwwN87q4/wJUMYh3y2pQjxWr3GPX
 +j233vh+kq9TyYQAAAA==
X-Change-ID: 20250702-bmc-tree-update-72b2cde4806f
To: soc@kernel.org, Joel Stanley <joel@jms.id.au>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313;
 i=andrew@codeconstruct.com.au; h=from:subject:message-id;
 bh=gQXNDlKtiwItGVQoQQmPChI9TajdcpMw23001kg7pts=;
 b=owGbwMvMwCG22PjiTL8dD5cxnlZLYshI6bLNPv7N3WJ/3tYN1979qjZaz311JuOeK3ZfHnyVX
 /0ya/e76I5SFgYxDgZZMUWWFYG2hXc3T4r/eSD7GMwcViaQIQxcnAIwEb63DH/Fnd33nn1Q89lA
 t/A7l7mcff5slg0XGRgFP7p/2bpOLH4NI8OpZ96qGzZ0mUjzxS4WnqbypixYSXEfn7wJ74fpmrv
 c2rgB
X-Developer-Key: i=andrew@codeconstruct.com.au; a=openpgp;
 fpr=C0F5E25A7D30ECBBF3BE3CEC3B837651FC0D8CF4
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

We now have a shared repo with write access provided to M:s for the
ASPEED SoCs.

Cc: Joel Stanley <joel@jms.id.au>
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
Hello SoC maintainers,

Joel and I are chipping away at the workflow for shared maintenance of
ASPEED and Nuvoton BMC SoCs. The latest is this shared tree from which
we'll do future pull-requests.

Andrew
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa163f9fe8fe3f04bf66426f9a894409..a4b8e52ace9fff3c7f43b67b288c5a2c8ec3efa4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2408,7 +2408,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
 Q:	https://patchwork.ozlabs.org/project/linux-aspeed/list/
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git
 F:	Documentation/devicetree/bindings/arm/aspeed/
 F:	arch/arm/boot/dts/aspeed/
 F:	arch/arm/mach-aspeed/

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250702-bmc-tree-update-72b2cde4806f

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


