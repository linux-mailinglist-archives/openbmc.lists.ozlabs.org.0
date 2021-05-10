Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A52C377C7F
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 08:51:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdsCX1tmCz2yxr
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 16:51:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=heL4L8mp;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QPfHQage;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=heL4L8mp; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=QPfHQage; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdsBc0NYTz2y08
 for <openbmc@lists.ozlabs.org>; Mon, 10 May 2021 16:50:31 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E463716D2;
 Mon, 10 May 2021 02:50:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 10 May 2021 02:50:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=BzRvb1kBch4Kp6mLiW/E5WMrXq
 br6NtKobAvE4Qk1p0=; b=heL4L8mpoYBTuaj22sy/rsSc/Hnb7wHTAiWTkZEDrb
 C6vqm5Fiu9rxuq4WR89uoWbJJ9WtZzk6VRlPua2bM7CDuECf2CK7z4fGFOcoYHZb
 nqk4q5d0CmITqbW+6WOY9UbZm06SZutwVoFRZ5meYCwKh5WGzK4kyzng/VITTeuV
 ky8VVwpq4aA2LI0Du7vznR0yEaPlkI68f1ikVc9it3fMs+3r3PQzMNl3DpvnVBlA
 rB2ujujW/UkGgGzzwmBehMXVUUlIaStAv6PK4NSqSg3e6vHZTP9GPSiooX6AU3/+
 nYvFvuzKHAoHwQbBm3oiyYqBMw1oPaFLn5gZk0u7ZJsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=BzRvb1kBch4Kp6mLi
 W/E5WMrXqbr6NtKobAvE4Qk1p0=; b=QPfHQagemovLGg3P8FksV5Hd+miFOOOLd
 AlRfT5ZS9hApNhPczC208Qogtc4ZKzC4gpM9gDV/RDF3EZYp+pzXucj/+PZrdmiF
 qwCK1TsjeqXzK8SQPWZl1hByCI92I+qfCyJL4fydQpyqCpDkJ0LIVPfonoYxZXyu
 I7UiCZ95YB3575c8kyjRBcrI8uK+UPGqvz5GOKn4exU8Q3bFAGUgeuhOuou9u6n3
 HRg0RPnZDRB52IseTuwgWLG2W3ncm9qzrRv7mc97GVHzrsjKg57kn0gpWo7aebba
 927qjal+vJzWeVEP0+v1Fm4lsYdrlIJc4mgNH0Q4ooiwGLBe7ZguQ==
X-ME-Sender: <xms:sNeYYGvDwslMygNoY7KWi59blvnSKr-xK_9OEEG1Sj9LAqWTo_6MbA>
 <xme:sNeYYLdyGRydPzP8qJoNJtB4D1S9LsNC4wYWJvpiWbmnhd6XQGW5xq1KKmMbdOFS7
 myg3hje4_JerzBWmg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegjedguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeeiteehudevlefhvddvjeeluefhleetve
 ehfffgiedtfeegkeejfeeivefgheehgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhg
 necukfhppedvtdefrdehjedrvdduhedrkeenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:sNeYYBya-j2mVe9v076lpaKANVvvzePxhIzVwkwUzlK-nx286qZjig>
 <xmx:sNeYYBMy3Chc20UFd84kdkl_tqT0s8SRyueNpegz6ONZ34gW0W6N4Q>
 <xmx:sNeYYG8ohhregW-9qKZZpBNGH8Zaxu90Khn15FE1KDiXXrt7C2iEHQ>
 <xmx:sdeYYHKlvhqiz7NgR0cDv5hHrasLHQ-AjaJ6TdWCyH7UIUyMvoaZRg>
Received: from localhost.localdomain (203-57-215-8.dyn.iinet.net.au
 [203.57.215.8]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 10 May 2021 02:50:23 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.10 v3 00/18] ipmi: Allow raw access to KCS devices
Date: Mon, 10 May 2021 16:19:37 +0930
Message-Id: <20210510064955.1704652-1-andrew@aj.id.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

This series is (mostly) a backport of v3 I sent upstream:

https://lore.kernel.org/lkml/20210510054213.1610760-1-andrew@aj.id.au/T/#m26377de5e29c6d7d8091a6584457657e5f740dbc

The patches that aren't on the upstream lists are 17 and 18.

There's no reason that 17 isn't on the upstream lists, and I'll send it shortly
(too many branches lying around).

