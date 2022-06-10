Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BD354664B
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 14:09:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKKWQ6xXhz3bxt
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 22:09:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CnEadAgd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CnEadAgd;
	dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKKVz54BGz3bd5
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 22:08:42 +1000 (AEST)
Received: by mail-ed1-x52a.google.com with SMTP id d14so9441699eda.12
        for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 05:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=slGf5UPUJD+FOJ5RtcL7DyYXgDFT+Di1f0bhg6krmAc=;
        b=CnEadAgdEmDcZdmcLbtXm+FSi2GttAp63gibCxB07vUHVPX2bVaCLw+fSI/ZESBCql
         E4BmgKYXSLBKAY2MMQRl6Vdz4PDJcXZBi4orN+JNWnZd9IR7dtX1Tk/xuYDyvITeh4CS
         5BwEl/EaZkIgGnSllRLU9O4vczCAqg0zwJQFbemV9gnR2pS4zu0+RTbw+tzYROW2gyP4
         WIS8X1Na+iVcBztKZCvMLe8eWYJDtlbWnaK17S7K2qfsvs4RuhR33D2tp+1LieXBUCEe
         xocsb8eSZ398w/MYOme0cHzHQafXCV7yG0ZDq+8Yd4pYWBsCPfjD2plp4f8kfRrdb8jd
         JVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=slGf5UPUJD+FOJ5RtcL7DyYXgDFT+Di1f0bhg6krmAc=;
        b=G8CJZVX294BWOy+CZOK4Cp2liI7qQZjvwYGxNbQGxrjAS8SQFkL+izqxuF+I6JFoim
         Yu8uq1JQObBr/RwDqjGfPc7O5VkL+kj9ZhrvWglUjext3/5bR90A6oipHMNl7bZ1jy0v
         ervAihUgfWSTEzPeNLXa+seFMFjcRdXBzhzy9UdGBMQEtJQBqzb+gW/28mkMJ0Jn5GeE
         H+vhpDl7x+FlZRfHiiuvODHSMxOswPQGM3NcUlatxCi8ZaIPMiYlWseFagK06+RLZi9b
         B9RwVcPQVo2Tf5RJA8PFPSGiJNQEavEzIecuMzSZGh3IpyDKAu/NAIW/PTm5xrOD5lTe
         BY1Q==
X-Gm-Message-State: AOAM53204B39qhltM3xBEkfwCwQgMTGq0hd5voRzWP3Te27g565cyVPw
	FzsotwCMXljH1t+XOdUpy5kVIZtcC4b9+Hw/+X8=
X-Google-Smtp-Source: ABdhPJwcbsm+AWZqmlcmPp6nYdIM/hwB+m1xykYTiv4bhON4DleRXkrUlagPv9jHx05IEUJzM86JgTIAr+qtNpGl+eo=
X-Received: by 2002:a05:6402:4390:b0:42e:b7e:e9ac with SMTP id
 o16-20020a056402439000b0042e0b7ee9acmr49789045edc.97.1654862914889; Fri, 10
 Jun 2022 05:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220610001609.276220-1-j.neuschaefer@gmx.net>
In-Reply-To: <20220610001609.276220-1-j.neuschaefer@gmx.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 Jun 2022 14:07:55 +0200
Message-ID: <CAHp75VcLn5Ue0efoH_3kKJJqrD5OMbvetPh13FCQFshG9hnN9w@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: nuvoton: wpcm450: Convert irqchip to IRQCHIP_IMMUTABLE
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jun 10, 2022 at 2:24 AM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
>
> Commit 6c846d026d490 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning for irqchips that are not marked with
> IRQCHIP_IMMUTABLE.
>
> Convert the pinctrl-wpcm450 driver to an immutable irqchip.

...

> +       gpiochip_disable_irq(gc, d->hwirq);

> +       gpiochip_enable_irq(gc, d->hwirq);

Can you use the helper (*) as stated in the documentation?

*) irqd_to_hwirq(d)


--=20
With Best Regards,
Andy Shevchenko
