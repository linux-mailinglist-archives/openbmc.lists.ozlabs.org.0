Return-Path: <openbmc+bounces-699-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDB8BAFB71
	for <lists+openbmc@lfdr.de>; Wed, 01 Oct 2025 10:46:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cc7nt0Gqlz3cc0;
	Wed,  1 Oct 2025 18:46:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::132"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759308401;
	cv=none; b=NTX5SVWH8ZO1nKi7DzGR/4KbrqaeAhuRc0rGkqBePJEmY+XrS8uuireKK/y6+4NwoVXDG9zSzhM2VF8tGb+QW4rxYEd+nUNu1VvEC/LFw9T2vMfnzdfFUX8cikEn83Xy0Vpnp2ZjveWiPJpf+C86s4m/xiBZEA9Si+BG/Xy191w4gZ89y4reGWFtXwA2LZI3GQrmoHwnIOdgxlMqygpWFeEZqFshQvKhs9EoccxIuO40HOmqo820Ms8Hyq84QVbX6t4TSg8h8ZMpRuzunyOZUlYH3FPjH7t00KtnVnEp36NysghhsGpX5kKUZkppypwAEvhdh2vLIUJAsPzEiRg9DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759308401; c=relaxed/relaxed;
	bh=8D0lPsjedL+kyXW7Dr+b8bXHNiYNOO4VOFO0oJ6yKL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bUalCMS6xT6Em0rkwD54sCixP2QYea6v+D28xFboFwxRW3pEnWGOI3CgHnHAi5TrkQFgD4DzKjTId2Rz8QOrYaYhjx8dGySDiHmxo6dxPGksEuC4TaQvvK8d4waEm/ckYJtmEWqWSrn18q0z3G3dOnR29piacUbv90YrV6rCgSF00Mx7XXmyDumRqL1w50KGIKAEjLdvC//9WIYWRSehpHhbpty0kKgn9dwFXuGshqgG+CfFqryoh5LnrQtBMvywty+S0Rli41H2L7RPcgLsrtT4J9wuOK8ctdx/TwXD6vUEHHY3jhJyNDKE9DuCzFpGrhH0U/n5VrD/QN1Gt/kz4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Jtb22s05; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Jtb22s05;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cc7nr1ZZfz303X
	for <openbmc@lists.ozlabs.org>; Wed,  1 Oct 2025 18:46:39 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-57a59124323so7134197e87.2
        for <openbmc@lists.ozlabs.org>; Wed, 01 Oct 2025 01:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759308396; x=1759913196; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8D0lPsjedL+kyXW7Dr+b8bXHNiYNOO4VOFO0oJ6yKL8=;
        b=Jtb22s05gJqFkUT9SmqagFNSRwCY8bsG/i+SJP+hNDx9mIseaw8VKTu9Pvj32Bsple
         7D74kI35WY4bcecQzjkHrLLbJiWM61W4jwhKbk1JjHlM+UpmzI3ASci8leUM1G4d32g+
         8Yu/588K4asMHHC0qiZuEjNv74PbC2RwYJqBjxlqezeaGsp23z6XFlCLo61GM0ecBHLa
         /IFJklDjnlB/T3N77s49LI+4biIx2qZGHomTUjHBw/hGP8Bo9U7MvRpKLFezlyxNWYgz
         ekDSZxZCABObk7eCVOOIJV9DvK1UE4BSkB6+4ZAwJYe3CDQZ7UIXDYm1+GxAo7b34q5j
         W1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759308396; x=1759913196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8D0lPsjedL+kyXW7Dr+b8bXHNiYNOO4VOFO0oJ6yKL8=;
        b=kHFjnCytSvvbyPoH8f9iFoTrri4025wc/jbiBk/812jLn3BugYJqha5SQyfhdhCBjI
         32OssSICzDf5IxQsaxyD9kFhAhw/74PdCM7ZGEGsxFkW6sd68KvFAtWte5uyd8I6i5Gk
         f9Tx1blMwC3/iRscisjp5VgzygrP7xz32eUWWYM3pOprYhGjdaZz6MQ+wxz6KJLtRTFJ
         tXOi9KoMAV+cV3PuodcIIE32zAe0R5npDxoaiop0lLCHCTmJySbxH7r7GRBrADCDiI3p
         BT726Ge1KlRQ2t+fRqSDFOexVMQvUgEvMMDOLmhmfFQ5x16t/KxfZ92LAFyJ7Lcu8B/k
         zX/A==
