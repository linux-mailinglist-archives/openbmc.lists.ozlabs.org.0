Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9EA768B97
	for <lists+openbmc@lfdr.de>; Mon, 31 Jul 2023 08:11:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hBX4WSeI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RDntR5lLzz30Kg
	for <lists+openbmc@lfdr.de>; Mon, 31 Jul 2023 16:11:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hBX4WSeI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92c; helo=mail-ua1-x92c.google.com; envelope-from=mine260309@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RDnsk0hGGz2ykc;
	Mon, 31 Jul 2023 16:10:33 +1000 (AEST)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-79aa01cc971so462153241.0;
        Sun, 30 Jul 2023 23:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690783826; x=1691388626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LBd4nFDrmnQ+zd7ewQSnHhJtFsKzcnuO2y7LJ3aJa0Y=;
        b=hBX4WSeIvXk0z1+YxB2O+yykmx8JF3MbjOwJzWtJEufFlR9bl+qBsLbU38fHP78jEa
         WDaDCyDik4T796/aQHX0SS1J6BJLF1U8g+SvgmRDXxfX8WelOG+Z82r07beWdpBnr7ER
         gnkqaR/nyQFPuwBiZ7fe1I/dhWn43/0lels6MSXbr8F55smm3v6ZRfFQoS6kK7DrcOa/
         nvJAAfj3WYu2rtNEWf3YuzLANtUsMyutz4nAAzfh4ELPB8Pq9wGRNb2dztrMVmJimThl
         CkDX1q8H5DM3DZnGBEVDHm3yj9jBQ20DiBrZADoYLYbFO/KcMrzKhhsQJnDg9SCBUwPB
         ilBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690783826; x=1691388626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LBd4nFDrmnQ+zd7ewQSnHhJtFsKzcnuO2y7LJ3aJa0Y=;
        b=XFsmJ8zTRhARE2iIibyKSVdDleaqIWixKBzYX/CSAhxVZbKIALN3/OWk7A7AJj28jM
         rt//CSZ0FvFNbzQmMhSBlcbuN4mXTRQ4fxidk8Vj16KOk7olIgRKYoWmkRjKz/s+KsQ3
         SzD7QxoEhV5mFgmKz3RSkrMTwWb2EWjHTPJ2q+X3FoH3rH3rcuKzt86HGrhshKDrak9a
         dxPAvyIK+fqc4NkVM/fGUfL3an7vuAlPhP5+AkIYmcefwjJoPJFu2+20MW/WPMChkkbg
         21iEKRt4Qo1KAjW8afdqwSBoAHIqDRXXcIOho0a0lv27ihswGUen7K8DVLhePYUTOqkr
         JBRg==
X-Gm-Message-State: ABy/qLacl/V/alub4SznCTvHvdTJG4SeoWbFQIPlZv+lD7LTDdDpfXfC
	yh1DMR7XZ8vr6jEOXXHWPJyDj7nWrT4nrbXPKvY=
X-Google-Smtp-Source: APBJJlHoxRNxoJVvmJuwU5pokWU4jqgqgPvSBUZjviWn8HHv9ljOScizozzi97cPw1UxZODPP5UZlanCFUjtL9iJVPg=
X-Received: by 2002:a67:fb07:0:b0:443:66c5:a4e3 with SMTP id
 d7-20020a67fb07000000b0044366c5a4e3mr4432732vsr.15.1690783825717; Sun, 30 Jul
 2023 23:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230728122416.17782-1-lianglixuehao@126.com> <CACPK8Xf6YssamEmHB5XDf8JYk+_=hnG8Yzqn4kCikseqg6rqOA@mail.gmail.com>
In-Reply-To: <CACPK8Xf6YssamEmHB5XDf8JYk+_=hnG8Yzqn4kCikseqg6rqOA@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 31 Jul 2023 14:10:14 +0800
Message-ID: <CAARXrtmZbu3aabYJkEc25rHymRHDX4=zNdecHAs3LnQ259RkPg@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: Avoid accessing freed buffers during i2c transfers.
To: Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="00000000000052eff60601c249f1"
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
Cc: Lixue Liang <lianglixue@greatwall.com.cn>, linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Eddie James <eajames@linux.ibm.com>, Lixue Liang <lianglixuehao@126.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, brendan.higgins@linux.dev, linux-i2c@vger.kernel.org, p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000052eff60601c249f1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There is a same fix in
https://lore.kernel.org/openbmc/374237cb-1cda-df12-eb9f-7422cab51fc4@linux.=
alibaba.com/

