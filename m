Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3F931FA84
	for <lists+openbmc@lfdr.de>; Fri, 19 Feb 2021 15:26:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dhv5j4Yfbz3cLH
	for <lists+openbmc@lfdr.de>; Sat, 20 Feb 2021 01:26:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=UFpwJQsw;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=FoLOrDxh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=UFpwJQsw; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=FoLOrDxh; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dhv4s4C0Gz30Qj;
 Sat, 20 Feb 2021 01:25:48 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 31E68580342;
 Fri, 19 Feb 2021 09:25:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 19 Feb 2021 09:25:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=FsrzPsv6OPy2s0HzNgRya7RFf2
 dKgOCEMkjhAogzc4Q=; b=UFpwJQswCMtAG9CPQyWnimBuOsUKGXxK/OvHOc5228
 ykTtbpchX2ftZE3Seq9NLdH9lPtpGLn6oyR6dn9tf1A9DfqBOsmy67Ryzc9/tUFB
 OCCFGFv8Tt6fQd/vRc3FQ1vE/H/GVC3l1o7NmVXzJmE3trq+65qvwYGglXijuJ2D
 OxG57HFsYNScFaFNqjT71YkbwL+Nh1Mx7zTXXmAGvDMRZbnQVhQiCrobJqERyDnd
 /uBYKvKIdYSleWdy6AKCqksG4vXlsl7adKqL1y2Fk+4OpDfokA9lsZ96PLE3ymkP
 BE9+0FiWA3OG21EbjOAYslo4J0Yt71cDKTQMB9RS3SfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=FsrzPsv6OPy2s0HzN
 gRya7RFf2dKgOCEMkjhAogzc4Q=; b=FoLOrDxhBbp9a0vOd1lxrfuWfjuBmf8m2
 0IvMCil+cxA7AGG2mdFoZ7c0ZuScCF8NTpjJz1E99jMZKUIlHuFaFuGxhj4eD7r4
 7wDQ7CKwkFhf/yqwfYUMrlxnO9aErp+xofXV+K950oE9i58But3yZcKFMHQom9lV
 VDGwAA2iYn0+NhEz8G8yWF9k3mPgaaWzuFeJPt6JaL60cyFINgRbtbAB6nTSDYAI
 8n4s/McgI7DN+hm9L4ciAiMVOgs2JS0dPuUNBdcAUI8MqhfXN02QLwQ8gX/ifQQJ
 Pz+r2xqBkVQoX9g+Yofd1PGSfqP9LVwYXKRy0Pu94oSctM7LQHVPQ==
X-ME-Sender: <xms:ZsovYDuP-ybKSjMmdXyd93-DYDIMxkwrZU_TLpyf-5bkjgacXO3L4g>
 <xme:ZsovYEcaJRgGaaEVw4c9SRZMN4KsDoVpNkSnHgR6FEwHxXidXRw1NJmNLedfAgxpF
 Cfxr9bUtlVdkt-YfA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucggtffrrghtthgvrhhnpeejgffffedvveekudfhheduffeuudethefhhe
 egvefhlefggfffudefffduteffudenucffohhmrghinhepihhnthgvlhdrtghomhdpghhi
 thhhuhgsrdgtohhmpdgumhhtfhdrohhrghenucfkphepudegrddvrdeluddrfeejnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgif
 segrjhdrihgurdgruh
X-ME-Proxy: <xmx:ZsovYGxSPGDtr989h1CfmmdiV91s6HL_p5FT7fBxxGtdOnBrUMvePw>
 <xmx:ZsovYCOMLxSmL_8SfvpgP5GOMfC5HQcxRJCRl1dOY6nn0r9Z51RMxw>
 <xmx:ZsovYD_hrRbrjyjHFF4mhYkAvM7xQOfFSgd65nTm51xQ5eFb65ZsYA>
 <xmx:aMovYLNiH3Wqj8d2yMrBjUvZM4g1uyIHh9nwomtoM1DCWQ4-tLT-9Q>
