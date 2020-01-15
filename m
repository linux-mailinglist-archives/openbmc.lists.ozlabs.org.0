Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 856D313CEE4
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2020 22:26:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ygPK0kj2zDqQZ
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2020 08:26:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ygNM0cvQzDqLG;
 Thu, 16 Jan 2020 08:25:37 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2020 13:25:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,323,1574150400"; d="scan'208";a="213841133"
Received: from maru.jf.intel.com ([10.54.51.77])
 by orsmga007.jf.intel.com with ESMTP; 15 Jan 2020 13:25:34 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Joel Stanley <joel@jms.id.au>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 0/2] clk: aspeed/ast2600: Add critical clock setting logic
Date: Wed, 15 Jan 2020 13:26:37 -0800
Message-Id: <20200115212639.4998-1-jae.hyun.yoo@linux.intel.com>
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
 linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This commit adds critical clock setting logic that applies
CLK_IS_CRITICAL flag if it detects 'clock-critical' property in
device tree. With this patch, each platform can enable critical clocks
through device tree setting like below:

&syscon {
	clock-critical = <ASPEED_CLK_GATE_BCLK>,
			 <ASPEED_CLK_GATE_MCLK>,
			 <ASPEED_CLK_GATE_REFCLK>;
};

Please review.

Thanks,

Jae

Jae Hyun Yoo (2):
  clk: aspeed: add critical clock setting logic
  clk: ast2600: add critical clock setting logic

 drivers/clk/clk-aspeed.c  | 5 ++++-
 drivers/clk/clk-ast2600.c | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.17.1

