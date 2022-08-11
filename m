Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B965958F988
	for <lists+openbmc@lfdr.de>; Thu, 11 Aug 2022 10:49:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3L8t4C9pz3bly
	for <lists+openbmc@lfdr.de>; Thu, 11 Aug 2022 18:49:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3L886dvpz2xtw
	for <openbmc@lists.ozlabs.org>; Thu, 11 Aug 2022 18:49:08 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 27B8mwBA026502
	for <openbmc@lists.ozlabs.org>; Thu, 11 Aug 2022 11:48:59 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 11 Aug
 2022 11:48:58 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Thu, 11 Aug
 2022 16:48:56 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Thu, 11 Aug 2022 16:48:56 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 7F92F62EFD; Thu, 11 Aug 2022 11:48:55 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1 0/2] usb: gadget: udc: add UDC driver for NPCM SoCs 
Date: Thu, 11 Aug 2022 11:48:48 +0300
Message-ID: <20220811084850.45927-1-tmaimon77@gmail.com>
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
Cc: andrew@aj.id.au, joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch set add NPCM USB device controller(UDC) Baseboard Management
Controller(BMC) support.

This patchset was tested on the Arbel NPCM8XX evaluation board that running 
Arbel OpenBMC.

Tomer Maimon (2):
  dt-binding: usb: Add NPCM UDC binding documentation
  usb: gadget: udc: add NPCM UDC support

 .../devicetree/bindings/usb/npcm-udc.txt      |   33 +
 drivers/usb/gadget/udc/Kconfig                |   11 +
 drivers/usb/gadget/udc/Makefile               |    1 +
 drivers/usb/gadget/udc/npcm_udc.c             | 3250 +++++++++++++++++
 4 files changed, 3295 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/npcm-udc.txt
 create mode 100644 drivers/usb/gadget/udc/npcm_udc.c

-- 
2.33.0

