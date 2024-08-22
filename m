Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3CA95B23E
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2024 11:50:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqJNB0BTsz30TS
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2024 19:50:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::434"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TqveNcKy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqJN60D4pz2yPM
	for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2024 19:50:13 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7142e002aceso481677b3a.2
        for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2024 02:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724320211; x=1724925011; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0eqgiERDvSpiSPKxHB5iRsf+0A8lyd+pOORVaquNyS8=;
        b=TqveNcKyyQiQSlsQeb8m8AvNEbpcRWqMS89rx9GuhBpf2XjNjXyP9xmE+0rtZaTYOv
         w+vWl9tPbqdPBKLfpTFswQaQw+ja+IBw46ESN/iiqOG98X9BmGahBjVXlf6GQIOPTYCe
         GMAv7z4Z4h3G1KdPZfsSK4t+p23XOYFQe2q4y03DO73zB+7YJuhJEi8SXqZXjswjTubG
         G2tkCLyjh50iF6NB9ZxXXm48PDX985cMgBDb6UXAEbHqi8ONl14npCL7oHq82GXIJXyn
         tPrNF7pToXa6GixfHoAMrBXBvNdTMBM9OagL2ziAvO3zghgSHHYZfKhNHEHK1CnaPNK+
         6wBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724320211; x=1724925011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0eqgiERDvSpiSPKxHB5iRsf+0A8lyd+pOORVaquNyS8=;
        b=wqCCd9gTg488ko67sX8Z89MW2I1wOoCi1zdSK5Gl4Saex9ekD47LuriFP5v0Txu9w3
         hkO7ZvAguyHqv+szdv6+EW7qEezhN2yhS5y/8xDPjHDJ2TWp7G+NBRvqESVia3+vYtLK
         NmBJwxYpDUXISTIAMCytfiqo6YUfJWDVtRwEHV0LFVmpkWb9YaFySB7YReIR+oNjnKly
         qELLIV23vj3VePix4+VCueZ5ImYalgTYC5xge3eXWzIR7yBblqWmpZIR7oJ6gtWMQMUX
         +Nggx3jnw8JaKr3lmYABzzKc7g9FZ6D4z0wYS3FOIgyB5kQIEcdcy5x60OZ3coPoZEI4
         I5zA==
X-Forwarded-Encrypted: i=1; AJvYcCXP+Zdw6TMJD6L0AQAKAJZoeXg5MVeCY9hle5oYuyKySDFLGwQuGgEmwlZn+4LFY6EXC4StGILc@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwlpdDMRdg9LrJU4cnTR91EONxgEDqlCj14nDmqOaobOrg+ehPf
	51opjA+/ZAwNZRQ3lBtvVLmNGcXZlif6coeDVRQAggTewBanSfeh
X-Google-Smtp-Source: AGHT+IHyNeZlK1t9nMBf2x7+fPB2HM50RyecnmqqYl6m1rynNw8AWScd2y3Uha9rN8rtV2eSPBTOaA==
X-Received: by 2002:a05:6a20:2d2b:b0:1c2:8dd5:71d9 with SMTP id adf61e73a8af0-1cad7f7253amr6056066637.4.1724320210533;
        Thu, 22 Aug 2024 02:50:10 -0700 (PDT)
Received: from cosmo-ubuntu-2204.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714378611d9sm818585b3a.43.2024.08.22.02.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:50:09 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.6 0/1] hwmon: Add driver for Astera Labs PT5161L retimer
Date: Thu, 22 Aug 2024 17:48:02 +0800
Message-Id: <20240822094803.2849010-1-chou.cosmo@gmail.com>
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
Cc: chou.cosmo@gmail.com, cosmo.chou@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This driver implements support for temperature monitoring of Astera Labs
PT5161L series PCIe retimer chips.

LINK: [v1] https://lore.kernel.org/all/20231205074723.3546295-1-chou.cosmo@gmail.com/

v6:
  - Remove unnecessary return value checking
  - Correct the available size for simple_read_from_buffer()

v5:
  - Fix warning and check messages of 'checkpatch --strict'
  - Without resubmitting the applied patches

v4:
  - Rebased

v3:
  - Revise pt5161l.rst
  - Revise the style of comments
  - Remove unused pec_enable
  - Add back safe access wide registers
  - fix build warning

v2:
  - Add "asteralabs,pt5161l" to trivial-devices.yaml
  - Change naming PT516XX/pt516xx to PT5161L/pt5161l
  - Separated debugfs files for health status
  - Revise the style of comments
  - Remove unused defines
  - Remove including unused header files
  - Remove unnecessary debugging messages
  - Revise the data parsing for a big-endian system
  - Use read_block_data instead of accessing wide registers
  - Remove the debugfs files when the device is unloaded
  - Add acpi_match_table

Cosmo Chou (1):
  hwmon: Add driver for Astera Labs PT5161L retimer

 Documentation/hwmon/index.rst   |   1 +
 Documentation/hwmon/pt5161l.rst |  42 ++
 MAINTAINERS                     |   7 +
 drivers/hwmon/Kconfig           |  10 +
 drivers/hwmon/Makefile          |   1 +
 drivers/hwmon/pt5161l.c         | 667 ++++++++++++++++++++++++++++++++
 6 files changed, 728 insertions(+)
 create mode 100644 Documentation/hwmon/pt5161l.rst
 create mode 100644 drivers/hwmon/pt5161l.c

-- 
2.34.1