Received: from localhost.localdomain
 (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id A2EEE24005D;
 Fri, 19 Feb 2021 09:25:35 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 minyard@acm.org
Subject: [PATCH 00/19] ipmi: Allow raw access to KCS devices
Date: Sat, 20 Feb 2021 00:55:04 +1030
Message-Id: <20210219142523.3464540-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com,
 linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 avifishman70@gmail.com, venture@google.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org,
 lee.jones@linaro.org, chiawei_wang@aspeedtech.com,
 linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

This series is a bit of a mix of things, but its primary purpose is to
expose BMC KCS IPMI devices to userspace in a way that enables userspace
to talk to host firmware using protocols that are not IPMI.  The new
chardev implementation exposes the Input Data Register (IDR), Output
Data Register (ODR) and Status Register (STR) via read() and write(),
and implements poll() for event monitoring.

The existing /dev/ipmi-kcs* chardev interface exposes the KCS devices in
a way which encoded the IPMI protocol in its behaviour. However, as
LPC[0] KCS devices give us bi-directional interrupts between the host
and a BMC with both a data and status byte, they are useful for purposes
beyond IPMI.

As a concrete example, libmctp[1] implements a vendor-defined
host-interface MCTP[2] binding using a combination of LPC Firmware
cycles for bulk data transfer and a KCS device via LPC IO cycles for
out-of-band protocol control messages[3]. This gives a throughput
improvement over the standard KCS binding[4] while continuing to exploit
the ease of setup of the LPC bus for early boot firmware on the host
processor.

The series takes a bit of a winding path to achieve its aim:

1. It begins with patches 1-5 put together by Chia-Wei, which I've
rebased on v5.11. These fix the ASPEED LPC bindings and other non-KCS
LPC-related ASPEED device drivers in a way that enables the SerIRQ
patches at the end of the series. With Joel's review I'm hoping these 5
can go through the aspeed tree, and that the rest can go through the
IPMI tree.

2. Next, patches 6-13 fairly heavily refactor the KCS support in the
IPMI part of the tree, re-architecting things such that it's possible to
support multiple chardev implementations sitting on top of the ASPEED
and Nuvoton device drivers. However, the KCS code didn't really have
great separation of concerns as it stood, so even if we disregard the
multiple-chardev support I think the cleanups are worthwhile.

3. Patch 14 adds some interrupt management capabilities to the KCS
device drivers in preparation for patch 15, which introduces the new
"raw" KCS device interface. I'm not stoked about the device name/path,
so if people are looking to bikeshed something then feel free to lay
into that.

4. The remaining patches switch the ASPEED KCS devicetree binding to
dt-schema, add a new interrupt property to describe the SerIRQ behaviour
of the device and finally clean up Serial IRQ support in the ASPEED KCS
driver.

Rob: The dt-binding patches still come before the relevant driver
changes, I tried to keep the two close together in the series, hence the
bindings changes not being patches 1 and 2.

I've exercised the series under qemu with the rainier-bmc machine plus
some preliminary KCS support[5]. I've also substituted this series in
place of a hacky out-of-tree driver that we've been using for the
libmctp stack and successfully booted the host processor under our
internal full-platform simulation tools for a Rainier system.

Note that this work touches the Nuvoton driver as well as ASPEED's, but
I don't have the capability to test those changes or the IPMI chardev
path. Tested-by tags would be much appreciated if you can exercise one
or both.

Please review!

Andrew

[0] https://www.intel.com/content/dam/www/program/design/us/en/documents/low-pin-count-interface-specification.pdf
[1] https://github.com/openbmc/libmctp/
[2] https://www.dmtf.org/sites/default/files/standards/documents/DSP0236_1.3.1.pdf
[3] https://github.com/openbmc/libmctp/blob/master/docs/bindings/vendor-astlpc.md
[4] https://www.dmtf.org/sites/default/files/standards/documents/DSP0254_1.0.0.pdf
[5] https://github.com/amboar/qemu/tree/kcs

Andrew Jeffery (14):
  ipmi: kcs_bmc_aspeed: Use of match data to extract KCS properties
  ipmi: kcs_bmc: Make status update atomic
  ipmi: kcs_bmc: Rename {read,write}_{status,data}() functions
  ipmi: kcs_bmc: Split out kcs_bmc_cdev_ipmi
  ipmi: kcs_bmc: Turn the driver data-structures inside-out
  ipmi: kcs_bmc: Split headers into device and client
  ipmi: kcs_bmc: Strip private client data from struct kcs_bmc
  ipmi: kcs_bmc: Decouple the IPMI chardev from the core
  ipmi: kcs_bmc: Allow clients to control KCS IRQ state
  ipmi: kcs_bmc: Add a "raw" character device interface
  dt-bindings: ipmi: Convert ASPEED KCS binding to schema
  dt-bindings: ipmi: Add optional SerIRQ property to ASPEED KCS devices
  ipmi: kcs_bmc_aspeed: Implement KCS SerIRQ configuration
  ipmi: kcs_bmc_aspeed: Fix IBFIE typo from datasheet

Chia-Wei, Wang (5):
  dt-bindings: aspeed-lpc: Remove LPC partitioning
  ARM: dts: Remove LPC BMC and Host partitions
  ipmi: kcs: aspeed: Adapt to new LPC DTS layout
  pinctrl: aspeed-g5: Adapt to new LPC device tree layout
  soc: aspeed: Adapt to new LPC device tree layout

 Documentation/ABI/testing/dev-raw-kcs         |  25 +
 .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml | 106 ++++
 .../bindings/ipmi/aspeed-kcs-bmc.txt          |  33 -
 .../devicetree/bindings/mfd/aspeed-lpc.txt    | 100 +--
 arch/arm/boot/dts/aspeed-g4.dtsi              |  68 +--
 arch/arm/boot/dts/aspeed-g5.dtsi              | 119 ++--
 arch/arm/boot/dts/aspeed-g6.dtsi              | 121 ++--
 drivers/char/ipmi/Kconfig                     |  30 +
 drivers/char/ipmi/Makefile                    |   2 +
 drivers/char/ipmi/kcs_bmc.c                   | 532 +++++-----------
 drivers/char/ipmi/kcs_bmc.h                   |  94 +--
 drivers/char/ipmi/kcs_bmc_aspeed.c            | 536 ++++++++++------
 drivers/char/ipmi/kcs_bmc_cdev_ipmi.c         | 570 ++++++++++++++++++
 drivers/char/ipmi/kcs_bmc_cdev_raw.c          | 442 ++++++++++++++
 drivers/char/ipmi/kcs_bmc_client.h            |  47 ++
 drivers/char/ipmi/kcs_bmc_device.h            |  20 +
 drivers/char/ipmi/kcs_bmc_npcm7xx.c           |  98 ++-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c    |  17 +-
 drivers/soc/aspeed/aspeed-lpc-ctrl.c          |  20 +-
 drivers/soc/aspeed/aspeed-lpc-snoop.c         |  23 +-
 20 files changed, 2021 insertions(+), 982 deletions(-)
 create mode 100644 Documentation/ABI/testing/dev-raw-kcs
 create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
 delete mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
 create mode 100644 drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
 create mode 100644 drivers/char/ipmi/kcs_bmc_cdev_raw.c
 create mode 100644 drivers/char/ipmi/kcs_bmc_client.h
 create mode 100644 drivers/char/ipmi/kcs_bmc_device.h

-- 
2.27.0

