Return-Path: <openbmc+bounces-945-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96332C95520
	for <lists+openbmc@lfdr.de>; Sun, 30 Nov 2025 23:06:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dKLhl1xnXz2yvD;
	Mon, 01 Dec 2025 09:06:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::534"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764435514;
	cv=none; b=MfPs5BC3WTogsDz9pSFlCJlMvjbzZSDQP7T1C0bj0s53nrPMnX402SaxHY0cTpwLU4o9J8uhUtfkc4UCAOB1eBspqZp78gR3q4foiYLHjk6WVxBslRY6MmGfHsHKDdtznaEOu8n5S0RZTS/lsKsITZhKPOIzlmij4DjwnF8umoFIOUqTNb1dXWTkSBOSEYDJizE8BrAJQeGoWQi5DadOIn+r99rKDuau9VAjeifHvJBciN8elV5VHif6WMn3QcnA1mBpGhMCs7ZN789uF9v/OuDeTxZcPQOyGOSgQRom6VKYBKCWjHYhl/P8ob1qT1dByuHbvxjOxrpqjDQ9yB2hlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764435514; c=relaxed/relaxed;
	bh=hrGw+j15exTZMybruW35jjRgEf4ik1Id5jv8eW56WZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AVMXzkCPNuYVX9l5RmXb0WOO9+J6DphdIt58uSznt6+BSu1oWX4a4t9FXf3q7xtprXPHd+3s3z/06kzapkrzX09tIK9TNJ0mY5Pok8AfLgW0R+NCHqUveCTr+ZgIEq/KiS8oDqR4B0X+5861KMpBGvC47gOtKHvRt/Ht2F9LPPjzsul2Qxu/x5RAmnFtFSGfX42wTayiBoT8qJz5QI5QH5rR2EubUGQ92vOGpkaDP9Vuj4SqcMPaP/cIPrXDRey0aTFhuCTIfn2jwgwaPpOvGXNYjEJGlRBQ4z5B8a34LxKfQs48s6HC5OgP+8daZQ+X4qenOk8VHH5usogXxrUQDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=V/5rXvE8; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=V/5rXvE8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dJbw81FF7z2yvd
	for <openbmc@lists.ozlabs.org>; Sun, 30 Nov 2025 03:58:30 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-64162c04f90so5336852a12.0
        for <openbmc@lists.ozlabs.org>; Sat, 29 Nov 2025 08:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764435506; x=1765040306; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hrGw+j15exTZMybruW35jjRgEf4ik1Id5jv8eW56WZo=;
        b=V/5rXvE8bV68kGjsP2FvDBxgx252JXSJJ07zwo2tEJKt0zG87lmGT4b1iYYyX6S2MN
         YElKuAJvuXhOTVNjXKu0dlnd/FJU9fJk+/MB0U0cgaMlmkvmAy6pXQHd99U8vBGsAH25
         9uZ+fW3BG6C8Cql5iL3k9hmSnAN0fAVrh4japNMSArUA0AO7G+Uj80STdB2vvtArV89H
         wQacYq6LFrJQhxIf0kWE5h0DMyP+aeDvZj8UKAuya+Id2fwNgxST0fBoNYUdSH2eyGvf
         8CtFNf8DK/mqNIGQX8+NCko+PU2m+IGJe9MP5ISmQRWuTeDkPEUDL8QUgXsEfL/h/lRH
         cvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764435506; x=1765040306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrGw+j15exTZMybruW35jjRgEf4ik1Id5jv8eW56WZo=;
        b=tEEbsHi6OtW9jceoiCHr72h58wHZ7knwJI3cw0giMzZHcB30CEjVQktpqpebAVZdX8
         xGXd2jt/HGnniY3mJwFIVl01wECOdsEEf7Hee45Cqr3J1d4zr4ApxCkhQq+KaajEDHUp
         wGjyUoVHvg/ixwUAkfS2m5pOML5/3L6wXnzACHHAubuTROadML+6hwtsxbKgJwD7BnmN
         KqJFIAMBS0bjA6MO7wnnEGxoZ2RSwpclS+aAKAOR75z44DGtMpIebY/mm6xqLYncFpkn
         aCU2ZaA2t2ZUJ38rPupB+zhtL+zMCBwiXt797rMvl7IQTAfuMq42m98SGFYgSLDjPQmZ
         2yyw==
X-Forwarded-Encrypted: i=1; AJvYcCW4yK4V9LjZH3StvkLn3K/z6PdyAxh1H+Bm0D1SIfD5si0fRtZAqJqQedIFSmkG1NdFxRKYTXGO@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyIjlys58TZtXWGEk4BSoAWghd9EfU6AjqAszxIAhgTTMfVsWrk
	yI/ZqnlpUOPjQ0QK4YwhjR0/j6Y+fHh1yHMRU8Imkzgtlj9zuxXHGn+v5l94SLHsGc4=