On Mon, Jul 31, 2023 at 12:21=E2=80=AFPM Joel Stanley <joel@jms.id.au> wrot=
e:

> On Fri, 28 Jul 2023 at 12:40, Lixue Liang <lianglixuehao@126.com> wrote:
> >
> > From: Lixue Liang <lianglixue@greatwall.com.cn>
> >
> > After waiting for the transmission timeout, the I2C controller will
> > continue to transmit data when the bus is idle. Clearing bus->msg will
> > avoid kernel panic when accessing the freed msg->buf in
> > aspeed_i2c_master_irq.
> >
> > Signed-off-by: Lixue Liang <lianglixue@greatwall.com.cn>
> > ---
> >  drivers/i2c/busses/i2c-aspeed.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-aspeed.c
> b/drivers/i2c/busses/i2c-aspeed.c
> > index 2e5acfeb76c8..c83057497e26 100644
> > --- a/drivers/i2c/busses/i2c-aspeed.c
> > +++ b/drivers/i2c/busses/i2c-aspeed.c
> > @@ -713,6 +713,8 @@ static int aspeed_i2c_master_xfer(struct i2c_adapte=
r
> *adap,
> >                 spin_lock_irqsave(&bus->lock, flags);
> >                 if (bus->master_state =3D=3D ASPEED_I2C_MASTER_PENDING)
> >                         bus->master_state =3D ASPEED_I2C_MASTER_INACTIV=
E;
> > +
> > +               bus->msgs =3D NULL;
>
> Eddie, is this the same issue you were debugging?
>
> >                 spin_unlock_irqrestore(&bus->lock, flags);
> >
> >                 return -ETIMEDOUT;
> > --
> > 2.27.0
> >
>

--00000000000052eff60601c249f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:courier new,monospace">There is a same fix in <a href=3D"https://l=
ore.kernel.org/openbmc/374237cb-1cda-df12-eb9f-7422cab51fc4@linux.alibaba.c=
om/">https://lore.kernel.org/openbmc/374237cb-1cda-df12-eb9f-7422cab51fc4@l=
inux.alibaba.com/</a></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, Jul 31, 2023 at 12:21=E2=80=AFPM Joel St=
anley &lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 28 Jul 20=
23 at 12:40, Lixue Liang &lt;<a href=3D"mailto:lianglixuehao@126.com" targe=
t=3D"_blank">lianglixuehao@126.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Lixue Liang &lt;<a href=3D"mailto:lianglixue@greatwall.com.cn" t=
arget=3D"_blank">lianglixue@greatwall.com.cn</a>&gt;<br>
&gt;<br>
&gt; After waiting for the transmission timeout, the I2C controller will<br=
>
&gt; continue to transmit data when the bus is idle. Clearing bus-&gt;msg w=
ill<br>
&gt; avoid kernel panic when accessing the freed msg-&gt;buf in<br>
&gt; aspeed_i2c_master_irq.<br>
&gt;<br>
&gt; Signed-off-by: Lixue Liang &lt;<a href=3D"mailto:lianglixue@greatwall.=
com.cn" target=3D"_blank">lianglixue@greatwall.com.cn</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/i2c/busses/i2c-aspeed.c | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-=
aspeed.c<br>
&gt; index 2e5acfeb76c8..c83057497e26 100644<br>
&gt; --- a/drivers/i2c/busses/i2c-aspeed.c<br>
&gt; +++ b/drivers/i2c/busses/i2c-aspeed.c<br>
&gt; @@ -713,6 +713,8 @@ static int aspeed_i2c_master_xfer(struct i2c_adapt=
er *adap,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock=
_irqsave(&amp;bus-&gt;lock, flags);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bus-&=
gt;master_state =3D=3D ASPEED_I2C_MASTER_PENDING)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0bus-&gt;master_state =3D ASPEED_I2C_MASTER_INACTIVE;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus-&gt;msgs =
=3D NULL;<br>
<br>
Eddie, is this the same issue you were debugging?<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlo=
ck_irqrestore(&amp;bus-&gt;lock, flags);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -E=
TIMEDOUT;<br>
&gt; --<br>
&gt; 2.27.0<br>
&gt;<br>
</blockquote></div></div>

--00000000000052eff60601c249f1--
