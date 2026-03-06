Return-Path: <openbmc+bounces-1444-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCakAaLOqml4XQEAu9opvQ
	(envelope-from <openbmc+bounces-1444-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Fri, 06 Mar 2026 13:54:58 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1343F2211DE
	for <lists+openbmc@lfdr.de>; Fri, 06 Mar 2026 13:54:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS5vy4yHGz3cBG;
	Fri, 06 Mar 2026 23:54:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772801678;
	cv=none; b=VYF71xdI/ufoK7aQhVrPduQDhXvWE+ksL1gPAWX4LybCLZw5pgRJl5uZ3X0/aWii+5mcayWlADxLdT5nEvouAoC5L+doEz03ZP/IWkwk1rjRwwtDyyf2Zl4bbbFnvS6RZJtoPlhYounWTvr0+8YxcZbCjbyxWL8GyHFQ+2vse8Nrd2tqcl81yh3QAeKmYi/NAhs3w3EpH/+h5zH6jc55Q9ADsARCuDzCVtB2SFwXfkxCMHrmqtkOH3641E7vuBoj9B9N+AzpAbVrkadhxs2YvDUYuBurdsPUct3s3PM3vDC+OnPvSpBiYo3VX4cxmomHwBYQaa5JGk6HLRdB1X7Tzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772801678; c=relaxed/relaxed;
	bh=pZ4fXxDMtim7nzB+VGSDkfTL+ULDeL3l1LffnU7S3t8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=oX+0/TvYK++ag69UaoXthris4RZjGQ3xa9uNzVMlmCuO6n1ycgqXEblmkDB+U8JC/EInHkJYhgo2BOruc4iYtlaDhKsO2SElaVW2LNhgMfb126hWj7v0hLFNt29Hx8XHHhc8oru5K/Px5weYVgN0PpKjMPvyqutSI1L9EILxeFhB8WcaGlioVvEcJb+q07/yruucWdIXLuaN+MkEly2ZjEg2fYWdyEKwJVxULEUIHYPd5G5dEYoyxlmNhskQ8Lp8AbCXf7pgHukpw+IRfsJ5gCWis1YP3CePDtbiqetaJfA0STZHWzHM+GajPBEPj24gvQ04+4aNqHee+psIt1Z5jw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS5vx6FTVz3c9x;
	Fri, 06 Mar 2026 23:54:37 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 6 Mar
 2026 20:54:21 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 20:54:21 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 6 Mar 2026 20:54:07 +0800
Subject: [PATCH RFC v2 1/3] dt-bindings: mfd: aspeed,ast2x00-scu: Support
 AST2700 SoC1 pinctrl
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
Message-ID: <20260306-pinctrl-single-bit-v2-1-79918cfab641@aspeedtech.com>
References: <20260306-pinctrl-single-bit-v2-0-79918cfab641@aspeedtech.com>
In-Reply-To: <20260306-pinctrl-single-bit-v2-0-79918cfab641@aspeedtech.com>
To: Linus Walleij <linusw@kernel.org>, Tony Lindgren <tony@atomide.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, "Lee
 Jones" <lee@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
CC: <patrickw3@meta.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<BMC-SW@aspeedtech.com>, <openbmc@lists.ozlabs.org>, Andrew Jeffery
	<andrew@aj.id.au>, <linux-clk@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772801661; l=1558;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=BzFvhYgPn/oe8prIUQyxiCumgoJ6NHcci8RbRvHwpxM=;
 b=u0RRstZsXTYOfeD5pvKBIOVdh7m+XbPQpODSmP0PXchW6G69hkWEjnhXov/LffbV9n4MvZTGc
 2h4uTOk+Y5hAJ1tVbUnTQOPZDrCBRDuYACnR9Bbm45OKEr8oFgFStMr
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 1343F2211DE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.50 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[openbmc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:mid,aspeedtech.com:email,lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,openbmc@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-1444-lists,openbmc=lfdr.de];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

The AST2700 SoC integrates two interconnected SoC instances, each
managed by its own System Control Unit (SCU).

Allow the AST2700 SoC1 pin controller to be described as a child
node of the SCU by extending the compatible strings accepted by
the SCU binding.

There is no functional change to the SCU binding beyond permitting
the aspeed,ast2700-soc1-pinctrl compatible string.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

---
Note:

This patch modifies Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml,
which is also touched by the AST2700 SoC0 pinctrl series and may conflict if
both series are applied independently.

The conflict is trivial as both series add new compatible entries and can be
resolved by keeping both.

See:
https://lore.kernel.org/linux-aspeed/20260306-upstream_pinctrl-v4-1-ad4e8ab8b489@aspeedtech.com/
---
 Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
index a87f31fce019..b81c561d2a8c 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
@@ -87,6 +87,7 @@ patternProperties:
             - aspeed,ast2400-pinctrl
             - aspeed,ast2500-pinctrl
             - aspeed,ast2600-pinctrl
+            - aspeed,ast2700-soc1-pinctrl
 
     required:
       - compatible

-- 
2.34.1


