Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 118D9935192
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2024 20:29:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQ1YH6sMHz3fvm
	for <lists+openbmc@lfdr.de>; Fri, 19 Jul 2024 04:29:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQ1WN6xJ8z3cZ6
	for <openbmc@lists.ozlabs.org>; Fri, 19 Jul 2024 04:27:42 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 46IIRUkp015605
	for <openbmc@lists.ozlabs.org>; Thu, 18 Jul 2024 21:27:30 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 18 Jul
 2024 21:27:29 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 19 Jul
 2024 02:27:26 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 19 Jul 2024 02:27:26 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 87C395F661;
	Thu, 18 Jul 2024 21:27:25 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 7510ADC0E6E; Thu, 18 Jul 2024 21:27:25 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [linux dev-6.6 v2 0/7] pinctrl: npcm8xx: pin configuration changes 
Date: Thu, 18 Jul 2024 21:27:13 +0300
Message-ID: <20240718182720.2721427-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch set addresses various pin configuration changes for the 
Nuvoton NPCM8XX BMC SoC. The patches aim to enhance functionality, 
remove unused pins, and improve overall pin management.

This patchset is on the upstream process to the Linux vanilla.
https://lore.kernel.org/lkml/20240716194008.3502068-1-tmaimon77@gmail.com/

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

 .../pinctrl/nuvoton,npcm845-pinctrl.yaml      | 74 +++++++++----------
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c     | 64 ++++++++--------
 2 files changed, 67 insertions(+), 71 deletions(-)

-- 
2.34.1

