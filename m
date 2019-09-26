Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2021FBF420
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 15:36:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fGDC5d1kzDqkX
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 23:36:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="TgE5FxKi"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="SsYq0CRb"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fGBt241wzDqjJ
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 23:35:18 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6310C6C7;
 Thu, 26 Sep 2019 09:35:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Sep 2019 09:35:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=IbxduFF9kTpJy4aT57tILWEc2n
 WgOMaAgzcAENZMAWU=; b=TgE5FxKiAqpYNN5x9Q/AjpNyJHr+3KGA33gIkAWzy5
 CLFyOpnMZyNyMjL+Vc+4A7RWGFZOSS36cJZhvy2OXSoxj7JatTdxZA4LXrBoKyZJ
 QyDkeNjvRdFAJ7fpJXot4IxLbjUxJsk6HRc0SYK/vbtwff86flWpUx2h9YMAqF1n
 hcNoUMboloDMGoCLRqofBUzmWBMyqt+CS7WhmiZ+qePMrnAiBuBnzTMXcYjg7fBM
 erbntPfwEnuPpPFS5Q/qc4xGcRYKMiZmUCQIcYSGSF4tcLsPAPqx082dvODIGkIR
 9WhbdeQRezxBAXV5Od5J5ANs1z+wY9YFx4vRx9jFKeAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=IbxduFF9kTpJy4aT5
 7tILWEc2nWgOMaAgzcAENZMAWU=; b=SsYq0CRbJQ6DPPsM7LE0xagacjIvV7Oly
 2BvyC+D1lMenh5gbPrNfF4bZPQr7c3CMXGKaz598wqRMf9GWv9IJa6elc7PGlVry
 eEDNdIBMio058RKAttBxGxhAKdkCB+ISxGHEGrxjsvrN+Gx/E6lnPb2+Yx0jJuBu
 FZg/u7mgaGYWpneXBjV9+/GboLlLLCbXowiFpzHA4DPf1lckgaFGEiik88ApDA13
 28o+hqkCQhTQeA78PYWyFkEMNPBYP+MsMeC6DkNdDSX2Ch9fIA+SFeD/el8UZUqB
 8K9Llrft8SZs+Xgc5lZa40gY2oT/fqD+r+Ti52bprLaNipzhzaxUw==
X-ME-Sender: <xms:kr6MXb9nkHjZqox3VmAW6Ge0u38uF6Od-kyFpcFsPqpJnj7RBGSlfA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeeggdeihecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
 td
X-ME-Proxy: <xmx:kr6MXaGQ5yCRAaGZqmAF8GDJsu8BnXnEUKjkyI1Crf0trUJTj9VFPA>
 <xmx:kr6MXTmVWdQoIcubuIPw3er4QZqGozZjULtd7vuQ5hpUvYBCmG51EQ>
 <xmx:kr6MXR8iLGywQrTgWSdWuFCGir5OnuEymvi6EtBmnr-hxi1pUrT1zg>
 <xmx:k76MXUXja2kPHnGsB9sd6QuMKLvH_3k0-Mruq4iwLhwyPdTIMdHBEQ>
Received: from mistburn.lan (203-57-215-178.dyn.iinet.net.au [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3F104D6005B;
 Thu, 26 Sep 2019 09:35:11 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 00/15] pinctrl: aspeed-g6: Fixes and features
Date: Thu, 26 Sep 2019 23:05:53 +0930
Message-Id: <20190926133608.30566-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Jeffery <andrew@aj.id.au>, johnny_huang@aspeedtech.com,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

This series addresses several areas of the AST2600 pin controller:

* Fixes for bugs in the existing code
* Addition of I3C bus mux configurations
* Addition of USB support
* Addition of pinconf support

The bulk of the series has been contributed by Johnny Huang - it's good to see
someone else taking up the pinctrl fight :)

Johnny has inspected the mux bit patterns on 2600 hardware and I've done some
smoke testing under qemu, but I'd like to see these patches bake in the OpenBMC
tree before I send them upstream. I'm hoping to sneak them into 5.4 still as
it's a new driver.

Andrew

Andrew Jeffery (6):
  pinctrl: aspeed-g6: Sort pins for sanity
  pinctrl: aspeed-g6: Fix I2C14 SDA description
  ARM: dts: aspeed-g6: Fix EMMC function in pinctrl dtsi
  ARM: dts: aspeed-g6: Add pinctrl properties to MDIO nodes
  ARM: dts: ast2600-evb: Add pinmux properties for enabled MACs
  ARM: dts: aspeed-g6: Add missing pinctrl-names property to I2C nodes

Johnny Huang (9):
  pinctrl: aspeed-g6: Fix I3C3/I3C4 pinmux configuration
  pinctrl: aspeed-g6: Fix UART13 group pinmux
  pinctrl: aspeed-g6: Rename SD3 to EMMC and rework pin groups
  pinctrl: aspeed-g6: Add AST2600 I3C1 and I3C2 pinmux config
  pinctrl: aspeed-g6: Add support for the AST2600 USB pinmux
  pinctrl: aspeed: Add ASPEED_SB_PINCONF() helper
  pinctrl: aspeed: Move aspeed_pin_config_map to separate source file
  pinctrl: aspeed: Use masks to describe pinconf bitfields
  pinctrl: aspeed-g6: Add AST2600 pinconf support

 arch/arm/boot/dts/aspeed-ast2600-evb.dts   |   9 +
 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi   |   9 +-
 arch/arm/boot/dts/aspeed-g6.dtsi           |  23 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 170 +++----
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 212 +++++----
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 511 ++++++++++++++++++---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c    |  50 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.h    |  38 +-
 drivers/pinctrl/aspeed/pinmux-aspeed.h     |   2 +
 9 files changed, 724 insertions(+), 300 deletions(-)

-- 
2.20.1

