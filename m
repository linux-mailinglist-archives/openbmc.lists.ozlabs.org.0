Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D6A9706A5
	for <lists+openbmc@lfdr.de>; Sun,  8 Sep 2024 12:39:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X1mg83Tbbz3cG5
	for <lists+openbmc@lfdr.de>; Sun,  8 Sep 2024 20:39:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::236"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725791969;
	cv=none; b=W6GobsFAH890DMcJtwhjG+YXSmNnVkwp4YLbH/P4YTjEcbrKQPAKDKb3ddLgynXf9U2O+T5U4rFAsohYV7UFJ+1fyCT1qiQk5bdAzLAEuETRh/174t0+c6ht1jYix4fDvEi7e/uMf3w4vdWSVcqeZsX9L3caTovrhDswtkDOs6V93WMztAiXf3DTthiAmtjd5mUzquMtT/FzJp9TtOigPTfNO/eODpIXtPo+COym/Re0HjqNd3qE/wrqjxqjed0htIrkzsftbieD1/BsH0Qiozgpu8Juw0wBBHvHAbfp5rwLv0xypzHB3IcOCvGddds7CdcRL3lslgJBQz7yuvj4fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725791969; c=relaxed/relaxed;
	bh=QBlzT4DhXGVmK0DDC40shs2P1XOGabvgOZdRTDdJKzA=;
	h=DKIM-Signature:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type; b=AVTq2/sn53hWCEBdykUK7EFP363dZF4W7CzP6+GoPlBoEXeLXEALkR3nZcvBbt5KqOmIasNlHZOxpmEiLwVJ3no6h9Mcbc9wdtrgfyDZsetl35WKRY58J/zzlWh5LfCp8XlG3vJBR290TEZr1yWL4sWFzlqIYaMRb9B9PpbiZY2PV03g/PVE9XOMznIfl8XorT2EZuidwkt1/WA5yusYCySoYPjSxM8kJctt/VMvCgeN1n0yIl1g2QCz5mcukoiSCnW98Wl2Kbx9XNQfZmpDX95fmvDDWSKvldlJtNbLGEIVlKQp7FrdrPqtQ3FLROEL5dsljVXlVm59MfpN+thkWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Yuj4T093; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=tali.perry1@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Yuj4T093;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=tali.perry1@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X1mg41YXVz2xck
	for <openbmc@lists.ozlabs.org>; Sun,  8 Sep 2024 20:39:27 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2f761cfa5d8so6170901fa.2
        for <openbmc@lists.ozlabs.org>; Sun, 08 Sep 2024 03:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725791961; x=1726396761; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBlzT4DhXGVmK0DDC40shs2P1XOGabvgOZdRTDdJKzA=;
        b=Yuj4T093eCDkjHa6jJrQgQ0HwpPTswWZ+L8fQq02V2c1r0wPX43YcJDnF1RC+7PNPc
         gAPzzZ4wBE3azPhmRT5tA5oijmOAh715i1a/n1Oy0jb7k2aPn7RiSL0ufHAXxCDpwCVf
         gbw/pVFHys2Ey64H1K1tD54D61bGljETJVAQBpXkFiafvdSrtBOHyrAm4c7GNnyeygPF
         utf/kKiHvB8GmHQkmIwfwyGa8/nJ87NyHVV8c5AZ2qYMOIhyU5rpt3fBZ6xUQbXIO1xr
         Qvpl9+fQh3gjApFR9M9rr9IVX68LjljQG3eP1d2sdB1ZWtlA8TqM208kq8xIT6QT6Ux7
         hTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725791961; x=1726396761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QBlzT4DhXGVmK0DDC40shs2P1XOGabvgOZdRTDdJKzA=;
        b=ENGj+OX9HmyIizI45yH2HQ388rfDNhiQjhD+FFNA+A2Dr/xc52BidbDZJi8YIqPotH
         b2ixuvVv3fUH4HPJl4yKP+WbmvkGIig6Z7o2jBKl64ny0eDS/SSVmW9CEAcLgkrTrE/x
         dqYONc8y1qTqHtxQoiVnDqSuMrD6JMw0hH6+zx4sdz5tmtVeF2Tq5CyAIteWBw+JKlf+
         vdam9KwCiY+MX+bNtDxOuBVrMPGWlbMu+NdP5egt8WgFi1ZxwSpp0RA/F+6w1BfP9Jxb
         7s1mU5pv8sY/ShA29DtbhoXTGCHBtslfOoeW4u90dsAZa+Lw3T2jU4RaZqXlTQAXF7TM
         ZKQw==
