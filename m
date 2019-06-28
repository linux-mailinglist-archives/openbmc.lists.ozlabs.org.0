Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D79459178
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 04:46:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zh3s4m39zDqSR
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 12:46:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="NtUdJbkc"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="1wH69+gb"; dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZgvW6C0PzDqPW;
 Fri, 28 Jun 2019 12:39:18 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 815292AF1;
 Thu, 27 Jun 2019 22:39:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 27 Jun 2019 22:39:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=yaZ8S1F4kpu7z+66z1meDyHJPf
 imSKA8ebK+XQtSMvQ=; b=NtUdJbkc1H6xTV2I1gWf5YqUN4TAuHw7T6lBKjQdqW
 anSWElodRu3vvtJkIhAGW9GBuDMJ+OCXK8YiAZtaHQ0xn+6b2qRKzMeedsmj4e33
 L4P2AyyQoRZbisN/lEDLaWuzc85pA0+bleB9Tz3/JitwdMpRB3gPDr3FPxSSFX7j
 fi52LZv3OR5CS1PiaI2YYMKGZNmniqHdxx0mxrc0HnzU+y8b3zBgD7/XB7WNixzq
 axipiLsaJO5qo22jLQ2nFNj+gZBxp8hJuos2QHmARFJGTMSRcINCgSBesivJTKiJ
 Zb6DlX1TGKZQ/TdFsG5rlO61sFNPdLMw9E+zMCX9sTXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=yaZ8S1F4kpu7z+66z
 1meDyHJPfimSKA8ebK+XQtSMvQ=; b=1wH69+gbM+nYJEPjyqCx+VxVugCPiDcZb
 xVbI3FrgkTTrAcTAJQCRwBbqrUkcGDFRGULJAkwQTW5PWux+GroMcqTzUzdXz6Z0
 Gc2+xascjMVMjtsLeQElKVrlCY+BtgOU2r0wxKxGh4Z6y4V/RPu9pPwcXb2ZNTeL
 FH67M8iTbfMuxBQiWiKG1dUoe6LcG/9MMGE20T9Nz3Iuknxv9gGhIoc1xKzwZZ/k
 x3kAJHjYrTPRSgVlebStgrVTGvxa/TNS5a0jGneKgMybE8UXo2a8bNlZjhj5y2MZ
 n6I9J4yb+V2cDNHgMejWHIk8rfxHcn9o4YcHxMoS+AzI/d61cPm6g==
X-ME-Sender: <xms:0n0VXf4vXXZim-nddahFx3PYbz0h9eHXRfbqeFD9uDu8QCVQcODwZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudelgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucffohhmrghinhepshhpihhnihgtshdrnhgvthenucfkphepvddtvddrke
 durddukedrfedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhi
 ugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:0n0VXYnkZJjFZXe-swgjdqTBDjNLGt6-jADzwyO9MUXnSLF7_Vij5w>
 <xmx:0n0VXQS_V01O7qUlm_VNF49YQerGc5rbEogO6QskTDtCeYJhLj7uIQ>
 <xmx:0n0VXXFclzcNw5DE0TuIlnwYKAhk4-Ukygs9G-kLM9_vCrLGJgzZ8Q>
 <xmx:030VXTVX5_S09UVLkYsCfSas_ol6uZ3C5_4SUe_YrjcwZdWH7S1v_A>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id B68FC380075;
 Thu, 27 Jun 2019 22:39:10 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Subject: [PATCH v2 0/8] pinctrl: aspeed: Preparation for AST2600
Date: Fri, 28 Jun 2019 12:08:30 +0930
Message-Id: <20190628023838.15426-1-andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ryan_chen@aspeedtech.com,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello!

The ASPEED AST2600 is in the pipeline, and we have enough information to start
preparing to upstream support for it. This series lays some ground work;
splitting the bindings and dicing the implementation up a little further to
facilitate differences between the 2600 and previous SoC generations.

v2 addresses Rob's comments on the bindings conversion patches. v1 can be found
here:

https://www.spinics.net/lists/linux-gpio/msg40157.html

Please review!

Andrew

Andrew Jeffery (8):
  dt-bindings: pinctrl: aspeed: Split bindings document in two
  dt-bindings: pinctrl: aspeed: Convert AST2400 bindings to json-schema
  dt-bindings: pinctrl: aspeed: Convert AST2500 bindings to json-schema
  MAINTAINERS: Add entry for ASPEED pinctrl drivers
  pinctrl: aspeed: Correct comment that is no longer true
  pinctrl: aspeed: Clarify comment about strapping W1C
  pinctrl: aspeed: Split out pinmux from general pinctrl
  pinctrl: aspeed: Add implementation-related documentation

 .../pinctrl/aspeed,ast2400-pinctrl.yaml       |  81 ++
 .../pinctrl/aspeed,ast2500-pinctrl.yaml       | 134 ++++
 .../bindings/pinctrl/pinctrl-aspeed.txt       | 172 ----
 MAINTAINERS                                   |   9 +
 drivers/pinctrl/aspeed/Makefile               |   2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c    |  94 ++-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c    | 123 ++-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c       | 250 +-----
 drivers/pinctrl/aspeed/pinctrl-aspeed.h       | 549 +------------
 drivers/pinctrl/aspeed/pinmux-aspeed.c        |  96 +++
 drivers/pinctrl/aspeed/pinmux-aspeed.h        | 735 ++++++++++++++++++
 11 files changed, 1312 insertions(+), 933 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
 create mode 100644 drivers/pinctrl/aspeed/pinmux-aspeed.c
 create mode 100644 drivers/pinctrl/aspeed/pinmux-aspeed.h

-- 
2.20.1

