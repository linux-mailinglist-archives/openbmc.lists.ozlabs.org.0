Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 927E37BB04B
	for <lists+openbmc@lfdr.de>; Fri,  6 Oct 2023 04:25:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=aJCgSt6M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1sjS3Y3Bz3dFS
	for <lists+openbmc@lfdr.de>; Fri,  6 Oct 2023 13:25:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=aJCgSt6M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1shq0ncJz3bTN
	for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2023 13:25:14 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5789ffc8ae0so1172284a12.0
        for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2023 19:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1696559112; x=1697163912; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :mime-version:references:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CxYo6IvDP4Cql5sw9bTnnh2Yqh8RieWPcYmErtsaoMY=;
        b=aJCgSt6MpX6h8OVvijiPKCAJcN7cFtoxelbXpHufAlrjAEHIyBhPl+6/1zp502ynck
         bIGkzeYVUXtAU8GJcsrEheQwlGSlAQLFHPtdV7ImlvaTrkT1/OX6PCzQTi2MRXTb8uUM
         rRNy7b8ajDEzUqBim/B9ZTubBdwju6V5gYTmcizyGDF1K6ku2xSwVsFa1ImCkhTr+Iv3
         X3vqHUCKcRCBeuR7h8Y+xjB8raje5OfsMCYXwIBX1p3jPOL0ZtN67CG5jZeCk0uj+Rgk
         hEcbVsawQlJLsi5L7PK17wGkvl3QPQYIwq0LQrZgV7wJoqFFT2XyeSuFLovs5af76D5f
         WyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696559112; x=1697163912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :mime-version:references:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CxYo6IvDP4Cql5sw9bTnnh2Yqh8RieWPcYmErtsaoMY=;
        b=BlK0p+q1T3tI8WR/Wbn/rryv+hl1El69he4O3Vx3JytXtm6MY4y8V/KfX4Re9W3mQt
         aot9u1owuskhUTwf9up6tKqy6UQNnx+23COiOKPK6tHTfa4+eOODgPjobOayw+NmQkZ0
         aQ7116nYGhtNt7EhqzBq45d/ByxsrtSFqfCqlQyc6JP2DtmTTaBCwsa9qbMyIKbjB0TG
         XrNrfn+mScRCM0WKWNyVxNLLRngTw3gEK8cZe7HDYyhJwzpasldYQpeZWgz8zMRWYo4O
         KJ9aEcwZcUxlz2tvhQl9O7Y70foAAAtL8QUc7/3L70WnbfqJ36zyhQ0E2FVr23tBjsDo
         JSsw==
X-Gm-Message-State: AOJu0YxFa5sJKDTk1obCBqeW51C/Ev5a8KN0J0aIcDNNtLNaEZtD0lNi
	Qrxckuy6+A6Yo2ptbFD2iL1JtUzmxgzkfOdF+iauHg==
X-Google-Smtp-Source: AGHT+IFwhwsyiIbKY3C4WD+0/ePkpd25/S3dbGe0Zd6YKc1+vFt6mHdS6faR6OqiHQ7LdSQOzoDww5EWr4asjIaXiqo=
X-Received: by 2002:a05:6a20:551d:b0:161:7a0c:3c38 with SMTP id
 ko29-20020a056a20551d00b001617a0c3c38mr5963368pzb.32.1696559112315; Thu, 05
 Oct 2023 19:25:12 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Oct 2023 21:25:11 -0500
From: Jian Zhang <zhangjian.3032@bytedance.com>
References: <20230927154244.3774670-1-zhangjian.3032@bytedance.com>
 <ZRZ/ObZmntMLw2r+@ninjato> <975c69de32eefb124fe668e921e8dbda86962deb.camel@codeconstruct.com.au>
 <052ccd48-2541-1ef3-1f33-75b7d49611ad@os.amperecomputing.com> <9407cee639b3eeb715a953c33b26a9a3830a64f8.camel@codeconstruct.com.au>
Mime-Version: 1.0
In-Reply-To: <9407cee639b3eeb715a953c33b26a9a3830a64f8.camel@codeconstruct.com.au>
Date: Thu, 5 Oct 2023 21:25:11 -0500
Message-ID: <CA+J-oUsjqT4aQH8ZHbMex18xP_LODD5ycCyhTpv=C2X0DqriZA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2] i2c: aspeed: Fix i2c bus hang in slave read
To: Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: Andi Shyti <andi.shyti@kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, andrew@aj.id.au, "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>, yulei.sh@bytedance.com, open list <linux-kernel@vger.kernel.org>, joel@jms.id.au, Wolfram Sang <wsa@kernel.org>, brendan.higgins@linux.dev, "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>, Quan Nguyen <quan@os.amperecomputing.com>, zhangjian3032@gmail.com, xiexinnan@bytedance.com, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, Tommy Huang <tommy_huang@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> From: "Andrew Jeffery"<andrew@codeconstruct.com.au>
> Date:=C2=A0 Fri, Oct 6, 2023, 08:20
> Subject:=C2=A0 [External] Re: [PATCH v2] i2c: aspeed: Fix i2c bus hang in=
 slave read
