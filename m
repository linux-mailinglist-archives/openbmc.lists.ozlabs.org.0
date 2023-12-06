Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 656BD8068FB
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 08:55:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VVyy1EVq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlV7K6WhNz3cY0
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 18:55:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VVyy1EVq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlV6h4RgNz3bYc
	for <openbmc@lists.ozlabs.org>; Wed,  6 Dec 2023 18:54:35 +1100 (AEDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-da819902678so4601552276.1
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 23:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701849272; x=1702454072; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vD+wz+truJwVuJlpRsAp0VhmJ6NeBsB64og7Q/El6SI=;
        b=VVyy1EVq4QXPLBtZQSJ1u1cCAmita+Wia1MvhyKnc/M1S6KLA7x/1q9nm819UZEO3T
         1JZV3KtiZsb5quC10XFj8v4qDu/f7J0H3Mk3Ra/LcjMhpbJ9RY/eQoXghPi/2e4L3dMu
         HAr1xjgXXqTGPKKBDNZ+AO/xPc4+ISE3OMaG6+ZyxuV/M7iAJ0YLKVTNEZI8Hb3YLI9z
         vaWtRnsKtkjmK0Y6FmSXGPPzkDq5L/dpzy0lxjg+FViWGpts1KmJYWDBjfPl9fvvXnFH
         /RFjr4AhFSvc2LwCtEE/985KC5RMJXabctxZN0c4YQuKLZtmnzjkHp+lLDzpuW6wdtcR
         XSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701849272; x=1702454072;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vD+wz+truJwVuJlpRsAp0VhmJ6NeBsB64og7Q/El6SI=;
        b=hGkrP70x3DSwkG7Bzt0Qm4k5W8PGOhD5GiMg/oqKzD2T0hnkM6tRaehT+6LKoADQiu
         77nH5DHeJ5WL0E3/l8pfOFuWogluiojj0FyTbA2rTl44LvN+eiYdye7DvHSA0LuIuCjY
         FZb9ulKgiOgfBDYOJBV7XjcXUEaLSGwuLImNNxWpwPwJhu601x12d70jpnhmAruHh1Hu
         54lVTjr7XGGm279u5tvSsYLJ/kUFUEonu2wfbv/+AZHGXqovuyHzihSczLB3zhHnx7Qj
         ylE0iiMOVhPpEAMbQoIduvipG7PQKRrm9/bQlcJctSgIgrdRpVJllcAakKdWHO9C/ipx
         RMXw==
X-Gm-Message-State: AOJu0Yy1PfIYstc0m/0nGCddFeMzyu+Gdls0AOfTPoPCHZxN0GpsxOQ8
	KwvUQDdmtbuKY1rIJE2xk92ireF/yZD9khaA4jUEqC8u
X-Google-Smtp-Source: AGHT+IElLOKSBgvqhG0DT3k8Dnja7CTb8SchlwSUYGe/iAaBKiiAaLONMc6GY7GjvZNhlCbG7/tu/ITRKBHAJQN41F8=
X-Received: by 2002:a25:27c3:0:b0:db7:dacf:2f0f with SMTP id
 n186-20020a2527c3000000b00db7dacf2f0fmr322621ybn.86.1701849272124; Tue, 05
 Dec 2023 23:54:32 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8Xfgwf58Usn0FSWYigD2HbwNKh4DTLX+HLE36HbMC7D1JQ@mail.gmail.com>
 <CAP6Zq1hNZTeSgRLPb9bDqsU0JCChgaGX2Gth67ru_K_c2tOdJQ@mail.gmail.com> <CACPK8Xd1apLDqmatNgRVqq7UPaACMyvue-52ac2da5TsbJ-Y8A@mail.gmail.com>
In-Reply-To: <CACPK8Xd1apLDqmatNgRVqq7UPaACMyvue-52ac2da5TsbJ-Y8A@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 6 Dec 2023 09:54:21 +0200
Message-ID: <CAP6Zq1iRD+ij92LpOgTO0oFRB7gnz4udLGJPgY=fOjkD+UpFxA@mail.gmail.com>
Subject: Re: OpenBMC Linux 6.6
To: Joel Stanley <joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Will send SHAs of upstream drivers in kernel 6.7

Thanks,

Tomer

On Wed, 6 Dec 2023 at 09:46, Joel Stanley <joel@jms.id.au> wrote:
>
> On Wed, 6 Dec 2023 at 18:13, Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > Hi Joel,
> >
> > Thanks for supporting kernel 6.6
> >
> > Could you add the following NPCM drivers to kernel 6.6.
> >    support Nuvoton NPCM Video Capture/Encode Engine
> >    Add Nuvoton NPCM SGPIO feature
> >    MMC: add NPCM SDHCI driver support
> >    hwmon: npcm: add Arbel NPCM8XX support
> >    usb: ChipIdea: add Nuvoton NPCM UDC support
>
> If you can send SHAs for the upstream commits, we can cherry pick them.
>
> If they're not upstream, but someone is actively working on them, then
> please post the lore links and we can look at them.
>
> Cheers,
>
> Joel
