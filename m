Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C7B935191
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2024 20:28:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQ1Xn4rkXz3frb
	for <lists+openbmc@lfdr.de>; Fri, 19 Jul 2024 04:28:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQ1WP1l4wz3cc0
	for <openbmc@lists.ozlabs.org>; Fri, 19 Jul 2024 04:27:42 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 46IIRTe4015598
	for <openbmc@lists.ozlabs.org>; Thu, 18 Jul 2024 21:27:30 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 18 Jul
 2024 21:27:28 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 19 Jul
 2024 02:27:26 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 19 Jul 2024 02:27:26 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 8C5D45F671;
	Thu, 18 Jul 2024 21:27:25 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 89B88DC0E6E; Thu, 18 Jul 2024 21:27:25 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [linux dev-6.6 v2 3/7] pinctrl: nuvoton: npcm8xx: clear polarity before set both edge
Date: Thu, 18 Jul 2024 21:27:16 +0300
Message-ID: <20240718182720.2721427-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240718182720.2721427-1-tmaimon77@gmail.com>
References: <20240718182720.2721427-1-tmaimon77@gmail.com>
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

Clear polarity before setting both edges to ensure that the polarity is
in the same state before configuring events for both edges

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index e146c161076c..ea36b044240a 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -246,6 +246,7 @@ static int npcmgpio_set_irq_type(struct irq_data *d, unsigned int type)
 		npcm_gpio_set(&bank->gc, bank->base + NPCM8XX_GP_N_POL, gpio);
 		break;
 	case IRQ_TYPE_EDGE_BOTH:
+		npcm_gpio_clr(&bank->gc, bank->base + NPCM8XX_GP_N_POL, gpio);
 		npcm_gpio_set(&bank->gc, bank->base + NPCM8XX_GP_N_EVBE, gpio);
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
-- 
2.34.1

