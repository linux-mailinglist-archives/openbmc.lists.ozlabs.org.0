Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 240DB5EF6A6
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 15:32:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdZ6J7543z3c6Z
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 23:32:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdZ5W3xqKz306m
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 23:31:39 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 28TDVT0A029495
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 16:31:29 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 29 Sep
 2022 16:31:28 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Thu, 29 Sep
 2022 21:31:24 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 29 Sep 2022 21:31:24 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id A1B97637C4; Thu, 29 Sep 2022 16:31:23 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <avifishman70@gmail.com>, <tali.perry1@gmail.com>, <joel@jms.id.au>,
        <venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
        <olivia@selenic.com>, <herbert@gondor.apana.org.au>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 0/2] rng: npcm: add Arbel NPCM8XX support
Date: Thu, 29 Sep 2022 16:31:09 +0300
Message-ID: <20220929133111.73897-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch set adds Arbel NPCM8XX Random Number Generator(RNG) support 
to RNG NPCM driver.

The NPCM8XX RNG uses different prescalar clock value.

The NPCM RNG driver was tested on the NPCM845 evaluation board.

Addressed comments from:
 - Krzysztof Kozlowski: https://www.spinics.net/lists/kernel/msg4523771.html
			https://www.spinics.net/lists/kernel/msg4523585.html

Changes since version 1:
 - Fix dt-binding document warning.
 - Use driver data to handle architecture specific clock prescaler.

Tomer Maimon (2):
  dt-bindings: rng: nuvoton,npcm-rng: Add npcm845 compatible string
  hwrng: npcm: Add NPCM8XX support

 .../devicetree/bindings/rng/nuvoton,npcm-rng.yaml  |  4 +++-
 drivers/char/hw_random/npcm-rng.c                  | 14 ++++++++++----
 2 files changed, 13 insertions(+), 5 deletions(-)

-- 
2.33.0

