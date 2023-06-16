Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 889E3733A05
	for <lists+openbmc@lfdr.de>; Fri, 16 Jun 2023 21:36:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H/ZKLatf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjTtj2DyMz2ys1
	for <lists+openbmc@lfdr.de>; Sat, 17 Jun 2023 05:36:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H/ZKLatf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Sat, 17 Jun 2023 05:36:14 AEST
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjTt63pj6z2yDL
	for <openbmc@lists.ozlabs.org>; Sat, 17 Jun 2023 05:36:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686944174; x=1718480174;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uAlCTquY1BEny1HbKtCOr2lTvitFwYGb5R+dGtzLfbU=;
  b=H/ZKLatfZuNDpPLcZE6u5Lcbm69/RMPWoxN2hrWde5Az8TnTIfb7p6EK
   1FIQq9bQaDN58L871QvNJ7Jb2gSDN3L1I9kW0F7TJ5QJdXDSZpM9iVh4C
   VmVus7Emff30OtrJAZx4JGzbcBTzdGmYylm/p3Ac9V2DsMGSsYMDGUHzC
   mu9PG/RBhpHf0mwWJ28dqCXrW2JZZigYisLfgwr7Nu4WVZONhFRkpMy2k
   l1vIYgq7SG3yRhoFX+UwYIWv7oHN/fseV0TfzpLPWT/qm2VU0cq8BsEuF
   yDJxaNG1h7Y+L/DCBe6ZiB2h9wLVNxsuBq+22ZM9QU5R1IQvrZ8wrfr/K
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="356788687"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="356788687"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 12:35:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="802945041"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="802945041"
Received: from askrzypc-mobl.ger.corp.intel.com (HELO localhost) ([10.249.144.95])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 12:35:05 -0700
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: openbmc@lists.ozlabs.org,
	Tomer Maimon <tmaimon77@gmail.com>,
	kfting <warp5tw@gmail.com>
Subject: [RFT PATCH 0/4] Add support for PECI Nuvoton
Date: Fri, 16 Jun 2023 21:34:46 +0200
Message-Id: <20230616193450.413366-1-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Iwona Winiarska <iwona.winiarska@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi!

This series is based on patches that were sent by Tomer Maimon from
Nuvoton [1].
Similar to Aspeed driver, I removed vendor-specific properties that
were not used (as in, default values were used in all of the available
DTS files). If there is a use-case for such properties, they can be
added in a separate series.
I wasn't able to test it on a real hardware so I would like to ask for
help to test it on Nuvoton systems.

Thanks
-Iwona

[1] https://lore.kernel.org/openbmc/CAP6Zq1jnbQ8k9VEyf9WgVq5DRrEzf5V6kaYP30S7g9BV9jKtaQ@mail.gmail.com/

Iwona Winiarska (2):
  ARM: dts: nuvoton: Add PECI controller node
  arm64: dts: nuvoton: Add PECI controller node

Tomer Maimon (2):
  dt-bindings: Add bindings for peci-npcm
  peci: Add peci-npcm controller driver

 .../devicetree/bindings/peci/peci-npcm.yaml   |  56 ++++
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   9 +
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   |   9 +
 drivers/peci/controller/Kconfig               |  16 +
 drivers/peci/controller/Makefile              |   1 +
 drivers/peci/controller/peci-npcm.c           | 298 ++++++++++++++++++
 6 files changed, 389 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/peci/peci-npcm.yaml
 create mode 100644 drivers/peci/controller/peci-npcm.c

-- 
2.40.1

