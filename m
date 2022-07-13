Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC37A577E47
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 11:04:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lmbcq537tz3c8Z
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 19:04:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjTD41QZPz3bqT
	for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 17:05:38 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 26D75PNC020380
	for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 10:05:26 +0300
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 13 Jul
 2022 10:05:24 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Wed, 13 Jul
 2022 15:05:21 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Wed, 13 Jul 2022 15:05:21 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id A65BE63A23; Wed, 13 Jul 2022 10:05:19 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <avifishman70@gmail.com>, <tali.perry1@gmail.com>, <joel@jms.id.au>,
        <venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
        <jic23@kernel.org>, <lars@metafoo.de>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <j.neuschaefer@gmx.net>,
        <zhengbin13@huawei.com>
Subject: [PATCH v2 0/2] iio: adc: npcm: add Arbel NPCM8XX support
Date: Wed, 13 Jul 2022 10:05:15 +0300
Message-ID: <20220713070517.172852-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 18 Jul 2022 18:59:27 +1000
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
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch set adds Arbel NPCM8XX Analog-to-Digital Converter (ADC) support 
to ADC NPCM driver.

The NPCM8XX ADC is a 12-bit converter for eight channel inputs.

The NPCM ADC driver tested on NPCM845 evaluation board.

Addressed comments from:
 - Rob Herring : https://www.spinics.net/lists/kernel/msg4433755.html
 - Krzysztof Kozlowski: https://www.spinics.net/lists/kernel/msg4434546.html
 - Andy Shevchenko : https://www.spinics.net/lists/devicetree/msg516844.html

Changes since version 1:
 - Modify dt-binding compatible property.
 - Use device_get_match_data function instead of_match_node function.

Tomer Maimon (2):
  dt-bindings: iio: adc: npcm: Add npcm845 compatible string
  iio: adc: npcm: Add NPCM8XX support

 .../bindings/iio/adc/nuvoton,npcm750-adc.yaml |  7 ++--
 drivers/iio/adc/npcm_adc.c                    | 35 +++++++++++++++----
 2 files changed, 33 insertions(+), 9 deletions(-)

-- 
2.33.0

