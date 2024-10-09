Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C9E995F3F
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2024 07:49:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNhmL1jjJz3byP
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2024 16:49:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728452975;
	cv=none; b=YAhsw3PxKCzwbJ5rmj5fZAPx62mBcKWrgCfnnNKs9c31pz0A/N4Tc9o6I9cF1hrqYufjAg+B0krZ2lwt/iMnMqA8Gn5QRLWrpnK/jhhhWh0MplnY7+fKobx6L7htSQKC4XvUcTfbjYNue8G1673TM1bnqjO09kubVYq7Z/JWdYXDUJhqi10ChEnv6brMQZtxdxB59MJf0gkQ76u9D+A4DXTbOt/Wfz89t4ncOZ6roRwv8IY17QLHAQ63GAvDTFgghfS1DtT10pd2v8DL+lYKbgvYPUts6FhuAHnvdksM2IFhqU4l+A3hPIV4igHXxpaFE2aBaIjzireMjp4o5bSZKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728452975; c=relaxed/relaxed;
	bh=ENzJiVPw0UBC+RQ8ra/ujHUBJgI6xVlyt2ZEDmcywEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CucPMsUWlvAwDd/caP741NNZwafBw4AhIj0TxpMdRhj/aoegCBxNY8XKVcKWp5/hC9YEXpGoyH+nYoelOE8MY2gm3hcaVzxVivg9bdmyPP94YiBqxqwSePYqgUbXjg5nIAvrgXXHr8PkZ2qDp+qregjppiL56fQlVHGOu8MzMhFV8IfZUt+96r0r8jNuI5W6kT0a0n6noWlc3c2qexCphWlZJ5eEefLueikNy5dealVGUx282MXV+e7JAzVJY8TkaHDO3ey8Jw4s1bHH4F1qw797eu++fucfLGRqBYbhdnLIjABOAY/XmBKG+D0zpiFw3BhTK+McKAc7nq/bvY0g/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Lv1LXuwz; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Lv1LXuwz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNhmG0kg8z2yNt
	for <openbmc@lists.ozlabs.org>; Wed,  9 Oct 2024 16:49:33 +1100 (AEDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2fac6b3c220so84213491fa.2
        for <openbmc@lists.ozlabs.org>; Tue, 08 Oct 2024 22:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728452968; x=1729057768; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENzJiVPw0UBC+RQ8ra/ujHUBJgI6xVlyt2ZEDmcywEk=;
        b=Lv1LXuwzZP1Yzb6dJzpGloJZMKZRZUfIjHuhn8yFfmNvE2huxgegQjc5jzsLlxYGgV
         /XhCe+08xxrRu5mn8EBynyBBXX0NRt8/pxJxV3mcwD2Sgjsz3DY96iHe2QtSFZE/WQup
         B6DhuDsNoTGM31wwbHiXhDDBeOPhsFCd/eftjCUZyutT+dAoP3F5SJIiPbRCgj003lPz
         sZVTAbcgr/hq0s3sEVs18jRwiVfL4FDi0ndjnS2jHhGzMEycl4FWXl/VJix5uj8qxhYB
         +Vuhh6CSHTd7gu7LzGnUAct5TuyeFR53FmZK/H8vzgwk8+MuJrKUWH4xgzdwwyGF3826
         Vwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728452968; x=1729057768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENzJiVPw0UBC+RQ8ra/ujHUBJgI6xVlyt2ZEDmcywEk=;
        b=BhMd3v3+njOJCMmbE1YxU99bVS6wJYgrbEXxW9lnAiBrHkoHloSk73wf3Iq33q2aKQ
         Vt+tredCI9UevRp4oJII2Z5c1cQuevAiu59f1ZHGDlxsbI96dnJ/A9qIW3n0FXTxO4k+
         /zi6aDl2VutfTcDUOMgA4ePDBU7aLpKUa8T+1ncczSxfiOONWZkAvJCK2XVa3xqUOZTb
         1+myKzfQu/U/ZMxBzi5FozIdBxEa/k/mhVGhaZ/ekzSA1RacgrE8wn5qfAk/4y87YszF
         8ebFQPKAvWh7EUL6nwxcGwXgN5nos0Af5onowrsHyofWTezzpxBROkQNwCdrx1M9fi7n
         MNMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMYqA+IwzQ5W6hiCD+cIwdmP4TlbtptLSn2gFmhQUCKQbPQlUAbu/y9UwOa/0GWtXvYTsKF/Ko@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwfuCOb7czcSf/byBCZEG2tWUcaiqYxW0qnk1a/Cw6HElGKw8pU
	rxqcpOnPIx55cfLXUm8k90/tTW4QJqzZVxdRCDTPvFX36krEwpkvWaQ6bI6SbFeolOQ/tXQV3Uh
	4vzPESTijjGL3ub6uChv+PbUu6w==
X-Google-Smtp-Source: AGHT+IGLqQ5d2U9Klq5WUN9RsjfD8ri5xLAqxNv5oCLfDG2Ji5z4WioYXHs5RThMrB2q65gGd1H1fT+pZ98MS9/kc/A=
X-Received: by 2002:a2e:859:0:b0:2fa:cd3d:4a76 with SMTP id
 38308e7fff4ca-2fb187f628bmr8783861fa.43.1728452968243; Tue, 08 Oct 2024
 22:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <20241001062855.6928-1-kfting@nuvoton.com> <20241001062855.6928-4-kfting@nuvoton.com>
 <Zvv1m3RT916dyYRC@smile.fi.intel.com>
In-Reply-To: <Zvv1m3RT916dyYRC@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Wed, 9 Oct 2024 13:49:16 +0800
Message-ID: <CACD3sJYhAYV3zBse5ntFsQmLV+TpLKtOiyyqgp3g8qeja54Ejw@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] i2c: npcm: Modify timeout evaluation mechanism
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, tali.perry@nuvoton.com, tali.perry1@gmail.com, wsa@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy:

Thank you for your comments.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
10=E6=9C=881=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:14=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Tue, Oct 01, 2024 at 02:28:52PM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > The users want to connect a lot of masters on the same bus.
> > This timeout is used to determine the time it takes to take bus ownersh=
ip.
> > The transactions are very long, so waiting 35ms is not enough.
> >
> > Increase the timeout and treat it as the total timeout, including retri=
es.
> > The total timeout is 2 seconds now.
> >
> > The i2c core layer will have chances to retry to call the i2c driver
> > transfer function if the i2c driver reports that the bus is busy and
> > returns EAGAIN.
>
> -EAGAIN
>
> ...
>
> > +             /*
> > +              * Adaptive TimeOut: estimated time in usec + 100% margin=
:
> > +              * 2: double the timeout for clock stretching case
> > +              * 9: bits per transaction (including the ack/nack)
> > +              */
> > +             timeout_usec =3D (2 * 9 * USEC_PER_SEC / bus->bus_freq) *=
 (2 + nread + nwrite);
>
> Side note (as I see it was in the original code), from physics
> point of view the USEC_PER_SEC here should be simply MICRO
> (as 1/Hz =3D=3D s, and here it will be read as s^2 in the result),
> but if one finds the current more understandable, okay then.
>

I just check with Nuvoton members and they prefer the USEC_PER_SEC way.

> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you.

Regards,
Tyrone