X-Forwarded-Encrypted: i=1; AJvYcCWH0Q5ZcudPSCgAgPGeepjBl802TqiFM1ZvDCLYR+DK5z04e6tnuBLLBdUUmeOU7CSJWFyZlrZ3@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx7czhXTVBteU1VpK37OizKqYSLrdgvSV1zfdgvThqpT2OIXv/g
	lMjD0jBXz8FFaFibh3y701ijNAPjIEzgTzWvJ7w2YCu+EhHMAxLA6Xh9rZ6lG6kYYx0UQe93USI
	OGFoiPVeEte9VsxhvSoWjBxE0aHc=
X-Google-Smtp-Source: AGHT+IF8YSDnTUVBg5gTulU8iOWZhp8+Web6nIHMCIZHXU6A4YxtGVVmAIDqAaz7dyJzivALraGk1Qt4N0/Zujzb45E=
X-Received: by 2002:a05:651c:2127:b0:2f6:43fd:f870 with SMTP id
 38308e7fff4ca-2f751f69865mr54977021fa.31.1725791959684; Sun, 08 Sep 2024
 03:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-3-kfting@nuvoton.com>
 <cfdfldh5tuhb4r5pdpgolcr2roeewsobedet2uvmpbnqlw5yh4@c4a2szsbs2r2>
In-Reply-To: <cfdfldh5tuhb4r5pdpgolcr2roeewsobedet2uvmpbnqlw5yh4@c4a2szsbs2r2>
From: Tali Perry <tali.perry1@gmail.com>
Date: Sun, 8 Sep 2024 13:39:08 +0300
Message-ID: <CAHb3i=sHzF8p572SBMvfCVQmo+7VcYbOYuqUU-H2sEiTkfWD7A@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] i2c: npcm: correct the read/write operation procedure
To: Andi Shyti <andi.shyti@kernel.org>
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, wsa@kernel.org, tali.perry@nuvoton.com, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, Tyrone Ting <warp5tw@gmail.com>, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andi,

On Fri, Sep 6, 2024 at 12:29=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Tyronne,
>
> On Fri, Aug 30, 2024 at 11:46:35AM GMT, Tyrone Ting wrote:
> > Originally the driver uses the XMIT bit in SMBnST register to decide
> > the upcoming i2c transaction. If XMIT bit is 1, then it will be an i2c
> > write operation. If it's 0, then a read operation will be executed.
> >
> > After checking the datasheet, the XMIT bit is valid when the i2c module
> > is acting in a slave role. Use the software status to control the i2c
> > transaction flow instead when the i2c module is acting in a master role=
.
> >
> > Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_=
slave")
>
> Fixes needs to be used if you are fixing a bug (crash,
> device malfunction, etc.). If you want to use it, please describe
> the bug you are fixing. Otherwise, please, remove it.
>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > ---
> >  drivers/i2c/busses/i2c-npcm7xx.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-=
npcm7xx.c
> > index bbcb4d6668ce..2b76dbfba438 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -1628,13 +1628,10 @@ static void npcm_i2c_irq_handle_sda(struct npcm=
_i2c *bus, u8 i2cst)
> >                       npcm_i2c_wr_byte(bus, bus->dest_addr | BIT(0));
> >       /* SDA interrupt, after start\restart */
> >       } else {
> > -             if (NPCM_I2CST_XMIT & i2cst) {
> > -                     bus->operation =3D I2C_WRITE_OPER;
> > +             if (bus->operation =3D=3D I2C_WRITE_OPER)
> >                       npcm_i2c_irq_master_handler_write(bus);
> > -             } else {
> > -                     bus->operation =3D I2C_READ_OPER;
> > +             else if (bus->operation =3D=3D I2C_READ_OPER)
> >                       npcm_i2c_irq_master_handler_read(bus);
>
> mmmhhh... you are changing the logic here and you are not
> describing the logic change in the commit log.
>
> Without looking at the details, if this is a state machine you
> are breaking it.
>
> Can anyone from the ARM/NUVOTON NPCM supporters and reviewers
> take a look at this patch?
>

Indeed, the driver can use both the register bits or the state machine
to determine the current state of the bus.
In slave mode the XMIT bit can simply be used directly to set the state.
XMIT bit can be used as indication to the current state of the state
machine during slave operation.
(meaning XMIT =3D 1 during writing and XMIT =3D 0 during reading).
In master operation XMIT is valid only if there are no bus errors.
For example: in a multi master where the same module is switching from
master to slave at runtime, and there are collisions,
the XMIT bit cannot be trusted.
However the maser already "knows" what the bus state is, so this bit
is not needed and the driver can just track
what it is currently doing.




> Thanks,
> Andi
>
> > -             }
> >       }
> >  }
> >
> > --
> > 2.34.1
> >
