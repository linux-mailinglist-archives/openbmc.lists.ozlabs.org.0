Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E24821509
	for <lists+openbmc@lfdr.de>; Mon,  1 Jan 2024 19:48:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T3lPQ3b3yz3bpN
	for <lists+openbmc@lfdr.de>; Tue,  2 Jan 2024 05:48:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T3lNT0G9xz2yN3
	for <openbmc@lists.ozlabs.org>; Tue,  2 Jan 2024 05:47:48 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 401Ile0Y020931
	for <openbmc@lists.ozlabs.org>; Mon, 1 Jan 2024 20:47:40 +0200
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 1 Jan
 2024 20:47:39 +0200
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 2 Jan
 2024 02:47:37 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 2 Jan 2024 02:47:37 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id BB7A25F5CD;
	Mon,  1 Jan 2024 20:47:36 +0200 (IST)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id A2E14DC3805; Mon,  1 Jan 2024 20:47:36 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-6.6 v1 0/2] soc: add NPCM BPC driver support
Date: Mon, 1 Jan 2024 20:47:33 +0200
Message-ID: <20240101184735.3048767-1-tmaimon77@gmail.com>
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

This patch set adds BIOS Post code (BPC) support for the Nuvoton
NPCM Baseboard Management Controller (BMC).

Nuvoton BMC NPCM BIOS Post Code (BPC) monitoring two configurable
I/O addresses written by the host on the bus, the capture data
stored in 128-word FIFO.

NPCM BPC can support capture double words.

The NPCM BPC patchset is on upstream process

Tomer Maimon (2):
  dt-bindings: soc: nuvoton: Add NPCM BPC
  soc: nuvoton: add NPCM BPC driver

 .../soc/nuvoton/nuvoton,npcm-bpc.yaml         |  65 +++
 drivers/soc/nuvoton/Kconfig                   |  16 +-
 drivers/soc/nuvoton/Makefile                  |   1 +
 drivers/soc/nuvoton/npcm-bpc.c                | 387 ++++++++++++++++++
 4 files changed, 468 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-bpc.yaml
 create mode 100644 drivers/soc/nuvoton/npcm-bpc.c

-- 
2.34.1