As for patch 18, it's a more thorough implementation of the hacky driver we
already have in the OpenBMC tree at drivers/misc/mctp-lpc.c. mctp-lpc.c only
worked against KCS channel 4 whereas kcs_bmc_cdev_raw will work with any KCS
channel in the system. We need to switch away from KCS channel 4 on the Aspeed
BMCs due to the way the status bits are initialised in hardware[1].

Both mctp-lpc.c and kcs_bmc_cdev_raw.c will go away in the mid-term once we have
jk's MCTP subsystem merged into net/ and I've implemented the in-kernel LPC
binding against it. In the mean time, kcs_bmc_cdev_raw.c replaces mctp-lpc.c.
Its chardev semantics are a superset of mctp-lpc.c so there is no userspace
impact aside from needing to ship a udev rule to account for the name of the
device node.

I plan to send a follow up series to do the switch-over in the devicetree and
remove mctp-lpc.c (which also removes a hack from the devicetree).

Aside from patch 18 (which is temporary) there should be no userspace-visible
impact from the series. Modulo bugs, this should make it safe to merge now.

I've tested the series on a Rainier system and it can boot the host without
issue. I've also exercised all the insmod/rmmod combinations with the kernel
debug config options listed in Documentation/process/submit-checklist.rst
enabled and found no issues.

Please take a look!

Andrew

[1] They're initialised in IPMI style, with some bits set to indicate the
channel isn't active. Unfortunately these are the same bits we chose to
represent the channel as active for the LPC MCTP binding.

Andrew Jeffery (18):
  ipmi: kcs_bmc_aspeed: Use of match data to extract KCS properties
  ipmi: kcs_bmc: Make status update atomic
  ipmi: kcs_bmc: Rename {read,write}_{status,data}() functions
  ipmi: kcs_bmc: Split out kcs_bmc_cdev_ipmi
  ipmi: kcs_bmc: Turn the driver data-structures inside-out
  ipmi: kcs_bmc: Split headers into device and client
  ipmi: kcs_bmc: Strip private client data from struct kcs_bmc
  ipmi: kcs_bmc: Decouple the IPMI chardev from the core
  ipmi: kcs_bmc: Allow clients to control KCS IRQ state
  ipmi: kcs_bmc: Don't enforce single-open policy in the kernel
  ipmi: kcs_bmc: Add serio adaptor
  dt-bindings: ipmi: Convert ASPEED KCS binding to schema
  dt-bindings: ipmi: Add optional SerIRQ property to ASPEED KCS devices
  ipmi: kcs_bmc_aspeed: Implement KCS SerIRQ configuration
  ipmi: kcs_bmc_aspeed: Fix IBFIE typo from datasheet
  ipmi: kcs_bmc_aspeed: Optionally apply status address
  ARM: dts: rainier: Enable KCS channel 2
  ipmi: kcs_bmc: Add a "raw" character device interface

 Documentation/ABI/testing/dev-raw-kcs         |  25 +
 .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml | 106 +++
 .../bindings/ipmi/aspeed-kcs-bmc.txt          |  33 -
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  |   5 +
 drivers/char/ipmi/Kconfig                     |  44 ++
 drivers/char/ipmi/Makefile                    |   3 +
 drivers/char/ipmi/kcs_bmc.c                   | 526 ++++-----------
 drivers/char/ipmi/kcs_bmc.h                   |  92 +--
 drivers/char/ipmi/kcs_bmc_aspeed.c            | 637 +++++++++++++-----
 drivers/char/ipmi/kcs_bmc_cdev_ipmi.c         | 568 ++++++++++++++++
 drivers/char/ipmi/kcs_bmc_cdev_raw.c          | 440 ++++++++++++
 drivers/char/ipmi/kcs_bmc_client.h            |  48 ++
 drivers/char/ipmi/kcs_bmc_device.h            |  22 +
 drivers/char/ipmi/kcs_bmc_npcm7xx.c           |  94 ++-
 drivers/char/ipmi/kcs_bmc_serio.c             | 151 +++++
 15 files changed, 2071 insertions(+), 723 deletions(-)
 create mode 100644 Documentation/ABI/testing/dev-raw-kcs
 create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
 delete mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
 create mode 100644 drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
 create mode 100644 drivers/char/ipmi/kcs_bmc_cdev_raw.c
 create mode 100644 drivers/char/ipmi/kcs_bmc_client.h
 create mode 100644 drivers/char/ipmi/kcs_bmc_device.h
 create mode 100644 drivers/char/ipmi/kcs_bmc_serio.c

-- 
2.27.0

