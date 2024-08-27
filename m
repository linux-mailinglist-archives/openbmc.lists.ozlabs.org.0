Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B70D960C2A
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2024 15:35:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtT7r3Kgzz3c4y
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2024 23:35:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.199.177.27
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724765729;
	cv=none; b=YuIBgXMA1z5+9Rg1fYFY1NlHCGYj6lkMIFsNXHv9rQl+v5i7qDAe5qe+e6iXeCtq7NvfZnVMRXu2xgvCB+1cOnhDUxhdg4B/BESL1Ln034e7Z9MWXs/hDYZHx76I6H/AP0NIo26gvfE2JkN5GtDgy3Vt90NqF0v2LxsPpTw0qy2GW3rvWfCvdbxccMZ6LAmXTTMSf+AHjo1worENAr21tQQMPBYcyC1uUX3ASuL2XAGgQHD8cOcasiqWm4CQAaph8kHjgSfPx8waGPm2fB4FBD1R9kCH33KGSX49LEMbKy85hhZDuRsdcRwhPP+Jpsn9BnvZYSMq1oiSJ5OM86K1uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724765729; c=relaxed/relaxed;
	bh=ouI/yOGn2dumphO/sk9e0TthFB6mEZPQl6tDephwYdw=;
	h=Received:Received:Received:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-NotSetDelaration; b=dEOVYY9VIae/qpyFWGdttuHnrpIS5/EX8gwvO4EPhJS8IIqqH/+teI9zminxhMiXtw8I3pUWvntYWqxldkRQWNbaFDwOcA0O4u8szejs82Utcnc1bjCdTNXGf5ypzK0jMUE8UwHB4jHKomZ525BrrJjrNgu+2+yl81zfBtHppOJ5L6NFNOIeaD/++aB9MkIh0Jeu0H6o0WiUuoZTDDqJ6UGjV87Zga8Sezj2pYwtfEZ5D4Mliq5l5YTLuSg1YQh6uj3G4Mr9TYtkJGLMe8Xnbl+0QLfjh9HUYALhgrHLbw1suAu/uPAhdIaKbKm5cVv+Tmjh1IZ+KbblnclrbzfA2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org) smtp.mailfrom=taln60.nuvoton.co.il
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtT7b4FPQz2yQL
	for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2024 23:35:20 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 47RDZ6qW032608
	for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2024 16:35:07 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 Aug
 2024 16:35:06 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 Aug
 2024 21:35:04 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 27 Aug 2024 21:35:04 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 65D2A5F5BB;
	Tue, 27 Aug 2024 16:35:03 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 56065DC13C0; Tue, 27 Aug 2024 16:35:03 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [linux dev-6.6 v3 0/3] Add NPCM8XX clock driver
Date: Tue, 27 Aug 2024 16:34:58 +0300
Message-ID: <20240827133501.3451302-1-tmaimon77@gmail.com>
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

This patchset adds clock support for the Nuvoton
Arbel NPCM8XX Board Management controller (BMC) SoC family.

The NPCM8xx clock controller is created using the auxiliary device framework
and set up in the npcm reset driver since the NPCM8xx clock is using the
same register region.

This patchset based on NPCM8xx clock controller V27
https://patchwork.kernel.org/project/linux-clk/cover/20240815150255.3996258-1-tmaimon77@gmail.com/

This patchset was tested on the Arbel NPCM8XX evaluation board.

Changes since version 2:
 - Remove trailing whitespaces

Changes since version 1:
 - Align with NPCM8xx clock controller V27.
 - Remove patches that are not in the clock patchset.

Tomer Maimon (3):
  dt-bindings: reset: npcm: add clock properties
  reset: npcm: register npcm8xx clock auxiliary bus device
  clk: npcm8xx: add clock controller

 .../bindings/reset/nuvoton,npcm750-reset.yaml |  18 +
 drivers/clk/Kconfig                           |   8 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-npcm8xx.c                     | 429 ++++++++++++++++++
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/reset-npcm.c                    |  74 ++-
 include/soc/nuvoton/clock-npcm8xx.h           |  16 +
 7 files changed, 546 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/clk-npcm8xx.c
 create mode 100644 include/soc/nuvoton/clock-npcm8xx.h

--
2.34.1

