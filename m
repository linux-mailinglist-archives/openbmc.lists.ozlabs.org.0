Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3CF962850
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2024 15:11:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv4Y323dVz3dRp
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2024 23:11:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.199.177.27
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724850654;
	cv=none; b=LKovENGXb3F4hoz7GTSeLPpLknsKfTt53Zu0JrkHg+KMk9ZUY58IDdV/IL0e88NTCf2hmt24n4eaE1wY09rKE+A12rZB/sJCPgYcydpphy67rz6Tewz00hVYxH1kYq393ggpTI3aat2nhw2Vr7R5hj19xOzEF9TZOhLNWitIi3rnqBw07OjtWLFcUuMb+3/IXYvofC+2vp7Iud2JuUu4G0vfhmakfONLzKGeFuZrLFujOOcQIxmuL+BE2l2WTFmOKxSWyBogOMWr4C7FSY7yEqQlH0oJBQg9CrsJ8zttR3oT107aqOVjzPSr8A1jPQPtIoBLuJaNAjKJE18B41pgIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724850654; c=relaxed/relaxed;
	bh=7cBFn8QJhmgVS3eQZ8QR75j7sRKw9FuihzKZffuWgQc=;
	h=Received:Received:Received:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-NotSetDelaration; b=FeR6aSLUzst01CI9rg+tyhGmypOz/rgwohXzeDmabFs+2kV/icPuPaWaYypDA2k+S2xG3OTsDl1cJ4yhrIBHGMOp6Sx/CEiXz3GCdwEmmRFUooJlXZpvi+VImKmC0tYGvZ3D+ZguiVnj5Dd4nvoDJzR2hFDuDi/hpweohl8sE6bjZfQJx+i743+GCjZM/sjvzwQxgC4sK8T1/79tu8wbK+jgpGsVQmmD7Ka9Ic8G9zZuZltHy/SXo3Ei82kPBI6aOOrE6FGdd+l9fqj1a6vm7RcmoAamUOxp21A1VBU/0WM3K2aqiDm6//VDbfZBu/gZXOyoOp6TrpOpcDBW6ra29A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org) smtp.mailfrom=taln60.nuvoton.co.il
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv4Xl2tpLz2yZZ
	for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2024 23:10:44 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 47SDAYYX029380
	for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2024 16:10:34 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 Aug
 2024 16:10:33 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 Aug
 2024 21:10:32 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 28 Aug 2024 21:10:31 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 292285F5D4;
	Wed, 28 Aug 2024 16:10:31 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 16959DC11B1; Wed, 28 Aug 2024 16:10:31 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [linux dev-6.6 v4 0/3] Add NPCM8XX clock driver
Date: Wed, 28 Aug 2024 16:10:26 +0300
Message-ID: <20240828131029.3720213-1-tmaimon77@gmail.com>
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

Changes since version 3:
 - Fixed exceed line length.

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
 drivers/clk/clk-npcm8xx.c                     | 451 ++++++++++++++++++
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/reset-npcm.c                    |  74 ++-
 include/soc/nuvoton/clock-npcm8xx.h           |  16 +
 7 files changed, 568 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/clk-npcm8xx.c
 create mode 100644 include/soc/nuvoton/clock-npcm8xx.h

-- 
2.34.1

