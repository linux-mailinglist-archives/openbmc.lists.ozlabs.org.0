Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4638375A171
	for <lists+openbmc@lfdr.de>; Thu, 20 Jul 2023 00:10:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ts0/Xhed;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5qkx1WVtz2yhT
	for <lists+openbmc@lfdr.de>; Thu, 20 Jul 2023 08:10:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ts0/Xhed;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5qkH4R8Pz2yGS
	for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2023 08:09:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689804600; x=1721340600;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ftsOd0/msTRbiPjXA/7AII+Hzrj2S9DmY8KrU3qmrxg=;
  b=Ts0/XhedE0B6x7P4JsLC9Iul6K8W54ucZ7VB9DGfnAiVSq5NU0qGQ+7W
   veK26ClZPAkZqiPdc4AN4Q+HufuQ/JWJit0RMKna+EOANpFbYXdnl9gG3
   pnJ1yIHwkmM55V8PIeLppmSKA+jWXZFeD/RFDbCfJNDxi75Uclr8vKJip
   PMTL6ziEX/ZUNBYoOAm7tPFAfeLwOA4ZyDiGSI4mM6aajszqhBATOL16u
   uogqx78u/oA+NnEyrf7zQWj5e1BDzfNpwfpVv1IlhZk3xRWaFHo1SjFcf
   XbZ+niRuPUjsR9pWI2QcseHFI6RH5jjo97vC9W7FN6dTsXrysBTwLdQqy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="369232108"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="369232108"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 15:09:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="970782060"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="970782060"
Received: from patroagn-mobl1.ger.corp.intel.com (HELO localhost) ([10.249.131.68])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 15:09:28 -0700
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Add support for PECI Nuvoton
Date: Thu, 20 Jul 2023 00:08:49 +0200
Message-Id: <20230719220853.1029316-1-iwona.winiarska@intel.com>
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
Cc: Conor Dooley <conor+dt@kernel.org>, Benjamin Fair <benjaminfair@google.com>, Iwona Winiarska <iwona.winiarska@intel.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi!

The series adds support for PECI on Nuvoton-based BMC boards.
It is based on patches that were sent by Tomer Maimon from
Nuvoton [1].
Similar to Aspeed driver, unused (as in, default values were used in
all of the available DTS files) vendor-specific properties were
removed.
If there is a use-case for such properties, they can be added in
a separate series.

Thank you Tomer for testing this series on Nuvoton hardware.

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
 .../dts/nuvoton/nuvoton-common-npcm7xx.dtsi   |   9 +
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   |   9 +
 drivers/peci/controller/Kconfig               |  16 +
 drivers/peci/controller/Makefile              |   1 +
 drivers/peci/controller/peci-npcm.c           | 298 ++++++++++++++++++
 6 files changed, 389 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/peci/peci-npcm.yaml
 create mode 100644 drivers/peci/controller/peci-npcm.c

-- 
2.40.1

