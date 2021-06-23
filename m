Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5100C3B124D
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 05:39:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8psl01Cxz308c
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 13:39:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=i9Ew2bNc;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=TkDybcnK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=i9Ew2bNc; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=TkDybcnK; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8psT53kVz2yxB
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jun 2021 13:39:09 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id D08E2F5F;
 Tue, 22 Jun 2021 23:39:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 22 Jun 2021 23:39:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=xcqYKXIAGZH2MJkLb7wmuTsnbx
 8fY5BEJ8hZL2eYR2o=; b=i9Ew2bNcIYkPmC9eM1H3cQ7YlNaWwQJ2ozgAnLQ8/1
 wVLBMxfloDXpx17/0VYcgabYq2canoHzd7W/MFq4r6mXjEb1P9gCOJ5XfcOM0ipf
 0CBvBFoZfViRDrXlVAhkcyBQA3fHMbqwaEkAOkwhNG6kbC0eUHE+GfwVXLBpFsug
 T/BMEWHPwfZUiMYldYc9BdusOpNrSYfjIpoxZ1x9ZDWPJf+J0y94z7JYOlZ8doUb
 RKAPSE8iHfniptpRLxQRlcbBCcCT4bkdeSSWYQzE81uvCcNR7ZJDEBmP+39vUZCV
 eCqhqSBU4R0BvPAnl3j/9m719mbDdOY+KFuuiRGUpDOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xcqYKXIAGZH2MJkLb
 7wmuTsnbx8fY5BEJ8hZL2eYR2o=; b=TkDybcnKQ+fqitJ+jrXfulBNYf/DeE8Hy
 8mbk++JFdxrMUBTjy+6Gvauvk6m6uudADvRHBo14QfxacU12mJy954VaVkyZ8rqa
 spp1A0UrIKRxHNuNCwqikxBBXFnM13vImQ4sN9bkKugwnuUfYqS0hMHt/DgdqeFC
 aAXqQZqp0ipydD5aKbwd+UicDnrHv5HlsgmWgxWd0kBKgOoNKFmR3gb47n6YoeKp
 dV/S4fGgXg2f7ScZvG/SBCN+XLY6jHnMWcB+E5Lo/DBvDxzSY51W20qDgaEjagyV
 OA/3TCrkccbMwqONhkNCaImdjdK7E8tFBvQJ4jcoyfO5nDD0YqP+w==
X-ME-Sender: <xms:2azSYFQY5goXl-eZNTdAZ3si4mR2JcXtQMVtKZJEmLXDH7U33b7SXQ>
 <xme:2azSYOzvOevIr7YiVsac0kOQak7mU7KJT_qR7tu6tugSxPsPANnRZkLsqYVxGbIDG
 Y6sfXZydieDgZNxMw>
X-ME-Received: <xmr:2azSYK2HKQJWvBS2O4BVfiSjh0cJ5fzyI_xin1mvFauG4WIowC5x0ePaPhEiWANaKIyj0990oUrxpoRdtrJFIrntGHClD6flaavlx_Vlhyt456lZxpRUUs7qB7nxmiyHErYa3GxsHoD0eA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeegvddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuggftrfgrthhtvghrnhepieetheduveelhfdvvdejleeuhfelteevhe
 ffgfeitdefgeekjeefieevgfehhefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurh
 gvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:2azSYNCe85n8oJGvEPv6Wyu7lY7OsV41LlHIeIU41IJ_QeSJTcIxDg>
 <xmx:2azSYOhCbXHqsPL2E3bsrhY5gOJoC5ZfySkJQfWJWah8e1rPeL657A>
 <xmx:2azSYBqJaNSmTyMOYcFwrz2nEH1roUyplt_j56iCiLAfK_FHWXB-lQ>
 <xmx:2qzSYGIN7Unc0HOhHhxFPBM1LEikeeGAeulXTHiVg2iaBpjfXYkeNA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Jun 2021 23:39:03 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.10 v2 0/7] Rework use of KCS devices for P10
 platforms
Date: Wed, 23 Jun 2021 13:08:47 +0930
Message-Id: <20210623033854.587464-1-andrew@aj.id.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

v2 of this series rebases against the tip of dev-5.10 and fixes up the "nobody
cared" warning identified in the raw chardev implementation from v1.

The v1 series can be found here with a complete outline of the motivations and
benefits:

https://lore.kernel.org/openbmc/20210618035858.4024689-1-andrew@aj.id.au/

Please review!

Andrew

Andrew Jeffery (6):
  ipmi: kcs_bmc: Add a "raw" character device interface
  ARM: configs: Enable IPMI KCS raw chardev
  ARM: dts: p10bmc: Drop the openbmc,mctp-lpc node
  misc: Remove obsolete mctp-lpc chardev
  ARM: dts: p10bmc: Switch to KCS 3 for MCTP binding
  ARM: dts: p10bmc: Enable KCS channel 2

Colin Ian King (1):
  ipmi: kcs_bmc_aspeed: Fix less than zero comparison of a unsigned int

 Documentation/ABI/testing/dev-raw-kcs        |  25 ++
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts |  16 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts |  16 +-
 arch/arm/configs/aspeed_g5_defconfig         |   2 +-
 drivers/char/ipmi/Kconfig                    |  17 +
 drivers/char/ipmi/Makefile                   |   1 +
 drivers/char/ipmi/kcs_bmc_aspeed.c           |   8 +-
 drivers/char/ipmi/kcs_bmc_cdev_raw.c         | 447 +++++++++++++++++++
 drivers/misc/Kconfig                         |   7 -
 drivers/misc/Makefile                        |   1 -
 drivers/misc/mctp-lpc.c                      | 443 ------------------
 11 files changed, 518 insertions(+), 465 deletions(-)
 create mode 100644 Documentation/ABI/testing/dev-raw-kcs
 create mode 100644 drivers/char/ipmi/kcs_bmc_cdev_raw.c
 delete mode 100644 drivers/misc/mctp-lpc.c

-- 
2.30.2

