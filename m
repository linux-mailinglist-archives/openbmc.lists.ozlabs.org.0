Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 110207AB3D3
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 16:39:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TYiklTyw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsZg01Cbyz3ckj
	for <lists+openbmc@lfdr.de>; Sat, 23 Sep 2023 00:39:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TYiklTyw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsZfG2kDLz304l
	for <openbmc@lists.ozlabs.org>; Sat, 23 Sep 2023 00:39:16 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6910ea9cddbso1797224b3a.0
        for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 07:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1695393554; x=1695998354; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDCW2U3ma3X57srmeQIvcOtqMW2EwlhtHdznihqOnWg=;
        b=TYiklTywe84pSaRupoYeoJoxwp4S+xg8BTMxrRbcXiNGKo3xKhGzXqXEmG1Rlp2pyB
         wFm/U0xmRbNCOh7BCr437kh2JUnNb8PGcy5kCgyjOFjgBqZj6PPsGbFY2GX1gKEGshS/
         caqo7HONW6SMMfwJV4lQR190ZD2Lvo+T2FzekUdD2LiPtcNx4vxoADbJrSwJga0Qb2eS
         cpQYViMOI3fFJ9GKyBfPBcFWayNvTL7e7NCEBdWo5OZQ0bhe2H1DaFx8T3TKwiFmZS9B
         EMIVvO57SZxcSRg6LHt0QZX3Suz4MDVBXQ3oxqBrlgNqMS421wTcSwZdkeHHsIzTx0Vj
         8ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695393554; x=1695998354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDCW2U3ma3X57srmeQIvcOtqMW2EwlhtHdznihqOnWg=;
        b=oilFTYmaVze+6q48KVvjYKAfIfiHWejuah7KLAEdQWKUQZS5WduATak7xfG3+euk0c
         utQITBzZc8pvftFx+oY8G5RlxmS5kDTaW+DwlCnR+I6/qyUyehEPBLC23k7FukLQiG3q
         iVP1iCyYpNKUGp/yLqmbmhC4puuLJ8I1jRgXEZLqSmckoADNuGgDkG0aEeiNFP2QI6Ql
         W5Zl+96YJ5ViRO0XRvmjqED5IOz0tdhaUoBu/riaROR5f5tUmmmWP0FPdp7AJ+/lm91S
         tjR2Bz9D+psIbmSwqBtH3CPnvPNh0WwOTXP4lmZ4CuHvm4eZIz+YV6rYJ9dmIBZx9VIy
         XUtA==
X-Gm-Message-State: AOJu0Yznou7rOPu7bjmXloUOF47KFe5NoLFf4EAFzt3WDA+CZdHc4SuV
	5aSqydxTW2EzXvc9jBp19tIEA28Uyay4yspltFDl5w==
X-Google-Smtp-Source: AGHT+IGSX2coFfnuBFC8yiNSrNUXsjDUYJpRoivmDrjqqsI1bp/3866wqzTiC/iIOogJ9xfcP/YSwQVE82FwHEwWHJw=
X-Received: by 2002:a05:6a00:2389:b0:68a:5395:7aa5 with SMTP id
 f9-20020a056a00238900b0068a53957aa5mr9664393pfc.17.1695393554057; Fri, 22 Sep
 2023 07:39:14 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 22 Sep 2023 10:39:13 -0400
Mime-Version: 1.0
References: <20230810072155.3726352-1-zhangjian.3032@bytedance.com> <CACPK8XfWKLS_4nBC+NCSw=21iQeaHzBXOROmz9T+S0qZHCBKeg@mail.gmail.com>
In-Reply-To: <CACPK8XfWKLS_4nBC+NCSw=21iQeaHzBXOROmz9T+S0qZHCBKeg@mail.gmail.com>
From: Jian Zhang <zhangjian.3032@bytedance.com>
Date: Fri, 22 Sep 2023 10:39:13 -0400
Message-ID: <CA+J-oUtxiQBOT+VM3fbOUM8HL5TX-C4HqtbbT__b4_KsGAJy1w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] i2c: aspeed: Fix i2c bus hang in slave read
To: Joel Stanley <joel@jms.id.au>
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
Cc: "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, andrew@aj.id.au, "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>, yulei.sh@bytedance.com, open list <linux-kernel@vger.kernel.org>, "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>, brendan.higgins@linux.dev, Tommy Huang <tommy_huang@aspeedtech.com>, zhangjian3032@gmail.com, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, xiexinnan@bytedance.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> From: "Joel Stanley"<joel@jms.id.au>
> Date:=C2=A0 Fri, Sep 22, 2023, 14:48
> Subject:=C2=A0 [External] Re: [PATCH] i2c: aspeed: Fix i2c bus hang in sl=
ave read
> To: "Jian Zhang"<zhangjian.3032@bytedance.com>, "Tommy Huang"<tommy_huang=
@aspeedtech.com>
> Cc: <brendan.higgins@linux.dev>, <benh@kernel.crashing.org>, <andrew@aj.i=
d.au>, <zhangjian3032@gmail.com>, <yulei.sh@bytedance.com>, <xiexinnan@byte=
dance.com>, "open list:ARM/ASPEED I2C DRIVER"<linux-i2c@vger.kernel.org>, "=
moderated list:ARM/ASPEED I2C DRIVER"<openbmc@lists.ozlabs.org>, "moderated=
 list:ARM/ASPEED MACHINE SUPPORT"<linux-arm-kernel@lists.infradead.org>, "m=
