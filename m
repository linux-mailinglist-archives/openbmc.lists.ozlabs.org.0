Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1EBBE17D
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 17:38:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dhzr3s6yzDqW4
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 01:38:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ZqjFkNzI"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="mXCg7oqQ"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dhtl1ZxDzDqZS
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 01:34:22 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 070C44C1;
 Wed, 25 Sep 2019 11:34:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 11:34:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=R+tB1KHuuLczkpEGM40U9IEBb/
 u0+oktiTUW7Vg2RcQ=; b=ZqjFkNzI9pfGqApdaRJnInOVkBWjMZ6S7KPXWIw4+J
 ZbukZ8DNjiLuJ5DHf2HvemKK7SKhNiH9SUWW/qvEzujZpPZbMygm+CgDPYih3x/H
 kOe+gXtKhIOGVFhU/7I1Ey4TI6aVpBq5ra/DpZj6gcan+D2eniVw0UYUymfL6z+z
 Y/yJTMbs3DD+lnHPU2DAFO5FV2g6BLDRlRzr/G6M8rjkh9/HVSg5+IAqvyB/77yT
 JjxuLZOovs4agu8dptJQNuj3OiprdZ94aMyO24PjWv88mfHM5hNQcEsRZ/DRk7fT
 Ay1/f/HEIIMEEZkxfI4RmievX/RAC0baT1a2ksBwOPlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=R+tB1KHuuLczkpEGM
 40U9IEBb/u0+oktiTUW7Vg2RcQ=; b=mXCg7oqQqa0QsGgcUYelUk6/xaLEhrbrn
 nuQGWXXljDgaC4hCIzqTXST9dPD97BV/fmWXauSFbdMaelgh3O1fobXohMaaoXxn
 NdjDxl6ZQqWdeclHWxcTLJbbmCy7MhUmgx/Brn7Y6xatxG7TcWfWNpLk7/Lcud3/
 Rx9gtp5z9a1nVHXGvpeZoScS43x/beiWUzhrIo3DTv7uvPFUl3unUZqUARiXVQ94
 tQAGeV9l0SlvH72LGeslNP/Lc623oU/qu3F3O3asUMvNKhBLh0kDdzE2ClEdcLuh
 ZW8UUETWZEXH8YcTQ5vOFEC6HW2U5buOcD3msJ/cCkNKJ0FkqVvkw==
X-ME-Sender: <xms:-IiLXQYRdrnFJxFMMaMKd6k2dXKBJ7wcY1Rhej2pPqo6OkbDx8aWNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
 td
X-ME-Proxy: <xmx:-IiLXX-K5GcM0c6TXP0KXVMeFwc6SKjhU0B3_i0mISQfvgk8UgkAqw>
 <xmx:-IiLXfZKd9O8VXr4YJXALkW6hmG84rF_Dqh9AMyLUxzH3Ni7M0C_Jw>
 <xmx:-IiLXRfwYNY28Rld8Lm5ERt1JPm3SNttyF7Cej7BmCXhZWqYIL2WxQ>
 <xmx:-YiLXZm_2lPXW8uJazNv0xYuBbMGQUPBMTULBfdW6Fct3veHKmNLJQ>
Received: from localhost.localdomain (203-57-215-178.dyn.iinet.net.au
 [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id CD648D60057;
 Wed, 25 Sep 2019 11:34:14 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 v2 0/8] ftgmac100: Support AST2600 RMII
Date: Thu, 26 Sep 2019 01:04:31 +0930
Message-Id: <20190925153439.27475-1-andrew@aj.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

This series adds support for ungating RMII RCLK on the AST2500 and AST2600,
enabling use of NCSI for the MACs if u-boot does not ungate the clock for us.

The patches have not yet been sent upstream, but I intend to do so once we're
through the 5.4 merge window to avoid some of them disappearing into the
net-next void.

v2:
* Support AST2500 RCLK as well.
* Add fixed RCLK clocks and describe correct parent clocks
* Re-order the patches to group clock and net changes.
* Update all the 2500- and 2600-based devicetrees

Tested by pinging a remote host on Tacoma (2600, u-boot does not configure
RCLK) and Witherspoon (2500, manually disabled RCLK in u-boot before booting
the kernel) hardware, and used QEMU to ensure the driver probes correctly on
Palmetto (2400, no gate for RCLK).

Please review!

Andrew

Andrew Jeffery (8):
  dt-bindings: clock: Add AST2500 RMII RCLK definitions
  dt-bindings: clock: Add AST2600 RMII RCLK gate definitions
  clk: aspeed: Add RMII RCLK gates for both AST2500 MACs
  clk: ast2600: Add RMII RCLK gates for all four MACs
  dt-bindings: net: ftgmac100: Document AST2600 compatible
  dt-bindings: net: ftgmac100: Describe clock properties
  net: ftgmac100: Ungate RCLK for RMII on ASPEED MACs
  ARM: dts: aspeed: Add RCLK to MAC clocks for RMII interfaces

 .../devicetree/bindings/net/ftgmac100.txt     |  7 +++
 .../aspeed-bmc-arm-stardragon4800-rep2.dts    |  3 ++
 .../dts/aspeed-bmc-facebook-tiogapass.dts     |  3 ++
 .../arm/boot/dts/aspeed-bmc-facebook-yamp.dts |  3 ++
 .../boot/dts/aspeed-bmc-inspur-fp5280g2.dts   |  3 ++
 .../boot/dts/aspeed-bmc-inspur-on5263m5.dts   |  3 ++
 .../arm/boot/dts/aspeed-bmc-intel-s2600wf.dts |  3 ++
 arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts |  3 ++
 .../boot/dts/aspeed-bmc-lenovo-hr855xg2.dts   |  3 ++
 arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts  |  3 ++
 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts   |  3 ++
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts  |  3 ++
 arch/arm/boot/dts/aspeed-bmc-opp-swift.dts    |  3 ++
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts   |  3 ++
 .../boot/dts/aspeed-bmc-opp-witherspoon.dts   |  3 ++
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts    |  3 ++
 .../boot/dts/aspeed-bmc-portwell-neptune.dts  |  6 +++
 drivers/clk/clk-aspeed.c                      | 27 ++++++++++-
 drivers/clk/clk-ast2600.c                     | 47 ++++++++++++++++++-
 drivers/net/ethernet/faraday/ftgmac100.c      | 35 +++++++++++---
 include/dt-bindings/clock/aspeed-clock.h      |  2 +
 include/dt-bindings/clock/ast2600-clock.h     |  5 ++
 22 files changed, 165 insertions(+), 9 deletions(-)

-- 
2.20.1

