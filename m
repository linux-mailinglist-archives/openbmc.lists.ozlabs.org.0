Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D8F5956F1
	for <lists+openbmc@lfdr.de>; Tue, 16 Aug 2022 11:47:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6RC22npFz3bl4
	for <lists+openbmc@lfdr.de>; Tue, 16 Aug 2022 19:47:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Dp4lZy24;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Dp4lZy24;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6RBc0Zrvz30LS
	for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2022 19:47:01 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id s5-20020a17090a13c500b001f4da9ffe5fso16868096pjf.5
        for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2022 02:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc;
        bh=pHRc3XNJRVdOlhGjXylbNoDow3CdvGIRDLCNfCwr39A=;
        b=Dp4lZy24fLiDRTYbfL/btDWe4UT2Mo6FngI8Ahi75hGbrSe27KKncW1seWJooFwbLJ
         0uBC+i730zsIwpaAsU4yLw7h92LkIXYX1aKtDy9vbOrPEt7vO3F7BNN4idj0EYfjvXQH
         ryBZWhKGJBJgqp2ZlTqzIsuLeik2oWjgyr/7Ch0tGITiYbn+7h9y4bmi9HK3WIjvXVsQ
         lQtm14c2utZhR0wKNDiSVrzDe5GMUP1D8FAtEcuNATnwiEQOKrY/bbHVm6W0kb4tIdD2
         Ul0rAkNIVycp6cuPgCp37eWPGfGVIX49WsFq6dvqCmBZvVk8jNBAS9PqudgsoEntOStt
         WlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=pHRc3XNJRVdOlhGjXylbNoDow3CdvGIRDLCNfCwr39A=;
        b=gEaG9Oh/ypYgk596rMxS49bfEE0LBsYOI/ltcmGYmXwvqCGVXxx/a+bJkNp3FiRXU5
         5XOIIol+GI/ZN1KFOBN+OkgrjvIsa1m0A8H7cItIuSa3u/YnsPftJpGX8Gp213x96h7Z
         ugFXvUw/9wDOLj+SFx0lAQS3OQCVNX/lmNMH9kd5nXWmDNfyqvkQmiIAoyGsQoUHKSAR
         64uo6ow9la35HwfKBS207wV2UzyFyX69vLp1fCw9L2kHX8K92j+rXO6OWhRsoVRLxaLf
         5FoYkxOZCstrwkWcnkgTKixgt1lt10x3rZRGWIpfUrXhFqMp1umrsHL+KANBolJqZer9
         q/pw==
X-Gm-Message-State: ACgBeo3xunGoqD8w98ZrNLwSKCuqWzpVzYpSztN0nEcHOTxc6aPUCJU7
	v02hVdRca8uSu/82bM0nvrE=
X-Google-Smtp-Source: AA6agR7c2QGtIrRRRVg2sQ3CWbprJCmOgPTeTKk7l5ouPudQj59Nh8ZSBuwCXdv+2WInsIlFSElPNA==
X-Received: by 2002:a17:902:d546:b0:16e:c70c:fdf5 with SMTP id z6-20020a170902d54600b0016ec70cfdf5mr21500871plf.100.1660643217711;
        Tue, 16 Aug 2022 02:46:57 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id f12-20020a170902e98c00b0016bee668a5asm8578767plb.161.2022.08.16.02.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 02:46:56 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: linux-edac@vger.kernel.org,
	rric@kernel.org,
	james.morse@arm.com,
	tony.luck@intel.com,
	mchehab@kernel.org,
	bp@alien8.de,
	robh+dt@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v13 0/3] EDAC/nuvoton: Add NPCM memory controller driver
Date: Tue, 16 Aug 2022 17:46:38 +0800
Message-Id: <20220816094641.8484-1-milkfafa@gmail.com>
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
Cc: KWLIU@nuvoton.com, YSCHU@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, benjaminfair@google.com, devicetree@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, KFTING@nuvoton.com, JJLIU0@nuvoton.com, tali.perry1@gmail.com, ctcchien@nuvoton.com, kflin@nuvoton.com, tmaimon77@gmail.com
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
 MAINTAINERS                                   |   7 +
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   7 +
 drivers/edac/Kconfig                          |  11 +
 drivers/edac/Makefile                         |   1 +
 drivers/edac/npcm_edac.c                      | 512 ++++++++++++++++++
 6 files changed, 592 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
 create mode 100644 drivers/edac/npcm_edac.c

-- 
2.17.1