oderated list:ARM/ASPEED MACHINE SUPPORT"<linux-aspeed@lists.ozlabs.org>, "=
open list"<linux-kernel@vger.kernel.org>
> On Thu, 10 Aug 2023 at 07:22, Jian Zhang <zhangjian.3032@bytedance.com> w=
rote:
> >
> > When the `CONFIG_I2C_SLAVE` option is enabled and the device operates
> > as a slave, a situation arises where the master sends a START signal
> > without the accompanying STOP signal. This action results in a
> > persistent I2C bus timeout. The core issue stems from the fact that
> > the i2c controller remains in a slave read state without a timeout
> > mechanism. As a consequence, the bus perpetually experiences timeouts.
> >
> > This proposed patch addresses this problem by introducing a status
> > check during i2c transmit timeouts. In the event that the controller
> > is in a slave read state, the i2c controller will be reset to restore
> > proper functionality and allow the I2C bus to resume normal operation.
> >
> > Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
>
> Tommy has submitted a similar fix:
>
>=C2=A0 https://lore.kernel.org/linux-i2c/20230906004910.4157305-1-tommy_hu=
ang@aspeedtech.com/
>
> His change is very heavy handed; it reinitialises the bus including
> re-parsing the device tree (!).
>
> Should we have merged this fix instead? If not, are you able to
> confirm that his change fixes your issue?

I feel it's for solving the same issue, but I think this patch is
missing the action
`bus->slave_state =3D ASPEED_I2C_SLAVE_INACTIVE;`,
=C2=A0which means it can't resolve my problem. @Tommy, can you help confirm=
 this?

Thanks,

Jian

>
> Cheers,
>
> Joel
>
> > ---
> >=C2=A0 drivers/i2c/busses/i2c-aspeed.c | 17 +++++++++++++++++
> >=C2=A0 1 file changed, 17 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-a=
speed.c
> > index e76befe3f60f..1a95205fc946 100644
> > --- a/drivers/i2c/busses/i2c-aspeed.c
> > +++ b/drivers/i2c/busses/i2c-aspeed.c
> > @@ -113,6 +113,7 @@
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 ASPEED_I2=
CD_M_RX_CMD | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=C2=A0 \
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 ASPEED_I2=
CD_M_TX_CMD | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=C2=A0 \
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 ASPEED_I2=
CD_M_START_CMD)
> > +#define ASPEED_I2CD_SLAVE_CMDS_MASK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 GENMASK(31, 29)
> >
> >=C2=A0 /* 0x18 : I2CD Slave Device Address Register =C2=A0 */
> >=C2=A0 #define ASPEED_I2CD_DEV_ADDR_MASK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 GENMASK(6, 0)
> > @@ -706,6 +707,22 @@ static int aspeed_i2c_master_xfer(struct i2c_adapt=
er *adap,
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=C2=A0 ASPEED_I2CD_BUS_BUSY_STS))
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 aspeed_i2c_recover_bus(bus);
> >
> > +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 * If master ti=
med out and bus is in slave mode.
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 * reset the sl=
ave mode.
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 */
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (readl(bus->base =
+ ASPEED_I2C_CMD_REG) & ASPEED_I2CD_SLAVE_CMDS_MASK) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 spin_lock_irqsave(&bus->lock, flags);
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 u32 func_ctrl_reg_val =3D readl(bus->base + ASPEED_I2C_FUN_CTRL_REG=
);
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 writel(0, bus->base + ASPEED_I2C_FUN_CTRL_REG);
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 writel(func_ctrl_reg_val, bus->base + ASPEED_I2C_FUN_CTRL_REG);
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 bus->slave_state =3D ASPEED_I2C_SLAVE_INACTIVE;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 spin_unlock_irqrestore(&bus->lock, flags);
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> > +#endif
> > +
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 * If time=
d out and the state is still pending, drop the pending
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 * master =
command.
> > --
> > 2.30.2
> >
