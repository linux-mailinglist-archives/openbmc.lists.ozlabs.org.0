Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2141D95EA1D
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2024 09:12:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wshgr15ysz308V
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2024 17:12:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.199.177.27
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724656318;
	cv=none; b=mGMFyQgL+dfrAJvGTY5h/CAWYNNc6137jp61aRV8HD0S5Ignyjcts/xbdiug+cI0n+Umct3lpsI9MqloptTf26di2hw/OIEas2IOCA9U0xmYsOiis31RbSvjph6wHRc6GETMvvJjgp6P5M9yO8Cp25hnAFl64ZJ6vDHMW4BGOiTkX96flprmsbJRmWZeOQ8dFkRaq0KV4uB+hK+ijteyHTzvT384vouQIuc26AJie26NurDj37HMCWC9lgWD6k/S8HULF2YJVJLHruJHOKMxH7PICC4vj6UyTGrjQO5RGMfRVLlBZp6LF3diMscjZG1Vr9IWWIWrkDb2HSJROXe1BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724656318; c=relaxed/relaxed;
	bh=zuBNIxY33goPIj9XTT8QVVvBeh0mWRfd/h7kJA1/VAo=;
	h=Received:Received:Received:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-NotSetDelaration; b=FAWCLkvz12uABlh+5OAkvdTopRzTHwEVfbgLU4MC7vsUJWW4JK3WkDbiseBqJmYv8C7FEAjluuNs3Na28Sa4lZX+nLCC2wgKi7j59q3TG9YO3N69yNuX+xXw44WZTpYZfXotI50xL1TnKKf1YBdJfPZIwDsGmJCWM6z69wfGCOY1FRrFWh0M80NdL320FkZZj881c1X4wxCJiBKACfIFOqyRIUJgVmyxgTi6mj6wvgqstzsoI52VhSY23S4J9kcHk/Dg97YAR2gswynLG7Z3M5WnHf1oE/FzrXRxKJIjnpcMi4l6W/GjAxZJ0fulz0OzM496JjnhLpop14Xh8R90hg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org) smtp.mailfrom=taln60.nuvoton.co.il
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WshgW1Rmtz2y7M
	for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2024 17:11:49 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 47Q7BcK6027586
	for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2024 10:11:39 +0300
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 Aug
 2024 10:11:37 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 Aug
 2024 15:11:34 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 26 Aug 2024 15:11:33 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id C817F5F5BB;
	Mon, 26 Aug 2024 10:11:30 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id B6671DC11B1; Mon, 26 Aug 2024 10:11:30 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [linux dev-6.6 v2 0/3] Add NPCM8XX clock driver
Date: Mon, 26 Aug 2024 10:11:25 +0300
Message-ID: <20240826071128.3030154-1-tmaimon77@gmail.com>
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
 drivers/clk/clk-npcm8xx.c                     | 430 ++++++++++++++++++
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/reset-npcm.c                    |  74 ++-
 include/soc/nuvoton/clock-npcm8xx.h           |  16 +
 7 files changed, 547 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/clk-npcm8xx.c
 create mode 100644 include/soc/nuvoton/clock-npcm8xx.h

-- 
2.34.1

