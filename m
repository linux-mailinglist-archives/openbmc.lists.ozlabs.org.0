Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA933579315
	for <lists+openbmc@lfdr.de>; Tue, 19 Jul 2022 08:26:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ln83d4n4Wz3chw
	for <lists+openbmc@lfdr.de>; Tue, 19 Jul 2022 16:26:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmqxM1KH6z3bVt
	for <openbmc@lists.ozlabs.org>; Tue, 19 Jul 2022 04:19:34 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 26IIJTTU027515
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 21:19:29 +0300
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 18 Jul
 2022 21:19:29 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Tue, 19 Jul
 2022 02:19:15 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 19 Jul 2022 02:19:14 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 289EF63A20; Mon, 18 Jul 2022 21:19:14 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <avifishman70@gmail.com>, <tali.perry1@gmail.com>, <joel@jms.id.au>,
        <venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
        <gregkh@linuxfoundation.org>, <stern@rowland.harvard.edu>,
        <tony@atomide.com>, <felipe.balbi@linux.intel.com>, <jgross@suse.com>,
        <lukas.bulwahn@gmail.com>, <arnd@arndb.de>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 0/3] usb: host: npcm7xx-ehci: add Arbel NPCM8XX support and remove reset sequence 
Date: Mon, 18 Jul 2022 21:18:39 +0300
Message-ID: <20220718181842.61040-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Tue, 19 Jul 2022 16:25:30 +1000
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

This patch set
- Adds Arbel NPCM8XX USB EHCI host controller support to USB EHCI driver.
- Remove the USB reset sequence because it is done in the NPCM reset driver.

The NPCM USB host driver tested on the NPCM845 evaluation board.

Addressed comments from:
 - Arnd Bergmann : https://lore.kernel.org/all/CAK8P3a2PM9pe5tN=N7BMdkwZZKNv9Wa+CEFCyQT_6Ur=O7P5pQ@mail.gmail.com/
 - Alan Stern: https://lore.kernel.org/all/YtVuildpxcI5By4x@rowland.harvard.edu/

Changes since version 1:
 - Remove NPCM reset configuration dependency.
 - Remove unused definitions.

Changes since version 1:
 - Modify dt-binding compatible property.
 - Use device_get_match_data function instead of_match_node function.

Tomer Maimon (3):
  usb: host: npcm7xx: remove USB EHCI host reset sequence
  dt-bindings: usb: npcm7xx: Add npcm845 compatible
  USB: host: npcm: Add NPCM8XX support

 .../devicetree/bindings/usb/npcm7xx-usb.txt   |  4 +-
 drivers/usb/host/Kconfig                      |  8 +--
 drivers/usb/host/ehci-npcm7xx.c               | 50 -------------------
 3 files changed, 7 insertions(+), 55 deletions(-)

-- 
2.33.0

