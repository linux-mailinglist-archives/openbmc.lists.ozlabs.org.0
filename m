Return-Path: <openbmc+bounces-687-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EF9B9DF9B
	for <lists+openbmc@lfdr.de>; Thu, 25 Sep 2025 10:07:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cXRCv4cmhz2yrm;
	Thu, 25 Sep 2025 18:07:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758787675;
	cv=none; b=nHixxGkeL/di6pcpw3ouXBOH8NbiS7wS7UdXa7peKtvMzduucq11TiwOhtVprdRXgq1HZY9VqpUUg2dWSuU8E5huxHfNULbDMtYNuZqUc2L/26tUa4iIm/DC9SkriKaobmU3jFcPkB5nyZwFxfqvxSBxwKNLsza9OwxBSHZ8961FsOKg3+xhgXChq4mg5RDe1HUq2M2V+HZYagAiAlaN+tdqF2EzhOPh29NwqKo2O8D9tQH7NhYWDol91frLzLrwBmPyuJDPGI17tOsAvuW4I3FzorCkXT/fHrYwwou0O9vrjMImzs+r1EidY6ZRvZ73+ePxU4UBTgsUZpqudNNTdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758787675; c=relaxed/relaxed;
	bh=rUcMlfE8b4AOAO2p/aFN45tB3uALYO0TSoBHD4chZzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eQZZDT+1w0Wq9BG/R6KjnMk4kHjsCNKwVDb40z2t2H5zRwiSonVGxpK10XGoF91CFHk1Ii9C5lvBj5iJsSo9DeXrkM+4tqrkpunlpXX0IX9vYowkIX7t9fp16Sci+ZjF5Y9ilfa5qepNqB7gu/89ubRY9UsbleO0rkdcILMSHPqAxPY72LRl6uq4eEyIEhGdKRemYYnqCnuGBhMA7G5E2UmQEqO85Mn+enkdnAroKDQls2UB5sFPErK14KWJSLngZKgEyxjBk/NoK9EUb69y8Fmc0OhTTePkcqJIByiAN+CctkkEiSmxumb4YpyrtcWXoP+xAWPvzONYqkj/BFlkyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.210.172; helo=mail-pf1-f172.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.172; helo=mail-pf1-f172.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cXRCt5nhrz2yrP
	for <openbmc@lists.ozlabs.org>; Thu, 25 Sep 2025 18:07:53 +1000 (AEST)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-78104c8cbb4so355380b3a.0
        for <openbmc@lists.ozlabs.org>; Thu, 25 Sep 2025 01:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758787670; x=1759392470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUcMlfE8b4AOAO2p/aFN45tB3uALYO0TSoBHD4chZzo=;
        b=H7OriHBMPM66GSRUQ3oal3ZY8Dq/XVG21uEsGpRfgnM2b9BjKKylWuzGhPiRNz1z6C
         Ly4Hzt2qjiVYK3EdLbBUgFf1fV96N7J+qmuSb5rTaRI7wnWlL8CT0hQC9aBF7gCzqn1+
         To9uZmC+Ti6pAASjmblQZNBb4Yn7maMTK65cxbxnZBAekBZScV023aKD1SYkrXug2dFq
         JlWzgkiq6U8scPxo2uOptqhHC+mQjLf/B4qQcL7i38vEJs1MdZf/n79KsxpMkaljGR8F
         g8HRpeE1pJhPTWQUzd60Pd/H6auJY9940205jnxwlvXuwc3CKPFlFzOLNNwsi/o2a7kW
         zECw==
X-Forwarded-Encrypted: i=1; AJvYcCWpifNuiPNqWrTAJ193V9sWdSZF3kxIQXrb1tGoJRTDyTIlBkGeSKzDSlUJfsaLpQPIZfQVvXus@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzoNUne+x+xAtKekJ8TpXmdO3J30jcn/4ePfncpZa2LFvJdn28g
	WDDZTLb4IhlXq/cSdiDXAULnlrUbFYS5qbkBiRu55xyPQN5CHiNWLv/e163lqvz7
