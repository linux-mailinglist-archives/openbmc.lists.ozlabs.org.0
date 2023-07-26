Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AC1763F9B
	for <lists+openbmc@lfdr.de>; Wed, 26 Jul 2023 21:29:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mmcWC7TP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RB3r35W0lz3cJ8
	for <lists+openbmc@lfdr.de>; Thu, 27 Jul 2023 05:29:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mmcWC7TP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RB3q04GZWz3cBH
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2023 05:28:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690399725; x=1721935725;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7j2XcZg/bBdbxvcEmCEgqF7Ul3dVL8/lhTRpW/4DVhg=;
  b=mmcWC7TPAd2Ad6Hq/AJ2IlVW9KrUc9+ea8RqBymwKHtEjfEW2l+LSJl3
   k6AHdbMQs2YVC9w8qqWtrWXUv84TEVXLUWx7kZ721wVDRAvl0iMokbc+u
   xGYjr1nm0R/9bn4VoqzJUGi7tA9Z8V639xojN1Y+Aet+lHl150AysFe9j
   S2qjH7CdF7TShpKpwJTkn9/5FNLkazJfrYELveLtk73C3OQ9Oeik3IyGE
   AoXNqL9j2DvO1DLg+CE09+zMuae+hUltZagxZC2x2TYQuVwwdSxkRmW8T
   JUL9+AWFr+p+eZjvU6Ys41zCEAV6aK57KmSgjZf6OQ+1UWdU45MmGFJAZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="358110127"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="358110127"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 12:28:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="726661839"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="726661839"
Received: from wfryca-mobl1.ger.corp.intel.com (HELO localhost) ([10.249.133.1])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 12:28:35 -0700
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Add support for PECI Nuvoton
Date: Wed, 26 Jul 2023 21:27:36 +0200
Message-Id: <20230726192740.1383740-1-iwona.winiarska@intel.com>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Conor Dooley <conor+dt@kernel.org>, Benjamin Fair <benjaminfair@google.com>, Iwona Winiarska <iwona.winiarska@intel.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>
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

Thank you Tomer for testing this series on Nuvoton hardware [2].

Please note that PECI Nuvoton was previously submitted as part of PECI
subsystem series [3] that was never merged upstream.
It was never included in the current in-tree PECI subsystem [4].

[1] https://lore.kernel.org/openbmc/CAP6Zq1jnbQ8k9VEyf9WgVq5DRrEzf5V6kaYP30S7g9BV9jKtaQ@mail.gmail.com/
[2] https://lore.kernel.org/openbmc/CAP6Zq1h1if4hyubyh6N8EOdGOu+zp0qVUimF-9L2eXZ-QFAYjw@mail.gmail.com/
[3] https://lore.kernel.org/all/20191211194624.2872-1-jae.hyun.yoo@linux.intel.com/
[4] https://lore.kernel.org/all/20220208153639.255278-1-iwona.winiarska@intel.com/

Changes v1 -> v2:

* Renamed binding filename to match compatible (Krzysztof)
* Removed period from the end of copyright (Paul)

Thanks
-Iwona

Iwona Winiarska (2):
  ARM: dts: nuvoton: Add PECI controller node
  arm64: dts: nuvoton: Add PECI controller node

Tomer Maimon (2):
  dt-bindings: Add bindings for peci-npcm
  peci: Add peci-npcm controller driver

 .../bindings/peci/nuvoton,npcm-peci.yaml      |  56 ++++
 .../dts/nuvoton/nuvoton-common-npcm7xx.dtsi   |   9 +
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   |   9 +
 drivers/peci/controller/Kconfig               |  16 +
 drivers/peci/controller/Makefile              |   1 +
 drivers/peci/controller/peci-npcm.c           | 298 ++++++++++++++++++
 6 files changed, 389 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/peci/nuvoton,npcm-peci.yaml
 create mode 100644 drivers/peci/controller/peci-npcm.c

-- 
2.40.1

