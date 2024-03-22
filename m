Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DE7887617
	for <lists+openbmc@lfdr.de>; Sat, 23 Mar 2024 01:29:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jqjMA11Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1g6q4hdkz3vjQ
	for <lists+openbmc@lfdr.de>; Sat, 23 Mar 2024 11:29:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jqjMA11Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1FYt4g2kz3dX1
	for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2024 19:17:37 +1100 (AEDT)
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3686717e82aso5629855ab.2
        for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2024 01:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711095454; x=1711700254; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yy+KHNUW+coF6cF93OFhp/xRFqCnGtKs15mHnvutaYM=;
        b=jqjMA11ZAUVtwpRZSYFYPdlEAlSi66C/PjURlQ0vHBWSmH65O55oLoKCAzfhIGtn/G
         rmYc29UkgfvE3u2ugQcKXjLQUOj1rtEdfzQq6pXyShxy+oE77IRAliZ4W01cV7WPjssA
         lFzFr6bzTitAFoRNqtDfm9AA+ZQ2WBi3ydRn4Jpnsz5P82P1w0kUBkRgvqQajKnozn8C
         PjEiV0LgL83SmCCovI5Cw3+mI8eG2s7Jnr+pdXj6OVCjJMH1FPi8DKlX9fUclrAj6tct
         FSxaR9nGxEOnKv2QmpbSpxmrNXnrQfB40qBIQQzGxiR/g1LyKCguEMkW90I+n/xcEb8N
         zpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711095454; x=1711700254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yy+KHNUW+coF6cF93OFhp/xRFqCnGtKs15mHnvutaYM=;
        b=We2gFRaMtl0f6XdByz/KjsE3CW0fWmPShMEehm7tguoF21KgyhKmllrnU2QLEpr+TX
         RdGYuv5LbTdd90G1Bll9I5S1qD2heUJYSn4Mynnu6FJ0VMKdUYVT+bIjTaEX7U59Gvu1
         vCFpc/2pWKUEvZBTGHgx2d91B5aDiEsIZx1axVDtBBHvnhrACJYJnqlmNkxSkSwMr35M
         /AFfG7JJgO5To4abUuh5VVlgHfZYkcgalrQTTBMCZpum4mytYxtfceVaWTpcHEoXnddr
         7ClmQZuzO9mpKCHpxXqy4g4p58kXrFFi/i4QxPOlnd4HXn5yJkNAryXedTquEh+vjTE7
         SeKw==
X-Forwarded-Encrypted: i=1; AJvYcCVezIviL8NGaCOOE/vC8KfsndGrAjz6T2WG17VMAQ2ei9KHds4MkrkAuh3CKlzABD66a2V9oss2yBttnrXyvvq9GogsDKggFYo=
X-Gm-Message-State: AOJu0YycylqXrCKrnSwKzJoDulI1W/7UEVHlqS25BuWR/17d+JSVByDl
	ghrvau864wQMk99Gzjpno8ywjXI4YQGgQ1Pb4jh18ZTrpxQDp8it1EsIZYyjXbY=
X-Google-Smtp-Source: AGHT+IGtZSQd4OGDi6oKa3A/VMJZUn6iI84Lg9soIxe7ueMP2K9ls9aPaWHsCdIhDoSHLxi++tYQ8Q==
X-Received: by 2002:a05:6a21:3997:b0:1a3:55d2:1489 with SMTP id ad23-20020a056a21399700b001a355d21489mr2312813pzc.7.1711095147442;
        Fri, 22 Mar 2024 01:12:27 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id s128-20020a625e86000000b006e749161d40sm1132564pfb.113.2024.03.22.01.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 01:12:26 -0700 (PDT)
From: baneric926@gmail.com
X-Google-Original-From: kcfeng0@nuvoton.com
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Subject: [PATCH v5 0/2] hwmon: Driver for Nuvoton NCT7363Y
Date: Fri, 22 Mar 2024 16:11:56 +0800
Message-Id: <20240322081158.4106326-1-kcfeng0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 23 Mar 2024 11:26:13 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, kcfeng0@nuvoton.com, kwliu@nuvoton.com, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Ban Feng <kcfeng0@nuvoton.com>

NCT7363Y is an I2C based hardware monitoring chip from Nuvoton.

Changes since version 4:
- add Datasheet information and refine words in yaml and rst files
- remove fan-common.yaml since it is already in hwmon-next
- refine the commit messages
- modify the type of returned value in some functions
- refine lock/unlock in nct7363_write_pwm and accessing
  HVAL/LVAL registers
- refine nct7363_init_chip
- add range check in nct7363_present_pwm_fanin
- add i2c_device_id table
- add nct7362 to of_device_id and i2c_device_id table

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
  hwmon: Add driver for I2C chip Nuvoton NCT7363Y

 .../bindings/hwmon/nuvoton,nct7363.yaml       |  66 +++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/nct7363.rst               |  33 ++
 MAINTAINERS                                   |   8 +
 drivers/hwmon/Kconfig                         |  11 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/nct7363.c                       | 396 ++++++++++++++++++
 7 files changed, 516 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
 create mode 100644 Documentation/hwmon/nct7363.rst
 create mode 100644 drivers/hwmon/nct7363.c

-- 
2.34.1

