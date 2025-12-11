Return-Path: <openbmc+bounces-985-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 539ABCB5283
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 09:46:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRmQs0xlQz2xQr;
	Thu, 11 Dec 2025 19:46:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765442789;
	cv=none; b=hhunO3zGFyJjRCLlGhfEsHcANuIxboQa0DS8YN3dMjekpkOezRBNAtQT2iN1RC6Ut4pUpIwCo6SLL52ydUoLl5RqeNdO7LXRXtIZatVouxqpduOg0wYMHxZcxOHbh3Z+CDursxQ3Dke17LmBY77bn4CIvmOHGW1yF08ekBoEjW3PN3bIQwKK81E2Wqqf/M1uZnNFHpeTGgYtLBMiidqKK1pC5CFEy3CgFi573C8YQ/GstgETaL0RhKXvPqA6+/YnQp/GSE0fWWhi3w5op3wu1sOgw/hqcfZMTM6wBrUfo0pJZmUzGEnwM3mr9hKYLGKE1nJD2Ha/QgHM68utVirZ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765442789; c=relaxed/relaxed;
	bh=e/DM6Sr1SqiFaFi6So6itNGziX/g9agVvmrw9nqOKwk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MWsF9GKsloT9OJ9uyQIL5nqZ/QPJXSF+oGBucO4zM0geQ1YHZ9DtEDucT6cPQms3ydCtKAQKuRpHBH6WSAWOaDODuZp++jpf8IpLzqavRIHyx7v7dH7ArAgzUnhifa9SxFlOvXUOduPg/bhBGGwemiaefgaP/Vsr7XUQyUGyP6x7B0VfirBSrN5nZcbIPizEA+uBIJxIecPvkH8MSFyoY7xPk8Mu0M0bSZ6nQ/x8YXUQPZTIPM1yA5MV5ip6CnhDjoHeNEbZD9J1vNAcrUNmoFeIcwIQB0P59IT57PHFSKO1cpoBxLGUshNOqxH5DViZctAeC+7qqIap2dyTxu/tAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bqC5HF97; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bqC5HF97;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRmQq4MBvz2xLR;
	Thu, 11 Dec 2025 19:46:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442785;
	bh=e/DM6Sr1SqiFaFi6So6itNGziX/g9agVvmrw9nqOKwk=;
	h=From:Subject:Date:To:Cc;
	b=bqC5HF97IEXGGiwn8BjKImcZTCClNnB5F20Ne02GYuzhc+xDMiDRF+Z09oKeAgrrL
	 jLJwO0XqylJgqUw5ZMQxQBGVLJk8bZNZm//deP56z5ytmmRPS1z919GTDPdpgieASR
	 wQj3FYYvWzGaCnsX7lvoNg6pAbH8wMrWcz+aeqHbvZsOqDZNdr6zUbki4wtinbPe/p
	 YEMg+SviXUlGezg5bkwlU/iDzeNrtJ4W0Viu8jpT69TRVD/cg7WOIPEiaS8gkz2iCb
	 W68/0xn4kthIfGBvzsjLKS29+37YApjp2QqNC4f8WR7bnVOuDqSn7QTMljkot5glDw
	 DoCvbsMthhpKQ==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 490B164DF5;
	Thu, 11 Dec 2025 16:46:19 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH RFC 00/16] Eliminate warnings for AST2500 and AST2600 EVB
 devicetrees
Date: Thu, 11 Dec 2025 17:45:42 +0900
Message-Id: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
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
X-B4-Tracking: v=1; b=H4sIALeEOmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0ND3ZTUMt2UEt3yxKK8zLz0Yt3EnBzdpBRTC1OTJAOTFDMDJaDOgqL
 UtMwKsKnRSkFuzkqxtbUAFLhwe2oAAAA=
X-Change-ID: 20251211-dev-dt-warnings-all-bd5854b04d60
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

Hi all,

