Return-Path: <openbmc+bounces-1443-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPojE5HOqml4XQEAu9opvQ
	(envelope-from <openbmc+bounces-1443-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Fri, 06 Mar 2026 13:54:41 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D3F2211A0
	for <lists+openbmc@lfdr.de>; Fri, 06 Mar 2026 13:54:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS5vx4P7Fz3bnJ;
	Fri, 06 Mar 2026 23:54:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772801677;
	cv=none; b=cxSdV2nFE2tsWHso154E9X+bTRLTBTnV1Hu6zZCiLMqogEzuVzTBipZLYmEfpSn2PMxvt30WV8PijMYH2xhuzD3xqP+FZ5OHBJGPb4Vuw7ngmvoNbNxLyc8Dft68leKdxoGcstKi8Vob5OteGmV3/d3Zn1TpopZUyxdoOlVIV0Nhu4p5RJAAsW2J5d/oaQzPqE2LD+x92PTjrCBNNvNZpqBX+/AqxuQi7TcR2GVr7lDPLpusIciuekbDCb0o+XOBP9SNhXOTLcJUJ5+0VKJp5bAgMJIHbrqqXtzfXvZt+fwuhsjj/gJA17l6IJ5ONVK2ATYm99XlVNTTgXnK1ZV/6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772801677; c=relaxed/relaxed;
	bh=KKkuAbOfK+Xms3bT2Y9Dwq2okjxn8DYWqAZp2qZr8ME=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Y2xCMPxgf1UoxXcA2nKEHoC40flDCG4q/Kxs/vdUSBfbee12RjKdBB0jy/HwddkUujelRldv5i/4uVQ7LWVN7OKCYgL718ehV9F/ZeOwIE52vlhOZorfB+FJj0SpC3/bpi6MPDkPldfDXiF6SM45YinegBy1FQjV0tEv4JV7T3Xbq7NSFaf8HqIMES79pmCWjc2hcy4K/QmesnSv2DUaMtl7YepgTx6+qrB2nVmW0nt5gTgRkTfuoTsdLqHNLI41bn2Auzb3wdX30Ad5zzN3XPazrkIWlOT9MU30ehgMGXk7F18K9JTzbo9EihnUDU3ldo2qHxbJgca3frW0hdDXqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS5vw3xm7z30T9;
	Fri, 06 Mar 2026 23:54:36 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 6 Mar
 2026 20:54:21 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 20:54:21 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH RFC v2 0/3] pinctrl: aspeed: Add AST2700 SoC1 support
Date: Fri, 6 Mar 2026 20:54:06 +0800
Message-ID: <20260306-pinctrl-single-bit-v2-0-79918cfab641@aspeedtech.com>
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
X-B4-Tracking: v=1; b=H4sIAG7OqmkC/22NwQqDMBBEf0X23C3JSsX2VCj0A3otHjRudMEmk
 gRpEf+9QXrs8c0wb1aIHIQjXIoVAi8SxbsMdCjAjK0bGKXPDKSoUqQ1zuJMChNGccPE2EnCviV
 dWqrJnE+Qh3NgK+9d+oTH/QZNDkeJyYfPfrTovfo5y3/ORaNCUylLtqsV2+7axpm5T2zGo/Eva
 LZt+wL3C6+FvgAAAA==
X-Change-ID: 20260211-pinctrl-single-bit-da213f282c95
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772801661; l=3185;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=FgiYEQd/P2zQqeWQzEAv96N7SJQXOUfd3voSn7UKLcw=;
 b=OhK+Shi+Y07/ZBUyGlUufjEdu0QvSIE8H2raDh9DupNusnglAd76Kyexn1MvtHR6BtL0JvD6L
 xZb/zExG+PyBJsauseKS+YVku1jBM/b8mL31HyYHs6Lu7zucY2IIu3g
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 62D3F2211A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.50 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[openbmc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:mid,aspeedtech.com:email,lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,openbmc@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-1443-lists,openbmc=lfdr.de];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Legacy ASPEED pin controllers have historically not had a coherent
register interface. Control fields often had no consistent mapping to
individual pins, and configuring a function frequently required
coordinating multiple control bits across several registers. As a
result, the existing ASPEED pinctrl drivers rely on complex macro
infrastructure to describe the dependencies between pins, functions,
and register fields.

The pin controller for SoC1 in the AST2700 breaks from this legacy
design.

For SoC1, each pin maps directly to a dedicated function field in the
SCU register space that determines the active mux function for that
pin. This results in a much more regular register layout compared to
previous generations.

While the behaviour is conceptually similar to pinctrl-single, the
register layout and configuration model differ enough that reusing
pinctrl-single directly is not practical. Therefore this driver is
implemented as a SoC-specific pinctrl driver using static data tables
to describe the register layout.

The binding reuses the standard pinmux and generic pin configuration
schemas and does not introduce any custom Devicetree properties.

This series touches some of the same files as the AST2700 SoC0 pinctrl
series and may conflict if the two series are applied independently.

Known overlap includes:

  - Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
  - drivers/pinctrl/aspeed/Kconfig
  - drivers/pinctrl/aspeed/Makefile

The AST2700 SoC0 series can be found at:

https://lore.kernel.org/linux-aspeed/20260306-upstream_pinctrl-v4-0-ad4e8ab8b489@aspeedtech.com/

A binding example is not yet provided as there were differing opinions
during review about whether it should live in the SCU binding or the
pinctrl binding. I can add one in a follow-up revision once the
preferred location is agreed.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
Changes in v2:
- Updated the series title to focus on AST2700 SoC1 support.
- Reworked implementation to use static SoC-specific layout tables
  instead of a generic packed-field model.
- Dropped the generic "pinctrl-packed" driver approach.
- Removed custom Devicetree properties.
- Updated binding to reuse standard pinmux and generic pin
  configuration schemas.
- Link to v1: https://lore.kernel.org/r/20260213-pinctrl-single-bit-v1-0-c60f2fb80efb@aspeedtech.com

---
Billy Tsai (3):
      dt-bindings: mfd: aspeed,ast2x00-scu: Support AST2700 SoC1 pinctrl
      dt-bindings: pinctrl: Add aspeed,ast2700-soc1-pinctrl
      pinctrl: aspeed: Add AST2700 SoC1 support

 .../bindings/mfd/aspeed,ast2x00-scu.yaml           |    1 +
 .../pinctrl/aspeed,ast2700-soc1-pinctrl.yaml       |  449 ++++++
 drivers/pinctrl/aspeed/Kconfig                     |   13 +
 drivers/pinctrl/aspeed/Makefile                    |    1 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c    | 1573 ++++++++++++++++++++
 5 files changed, 2037 insertions(+)
---
base-commit: af4e9ef3d78420feb8fe58cd9a1ab80c501b3c08
change-id: 20260211-pinctrl-single-bit-da213f282c95

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


