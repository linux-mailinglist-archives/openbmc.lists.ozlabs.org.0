Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B49BA2AE
	for <lists+openbmc@lfdr.de>; Sun, 22 Sep 2019 14:39:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46bn871lY5zDqRN
	for <lists+openbmc@lfdr.de>; Sun, 22 Sep 2019 22:39:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="H0CjEO9w"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="dj4llJ4u"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46bn4p4Cv9zDqLh
 for <openbmc@lists.ozlabs.org>; Sun, 22 Sep 2019 22:36:25 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CD12120D98;
 Sun, 22 Sep 2019 08:36:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 22 Sep 2019 08:36:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=4FBRDPgdjwQLrSM4TumLAZBzhS
 YkeHyiFpyZm4eU8NM=; b=H0CjEO9wKhqQWBzyyekrBfjoHlXVkRHh4Jcjsz/IGY
 rN99DguvnyQkCATUwYokw5OrM5P1Jn0Hm0yZ84cbn4/g8Y6q6tx0vrLGZI6KLOkG
 339FXQEyXYLsr1U455+im/f1PVXog5w9TRv0KOnMik8v0jHPa80Kn57G7fOif5Ws
 0WhaKzbVzxNTNuuqh3v0B2IGUCQEIPCebJ2NocaudMlGNV9vpwV6Fs+7PSG1Ewh/
 qAZiUNo8yPKsh2c1TQkZ2pXbZLPBeU+PWuZDayXT8nCS2cZzQgPNVTfdhznIsAEM
 /dLgTVVc7VTsbYc1uZdDYAST2F2vXccr8RULH+ckEHgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4FBRDPgdjwQLrSM4T
 umLAZBzhSYkeHyiFpyZm4eU8NM=; b=dj4llJ4uIpIp8wHrpEwTz2fptcH0wCola
 NTWTlr1pYCw93BYcg6hAwT6c69gwyudZ5sXb71acRA39s8pUFWiWaN76Ll2Nv/KI
 56V5ym7/Lo5IShpCnYeXZNTC86abhCuqntHKk0TpZgB3CwgI5F5IuFwFfQB+6p/U
 fB8O3P1df1o29sZ1SDY8ZMcE/V4HBGXGXuE8OW+LUC6bRZaWxMYq6+Em43T02tIF
 U88lBQDwIcQkxEUZXQPIs3TGy8NsYBrDrEfjPa29EogEYHCrXyNR2VPbX3v+r1xD
 37OaVhTeMegrYw0dacXloPCTWIHjFUKStAQMycvcgh25qL5tzsObA==
X-ME-Sender: <xms:w2qHXYUSS6MX6rj_LaoWJHkSVHyqYNBYzUHH9qgjl4G1nX2qsD9BZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeigdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
 td
X-ME-Proxy: <xmx:xGqHXQ-ahyqRwb3nqwm3zPqWgZ4CJRjy-ch_rXRvGVOnDfuGAEBQCA>
 <xmx:xGqHXaRPqCqV-yh57kMBVI5xzJMad5Fk68KUx-atm2dwLkQF6-ZfVg>
 <xmx:xGqHXVTX8Uo0nBFD8lJbMKyMdRM2pVmCJbtrysmNOyV1S1qq-O9H9A>
 <xmx:xGqHXdMBsXi2eVu6o7f0zNsuGooyWOi7KA9RJWI7U39AqcLvgMYCow>
Received: from mistburn.lan (203-57-215-178.dyn.iinet.net.au [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4965B80059;
 Sun, 22 Sep 2019 08:36:18 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 0/6] ftgmac100: Support AST2600 RMII
Date: Sun, 22 Sep 2019 22:06:54 +0930
Message-Id: <20190922123700.749-1-andrew@aj.id.au>
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

This series adds support for ungating RMII RCLK on the AST2600, enabling use of
NCSI for the MACs.

The patches have not yet been sent upstream, but I intend to do so once we're
through the 5.4 merge window to avoid some of them disappearing into the
net-next void.

Please review!

Andrew

Andrew Jeffery (6):
  dt-bindings: net: ftgmac100: Document AST2600 compatible
  dt-bindings: net: ftgmac100: Describe clock properties
  dt-bindings: clock: Add AST2600 RMII RCLK gate definitions
  clk: ast2600: Add RMII RCLK gates for all four MACs
  net: ftgmac100: Ungate RCLK for RMII on AST2600
  ARM: dts: tacoma: Enable 50MHz RMII RCLK for NCSI

 .../devicetree/bindings/net/ftgmac100.txt     |  7 +++
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts   |  3 ++
 drivers/clk/clk-ast2600.c                     | 37 +++++++++++++++-
 drivers/net/ethernet/faraday/ftgmac100.c      | 43 ++++++++++++++++---
 include/dt-bindings/clock/ast2600-clock.h     |  5 +++
 5 files changed, 87 insertions(+), 8 deletions(-)

-- 
2.20.1

