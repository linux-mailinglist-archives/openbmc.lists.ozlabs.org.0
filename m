Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8539AB9D1
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2024 01:05:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XY7740rztz3c3y
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2024 10:05:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729574972;
	cv=none; b=Y7ejUATsYU6A6JKQOmMdkjl/lWv1UiwEwgHcsU72K+/AfMjzytI+DYydc2mMgVkwPOHqN1DNcnW1EObybfkZ5/ufdMxAjerCdScb4DOaRWXYdawtumED2UxsFHdmJiuc6iEG97oLrDCOQuoa2O9ARtB7UN/wnldC6eXI+BRtftuduA14S3Bkg4z5vZg67//xaKOe7fEzPAJ1xUmGU+H2VdhWW5qiZdmA7wJXYwpfjhk7hq1p98Or2DDLQNJhQ9rxSfEYczfRP4dbpx7PY8eVPOn7qF7fAYF0nA6+dgHDxGJH/pHiuZnE025fvEF9hqejhhMhGmt7iV13f2IppOUL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729574972; c=relaxed/relaxed;
	bh=CfWo8rEibeJNRR9ub5UZ9B73NL531yxGF3rC7/Vsvq4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=opvM1Q3XxAuKsuL1tgymwyEjj7TmdyN9YKmlbxl1KgBN63PHgcIPdCn3KgmsgNorP8YxLbtDk5vn4rISLUhZ78Mv3WoKuDzzjLow0fnzcE4qLqnayTtgdOc8PIiTW5ypEAO5x8KjbuQ329plxkm/3nSFVBADwxTeOAxGuuQgISdglvfUKFoqZwedpJ04+IsWWEI9jeiD+adoPUfy4EzwIz1dtilse9ld0nFeDIvpDJINdEMXQgfRqbrUKLNDbn5xuiC8bUIIsVKLyD+A1Et5JvP24i3lMa4sEHLRops4HiiIx5stMsBXS65GqXTf+ZZueulN4YmobcTfQSBP83qRJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kr+EIZE9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kr+EIZE9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXgj75B42z2yVM
	for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2024 16:29:30 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-71e3fce4a60so3484569b3a.0
        for <openbmc@lists.ozlabs.org>; Mon, 21 Oct 2024 22:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729574966; x=1730179766; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CfWo8rEibeJNRR9ub5UZ9B73NL531yxGF3rC7/Vsvq4=;
        b=kr+EIZE9iMJIDX9DmmX9pM8HEcEnHzKbkZD3H0l0UB6S8E8SmFBBzx9w9Z2KHhJEpF
         1h+nN6uF+PluBoNbrkWhsnoVu/ChofZbnR1edMF6HTYnY97hngGMFXPVfGG6s0EQQCRb
         fcm6Pv7VSUjqihZGtXGsQ62DQxKjg7hDFf2X1gcEl0suRAXumqL+5KUirQIMTzHeZsx2
         Cw4kn8gKDboI3AxKvIdToVnf6e7Nk/jtjmMKf2lrBVhVgW6tpOXujCsEMA7Fb5IiWbUP
         G+arqjxtCyF//USBEUIp1x6TsMwwX77dRPX+OteZ78D5bKd35MRafbrKwKHN7VOdA5Ps
         MGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729574966; x=1730179766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CfWo8rEibeJNRR9ub5UZ9B73NL531yxGF3rC7/Vsvq4=;
        b=ezk/+IwlR/CwBKJp1R0jmkdWQJZBB//wHqiRo79Wwbw3havjLsnsnhWbZr4IZiGLQO
         lRR9KFtFdLO6PyuX0Nay104h6v2JOVfAkMzfhB6ccUY0Khzoks+zAqBV9YS3jNDWduWF
         x8OQL2lDxFWeVY3GUtg/Vtj8e5RlzXfpoC9I31mIGgygrvvYVVoQrVK8KDhFg8p0n+lP
         4+ZULhhBUGJvHTPmd+jmmD6+5TnjpUqTeVZ9zJp9szAiCjTCT0FiU4kXlLnwlowIueku
         kjGeicKR9Gs4fiKixrP29i5R4xJ+0tgCpWiyrUCsyvEyZ6I0+UObq+TQ45uDariNz+2z
         5jWw==
X-Forwarded-Encrypted: i=1; AJvYcCXv2mmKWi0oKzS7RTvpHzWARW0KVHJ1mGhIF7QkW8hVBtHXWD2yPU20FoqjGyq21i4dJs9rP1UW@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yza7yu7gK+hOEgj/cPcldQ9FwDOG02H1gIHDs3Ny0FwohOVVBkC
	XbDnMbcL5BsVq2x74+F8tg2U1s9VXl7RLLJmPX5V+nQnUuFJfg/p
X-Google-Smtp-Source: AGHT+IHlSAindglmOEfkhHefJWdKX6tckM7xeJFtoM8elMYSuAHZvTh7qrg+eUu3QgKsCOo0nkDWpw==
X-Received: by 2002:a05:6a00:1acd:b0:71e:74bf:6b1a with SMTP id d2e1a72fcca58-71ea32d4226mr20125338b3a.16.1729574965692;
        Mon, 21 Oct 2024 22:29:25 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec141505bsm3845846b3a.219.2024.10.21.22.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 22:29:25 -0700 (PDT)
From: baneric926@gmail.com
X-Google-Original-From: kcfeng0@nuvoton.com
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Subject: [PATCH v6 0/2] hwmon: Driver for Nuvoton NCT7363Y
Date: Tue, 22 Oct 2024 13:29:03 +0800
Message-Id: <20241022052905.4062682-1-kcfeng0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Wed, 23 Oct 2024 10:05:01 +1100
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

Changes since version 5:
- use lower case for inline function
- remove enum chips and refine code
- use regmap_read_bulk() to avoid the locks
- add fan speed low limit (register 0x6c, 0x6d) and alarm attributes
  (register 0x34, 0x35)
- add regmap caching capabilities
- fix "checkpatch --strict" report in FANIN_SEL
  - Macro argument reuse 'x' - possible side-effects

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
 drivers/hwmon/nct7363.c                       | 446 ++++++++++++++++++
 7 files changed, 566 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
 create mode 100644 Documentation/hwmon/nct7363.rst
 create mode 100644 drivers/hwmon/nct7363.c

-- 
2.34.1

