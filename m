Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D6C98FC07
	for <lists+openbmc@lfdr.de>; Fri,  4 Oct 2024 03:49:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKWgV4F72z3c3y
	for <lists+openbmc@lfdr.de>; Fri,  4 Oct 2024 11:49:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728006562;
	cv=none; b=fYu8HlgmZTpTZJmthDU/meGHJZ1xlWVMW7qj4ZGWrKxeHCMglbNGHln/ttWdwlCW9d5RXzsMz7+uvjF9m/ToryFjldl8k4+UkEOlFZYDcQ8IjdVSQt/evAcLshk7Y688Ikmd6sc4YDr203ghDGs9TRAOieMy0JSozJO7AIjVoECtcCuWscIDf3pSmOwXkDxmpJDgi0v6zGQskYU5/cDC11Jl4NlErDBnlpkBBTyXc/HKAS3vgbuMCw3N8Hne0ZvQfsTHLHi7qHbHQXCnuzk9gAHlqI7Ia/6Xk6GMajHUVrUn87iPZpcB9z0PFWfgAuBYI0TW3/fOJYRQhw3F8HIujg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728006562; c=relaxed/relaxed;
	bh=8Nc7ApnR6nbyTatR6bQIp3Ei0Y0fheg+jMLkC8GG61A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jLedweaVBkyOc9BKqtpKF08I33whbP/1ewBMV6nhrHt1MqcaUze6Sjq6BWkLIjfjVB5CH/5rX9zAY3QlxbZAJjDaK4mLNeN8RLqUXhcdHRNEjoVKoF9wcObO0sLFzQtl9daD20lUJzC0cCvjD+1bil/HVyIu11zUOIxnEzAUkIHGSgtmwvVPQpfQ/vuOT5zlt59QQXlvW3Ce+wAok0FgaqEH+BkjImaFxTIkB2uxX6hmwF2GAGxllQmaKvp2Hnqhl++jWkfSzsig/gxZybfFlh1+c5okeRQa93QDhg8lBkviLxLXgXfe0SAaRgldE1Dq8+c1c20MZC9p+TQSWIb3SA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gNciwkxF; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gNciwkxF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XKWgP5JrJz2xxr
	for <openbmc@lists.ozlabs.org>; Fri,  4 Oct 2024 11:49:21 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5c896b9b3e1so2094970a12.2
        for <openbmc@lists.ozlabs.org>; Thu, 03 Oct 2024 18:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728006558; x=1728611358; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Nc7ApnR6nbyTatR6bQIp3Ei0Y0fheg+jMLkC8GG61A=;
        b=gNciwkxFYJfvxsYPIRCHSJ3RJqHnfiXQ8NPXSMACAxB78FjDf3se3KdbK8mZVe3b42
         vHlgKPIK7YhlMGAmEwqK5ipBqhKexBQBtY4/z3WKH8vU42lUrRMG/wvALiWosN5EgE7M
         mgB7CE15TnPTj1oYOSF2rSSaO1Nj1TaRbeOVyhbjlK5DAjFkuvqjGcyzQ7Og8QF1fDnb
         lI717YkadboUaoxNWGg5ckJc7DkkxxVhd5a5JmGyb3eq84IlIQHTiu9+maJIajNQWPAe
         sKpDDWkYoNWg4AVecH2jUg7FoPmQw601ExktSsQ/w15kfINhZNbahpLjW+VVnb+eUYw6
         XwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728006558; x=1728611358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Nc7ApnR6nbyTatR6bQIp3Ei0Y0fheg+jMLkC8GG61A=;
        b=No06AgocqF+aTv+q/r7IOuz8uRuZi1yYbDtMdPWqE3g92dyj1fwdvGscHCkR1s9xGD
         Gv51UgDW/mUCJs7eGgfT83hZevtYbNAdMhkuvxZpoKXhXR+IirjWNW2GSABCXAG0Ms0g
         7Pdq7zWlMEtcJ9uRbpwHwkOIp60KmwAowcNf4lByI+bwaJGaJjC64GuH9FXbPioEMYOu
         XTMW3hXGiTw7Mthu2IqYTRot0qDy3+MT0Tf20A6pMQuCQidjyX6mRIZ/+R2FQyvH6KM3
         CNe5Xf6H8wHiATgfFqkuKz/suACjxvcBKlZRv+/8uU3mv3w51/2X1wjCUnOU7t5PcfJD
         TLKg==
X-Forwarded-Encrypted: i=1; AJvYcCV5N8oKA+3PVhiXDW4io05bQd9ItXcXQBamLhwTWgAAiT02T8EAC75g703MChkzPQMcBYfP08aC@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz9TF9J5bglkpDkFB2CF+r4Il9GVQKtMQlMe3yHX+47HzAxcpDC
	gF6029YY0Ap53dM2HmGNGv/Moz9hQdactiOYDhcjvniNnItDn28C4s61hzt9UX7y7ZchK0D5c98
	d88tEKkQc+4sqfb/6ftWTtfUgMN/mUkM=
X-Google-Smtp-Source: AGHT+IGpeQ7q3Kr3iLTaYIb8b7EqgDiIEjkL0C2Jt5Ak8J50Ew0L6q5RgXNnXeyzuu5dxJG3zeRV5Zpr+2HnggZzPu8=
X-Received: by 2002:a17:906:da89:b0:a8a:837c:ebd4 with SMTP id
 a640c23a62f3a-a991bd71c4emr108821066b.27.1728006557641; Thu, 03 Oct 2024
 18:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20241001062855.6928-1-kfting@nuvoton.com> <20241001062855.6928-5-kfting@nuvoton.com>
 <Zvv2Y10hJqGnUDvW@smile.fi.intel.com>
In-Reply-To: <Zvv2Y10hJqGnUDvW@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 4 Oct 2024 09:49:06 +0800
Message-ID: <CACD3sJbJ0cNCRiBba73BOAkO=jn9KuJJXC1-Sy_iVf_8EJSjxA@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] i2c: npcm: Modify the client address assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
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

Thank you for your comments and they'll be addressed.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
10=E6=9C=881=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:17=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Tue, Oct 01, 2024 at 02:28:53PM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Store the client address earlier since it might get called in
> > the i2c_recover_bus() logic flow at the early stage of
> > npcm_i2c_master_xfer().
>
> ...
>
> > +     /*
> > +      * Previously, the address was stored w/o left-shift by one bit a=
nd
> > +      * with that shift in the following call to npcm_i2c_master_start=
_xmit().
> > +      *
> > +      * Since there are cases that the i2c_recover_bus() gets called a=
t the
> > +      * early stage of npcm_i2c_master_xfer(), the address is stored w=
ith
> > +      * the shift and used in the i2c_recover_bus().
> > +      *
> > +      * The address is stored from bit 1 to bit 7 in the register for
> > +      * sending the i2c address later so it's left-shifted by 1 bit.
> > +      */
> > +     bus->dest_addr =3D slave_addr << 1;
>
> I'm wondering if it's better to use i2c_8bit_addr_from_msg() here?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Have a nice day.

Regards,
Tyrone
