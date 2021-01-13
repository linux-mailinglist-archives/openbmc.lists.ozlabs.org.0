Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC132F53E7
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 21:13:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGJXb3WFPzDrh8
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 07:13:03 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGJGQ1mpVzDrTH
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 07:00:45 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 10DK0NQf007583;
 Wed, 13 Jan 2021 22:00:23 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id E9F1B63A17; Wed, 13 Jan 2021 22:00:23 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 v3 08/12] pinctrl: pinconf: add pin persist
 configuration
Date: Wed, 13 Jan 2021 22:00:06 +0200
Message-Id: <20210113200010.71845-9-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20210113200010.71845-1-tmaimon77@gmail.com>
References: <20210113200010.71845-1-tmaimon77@gmail.com>
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

Add generic pin persist configuration support.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/pinconf-generic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index dfef471201f6..c609a69bd37e 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -50,6 +50,7 @@ static const struct pin_config_item conf_items[] = {
 	PCONFDUMP(PIN_CONFIG_SLEEP_HARDWARE_STATE, "sleep hardware state", NULL, false),
 	PCONFDUMP(PIN_CONFIG_SLEW_RATE, "slew rate", NULL, true),
 	PCONFDUMP(PIN_CONFIG_SKEW_DELAY, "skew delay", NULL, true),
+	PCONFDUMP(PIN_CONFIG_PERSIST_STATE, "persist state", NULL, false),
 };
 
 static void pinconf_generic_dump_one(struct pinctrl_dev *pctldev,
@@ -184,6 +185,8 @@ static const struct pinconf_generic_params dt_params[] = {
 	{ "sleep-hardware-state", PIN_CONFIG_SLEEP_HARDWARE_STATE, 0 },
 	{ "slew-rate", PIN_CONFIG_SLEW_RATE, 0 },
 	{ "skew-delay", PIN_CONFIG_SKEW_DELAY, 0 },
+	{ "persist-state", PIN_CONFIG_PERSIST_STATE, 0 },
+	{ "reset-state", PIN_CONFIG_PERSIST_STATE, 1 },
 };
 
 /**
-- 
2.22.0

