Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FACAE0FD
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 00:27:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46S2pV1ytjzDqPk
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 08:27:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46S2nr4YHYzDqLt
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 08:26:39 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Sep 2019 15:26:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,487,1559545200"; d="scan'208";a="183960457"
Received: from maru.jf.intel.com ([10.54.51.77])
 by fmsmga008.fm.intel.com with ESMTP; 09 Sep 2019 15:26:36 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Tao Ren <taoren@fb.com>
Subject: [PATCH v3 dev-5.2 0/2] i2c: aspeed: Add H/W timeout support
Date: Mon,  9 Sep 2019 15:26:32 -0700
Message-Id: <20190909222634.26146-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.23.0
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
Cc: openbmc@lists.ozlabs.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In case of multi-master environment, if a peer master incorrectly handles
a bus in the middle of a transaction, I2C hardware hangs in slave state
and it can't escape from the slave state, so this commit adds slave
inactive timeout support to recover the bus in the case.

By applying this change, SDA data-low and SCL clock-low timeout feature
also could be enabled which was disabled previously.

Changes since v2:
 - Moved 'aspeed,hw-timeout-ms' property parsing logic to make it can
   be done before aspeed_i2c_init_clk.

Changes since v1:
 - Made it use bus auto recovery feature so that bus can recover itself
   automatically.

Jae Hyun Yoo (2):
  dt-bindings: i2c: aspeed: add hardware timeout support
  i2c: aspeed: add slave inactive timeout support

 .../devicetree/bindings/i2c/i2c-aspeed.txt    |  2 +
 drivers/i2c/busses/i2c-aspeed.c               | 82 +++++++++++++++++--
 2 files changed, 78 insertions(+), 6 deletions(-)

-- 
2.23.0

