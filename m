Return-Path: <openbmc+bounces-618-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 477DEB50F38
	for <lists+openbmc@lfdr.de>; Wed, 10 Sep 2025 09:26:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMC0Q0hZgz3cmV;
	Wed, 10 Sep 2025 17:25:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757489158;
	cv=none; b=GTEx6tV+h5RcEIVA2yLcXpM5fZMCn6KkLoxNS7oX1Hdf1af+GPgfzq5+1AjQ8Dzz7gjuk19VxYPRwFIsi/RpNwiAPDudsSYkbQsjIC6eRuk06668qnvSf/Tu3vvYzOjHyo+Uv+A6DLLOVDbFuHYBcM0tAi28HKMDkN/vaT5Va/agpilFXs0fyAqR6yQ0T4Z9mJUJjACuSda3Y0MV6Ts8xfA8HycJ377NfF5vrlQXkSKPEOiOqPjShp1IikMPTy6lnjZwMJ4oRrEJ/B50125HzH8rMmM8ihVAQD3VgzmJ01r5q93Er1yBE0E2b99JqM3gC95soAiMDLaUetQDn/cSXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757489158; c=relaxed/relaxed;
	bh=QAOVD/NXoo6Qinrlhcnn2ltKwFLoKauBP77YUEELpDE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XbUGaN3mrfwmW7ZiZlCF3bnlyEoHZ+LFdpvHGrctuA1tLHUk378jC7stO201OgcJBhLg8ljWAvrxnvBj1/lUlkB/j/wFozrcl1jyl8o9WpTCzv0L5EwJEUTledwgSgV9lIrSHHkWyvigGWmDCKGNgNBgDZgRfLX5perFShZLAD32onQLt2L1HpO+PwlJCkowDYQWiQ7vMOCGgQrHbF66P5IvK9tLwmmBLc6ZC7HIVG6ZVq4F+cRwx6iMBQzIyu1uNAA+H2i58Bzf8JP1ZbIpwosRVaaQRr9a3z2uEdUK/Cm9QtqiBtKVDuDsVIW9qOpXZAGYcEzdHgnTG5TL4dTlqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=1eVfJutu; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=1eVfJutu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMC0M74bvz3cll
	for <openbmc@lists.ozlabs.org>; Wed, 10 Sep 2025 17:25:54 +1000 (AEST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45dec601cd3so19122845e9.2
        for <openbmc@lists.ozlabs.org>; Wed, 10 Sep 2025 00:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757489151; x=1758093951; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QAOVD/NXoo6Qinrlhcnn2ltKwFLoKauBP77YUEELpDE=;
        b=1eVfJutuqYYSVEN4+WOY59IHtw8j/abQtCsR69PMuSVKFFnDuQZHqXhHQBxY+u9o+0
         l9qT8vTRnKzDp066bSErHHD9aSDMk4uPtyAK3nv0jZaYzGJHv+hiqNyJZMjLAY+wFPiT
         w2Qg7IN/7XT3fb8ZBlAEvZH2OBVkX8euQjX8JFuiP6KvbGANTG8zEWmx+NIMaM2TkZN0
         jwBs/bS7PJWU7M7gI3LuZzUYgm4NY8MOWPCxabHWUfj4v3MwD0w2CVqjVOWyAasxg14W
         rILOulJnpvRIj4NofXrC4pnnBnMM+kthJc50IKwUcDVjhjLlWjRNt2lzEa4qB3oj39N7
         CeKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757489151; x=1758093951;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAOVD/NXoo6Qinrlhcnn2ltKwFLoKauBP77YUEELpDE=;
        b=VksCk5t7Z1j6TSWetO9TRcaujED5xLEEawAm4h437ajnN62t7AgC+0YPo4fgCrLeLh
         gsyjjskzkpv/5qMftwW/BJ3eSWj1OJHnFqeOMjUIua8KUHEOkkshfAnU0SxnoOJteWs9
         FvXCk2yGv2g0g1extn/znlnokYV8XfMFKQJ9FKg5ikhDT1cXzgku0kBW/GsfzSeagszg
         jHWrJOE0PH3eVKW1LkILfqrB0bxZY6ih33S9BzfPECAHJe6dg13oKw9A+eSzEIG2IJEB
         NSNWO5NkmGfOFSnsOqGu86zhojiBr6ZXro/0DGMS7wrsmauAsZI15eH+5UuvIFS3wukr
         cxcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWSr/BHljSp1GN/BQkczssrCpJuok1KjhYn0CPGcmzkUvKMPMOxkhBEpaBn3hluXN9e+g5s3yE@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwbCwXCJHjMMU+t7VaNqskEBjXAeg5nwEU7jJGAIq1EU5CHF+Ik
	gK/shbxcBaLJFnwS+A25ungnI3d97RpomdSrLVcPP3sRx6KjHa1F1IupoHT7aRz+4pg=
X-Gm-Gg: ASbGnctwxa3fo+33R5FbUv4k5fJWieessXzTrxOXv5wwylVNu/CrAbo4/16NClNkTBf
	DIC91jFgOPKWjzTIjN9ISAMi5NMO1Zsujm3ExXsIW9wQDC72y1V1ya1lpJOW0gu0YuzQ3dRgare
	miu6O+d/g6+l0FYTkmWVjZphF6sTgvtb1csxNslLtmcK9znPqXIQItaetAHy4ySi3MbXSFM/2JK
	FSyQ7urd7T+iDhJ8Cluxf3dBE8sUv+frk731Tkc+xPh0GFfqi4JFwTuc2kehaTR1LWG8UShNehV
	x1ewmpqC8gl+zOSYFGVQu0PlkELBnrczCpyZGlTeamUyTU9AgaXAfS4PU+Sq1BHmTuQ3hhPQOeU
	uuDJfbKh4nw8oolRJvzmtu2qOtxhp
X-Google-Smtp-Source: AGHT+IHGcMRUmLBYK4SgC+8FxVXfL1XsZk92Y0HumCVsdD0bP05sNhcUQfhnESNzNcG8GqNwFSRO+g==
X-Received: by 2002:a05:600c:1393:b0:45b:7b00:c129 with SMTP id 5b1f17b1804b1-45dddf021a4mr111254435e9.35.1757489150984;
        Wed, 10 Sep 2025 00:25:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8236428sm16729825e9.24.2025.09.10.00.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:25:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/3] gpio/pinctrl/mfd: use more common syntax for compound
 literals
