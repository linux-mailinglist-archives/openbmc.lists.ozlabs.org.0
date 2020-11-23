Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B032C1363
	for <lists+openbmc@lfdr.de>; Mon, 23 Nov 2020 19:59:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CfxKD4HFqzDq7j
	for <lists+openbmc@lfdr.de>; Tue, 24 Nov 2020 05:59:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GLFNY28Q; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CfxGc1KJ4zDqM9
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2020 05:57:10 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id w6so15801785pfu.1
 for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2020 10:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=j8DrTZx50dfWcJ3HdYDTj28Ki4m8/rGZEAkHVx4GPcI=;
 b=GLFNY28QOhDWgWfdA4krrvDFXzebAMce8l7VkkX/RfMABs3v6e6fphLKRlW6y75RMF
 8lQcQdW5NtKaSJt3klPDKcCVeD73FU3Y60Jcw66d1R2di6rxkUwUVsk5vK+sRl+OhEu6
 Z80KQNyAhQJ/aY2i0p7mqw1SmxlcGz45Rg1T9vyc0pjvrOn4ahdTPemOiwzLyg6qNeaR
 AQ+6ViWenSiIRGWsQOzEHPnDws2Xm8VnHDv+sLA7HszOE9sTkJwdicynNV1PSu3bYC6d
 oc3xb2cSPOpxmJ7v8E8IU5CxNVG6ToZN6fUNiRPZJXUdiXrO68oW/NmQwsw/ZIUktVoO
 ZNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=j8DrTZx50dfWcJ3HdYDTj28Ki4m8/rGZEAkHVx4GPcI=;
 b=PXM1t/KUsFJTh1cyiOptrk1VITwX/wpjHRHonctL4pKvzYD/vxRcDgskGfkuhBWMly
 kWAB1PRQDokSAaMS6q8kGaasI7mV6/ot5/h4JpOsquz4Wz9XV4PcGVvzmZxKtMTxwB4i
 4jnwq1erRuYy22nHarJVPfUeORA/4t7E0flXojYServsT7Wr+QPEdCGT7X5NoLsVtUmB
 7IMsTER0iM8yInkeSrefUyQnU/4LSjTDI6I0fqTt8NUkoQlnDwCQTZbH50K91UACHN9B
 oiV9olTyNe1zfotJg00YstvghYAxQOwU16mvdJjEwY9U1KBYEPNvue2zelS5rfgsAldO
 r6PA==
X-Gm-Message-State: AOAM530rzrJvPeDgK54Utt/7ajoAe6HKgVwrF8rQ3zQa7/otWRpU5fV0
 95e94ZoUVl8qi3YnZqvTsOM=
X-Google-Smtp-Source: ABdhPJzzgZ47l2kSeApwFla3sxg6zVPHHzgCdPGILw+FrgqzFUwOWeF1xGZyJRySfGle27e7Yyyqug==
X-Received: by 2002:a17:90a:5901:: with SMTP id k1mr326240pji.7.1606157827142; 
 Mon, 23 Nov 2020 10:57:07 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id w15sm11043098pgi.20.2020.11.23.10.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 10:57:06 -0800 (PST)
From: rentao.bupt@gmail.com
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, taoren@fb.com, mikechoi@fb.com
Subject: [PATCH v5 0/2] hwmon: (max127) Add Maxim MAX127 hardware monitoring
Date: Mon, 23 Nov 2020 10:56:56 -0800
Message-Id: <20201123185658.7632-1-rentao.bupt@gmail.com>
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

The patch series adds hardware monitoring driver for the Maxim MAX127
chip.

Patch #1 adds the max127 hardware monitoring driver, and patch #2 adds
documentation for the driver.

Tao Ren (2):
  hwmon: (max127) Add Maxim MAX127 hardware monitoring driver
  docs: hwmon: Document max127 driver

 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/max127.rst |  45 +++++
 drivers/hwmon/Kconfig          |   9 +
 drivers/hwmon/Makefile         |   1 +
 drivers/hwmon/max127.c         | 352 +++++++++++++++++++++++++++++++++
 5 files changed, 408 insertions(+)
 create mode 100644 Documentation/hwmon/max127.rst
 create mode 100644 drivers/hwmon/max127.c

-- 
2.17.1

