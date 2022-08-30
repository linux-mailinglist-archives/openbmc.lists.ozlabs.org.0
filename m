Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D43B5A595B
	for <lists+openbmc@lfdr.de>; Tue, 30 Aug 2022 04:23:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGrh950v7z3bkZ
	for <lists+openbmc@lfdr.de>; Tue, 30 Aug 2022 12:23:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OYj2omWd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OYj2omWd;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGrgl70x1z2xJS
	for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2022 12:22:57 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id q3so6511515pjg.3
        for <openbmc@lists.ozlabs.org>; Mon, 29 Aug 2022 19:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc;
        bh=/6PPh9l5vsaOt8qDO3Ez01p7E33dQteARC0QV6D3NwI=;
        b=OYj2omWdT1HXZUp1tH7NwgUMRFIv2F4Eo+t7nMRMgtt4+ZOU5zWb8yRWVlzzERtvta
         QDcY0X8IHlNtdhHfPfpmzTnuVvn+c8qqjedTwPA/C3uJ+Pc0g+dizYe2eX31uIh+/rNx
         g49BjoFLhLXXVEjtiQIHqA4ZZxzgsqtiPfHifHYVhUSliZXlUlmOuOd9Sui5Ftpj5e1L
         0TrcMLds/ScYVcVS8aDKI0bnQUgfK9k8mAqDx5iQkmflV8OUYnt8KafY6wnuiUPLS3/d
         8i3XucImgitH8Eiy2+BhnD0V7/4nHnnf55+B3J4exmKcLwDu8SQ3hzOoNBzeSSOeWqiq
         0wnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=/6PPh9l5vsaOt8qDO3Ez01p7E33dQteARC0QV6D3NwI=;
        b=5ItM8RhkIcWfhtxrzvKynNVKdTJR2rnP/UPp4xrouOnrEU93dtHW4tjpQA6CHjpEQJ
         WXPbdZ2u6pBHGLHEuD3HBxFuo+NUjDhU7AlfqJiqppWP/A/Ekh1NhS+gdLq4eShLGO2V
         1o9EWhAVhydDqyAHd9c5dVFDpGY5A3kPtxLAw//cd7mP/wPrkrysbq/qPITktxtLCsvt
         EMnNe9wRjxuJgmXSLo9oO01Ab3UnIxk5Xx74URXbcCfGA2MSyx/QN4bh7utXEvCHmECg
         Wlk+lEvMhyRbd7eIsWR/g5FeUt4cBKMLT2UwanOmMbu6jj+E/zvMliqdRfbFjhM9pXj8
         R80g==
X-Gm-Message-State: ACgBeo032AOp7ld3yNp3ZGayC6oEKNwc+dx9QL7j16lKYjJzg/vXYOm/
	yoHvMZ7XkleyY7OzX7aPp5c=
X-Google-Smtp-Source: AA6agR6qaMqZKVUaPCzsKu+BoWnKtLk5qUQv9370Sb7fpu7MQNjYpNaybN34miguWBt8kG6Jp1RB/w==
X-Received: by 2002:a17:90a:cf8c:b0:1fd:7783:c340 with SMTP id i12-20020a17090acf8c00b001fd7783c340mr17244081pju.16.1661826173725;
        Mon, 29 Aug 2022 19:22:53 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id c78-20020a621c51000000b00536531536adsm7916841pfc.47.2022.08.29.19.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 19:22:52 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: linux-edac@vger.kernel.org,
	rric@kernel.org,
	james.morse@arm.com,
	tony.luck@intel.com,
	mchehab@kernel.org,
	bp@alien8.de,
	robh+dt@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v14 0/3] EDAC/nuvoton: Add NPCM memory controller driver
Date: Tue, 30 Aug 2022 10:22:35 +0800
Message-Id: <20220830022238.28379-1-milkfafa@gmail.com>
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

Changes in v14:
  - Fix compile warnings

Changes in v13:
  - Support error injection via debugfs
  - Fix coding style issues

Marvin Lin (3):
  arm: dts: nuvoton: Add node for NPCM memory controller
  dt-bindings: edac: nuvoton: Add document for NPCM memory controller
  EDAC/nuvoton: Add NPCM memory controller driver

 .../edac/nuvoton,npcm-memory-controller.yaml  |  54 ++
 MAINTAINERS                                   |   7 +
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   7 +
 drivers/edac/Kconfig                          |  11 +
 drivers/edac/Makefile                         |   1 +
 drivers/edac/npcm_edac.c                      | 516 ++++++++++++++++++
 6 files changed, 596 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
 create mode 100644 drivers/edac/npcm_edac.c

-- 
2.17.1

