Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 005DF17736E
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 11:03:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Wsz20Rb5zDqVC
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 21:03:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Wsxb1FGGzDqJK
 for <openbmc@lists.ozlabs.org>; Tue,  3 Mar 2020 21:02:06 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 023A1GLr019840;
 Tue, 3 Mar 2020 12:01:16 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 9C23F6032E; Tue,  3 Mar 2020 12:01:16 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
 mark.rutland@arm.com, joel@jms.id.au, avifishman70@gmail.com,
 tali.perry1@gmail.com, yuenn@google.com, benjaminfair@google.com
Subject: [PATCH v2 0/3] watchdog: npcm: add last bootstatus support
Date: Tue,  3 Mar 2020 12:01:11 +0200
Message-Id: <20200303100114.87786-1-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Tomer Maimon <tmaimon77@gmail.com>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch set adds last reset bootstatus support in 
watchdog the Nuvoton NPCM Baseboard Management Controller (BMC).

The NPCM watchdog driver tested on NPCM750 evaluation board.

Addressed comments from:.
 - Guenter Roeck: https://www.spinics.net/lists/kernel/msg3425926.html 
 - Guenter Roeck: https://lkml.org/lkml/2020/3/1/144 
				  
Changes since version 1:
 - Remove restart priority support.
 - Modify commit message.
 - Modify define in alphabetic order.
 - Add reset bootstatus remarks.
 - Remove and modify whitespace.

Tomer Maimon (3):
  dt-binding: watchdog: add bootstatus reset type documentation
  watchdog: npcm: sets card ext1 and ext2 bootstatus during probe
  watchdog: npcm: remove whitespaces

 .../bindings/watchdog/nuvoton,npcm-wdt.txt    |  30 ++++
 drivers/watchdog/npcm_wdt.c                   | 131 ++++++++++++++++--
 2 files changed, 151 insertions(+), 10 deletions(-)

-- 
2.22.0

