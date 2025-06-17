Return-Path: <openbmc+bounces-232-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1E8ADC5E6
	for <lists+openbmc@lfdr.de>; Tue, 17 Jun 2025 11:14:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bM1Qt4L50z309v;
	Tue, 17 Jun 2025 19:14:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750151670;
	cv=none; b=oOLhogd3ft/gCL0SZuT+P8FisMo48uoijFjZW0G9unn3U0+PAvHMIVMvY2SK8YrK9U1eao/Cv0ZfODC+R1r5BqnICGF6nfiYAOeDp8V1XpIpKCukDBNs4XU9rjNBF4ohM8RprwV5hhVtMz+DU+gs/ar7JHgYcahQtmuwTtiiIN8AyOVsXNvS2r2LOPXnE9aPTIE+tc9caxNkIpCHKGbp8TzDft4wopTLhnTgcgUSBNaysYDJcSE0EwH797mWfJwxC8lGHvMzIzrIJ1mmcwB5CD7lEodnbGp+7uPGdGebjjNkKrZn9DrA/EBCYw4wcfyD6shv/Xr49B7Yr7We1OXnPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750151670; c=relaxed/relaxed;
	bh=z2DwhOwUsMunVDJWED8rmtY3JjlBmcuuZx6kyq72hSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cjObB5uqISgEXXJpE0RXLYVM2Ful50DBkQ9Bi8eKq92gHQEtUNtXzzzy4y0Satbs0YAzstezWkCkBQutFATsyBGiKPv4jXvdWU27lhdRv7kYzzJRmdwPJNZx1btPUuEm6nttCwa1bipVkYmaRrdrYWcgZrOMHAyZBHzy0xBRLtUjp6h4l80tJastLTunYSFvoJsQmgc1jtio3HlIztINdYRFXPeqxFwHej81agQUh25e+eIEulPi8hxbfwO5ju6+GVjZPSpqLsUSMfPjc9YqnuyfxLm5h+ofwIdG6mdndt+Pb1IwJ+qfgooDozmjc+FAcGjuf1/ikeFSNB1/1PudyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=zAy8BB9N; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=zAy8BB9N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bM1Qq3pdpz2yMD
	for <openbmc@lists.ozlabs.org>; Tue, 17 Jun 2025 19:14:26 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a510432236so3947666f8f.0
        for <openbmc@lists.ozlabs.org>; Tue, 17 Jun 2025 02:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750151661; x=1750756461; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2DwhOwUsMunVDJWED8rmtY3JjlBmcuuZx6kyq72hSI=;
        b=zAy8BB9NKTOjx1GKqCpH83v8nrdOMvbsgnh5W7+E92Bthban345AGFSFeo0SSw0mDV
         hAy0Ipc71ZfPMH0qd41MP8Zr064cAkf5jscQ0tPIlHkIc+nar2S1T6d4j5zcpyrTxSPA
         wn0pV80gi93E8YUUWsDpFxZcyDR+X758k9ayIfkBd4kU5iukaSfge2GfN8kgq4XB6eZo
         JQW5cDx4Gw2Ws+2uvl/gd5Izrd6vDdV3bq4oxcRD7X9CHfBqIlOJKAl0IGI7PMb49o0t
         LLjVWPfsMgFv3GNG1Unlk5SyoxIP/0wXFMJTt+rNgMv6qb7QxpheUhNYYzpyN6tO5ihp
         L+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750151661; x=1750756461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2DwhOwUsMunVDJWED8rmtY3JjlBmcuuZx6kyq72hSI=;
        b=ZkOlGC+/tBq9Y8ktT+hhhaFXo+6WZGOHLrfc+FOeVtA5XP85Ae31sD1BiZV3tpmsL+
         7/0fpi3ADsL+pR7ZLLHvBp7Rf4I0Yu+H2yfQLQCJPplk6qDwSrOJ7bipmfm135zxLDrF
         I6/jXIsRp2vtvxOlQoOKss2By9sFiz8gOLEKJY5ueAXiJkMVaMQg+VX0xfr8Cj4YSjvR
         QZSvy7io1EQgjtlesn75a7qlhiPhTy42BsJCZwRgqpJdHFm3iU6pFFuVEg5O5rXG6rG+
         tcIjnRYqR4LkvB2kqy+D2bRlwrcAgTD6UaK1R9XvVYJ8v8YuhHZvRy6IGv4As7r/yhaS
         Aq9g==
