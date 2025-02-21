Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD3CA41232
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 00:19:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1KYp6GRmz3c72
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 10:18:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740128979;
	cv=none; b=TlgDBatS6o06iBqVEy7rjmefub3fllcWVuSNEiCCqs9XzR5uK7juj5HH2+RE5I6Y6xx/trLHmyCPKAc1eKZ2ReVACgCilHFq+/2t4TcLYtfiLIJFLkZE5zqyg0KsIIBzF9sVaH8Wdx2gPfiMk66obPr1YfDwpVcmwVePlGSjpfjk0EIeFxAmzBadoI2t2jHMRvZNCxOi1L/S2smhCf2QWIwloIu7EkSd2g0WEeJrYIuiYIm1czHHLMUkLMpH4T0Pq98F/UxUmwqW8ySE46fih0cAd5EDMTk2/qFDHoHEP7JEKNVB0f81x5aCdPCdzVKDxRdDNhhQcG+41C7cFEXG8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740128979; c=relaxed/relaxed;
	bh=OqGbA/0NwGgtEVAy7QTjo1baSDqwWc407TkYNX6+Pac=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oaIYMhQ88oWNbupxNMSzP/bVKaHIGsknorSqOAeONBZD6kKCri/uysJb9BVc4eJrG7/NOhXGBi9jsxVgf+/var8U+ELlAQixCqBfeZKC7iq6gQlf+La7Y3ZDWUyWVnbq8ysRq2Cuw2FDvAW8KgLUHnmS50CMzEzCRzwkoNHX2QQpTzwYSAvNvBirjJ85cBzdZ6UVPltu+vaf1Za0IVDHkqlo84OWOpLscWIDnwN4mNSlWdyU23qqpHWkC/Cb2q7r54LV6Qptl2NV7i3k/3d4tLNiWnpvZ/ggblDJrt9gSRuLa9wp++sQObJDCT6MjaplshsapErcla7QrFh2A6Tk6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hBkBpdUZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hBkBpdUZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yzkpp05YHz2yVD
	for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2025 20:09:36 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-221206dbd7eso36358045ad.2
        for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2025 01:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740128974; x=1740733774; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OqGbA/0NwGgtEVAy7QTjo1baSDqwWc407TkYNX6+Pac=;
        b=hBkBpdUZNNxIEy4Y2igyR8qcwc+aA7aZ6vN/f/do42wYBCNtoLIHVZzms0cT4hFaPA
         qGny9wzryNtDku00v94rCgt9fEM1d+hIkBYVwtXUhaMfst7ehT7LVsU+UtLx40VvOyeU
         hU2CQzZwvZrH0W2dSvcwvEUI9O99QZLGvjI42sSFmGqjsSAie6r0tXOVq8KjjOFYnRl2
         ycaDxpsAeuy+zeFR1N78Xt0zoCs9x8Z0iewbMdGglOON8GFRH59i4hVuiaDqeAON9Vvc
         TyRr1RVvuwsSU7rtmta00VZDgzpb/iBvNo6QU8c8jya8jVOllQ/EumVyGLymvz2l7+vR
         AP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740128974; x=1740733774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OqGbA/0NwGgtEVAy7QTjo1baSDqwWc407TkYNX6+Pac=;
        b=aHXYIujUjD2LJxiRMhAeSdsDKWy8Ew6Y7FK2OEhs9DLTVrmH1RsS6hgz8TherU90NF
         JGLByD7VPFM76lmdEdt7MsaMEQ6MMxBje6b/ZlSTY68YGLrmImey2ODEN54gCi02WLCs
         TEQMeafL6liA4nAyrZdfB5fTuHoTZQOgTOAi4FjwyTElDsQMBixptrTFAUTAQ7nltbMF
         tjphYdRO1kcX2OJL2vpVfNSULxgnOWg0J+fkg67QiK5UPPcPqQEUB328qEN45c1dgxfZ
         kMNeHUsG0io4DoCsmp8OgiA29XLtnei4bm2J1sYMH2NyQHUGSXKsB5ojQByFY3a9/qAr
         LuFA==
X-Gm-Message-State: AOJu0YyPQSIyxelJ8DOu1EgY0OH56//zDWCL8ptcI4RwbHl0EUJzqECt
	5yf1c1aDSX8VU+c8npzBnkQbv+LpXU4ZswzzY5ZbOqS72pDv4gua
