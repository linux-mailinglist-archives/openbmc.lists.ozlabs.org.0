Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3104E4AD7B2
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 12:41:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtLgy5jfXz3bWR
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 22:41:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lrjRELFW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e33;
 helo=mail-vs1-xe33.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lrjRELFW; dkim-atps=neutral
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtHJK2q2Zz2x9J
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 20:09:19 +1100 (AEDT)
Received: by mail-vs1-xe33.google.com with SMTP id m24so2618460vsp.7
 for <openbmc@lists.ozlabs.org>; Tue, 08 Feb 2022 01:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CCHth88Qr2ytEl3s0pF6IBKShG9LzGdQHlQOpQypTvA=;
 b=lrjRELFWDYhcJuAkkSBPXf0gK+ZbWEFQ2EOAZtm9bL/A/4qBch+VQrxdqszjHHLvY5
 NMKnTwq+ZFx9TxinR/3SePAQw1bBmDapFpI9z5PmOB9sLKycfne5Dn9iXCrSG6nPT8OI
 T1I44KzY8T/0hm/VA4FYab4/lKWqk1pZ364ZtmULYRk82ghY0lvCwJP3OAJnaO3Yy+3G
 0ns1TevvoW1SsMuL8gj6zSPO8g5owrI/fMAG1ZihN9SMekB/g4hyGE5gdAf+jxV4zb65
 U/RnGSViOd9X1y/67z4nSWrvFppPCaUu9twOLDdAI9ZgEod4txc5WpuWPjvLDRurKYtd
 U5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CCHth88Qr2ytEl3s0pF6IBKShG9LzGdQHlQOpQypTvA=;
 b=CebS0CfagM9jsvwQgZmQzQJ0NhF1/NqeGGCAHvwzld+JhOUeljiwjve2v9s16TES+/
 SUPnevkr5Csx3hAJgWuIkyx+XkknRLovosOoAwxZNONSY5zhKeKhcGAafBXIK0x6JiWf
 l4/ug+HUjnpGWhVLCJKr0jTywI7PSOwzFpJaMuTCNlymMjtW/YfVzgFc/YPRab3GifVm
 LWutwIGT3KN/EXiuHo68G3AqASXQbPj5kfmD/tGagjCwfJmfNX15NopChGJA/3i8dZwk
 UtxEdf8takW6Gps3+ygeMuEaT8B9wQScEktzmx/SCnw03VzhMFILGuIZEHIYiRoMqsbe
 xwmQ==
X-Gm-Message-State: AOAM530s+AU18OsAvG9CGVRqpVKbE4h1idOgdNpRIb/Ye02SvJRI49Fz
 Ksk+gboKjM7HUdgQkA1PO1GB7ZhFyGkDt+RI8Q==
X-Google-Smtp-Source: ABdhPJw86WEF7nEm1yDt7OhMgg5VCB62C8EeQOyyXG7bqGfeibsMDBqqRqxZ3e3CfST+8/BYaJ/Ptxxv0Npj3EmNUd4=
X-Received: by 2002:a67:f349:: with SMTP id p9mr1214944vsm.50.1644311356069;
 Tue, 08 Feb 2022 01:09:16 -0800 (PST)
MIME-Version: 1.0
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-3-warp5tw@gmail.com>
 <YgECF6jZ7wj8TOfl@latitude>
In-Reply-To: <YgECF6jZ7wj8TOfl@latitude>
From: warp5tw <warp5tw@gmail.com>
Date: Tue, 8 Feb 2022 17:09:04 +0800
Message-ID: <CACD3sJaN01pVHn-NCH+-UQLYg9EhU0beadVP-84byauj_23Acw@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] i2c: npcm: Fix timeout calculation
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 08 Feb 2022 22:39:24 +1100
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 linux-i2c@vger.kernel.org, benjaminfair@google.com,
 krzysztof.kozlowski@canonical.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev,
 robh+dt@kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com,
 semen.protsenko@linaro.org, avifishman70@gmail.com, venture@google.com,
 yangyicong@hisilicon.com, linux-kernel@vger.kernel.org, wsa@kernel.org,
 kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi all:

Thank you for your comments and they will be addressed.