Date: Wed, 10 Sep 2025 09:25:44 +0200
Message-Id: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPgnwWgC/x3NTQrCMBBA4auUWTuQ/kiJVxEX03Ssg8mkTKoUS
 u9ucPlt3jugsAkXuDUHGH+lSNaK9tJAeJEujDJXQ+e6q/POY6I3Y8hpzR+dMcrGRrGgZksUkRY
 SxbZ3Yx/COEx+gFpajZ+y/y/3x3n+AJ5+BqB1AAAA
X-Change-ID: 20250909-make-compound-literals-normal-again-13073cc74b94
To: Lee Jones <lee@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, 
 Hoan Tran <hoan@os.amperecomputing.com>, Yang Shen <shenyang39@huawei.com>, 
 Imre Kaloz <kaloz@openwrt.org>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev, 
 linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2536;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=mbaKzHcgj41PgNucTuXNTRRDYpWfb/AcMMrNDA/c0O8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSf8fAuHxdMgXnxNQ6BJ55Q2hyWr1ftxMskiL
 dcle+ZX0s+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEn/AAKCRARpy6gFHHX
 cr6ND/99HqQnU9BaJ0rG9nmyHWz9UVNShxsHcidnTQYDpvGwd2PHnJcJdwpjGZC1msq3r+GB/ga
 /zA5bR2ZsRzfO/XKfM2IjjN6BaSGRl3qj9qX5cxH5gT86+KMQWrzjOYsJhcIldkm+B/vxqqMHom
 MFHfiq0n0NhdzWqe4O3C1X7fVIpRgGSXVSYfka6cg3On8jzmA6PyhkaYa706xoCHPHckqJaKRk1
 P+NLmTJxoupn2H21plGDEESji9GS0g3dXUS7H/uHSv5ILsR67EA6A21k4utyvCfQNrL/27uhiSm
 hxO4JygFgiZBOLGyX7WXgmTyFKtFZ9mnl5Y10vpz7itfuPUJWQk0GJ594d7f3ZIDJqZueax0J1e
 Z9CFk6U3ZT1jZ/oMIJAydNph0r1xH5OHAbczLcvLOoR5GkxxP5NePvsyr7k0t2+6Xw2Nukz4n05
 aQ1qzE7sNjWX4cxaqeRfInnYZHQy89Qf+mTyJKVrx3MAz+sXZHhtN5Q74xMDTydQMOhKX/iaZic
 YfBgTRRt9OWEIaiGrlyxYGj1whz5lTrSdziP3ZNQQRyBqFA1bYzMOGHlTHK2/1DSVLM6EOMheNZ
 QVH65EM200UB4DiHwbgDAcSSaAhQ2UUoYc/mi5fX28HetdMG3CdC40i4ZKPvnCNmCf7Ld3NAZoi
 Tx4rK9U0Rc28ZCA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