X-Gm-Gg: ASbGnct8AdEsPJuU07nA4VnlGB47D9hYgfIeriIBg9AnlCYc9jcgKxmvjpHfd9666xG
	SpwF00HVGKW3DnhgWbOnE0SjOk9TJNP++QXEqwC8lAEPZeMkYuMXvqf1NVIPOgQJn4m5VQGN2XY
	si10Tgp9ZDB2vQi3kWhfPiuQNB3noo9Top+YdOXZJEyMjxJdEqlAqQCReqDT1u5626N+ieIJpJh
	sHgp6oLy8uRnW5TTn922ArZheXtFQRwiX9e60aOLo3w6NpKRr13DTzN/dt2Xzcjmc7k5w8R/C0C
	CKCdI4p/4rf+GIdJw4sNDme/Uj6Ki/8ZXq+wJirHc++h0lWEx/a5dhN3xA==
X-Google-Smtp-Source: AGHT+IHue6t9hMQwjssNM5DwX9cqnd0OR3VV+CKpdu46s9JYRLX9JgSKZHuMCZkMnCgJsmhoePwtPg==
X-Received: by 2002:a17:903:32d0:b0:216:2bd7:1c2f with SMTP id d9443c01a7336-2219ff4e7f2mr33490245ad.18.1740128974428;
        Fri, 21 Feb 2025 01:09:34 -0800 (PST)
Received: from openbmc.. (211-23-34-211.hinet-ip.hinet.net. [211.23.34.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5367e8csm133593115ad.67.2025.02.21.01.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 01:09:33 -0800 (PST)
From: Eason Yang <j2anfernee@gmail.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	javier.carrasco.cruz@gmail.com,
	andriy.shevchenko@linux.intel.com,
	gstols@baylibre.com,
	olivier.moysan@foss.st.com,
	mitrutzceclan@gmail.com,
	tgamblin@baylibre.com,
	matteomartelli3@gmail.com,
	marcelo.schmitt@analog.com,
	alisadariana@gmail.com,
	joao.goncalves@toradex.com,
	thomas.bonnefille@bootlin.com,
	ramona.nechita@analog.com,
	herve.codina@bootlin.com,
	chanh@os.amperecomputing.com,
	KWLIU@nuvoton.com,
	yhyang2@nuvoton.com
Subject: [PATCH v4 0/2] iio: adc: add Nuvoton NCT7201 ADC driver
Date: Fri, 21 Feb 2025 17:09:16 +0800
Message-Id: <20250221090918.1487689-1-j2anfernee@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 24 Feb 2025 10:18:50 +1100
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
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Eason Yang <j2anfernee@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Change since version 4:
 - Fix comments
 - Add interrupts and reset-gpios to the DT example
 - Use the FIELD_PREP and FIELD_GET
 - Add use_single_write in regmap_config
 - Use regmap_access_table

Change since version 3:
 - Fix comments
 - Don't put nct720"x" in the name, just call it nct7201
 - Remove differential inputs until conversions are finished
 - Add NCT7201_ prefix in all macros and avoid the tables
 - Correct event threshold values in raw units
 - Add with and without interrupt callback function to have the event
   config part and one that doesn't
 - Remove print an error message if regmap_wirte failed case

Change since version 2:
 - Remvoe read-vin-data-size property, default use read word vin data
 - Use regmap instead of i2c smbus API
 - IIO should be IIO_CHAN_INFO_RAW and _SCALE not _PROCESSED
 - Use dev_xxx_probe in probe function and dev_xxx in other functions
 - Use devm_iio_device_register replace of iio_device_register
 - Use guard(mutex) replace of mutex_lock
 - Use get_unaligned_le16 conversion API

Changes since version 1:
 - Add new property in iio:adc binding document
 - Add new driver for Nuvoton NCT720x driver

Eason Yang (2):
  dt-bindings: iio: adc: add NCT7201 ADCs
  iio: adc: add support for Nuvoton NCT7201

 .../bindings/iio/adc/nuvoton,nct7201.yaml     |  57 ++
 MAINTAINERS                                   |   2 +
 drivers/iio/adc/Kconfig                       |  11 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/nct7201.c                     | 487 ++++++++++++++++++
 5 files changed, 558 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml
 create mode 100644 drivers/iio/adc/nct7201.c

-- 
2.34.1

