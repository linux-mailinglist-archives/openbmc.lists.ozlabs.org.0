Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E57042B8839
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 00:14:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbzCB1PdZzDqBY
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 10:13:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rEThL2sa; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cbz6W6KtmzDq7h
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 10:09:54 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id r18so2411433pgu.6
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2020 15:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=BFitlouLqV5WjAV4yis+SNy1ksEBkbSXVdeVWFMxCgQ=;
 b=rEThL2sa7EQ5kIQx32rvLbR/kFdz1zobSEUYn4oWYiSZ4fA73aYTdSOu4tSDHYJoMm
 T600ICRuLEf/w3lxxqIF8O2/k2boZvhWmlWC8MX+OBnC/RnG8giTFafP7Q+YW95HAbqV
 Zh+cqbqUeMs9FLz1SCwfZ4jD7b8lcgyEUlUgelSgw0eBLuSLueMKtyoE7G/YpKRS4p/y
 tB11JM1yp8XTNVQsAkHU/bDEB40dw6FVx2yrsvm+KlQcVnEEr2pBhz6MbkycbDgakMmb
 1jRj1sawhQ1dr3AWU9pmAdj7W9EmlaN+HWUnWEr7nC2hAOAjAYabbl9r5HrGC59WJztp
 wUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BFitlouLqV5WjAV4yis+SNy1ksEBkbSXVdeVWFMxCgQ=;
 b=f5C2YPLjhanopHPa2OFbvIVPE56TQj1L2JkAUlpTgEtcBKDJdhmlHlkKmd+g5YT0Xi
 Ap7n7dz4GjNvu9S5Xp4jqdw6WAUNySd1ZdbhiRQlA2GWBQplc5SCXgA7SGVfoOgMnnh+
 MR1sgw0TaHomQAH64f1SH1k/KMLlcDpR3ZDEU/uM2+Bu3U8u1NIZWqP7kHWwe0v3aUi7
 n+X0aAuzoyYxA9JbokI4+bahMska5aVxa3BwOi9ar+u9myA/MS915l8h7ijpK3IDBLBL
 oDcOvidoPtxomMZBjno9P0KspQqpwG9KdN6KnUoiusp1j5SLTl+KJw5lfS97RN7ofZcc
 c02Q==
X-Gm-Message-State: AOAM532AW1QhhlLi4M8b7gQZQGoaVqv8k93uNerGpSqJeuSc0CcSt223
 54XEmc/bxOVrkTnxnhG21To=
X-Google-Smtp-Source: ABdhPJzuBMVJyfNRuwEIiXq+MUjq865yCE7VpOiJ98dctqAKDL1P+66d8xBL1pFHeAegwr/cCe+HPw==
X-Received: by 2002:a63:4513:: with SMTP id s19mr10194192pga.254.1605740990817; 
 Wed, 18 Nov 2020 15:09:50 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id b21sm2565304pji.24.2020.11.18.15.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 15:09:50 -0800 (PST)
From: rentao.bupt@gmail.com
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org, openbmc@lists.ozlabs.org,
 taoren@fb.com, mikechoi@fb.com
Subject: [PATCH v2 0/2] hwmon: (max127) Add Maxim MAX127 hardware monitoring
Date: Wed, 18 Nov 2020 15:09:27 -0800
Message-Id: <20201118230929.18147-1-rentao.bupt@gmail.com>
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
 drivers/hwmon/max127.c         | 346 +++++++++++++++++++++++++++++++++
 5 files changed, 402 insertions(+)
 create mode 100644 Documentation/hwmon/max127.rst
 create mode 100644 drivers/hwmon/max127.c

-- 
2.17.1

