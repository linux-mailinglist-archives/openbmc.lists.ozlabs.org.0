Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED36B131D18
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 02:17:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sDyP0Bb8zDqQW
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 12:17:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sDtY1vKkzDqSx;
 Tue,  7 Jan 2020 12:14:29 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jan 2020 17:14:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,404,1571727600"; d="scan'208";a="216992316"
Received: from maru.jf.intel.com ([10.54.51.77])
 by fmsmga007.fm.intel.com with ESMTP; 06 Jan 2020 17:14:21 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 2/3] Documentation: dt-bindings: media: add AST2600 Video
 Engine support
Date: Mon,  6 Jan 2020 17:15:02 -0800
Message-Id: <20200107011503.17435-3-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200107011503.17435-1-jae.hyun.yoo@linux.intel.com>
References: <20200107011503.17435-1-jae.hyun.yoo@linux.intel.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, linux-aspeed@lists.ozlabs.org,
 linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The AST2600 has Video Engine so add the compatible string into the
document.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 Documentation/devicetree/bindings/media/aspeed-video.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/aspeed-video.txt b/Documentation/devicetree/bindings/media/aspeed-video.txt
index ce2894506e1f..d2ca32512272 100644
--- a/Documentation/devicetree/bindings/media/aspeed-video.txt
+++ b/Documentation/devicetree/bindings/media/aspeed-video.txt
@@ -1,11 +1,12 @@
 * Device tree bindings for Aspeed Video Engine
 
-The Video Engine (VE) embedded in the Aspeed AST2400 and AST2500 SOCs can
+The Video Engine (VE) embedded in the Aspeed AST2400/2500/2600 SOCs can
 capture and compress video data from digital or analog sources.
 
 Required properties:
  - compatible:		"aspeed,ast2400-video-engine" or
-			"aspeed,ast2500-video-engine"
+			"aspeed,ast2500-video-engine" or
+			"aspeed,ast2600-video-engine"
  - reg:			contains the offset and length of the VE memory region
  - clocks:		clock specifiers for the syscon clocks associated with
 			the VE (ordering must match the clock-names property)
-- 
2.17.1

