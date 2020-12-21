Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D94872E026C
	for <lists+openbmc@lfdr.de>; Mon, 21 Dec 2020 23:22:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0DVg0WY6zDqQL
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 09:22:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0DTr15JSzDqM6;
 Tue, 22 Dec 2020 09:21:50 +1100 (AEDT)
IronPort-SDR: 01kGvLFJMpcOM77eNb8uvdslOU0kcF/0mvRoGscK1OBLxYqgFex0/1FRu+g2feus/bjCtp+IKF
 3ihfoJxF0ezg==
X-IronPort-AV: E=McAfee;i="6000,8403,9842"; a="155004936"
X-IronPort-AV: E=Sophos;i="5.78,437,1599548400"; d="scan'208";a="155004936"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2020 14:21:46 -0800
IronPort-SDR: PS9v6jx1y4Zk2+CT4iwry61c5UoDxY0SjTCemykD8hVs6PLfnxgfHftbemXJiNYLxzqdOrImj9
 MYZA6Z2eiSiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,437,1599548400"; d="scan'208";a="372892687"
Received: from maru.jf.intel.com ([10.54.51.77])
 by orsmga008.jf.intel.com with ESMTP; 21 Dec 2020 14:21:45 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Eddie James <eajames@linux.ibm.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 0/1] Fix kernel panic issues caused by AST2500 Video Engine
Date: Mon, 21 Dec 2020 14:32:24 -0800
Message-Id: <20201221223225.14723-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: openbmc@lists.ozlabs.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Video engine uses eclk and vclk for its clock sources and its reset
control is coupled with eclk so the current clock enabling sequence works
like below.

 Enable eclk
 De-assert Video Engine reset
 10ms delay
 Enable vclk

It introduces improper reset on the Video Engine hardware and eventually
the hardware generates unexpected DMA memory transfers that can corrupt
memory region in random and sporadic patterns. This issue is observed
very rarely on some specific AST2500 SoCs but it causes a critical
kernel panic with making a various shape of signature so it's extremely
hard to debug. Moreover, the issue is observed even when the video
engine is not actively used because udevd turns on the video engine
hardware for a short time to make a query in every boot.

To fix this issue, this commit changes the clock handling logic to make
the reset de-assertion triggered after enabling both eclk and vclk. Also,
it adds clk_unprepare call for a case when probe fails.

In case of AST2600, the video engine reset setting should be coupled with
eclk to match it with the setting for previous Aspeed SoCs which is defined
in clk-aspeed.c since all Aspeed SoCs are sharing a single video engine
driver. Also, reset bit 6 is defined as 'Video Engine' reset in datasheet
so it should be de-asserted when eclk is enabled. This commit fixes the
setting too.

Please review this squashed patch.

Changes since v1:
- Squashed two patches due to dependency.

Jae Hyun Yoo (1):
  media: aspeed: fix clock handling logic

 drivers/clk/clk-ast2600.c             | 4 ++--
 drivers/media/platform/aspeed-video.c | 9 ++++++---
 2 files changed, 8 insertions(+), 5 deletions(-)

-- 
2.17.1

