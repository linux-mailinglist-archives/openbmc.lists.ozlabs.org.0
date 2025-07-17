Return-Path: <openbmc+bounces-375-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE93B08E94
	for <lists+openbmc@lfdr.de>; Thu, 17 Jul 2025 15:54:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjZCc6Dz6z30TY;
	Thu, 17 Jul 2025 23:54:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.199.177.27
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752760444;
	cv=none; b=ZGghAZOL5TnB0fL3DhD4w4zK0z4deY6Ze4QZGJjO3ziAkTmXAQeMOdqT9oldeM93vWQ38gQrRMmqh1ply12sQKwCNdjpmPDZPRZd6olEh+35WkKJh7cb4y/268PhxGBrB8R4iGG6bLvVFhX5qXBWw7xT7RmZxmdb0lTTNT8qGFtqezy/bReMVZxxciKxsm/P4URoiHibKDHuCtGfRaKMDvVW5o71TA7FSiOWOYqEf/DZbAMEP9u3bOx4U14k+TJkldnl4aBHB2VxivNnSVAaKIiH0/Wm0vjZ8z6mRMjSn2PX/hmH088v6LKGKLqi9eMwKsxc/3ZGQ8VGjxyICO+UMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752760444; c=relaxed/relaxed;
	bh=KZ5U2b7kfe+LY684Ewc3FgSInDAhIcWdUoo6+Jn/NX0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QO4m+MlsfHsTehqDe9ZmQE23fef40Zn7NNbohVcYNRg5pv+nwPyBaDqZeF7sKNAaVWmpDPjrChcUk7grUf1MKmqOt6gymOhFRdyPdgVxJHUVoFnoHTtpUV6ZTt112IX8XETosl2eojh5OT57TDD49lLXT4YQM53ztBCF8gGAMr/viJdwMaSNoCWtACSGcYv/1cdrLNgcRZPug5IgdZo+uVYSjzkp63oNAwYNK0uJp2Umi9n9BDb2KavgO7XZaCSYWLCqIkH1UQvHf5kwvJ15q76Q8TgV6aVcCKv+1DUohh7bXk7uXPyJ2hLoeZStQB1lRIZfKCODT+lm7cGaCCdKzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org) smtp.mailfrom=taln60.nuvoton.co.il
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjZCY2Tbzz307K
	for <openbmc@lists.ozlabs.org>; Thu, 17 Jul 2025 23:53:54 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 56HDriqg003784
	for <openbmc@lists.ozlabs.org>; Thu, 17 Jul 2025 16:53:44 +0300
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 17 Jul
 2025 16:53:43 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.44; Thu, 17 Jul
 2025 21:53:40 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 17 Jul 2025 21:53:40 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 2C03F5F604;
	Thu, 17 Jul 2025 16:53:39 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 1D4B0DC084A; Thu, 17 Jul 2025 16:53:39 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <avifishman70@gmail.com>,
        <tali.perry1@gmail.com>, <joel@jms.id.au>, <venture@google.com>,
        <yuenn@google.com>, <benjaminfair@google.com>
CC: <openbmc@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/2] arm64: dts: nuvoton: Add NPCM845 SoC and EVB support
Date: Thu, 17 Jul 2025 16:53:34 +0300
Message-ID: <20250717135336.3974758-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-Spam-Status: No, score=2.9 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,KHOP_HELO_FCRDNS,NML_ADSP_CUSTOM_MED,
	SPF_HELO_NONE,SPF_NONE,SPOOFED_FREEMAIL,SPOOF_GMAIL_MID
	autolearn=disabled version=4.0.1
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series adds device tree support for peripherals on the Nuvoton NPCM845 
SoC and its Evaluation Board (EVB).
The first patch introduces peripheral nodes for Ethernet, MMC, SPI, USB,
RNG, ADC, PWM-FAN, I2C, and OP-TEE firmware in the NPCM845 SoC device tree.
The second patch enables these peripherals for the NPCM845-EVB, adding
MDIO nodes, reserved memory, aliases, and board-specific configurations
like PHY modes and SPI flash partitions.

The series depends on a separate pinctrl patch for NPCM845 pinmux groups.

Tomer Maimon (2):
  arm64: dts: nuvoton: npcm845: Add peripheral nodes
  arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes

 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 695 ++++++++++++++++++
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 445 +++++++++++
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |   7 +
 3 files changed, 1147 insertions(+)

-- 
2.34.1


