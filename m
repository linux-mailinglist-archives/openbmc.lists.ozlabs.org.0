Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E9270687F
	for <lists+openbmc@lfdr.de>; Wed, 17 May 2023 14:44:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLt951tPzz3cT4
	for <lists+openbmc@lfdr.de>; Wed, 17 May 2023 22:44:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FMlLS0aE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FMlLS0aE;
	dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLt8T4xfQz3cCy
	for <openbmc@lists.ozlabs.org>; Wed, 17 May 2023 22:44:09 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-ba82d82bd39so923577276.2
        for <openbmc@lists.ozlabs.org>; Wed, 17 May 2023 05:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684327446; x=1686919446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNevE736BEsxBU0FmwLJIhGqBiG7yoAC/t6/uUIBMdY=;
        b=FMlLS0aECYmfOvG19PTRQ4JzQVOPvgp3keEl4q4lBIcarONNex1FSS2aSSOrdLjxfE
         OYiPfSd3p8dfD1QItx7D8wl2cvYk/x1+YjFMYiLcupDwHagK7bMFjrihVjrw89h1isK/
         BL8m4dOesp9dOvFJIsPhRXwRJJZw0WXMjrRaZLCGs1aGyZghu3sRXCSFqAbHEbi4bEe9
         sb34beQApq2PcsJ82bacmFQQUt6j72BaQNjANrnbsGmWxQJeZKXoqvssjMl8KTkBxSm2
         hNmUL8hfNmz56/sTiGz6zGIXfLgQdcu9zLtf9Q3wfq58AlUNYHc4mTp5/+V36z6r3Z0n
         03CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684327446; x=1686919446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNevE736BEsxBU0FmwLJIhGqBiG7yoAC/t6/uUIBMdY=;
        b=WC3qHAXPyriH/8XwsRYBLky2dz3+oKM/uHG8u6cOSNz2qT12CacGEYb0UXGnf1x217
         50x+ugfOxym/g6pjXhMexsAZtnbNVg1Xe5G3z7eOFZ8FPg7vVGm2OIglvm8i6Lj87SFy
         XaE5Tp0KqUiIAVfrEKQGB7GvUTIrRyU/frhBoE4Aw9+yJBDo4ZJYaH7lCMjMT+QBIfnV
         OMjBmCZ7Ohr+umcIkuocGw6OOkibIYvq5XIsCWZmgs9Gu36KC2xNHYLY6bPL8Q/6ROId
         dDdwL2q5B9RzDoUP1By20FBzmxBPymCAAf15C1ft4VvUfpy/u8Q50MGNl0yjAZMS6Rlm
         w4uw==
X-Gm-Message-State: AC+VfDyMUkOO/6gmN0+ppZON2IsPbhxLRGuvkjpySxJ7ZOksgjYODeSR
	eTyjK1I+zUZN0vs8iwMmFpqIKwZx+MS6Z4TAvWCo6A==
X-Google-Smtp-Source: ACHHUZ4prpZ1ZwoDxxoHkrbtIQ9L4j9bzrbZd//ns/O1W/Gj5TZTAbzyimVq3qT7URmcD+Feztnv9pZGkl2jlaxwl+I=
X-Received: by 2002:a25:1504:0:b0:ba7:382f:6380 with SMTP id
 4-20020a251504000000b00ba7382f6380mr12543280ybv.24.1684327445737; Wed, 17 May
 2023 05:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1684220962.git.mazziesaccount@gmail.com>
In-Reply-To: <cover.1684220962.git.mazziesaccount@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 May 2023 14:43:54 +0200
Message-ID: <CACRpkdYPZWNTOW6c0q1+q64JRvxUXswQqm6j5N5KaAWO=sSUaQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] fix fwnode_irq_get[_byname()] returnvalue
To: Matti Vaittinen <mazziesaccount@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Eric Dumazet <edumazet@google.com>, Daniel Scally <djrscally@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, openbmc@lists.ozlabs.org, Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Michael Hennerich <Michael.Hennerich@analog.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-gpio@vger.kernel.org, Andreas Klinger <ak@it-klinger.de>, Marcin Wojtas <mw@semihalf.com>, Akhil R <akhilrajeev@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, netdev@vger.kernel.org, "David S. M
 iller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 16, 2023 at 9:12=E2=80=AFAM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:

> The fwnode_irq_get() and the fwnode_irq_get_byname() may have returned
> zero if mapping the IRQ fails. This contradicts the
> fwnode_irq_get_byname() documentation. Furthermore, returning zero or
> errno on error is unepected and can easily lead to problems
> like:

Also, zero is not really a valid IRQ, it means NO_IRQ:
https://lwn.net/Articles/470820/

I'll apply the pinctrl patches.

Yours,
Linus Walleij
