Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 648254AB532
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 07:46:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JscB10YP9z3bTZ
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 17:46:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=DMyz3gWi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=DMyz3gWi; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jsc9f3Zh9z3bTp
 for <openbmc@lists.ozlabs.org>; Mon,  7 Feb 2022 17:46:14 +1100 (AEDT)
Received: by mail-qk1-x72d.google.com with SMTP id g145so10196340qke.3
 for <openbmc@lists.ozlabs.org>; Sun, 06 Feb 2022 22:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2V7ikyi9HSru1dOMkuD/ELmw8QWMhd56JQyc0W6Pc+0=;
 b=DMyz3gWio+5RBItFS2YKPLzR1fdgQkQbN4bNn061suHX4Evt6+hboAi2Q/KAJ0hwa2
 qR/lL8/bOrg251KiYyXTCT17a5rhpKkfZfJkDwldfVC5WDFq1d3VhVFABHjYB97qXNrJ
 wfIzKr6YQDSUOITNcl9p41oGBNQv7P5vmsl7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2V7ikyi9HSru1dOMkuD/ELmw8QWMhd56JQyc0W6Pc+0=;
 b=oV/lxO0oMew/xw4Dc2bMAVJMhuPl8vUFTCNPWsFHUZry3uslUtpguBQobQLbKJjENX
 njYMl2YbJPIQgCB/axaWIdOHrwqHl5QfJsOCazpZh9OjvBLYCK5bcRmMHuP5UWIxcmVV
 naHB67dOIg+BH1z18xOasuV/dVpKrBNcuSvoFjBKZbiLrCivlvWvLm0KRpKbJN1H+JPU
 7DTFKjLOhWvhB29o0iaba5VV/WdRI6FB2gnbuk8/DLECG5fmvyZfxvRPG/D7O1Dcmx9V
 UuymKfd2PZW82yVGhosF4ederXQvGFtIZAiwbPOhq1K1bxyZfcl3Hr4cW+Tjvlm9xP2a
 e6/A==
X-Gm-Message-State: AOAM530k18WvHcNufQ1zL5I7DDYP2VadJWIgNoxo/vG+uGpDroxWcBEa
 w/5z0sFSVL+2jThtDDsfFDA/kj9yOlkwhbMnxX0=
X-Google-Smtp-Source: ABdhPJz1AqMFwgmyEvCW97mOf7vi65t0/vB/DJsPB5ZSUc4/BxD2Zd6PPwCMVRnSk4aR7WWqgZapvGpk7GYcI+GxvwM=
X-Received: by 2002:a05:620a:d86:: with SMTP id
 q6mr5521247qkl.243.1644216371814; 
 Sun, 06 Feb 2022 22:46:11 -0800 (PST)
MIME-Version: 1.0
References: <20211213194703.24060-1-zev@bewilderbeest.net>
 <20220125173206.GJ5754@packtop>
 <CACPK8XcY3AURVWwKnhg1B_f_VFf4Qb8NfO6j1uKK60VVdBMmfw@mail.gmail.com>
In-Reply-To: <CACPK8XcY3AURVWwKnhg1B_f_VFf4Qb8NfO6j1uKK60VVdBMmfw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 Feb 2022 06:46:00 +0000
Message-ID: <CACPK8XdupoOZwvOy-pAVaF5E0pYBFH5CxAXq7L6DDBVQydKMqA@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add
 support for TXD3/RXD3 pins
To: Zev Weiss <zweiss@equinix.com>, Andrew Jeffery <andrew@aj.id.au>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 31 Jan 2022 at 06:25, Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 25 Jan 2022 at 17:32, Zev Weiss <zweiss@equinix.com> wrote:
> >
> > On Mon, Dec 13, 2021 at 11:47:03AM PST, Zev Weiss wrote:
> > >In order to support putting the u-boot console on UART3 of the
> > >ast2400, this commit adds support for setting bits 22 and 23 of SCU80
> > >to enable TXD3 and RXD3 on pins C14 and B14, respectively.
> > >
> > >Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> > >---
> > > drivers/pinctrl/aspeed/pinctrl_ast2400.c | 10 ++++++++++
> > > 1 file changed, 10 insertions(+)
> > >
> >
> > Ping...Joel?
>
>
> Pinctrl is not my jam. Did you resolve Ryan's concerns?
>
> Andrew, does this change make sense?

Given the lack of objection, I have merged this into the tree.

Cheers,

Joel