This series removes the remaining warnings produced by `make
CHECK_DTBS=y ...` for the AST2500 and AST2600 EVBs and their related
DTSIs. The tidy-up has the usual benefit of making it clear to
contributors that any warnings are likely their own to fix before their
patches will be considered for merging.

I've framed it as an RFC with all patches contained in the one series
so the goal is clear, we can see what's needed to reach it, and we can
decide whether and how it should be split or merged going forward.

As it stands there's little in the way of code change, except to
pinctrl (though also not much there). As such I've included the
binding maintainers and subsystem lists as recipients but not yet Cc'ed
subsystem maintainers directly because there are quite a few and I hope
to avoid mostly uninteresting patches being a source of irritation.

The patches fall into several groups:

Patch 1:
  Rob's conversion of the PWM/tach binding to DT schema with fixes
  applied for the license and typos identified by Krzysztof.

Patches 2-5:
  Fixes for the warnings related to the LPC and pinctrl nodes, touching
  relevant drivers and the devicetrees.

  I expect that if this approach is acceptable that we'll need to split
  application of the patches across successive release cycles, with the
  driver changes going in first.

Patches 6-8:
  Fix MMC/SDHCI warnings, touching the relevant binding and devicetrees

Patches 9-10:
  Clarify the relationships between the ACRY and AHB controller

Patches 11-16:
  The remaining pieces that eliminate the warnings

I'm at plumbers so don't have hardware on hand to test with, but some
brief smoke tests under qemu look okay. Given that it's all RFC that
should be enough for the moment. I'll do more testing after discussions
and when I have boards at hand.

Please review!

Andrew

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
Andrew Jeffery (15):
      pinctrl: aspeed: g5: Constrain LPC binding revision workaround to AST2500
      pinctrl: aspeed: g5: Allow use of LPC node instead of LPC host controller
      ARM: dts: aspeed: g5: Use LPC phandle for pinctrl aspeed,external-nodes
      ARM: dts: aspeed: Remove unspecified LPC host controller node
      dt-bindings: mmc: Switch ref to sdhci-common.yaml
      ARM: dts: aspeed: Remove sdhci-drive-type property from AST2600 EVB
      ARM: dts: aspeed: Use specified wp-inverted property for AST2600 EVB
      dt-bindings: bus: aspeed: Require syscon for AST2600 AHB controller
      dt-bindings: crypto: Document aspeed,ahbc property for Aspeed ACRY
      ARM: dts: aspeed: Drop syscon compatible from EDAC in g6 dtsi
      ARM: dts: aspeed: g6: Drop unspecified aspeed,ast2600-udma node
      ARM: dts: aspeed: ast2600-evb: Tidy up A0 work-around for UART5
      dt-bindings: iio: adc: Allow interrupts property for AST2600
      ARM: dts: aspeed: g6: Drop clocks property from arm,armv7-timer
      dt-bindings: mfd: Document smp-memram node for AST2600 SCU

Rob Herring (Arm) (1):
      dt-bindings: hwmon: Convert aspeed,ast2400-pwm-tacho to DT schema

 .../bindings/bus/aspeed,ast2600-ahbc.yaml          |   8 +-
 .../bindings/crypto/aspeed,ast2600-acry.yaml       |   7 ++
 .../bindings/hwmon/aspeed,ast2400-pwm-tacho.yaml   | 106 +++++++++++++++++++++
 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt |  73 --------------
 .../bindings/iio/adc/aspeed,ast2600-adc.yaml       |   3 +
 .../bindings/mfd/aspeed,ast2x00-scu.yaml           |  18 ++++
 .../devicetree/bindings/mmc/aspeed,sdhci.yaml      |   2 +-
 arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts    |   7 +-
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    |   4 -
 arch/arm/boot/dts/aspeed/aspeed-g4.dtsi            |   5 -
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi            |   8 +-
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            |  17 +---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |  32 ++++---
 13 files changed, 165 insertions(+), 125 deletions(-)
---
base-commit: 5ce74bc1b7cb2732b22f9c93082545bc655d6547
change-id: 20251211-dev-dt-warnings-all-bd5854b04d60

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


