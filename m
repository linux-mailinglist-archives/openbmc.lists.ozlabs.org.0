Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BAE86A68F
	for <lists+openbmc@lfdr.de>; Wed, 28 Feb 2024 03:29:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kAS8n4+y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tkywh2mbnz3dS4
	for <lists+openbmc@lfdr.de>; Wed, 28 Feb 2024 13:29:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kAS8n4+y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkJwd1vqDz3cBK
	for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2024 11:57:03 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1dca8b86ee7so12290545ad.2
        for <openbmc@lists.ozlabs.org>; Mon, 26 Feb 2024 16:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708995420; x=1709600220; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rWOqPITH8/D/rm9Piee283eHAkgF3ezgjvokn+PRZ8I=;
        b=kAS8n4+yF1znlOxtciiLDvdpxmxyShEIMRJ+5lM4K67PxcUgi0P0/uh8BvR8D1ma5E
         JEQvrlaBEzRsZtzglpHPJoyJ7N0g5ozIG+NyOS+ud3/stTvPKR+WVuRKAIxOIrnuQrQ4
         E3x3Bkp67WsR9ky/JXcHuwVRmdZGcgYEJPj0CXAaiKET0QWTKaz6mw3EP7v1dzXZJB7A
         +L9nKCO7n46AtZ0RxzW4v+VGLd8aKNcZRYYfJhEGEpi28XhC0aVw2q/c7FON7WAy4bDj
         oQNtKk1T3SDdn9lA1ze0+jLIRzOC5Mi6Yl+DhLocCKHItalV2zGokjF128pOVbKIG1jd
         ZUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708995420; x=1709600220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWOqPITH8/D/rm9Piee283eHAkgF3ezgjvokn+PRZ8I=;
        b=dItb6gmoF7PNfBcrnmgv7R4pjng8DxwyF1/5Ly1kv3lCyrcWl3vnspBRTKrr2NdXAK
         7RZFeWbCE1nBz5A7Prs6kf/hdIFOiqlf9SwGPaL545/jCQ58wDbSQFpXdgV2zfzu9OeG
         +u0l0R6lKGKsrx5QAw1GNJR8WfRvZ0xU5T3t9h46pliwHiyqjDlZqEzsBSrt+yDOOeeR
         8CH8aTleZR0+q1tI+4l1VlqvIsJiQIgNanwsafO7Hz9/slvVzNeR1uFiaId4PcV9c0UU
         nyyAQnjGecWTm9sMA+slx2L6gprV1PxA/YmH9tRJRPsCrX/Gv4KI/gYHsh6LuGi8mBld
         r3Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXAl5pRWyuuz8r/SpKR+FsGorByGgskVb2BMCcJn+sVct6Lv6ntx5T7wrr2ua/DEi6DA1EKy2nC8fhUNukLoFDAKy1k6MNcS7E=
X-Gm-Message-State: AOJu0YwBhFrE7Zg6sVxSr046SO2Pce38YGCAdK9B48iRW0TVCI7Irt34
	EVC5hgWC4p+MP0eywJQmqHjop6D6YT/hfWXXLnqyoVnmirha5h1O
X-Google-Smtp-Source: AGHT+IFi5e/RLc/BtrFNtrv1ceMqXDqLPgjk0Fze9Pvw/xHtkjf+4uFWRAv/dagnTOmwpr9Lwd2C2A==
X-Received: by 2002:a17:902:f690:b0:1dc:5dc0:9ba with SMTP id l16-20020a170902f69000b001dc5dc009bamr9461638plg.26.1708995419555;
        Mon, 26 Feb 2024 16:56:59 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id t12-20020a170902e84c00b001db3361bc1dsm289253plg.102.2024.02.26.16.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 16:56:59 -0800 (PST)
From: baneric926@gmail.com
X-Google-Original-From: kcfeng0@nuvoton.com
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Subject: [PATCH v4 0/3] hwmon: Driver for Nuvoton NCT7363Y
Date: Tue, 27 Feb 2024 08:56:03 +0800
Message-Id: <20240227005606.1107203-1-kcfeng0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 28 Feb 2024 13:28:58 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, kcfeng0@nuvoton.com, kwliu@nuvoton.com, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Ban Feng <kcfeng0@nuvoton.com>

NCT7363Y is an I2C based hardware monitoring chip from Nuvoton.

Changes since version 3:
- Cherry-pick the fan-common.yaml in [1]
- Fix "checkpatch --strict" report
- Replace BIT_CHECK() with BIT()
- Fix CamelCase defines or variables
- Drop enum chips
- Drop all local caching and just read values through regmap
- Drop chip auto-detection since it increases boot time

[1]: https://patchwork.kernel.org/project/linux-hwmon/patch/
     20240221104025.1306227-2-billy_tsai@aspeedtech.com/

Changes since version 2:
- Cherry-pick the fan-common.yaml in [1]
- Fix nct736x typo and add unevaluatedProperties

[1]: https://patchwork.kernel.org/project/linux-hwmon/patch/
     20231107105025.1480561-2-billy_tsai@aspeedtech.com/

Changes since version 1:
- Modify NCT736X(nct736x) to NCT7363Y(nct7363)
- Convert to devm_hwmon_device_register_with_info API
- All ID tables are next to each other and should be consistent
  between i2c_device_id and of_device_id
- Ref. fan-common.yaml and modify properties (nuvoton,pwm-mask/
  nuvoton,fanin-mask) to (pwms/tach-ch)
- Convert to devm_regmap_init_i2c API
- Remove unused function (watchdog timer)
- Fix uninitialized symbol which is reported by kernel test robot

Ban Feng (2):
  dt-bindings: hwmon: Add NCT7363Y documentation
  hwmon: Driver for Nuvoton NCT7363Y

Naresh Solanki (1):
  dt-bindings: hwmon: fan: Add fan binding to schema

 .../devicetree/bindings/hwmon/fan-common.yaml |  78 ++++
 .../bindings/hwmon/nuvoton,nct7363.yaml       |  63 +++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/nct7363.rst               |  33 ++
 MAINTAINERS                                   |   8 +
 drivers/hwmon/Kconfig                         |  11 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/nct7363.c                       | 412 ++++++++++++++++++
 8 files changed, 607 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
 create mode 100644 Documentation/hwmon/nct7363.rst
 create mode 100644 drivers/hwmon/nct7363.c

-- 
2.34.1

