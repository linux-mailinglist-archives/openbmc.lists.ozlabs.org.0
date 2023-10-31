Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C3B7DC7C8
	for <lists+openbmc@lfdr.de>; Tue, 31 Oct 2023 08:59:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SKMwN0JPCz3cQg
	for <lists+openbmc@lfdr.de>; Tue, 31 Oct 2023 18:59:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SKMvt3CP0z2yhZ
	for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2023 18:58:30 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 39V7wCLH002940
	for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2023 09:58:12 +0200
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 31 Oct
 2023 09:58:12 +0200
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 31 Oct
 2023 15:58:10 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 31 Oct 2023 15:58:09 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 225B85F59F;
	Tue, 31 Oct 2023 09:58:09 +0200 (IST)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 03850235CE0F; Tue, 31 Oct 2023 09:58:08 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linux@roeck-us.net>, <jdelvare@suse.com>, <avifishman70@gmail.com>,
        <tali.perry1@gmail.com>, <joel@jms.id.au>,
        <andrew@codeconstruct.com.au>, <venture@google.com>,
        <yuenn@google.com>, <benjaminfair@google.com>, <j.neuschaefer@gmx.net>
Subject: [PATCH v4 0/1] hwmon: npcm: add Arbel NPCM8XX support
Date: Tue, 31 Oct 2023 09:58:05 +0200
Message-ID: <20231031075806.400872-1-tmaimon77@gmail.com>
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
Cc: linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch set adds Arbel NPCM8XX Pulse Width Modulation (PWM) and
Fan tachometer (Fan) support to PWM FAN NPCM driver.

The NPCM8XX supports up to 16 Fan tachometer inputs and
up to 12 PWM outputs.

The NPCM PWM FAN driver was tested on the NPCM845 evaluation board.

Addressed comments from:
 - Guenter Roeck : https://www.spinics.net/lists/linux-hwmon/msg21914.html

Changes since version 3:
 - Moving the visible handle to the npcm7xx_pwm_is_visible function.
 - Modify the commit message.

Changes since version 2:
 - dt-binding commit applied and remove from the patchset.
 - Using _is_visible() function to support NPCM8XX.

Changes since version 1:
 - Add Rob Ack to the dt-binding commit. 

Tomer Maimon (1):
  hwmon: npcm750-pwm-fan: Add NPCM8xx support

 drivers/hwmon/npcm750-pwm-fan.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

-- 
2.33.0

