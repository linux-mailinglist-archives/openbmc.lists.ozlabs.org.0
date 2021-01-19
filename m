Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB7A2FC399
	for <lists+openbmc@lfdr.de>; Tue, 19 Jan 2021 23:37:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DL3SD6nh5zDqts
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 09:37:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DL3PC65cMzDqTj
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 09:34:39 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 10JMYEPc008267;
 Wed, 20 Jan 2021 00:34:15 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 81F4E63A17; Wed, 20 Jan 2021 00:34:15 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 v1 0/4] Minor NPCM7xx modifications to dev-5.8
Date: Wed, 20 Jan 2021 00:34:08 +0200
Message-Id: <20210119223412.223492-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Tomer Maimon <tmaimon77@gmail.com>,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Minor NPCM7xx modifications to the latest patches
that been pushed to dev-5.8.

Tomer Maimon (4):
  arm: dts: npcm7xx: Add syscon property
  arm: dts: npcm7xx: modify PECI node.
  arm: dts: Olympus: Enable PECI dimm temperature
  watchdog: npcm: Modify get reset status function

 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi        | 9 ++++++---
 arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts | 2 ++
 drivers/watchdog/npcm_wdt.c                          | 4 +++-
 3 files changed, 11 insertions(+), 4 deletions(-)

-- 
2.22.0

