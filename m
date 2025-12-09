Return-Path: <openbmc+bounces-1027-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D41C7CBC3DD
	for <lists+openbmc@lfdr.de>; Mon, 15 Dec 2025 03:16:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dV3Zg5f5Yz2yFw;
	Mon, 15 Dec 2025 13:16:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765280451;
	cv=none; b=LG5c47E2WWsml6reVjRDW8YpbDdmoJ9IJvNVa8VVMMolOu7e1FJTrelfCn+smzhH6jZEyXmy/V585TSIzYceFVkX3Wrp6mEzvzKAR+KAF6GKoSxPkqOncmXDVz4SQjUvapu15lJfJ6ORe/8bfoEpKJQXvPJn4fDT+Ti2DBmLFcRi8EebjJh25JydiaZfGpyNXeQQGPK2tt0zEY3B1GyluG/5dlt1aCdVKtGdn/1XwnGdAMOLuwH+XfNpTTHGOTWQtZ2+xSE3xCn8rvAniY1H1wyqgwrESDRfoMh8NexRKBGH5D+kjfVGgPGbNQRk0vsluP4WxEj8wmgb6PzAmX9F8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765280451; c=relaxed/relaxed;
	bh=1kAxf62pTzqbfwbdvgj6hwDy/PkytkFXzpMaFpR82LU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iMI53f8QCJtHfS9VMy0AeYLohAJEqvl2fULF/1aKrtg7atT40nVgTAaGQ8K4TK/PiNfAjV3J42wHUc3Te/uB7PgmTCMg3NL9MfxAeAByC+911KVOPrDcevaDie0ZTxalT54n2uwK2Ck8HFWvAhcEowg4K0bV6Una8h3+tUr33zw5xnJlOh1Zt3UfsAHdaaYwtwcbkDzxsgCBzULixdGuHt70Z+eB2bFRsKJPHqg3B4Wsirir1Qw6OGIFtbSNt5iS6nwiRM7UT79vBRPj3SEVFvHJZd7WFBA2MLVmv97VaImXv6/50GUSxuJWQcCCXJi5JqI9n6hu4YAESs2U17a5ZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=WT00ALe7; dkim-atps=neutral; spf=pass (client-ip=209.85.221.42; helo=mail-wr1-f42.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=WT00ALe7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=209.85.221.42; helo=mail-wr1-f42.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQcNx4MS5z2xDM
	for <openbmc@lists.ozlabs.org>; Tue, 09 Dec 2025 22:40:47 +1100 (AEDT)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42e2e671521so3527828f8f.1
        for <openbmc@lists.ozlabs.org>; Tue, 09 Dec 2025 03:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765280384; x=1765885184; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1kAxf62pTzqbfwbdvgj6hwDy/PkytkFXzpMaFpR82LU=;
        b=WT00ALe7kGYd09ei0G6J057nLd/fVIDfpgf5IPgVw15bKjCafle7dIWjNqlo5L5GU4
         gpLtpphkAAPhx1DCQppVenfCk2evSGgBGgqNIpygC51o4JXsUFUmBwe7b1sDdhF5+cj4
         p+BWMg0YJvdmaJUY+RAheUmfu+NVvmyCXBfi9OLIhKMBpvI7iE2wCN/XQeq0RZvgDzs9
         Rb7P7ScTzVjZex0lh7MHi5wOgMEJR9K1FS4G2rU2orIWyDYEa1y1mn17oip7w0R31YsP
         SHyHbNV//OaZugTD+yZNWAZPykfhpySKZYNLEA3xueGWRUgW1O3A0rRQW6YTyYu76UZa
         XFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765280384; x=1765885184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kAxf62pTzqbfwbdvgj6hwDy/PkytkFXzpMaFpR82LU=;
        b=oTijp3ezYHpvTqtVokZaBrfFAG3ZgoHCPAUO11D9clGS0oiqRRyx6kxs1orGjAX3F9
         VXSD1dM/H3TrI+yWI+EHSRqrr0SV/VPF73F5pqSwu2qLIQwgdChvcvSn2NfZra77S/UZ
         X2355QP06LkB4z9gt9jnVzhPLPpeBNPRjymGBto9uiV0h1qupYF2TQyY8yjw3YP/RFrK
         TWY1JnDRqgrNXeHPKR6s8b7vY2mFy+t7vwvXBECl6CIKR0AylZZHprfcPxwhXvkE4pu3
         QS4fFQhegNR2N5zU0cRzMfXCqUfAlrQE+t/tM4re+SQ1SydYVDcReIZE+cj41Kw7lquV
         fLdA==
X-Forwarded-Encrypted: i=1; AJvYcCXMVFnoKjNvkHz4w2WKzmlqhpshK15bNuswMchUyeZp0QCy5rL+2l9cx/7rWJCJHM8ZAtd3bLOq@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz2ptyQr5r+P/v1KOPgzBf4l+32nCAn8gBLFAqdsx1mHkZQRgdK
	Al5g1rIDv8IJqqCj1zKKYUQ5rjyx6OC0zr6xXOjd+lPehYVK8qsQlHxn6l6kixL3aX4=
X-Gm-Gg: ASbGnctYdmwxcSKpzZb6vZc/wjHKcOUUHXQeoYogORVRjjJegx6IeYj+ekrzQhDRaZa
	w8h3jF3ZmSTSCxyKQHdt4Yr4ZI/OUnhD7yNAfLXaiB45+kBZyKL2H3E23NSXL8h5B3vZ4BrBu0R
	cSrik8lztLlYcLlDa3fkMKIcmeqRC6SxK0kEDO5k14CL4ft23J5q3OHhgxlUI8NP/A663pwUA8p
	X+HbobXTFj8YhGoOQizBG/EZkyDdVphUleqTj5H58DrP/Kd6cdf4GYT8A0ORblV3ynVh6C1Xbsd
	VWy+UQkl4LlUrmIj/BKN8EiCFDrVgg4pvB21mPo6kauZwxu1kjDqeepUI5emXQWRHBnM8mOOAJE
	ub/m0AK2eYHrqZTRkYWJzy4X7KeXdXUxzUZZB90dEH/4elFwjrgedpwhxbhql0XjA+RalZScGo7
	zLKtiTRD5S5CxcRwtvBmjdhVqfN2bK2ihAsTv1kv3d6UcvoZpUdtsq5vOEtnKP0RNrJrWZdvd/S
	gQ=
X-Google-Smtp-Source: AGHT+IHnbJN5CAFOHl5yIC3D6z+x4gkBmfIyYRljTQYBs6sfSX1MkzPOFaqjTYXMTXlpBp3XAwZ3BA==
X-Received: by 2002:a05:6000:2f86:b0:429:d3e9:65b with SMTP id ffacd0b85a97d-42f89f5a0a3mr10300630f8f.59.1765280384112;
        Tue, 09 Dec 2025 03:39:44 -0800 (PST)
Received: from localhost (p200300f65f00660846b2ba6e435ad603.dip0.t-ipconnect.de. [2003:f6:5f00:6608:46b2:ba6e:435a:d603])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42f7cbe8f85sm32187164f8f.5.2025.12.09.03.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 03:39:43 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Eddie James <eajames@linux.ibm.com>
Cc: Ninad Palsule <ninad@linux.ibm.com>,
	linux-fsi@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org
Subject: [PATCH v2 00/13] fsi: Convert to bus probe mechanism
Date: Tue,  9 Dec 2025 12:39:28 +0100
Message-ID: <cover.1765279318.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2269; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=hneWfReMr8JUZ1RklsZR8PUJmQmGKj9ACT99gfEf4y4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOAp1/pPT+rAixB2bFh3BY3cheK5rmw3oJz+wj At/GyBqPtaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTgKdQAKCRCPgPtYfRL+ TmC1B/wM/YYo1TOXcEiWASOH6rlKw1tqh7zLAdLMks0AAotRQ++yOzy7G3OUvsr9TSgMiW1hMKg F/mQFh1kQ8I2HZe/9kcbOQtfJzQAyzeV+5rw9coxJh6ZFz2d++TnC2GavExLMDOrXDC/K+p/P+Y U0Gh1Dqr51UUoKX37Q14sYSjYQ2UxbCnhcVdcXo5VUwKsfY2qx5zCVJ5z/3jaqYJ3Trcm5t3MyJ vssC4Wek3oeAJlvx+5PlnVF9DkdcbuAoy+zdk3SbvNOUrO44jWMlPmYnFzoMAkCGHeK83pkl9Ds fZPP79ug44bkn97cLjAqtNC8ErsUcC89a9dU+FwXglLUHC87
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello,

this is the 2nd installment of the series converting the fsi bus to use
bus methods for .probe and .remove. The changes since the first
iteration---that can be found at
https://lore.kernel.org/lkml/cover.1764434226.git.ukleinek@kernel.org/
--- are:

 - (trivially) rebase to v6.18
 - add tags by Andi (for the i2c parts) and Mark Brown (for the spi
   parts)
 - Add a patch converting drivers/fsi/i2cr-scom.c (#8)

In the earlier thread I thought I made a mistake for (implicit) v1, but
I confused fsi with fsl and the problem doesn't apply here as it doesn't
touch the shutdown callback.

This series is not urgent, but it would be great to get this into
v6.19-rc1.  With Mark's Acks and Andi's tags (though they are not an
Ack) this should be fine to be picked up in one go by Eddie.

As before there are two commit refs that should refer to the commit for
patch #2 ("fsi: Assign driver's bus in fsi_driver_register()"). As I
cannot know the commit hash yet, I wrote "FIXME" and these need updating
when the series is picked up.

Thanks
Uwe

Uwe Kleine-König (13):
  fsi: Make use of module_fsi_driver()
  fsi: Assign driver's bus in fsi_driver_register()
  fsi: Provide thin wrappers around dev_[gs]et_data() for fsi devices
  i2c: fsi: Drop assigning fsi bus
  spi: fsi: Drop assigning fsi bus
  fsi: Make fsi_bus_type a private variable to the core
  fsi: Create bus specific probe and remove functions
  fsi: i2cr-scom: Convert to fsi bus probe mechanism
  fsi: master: Convert to fsi bus probe mechanism
  fsi: sbefifo: Convert to fsi bus probe mechanism
  fsi: scom: Convert to fsi bus probe mechanism
  i2c: fsi: Convert to fsi bus probe mechanism
  spi: fsi: Convert to fsi bus probe mechanism

 drivers/fsi/fsi-core.c       | 107 ++++++++++++++++++++++++++---------
 drivers/fsi/fsi-master-hub.c |  17 +++---
 drivers/fsi/fsi-sbefifo.c    |  31 +++-------
 drivers/fsi/fsi-scom.c       |  30 +++-------
 drivers/fsi/i2cr-scom.c      |  15 ++---
 drivers/i2c/busses/i2c-fsi.c |  16 +++---
 drivers/spi/spi-fsi.c        |   7 +--
 include/linux/fsi.h          |  13 ++++-
 8 files changed, 131 insertions(+), 105 deletions(-)


base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.47.3


