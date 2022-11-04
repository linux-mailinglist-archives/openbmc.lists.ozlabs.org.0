Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F01618F34
	for <lists+openbmc@lfdr.de>; Fri,  4 Nov 2022 04:40:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3RGJ5dMpz3cLx
	for <lists+openbmc@lfdr.de>; Fri,  4 Nov 2022 14:40:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=p7qzc0fD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=p7qzc0fD;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3RDg5pwhz3byj
	for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2022 14:38:42 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id io19so3764406plb.8
        for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2022 20:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BIBSO8ZhfoOnCIqBf4JIjxIbJSOo930x/QG6CRhZqZw=;
        b=p7qzc0fD4Y9LXR0L1FApcK7vnnes03yi+J8oM4Enu/2md0/3wJtUp55hjpuLK6CbWg
         oH0GZQVJ10AUo9q5xBBvnb/SLv0+YhbFlopNIgBrF3wTBo2fw8LqNfNmO62NETWA54m3
         0rRPhAkU1Sfi5NSehJs9j3UV6InyBY/422hBRgmMh/y0CQUQLBZ2MEHMjmsecrM588x3
         Gc1sV3sC0+Nc/SQR78IULghPWV5e/dAJRKHTKO/JCjxTS6Ule9WtyvAxTM2chbERyuW4
         Imd80Bbrzd1aboX5F2k8dER9mRyHzDjpFzHbpcpXk3PkscPdbTAhiVhedyl1DMWErONx
         yfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BIBSO8ZhfoOnCIqBf4JIjxIbJSOo930x/QG6CRhZqZw=;
        b=R/5LIGgQw5eCCMLuOVC5YrA+SGCQ5iFlrznLg04/KAapQa3e4jn+u232lr0PCcxwE3
         FtMng5UwjEG8kjzmtXuHRW8rJacrEt/hE7seaSuPeVljjqtfAvJ7Zu2FFaFNv7eNe0Ot
         qNU8RES9EMwYvtl1rcve4o/J1qHbvDrODx8s01xjsLapQvT/q1Yh1ioAtOwbFVGHscHo
         bnEhRboQC15WauYXlWEf16G/6P/tQPyq8dZax0aBW3uD/G0ae3EH5/en9vQwCvYaaOBy
         TvKzxPkc1OxXRK/BdqNY1K6Z35z3PmUeCJn4xdjq/0B/W5HFHB6tCJXhFCKiTt8PKMJF
         lKBQ==
X-Gm-Message-State: ACrzQf2BfuwmFFUuuRgQcv262zLVnBG1hmRM5y1+GcVTab0HYJkK4Hhi
	doaaPIqjndNcmvBRR/SIJcY=
X-Google-Smtp-Source: AMsMyM6QvfRsAwE/H7kQmKWFTjew7xtuhLq7ti65AZx5tJU+VmBSUdG/vxpZCn+cFki5lCJUPiK16A==
X-Received: by 2002:a17:902:f647:b0:183:cb8d:40a0 with SMTP id m7-20020a170902f64700b00183cb8d40a0mr33220333plg.18.1667533119049;
        Thu, 03 Nov 2022 20:38:39 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id f17-20020aa79d91000000b0056bb06ce1cfsm1545759pfq.97.2022.11.03.20.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:38:38 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/5] Support Nuvoton NPCM Video Capture/Encode Engine
Date: Fri,  4 Nov 2022 11:38:05 +0800
Message-Id: <20221104033810.1324686-1-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, tmaimon77@gmail.com, avifishman70@gmail.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com, kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch series add DTS node, dt-bindings document and drivers for Video
Capture/Differentiation Engine (VCD) and Encoding Compression Engine (ECE)
present on Nuvoton NPCM SoCs.

VCD can capture/differentiate video data from digital or analog sources,
then the ECE will compress the data into HEXTILE format.

HEXTILE compressed format is defined in Remote Framebuffer Protocol (RFC
6143) and is used by VNC features, so we also add a patch to support it.

Changes in v6:
  - Support NPCM845 and add compatible "nuvoton,npcm845-video".
  - Correct pixel format to V4L2_PIX_FMT_HEXTILE which is newly added in
    this patch series.

Changes in v5:
  - Simplify function prefix "nuvoton_" to "npcm_".
  - Increase VCD_BUSY_TIMEOUT_US and ECE_POLL_TIMEOUT_US to 300ms to
    prevent polling timeout when ECC is enabled or system is busy.

Changes in v4:
  - Fix compile warning reported by kernel test robot.

Changes in v3:
  - Add video driver entry in MAINTAINERS.
  - Change config name to CONFIG_VIDEO_NPCM_VCD_ECE.
  - Reduce the waiting time after resetting the VCD/ECE module.
  - Correct data types of some variables.

Changes in v2:
  - Add Hextile document and locate with vendor formats.

Marvin Lin (5):
  arm: dts: Add node for NPCM Video Capture/Encode Engine
  dt-bindings: media: Add dt-bindings for NPCM Video Capture/Encode
    Engine
  dt-bindings: arm/npcm: Add dt-bindings for Graphics Core Information
  media: Add HEXTILE compressed format
  drivers: media: platform: Add NPCM Video Capture/Encode Engine driver

 .../bindings/arm/npcm/nuvoton,gfxi.yaml       |   41 +
 .../bindings/media/nuvoton,npcm-video.yaml    |   87 +
 .../media/v4l/pixfmt-reserved.rst             |    7 +
 MAINTAINERS                                   |    9 +
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   19 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/nuvoton/Kconfig        |   12 +
 drivers/media/platform/nuvoton/Makefile       |    2 +
 drivers/media/platform/nuvoton/npcm-video.c   | 2093 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 include/uapi/linux/videodev2.h                |    1 +
 12 files changed, 2274 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml
 create mode 100644 Documentation/devicetree/bindings/media/nuvoton,npcm-video.yaml
 create mode 100644 drivers/media/platform/nuvoton/Kconfig
 create mode 100644 drivers/media/platform/nuvoton/Makefile
 create mode 100644 drivers/media/platform/nuvoton/npcm-video.c

-- 
2.34.1