X-Gm-Gg: ASbGncs21Yg3mpx0RiRH7UzYPpuT/UQ8bIVnRUkN6qvJM++NkkBzuOufqaBBiXMdRW1
	/BbqEifdJG+SwZXBVuJlDQPz20T4TrZbj+zLQuAPLR1V/UolmcD4/bzXCT6+/8AznXbJRKtHhrV
	vBqFZ+twhI8VdmuxNtohFb8J7KUymEMUD0ga3+P4nuG1DeW6Fscna0yrA4VM6ffKGGUuMGUZt2a
	PJJGkdw1kZEyD8ruzOgVD0+QhY8zunNE3JjsyFhb6I5pAfkA/CyaGRvd6MbnXlpcZaIhxH67yh/
	5ROvYNtY9VEt/X/BS/RElg7g/VS6K6CYa/+qjE0UFMUyAqvc4LoKhpmk6gSM49WBfjsruArSIpR
	6BreFgzG4ndzerHRz4nYNg/jqWc813/pe1zOyDXAavjCsuz3EjXBkcnerruaP+aj44YB2lKFjCy
	BnH/wKjq2ZCS/FT7zd
X-Google-Smtp-Source: AGHT+IFRiVsXHgKH32e2UUxbjoTC/2PC7We5ekSkNgMfKep0WFlMYzP0czf50nd3+3LacbL9BeDIfw==
X-Received: by 2002:a05:6402:4303:b0:641:8908:a558 with SMTP id 4fb4d7f45d1cf-64555ce53famr28532296a12.25.1764435506020;
        Sat, 29 Nov 2025 08:58:26 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-64751035b75sm7855980a12.20.2025.11.29.08.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:58:25 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Eddie James <eajames@linux.ibm.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Ninad Palsule <ninad@linux.ibm.com>,
	linux-fsi@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-spi@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 00/12] fsi: Convert to bus probe mechanism
Date: Sat, 29 Nov 2025 17:57:36 +0100
Message-ID: <cover.1764434226.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
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
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2312; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=bDsWyBR13GvWu/KmngbVucApNNubltw7ubiPWxdkZ7M=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpKyYDXD6ueszNupCnGqcfTiYcaAFXAHx2f88f8 GEAG9h+7qmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaSsmAwAKCRCPgPtYfRL+ TuhOB/92oKD93snOWUjZjmay296pHDljAXCv9DtM027PRml5LWq3M0af8Kj+NHrNziZTYi9OnLA x+vKqFlgI7y+IYai2tZ7WLp4FR4DMXt9Q0ryxJ2FRM5r5vinjrLG6cQLOuU4w5NSruILS1SLnKe rIt0fyaMEDaE4KQaOdgp2S3zrw/W9lmkrrLSICTHmsGi3KK5wzu/aEGbXqvHd1dG1O3Dmy46LDh E4RGQJEBIo/Buq637M3fDlh1uY2VYPplZM+hojib+vWBlOrz0UKDc8Nb7W+/4Ogii/3H818BwJ0 vSZmGJk+HIskyOhodyP0BkQpu0ygHrqTw2sR4VL9cn78vHRt
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello,

for the quest to drop .probe(), .remove() and .shutdown() from struct
device_driver, convert the fsi subsystem to make use of the respective
bus methods. Some cleanups are also included, I noticed those while
working on the conversion.

Regarding how to merge this series: There are two drivers touched that
are not in drivers/fsi, namely drivers/i2c/busses/i2c-fsi.c and
drivers/spi/spi-fsi.c. The easiest would be to merge this series through
a single tree because the i2c and spi driver changes depend on some fsi
core patches and fsi_bus_type can only made private when these are
applied. I tried to quickly resort the series to only need three steps
when merged separately, but this wasn't trivially possible, so I hope
Andi and Mark give their acks to merge their driver changes together
with the fsi core changes in one go.

Note this series is only compile tested as I don't have a machine using
the fsi subsystem. 

All the calls to get_device() I found in these drivers look a bit
suspicious and I think there are some issues with lifetime tracking. But
I didn't try to address these, so I'm just mentioning that here.

Best regards
Uwe

Uwe Kleine-König (12):
  fsi: Make use of module_fsi_driver()
  fsi: Assign driver's bus in fsi_driver_register()
  fsi: Provide thin wrappers around dev_[gs]et_data() for fsi devices
  i2c: fsi: Drop assigning fsi bus
  spi: fsi: Drop assigning fsi bus
  fsi: Make fsi_bus_type a private variable to the core
  fsi: Create bus specific probe and remove functions
  fsi: master: Convert to fsi bus probe mechanism
  fsi: sbefifo: Convert to fsi bus probe mechanism
  fsi: scom: Convert to fsi bus probe mechanism
  i2c: fsi: Convert to fsi bus probe mechanism
  spi: fsi: Convert to fsi bus probe mechanism

 drivers/fsi/fsi-core.c       | 107 ++++++++++++++++++++++++++---------
 drivers/fsi/fsi-master-hub.c |  17 +++---
 drivers/fsi/fsi-sbefifo.c    |  31 +++-------
 drivers/fsi/fsi-scom.c       |  30 +++-------
 drivers/fsi/i2cr-scom.c      |   1 -
 drivers/i2c/busses/i2c-fsi.c |  16 +++---
 drivers/spi/spi-fsi.c        |   7 +--
 include/linux/fsi.h          |  13 ++++-
 8 files changed, 125 insertions(+), 97 deletions(-)


base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.47.3


