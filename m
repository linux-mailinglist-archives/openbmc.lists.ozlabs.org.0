Return-Path: <openbmc+bounces-682-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55456B97BF6
	for <lists+openbmc@lfdr.de>; Wed, 24 Sep 2025 00:42:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cWZjS6fPcz3cYJ;
	Wed, 24 Sep 2025 08:42:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::135"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758667324;
	cv=none; b=jrmryjPMOpjYjidSo/Ikc599pBDtC8I8B5vy12ZYmbxzMj+6QX3/oTRhbHByvmO9thJ+/IUD/IE315NZ3ZdBiOVuKkzfJ0nQ71YojxutxId5sly3RuveS4Of6Tu9zDSaUkSi44KOelWs1Nr+nK/NncgOly3iPgbXmqvMJAlHKqWr39Zx5dOuytbWjOPXEDnHtRFlz57F3L7qL0CNpIl7FsH4ymyTdME3ttR/+WibIcw6DxnlGCE4iTH057Cc333/LoXQMhAnCac+dJIW5yPbD0aWEk1QiJ2zZY6LjRL1oysZIc8L8xQ0CIr2CGhJtcXtEY07O4roHijRbljpgHOO8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758667324; c=relaxed/relaxed;
	bh=6SWHpC7XT0boWgdfna8gc+pG3x0qlvgKa0qIbsC+iC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Upmy7ZY95NEvBBA5+8N6Zyl01XdG6Frql+S3bxNdRlPotCc/MQM6LWh0OIdPhMT5xQGm2Me3BEtEyV923CAbPMdnurrjZh1x8Ixo5Nvb9RU5Hw6N5NBgsnvcSt+ZQkZZP+SbtSJwijKFjSYrJJTJyVghGiArthuRkDagylweYtWosci0GBAzx80nPWM0+Io+8yv+juDSOVsqJ7R5YoyzWSVgrHU2QJIg0VXXkXeyb+yOKLdL4gRVhmfEDZ65O1JBbng6aWLlVjfy23u1/AGrTMW/4n+aGJL44Pzg8YhPg1rVmhhH8/tfGC39/LhX6nIqL1gFriZ+X2FkRZoRx5ooUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=z4A8YkKC; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=z4A8YkKC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cWZjR4H06z3bvd
	for <openbmc@lists.ozlabs.org>; Wed, 24 Sep 2025 08:42:02 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-57a59124323so1743021e87.2
        for <openbmc@lists.ozlabs.org>; Tue, 23 Sep 2025 15:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758667318; x=1759272118; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SWHpC7XT0boWgdfna8gc+pG3x0qlvgKa0qIbsC+iC4=;
        b=z4A8YkKCmh5QL74XdRHEqfca/KikBvjfiHY2EUIFn0YQKKbT5fJXcGIeKT0cO0+IP2
         ZdIfK3Pl5D8TAOhYW6fOmwqB2yAocmdyAT1KFQ/AcjAQQcmcAYluiSYeH6LhlYLNG7eN
         7NCpRUc9aSmf8NRC3ZCMZElQ3Q7ftwHupxOTmkcVK+A8EbZCG835x0BzDMjmqHR+aJXN
         mZyMyo9zQR97Ih+N7KWimxgBDJ6FxFrgI0OS1Ls7xtPhNlJzLoC9RqaO7trftLz9kekY
         579KF/WVYaVArHjaDhBDI+JlSFv8w2QHSV1HIghWLMUvvQtR42kDKCeOqSHvmFdWG6My
         s+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758667318; x=1759272118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SWHpC7XT0boWgdfna8gc+pG3x0qlvgKa0qIbsC+iC4=;
        b=px2fsPJsFmyt/f1HV7CF4geI66n930ZJbnhuZV506784P3/AGvrIisTyXyH3+xWWUT
         ghe4RuI9mZkjUyzIXXst7dbPkrGj9yiq69cINhE2EZOqsn7VvRk1GGW8Btf69CxISm/G
         PyjuZ0Dv5/OU5WE1fTbsbWokxFk3Qj+VJF8TNV5HgyQviFNBrH869XKwFKE+k0SINI0n
         yuBXGuMk5P0r7F9DjQMI3x9Jyi2q1mu59IgLPkTQax5PT8uS01ftUmhcta0lL5QOiWyu
         g07FL51BYXAdd79AYECslavmen8RF4Yu+6n+hsWGF/sqwJpxooVROWMFPlrgnbBYrNkG
         8ohg==
X-Forwarded-Encrypted: i=1; AJvYcCUCNyR6Kvkszeu8wHT45D7QYfJlNl6xVRC+u72lBJPfeEwEgNP2Q/Pg8PDPSZJCqs7FS1J7YwFu@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxpWCOTgDCNWHRSkRSZUl5Ttq/Lh03NnwgQuBN46hU9epEetp/t
	klRt6p85vJWBq5OPPu245ELinbeQtQwLD6qjBdSNKaIKkOZQ//32+JS1COsnAokI7Vb4jkcbh2N
	YVEvUto864TViq6MQbNAatwx/143VyVPxpwA8V58tUg==
X-Gm-Gg: ASbGncvtmZzuzN/RM+m0Hw3A0iM2blavPShcB8IKtEhIl3QIOD6nn6Yc05JpewUFEhq
	3CN1WXFMUH9RTovPWLG0UVFpn8netTNc9iuiT7ATLC0d3+tT3+18eivHnIuC/KmH5nLgQczSr6u
	rftCbELH60fsxjefTLcbAePeN4NTj/cpJsFuAxi++oiGWNMXh6SC95PBCJqbb3qAMXZbcTmAlUL
	AOhA8U=
X-Google-Smtp-Source: AGHT+IG99GeGJ6EJmRFtaCX57MxbFFNDKEJDSpjz4IOp4Xv1ApJ9GNzknCU6gn3AgKwY56E7tlVN9VixGw0iGQWzSiA=
X-Received: by 2002:a05:6512:4007:b0:57a:7be2:21e4 with SMTP id
 2adb3069b0e04-5807051c520mr1245993e87.9.1758667317970; Tue, 23 Sep 2025
 15:41:57 -0700 (PDT)
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
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 24 Sep 2025 00:41:46 +0200
X-Gm-Features: AS18NWA87kQOtTQ-6Uw89hDflE_WXMd3ykrYMsrH2sWDsx3-k27OaCZ6EKQ1YIY
Message-ID: <CACRpkdY8AN5vRQEt=3QzdFdPkvx0FLiv7QmwZ=eqZBSn9sUtng@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: use more common syntax for compound literals
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
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

On Wed, Sep 10, 2025 at 9:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The (typeof(foo)) construct is unusual in the kernel, use a more typical
> syntax by explicitly spelling out the type.
>
> Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1-1=
3-9f723dc3524a@linaro.org/
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patch applied.

Yours,
Linus Walleij

