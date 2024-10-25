Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D7D9AF715
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2024 03:43:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZQYD14K1z3c1g
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2024 12:43:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729820621;
	cv=none; b=e0FT583XQ6EceCje4ny9q+uI+NxiCF4GeiLo0adQjtX+/LLjKIMT6nvU4hiIWirflCXFPMirfY8EXuGfBFEGvvmNZQunBitvnPufnT/QI2Y7A2hj3QulxBYYYTAYH7mZTuap++GIUZ2chrkI3qn+dSmQqa7IfesvRClMZaTQYA6S9OjA6QqOFK2CQkXithUMzxIQ2XKZxZ1oiE0r9ZYPKlShX0PGa7FvDe9kTDPOZsgWhOfeKUjACFXNctmjcYvL2ORXoisYtocEHPEoSlVB/BagKG8TguJI3UqEFlpFUFvuIYNBSgrAFPYUx/ak3iNzKOnGf4f2qw04oag5NxbJhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729820621; c=relaxed/relaxed;
	bh=O8Vm6VBOFLWecOYwWVt2Ly1tLDYX7Q/a+VPKjbNnv+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P8CKNQxQHIuS7BuaW57LgXn0t/w5WaAvSRM+U77vBluj0J9R7XTCWYKob4pxjEbMv8jQ7xPjBaefloVBd7WpEGHJi53LwhXEnRVihokJd36kSQG7ON5H/KCyPjn5D/cHDeKNdva+UX8bBqnjzCYCsmhGpN/lDbVMKze/DGqkv/F1JQtMLuQLiHP+s04LIZScyrHEZiYCpgQa2K+heDI1Mf8gsLnhZYt3jitBnFHGkyzEym626z3Hv6l/HM1Fza71DDMU+5N2BA5pt0vP3uV1P9Cm+fFpOcOujiGhIIWcoB+OT/tcc4Vnb3nbFlxmRiB0r1zkEwZdgftnw5ec42RsBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Rxsgis26; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Rxsgis26;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZQY83mgqz2xKN
	for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2024 12:43:39 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5c941623a5aso4507525a12.0
        for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2024 18:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729820616; x=1730425416; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8Vm6VBOFLWecOYwWVt2Ly1tLDYX7Q/a+VPKjbNnv+M=;
        b=Rxsgis26yMgRIiYdgajnRPLAUXkwfXuuy7nyl1dikG0gDAuQ/Wf7UnK73pBWUvfztI
         xUiv/cEJVqfnjXqUJjITgO7RbfEtK5j9wQ+PbuqFL0oSShVZKV+2QnlZbCCctxsUkldC
         8XcZC/nA51zHwReMikjc+Vlut0yGeLZKbyHPi6VZyJGVvWgzEW7JcWSWHZP9JuArY5H0
         9XMLA7HMDfl2U0FZKplzkoyRL1IZFXtUIpEmhoQeV97V86MHnYT+NAvqQky+hZCZMESE
         piYbtu2MEMn0E85XMmgcLDMqppvadDPmVJH7HrwcATVR6W0IVzddJUOPLxdk9B10lAhe
         mmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729820616; x=1730425416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8Vm6VBOFLWecOYwWVt2Ly1tLDYX7Q/a+VPKjbNnv+M=;
        b=wWuxIce75APPBNtVKmghZmV9Tzdb6IEM5RlZBRUIlnOztb4aarlHgKbLY0ZCJhQ67j
         WVK+Zv+gHz5B0DAe4OGyVWBvtyXR4PqLlZxRSzQ2yDQzYGpv2EO0imQro+yrp6VML2Zw
         Kw/rruEasOVBMjWYJr+WKb30ue0fp+Bt+3DXR5PVI5rjVhmnz+yFTcLfnNaZcxLaIkUT
         zsxV3xXyGoD0abQJNI895HKwV/U5dDpnUbI0fghacOjCa3EpS/l2dvzohNZpdHU01qJd
         NYqGtJKIs9L8qGNOMZFOloZv3sIiemz4DrGiq+j332Ak3zk/LRxdEqTSy6tNSW+Y/UVC
         ozLg==
