Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2323039F404
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 12:48:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fzn653p5Yz3079
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 20:48:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=VzWccjlc;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=dfNq/rDX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=VzWccjlc; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=dfNq/rDX; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzn5d43ycz2y0C;
 Tue,  8 Jun 2021 20:48:20 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id EF2555804DB;
 Tue,  8 Jun 2021 06:48:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 08 Jun 2021 06:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=hDFhnDxEtjMcaTbXERTDvsX/xK
 lhpV/0Oa1YnvfSBwI=; b=VzWccjlcIu/Qm8khATcLiatSIK4IEbfYC2dsISfeeA
 i92SLTkNHZ08w6UN2FVP4ipS79QVHJtEsiLKKbtnK38U7fvk0jcdjNCOPz/LfW/z
 4wlTdf2ko6wTDEcEQ+1IOtHLN046cfPgzC0YpWoaioH7zB/qO1WF57edoDzsxQ7d
 PhyIUXwSZnZKGggJSE10w5wfRgRwg8IYg0xWk15IG6datZfVaKfOE75QIFTrgK0u
 s6ZXWrwSN+Po9tvspuNKAQgj/Kn6U8Ly5foZoukqp8sFIYWGrn61G5rvL/DndudU
 r2HY4+VJo8HhnCsG6slFQfThm1sxwgGD1kh29VGnJB0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=hDFhnDxEtjMcaTbXE
 RTDvsX/xKlhpV/0Oa1YnvfSBwI=; b=dfNq/rDX+pHeucY114zvkey1sJz3QecR/
 qNDIrc0HuESLEfqmxz6/EkN88sK+WySzZF89ZN3p//UakioEhSeHfGThGXNoAJl0
 6ZhBe84FpBUzymjf8v2CryRjT8jxOD8FEa2gNQ+lHP+HKqzh3cT4WekBFssQTsGH
 n/8QVXgrbNs+TISI+ONjwA73IkN+dsv+pmIsojNShLKslMiWj7+5iXtjJ+Vz2QTi
 Dj/na/T/TuBCifp1FQW9yoAIVPHvf7ogrZm+pHSjHX0FJUzg1al2hQvNnAAr2ZVD
 bdMmGP3mpIjOKd7n6u1zP8X4nH9pKhIDCIKuVoUuk3fhuhcSuAUsA==
X-ME-Sender: <xms:7Eq_YMPfMARrNa2FROCibgq5RnHrEtlBb2FocMegwFBR5JYti9QfvQ>
 <xme:7Eq_YC-UklsgWrtMdjbRBz14R5pFInUbA1uE9WSJvEuEtzVNuv2IQdZf3KAZ3ynPv
 z9DZg3QYQqnkAFvdw>
X-ME-Received: <xmr:7Eq_YDSqPwNJ5Ctt4jD5E1-JAadRXCAExuScUfyIT88E5-J3eAiMKEk1pcrXdRY5473A8zuMqLcribwTfCXh9VtiWyVEKNH2TVM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtledgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuggftrfgrthhtvghrnhepieetheduveelhfdvvdejleeuhfelteevhe
 ffgfeitdefgeekjeefieevgfehhefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurh
 gvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:7Eq_YEuc2dnPMb_lmd1P4w3j_eyeWGje2ByH7dY0SRAw8r2kO_yK0A>
 <xmx:7Eq_YEeyep8ncAZ4ZvMnYyDXi7VZh0avj6DitWAlrGbJR1dETLDhKw>
 <xmx:7Eq_YI1OxI_sH4h6tQkwAV79ZUsGjlNjLX3tacOa3ZsJlXa6__zGCQ>
 <xmx:70q_YHutjtwjwfw5PI4P_jvcQrKDgTUJ1Bl1fT6JjIOPdHVuYMs35A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Jun 2021 06:48:06 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 minyard@acm.org
Subject: [PATCH v4 00/16] ipmi: Allow raw access to KCS devices
Date: Tue,  8 Jun 2021 20:17:41 +0930
Message-Id: <20210608104757.582199-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
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
 linux-aspeed@lists.ozlabs.org, KWLIU@nuvoton.com, avifishman70@gmail.com,
 venture@google.com, chiawei_wang@aspeedtech.com, linux-kernel@vger.kernel.org,
 tali.perry1@gmail.com, robh+dt@kernel.org, arnd@arndb.de, zweiss@equinix.com,
 linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


