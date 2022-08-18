Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BEE598044
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 10:44:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7djk5QqLz3c17
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 18:44:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dlcC/Qd2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dlcC/Qd2;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7djL6Qf0z2ynh
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 18:44:21 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id c2so974188plo.3
        for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 01:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc;
        bh=FZD2u7PxRTWL1pXWzXk8gq+6v+k0BJo+WrVNhiQsJ6s=;
        b=dlcC/Qd2aVLTjcr2hrRlMeyzF0nEAsWfJQCvJtS66Uu04hgt9asOBF0EC5uS3QU0YF
         VC6cWlrl+dVo7l8Lu0BabTBTnYBeEF3dPb9fWKiLSIxhSgiVjX1eA9VDsuekVIqPX9ER
         R/+M8MNJuKZf++puJ01bSzp7fEUDFtj/YZrYA1sbEa+7W79UCQRxDJYM63MCgW5B9YVt
         999JDAXz75EpuH5La6Q/RkISrZqCo7KLkqZCj6MewxV5mMndeNfXVb7dLSlxkvb6+Stn
         Hx7dBi0qDY2RL13p8yY8fymOk1794HJaqSrfFUaoAXwSdkP/y7h1a/YFhLJ8DNnjSQPk
         m7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=FZD2u7PxRTWL1pXWzXk8gq+6v+k0BJo+WrVNhiQsJ6s=;
        b=ncxN3iVxWRziLnBIZ0T0GzCYthjbgcdZm+32CWU1RYiKRd33lzCL5L4hwbBS7KyHPi
         rKAzQVHJfXNVaW1cd4DXe18vsGTBmkPboa2yvJ47ZCaz+1jetu4gyW9X40lc4zja0kJz
         ZXJ6w3t4/oajfpkpzGQJdZgn3jKNGDZ2fmur+CMznowQMLZ7U9SkmpwMAd8Jgj1CjvIC
         aV14vMQT2ZH8fwzI3eyFGuv7qa8VB1v899DCo57Qlyc7jskH4FBFsBQ4JA26G7ZgIfMk
         vHGMf4ZLdHih+sO1tO3SrzddEIBtCt+KgAMFvdRmpfTUQXpck02kSGLhKd2oTjnnPM/N
         qZvw==
X-Gm-Message-State: ACgBeo2icpc+XONyNUFFCW7Lb9t+jIrlW+5bd9wngSmRx2TENbdPMV+D
	0TxPBpTtqwwFTJxk7VqxLvoatIAPmns=
X-Google-Smtp-Source: AA6agR4ULhBJxYKuk4Sy/6CjRmT8iStxdj4I7TLWOEw0Njxxc9yvMEVK6Id1u4xppghefWqo/0iU6w==
X-Received: by 2002:a17:90b:2685:b0:1fa:b21d:34ce with SMTP id pl5-20020a17090b268500b001fab21d34cemr2062463pjb.188.1660812259514;
        Thu, 18 Aug 2022 01:44:19 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id f5-20020a170902ce8500b0016c09a0ef87sm833402plg.255.2022.08.18.01.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 01:44:18 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 v1 0/3] EDAC/nuvoton: Add NPCM memory controller driver
Date: Thu, 18 Aug 2022 16:43:57 +0800
Message-Id: <20220818084400.19931-1-milkfafa@gmail.com>
X-Mailer: git-send-email 2.17.1
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

This patch series add DTS node, dt-bindings document and driver for memory
controller present on Nuvoton NPCM SoCs.

The memory controller supports single bit error correction and double bit
error detection (in-line ECC in which a section 1/8th of the memory device
used to store data is used for ECC storage).

Marvin Lin (3):
  arm: dts: nuvoton: Add node for NPCM memory controller
  dt-bindings: edac: nuvoton: Add document for NPCM memory controller
  EDAC/nuvoton: Add NPCM memory controller driver

 .../edac/nuvoton,npcm-memory-controller.yaml  |  54 ++
 MAINTAINERS                                   |   6 +
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  |   4 +
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |   7 +
 drivers/edac/Kconfig                          |  11 +
 drivers/edac/Makefile                         |   1 +
 drivers/edac/npcm_edac.c                      | 512 ++++++++++++++++++
 7 files changed, 595 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
 create mode 100644 drivers/edac/npcm_edac.c

-- 
2.17.1

