Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 715EAD1777
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 20:19:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pMv90PwczDqbw
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 05:19:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Z9AEm6Ru"; 
 dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pMtL2VQGzDqbW
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 05:19:05 +1100 (AEDT)
Received: by mail-ed1-x543.google.com with SMTP id t3so2904231edw.13
 for <openbmc@lists.ozlabs.org>; Wed, 09 Oct 2019 11:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GdMcIrkVKH15vpUv7HcVBbXmDk1cqleVaDGONWikoKA=;
 b=Z9AEm6RumYtT4MwMoGr/ezGnPA5JfI7D8Y4ALNMR7DBA+fYclAJ8yIHTDfrSDHAm85
 yHF/8r/qb2hffsUAq1CwYL+xyU7hBtMeUHRE8+ra//56p9E8+8/4GAQS08e41wPS+dv4
 DSf0S34xU57aGA2IUUH0uUAK7f8yzsUrpvYvdf8dXtRt27qN/XuByxOM7uQ5MxqqZvMd
 p8AhPXre700CSgdIRexpuz5+Z3cz3HZMPxFLjNcwupgJLj7LvAQIMG01riUWgMKpUN7r
 IptRlzpzd2UtM2tzgrCZ6z8/mPFAhmVKXe3vzeRdwF8kjC6AmJfGlUKEU2vMwQJzlvV1
 YmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GdMcIrkVKH15vpUv7HcVBbXmDk1cqleVaDGONWikoKA=;
 b=oWvwU7LdQ2G1HIutnRjzJqz9GC5ium1lbwM2ijh368C4JuYsooRQ8s6GlWPA06ArT9
 SdpqWxG5oQR3b98lDXqjxa/aK+Ldn8d7sJyk0sy3nwmd8+r7Wz3NUBHa8piD3aB1m5Q5
 vtyO6k4JrXQ58ZKNiOBk1z0zKbN8/bR4WdGOmGYUDfwJ2YOTWh0TyPSc+zHtx3aacas+
 exeY0i2tDhK2Gi2nTdxSE12qCtU9H/dmy2FOjT5t99XSvFxSt/HXc6Tka5Om4R2mNzVM
 1L2RTNtpJEtzIpAZzse7kmIwoOhVeKwADpaWJRSaS0RjRBRgdBKNuTmvpF6lMV5tJYFh
 R0bA==
X-Gm-Message-State: APjAAAUVF2k7Dv+hokHsyIwn+41iKssrL5v21OKxQPgCwiUceFYNcO/n
 YHcw+S6V7V6VMrNsjmZk6S4znp81r5Dc8rIwHH6IfQ==
X-Google-Smtp-Source: APXvYqwBizy96e9vLWX0jhNPSqzniOX71ENGCP31zAWjI5HaRjSKoeH7ifKLqiQ1dS13uaDW+ckf7DjkrD8iq2P2LNA=
X-Received: by 2002:a50:e445:: with SMTP id e5mr4149429edm.257.1570645141363; 
 Wed, 09 Oct 2019 11:19:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190910213734.3112330-1-vijaykhemka@fb.com>
 <bd5eab2e-6ba6-9e27-54d4-d9534da9d5f7@gmail.com>
 <CACPK8XcS4iKfKigPbPg0BFbmjbT-kdyjiPDXjk1k5XaS5bCdAA@mail.gmail.com>
 <95e215664612c0487808c02232852ef2188c95a5.camel@kernel.crashing.org>
In-Reply-To: <95e215664612c0487808c02232852ef2188c95a5.camel@kernel.crashing.org>
From: Oskar Senft <osk@google.com>
Date: Wed, 9 Oct 2019 14:18:44 -0400
Message-ID: <CABoTLcTNwNTua9Neuw5cuFn0Nuz1E6UAakqfkLp1rirbwoQo=w@mail.gmail.com>
Subject: Re: [PATCH] ftgmac100: Disable HW checksum generation on AST2500
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Florian Fainelli <f.fainelli@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b8980905947e518b"
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Andrew Lunn <andrew@lunn.ch>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, netdev@vger.kernel.org,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 YueHaibing <yuehaibing@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vijay Khemka <vijaykhemka@fb.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000b8980905947e518b
Content-Type: text/plain; charset="UTF-8"

Does HW in the AST2500 actually perform the HW checksum calculation, or
would that be the responsibility of the NIC that it's talking to via NC-SI?

Oskar.

On Wed, Oct 9, 2019 at 12:38 AM Benjamin Herrenschmidt <
benh@kernel.crashing.org> wrote:

> On Wed, 2019-09-11 at 14:48 +0000, Joel Stanley wrote:
> > Hi Ben,
> >
> > On Tue, 10 Sep 2019 at 22:05, Florian Fainelli <f.fainelli@gmail.com>
> > wrote:
> > >
> > > On 9/10/19 2:37 PM, Vijay Khemka wrote:
> > > > HW checksum generation is not working for AST2500, specially with
> > > > IPV6
> > > > over NCSI. All TCP packets with IPv6 get dropped. By disabling
> > > > this
> > > > it works perfectly fine with IPV6.
> > > >
> > > > Verified with IPV6 enabled and can do ssh.
> > >
> > > How about IPv4, do these packets have problem? If not, can you
> > > continue
> > > advertising NETIF_F_IP_CSUM but take out NETIF_F_IPV6_CSUM?
> > >
> > > >
> > > > Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> > > > ---
> > > >  drivers/net/ethernet/faraday/ftgmac100.c | 5 +++--
> > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
> > > > b/drivers/net/ethernet/faraday/ftgmac100.c
> > > > index 030fed65393e..591c9725002b 100644
> > > > --- a/drivers/net/ethernet/faraday/ftgmac100.c
> > > > +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> > > > @@ -1839,8 +1839,9 @@ static int ftgmac100_probe(struct
> > > > platform_device *pdev)
> > > >       if (priv->use_ncsi)
> > > >               netdev->hw_features |= NETIF_F_HW_VLAN_CTAG_FILTER;
> > > >
> > > > -     /* AST2400  doesn't have working HW checksum generation */
> > > > -     if (np && (of_device_is_compatible(np, "aspeed,ast2400-
> > > > mac")))
> > > > +     /* AST2400  and AST2500 doesn't have working HW checksum
> > > > generation */
> > > > +     if (np && (of_device_is_compatible(np, "aspeed,ast2400-
> > > > mac") ||
> > > > +                of_device_is_compatible(np, "aspeed,ast2500-
> > > > mac")))
> >
> > Do you recall under what circumstances we need to disable hardware
> > checksumming?
>
> Any news on this ? AST2400 has no HW checksum logic in HW, AST2500
> should work for IPV4 fine, we should only selectively disable it for
> IPV6.
>
> Can you do an updated patch ?
>
> Cheers,
> Ben.
>
>

--000000000000b8980905947e518b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Does HW in the AST2500 actually perform the HW checksum ca=
lculation, or would that be the responsibility of the NIC that it&#39;s tal=
king to via NC-SI?<div><br></div><div>Oskar.</div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 9, 2019 at 12=
:38 AM Benjamin Herrenschmidt &lt;<a href=3D"mailto:benh@kernel.crashing.or=
g">benh@kernel.crashing.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Wed, 2019-09-11 at 14:48 +0000, Joel Stanley =
wrote:<br>
&gt; Hi Ben,<br>
&gt; <br>
&gt; On Tue, 10 Sep 2019 at 22:05, Florian Fainelli &lt;<a href=3D"mailto:f=
.fainelli@gmail.com" target=3D"_blank">f.fainelli@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; On 9/10/19 2:37 PM, Vijay Khemka wrote:<br>
&gt; &gt; &gt; HW checksum generation is not working for AST2500, specially=
 with<br>
&gt; &gt; &gt; IPV6<br>
&gt; &gt; &gt; over NCSI. All TCP packets with IPv6 get dropped. By disabli=
ng<br>
&gt; &gt; &gt; this<br>
&gt; &gt; &gt; it works perfectly fine with IPV6.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Verified with IPV6 enabled and can do ssh.<br>
&gt; &gt; <br>
&gt; &gt; How about IPv4, do these packets have problem? If not, can you<br=
>
&gt; &gt; continue<br>
&gt; &gt; advertising NETIF_F_IP_CSUM but take out NETIF_F_IPV6_CSUM?<br>
&gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Vijay Khemka &lt;<a href=3D"mailto:vijaykhemk=
a@fb.com" target=3D"_blank">vijaykhemka@fb.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 drivers/net/ethernet/faraday/ftgmac100.c | 5 +++--<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; diff --git a/drivers/net/ethernet/faraday/ftgmac100.c<br>
&gt; &gt; &gt; b/drivers/net/ethernet/faraday/ftgmac100.c<br>
&gt; &gt; &gt; index 030fed65393e..591c9725002b 100644<br>
&gt; &gt; &gt; --- a/drivers/net/ethernet/faraday/ftgmac100.c<br>
&gt; &gt; &gt; +++ b/drivers/net/ethernet/faraday/ftgmac100.c<br>
&gt; &gt; &gt; @@ -1839,8 +1839,9 @@ static int ftgmac100_probe(struct<br>
&gt; &gt; &gt; platform_device *pdev)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (priv-&gt;use_ncsi)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0netdev=
-&gt;hw_features |=3D NETIF_F_HW_VLAN_CTAG_FILTER;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0/* AST2400=C2=A0 doesn&#39;t have worki=
ng HW checksum generation */<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (np &amp;&amp; (of_device_is_compati=
ble(np, &quot;aspeed,ast2400-<br>
&gt; &gt; &gt; mac&quot;)))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* AST2400=C2=A0 and AST2500 doesn&#39;=
t have working HW checksum<br>
&gt; &gt; &gt; generation */<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (np &amp;&amp; (of_device_is_compati=
ble(np, &quot;aspeed,ast2400-<br>
&gt; &gt; &gt; mac&quot;) ||<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 of_=
device_is_compatible(np, &quot;aspeed,ast2500-<br>
&gt; &gt; &gt; mac&quot;)))<br>
&gt; <br>
&gt; Do you recall under what circumstances we need to disable hardware<br>
&gt; checksumming?<br>
<br>
Any news on this ? AST2400 has no HW checksum logic in HW, AST2500<br>
should work for IPV4 fine, we should only selectively disable it for<br>
IPV6.<br>
<br>
Can you do an updated patch ?<br>
<br>
Cheers,<br>
Ben.<br>
<br>
</blockquote></div>

--000000000000b8980905947e518b--
