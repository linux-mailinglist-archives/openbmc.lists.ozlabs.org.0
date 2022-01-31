Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC1F4A3D9F
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 07:26:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnJ3n0nHcz30Nc
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 17:26:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=KeQGfGMB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=KeQGfGMB; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnJ3Q2443z2xtb
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 17:25:54 +1100 (AEDT)
Received: by mail-qk1-x729.google.com with SMTP id q5so11262483qkc.1
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jan 2022 22:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sh6/md4TVQwI4283Z8NYZNLaKEbb8BwCsE4OhdLwW/8=;
 b=KeQGfGMB0cAznF6f7a5ppMjAfg46LBj40IlTn5vMHXi4M0JaeY+voL7Tjjm6FhgQM0
 256/0nBE4ZD+OOo7AcVt6cwPmt5uhK5AFH0aMTq3hcEy9x13gaa4jd9SCLYuJAaSKe8u
 r+YFiacS8tKhhdGlprHzZTRL14/869Ye7qDjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sh6/md4TVQwI4283Z8NYZNLaKEbb8BwCsE4OhdLwW/8=;
 b=RGZrY7sbcbxox+rDT+pFsOdBPr9Lg74f+kpoxCX+8bH0NVPAcZCO41O0AOSwTjZZZ+
 IVzM7gzNHqkyef5SoCGFpG/hgdi0PuQPiiK1KkSKU81K1PFgE1pQHuXo4sMikI9XERC7
 lPJG3zQemECfNzefta8jw54fWwSe0oDLAr532pdi9UMsm3OgD+K6cacFAJUHruFuKMfE
 GV8I2hZD47fXMMxewDoVvBfdRKBCgUFzqi2FV59GKpyErEMLI07LNiylMhCJAsB3pAkb
 Bh4LpynrGYDdHybmRxPxa7inqudULXSwgshJxh5coVeIataKmMayZfI4W1rihsZV/4V+
 VmbA==
X-Gm-Message-State: AOAM531TRqNnh6zZSd4XU+JK2YTKgZ8PXsH6+VoOzRyMZ5IK+D8IB1bA
 HYc+GpleIPKqXp1LyJUM0uTumU/JF49r8y3pEUKX2BdR
X-Google-Smtp-Source: ABdhPJxrGrohbCh2UhiuQ6KlbZVU+0mGi2x/zB5FUQgAD4ClQXWR0dMOB+Sj1Y/t/9hqWMyOfKjLVXOpzochqwM/x+w=
X-Received: by 2002:a05:620a:44c7:: with SMTP id
 y7mr12608858qkp.347.1643610350504; 
 Sun, 30 Jan 2022 22:25:50 -0800 (PST)
MIME-Version: 1.0
References: <20211213194703.24060-1-zev@bewilderbeest.net>
 <20220125173206.GJ5754@packtop>
In-Reply-To: <20220125173206.GJ5754@packtop>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 31 Jan 2022 06:25:38 +0000
Message-ID: <CACPK8XcY3AURVWwKnhg1B_f_VFf4Qb8NfO6j1uKK60VVdBMmfw@mail.gmail.com>
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

On Tue, 25 Jan 2022 at 17:32, Zev Weiss <zweiss@equinix.com> wrote:
>
> On Mon, Dec 13, 2021 at 11:47:03AM PST, Zev Weiss wrote:
> >In order to support putting the u-boot console on UART3 of the
> >ast2400, this commit adds support for setting bits 22 and 23 of SCU80
> >to enable TXD3 and RXD3 on pins C14 and B14, respectively.
> >
> >Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> >---
> > drivers/pinctrl/aspeed/pinctrl_ast2400.c | 10 ++++++++++
> > 1 file changed, 10 insertions(+)
> >
>
> Ping...Joel?


Pinctrl is not my jam. Did you resolve Ryan's concerns?

Andrew, does this change make sense?

Cheers,

Joel
