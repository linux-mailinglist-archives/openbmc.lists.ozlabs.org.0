Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A86367A502F
	for <lists+openbmc@lfdr.de>; Mon, 18 Sep 2023 19:01:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rq9zl3qmSz3cBh
	for <lists+openbmc@lfdr.de>; Tue, 19 Sep 2023 03:01:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rq9yk5gy3z2ysB
	for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2023 03:00:12 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 38IH03Dl011050
	for <openbmc@lists.ozlabs.org>; Mon, 18 Sep 2023 20:00:03 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Mon, 18 Sep
 2023 20:00:03 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Tue, 19
 Sep 2023 01:00:01 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 19 Sep 2023 01:00:01 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 5F1706473F; Mon, 18 Sep 2023 20:00:00 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <peter.chen@kernel.org>, <gregkh@linuxfoundation.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <xu.yang_2@nxp.com>, <peng.fan@nxp.com>, <avifishman70@gmail.com>,
        <tali.perry1@gmail.com>, <joel@jms.id.au>, <venture@google.com>,
        <yuenn@google.com>, <benjaminfair@google.com>, <j.neuschaefer@gmx.net>
Subject: [PATCH v1 0/2] usb: ChipIdea: add Nuvoton NPCM UDC support
Date: Mon, 18 Sep 2023 19:59:56 +0300
Message-ID: <20230918165958.2659-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch set add USB device controller for the NPCM Baseboard 
Management Controllers (BMC).

NPCM UDC driver is a part of the USB ChipIdea driver.

The NPCM UDC is using the CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS flag
therefor, this patch set should apply after  
usb: chipidea: add CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS flag commit will
apply.

BMC NPCM7XX and BMC NPCM8XX has ten identical NPCM UDC modules,

The NPCM UDC were tested on NPCM845 evaluation board.

Tomer Maimon (2):
  dt-binding: usb: ci-hdrc-usb2: document Nuvoton NPCM supprt
  usb: chipidea: Add support for NPCM

 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml |  16 +++
 drivers/usb/chipidea/Kconfig                  |   4 +
 drivers/usb/chipidea/Makefile                 |   1 +
 drivers/usb/chipidea/ci_hdrc_npcm.c           | 126 ++++++++++++++++++
 4 files changed, 147 insertions(+)
 create mode 100644 drivers/usb/chipidea/ci_hdrc_npcm.c

-- 
2.33.0