X-Forwarded-Encrypted: i=1; AJvYcCXJdnI1RsOXdWBVfjf6+yCmoknvFFdFdqq7iN/SAahZd+lJ/11Y22HgvyqFoN7DhT5Np+H7fHsT@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz+gLp5YyGlv+oALzkyS2Obri6sFe3d45Q9KqEBSzkYdliP1xnQ
	dQ+x5KGgHHspp89SyHjKA4CRaVAhDNS/umtJk3cF4QgiS/kCsxa7Q1FACP0Jmgu1bawfL9w5sAD
	Hs4nbEgrL9RIpc3ScNX+SddvdoQzW9hDX0WgvpqtMfQ==
X-Gm-Gg: ASbGnculoL2JwscYZZOJ5VRpcXeZyQgBiMGCQEvYCYTmxn0wpy/OuKFna9+f9IWfO0x
	5wtpjvBMy5Dg0Y+jdP8ebacr8dblhO6H8WUwCZ6VOABjsXVwtbbJf+IoL9GwWTNWhpFyZ3d43uy
	2HjIitYFZU1h/IGW1IABpMZPF+jKKDhkVVBJpGxz9Q4ir5/75Cwn7F3LVPmW9UdygOR4AYtfrAs
	5uD7Woem66UWAC9eWFu2bdWE9hOMuP5UbxII5ksZadYBy6T/o+Y17n28tVitEQ=
X-Google-Smtp-Source: AGHT+IFOdBqQ3obnIdTm7ru0JPzklPYFIUGqCI693FKE/9RlmuM5kKhUigWL4UNHwLKwqtrOVDs8F+QH4ORLFYFhoak=
X-Received: by 2002:a05:6512:ea7:b0:57a:6d7d:dd7b with SMTP id
 2adb3069b0e04-58af9eadd86mr760851e87.8.1759308395621; Wed, 01 Oct 2025
 01:46:35 -0700 (PDT)
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
 <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
 <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com> <CACRpkdbo88o1g_VCp0+C9hfi1VQkP99x2Mnkw_DTctBEtVAa_g@mail.gmail.com>
In-Reply-To: <CACRpkdbo88o1g_VCp0+C9hfi1VQkP99x2Mnkw_DTctBEtVAa_g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 1 Oct 2025 10:46:22 +0200
X-Gm-Features: AS18NWC0XlksXBppS2yCvWpBaDAShYUzQK0jJOB31RgrqudBkZ0MvZktkc5Xz8w
Message-ID: <CAMRc=Mf4kv03+cfB7up==PUJyxHH6U3hHF3q6iKYZWVOZamSTg@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: use more common syntax for compound literals
To: Linus Walleij <linus.walleij@linaro.org>
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
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 1, 2025 at 10:36=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Thu, Sep 25, 2025 at 9:52=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > This is a link to the discussion with Andy as per Linus Torvalds'
> > recent request to use the Link: tag to point to actually useful
> > information rather than just the patch's origin. Linus Walleij doesn't
> > use b4 so the origin link you'd normally expect to be added
> > automatically is not there at all. That's probably what caused the
> > confusion.
>
> What? I use b4 for everything, I don't know what gave you
> that impression....
>

Ah, sorry for this. I assumed the lack of Link is due to no b4. Should
have looked at git log first.

> I have however removed the automated Link: tags generated from magic
> gitconfig hooks as requested by Torvalds in v6.17-rc5:
> https://lwn.net/Articles/1037069/
>
> This is also mentioned in my pin control pull request from yesterday.
>

So it is a policy after all and not a "please"? Let me remove the hooks the=
n...

Bart

