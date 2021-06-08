Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B851139EE86
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 08:08:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fzftl1tPdz302l
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 16:08:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=bTez0Nct;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82f;
 helo=mail-qt1-x82f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=bTez0Nct; dkim-atps=neutral
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzftT02nMz2yWT
 for <openbmc@lists.ozlabs.org>; Tue,  8 Jun 2021 16:08:16 +1000 (AEST)
Received: by mail-qt1-x82f.google.com with SMTP id u20so6234801qtx.1
 for <openbmc@lists.ozlabs.org>; Mon, 07 Jun 2021 23:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=thNwsD6YD7o2DFCIlJbwapJIqPzTG6T4COz7h9VMOzI=;
 b=bTez0NctqXdG62mJ539TtKRpKGaDXp2DIdibrzmIjuUM3vpFdYokvpd+1n9yKyVBny
 W+xxIiYaxsvyYYCy9/AO4vYgV5VV2cK20qGmXu+dVlknIpemJqfkAbpuStOVEee11Tdz
 ObWKspJCynUiVUZUJjqQ8naRQDVE738rRWm2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=thNwsD6YD7o2DFCIlJbwapJIqPzTG6T4COz7h9VMOzI=;
 b=Semf8FHhWfYl1pv8ifgKy70ztRWjPL4apKqryjIx6vkYRtOiWrR1tCgmQRUsyv8FCn
 6jt4lgxEoQAzDztqM0I2jzzpHugcdZC8bWtRBVAx0VGahhrEEiG8W59f4VSl1tp4XU6S
 ZmBFueQNRXzGp463B+R2RvIymsGcqzmfbJ8q9h4orSJZ6gNMI/s3/A1WagqAs02vWxh/
 FBUGmkyS6XhFSmZoSG7DAgcxxRJegmdLvq1ZNQAxR86MOtLvIeDmDjrUyA2jt+T08dQ8
 XEkZ8zd+yeMzx7MAQGKo9TK8iKxQOr38ibk24S19FJiU+/qLlW/BSH+k5acFQ6pWh3NV
 ki3g==
X-Gm-Message-State: AOAM532tDkuqtoYpq3oszuufFoR5Wp67dFq6zohOJ2+3jnrzT9BmcseT
 xnXTmWOh606JaCXUb3udncUjeKX3iOANB3gatBk=
X-Google-Smtp-Source: ABdhPJwVTTOknF0H1vF3gnNGRVWi1pJmxLP1PVmTMpSEQif7rTB98hH3sDrgPaqT0x3I6jpGb1+GTHYjU/+Rwfa5Ex0=
X-Received: by 2002:ac8:4803:: with SMTP id g3mr4432330qtq.176.1623132491945; 
 Mon, 07 Jun 2021 23:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <ME2PR01MB56196A14C09EA4391F4C04E0FE3D9@ME2PR01MB5619.ausprd01.prod.outlook.com>
In-Reply-To: <ME2PR01MB56196A14C09EA4391F4C04E0FE3D9@ME2PR01MB5619.ausprd01.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Jun 2021 06:07:58 +0000
Message-ID: <CACPK8XeNJjh=3b1gQ5Dv0vVcSCZEei0MSMF0BMV2proeFn6Jbw@mail.gmail.com>
Subject: Re: cannot modify the files in the overlay file system
To: =?UTF-8?B?5ZGoIOi/nOa4hQ==?= <zhouyuanqing8@outlook.com>
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
Cc: "uperic@163.com" <uperic@163.com>, openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2 Jun 2021 at 12:43, =E5=91=A8 =E8=BF=9C=E6=B8=85 <zhouyuanqing8@ou=
tlook.com> wrote:
>
> Hi Team=EF=BC=8C
>
>    mount command is follow:
>
> mount -t overlay overlay -o redirect_dir=3Don,index=3Don,lowerdir=3D/run/=
initramfs/ro/usr/bin,upperdir=3D/run/initramfs/rw/cow1,workdir=3D/run/initr=
amfs/rw/work1 /run/initramfs/rw/merged
>
>
>    After I mounted the overlay file system , I used vi to open the file (=
vi xxx.sh) in the merged directory, and then when I saved it, it prompted "=
'xxx.sh Invalid argument". Can you help me solve this problem?
>
>    On my system, this problem occurs probabilistically on openbmc 2.8.0, =
and the probability is very low; but on openbmc 2.9.0, it must occur.
>
>    openbmc release version :2.9.0
>    kernel version=EF=BC=9A5.10.14=E3=80=82

This kernel has known bugs and security vulnerabilities. I suggest
moving your kernel to the latest form dev-5.10 by cherry picking this
commit into your openbmc tree and re-testing:

git fetch origin
git checkout 25633f1351521fd26469b21ddbe339e3f874182d --
meta-aspeed/recipes-kernel/linux/linux-aspeed_git.bb
git commit -sm "meta-aspeed: Update to latest kernel"

See if that fixes your issue.

My guess is you're using JFFS2, and you lack a fix that was included
as of v5.10.36.

Cheers,

Joel
