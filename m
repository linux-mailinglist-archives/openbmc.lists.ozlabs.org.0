Return-Path: <openbmc+bounces-312-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D660AAFA5C2
	for <lists+openbmc@lfdr.de>; Sun,  6 Jul 2025 16:24:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bZqQ04WFhz2yRD;
	Mon,  7 Jul 2025 00:24:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.199.177.27
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751811880;
	cv=none; b=Qp9NjVZlfIL9wwXzEALmlzI/zny2myaEG4bIPb7NiXXpi0zKOoxrvgWVdAjHDM8lZk2x8nzOVn1uVpeV2ZiMvgCH/y6facdfiV4DR8RcQlx6YgW5ip3aS21o9EAEG8KGetGXHf0Q+oyaRt7kS6rpCt9rRqCUJlE6hxcouuOV+2Yjw883kz7Go5LFTIfD6kaiPGTntWyuy7QCd7FIwc+jI31hD+o9AeMsfaaM+UQ9tw8Mzd/uAvCK8B3/zCwehq+KSoRhgLr1VPiInnPxWDYW8fKBSJO9zzGnZwvGi3U/RSOmtrzJJgP3/NI1kkOfwzOdeh5gJq3say6ISVhIBQGXqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751811880; c=relaxed/relaxed;
	bh=PWkrVEjH+Kng9OzO2UeygUYz6JuQlLQhSUoFiGBq62U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cnXaqr2MISZD5G+wsOhisAYXYxWoxq8CcQsXZeBy0XTeMSwdLOAv49stM/CVKxFqbXxgtrQQ5jjDYkNetlDeW1p0Kukc7qawUyQrQx4lODbrpCtsM86CuQSHI6LHaOsO+zlRiSl2xSZnip217+D1yRm+wHXKktkyWkiOcl91Xe+oNHGL1jdKeB6wIncL6BBIja1MOsaeyK50GXgO3/3OrU0iurKb6gRldso/M2JRNVYfHmIVswf7UIAKVJsZpT+IMymUEMeRGmJ0mILf/W8m8P7OTyaFYyZPbTGI6UbvXnR9bNTBwdZgN8WMeeBXsJ+f44plKkSj7ELl1lL32KXbaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org) smtp.mailfrom=taln60.nuvoton.co.il
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
X-Greylist: delayed 2522 seconds by postgrey-1.37 at boromir; Mon, 07 Jul 2025 00:24:33 AEST
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bZqPs204Jz2xtt
	for <openbmc@lists.ozlabs.org>; Mon,  7 Jul 2025 00:24:32 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 566DgHIm031522
	for <openbmc@lists.ozlabs.org>; Sun, 6 Jul 2025 16:42:17 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Sun, 6 Jul
 2025 16:42:16 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.44; Sun, 6 Jul
 2025 21:42:14 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Sun, 6 Jul 2025 21:42:14 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id C9F9B5F5D9;
	Sun,  6 Jul 2025 16:42:13 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id BA2C5DC3163; Sun,  6 Jul 2025 16:42:13 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <avifishman70@gmail.com>,
        <tali.perry1@gmail.com>, <joel@jms.id.au>, <venture@google.com>,
        <yuenn@google.com>, <benjaminfair@google.com>
CC: <openbmc@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/2] NPCM845 reset and clock device tree updates
Date: Sun, 6 Jul 2025 16:42:05 +0300
Message-ID: <20250706134207.2168184-1-tmaimon77@gmail.com>
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

This series updates the NPCM845 device tree for the integrated reset and
clock controller using the auxiliary device framework.
Patch 1 combines the reset and clock nodes into nuvoton,npcm845-reset.
Patch 2 adds a 25 MHz refclk and updates peripherals to use it.

Tested on NPCM845 evaluation board.

Tomer Maimon (2):
  arm64: dts: nuvoton: combine NPCM845 reset and clk nodes
  arm64: dts: nuvoton: add refclk and update peripheral clocks for
    NPCM845

 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 20 ++++++++-----------
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  |  6 ++++++
 2 files changed, 14 insertions(+), 12 deletions(-)

-- 
2.34.1


