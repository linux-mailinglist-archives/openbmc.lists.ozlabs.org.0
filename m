Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED26933259
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 21:42:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNqGY0mQkz3ftN
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2024 05:42:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNqDF3LVjz3dHM
	for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2024 05:40:28 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 46GJeFuq022574
	for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2024 22:40:15 +0300
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 16 Jul
 2024 22:40:15 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Jul
 2024 03:40:12 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 17 Jul 2024 03:40:12 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 5714E5F617;
	Tue, 16 Jul 2024 22:40:11 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 4515DDC0BCE; Tue, 16 Jul 2024 22:40:11 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linus.walleij@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <avifishman70@gmail.com>,
        <tali.perry1@gmail.com>, <joel@jms.id.au>, <venture@google.com>,
        <yuenn@google.com>, <benjaminfair@google.com>
Subject: [PATCH v2 0/7] pinctrl: npcm8xx: pin configuration changes 
Date: Tue, 16 Jul 2024 22:40:01 +0300
Message-ID: <20240716194008.3502068-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch set addresses various pin configuration changes for the 
Nuvoton NPCM8XX BMC SoC. The patches aim to enhance functionality, 
remove unused pins, and improve overall pin management.

Addressed comments from:
- J. Neuschäfer: https://www.spinics.net/lists/linux-gpio/msg101303.html
- Jonas Gorski: https://www.spinics.net/lists/linux-gpio/msg101304.html

Changes since version 1:
	- Squash the non-existent pins, groups and functions.
	- Remove non-existent groups and functions from dt-bindings.
	- Modify the commit message.

Tomer Maimon (7):
  dt-bindings: pinctrl: npcm8xx: remove non-existent groups and
    functions
  pinctrl: nuvoton: npcm8xx: remove non-existent pins, groups, functions
  pinctrl: nuvoton: npcm8xx: clear polarity before set both edge
  pinctrl: nuvoton: npcm8xx: add gpi35 and gpi36
  pinctrl: nuvoton: npcm8xx: add pin 250 to DDR pins group
  pinctrl: nuvoton: npcm8xx: modify clkrun and serirq pin configuration
  pinctrl: nuvoton: npcm8xx: modify pins flags

 .../pinctrl/nuvoton,npcm845-pinctrl.yaml      | 70 +++++++++----------
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c     | 64 ++++++++---------
 2 files changed, 65 insertions(+), 69 deletions(-)

-- 
2.34.1