As discussed[1] with Andy: it's probably better to use a more common
syntax for compound literals so fix the commits that converted GPIO
chips to using the new generic GPIO chip API and make them explicitly
spell out the type they're initializing.

Each commit in this series can go directly into its respective tree:
MFD, pinctrl and GPIO.

[1] https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (3):
      mfd: vexpress-sysreg: use more common syntax for compound literals
      pinctrl: use more common syntax for compound literals
      gpio: use more common syntax for compound literals

 drivers/gpio/gpio-amdpt.c                 | 2 +-
 drivers/gpio/gpio-blzp1600.c              | 2 +-
 drivers/gpio/gpio-dwapb.c                 | 2 +-
 drivers/gpio/gpio-ep93xx.c                | 2 +-
 drivers/gpio/gpio-ftgpio010.c             | 2 +-
 drivers/gpio/gpio-ge.c                    | 2 +-
 drivers/gpio/gpio-grgpio.c                | 2 +-
 drivers/gpio/gpio-hisi.c                  | 2 +-
 drivers/gpio/gpio-idt3243x.c              | 2 +-
 drivers/gpio/gpio-ixp4xx.c                | 2 +-
 drivers/gpio/gpio-loongson-64bit.c        | 2 +-
 drivers/gpio/gpio-mlxbf.c                 | 2 +-
 drivers/gpio/gpio-mlxbf2.c                | 2 +-
 drivers/gpio/gpio-mlxbf3.c                | 2 +-
 drivers/gpio/gpio-mpc8xxx.c               | 2 +-
 drivers/gpio/gpio-mxs.c                   | 2 +-
 drivers/gpio/gpio-rda.c                   | 2 +-
 drivers/gpio/gpio-realtek-otto.c          | 2 +-
 drivers/gpio/gpio-tb10x.c                 | 2 +-
 drivers/gpio/gpio-ts4800.c                | 2 +-
 drivers/gpio/gpio-vf610.c                 | 2 +-
 drivers/gpio/gpio-visconti.c              | 2 +-
 drivers/gpio/gpio-xgene-sb.c              | 2 +-
 drivers/gpio/gpio-xgs-iproc.c             | 2 +-
 drivers/mfd/vexpress-sysreg.c             | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 2 +-
 drivers/pinctrl/pinctrl-equilibrium.c     | 2 +-
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c | 2 +-
 30 files changed, 30 insertions(+), 30 deletions(-)
---
base-commit: 65dd046ef55861190ecde44c6d9fcde54b9fb77d
change-id: 20250909-make-compound-literals-normal-again-13073cc74b94

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


