Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8772AFF7B
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 06:50:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWrL25qcjzDqyq
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 16:50:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=BpoMJ/zF; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWrK9359QzDqwm;
 Thu, 12 Nov 2020 16:49:48 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id q5so4272047qkc.12;
 Wed, 11 Nov 2020 21:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4a2oSB1VYPakWNSHoJzJAW0JkOV/UfRXeOLulthOs2A=;
 b=BpoMJ/zFwtaKZkXrXCWPYeFmFimpEX1DySUcOH0lLRwFsEcVV1lOgP9b6OMXD3Zfs9
 KDB7YwsP7DDbnTzf3DCCMgnMWXuoCFrYFMmeGVWilof8Y65AfxJtkfasPsf6arrZFUnf
 CtH6k4zMiHH1KSGn1A+HzkRDq1qhYaXl9HJuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4a2oSB1VYPakWNSHoJzJAW0JkOV/UfRXeOLulthOs2A=;
 b=Iwo44sCMEQOUEBOoetipqaaNVFbSnG+jAO2Ze2yzvdxR8cooDPII0jbQoGsbwJVguR
 A1FTZFqmoifqG9Se/VpYeKa6zcMfMfBB3FsjvfmiTJpxpSlHYuXuzCHbRLPA2PkuzQbL
 1YfSLqEzlkKCQFz8LePK4A2camLKqwFiR5Bs1/gecpCfZVCQVwwxQ/2z8fMCKf9RlOCj
 dl2BGcf3vcanBI+3b8NO8JwYRXbr9YiywEw212xsNRxdGU9MWrGXKsuHXnwHk1uC0FJu
 hvIyaluds9dPZNjGZ98hr+Lyfv+En223xwVhBVvz9CuG+GhtSing+Ya6Tk7f0eSSNKvR
 Xcwg==
X-Gm-Message-State: AOAM5327ZXVoFOgKE1BtsLZEL+fijp2mVaLAEF++2bcHC1/iCtDunGG6
 wghn+vaBphzmpiF+EE3fudC6AQw2vbmFm0uRIrA=
X-Google-Smtp-Source: ABdhPJxU7xvfiJ65YQ5ovY7yFDZRtlv6qHOAerJCI7Uj6w7moqYf46aVjZDaxwp39Bj/PBVIUX/RBZi88EVUBvOqsgg=
X-Received: by 2002:a37:664d:: with SMTP id a74mr20150207qkc.487.1605160185441; 
 Wed, 11 Nov 2020 21:49:45 -0800 (PST)
MIME-Version: 1.0
References: <20201111232330.30843-1-rentao.bupt@gmail.com>
 <CACPK8XdC8FRKOLQ9e583gVuDrL5829MOfx5L=O68dou6mjW_6g@mail.gmail.com>
 <20201112031828.GA4495@heinlein>
In-Reply-To: <20201112031828.GA4495@heinlein>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 12 Nov 2020 05:49:30 +0000
Message-ID: <CACPK8Xf07AZNb3K76sDsZDHNOPuhpkkUGST0=RTCTS5BXgncmA@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM: dts: aspeed: Add Facebook Galaxy100 BMC
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Tao Ren <rentao.bupt@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 12 Nov 2020 at 03:18, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Wed, Nov 11, 2020 at 11:34:10PM +0000, Joel Stanley wrote:
> > On Wed, 11 Nov 2020 at 23:23, <rentao.bupt@gmail.com> wrote:
> > >
> > > From: Tao Ren <rentao.bupt@gmail.com>
> > >
> > > The patch series adds the initial version of device tree for Facebook
> > > Galaxy100 (AST2400) BMC.
> > >
> > > Patch #1 adds common dtsi to minimize duplicated device entries across
> > > Facebook Network AST2400 BMC device trees.
> > >
> > > Patch #2 simplfies Wedge40 device tree by using the common dtsi.
> > >
> > > Patch #3 simplfies Wedge100 device tree by using the common dtsi.
> > >
> > > Patch #4 adds the initial version of device tree for Facebook Galaxy100
> > > BMC.
> >
> > Nice. They look good to me.
> >
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> >
> > Is there another person familiar with the design you would like to
> > review before I merge?
>
> Also,
>
> Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

Thanks. I have merged them into the aspeed tree for 5.11.

Cheers,

Joel
