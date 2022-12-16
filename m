Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3FF64E7CD
	for <lists+openbmc@lfdr.de>; Fri, 16 Dec 2022 08:32:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYLRF4bVkz304s
	for <lists+openbmc@lfdr.de>; Fri, 16 Dec 2022 18:32:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=E9+GJVu5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=E9+GJVu5;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYLQc5tH6z304s
	for <openbmc@lists.ozlabs.org>; Fri, 16 Dec 2022 18:32:07 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id g1so1236639pfk.2
        for <openbmc@lists.ozlabs.org>; Thu, 15 Dec 2022 23:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WivkawWqftfG9cwjjZTcLDoOGcI8ZfyTyq38lUwyeaY=;
        b=E9+GJVu5jahV/qnD7b5BlMzb5S9DmG5setb7JajP3fVezDN8emP3EYVrfrikM2r2f4
         c738p6sSHPOFguw5+HhvpzSgBtK2FrkwTSS+gu3LVkKWlyZnEsUBhu/gz2KVSTwtIOEG
         U9qQ7eg+iNLfDn8ieq/IxiqILNkp9W4EqcW19LoQRUjndtv37kp4ZUx0Pzn+msS35yrM
         zmnkDR61s0SS9YvUHZKGht8Xi7FUiqSRkC83YXzorMF3k6aO8qeX+XHJfzkXp2ikPwz4
         wjGXIs4QAWkdfHo9s6b2e+bcPminNncasbIzQ/k+HCSEw1I1pTFUvBmVQzZgr64Yp41p
         ccOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WivkawWqftfG9cwjjZTcLDoOGcI8ZfyTyq38lUwyeaY=;
        b=iMthX7xtOcqmOdbzkQ/+8VWPBIh1KDjKXAatJbzBph5GiGL5eQ7cZf7zejxjphukyr
         CqEqtsiBjusumqiENcEXCF5ueaZL/RR8cZuG5DbIvChwarJsneRmyHp0tSBIJ4v2NdyF
         GV2rI3yxbEsFJLsiddmlpS8kPwdiWZTWKFQG3O4NbDbEpOnuPpe+rBvry9LSE6U9EKDo
         yEE7eEEVCUNvypG2RKjzIIeKCF38s4KuO3TH2CzkV1ej5ALfqhYqIOz8SssxLvOis59h
         j3ojiuTbz3OQ6N31IA6RUFLK6BPxn327OwWuAIk9fDyHy+2CyanEDxhoIpOxr3s6E4y1
         KmWA==
X-Gm-Message-State: ANoB5pnmGvXPwqBg3HiJijPP3hDqhIoyDDOOT1FAXyM91hXgkUm0ZX76
	M/UsZX/+O8gzUSzP8jeJlDE=
X-Google-Smtp-Source: AA0mqf7khtd2QiDF1uOXxGGs2YuY8T+Bx4nJEyTA1tddpi43KwrjwB0rnKY9V6NMNNm6uHGAbZwRNQ==
X-Received: by 2002:a62:4e96:0:b0:574:1d8a:d4f with SMTP id c144-20020a624e96000000b005741d8a0d4fmr30989136pfb.16.1671175924640;
        Thu, 15 Dec 2022 23:32:04 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 193-20020a6217ca000000b00574cf11aaf3sm770123pfx.208.2022.12.15.23.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 23:32:04 -0800 (PST)
From: Marvin Lin <milkfafa@gmail.com>
To: linux-edac@vger.kernel.org,
	rric@kernel.org,
	james.morse@arm.com,
	tony.luck@intel.com,
	mchehab@kernel.org,
	bp@alien8.de,
	robh+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski@linaro.org
Subject: [PATCH v16 0/3] EDAC/nuvoton: Add NPCM memory controller driver
Date: Fri, 16 Dec 2022 15:31:38 +0800
Message-Id: <20221216073141.3289309-1-milkfafa@gmail.com>
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
Cc: KWLIU@nuvoton.com, YSCHU@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com, ctcchien@nuvoton.com, kflin@nuvoton.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch series add DTS node, dt-bindings document and driver for memory
controller present on Nuvoton NPCM SoCs.

The memory controller supports single bit error correction and double bit
error detection (in-line ECC in which a section 1/8th of the memory device
used to store data is used for ECC storage).

Changes in v16:
  - Correct dt-bindings document path in MAINTAINERS.
  - Fix wrong indentation in driver.

Changes in v15:
  - Move dt-bindings document to memory-controllers directory and remove
    superfluous string in content title.

Changes in v14:
  - Fix compile warnings.

Changes in v13:
  - Support error injection via debugfs.
  - Fix coding style issues.

Marvin Lin (3):
  Arm: dts: nuvoton: Add node for NPCM memory controller
  dt-bindings: edac: nuvoton: Add document for NPCM memory controller
  EDAC/npcm: Add NPCM memory controller driver

 .../memory-controllers/nuvoton,npcm-mc.yaml   |  54 ++
 MAINTAINERS                                   |   7 +
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   7 +
 drivers/edac/Kconfig                          |  11 +
 drivers/edac/Makefile                         |   1 +
 drivers/edac/npcm_edac.c                      | 520 ++++++++++++++++++
 6 files changed, 600 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nuvoton,npcm-mc.yaml
 create mode 100644 drivers/edac/npcm_edac.c

-- 
2.34.1

