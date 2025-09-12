Return-Path: <openbmc+bounces-639-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A51B3B543D7
	for <lists+openbmc@lfdr.de>; Fri, 12 Sep 2025 09:27:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNQwq5V8Jz3cnS;
	Fri, 12 Sep 2025 17:27:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757662027;
	cv=none; b=Nu/sZbwNoZo18C9MBeeV5mEBfE7pY10Eh2lukpGOeNPzpVGnQ9m55J1lupb6nkjZTkFntF+HKOySz9P/0/f6vvOOPus/03bnEvGT0wECfly8mBA5cXTUE8NsdEBZmASqKMjZ8WAoAmKElufxzKTMOOkB4woBt8vkQHmt9FmCwXlzbNDS4HyvOc6ruK+7gD/wTT+r8V0ZjcVTaiCqsgHfF0O19oKCkC0GiZh6hTq7s9F5T3BMhdXxs+dgl35n2xtFdlI/ec4uSiqMoAjN7xcxC48wqmzsw4jrFYVpAEMtGS9hZF4sTzkgtEXqI+Ptj9SPRhmlUWVfxgeaFEN3xLqBWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757662027; c=relaxed/relaxed;
	bh=j3tI11OAkSN7RqNGcTXf8rRvtsdFAfZUpl45jMI60AM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PG0lpiiBPCj8PrYYfUiayLjW3qr9K9DymWf796372ymCpErAjwBLwMVaQSY/9dpmj52WNh5uguWCkn+n6MqBdUbOoYU7wKZdduH6RDzETu5LzRknSrO1yLll3QrzwvojdEK+6HXG5pT/3eQXfs1BfLwA1glgwSYXO/K1XCXlTUEXD3y0l5rGUo1xKKf0gw7qTnkLp64EHZAcAGKB4Q9pZHHS23uoyjHGiK9FQ+FF63VxclIe+bKHOfaDGRibcqk40oODPciVpXewmcudnzH6cXOWOrk1nSNtnRuSjMJyPC3aQL9OLT9+Yq2mNCPVNM8AaTPGjbRB0cVXV5SVFDz/7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=kxnQ3QqN; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=kxnQ3QqN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNQwn6R3rz2yRn
	for <openbmc@lists.ozlabs.org>; Fri, 12 Sep 2025 17:27:05 +1000 (AEST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45decc9e83eso14213155e9.3
        for <openbmc@lists.ozlabs.org>; Fri, 12 Sep 2025 00:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757662021; x=1758266821; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3tI11OAkSN7RqNGcTXf8rRvtsdFAfZUpl45jMI60AM=;
        b=kxnQ3QqNkwBUKzXSA4ZOhw/79qEUvS1Xoiko0Eo4hDqN2XBncLFfo3+oxCMxoOxFs4
         BL3Q3mJOQyKPtxUJVpVp8F0Xxipx6c72iNR/Ay+NtvUpmPKyhhqkB8Xp0Ac7ioXYxbIl
         gkY/eFmd5a7b7sv/kYbiO9Oh6MaRyws+THZlCvNzC/RCP5Bp+KNIJBW6Ve4BYP6AH35Y
         usIS7qmkvZQD0pViJW3vjrTzdbAvRlw+AzK/HnoA2myChWEis+SnUJ4DQESqP50mBUZ3
         TYhTg84EuQPibwvpef2xs1TXutza+MrjDUtJewgBpHz6sv0j+YTO5irDWiDh80YxaywI
         /2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757662021; x=1758266821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3tI11OAkSN7RqNGcTXf8rRvtsdFAfZUpl45jMI60AM=;
        b=FaC6RC6FOk8u0eNNgqy7duOrBeGacnQI8u1dEnk0g+r5mvvJcIfICZgoFlCwKrtX0L
         qVOOxZOej++d4ZnSyw6sbSXGdoOTePZaO1Hfap6Th1gIx4H5stX6PuWoSarxAN48Figu
         HJ+8Mj1hyypNyB/gG+OuGc5duum9+HbP7mA5yI2XytssOLdoroC1f40P4o7c5Awj2z32
         B5jWpXNYQE/YRqD0NBsnoZPE9t8GYrDFwxE/MgvTVtWNEEaqf/bpDXqRxt0MixHy2oQE
         gcWEPXSx8wNh3b65rlffJ0tDFzJphmlqwhs8x0+1GJYoX1WjH/gFOShPaDs9w9eK7aHD
         vZtA==
X-Forwarded-Encrypted: i=1; AJvYcCVD9g+IqdTih5msAY7UkWR/Ph/PIV4a/h/A848SvfE7liB9JqxxRdZ0kvriBunMnhlCpc2kqe0r@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyMDcEoDntD09Bc6iA9WjtNV7XpP2KUgzJvS5h0sU7Tag95dHD7
	80KhnluBEviuqBS8V/Qw1DzzlzGuBdOfPiFEfj3YHufVsNcU+Jzq68MlhFKdoqDSK5Y=
X-Gm-Gg: ASbGnct+HQxQc5ZfRrnLKWYkd9tnwvJNqsmd8XfFINIQHMhgsDKD4UV6HpKtN5gvLWT
	MK1Ch5QHENxN9d8OerIazR0Yf4Nu0dmUXBjHPDUa3vNk+kE1XzNLRYefiEPMXpvA//YzD4HMrvk
	6nki8RQxqfbA/sS6YlZLZxcB3ccB86klaSskzG988nf/NKGKM4WkDZj77GoBnXi9oO6HHSC5LZa
	kCZS9mDzPzpXODhOd37+Ni5ozTRx30CxrqTdntKK0EqnEcAqZgzW8DbQsdf6RVZ2tffW4HwF7kj
	XxZ/0Pk96FY/3ScWn5E13QPJ9cddrCkPkKD3YiDEKNNgZoGE33hDfLTnnboj/WMprpkyDRX2xS/
	+XFxZVD6EnfDZxG1wzQOLcXY=
X-Google-Smtp-Source: AGHT+IGXpoEAuIYw6/UluyUVnBbgfJgpGf6NHBYCv+YqFkoz5Fkn4jAGq9fRMx7AKxy66hsY9dDhlg==
X-Received: by 2002:a7b:c04b:0:b0:45b:81b4:1917 with SMTP id 5b1f17b1804b1-45f211d5d6fmr14759865e9.10.1757662020614;
        Fri, 12 Sep 2025 00:27:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b6ab:4211:ebab:762])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e774a3fb5bsm730202f8f.58.2025.09.12.00.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 00:27:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Lee Jones <lee@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <legoffic.clement@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	James Cowgill <james.cowgill@blaize.com>,
	Matt Redfearn <matt.redfearn@blaize.com>,
	Neil Jones <neil.jones@blaize.com>,
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Yang Shen <shenyang39@huawei.com>,
	Imre Kaloz <kaloz@openwrt.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	imx@lists.linux.dev,
	linux-unisoc@lists.infradead.org
Subject: Re: (subset) [PATCH 0/3] gpio/pinctrl/mfd: use more common syntax for compound literals
Date: Fri, 12 Sep 2025 09:26:54 +0200
Message-ID: <175766186357.9646.17039178132060352918.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 10 Sep 2025 09:25:44 +0200, Bartosz Golaszewski wrote:
> As discussed[1] with Andy: it's probably better to use a more common
> syntax for compound literals so fix the commits that converted GPIO
> chips to using the new generic GPIO chip API and make them explicitly
> spell out the type they're initializing.
> 
> Each commit in this series can go directly into its respective tree:
> MFD, pinctrl and GPIO.
> 
> [...]

Applied, thanks!

[3/3] gpio: use more common syntax for compound literals
      https://git.kernel.org/brgl/linux/c/7eee64e8be51f9ff0393b5bd0752a6e8f9252bf9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

