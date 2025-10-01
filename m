Return-Path: <openbmc+bounces-698-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC198BAFA93
	for <lists+openbmc@lfdr.de>; Wed, 01 Oct 2025 10:37:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cc7Zk4hVlz3cc0;
	Wed,  1 Oct 2025 18:37:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759307822;
	cv=none; b=id+8KSvgH4M1Uri0qt3f5og0hwodind73IqgAOwzCxsJ61BmBGkTHwS5VPjflVeYKBp63w2j+FpYy6Vw86ehlLz6dR3k8BE7A+kuIXpmmKlt2QNLtC3i/nqs12YZiCB7aO8wetyzPdnUryDZ8jg99KhY3kBlNCLgxmXJOxOpmxqzBbxdzz+qoMSLy6krci1H0rnXfy5BB73v7T2SUP0RCizBLtyF/WsdWoDEAtEevOGHxgSS7ckmrnEh0/yT8wodPm8BDYi4xKLxrDrlmH6ZicyitcG4CJWM1s+v0LKxKmSQtpBmAiYJ0COCPu1BIr3ztCk0d1KGONSxBGh7LJAcdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759307822; c=relaxed/relaxed;
	bh=gzIdYM+jt7Tm5Uc0vWk+e7hcdztHdOIk7pXCG5DPn00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QExlVmxKednhJpxj2yyV0xrBzUCOA++THHoyp2khPjswPZjA+Y8V5Sy04MAQOFqQeUdxOYJlKeLlVx0rD3yFZ1U0Q/WBO5kM/nJ0eVtOFzk5ubq9sZO7UO5uz+CA0qE5zA8OCFGPIIRiwHW73Lj2lRaXQboSBwjZO5WGY0KRF1D8Hw75OpLifCZrUm0xbfeRyyyfbkJa2C64QZoPaUwhF5HjPiyum4QnwvKzhYVTQ1WGSrXfXrgEM18GISYfqkUKiJb56NGxS3i3VM/2IJLOQTda4y/7ltVBPNG6sQFwSK+HqVExThcA+yCZhC5FyTxIobtzxTTqQNE3cwJXuaUNog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tN6g/NFP; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tN6g/NFP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cc7Zg0kT9z2yx8
	for <openbmc@lists.ozlabs.org>; Wed,  1 Oct 2025 18:36:57 +1000 (AEST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-373a56498b9so8836201fa.1
        for <openbmc@lists.ozlabs.org>; Wed, 01 Oct 2025 01:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759307813; x=1759912613; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzIdYM+jt7Tm5Uc0vWk+e7hcdztHdOIk7pXCG5DPn00=;
        b=tN6g/NFPap09djR0kXA/d5TJ4+DZ4z7VCoLrHKUc5D/UdECvtAu29BuA3FIXU4REBY
         FfSIVUzJVwH4Cldg30sd7HepIsaCGr0/zWXtyamJoPbKZzWuPqlePObsojBvkJBwg5YG
         8tPLZZzr7AafOhPOcEGpJFrevWpLoLXdYcetTRE75UvTlqlt14KJMz0V6+qlAiuwbcx5
         KSuPsGYnkPZwJi9eT+3Y1af4XDtC67Wp8ydgBI9eIyfYapy3Zxump0WwquPjvDtbEgqD
         Z1+KhxqPpJ/iUQEQbP8HBFv6tEnbAi8i2sSgh0lmTRsz1NYj/4OLIXv8dOWutKgInzjw
         CvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307813; x=1759912613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gzIdYM+jt7Tm5Uc0vWk+e7hcdztHdOIk7pXCG5DPn00=;
        b=nYrum3fGYn1lCeuZ80YECFJR7bl4giBEjZ7v3P+8p89WEJV1Y9KihfaXhU/BkGx59E
         vGTZas630J9lDPrlhabHAPzGQdkwlWd8d4HowRWoZP1PTbw0TZWotnCkNQsVa3hGaqXQ
         os0jufReWm6Zk82Sb6ZPIyrKcELU0jXpiMKvJMCBq0vMk4bTs98Hixiz4YmKSPNDgeJK
         EGxOzY7IFCWEilweuXTzCZoOxuXJHnrS4xsqEObWWvkHx3B/9qoY7mbNzNjGkrYTfSjW
         mml6WUfsTBaBaicT88TD5ZT6cUdJHhJAzaXa5O6FsaeYDWhzg3RPtqxUMyJuZNK8Vbxe
         oKKA==
X-Forwarded-Encrypted: i=1; AJvYcCUEuIsTQ8ICL3LH8O/0e4VJT2TOnA+iP57RVzrQbpKUZXYCrTIeTe6Nt3dk7oXe6ZOxGQuEMJQ4@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyAFNHAF1cMP8f6FTcbiP1OC9QVThAFzhs7Fv72i4hhRzNVFpuO
	XU+4kU8Lzv3PdTX0ZnmMx0jiica8P00BMe2rqbAPfajKwEnmkigr5nCf4wADyVxbI4+ebqGjZuV
	lMhhmXvNNUCwQIcI0mdj0MIyJ4/lPQuXzNRTJwfhpdg==
X-Gm-Gg: ASbGncvof9OmLy1/wcHW9Om98R/g2x8IUz6OReucOaxTjT/6FKMLNIQJtdID+iMVrls
	M8Zp6F7OF3AAxjh2DNFyclqSJDgiK7fP6MWuIX3v7GIgbr8QSUDC159dPA5S7k+P9u8VITT0BFL
	/89bA3cmUNz08oE9j9/IcSAYD8SvEISs0E1nLybMwyuBOowAngMsw7NzyBbHPSEj0wPuhwO2udx
	hExTFA4gGsk5uaUgY3BZtdByZTNVLhF3zcHa7685w==
X-Google-Smtp-Source: AGHT+IGR364l0fZkqCbX1kIjKIvYDxXIcwBHw+lqJUfFGXSzirJ8uNvUMS79/HggJOLuN/qEVcxWH5dtrV9+RyqdghU=
X-Received: by 2002:a05:651c:210c:b0:357:ccfc:64ac with SMTP id
 38308e7fff4ca-372fa205204mr25896051fa.4.1759307812626; Wed, 01 Oct 2025
 01:36:52 -0700 (PDT)
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
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
 <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com> <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com>
In-Reply-To: <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 10:36:40 +0200
X-Gm-Features: AS18NWDoMdvnOzF6_wDEnr52XVC2ihE3QCB2mnLOoQUz_n36xv-rRAEh7yvMfRw
Message-ID: <CACRpkdbo88o1g_VCp0+C9hfi1VQkP99x2Mnkw_DTctBEtVAa_g@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: use more common syntax for compound literals
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Lee Jones <lee@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	James Cowgill <james.cowgill@blaize.com>, Matt Redfearn <matt.redfearn@blaize.com>, 
	Neil Jones <neil.jones@blaize.com>, 
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Yang Shen <shenyang39@huawei.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev, 
	linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Sep 25, 2025 at 9:52=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> This is a link to the discussion with Andy as per Linus Torvalds'
> recent request to use the Link: tag to point to actually useful
> information rather than just the patch's origin. Linus Walleij doesn't
> use b4 so the origin link you'd normally expect to be added
> automatically is not there at all. That's probably what caused the
> confusion.

What? I use b4 for everything, I don't know what gave you
that impression....

I have however removed the automated Link: tags generated from magic
gitconfig hooks as requested by Torvalds in v6.17-rc5:
https://lwn.net/Articles/1037069/

This is also mentioned in my pin control pull request from yesterday.

Yours,
Linus Walleij