X-Forwarded-Encrypted: i=1; AJvYcCXLsdoQVDA7Nrn9OGU826o89IWPEDUxUf4VgfBDnS0UkEeTbgIJbKpAoQdwYaMrowOiMn9v7Hk8@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy+OrpLXuNpuwl1XkbVzEEu3wMI7mAETZ+0ihe/WQ7qSmz2stGL
	7atTXKlBu7J3PKnKMnAEuo/7m+KY0Z/+ciYCsqJUA46OgKzRKa2U3hc1GMSIjOVV4IE=
X-Gm-Gg: ASbGnctYr7SxWWTtnigl9+Jsw5GQptHL1QPOTqIAuVGAGMcK2qKiDhRqqNBDjC2krIV
	HHZgXWRZaRKU+UESsYxcMMCYeBTh/X0XsAbd9oeDPfKRG9wFBcCRjsfHZXzJ93P3E0LLr+Plz7/
	rwvEj06V8TeNrYPjCJh1PLujvbCUHkhdOeucWLcQcKCFtC9HdUOlKT0wFi0UAIbtQehpqnth6EW
	kYo8MCWOmEIzphjyzkMbItnsiBeySTqwJYuwFKKfYFAUlCZvP8Icmj5oDv9YnmAi//quWgoheCO
	c/9mS/NpT0cVZO0WNwzP1FyAOlgogwaCUTz19k3U6Ous54DvKU400RrdklZilxg=
X-Google-Smtp-Source: AGHT+IHJrUzq11FqzFpCalpA8oxq7QOoJUd6doTIPdsMKhwT2j2fIZKoD5gQsAT4CYJMYxX4N6Amdw==
X-Received: by 2002:a05:6000:230e:b0:3a4:e740:cd72 with SMTP id ffacd0b85a97d-3a572396df6mr10071598f8f.13.1750151661308;
        Tue, 17 Jun 2025 02:14:21 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a633ddsm13280685f8f.26.2025.06.17.02.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:14:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH 00/12] gpio: convert another round of GPIO drivers to using new line value setters
Date: Tue, 17 Jun 2025 11:14:17 +0200
Message-ID: <175015165197.21779.16487408157196142174.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
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


On Tue, 10 Jun 2025 14:33:10 +0200, Bartosz Golaszewski wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts another round of GPIO drivers.
> 
> 
> [...]

Applied, thanks!

[01/12] gpio: mmio: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/b908d35d0003cc75d4ebf7c24a61b07d34e7f5dc
[02/12] gpio: mm-lantiq: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/d27746181905c256eced857f4b2c051ac44b0b45
[03/12] gpio: moxtet: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/b454580cf11b45a9da22821543f1455a6a31c5ee
[04/12] gpio: mpc5200: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/80d42372d9d87626b55516779e935c012cecdae7
[05/12] gpio: mpfs: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/3aa3628f8168df9fe154b09b1710d3314b9fa4b7
[06/12] gpio: mpsse: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/e63d9fbe9f148b44f2fdc211941f2d4485022549
[07/12] gpio: msc313: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/88a775454a0fe923f3d34d8f30cd1d6b75be0859
[08/12] gpio: nomadik: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/aaec273c7b511a7826df09123a1fd6e4896c1bfd
[09/12] gpio: npcm-sgpio: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/0e1a8930c941e3a7bea25928b254ece8caa5135d
[10/12] gpio: octeon: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/f02614561493da22f24b0e2ec1c2ae0d5b41c68b
[11/12] gpio: omap: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/57065d62e672bce193f186c7b759f928b9a90ca0
[12/12] gpio: palmas: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/f3763403a6bbc3a18379fe4c415bda899a111d55

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

