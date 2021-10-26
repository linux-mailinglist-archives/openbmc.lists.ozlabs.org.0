Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C2243B765
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 18:39:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdyFx0KkNz2ynV
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 03:39:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Npabo4bU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::533;
 helo=mail-ed1-x533.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Npabo4bU; dkim-atps=neutral
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdyFT2bz0z2xrx;
 Wed, 27 Oct 2021 03:38:52 +1100 (AEDT)
Received: by mail-ed1-x533.google.com with SMTP id u13so16673605edy.10;
 Tue, 26 Oct 2021 09:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TUxCBN8G1CatZtJjcIWPbGHiwRB7avUnG3Irx6/E4EU=;
 b=Npabo4bUKUFFW4xgkuUrUcFXK3PYq/u3CS31GuGtqq5UkmjV4rhLdaK1CBmXufYC5v
 dPKAP1UJxcv25AI96oBVZfPcECaYpIjqB6SO0wtb6lO2RGyQVvT2w4KuyT9h5IaV2Lep
 crM/teNSrePsmchwLrv0Furg0FzmaxIeT/IhsiQKP0hwEHSajSacGR2sCU5SKbjuW9+8
 cbIZXy/tFOIsGmEhQMcJTLOa6KA6jyDmnvyM5WAReR9239D9t7EY0BeD1S54oXPaDBOX
 09B/9EnKy7TolYpiZWmwKQDHq5rXGpReeyhuKrFmcbuLe0r7nC1zjjEFKNEDTs7CmNqC
 5w6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TUxCBN8G1CatZtJjcIWPbGHiwRB7avUnG3Irx6/E4EU=;
 b=HESMdPRcUMSvf0oPaRlKbl5vl79qwJrnegRBTLxAwSOa9uj35qAgsPNl/h+a0jsNPU
 gWum2/nX/7Zgwm8+DsS56Fm/7YdLZEKHVZoqFG3VuffDcPvX6yr903zvAcPXvxMtXUMH
 l11S24WeBjMtgfogFVvfTnn3L8/aQqEyQnYRXHMBK7ZOKpgEVQJJcdfElrP5CKnsA113
 /pP1yqhhP4a40I4EptOWt0RbwJzVLpGqcexHkq3TFQVnIhubkFxovJWvQdsn8INn1nGx
 2TcJ3nJC/Hfj7L70PdUzdIQcyeEd2yGXQOufOp7eQtSwOdkB6OF0OYugTiwmCeIfJJhM
 mRtQ==
X-Gm-Message-State: AOAM5337vMeheyFmfgTA3fwfG4ZIX4AVnLBSOcaLtWpJELZPloml1qVI
 WYX4B2ZNqFtrSRbLetPQjcCVTRE4dXLYHVF1+fo=
X-Google-Smtp-Source: ABdhPJyFp1oTl6nl/7rLrMfSEpD2eYu2gaTrdHN7TTjHlJkGYzKCIQt6lDL0ZUuyf5721r0gNXIWD3CBOJOgLOBVJoA=
X-Received: by 2002:a17:907:2d1e:: with SMTP id
 gs30mr18203125ejc.565.1635266216572; 
 Tue, 26 Oct 2021 09:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211026144953.GA15611@gmail.com>
 <20211026083356.0719fc5e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211026083356.0719fc5e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Tue, 26 Oct 2021 22:08:48 +0530
Message-ID: <CAA7Tbcu65ZWc=acbrzbXCziXJto8+shNEsdL3xWLit3ArHnBJA@mail.gmail.com>
Subject: Re: [PATCH v3] Add payload to be 32-bit aligned to fix dropped packets
To: Jakub Kicinski <kuba@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000f3bc2f05cf4415c1"
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Amithash Prasad <amithash@fb.com>,
 patrickw3@fb.com, Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 velumanit@hcl.com, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000f3bc2f05cf4415c1
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 26, 2021 at 9:03 PM Jakub Kicinski <kuba@kernel.org> wrote:

> On Tue, 26 Oct 2021 20:19:53 +0530 Kumar Thangavel wrote:
> > Update NC-SI command handler (both standard and OEM) to take into
> > account of payload paddings in allocating skb (in case of payload
> > size is not 32-bit aligned).
> >
> > The checksum field follows payload field, without taking payload
> > padding into account can cause checksum being truncated, leading to
> > dropped packets.
> >
> > Signed-off-by: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
> > Acked-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> > Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
>
> You need to CC netdev@ if you want this applied to networking trees.
>
> > diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
> > index ba9ae482141b..179e39105072 100644
> > --- a/net/ncsi/ncsi-cmd.c
> > +++ b/net/ncsi/ncsi-cmd.c
> > @@ -18,6 +18,8 @@
> >  #include "internal.h"
> >  #include "ncsi-pkt.h"
> >
> > +#define MAX(X, Y) (((X) > (Y)) ? (X) : (Y))
>
> Please use one of the existing max() macroes in the kernel.
>

Ack.  I will use existing macros.

Thanks,
Kumar.

--000000000000f3bc2f05cf4415c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 26, 2021 at 9:03 PM Jakub=
 Kicinski &lt;<a href=3D"mailto:kuba@kernel.org">kuba@kernel.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 26 =
Oct 2021 20:19:53 +0530 Kumar Thangavel wrote:<br>
&gt; Update NC-SI command handler (both standard and OEM) to take into<br>
&gt; account of payload paddings in allocating skb (in case of payload<br>
&gt; size is not 32-bit aligned).<br>
&gt; <br>
&gt; The checksum field follows payload field, without taking payload<br>
&gt; padding into account can cause checksum being truncated, leading to<br=
>
&gt; dropped packets.<br>
&gt; <br>
&gt; Signed-off-by: Kumar Thangavel &lt;<a href=3D"mailto:kumarthangavel.hc=
l@gmail.com" target=3D"_blank">kumarthangavel.hcl@gmail.com</a>&gt;<br>
&gt; Acked-by: Samuel Mendoza-Jonas &lt;<a href=3D"mailto:sam@mendozajonas.=
com" target=3D"_blank">sam@mendozajonas.com</a>&gt;<br>
&gt; Reviewed-by: Paul Menzel &lt;<a href=3D"mailto:pmenzel@molgen.mpg.de" =
target=3D"_blank">pmenzel@molgen.mpg.de</a>&gt;<br>
<br>
You need to CC netdev@ if you want this applied to networking trees.<br>
<br>
&gt; diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c<br>
&gt; index ba9ae482141b..179e39105072 100644<br>
&gt; --- a/net/ncsi/ncsi-cmd.c<br>
&gt; +++ b/net/ncsi/ncsi-cmd.c<br>
&gt; @@ -18,6 +18,8 @@<br>
&gt;=C2=A0 #include &quot;internal.h&quot;<br>
&gt;=C2=A0 #include &quot;ncsi-pkt.h&quot;<br>
&gt;=C2=A0 <br>
&gt; +#define MAX(X, Y) (((X) &gt; (Y)) ? (X) : (Y))<br>
<br>
Please use one of the existing max() macroes in the kernel.<br></blockquote=
><div><br></div><div>Ack.=C2=A0 I will use existing macros.</div><div><br><=
/div><div>Thanks,</div><div>Kumar.</div></div></div>

--000000000000f3bc2f05cf4415c1--
