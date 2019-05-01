Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF07710EAA
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 23:43:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vX2Y1RFYzDqPj
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 07:43:33 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vX1d5ckpzDqGm
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 07:42:43 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 May 2019 14:42:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,419,1549958400"; d="scan'208";a="136063310"
Received: from maru.jf.intel.com ([10.54.51.75])
 by orsmga007.jf.intel.com with ESMTP; 01 May 2019 14:42:40 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 dev-5.0 0/4] Improve stability of Aspeed video engine
 driver - 2nd phase
Date: Wed,  1 May 2019 14:37:46 -0700
Message-Id: <20190501213750.28751-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.21.0
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

This patch series improves stability of Aspeed video engine driver by fixing
interrupt handling logic and by reducing noisy log printings in the driver.

Jae Hyun Yoo (4):
  media: aspeed: remove IRQF_SHARED flag
  media: aspeed: reduce noisy log printing outs
  media: aspeed: remove checking of VE_INTERRUPT_CAPTURE_COMPLETE
  media: aspeed: refine interrupt handling logic

 drivers/media/platform/aspeed-video.c | 32 ++++++++++++---------------
 1 file changed, 14 insertions(+), 18 deletions(-)

-- 
2.21.0