X-Forwarded-Encrypted: i=1; AJvYcCXpc/HsMdFhuRkz1vrtURkfQIMwX2z51b4N+og4wEDS6br/oeDZBS5Vjj4O4oDsmG4QxKjMFt71@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyEDYoGm7oo4df4JH6jurwcwnk3AOVUfCo0XNXKqgyuCOJeZI3H
	6PfwfJTEJmTMDDXgNgR9i/a/WGMUp0UXLU1H1S98myGKynLW84VDCrY2TpsUZutCT8ghGzagGKX
	VoxyH2qjKCN3I6nZrhRp8sTS/0w==
X-Google-Smtp-Source: AGHT+IG2yTlTZyXCaLKgoPrumql2OcBC6aY42zOMh7/jxnTGVLHw+xWLaAcZNjr7TGv7MpXPdpVu4d0Kq2Ev6cjj24o=
X-Received: by 2002:a17:907:7282:b0:a9a:17be:fac7 with SMTP id
 a640c23a62f3a-a9ad19bd232mr426053666b.14.1729820615789; Thu, 24 Oct 2024
 18:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20241021062732.5592-1-kfting@nuvoton.com> <20241021062732.5592-3-kfting@nuvoton.com>
 <kzsvr3jepoqjahn7n2jch5vrqim5eknylrasvsbjugfhzny46o@bemfk6knfmxi>
In-Reply-To: <kzsvr3jepoqjahn7n2jch5vrqim5eknylrasvsbjugfhzny46o@bemfk6knfmxi>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 25 Oct 2024 09:43:24 +0800
Message-ID: <CACD3sJbWKkBtyq-gnicASJvRnz_nGjVAyVgnreNV7RS+MLOWJw@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] i2c: npcm: Modify the client address assignment
To: Andi Shyti <andi.shyti@kernel.org>
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, wsa@kernel.org, tali.perry@nuvoton.com, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andi:

Thank you for your comments.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B410=E6=9C=8824=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:04=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> ...
>
> > +     /*
> > +      * Previously, the 7-bit address was stored and being converted t=
o
> > +      * the address of event in the following call to npcm_i2c_master_=
start_xmit().
>
> Do we care how it was done previously? I think this is not a
> useful information as the code readers will se the code the way
> it is now, not the way it was done "previously".
>

Yes, it's not a useful information anymore.

> (there is a related comment at the end)
>
> > +      * Since there are cases that the i2c_recover_bus() gets called a=
t the
> > +      * early stage of npcm_i2c_master_xfer(), the address of event is=
 stored
> > +      * and then used in the i2c_recover_bus().
>
> I could rephrase this sentence to something like:
>
> /*
>  * Store the address early in a global position to ensure it is
>  * accessible for a potential call to i2c_recover_bus().
>  */

Understood. Thank you for your help on this.

>
> > +      */
> > +     bus->dest_addr =3D i2c_8bit_addr_from_msg(msg0);
> > +
> >       /*
> >        * Check the BER (bus error) state, when ber_state is true, it me=
ans that the module
> >        * detects the bus error which is caused by some factor like that=
 the electricity
> > @@ -2165,6 +2175,15 @@ static int npcm_i2c_master_xfer(struct i2c_adapt=
er *adap, struct i2c_msg *msgs,
> >        * bus is busy.
> >        */
> >       if (bus_busy || bus->ber_state) {
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
> > +             bus->dest_addr &=3D ~I2C_M_RD;
> > +
> >               iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
> >               npcm_i2c_reset(bus);
> >               i2c_recover_bus(adap);
> > @@ -2172,7 +2191,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapte=
r *adap, struct i2c_msg *msgs,
> >       }
> >
> >       npcm_i2c_init_params(bus);
> > -     bus->dest_addr =3D slave_addr;
>
> We can now get rid of slave_addr. It's just used in
> npcm_i2c_master_start_xmit(). Right?

Yes, slave_addr is just used as the link
https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm7x=
x.c#L2182
suggests with this patch.

>
> Andi
>
> >       bus->msgs =3D msgs;
> >       bus->msgs_num =3D num;
> >       bus->cmd_err =3D 0;
> > --
> > 2.34.1
> >

Thank you.

Regards,
Tyrone
