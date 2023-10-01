Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 823557B47B7
	for <lists+openbmc@lfdr.de>; Sun,  1 Oct 2023 15:50:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rz57r2HjTz3vcK
	for <lists+openbmc@lfdr.de>; Mon,  2 Oct 2023 00:50:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rz55f20x6z3vX3
	for <openbmc@lists.ozlabs.org>; Mon,  2 Oct 2023 00:48:35 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 391DmQxe018282
	for <openbmc@lists.ozlabs.org>; Sun, 1 Oct 2023 16:48:26 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Sun, 1 Oct
 2023 16:48:26 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 1 Oct
 2023 21:48:24 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Sun, 1 Oct 2023 21:48:24 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 4680B64740; Sun,  1 Oct 2023 16:48:23 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-6.5 v1 0/6] Support Nuvoton NPCM Video Capture/Encode Engine
Date: Sun, 1 Oct 2023 16:48:14 +0300
Message-ID: <20231001134820.110921-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
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

This patch series dt-bindings document and drivers for Video
Capture/Differentiation Engine (VCD) and Encoding Compression Engine (ECE)
present on Nuvoton NPCM SoCs.

This patch set have applied to next linux kernel.

The NPCM media driver tested on NPCM750 EVB.

Tomer Maimon (6):
  media: dt-bindings: nuvoton: Add NPCM VCD and ECE engine
  dt-bindings: soc: nuvoton: Add NPCM GFXI
  media: v4l: Add HEXTILE compressed format
  media: v4l2-ctrls: Add user control base for Nuvoton NPCM controls
  media: uapi: Add controls for NPCM video driver
  media: nuvoton: Add driver for NPCM video capture and encoding engine

 .../bindings/media/nuvoton,npcm-ece.yaml      |   43 +
 .../bindings/media/nuvoton,npcm-vcd.yaml      |   72 +
 .../bindings/soc/nuvoton/nuvoton,gfxi.yaml    |   39 +
 .../userspace-api/media/drivers/index.rst     |    1 +
 .../media/drivers/npcm-video.rst              |   66 +
 .../media/v4l/pixfmt-reserved.rst             |    7 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/nuvoton/Kconfig        |   15 +
 drivers/media/platform/nuvoton/Makefile       |    2 +
 drivers/media/platform/nuvoton/npcm-regs.h    |  152 ++
 drivers/media/platform/nuvoton/npcm-video.c   | 1831 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 include/uapi/linux/npcm-video.h               |   41 +
 include/uapi/linux/v4l2-controls.h            |    6 +
 include/uapi/linux/videodev2.h                |    1 +
 16 files changed, 2279 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nuvoton,npcm-ece.yaml
 create mode 100644 Documentation/devicetree/bindings/media/nuvoton,npcm-vcd.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/nuvoton/nuvoton,gfxi.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/npcm-video.rst
 create mode 100644 drivers/media/platform/nuvoton/Kconfig
 create mode 100644 drivers/media/platform/nuvoton/Makefile
 create mode 100644 drivers/media/platform/nuvoton/npcm-regs.h
 create mode 100644 drivers/media/platform/nuvoton/npcm-video.c
 create mode 100644 include/uapi/linux/npcm-video.h

-- 
2.33.0