> To: "Quan Nguyen"<quan@os.amperecomputing.com>, "Wolfram Sang"<wsa@kernel=
.org>, "Jian Zhang"<zhangjian.3032@bytedance.com>
> Cc: "Andi Shyti"<andi.shyti@kernel.org>, "moderated list:ARM/ASPEED MACHI=
NE SUPPORT"<linux-aspeed@lists.ozlabs.org>, <andrew@aj.id.au>, "moderated l=
ist:ARM/ASPEED I2C DRIVER"<openbmc@lists.ozlabs.org>, <yulei.sh@bytedance.c=
om>, "open list"<linux-kernel@vger.kernel.org>, "Tommy Huang"<tommy_huang@a=
speedtech.com>, "open list:ARM/ASPEED I2C DRIVER"<linux-i2c@vger.kernel.org=
>, <brendan.higgins@linux.dev>, <joel@jms.id.au>, <zhangjian3032@gmail.com>=
, "moderated list:ARM/ASPEED MACHINE SUPPORT"<linux-arm-kernel@lists.infrad=
ead.org>, <xiexinnan@bytedance.com>
> On Thu, 2023-10-05 at 14:55 +0700, Quan Nguyen wrote:
> >
> > On 04/10/2023 13:08, Andrew Jeffery wrote:
> > > On Fri, 2023-09-29 at 09:39 +0200, Wolfram Sang wrote:
> > > > On Wed, Sep 27, 2023 at 11:42:43PM +0800, Jian Zhang wrote:
> > > > > When the `CONFIG_I2C_SLAVE` option is enabled and the device oper=
ates
> > > > > as a slave, a situation arises where the master sends a START sig=
nal
> > > > > without the accompanying STOP signal. This action results in a
> > > > > persistent I2C bus timeout. The core issue stems from the fact th=
at
> > > > > the i2c controller remains in a slave read state without a timeou=
t
> > > > > mechanism. As a consequence, the bus perpetually experiences time=
outs.
> > > > >
> > > > > In this case, the i2c bus will be reset, but the slave_state rese=
t is
> > > > > missing.
> > > > >
> > > > > Fixes: fee465150b45 ("i2c: aspeed: Reset the i2c controller when =
timeout occurs")
> > > > > Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
> > > >
> > > > Somebody wants to add tags here? I think it should go to my pull re=
quest
> > > > this week.
> > > >
> > >
> > > I've tested this patch applied on top of fee465150b45 on an AST2600 a=
nd
> > > the the system behaviour doesn't seem worse. However, I can still loc=
k
> > > the bus up and trigger a hung task panic by surprise-unplugging thing=
s.
> > > I'll poke around to see if I can get to the bottom of that.
> > >
> > > Resetting the slave state makes sense, so with the above observation
> > > aside:
> > >
> > > Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > > Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > >
> > > That said I do wonder whether we should update the slave state in the
> > > same place we're updating the hardware state. It would cover off the
> > > gap identified by Jian if it were to ever occur anywhere else.
> > > Something like:
> > >
> > > diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c=
-
> > > aspeed.c
> > > index 5a416b39b818..28e2a5fc4528 100644
> > > --- a/drivers/i2c/busses/i2c-aspeed.c
> > > +++ b/drivers/i2c/busses/i2c-aspeed.c
> > > @@ -749,6 +749,8 @@ static void __aspeed_i2c_reg_slave(struct
> > > aspeed_i2c_bus *bus, u16 slave_addr)
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 func_ctrl_reg_val =3D readl(bus->ba=
se + ASPEED_I2C_FUN_CTRL_REG);
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 func_ctrl_reg_val |=3D ASPEED_I2CD_=
SLAVE_EN;
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 writel(func_ctrl_reg_val, bus->base=
 + ASPEED_I2C_FUN_CTRL_REG);
> > > +
> > > + =C2=A0 =C2=A0 =C2=A0 bus->slave_state =3D ASPEED_I2C_SLAVE_INACTIVE=
;
> > > =C2=A0 }
> > >
> > > =C2=A0 static int aspeed_i2c_reg_slave(struct i2c_client *client)
> > > @@ -765,7 +767,6 @@ static int aspeed_i2c_reg_slave(struct i2c_client
> > > *client)
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 __aspeed_i2c_reg_slave(bus, client-=
>addr);
> > >
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 bus->slave =3D client;
> > > - =C2=A0 =C2=A0 =C2=A0 bus->slave_state =3D ASPEED_I2C_SLAVE_INACTIVE=
;
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 spin_unlock_irqrestore(&bus->lock, =
flags);
> > >
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 return 0;
> > >
> > >
> >
> > We tested both Jian's patch and Andrew's patch on our MCTP-i2c bus
> > (ast2600 based BMC) and see both patches work well.
> >
> > We currently use upstream i2c-aspeed.c driver with the commit [1]
> > backported. Without that commit, we frequently experienced the bus hang
> > (due to bus arbitration) and it is unable to recover.
> >
> > But, by reverting that commit and with Jian or Andrew's patch, we see
> > the bus could be able to recover so we think both changes are good.
> >
> > [1]
> > https://github.com/AspeedTech-BMC/linux/commit/11a94e5918aa0f87c828d63f=
d254dd60ab2505e5
> >
> > Anyway, I would prefer Andrew's way because the bus->slave_state must
> > always be reset to ASPEED_I2C_SLAVE_INACTIVE everytime
> > __aspeed_i2c_reg_slave() is called.
>
> Jian, what's your preference? Are you happy to do a v3 along the lines
> of my suggestion above?
Thanks, LGTM,=C2=A0 I will send the patch v3.

Jian.
>
> Otherwise Wolfram can take v2 and we can always do the cleanup in a
> follow-up patch.
>
> Andrew