Regards,
Tyrone


Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net> =E6=96=BC 2022=E5=B9=B42=
=E6=9C=887=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:27=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> Hello,
>
> On Mon, Feb 07, 2022 at 02:33:34PM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > Use adap.timeout for timeout calculation instead of hard-coded
> > value of 35ms.
>
>
> > Use syscon to access gcr, instead of "compatible".
>
> Please put the GCR/syscon change into a separate patch, because it is
> not obvious from the commit title that such a change would happen in
> this patch.
>
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > ---
> >  drivers/i2c/busses/i2c-npcm7xx.c | 18 +++++++-----------
> >  1 file changed, 7 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-=
npcm7xx.c
> > index 2ad166355ec9..ddeee6f53621 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -2047,7 +2047,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapte=
r *adap, struct i2c_msg *msgs,
> >       u16 nwrite, nread;
> >       u8 *write_data, *read_data;
> >       u8 slave_addr;
> > -     int timeout;
> > +     unsigned long timeout;
> >       int ret =3D 0;
> >       bool read_block =3D false;
> >       bool read_PEC =3D false;
> > @@ -2099,13 +2099,13 @@ static int npcm_i2c_master_xfer(struct i2c_adap=
ter *adap, struct i2c_msg *msgs,
> >        * 9: bits per transaction (including the ack/nack)
> >        */
> >       timeout_usec =3D (2 * 9 * USEC_PER_SEC / bus->bus_freq) * (2 + nr=
ead + nwrite);
> > -     timeout =3D max(msecs_to_jiffies(35), usecs_to_jiffies(timeout_us=
ec));
> > +     timeout =3D max(bus->adap.timeout, usecs_to_jiffies(timeout_usec)=
);
> >       if (nwrite >=3D 32 * 1024 || nread >=3D 32 * 1024) {
> >               dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
> >               return -EINVAL;
> >       }
> >
> > -     time_left =3D jiffies + msecs_to_jiffies(DEFAULT_STALL_COUNT) + 1=
;
> > +     time_left =3D jiffies + timeout + 1;
> >       do {
> >               /*
> >                * we must clear slave address immediately when the bus i=
s not
> > @@ -2131,7 +2131,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapte=
r *adap, struct i2c_msg *msgs,
> >       }
> >
> >       npcm_i2c_init_params(bus);
> > -     bus->dest_addr =3D slave_addr;
> > +     bus->dest_addr =3D slave_addr << 1;
>
> This seems unrelated to timeout calculation.
>
> >       bus->msgs =3D msgs;
> >       bus->msgs_num =3D num;
> >       bus->cmd_err =3D 0;
> > @@ -2233,9 +2233,9 @@ static int npcm_i2c_probe_bus(struct platform_dev=
ice *pdev)
> >       struct i2c_adapter *adap;
> >       struct clk *i2c_clk;
> >       static struct regmap *gcr_regmap;
> > -     static struct regmap *clk_regmap;
> >       int irq;
> >       int ret;
> > +     struct device_node *np =3D pdev->dev.of_node;
> >
> >       bus =3D devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
> >       if (!bus)
> > @@ -2250,15 +2250,11 @@ static int npcm_i2c_probe_bus(struct platform_d=
evice *pdev)
> >               return PTR_ERR(i2c_clk);
> >       bus->apb_clk =3D clk_get_rate(i2c_clk);
> >
> > -     gcr_regmap =3D syscon_regmap_lookup_by_compatible("nuvoton,npcm75=
0-gcr");
> > +     gcr_regmap =3D syscon_regmap_lookup_by_phandle(np, "syscon");
> >       if (IS_ERR(gcr_regmap))
> >               return PTR_ERR(gcr_regmap);
> >       regmap_write(gcr_regmap, NPCM_I2CSEGCTL, NPCM_I2CSEGCTL_INIT_VAL)=
;
> >
> > -     clk_regmap =3D syscon_regmap_lookup_by_compatible("nuvoton,npcm75=
0-clk");
> > -     if (IS_ERR(clk_regmap))
> > -             return PTR_ERR(clk_regmap);
>
> I agree that clk_regmap can be removed, but I'd rather see it in a
> separate patch, because it's unrelated to the timeout calculation.
>
> > -
> >       bus->reg =3D devm_platform_ioremap_resource(pdev, 0);
> >       if (IS_ERR(bus->reg))
> >               return PTR_ERR(bus->reg);
> > @@ -2269,7 +2265,7 @@ static int npcm_i2c_probe_bus(struct platform_dev=
ice *pdev)
> >       adap =3D &bus->adap;
> >       adap->owner =3D THIS_MODULE;
> >       adap->retries =3D 3;
> > -     adap->timeout =3D HZ;
> > +     adap->timeout =3D msecs_to_jiffies(35);
> >       adap->algo =3D &npcm_i2c_algo;
> >       adap->quirks =3D &npcm_i2c_quirks;
> >       adap->algo_data =3D bus;
>
>
> Best regards,
> Jonathan
