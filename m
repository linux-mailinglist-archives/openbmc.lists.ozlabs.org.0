Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD619327FB
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 16:05:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VGd+BiMu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNgnJ4NC8z3fTJ
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2024 00:05:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VGd+BiMu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNgmh4KPqz3dk2
	for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2024 00:04:35 +1000 (AEST)
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3d9da46ca13so2951714b6e.2
        for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2024 07:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721138673; x=1721743473; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kNTexp/SoKJmQTO0SdE0gb+btZcTzeLvyhKTaM3styo=;
        b=VGd+BiMuPQSk8YgBwC7pozXLBcyP+KS/OYXF4Z7UrnklTRShtLcq7PAl5Ny/w2cP/V
         pWyx+XkPxGuOW0XdJLUQEidnpebLKAZDHXVkkgsbvXp6EqUdNVgep6AmrCGX575sFO3h
         myedYYda/cWNGNcnjA7jbfWrdvdHA5ddWGI1LozBBiEeqI9SN42VkbYS/fJDO+ycZc0r
         svPUvlj6DDrPNlRPQxWWV7+3pfznMpW7yMYq+JLJ5kdE49pgobkl/kwBy5m3Twzfgt3J
         896Pn6F7zQHGWh37u6G5fzyFsDzoHvZyD1uagwtkvfGTMdXn6YzNDx949iCndUERAOMl
         +AzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721138673; x=1721743473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kNTexp/SoKJmQTO0SdE0gb+btZcTzeLvyhKTaM3styo=;
        b=wb3KU4PUWytDyiRL6AHmsZjGUb8lte3wlZLA6DF0CPhNOUbZXyggp2QZHqozpUiIzA
         SKFPKWwfp1P5rcaqEJVEWVKOajiVWOVUc1m/NmF7mXvMt4r6LwPau5ufqe+XmfPjdaZg
         8SllMt39G8VFJy5SpgzSJVnciHxtuiVn0PtHR8fKcrSARruqUlLUoDeB4l2zQ4lyY7Ei
         R/AssKqS9qILju9ctltSAqVmDL5BMnEdtR+AaNtLYJmbRxMMIg3mW5ZeOATTxJ+Kbc8z
         LRJzARJJU0CMCbrpAHsONToWNUrRP4OQ0LUb7E5BwPYKsw+lwhr2PiqK5uzT6v1LTyq+
         53Cg==
X-Gm-Message-State: AOJu0Ywb/j8ANBEib7DzInP+KDlY/iOfM23cYmSRy+4/GZg33bVDdEsW
	Ftg6k/LM8uTG6e3R/m8m+inmIiCVKob6ZXrMIKTyttxXspRJToHxwtnQSobaBRjT8v1T+baTJIa
	XkPxmlJMxZYnD/mo70jbjwNf4bXBfHSqk
X-Google-Smtp-Source: AGHT+IEKPhc/dQYXxhHIj5ku+mYdZnv+5nwufAb2zOY7XVAsSaOmAXW5AGDQ4M62omfgbkTFIjZD47haG1hG2aI2RLY=
X-Received: by 2002:a05:6808:10c5:b0:3da:a793:f111 with SMTP id
 5614622812f47-3dac7b51b46mr2899472b6e.8.1721138672628; Tue, 16 Jul 2024
 07:04:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240709184813.1946724-1-tmaimon77@gmail.com> <eb1002c1ab0214dcc91526462e4f3694ab465561.camel@codeconstruct.com.au>
In-Reply-To: <eb1002c1ab0214dcc91526462e4f3694ab465561.camel@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 16 Jul 2024 17:04:21 +0300
Message-ID: <CAP6Zq1jU7+fnUuGED5ZrMDZR40R6c3ZxfoTXmy6=eT3BFu=0cA@mail.gmail.com>
Subject: Re: [linux dev-6.6 v1] spi: npcm-fiu: add dual and quad write support
To: Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: openbmc@lists.ozlabs.org, Stanley Chu <yschu@nuvoton.com>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

On Tue, 16 Jul 2024 at 06:24, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Tue, 2024-07-09 at 21:48 +0300, Tomer Maimon wrote:
> > Add dual and quad write support by writing the command write in the UMA
> > register first and then write the data in chunks of 16 bytes.
> >
> > Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  drivers/spi/spi-npcm-fiu.c | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
>
> What's the state of this patch with respect to upstream? Is this
> something specific to the openbmc/linux dev-6.6 tree, or is there an
> upstream equivalent? If the latter, can you please link to the relevant
> patch?
This patch set hasn't been upstream yet to OpenBMC vanilla and it is
not specific to openbmc/linux dev-6.6 tree.
We will do our best to upstream this patch in kernel 6.11 (We already
have a lot of patches to handle in the next kernel version :-)).
since we need to upgrade the NPCM from dev-6.1 to dev-6.6, we would
appreciate it if you could add it now to dev-6.6.
>
> Andrew

Thanks,

Tomer