Hello,

This is the 4th spin of the series refactoring the keyboard-controller-style
device drivers in the IPMI subsystem.

v3 can be found at:

https://lore.kernel.org/lkml/20210510054213.1610760-1-andrew@aj.id.au/

v4:

* Makes kcs_bmc_add_device() return an error if no client successfully
  initialised with respect to the binding of the device driver
* Retains the existing single-open semantics (v3 allowed multiple-open)
* Fixes the OBE macro for the NPCM7xx KCS driver
* Cleans up Yoda-style masks (mask constant on the LHS rather than RHS)
* Cleans up includes in kcs_bmc_client.h
* Adds some comments to the SerIO adapter to clarify object lifetimes

Previously:

Changes in v3:

* The series was rebased onto v5.13-rc1
* v5.13-rc1 includes Chiawei's patches reworking the LPC devicetree bindings,
  so they're no-longer required in the series.
* After some discussion with Arnd[1] and investigating the serio subsystem,
  I've replaced the "raw" KCS driver (patch 16/21 in v2) with a serio adaptor
  (patch 11/16 in this series). The adaptor allows us to take advantage of the
  existing chardevs provided by serio.

[1] https://lore.kernel.org/linux-arm-kernel/37e75b07-a5c6-422f-84b3-54f2bea0b917@www.fastmail.com/

Changes in v2 include:

* A rebase onto v5.12-rc2
* Incorporation of off-list feedback on SerIRQ configuration from
  Chiawei
* Further validation on hardware for ASPEED KCS devices 2, 3 and 4
* Lifting the existing single-open constraint of the IPMI chardev
* Fixes addressing Rob's feedback on the conversion of the ASPEED KCS
  binding to dt-schema
* Fixes addressing Rob's feedback on the new aspeed,lpc-interrupts
  property definition for the ASPEED KCS binding

Please test and review!

Andrew

Andrew Jeffery (16):
  ipmi: kcs_bmc_aspeed: Use of match data to extract KCS properties
  ipmi: kcs_bmc: Make status update atomic
  ipmi: kcs_bmc: Rename {read,write}_{status,data}() functions
  ipmi: kcs_bmc: Split out kcs_bmc_cdev_ipmi
  ipmi: kcs_bmc: Turn the driver data-structures inside-out
  ipmi: kcs_bmc: Split headers into device and client
  ipmi: kcs_bmc: Strip private client data from struct kcs_bmc
  ipmi: kcs_bmc: Decouple the IPMI chardev from the core
  ipmi: kcs_bmc: Allow clients to control KCS IRQ state
  ipmi: kcs_bmc: Enable IBF on open
  ipmi: kcs_bmc: Add serio adaptor
  dt-bindings: ipmi: Convert ASPEED KCS binding to schema
  dt-bindings: ipmi: Add optional SerIRQ property to ASPEED KCS devices
  ipmi: kcs_bmc_aspeed: Implement KCS SerIRQ configuration
  ipmi: kcs_bmc_aspeed: Fix IBFIE typo from datasheet
  ipmi: kcs_bmc_aspeed: Optionally apply status address

 .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml | 106 +++
 .../bindings/ipmi/aspeed-kcs-bmc.txt          |  33 -
 drivers/char/ipmi/Kconfig                     |  27 +
 drivers/char/ipmi/Makefile                    |   2 +
 drivers/char/ipmi/kcs_bmc.c                   | 523 ++++-----------
 drivers/char/ipmi/kcs_bmc.h                   |  92 +--
 drivers/char/ipmi/kcs_bmc_aspeed.c            | 633 +++++++++++++-----
 drivers/char/ipmi/kcs_bmc_cdev_ipmi.c         | 568 ++++++++++++++++
 drivers/char/ipmi/kcs_bmc_client.h            |  45 ++
 drivers/char/ipmi/kcs_bmc_device.h            |  22 +
 drivers/char/ipmi/kcs_bmc_npcm7xx.c           |  92 ++-
 drivers/char/ipmi/kcs_bmc_serio.c             | 157 +++++
 12 files changed, 1594 insertions(+), 706 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
 delete mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
 create mode 100644 drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
 create mode 100644 drivers/char/ipmi/kcs_bmc_client.h
 create mode 100644 drivers/char/ipmi/kcs_bmc_device.h
 create mode 100644 drivers/char/ipmi/kcs_bmc_serio.c

-- 
2.30.2

