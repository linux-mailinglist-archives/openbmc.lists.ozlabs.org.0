Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE4399A54E
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2024 15:45:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ7D019ypz3cVj
	for <lists+openbmc@lfdr.de>; Sat, 12 Oct 2024 00:45:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728654300;
	cv=none; b=mLyOknNUISCJsiHvhPDR+JZwFIoFqNOCfs4j2G5ELn8FkfyECDpNnwJzktW+LJVHCZgClyPhRjxzWxIwKk6BLzRVOmMAWnLWTRD5tFsidAA/Qp0Tt3sUNPreEYv+i1YrL2n7omk4T9Sx9C0TUb9ItmOyGtiH7L+y0Wp2Zue7Co2LFVDMrra/o2uyw/BgPbALBtrtw3fXwYL8aKS7YXf3K3gtZYyQ7AYATvlE/2L9u5OETfPc0dQYmW4svu8uUEpmWoI9EGYGFxlZux3wxtddVlAzGd5sjUoP4WiU6Z2S6eArQprFaGnNryooW0/qtlCiaMuFv/DLg9jochgvWOaPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728654300; c=relaxed/relaxed;
	bh=VFmcATx1odRBRodNNtT/YMf8Rdbu+ncYOjMaxBgaZqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SXwsOZ06DkmKeXX8yHmJlO2Xug1LXOGhqLIna8meKKBQo5GPDQqvA6e1Cq+VtGZqiZm9vVunwMbuRtte487VJgtrPqY3TJQk3bNQvSe+wA7eR7tKRzTbzNuFdIdT72GKC17VA0exCIL/vHKD8Wnojrurq2LZ8NstXJSf7+oY11xLtXSbFhYBHCXdf9PrTjZ1f3TwNRP4IhceojkFe5UoKZz1XvYM9S0aMGJ0Zd4IYkBgzHDdO7RQEBT1jMBDR2I56iRggW3H31XNSH/vek1Pfd/uVqQE1Des8+JWldMGpafC/9NdgvoeH32F0J5ncvCjU3Na4u+CEhAhqqSDFSw89g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hjxcipzf; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hjxcipzf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ7Ct4D9Vz3c0H
	for <openbmc@lists.ozlabs.org>; Sat, 12 Oct 2024 00:44:56 +1100 (AEDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a998a5ca499so290617966b.0
        for <openbmc@lists.ozlabs.org>; Fri, 11 Oct 2024 06:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728654293; x=1729259093; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFmcATx1odRBRodNNtT/YMf8Rdbu+ncYOjMaxBgaZqo=;
        b=hjxcipzf/mJ6+haS4R2azoCLssXU+Qz+Ro8Z+YM5+w12Pwd8H2uQghdWJx+bKDjUpE
         jD3IK7xjL0WvzhUjFXyRkATFHSIpla/tiv4KHARmDarZDxr+G2POiv5TK6ALhfjcvFzQ
         lxFb9hCiuxtfv1xPkErfQ6LyLmWw0MwTFz+xTIXvvyTdZQaVtqtivwnOhYscdvgzduFe
         feBw6zLcZ1mlhz0uOnj0Bm7ON8Qz54bz1Vs2lj5Nsok2fvFEjwfWIRTIYMnvYSVZHXQn
         g0/qVD3fiuKAdiJ7/qleLCS8XKYwp0/eEs/NubRV71GhDLj7hIMCcqvq9q/PWCYACXJC
         9HMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728654293; x=1729259093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFmcATx1odRBRodNNtT/YMf8Rdbu+ncYOjMaxBgaZqo=;
        b=OgYDHob7b0S81ZXq8IaVMdIcyMJx2C3Y3NgC4otMwSnHl4/rN3um/6PWAtWNeDR+UZ
         KA+ASISYUqUphfTrnDWQLcXSwDfWve3VB91Upy3iMbD+vaDmowfu2RozuH/Z8iJSkO1j
         SNGYhhgW0PkvgehDgpcABOt7d3Sfw+YA08KaE3TCUnM6omw53qILgP3JZJ1+cRRz5EqV
         B3k67XasDLtIqvT4mEbTNNueU4VtQl2wlPAkScSbdtFf9Z3BSKzyemn7G/qCRkbO1flB
         /qhbZG5Di45luU9PIntu8ZAoV+o9HqL0CO6bV/vv2ZpD9doZDqIFeTM8X4BHQpN3Pyrp
         gayA==
X-Forwarded-Encrypted: i=1; AJvYcCU7vlQldJxtBsFt+eKi1OTxkywMMoVfHwWlK0PdtvHVl5dnRZ2/dtED3bWqvLcf2txY7QKSESHF@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywr2Cty+cx1XFu+qYc3xRWfDMGdjdt2WUDOX58iWHMF6rP/1Xm6
	TQZ3L80hJE0YVf2iOZ4yHHT63GcB1oBAyCI1/Jf/jCGEeSwY9jZNtYDER40lItk5iUqkrk76h8f
	/ham+3TY6U0F7btP/RRSvZnBX8A==
X-Google-Smtp-Source: AGHT+IGDVt0dw5a0G5CT/lg3sbm+HcJzm8qRuJl8QBnUjs0jZTr5VLEwZcO2c6Bra3147lynUJXcW0UTD9RWKIUKq84=
X-Received: by 2002:a17:907:94d2:b0:a93:d5d3:be4 with SMTP id
 a640c23a62f3a-a99b93018f2mr214011066b.13.1728654293099; Fri, 11 Oct 2024
 06:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <20241011055231.9826-1-kfting@nuvoton.com> <20241011055231.9826-3-kfting@nuvoton.com>
 <ZwkFWVC3_5xr6OQW@smile.fi.intel.com>
In-Reply-To: <ZwkFWVC3_5xr6OQW@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 11 Oct 2024 21:44:42 +0800
Message-ID: <CACD3sJY_79_VTe1EHPdh-1+FCBwb2KCW_N19==TMHAsrFL-rzg@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] i2c: npcm: Modify the client address assignment
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
10=E6=9C=8811=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=887:00=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On Fri, Oct 11, 2024 at 01:52:29PM +0800, Tyrone Ting wrote:
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
>
> I would rephrase it a bit like
>
>         /*
>          * Previously, the 7-bit address was stored and being converted t=
o
>          * the address of event in the following call to npcm_i2c_master_=
start_xmit().
>          *
>          * Since there are cases that the i2c_recover_bus() gets called a=
t the
>          * early stage of npcm_i2c_master_xfer(), the address of event is=
 stored
>          * and then used in the i2c_recover_bus().
>          */
>
> (E.g., the last paragraph just describes 101 about I2C 7-bit addresses us=
age
>  and may be dropped completely.)
>

Understood. I'll modify the comments and remove the last paragraph.

> > +     bus->dest_addr =3D i2c_8bit_addr_from_msg(msg0);
>
> ...
>
> > +             /*
> > +              * Since the transfer might be a read operation, remove t=
he I2C_M_RD flag
> > +              * from the bus->dest_addr for the i2c_recover_bus() call=
 later.
> > +              *
> > +              * The i2c_recover_bus() uses the address in a write dire=
ction to recover
> > +              * the i2c bus if some error condition occurs.
> > +              */
>
> > +             if (bus->dest_addr & I2C_M_RD)
>
> Redundant.
>

Just to double check. Is the code "if (bus->dest_addr & I2C_M_RD)" redundan=
t?

> > +                     bus->dest_addr &=3D ~I2C_M_RD;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you again.

Regards,
Tyrone
