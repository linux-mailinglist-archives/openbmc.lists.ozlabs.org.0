Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 184CB5F72EB
	for <lists+openbmc@lfdr.de>; Fri,  7 Oct 2022 04:55:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MkCc007YHz2xy6
	for <lists+openbmc@lfdr.de>; Fri,  7 Oct 2022 13:55:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QoAudtpw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QoAudtpw;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MkCbM4bqTz2ywm
	for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2022 13:55:10 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id a23so3453737pgi.10
        for <openbmc@lists.ozlabs.org>; Thu, 06 Oct 2022 19:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1t1lgGSkCV/fbIs2kuR7yhjBJKzOBf1B0SWabinchi4=;
        b=QoAudtpwG6sMTU4xgzk3grcK2BAKOCbEdKjZFeOGkJijWrdxnNk3FDzAEhKVi14TW1
         XSdbvHgRqtmOhR62MTGBxKpFrXgl8UYC+E6B5ij95Raqp62XSY5WdoTrPXtT8H+lsW5D
         O1liYB6Ogg6VxfNkfPrPn79f8WcBYHpiPHsDmhZuj0dFRTtYMDlSwDgeA1Xty9JN05uB
         t5PwbLtuhS2YC3+dvmAdJVsHSfW+SrLBn7t7gk6yx9uszhZJP6LfrVvioVSN0KSjIQuy
         NqLBNsDQSrHPkwGvBIvBsR0ZfU1h4jbsfYB6y3d4BbRgwxfNpFWJTEiIKoyc0pklTvR6
         JycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1t1lgGSkCV/fbIs2kuR7yhjBJKzOBf1B0SWabinchi4=;
        b=j4pq4TFc2pVs23U22WqXMHVDVotjb47y5evjyltnvKa//bH3QoSPjsmCmEmHB/qGUP
         Y7uJvskXscm3S5Y4FddyLmR3nSJ0cppNuAYu2yNWSkQWJEGb/8lWbY0TSUt/vFwcyvXa
         yXMzIQMOX++HMGY2Fk1Gh2tfhLmhe8wMcJsReuI+YLWKeM29XPnXQjtKXauDr7UZVLRM
         MBDi/N/bU2nXxP9u6X+ofEr0knJrWHCT0fEgivn0bcenugtkGlkBrgv6iLj+1LfkdP+W
         eibO0Y1xnLSTjIrKXRlgHHwP2lPpb4budiTSVvtkWMbTysgWq6Xqp3A7Ob2SgTV0/07s
         IaYw==
X-Gm-Message-State: ACrzQf1qEaiT2CAMof0+HFRopRaPKQI5BJFevPGkZ8tiBVRJkqe+vR5P
	Mwico9nOjq8pz+fHO91mILYHZVE90Ds=
X-Google-Smtp-Source: AMsMyM5unW/otYae8tUOGWtaUXDPcotFxOtgouXYYvzkqzHVNdgvJkDEkhUVGry7euP+g8dsMxufgA==
X-Received: by 2002:a65:64d9:0:b0:43b:f6e1:335e with SMTP id t25-20020a6564d9000000b0043bf6e1335emr2596468pgv.210.1665111308257;
        Thu, 06 Oct 2022 19:55:08 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id h12-20020a63574c000000b0041c0c9c0072sm476944pgm.64.2022.10.06.19.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 19:55:07 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v1 0/5] Support Nuvoton NPCM Video Capture/Encode Engine
Date: Fri,  7 Oct 2022 10:54:08 +0800
Message-Id: <20221007025413.3549628-1-milkfafa@gmail.com>
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
Cc: andrew@aj.id.au, kflin@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, joel@jms.id.au, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch series add DTS node, dt-bindings document and drivers for Video
Capture/Differentiation Engine (VCD) and Encoding Compression Engine (ECE)
present on Nuvoton NPCM SoCs.

VCD can capture/differentiate video data from digital or analog sources,
then the ECE will compress the data into HEXTILE format.

HEXTILE compressed format is defined in Remote Framebuffer Protocol (RFC
6143) and is used by VNC features, so we also add a patch to support it.

Marvin Lin (5):
  arm64: dts: nuvoton: Add node for NPCM Video Capture/Encode Engine
  dt-bindings: media: Add dt-bindings for NPCM Video Capture/Encode
    Engine
  dt-bindings: arm/npcm: Add dt-bindings for Graphics Core Information
  media: Add HEXTILE compressed format
  drivers: media: platform: Add NPCM Video Capture/Encode Engine driver

 .../bindings/arm/npcm/nuvoton,gfxi.yaml       |   41 +
 .../bindings/media/nuvoton,npcm-video.yaml    |   87 +
 .../media/v4l/pixfmt-reserved.rst             |    8 +
 MAINTAINERS                                   |    1 +
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   |   19 +
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  |   18 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/nuvoton/Kconfig        |    9 +
 drivers/media/platform/nuvoton/Makefile       |    2 +
 drivers/media/platform/nuvoton/npcm-video.c   | 2095 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 include/uapi/linux/videodev2.h                |    1 +
 13 files changed, 2284 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml
 create mode 100644 Documentation/devicetree/bindings/media/nuvoton,npcm-video.yaml
 create mode 100644 drivers/media/platform/nuvoton/Kconfig
 create mode 100644 drivers/media/platform/nuvoton/Makefile
 create mode 100644 drivers/media/platform/nuvoton/npcm-video.c

-- 
2.34.1

