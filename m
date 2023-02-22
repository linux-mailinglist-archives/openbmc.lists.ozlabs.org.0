Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 238BC69EEBC
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 07:26:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PM5l16ffRz3Wtp
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 17:26:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=my63DV2m;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=my63DV2m;
	dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PM5kN59Npz3Wtp
	for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2023 17:25:30 +1100 (AEDT)
Received: by mail-ed1-x52e.google.com with SMTP id da10so27389416edb.3
        for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2023 22:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xSaeM+V+W/vOhqPFaWMsBr0Jhkx22GmDBmG8JpaNN5w=;
        b=my63DV2mSH6wLtoRZk58/y5IT3clNpQQip9bmF7TZoJdOtXrgD7XpSmCpf13YuTqsm
         fB7NaAMYyA0fY3GXuYkxrioPzRrdrvwfmsT4I9bFzMN11jriyg8S2ntmSfPC3EH4B23S
         nh/umoJnXZAgvvTkPmUMLYq/21dTgCzzz1WMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSaeM+V+W/vOhqPFaWMsBr0Jhkx22GmDBmG8JpaNN5w=;
        b=GwXWux6p8BeG3k6/wtA1l5qj/VrblE+u1Usvx1keyXhHmXowbK6f/NiBBJ8P/8EJwa
         J08KUEhqGMxnlOdhwe+rDGezc2MVboe4cIjVWHibE1O4XBDYKCbnP/NaV8XnSHUwQ4pB
         dw2akppuFJpPAi5JV7BnUtDRhas1poefZV+ogfQyiKqVl1aJWSnSTRGo3VmkNU1+nXQm
         9Du9tY8QDnlGtWtI9RD+adVzGK+2Wuv8DbFoWaHG9sO20Rcc6m00LRdnlXznmnC2bbev
         TZnPmsFSiKG8XKnJmYZgNP+YpL9PPnL2m61mIM47o/gpXnHFRUxwPm2n6AtG0EP3GSvL
         sFRg==
X-Gm-Message-State: AO0yUKU1Uv4gNeXZMwGz184QuXTjVg5M8DVir/7pGumYJfSK6AFNogkb
	R4hGTLk8h9GAZ3avu6Dm8t3cBuSH/Ts0XK3McY7uOItv
X-Google-Smtp-Source: AK7set8+JDdmHb7OfR1CbfwVckkT+buCR8no+ElhGib3lY3qR8jVmN32NRiH47zGaeJkJb72dbw6gcPre+lpUM5b6kc=
X-Received: by 2002:a17:906:8144:b0:8e3:da0f:f9b7 with SMTP id
 z4-20020a170906814400b008e3da0ff9b7mr1421855ejw.4.1677047126126; Tue, 21 Feb
 2023 22:25:26 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8XfAtPfUxBP92iwqRpnaRgP=51_SyuYsxCrpk3MQ9do6WA@mail.gmail.com>
 <Y/WyIjpX/T0g9RdP@fedora>
In-Reply-To: <Y/WyIjpX/T0g9RdP@fedora>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Feb 2023 06:25:13 +0000
Message-ID: <CACPK8Xf-3Du23NZDGR_SkPUmDT96=E3PH-FVzDSBZ6R55kooRg@mail.gmail.com>
Subject: Re: OpenBMC Linux 6.1
To: Tao Ren <rentao.bupt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 22 Feb 2023 at 06:11, Tao Ren <rentao.bupt@gmail.com> wrote:
>
> Hi Joel,
>
> Thanks for the update. Let me move some Meta/Facebook AST2500 and
> AST2600 Network OpenBMCs to v6.1, and will share my findings later.

Thanks Tao, I appreciate it.

> Besides, could you please share your long term kernel upgrade plan? For
> example, are you planning to align with LTS kernel in the future? Or the
> ultimate goal is to upgrade openbmc kernel whenever newer kernel is
> released?

Somewhere in between those two.

If we were to wait 5 or so years between updates, then we remove the
motivation for developers to upstream their code, and I imagine it
would be a headache to hunt down regressions when making that big
jump.

On the other hand, management has been trained to target the stable
releases and somehow consider them to be better than others. I argue
this isn't true, because the code is only as stable as the test and
development resources that are put into it! That said, it's less work
to merge in the stable tree every week or two and test that than it is
to do a new rebase every three months.

The ultimate goal is to have all of our code upstream, and just use
whatever kernel yocto has. We're pretty close for aspeed machines; at
IBM we have some downstream hacks for misbehaving i2c devices, and
some device trees for pre-production hardware that have minor
differences to the production version. If we were to upstream the
hacks for i2c devices (or stop using them) then we could ship upstream
kernels.

Ultimately it would be best for the project if we used the latest
kernel on master, and had a LTS kernel that was used by product
branches. This would require the project to fund someone to do this
work long term, to ensure the stable updates haven't caused
regressions, to cherry pick patches that fix code that was not present
in the upstream release, and in their remaining time help get more
code in mainline.

Cheers,

Joel
