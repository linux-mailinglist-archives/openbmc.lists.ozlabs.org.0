Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F372587913
	for <lists+openbmc@lfdr.de>; Tue,  2 Aug 2022 10:34:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxpFN1qhFz3cCx
	for <lists+openbmc@lfdr.de>; Tue,  2 Aug 2022 18:34:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxLcc52Jpz2y2D
	for <openbmc@lists.ozlabs.org>; Tue,  2 Aug 2022 00:49:35 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 271EnMVQ024217
	for <openbmc@lists.ozlabs.org>; Mon, 1 Aug 2022 17:49:22 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Mon, 1 Aug
 2022 17:49:21 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 1 Aug
 2022 22:49:19 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 1 Aug 2022 22:49:19 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 59ABB60365; Mon,  1 Aug 2022 17:49:18 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1 0/7] drivers: add NPCM8XX support to ADC, KCS and FIU drivers
Date: Mon, 1 Aug 2022 17:49:07 +0300
Message-ID: <20220801144914.126075-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Tue, 02 Aug 2022 18:33:34 +1000
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
Cc: andrew@aj.id.au, joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch set adds Arbel NPCM8XX support to ADC, KCS and FIU drivers. 

This patchset was tested on the Arbel NPCM8XX evaluation board that running 
Arbel OpenBMC.

This patchset is based on the Arbel NPCM8XX BMC 5.19 kernel patchsets
https://lore.kernel.org/lkml/20220713132640.215916-1-tmaimon77@gmail.com/T/
https://lore.kernel.org/lkml/CAP6Zq1haOErfj2HZkqKwXZKr3+QvWP2VYK6QQOH5cjHYJ2rV0w@mail.gmail.com/T/
https://www.spinics.net/lists/linux-spi/msg33893.html

Tomer Maimon (7):
  dt-bindings: iio: adc: npcm: Add npcm845 compatible string
  iio: adc: npcm: Add NPCM8XX support
  dt-bindings: ipmi: Add npcm845 compatible
  char: ipmi: modify NPCM KCS configuration
  spi: npcm-fiu: Modify direct read dummy configuration
  dt-binding: spi: Add npcm845 compatible to npcm-fiu document
  spi: npcm-fiu: Add NPCM8XX support

 .../bindings/iio/adc/nuvoton,npcm750-adc.yaml |   7 +-
 .../bindings/ipmi/npcm7xx-kcs-bmc.txt         |   5 +-
 .../bindings/spi/nuvoton,npcm-fiu.txt         |  13 +-
 drivers/char/ipmi/Kconfig                     |   2 +-
 drivers/iio/adc/npcm_adc.c                    | 147 +++++++++++-------
 drivers/spi/spi-npcm-fiu.c                    |  36 ++++-
 6 files changed, 138 insertions(+), 72 deletions(-)

-- 
2.33.0

