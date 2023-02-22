Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E94969EE73
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 06:39:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PM4jN0KmRz3c3G
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 16:39:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=U7n6PVTG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=U7n6PVTG;
	dkim-atps=neutral
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PM4hk1zCmz3bgq
	for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2023 16:39:00 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id f13so25337980edz.6
        for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2023 21:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ONjmtB6WJmDNV/6zXP0alTVBJzfj8YtDX/Kumkkin0=;
        b=U7n6PVTGx/LMcp+df0qppEcSnBkQBbSPEkPo7mHncDu82ou7xcEyi+oQUgPajgZ6WX
         fwHe/pTMeX8zvtutYmESiMtZrTFrc1FZbQ0brM9Wc9KXShGwfU9le/Hi5jbYkUetn0rW
         UUlDZiCl3y0iccOx4wqPuR/pdm8zG0NMf4xsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ONjmtB6WJmDNV/6zXP0alTVBJzfj8YtDX/Kumkkin0=;
        b=hPfLlHr6Y0pEVFNoI1jWYxarrd2eAytOzVahUdA76Cd3QIPVBfJO89M3chds0a3R9L
         kCmB9LLQuSHMEO904brjrP6Eaar5UBMsMVVSYGCb7xU8NnJWO5mkRs6U7ifggfmuR1bb
         fzEsOW/qSzN1I5pBm6/VX0k+08IjUziVjSH7rQ3s4OSctZqSuRm1zUBRqCA4eY+xU5ag
         e5Zy5zhDkhTyf0hQ9sSCJ+TCcJ/ub3Dph7+zdAAY86Nms33PfwH/wV5eAY3wrDlwviQS
         ElaF7QgItlhdGFNrK17BxJHbyOKtt+sIuvkT1kOE13OcVc0vv1d6nfQN4s4mWbIgI/+w
         778g==
X-Gm-Message-State: AO0yUKV7jUE8OYtjrM4aRa0+7hxR3Zkw4ChD/FFmJb54hFpmtEw8Nxhh
	ccdGlMaygUx28YcGu7nqWo5CqYnuOMF5X/tdNCY=
X-Google-Smtp-Source: AK7set9c6COq1lpbnT43L1hRQUqgAnttY3/Sd/9Nxkj5Hr72VttligKjILVfrouMeI34h1e3VpxDYLHnPoun4IL5LHE=
X-Received: by 2002:a50:8adc:0:b0:4af:515d:5691 with SMTP id
 k28-20020a508adc000000b004af515d5691mr2459480edk.7.1677044335515; Tue, 21 Feb
 2023 21:38:55 -0800 (PST)
MIME-Version: 1.0
References: <MA0PR01MB6812A470837194C53182B5ACF9A09@MA0PR01MB6812.INDPRD01.PROD.OUTLOOK.COM>
 <20230217200141.GW18848@packtop>
In-Reply-To: <20230217200141.GW18848@packtop>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Feb 2023 05:38:43 +0000
Message-ID: <CACPK8XdYeewmx6MT3P=t+sw5D5e=1v5Ow=+yPKa6rpw3OB2XLw@mail.gmail.com>
Subject: Re: What are the login details for AST2600-EVB core-image-minimal ?
To: Zev Weiss <zweiss@equinix.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: Ranbir Singh <saini.ranbirs@outlook.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 18 Feb 2023 at 02:19, Zev Weiss <zweiss@equinix.com> wrote:
>
> On Fri, Feb 17, 2023 at 03:49:36AM PST, Ranbir Singh wrote:
> >Steps followed
> >=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >  1.  . setup evb-ast2600
> >  2.  bitbake core-image-minimal
>
> Is there a particular reason you went for core-image-minimal here?  The
> usual OpenBMC build target is obmc-phosphor-image; I suspect switching
> to that will solve your problem.

The evb help text suggests a few different targets. I added them
because I thought it made sense for building a basic image for booting
on an EVB, where the host is probably not present.

C=C3=A9dric reported a similar issue with the password. In the past I
couldn't reproduce, but today I could with core-image-minimal. I
suspect there's a bug where some settings don't trigger a rebuild of
the required components, as I had trouble settling on a setup that
gave me a working password.

I did try adding this to build/evb-ast2600/conf/local.conf:

EXTRA_IMAGE_FEATURES =3D "serial-autologin-root"

Which logged me in automatically.

The yocto docs also suggests this method:

https://docs.yoctoproject.org/ref-manual/classes.html#ref-classes-extrauser=
s

We should probably add a default password to the evb layer for the
non-phosphor targets. I wasn't sure how to pull in just that
configuration from meta-phospor on it's own.

Cheers,

Joel





>
> >  3.  qemu-system-arm -m 512 -M ast2600-evb -nographic     -drive file=
=3Dtmp/deploy/images/evb-ast2600/core-image-minimal-evb-ast2600.static.mtd,=
format=3Draw,if=3Dmtd     -net nic     -net user,hostfwd=3D:127.0.0.1:2222-=
:22,hostfwd=3D:127.0.0.1:2443-:443,hostfwd=3Dudp:127.0.0.1:2623-:623,hostna=
me=3Dqem
> >
> >The image boots up, but default login root/0penBmc doesn't work ...
> >
> >[cid:69893ee8-08f2-4702-9c0b-241ebac25eea]
> >
> >Typo has been checked multiple times =F0=9F=99=82
>