X-Gm-Gg: ASbGncuDiCkm37URm1ZVLAkrE+FxqDb99t0rPNzrQreA+n2a2OOU1VHHPWvIwmxZYOA
	2E7sSj1yFlTRdMpX77YwWPO9xGfBfGztqRTm72cWdz7JU5bBqRNugBTH/GhVsfDvlb6k30wubHe
	je3GWBznjvPZS+Qb6LbHTp3Xh6rBOFOj0X4hFHN7CeNJkpJNHpjgAWeMYvRHBxaaZhJo4CBA9M6
	8G847B8S4NLLkBNCv3wLB6UJeeBOnvk201LyOT0PgNr3oiwujjKPqs0I7ztsaVTuO0qGrtr5aBA
	4r9N2LH/96LF3Vr+np1qOVk97UReGpQFICccDNoVXG/sv8/Fi7etd3u3D4NdFkPbmrtRaanScn7
	JOZ1xWXIuA9wzlY68m1kdZQAwm+fBCaR6QybCS15ZRZpQOiNAMg5fUz3fs+Up
X-Google-Smtp-Source: AGHT+IFg67+KcQRpTS9tz+fIbc8KjTDmcYr1cLpafPXukGBIIrJyZprJJ6Z/NBUzCaHzHLcZecrUBw==
X-Received: by 2002:a05:6a00:a8c:b0:77f:156d:f5b1 with SMTP id d2e1a72fcca58-780fceebcb7mr3495313b3a.26.1758787670576;
        Thu, 25 Sep 2025 01:07:50 -0700 (PDT)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com. [209.85.216.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b64599sm1204608b3a.70.2025.09.25.01.07.50
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 01:07:50 -0700 (PDT)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-330b4739538so753120a91.3
        for <openbmc@lists.ozlabs.org>; Thu, 25 Sep 2025 01:07:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXlMolsg03Bp5c1gNpNWG4yVoGXW4zd3UTY/Z5DCyhMZIHPbCqUq8HXsXBKB6e0SKqfofV3heIU@lists.ozlabs.org
X-Received: by 2002:a05:6122:90f:b0:542:2912:664f with SMTP id
 71dfb90a1353d-54bea2f2d56mr980779e0c.10.1758787332548; Thu, 25 Sep 2025
 01:02:12 -0700 (PDT)
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
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Sep 2025 10:02:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXgoj+XuKhruEmMpjZignuM9fJLp8NJ0=ZLw8KdFKohsA@mail.gmail.com>
X-Gm-Features: AS18NWCyYwXSHgwWU9cjWnhwFzyaiaKh315kbRG5kwTsoewxQN_WDT2npG3qPmE
Message-ID: <CAMuHMdXgoj+XuKhruEmMpjZignuM9fJLp8NJ0=ZLw8KdFKohsA@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: use more common syntax for compound literals
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
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
X-Spam-Status: No, score=0.0 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Bartosz,

On Thu, 25 Sept 2025 at 09:52, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Thu, Sep 25, 2025 at 9:48=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Thu, 11 Sept 2025 at 12:02, Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > The (typeof(foo)) construct is unusual in the kernel, use a more typi=
cal
> > > syntax by explicitly spelling out the type.
> >
> > Thanks for your patch, which is now commit da3a88e9656c17a3 ("pinctrl:
> > use more common syntax for compound literals") in pinctrl/for-next
> >
> > > Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-=
v1-13-9f723dc3524a@linaro.org/

This is the origin link to the patch (by you) that started the discussion.

> >
> > Looks like you (slightly) missed your target. The correct link is:
> >
> >     Link: https://lore.kernel.org/aMAP9hAWars0T83r@smile.fi.intel.com

This is the link to the comment (by Andy) that questioned the construct.

> >
> > > Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This is a link to the discussion with Andy as per Linus Torvalds'
> recent request to use the Link: tag to point to actually useful
> information rather than just the patch's origin. Linus Walleij doesn't
> use b4 so the origin link you'd normally expect to be added
> automatically is not there at all. That's probably what caused the
> confusion.

I know ;-)

Given the "Suggested-by: Andy", shouldn't the link point to the email
with the actual suggestion?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

