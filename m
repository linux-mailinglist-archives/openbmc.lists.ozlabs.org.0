Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C176CA4E9E
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 06:28:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MHBr536nzDqhK
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 14:28:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="P43FNnVV"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="M4O7CtZg"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MGXb6RLWzDqQm;
 Mon,  2 Sep 2019 13:58:39 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 55F68450;
 Sun,  1 Sep 2019 23:58:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 01 Sep 2019 23:58:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=VOhxFTWTuM9H7gkE9KIxVk25DQ
 HvnKDRBG22VpBaBTk=; b=P43FNnVVOEKNv88pzmb3bOZUHWeyQoYdI1AoKBjVdB
 TdxNrnGwYGYbduKGDI9SIWCgaDdBPB4KG9jO0JEcrnRCvQGk7kSOQGvcLnLk4XaQ
 icv7rsibFF/uCFB2ZCElaHJwSmCTVrGtC8SnM8TjuASdG5vy0efTdNH/qQznoXxj
 yd+Z4vYnFWujXCxPV8D6yd2M7vjgDU/kPBsJ3PAFdrb9XlALhhLSPxZ1rOpxehwM
 KG6XAOCt1MxhTu+2NvpKnal3TI6FpVFVKup5N4djy+aFhUlBagrLfU4R15+uq+po
 /WDZyR0MC9u3XKEQbrkC41t9id+NvjimqproakzhudzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=VOhxFTWTuM9H7gkE9
 KIxVk25DQHvnKDRBG22VpBaBTk=; b=M4O7CtZgl7CiZ1eZxNunF1QDxcoK+NCco
 zZ31zPogfbN4hWLaj+giE676uz5QE9ofB/qOCWZx/0DIVtkOWeC4ACXtY7YENYWb
 OrfQrc65w3PyOD4sE3bV0AiNQfEWccvhxHaqKwqWLBnmnj5NeXBF/06PjzhLhZQY
 fiFVgchuUAOJKcLqgxoHcZm+AIkdvEqnVYIfjSR89yGStBFEkmZlQHmymDkDYn7w
 cqE3afsKqULm6zb/I2/0UBE7DrJT6TBMmj6inl53YQTd/ExF9SC8bomceixDaMT4
 dhTP2U3xP/oUv5PkhiAGgEuma3Lk21MDonGUSJ1j70ikXu7iWTooA==
X-ME-Sender: <xms:ZpNsXc4-9rPpjL6EU5z5fM45aUfJygf5eFZrZaeAtTnDV8Z7udLvnw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeiledgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkphepvddtfedrhe
 ejrddvudehrddujeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ZpNsXUDWXAHMsiHghKSHf4TvOXSJaV_VJ_JdZf5SomVEAeBnqFwdCg>
 <xmx:ZpNsXRBhwKpdfpWPt1XJqB26YT9qLR-uDNqHQGzsYKri78hwGYw1ww>
 <xmx:ZpNsXUhRAyye0gQ4KbJleMGzGaYTqq-M1uwg00YUWXWrlseoy8EMvg>
 <xmx:Z5NsXTICKl4Q4SRnUGTLlqTnK6mziYfelRGIwxdMsuiN5g71zRzytQ>
Received: from localhost.localdomain (203-57-215-178.dyn.iinet.net.au
 [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2F85CD60068;
 Sun,  1 Sep 2019 23:58:26 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH v2 0/4] mmc: sdhci-of-aspeed: Fixes for AST2600 eMMC support
Date: Mon,  2 Sep 2019 13:28:38 +0930
Message-Id: <20190902035842.2747-1-andrew@aj.id.au>
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
Cc: ulf.hansson@linaro.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 adrian.hunter@intel.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

I've added a couple of patches since v1 of this series. The horizon has
broadened slightly with a fix for SPARC builds as well in patch 1/4. Ulf
suggested a minor cleanup on v1 with respect to handling of the current clock
value, so that's now patch 2/4. Patches 3/4 and 4/4 are as they were in v1.

The v1 series can be found here:

https://patchwork.ozlabs.org/cover/1155757/

Please review!

Andrew

Andrew Jeffery (4):
  mmc: sdhci-of-aspeed: Fix link failure for SPARC
  mmc: sdhci-of-aspeed: Drop redundant assignment to host->clock
  mmc: sdhci-of-aspeed: Uphold clocks-on post-condition of set_clock()
  mmc: sdhci-of-aspeed: Allow max-frequency limitation of SDCLK

 drivers/mmc/host/sdhci-of-aspeed.c | 62 ++++++++++++++++++++----------
 1 file changed, 42 insertions(+), 20 deletions(-)

-- 
2.20.1

