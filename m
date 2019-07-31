Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D497B7B0
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 03:39:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yx1d2MQWzDqWM
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 11:39:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::544; helo=mail-ed1-x544.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ELuYXHOZ"; 
 dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ywyL4cvdzDqYq
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jul 2019 11:36:58 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id m10so64175380edv.6
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 18:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DsjiIzdN9C98Ln51xC2Wnm3ph4LSpWp5IFiT/PBCHqU=;
 b=ELuYXHOZnR/dx1Gf62Lc+shY4Gh5hzlv4BgBu8g5ifzT0AUlWxkfZok0YcP49iJ6yQ
 sVng7xxwqXAcjZSZGBbkBxYmmkTm061mNFiQRnxZSdsK1oMhHHUDPG0060SpOR6JDt9I
 i/488z3hbLEcu7WIkjaYHQYqtap5XQOoc3i9KkaADXkrXk0YmOmQT0Dj3oWfAc2k+9ui
 i365f8QFsXKDjBttSBG6i11kPMErq+NfBdivtNn0PbwyAHQhm76PZl7ASwnZU/oA2RaU
 jBi1F7Ln3ry3qRY6o8+IlNzCBcCLozXGD7HEEJgpTLV6EJ6e9gOuIKgpW7IyGsW+0bv2
 gr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DsjiIzdN9C98Ln51xC2Wnm3ph4LSpWp5IFiT/PBCHqU=;
 b=ZKXpziyhl547ez5eYys+iQs6+jix/hzTW3TccKkGadl4vBd5OjYGQG4k1Ol0nN1RlR
 acCS+tyZ4Bqr3YVASXkqFEktcUyHKNjiJ35sZrj6HFulIhwwPfOxBMEP1xZM4EkqJzyG
 ZKddlCNybjpapLgzu8to/eaT+R1/jADFboE89WGkWbzVZBm2XezZK9lgGihhViMJ2kJ4
 dvf1q5ZUNkKkDhfj8uJvPDmoqAIxm/8eLdpYFdtQmlS1Yvl+UliIqWbnlEeQS1SnL6mu
 bIlMOj1bqhIVvTZviJY8Xf+jFUpJCsNvAlyx2fqwzQiJx62VEkOzSMwDbjqUWiVlA7i3
 +XCA==
X-Gm-Message-State: APjAAAXxUrVEfcdRQ+kPZsxFnXmB4GTXEBW00bUQEzg5BCLLBBvRCV1D
 aqMbiesGUUBlhwpjsTCS16Cdx7AsOfob8N4gqxqb5Q==
X-Google-Smtp-Source: APXvYqzvPkqLHko10kwS49zlk2PVVdqc5YS/aqGlw7JT6wn5gSrGx1C4EJtFYnHO2sins0ZSEByYpiTZdAuhcQ5HXjs=
X-Received: by 2002:a17:906:9147:: with SMTP id
 y7mr92291605ejw.66.1564537013340; 
 Tue, 30 Jul 2019 18:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190727134242.49847-1-osk@google.com>
 <9fb8c99449cebd68fb5975890dedaa06ce7808ae.camel@kernel.crashing.org>
 <CABoTLcRPXffZuKy-DTFUVKJQRydSzMDynYRgBbZ_470iVN1KnA@mail.gmail.com>
 <CABoTLcTSFvQruPRnoRPgiWjOXNDOCSnAXVesG7f1WAuLLLVSSg@mail.gmail.com>
 <6b31627a8c5a2616c83783550517961b7ed8f3cb.camel@ozlabs.org>
 <CABoTLcQF4_He15F5oO0Pxjdm6f7pLCxBF77cz7wR=jjWaednYQ@mail.gmail.com>
 <9855284dfa4c4d4a52441553691c7b4b08a9cc34.camel@ozlabs.org>
 <CABoTLcS2Pepyfc8A-gzm+Nh2T5yCCmexCC94K8Pm=4mtM4JHBA@mail.gmail.com>
 <53f2c3aa-9502-4989-9c22-1a7f1c74cf47@www.fastmail.com>
In-Reply-To: <53f2c3aa-9502-4989-9c22-1a7f1c74cf47@www.fastmail.com>
From: Oskar Senft <osk@google.com>
Date: Tue, 30 Jul 2019 21:36:36 -0400
Message-ID: <CABoTLcQ_BB1VpgCXNcseKaS6y=htk+dW-xSPQ4fV-Re0jEsAxQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/tty/serial/8250: Make Aspeed VUART SIRQ polarity
 configurable
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: multipart/alternative; boundary="000000000000eb68cd058ef02875"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000eb68cd058ef02875
Content-Type: text/plain; charset="UTF-8"

Done. I submitted just a v2 of the patch alongside the other bits and
pieces that are required to make this work.

Let me know if that works for you or if there's anything that should be
changed.

Oskar.

On Sun, Jul 28, 2019 at 11:02 PM Andrew Jeffery <andrew@aj.id.au> wrote:

>
>
> On Mon, 29 Jul 2019, at 11:51, Oskar Senft wrote:
> >
> > Hi Jeremy
> >
> > > Somewhat offtopic, but are you sure you want to enable the SuperIO
> > >  device?
> > No :-D I'm aware of CVE-2019-6260. I just listed it as a potential
> > source of SIRQs.
> > > > The VUART is covered by this code and we don't have a PUART driver
> > >  > yet.
> > >  >
> > >  > It might make sense to have this as a global setting which each
> driver
> > >  > could read. But wouldn't this be an exercise for the future where we
> > >  > actually have a second device? I don't think the Aspeed currently
> has
> > >  > any other devices that could generate a SIRQ (except for the PUART
> for
> > >  > which there's no driver).
> > >
> > >  We have a bunch of SIRQ sources that we use (on OpenPOWER platforms) -
> > >  the BT interface, the KCS interface, the UARTs, and the mbox hardware.
> > >  It's not just the VUART/PUART :)
> > Interesting. From what Aspeed explained, the SIRQ polarity for UARTs is
> > inverted to that for other devices. I haven't looked into how other
> > devices work, to be honest. Do we set the polarity there explicitly?
> > > > Having said that, ideally I'd like the SIRQ polarity to be auto-
> > >  > configured from the LPC/eSPI HW pin strap anyway. I have the code
> for
> > >  > that almost done. Maybe we shouldn't even have the sysfs interface
> for
> > >  > it and I should strip that out?
> > >
> > >  Yeah, I think I agree with that. The only downside is that the
> > >  individual drivers will now need to poke at the SCU to query the
> > >  LPC/eSPI configuration. If you can find a nice way to do that, then
> that
> > >  sounds like the best approach. Can you query it through the parent bus
> > >  perhaps?
> > I'm experimenting with this:
> > syscon_regmap_lookup_by_compatible("aspeed,ast2500-scu");
> >
> > I'll need to think on how to make this work on both ast2400 and
> > ast2500, though. I actually need to have a look at the ast2400 data
> > sheet wrt. VUART registers, too!
> >
> > The structure is this:
> > apb {
> >  syscon {
> >  ...
> >  }
> >  vuart {
> >  ...
> >  }
> > }
> >
> > So the vuart is a sibling of syscon, which holds the registers. I guess
> > I'll have to go with "by_compatible"?
>
> It might be better to add a property to the UART DT node that references
> the SCU syscon by phandle, that way you don't need to muck around
> with compatible names for the SCU syscon.
>
> Andrew
>

--000000000000eb68cd058ef02875
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Done. I submitted just a v2 of the patch alongside the oth=
er bits and pieces that are required to make this work.<div><br></div><div>=
Let me know if that works for you or if there&#39;s anything that should be=
 changed.</div><div><br></div><div>Oskar.</div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jul 28, 2019 at 11:0=
2 PM Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
br>
<br>
On Mon, 29 Jul 2019, at 11:51, Oskar Senft wrote:<br>
&gt; <br>
&gt; Hi Jeremy<br>
&gt; <br>
&gt; &gt; Somewhat offtopic, but are you sure you want to enable the SuperI=
O<br>
&gt; &gt;=C2=A0 device?<br>
&gt; No :-D I&#39;m aware of CVE-2019-6260. I just listed it as a potential=
 <br>
&gt; source of SIRQs.<br>
&gt; &gt; &gt; The VUART is covered by this code and we don&#39;t have a PU=
ART driver<br>
&gt; &gt;=C2=A0 &gt; yet.<br>
&gt; &gt;=C2=A0 &gt; <br>
&gt; &gt;=C2=A0 &gt; It might make sense to have this as a global setting w=
hich each driver<br>
&gt; &gt;=C2=A0 &gt; could read. But wouldn&#39;t this be an exercise for t=
he future where we<br>
&gt; &gt;=C2=A0 &gt; actually have a second device? I don&#39;t think the A=
speed currently has<br>
&gt; &gt;=C2=A0 &gt; any other devices that could generate a SIRQ (except f=
or the PUART for<br>
&gt; &gt;=C2=A0 &gt; which there&#39;s no driver).<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 We have a bunch of SIRQ sources that we use (on OpenPOWER p=
latforms) -<br>
&gt; &gt;=C2=A0 the BT interface, the KCS interface, the UARTs, and the mbo=
x hardware.<br>
&gt; &gt;=C2=A0 It&#39;s not just the VUART/PUART :)<br>
&gt; Interesting. From what Aspeed explained, the SIRQ polarity for UARTs i=
s <br>
&gt; inverted to that for other devices. I haven&#39;t looked into how othe=
r <br>
&gt; devices work, to be honest. Do we set the polarity there explicitly?<b=
r>
&gt; &gt; &gt; Having said that, ideally I&#39;d like the SIRQ polarity to =
be auto-<br>
&gt; &gt;=C2=A0 &gt; configured from the LPC/eSPI HW pin strap anyway. I ha=
ve the code for<br>
&gt; &gt;=C2=A0 &gt; that almost done. Maybe we shouldn&#39;t even have the=
 sysfs interface for<br>
&gt; &gt;=C2=A0 &gt; it and I should strip that out?<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 Yeah, I think I agree with that. The only downside is that =
the <br>
&gt; &gt;=C2=A0 individual drivers will now need to poke at the SCU to quer=
y the<br>
&gt; &gt;=C2=A0 LPC/eSPI configuration. If you can find a nice way to do th=
at, then that<br>
&gt; &gt;=C2=A0 sounds like the best approach. Can you query it through the=
 parent bus<br>
&gt; &gt;=C2=A0 perhaps?<br>
&gt; I&#39;m experimenting with this:<br>
&gt; syscon_regmap_lookup_by_compatible(&quot;aspeed,ast2500-scu&quot;);<br=
>
&gt; <br>
&gt; I&#39;ll need to think on how to make this work on both ast2400 and <b=
r>
&gt; ast2500, though. I actually need to have a look at the ast2400 data <b=
r>
&gt; sheet wrt. VUART registers, too!<br>
&gt; <br>
&gt; The structure is this:<br>
&gt; apb {<br>
&gt;=C2=A0 syscon {<br>
&gt;=C2=A0 ...<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 vuart {<br>
&gt;=C2=A0 ...<br>
&gt;=C2=A0 }<br>
&gt; }<br>
&gt; <br>
&gt; So the vuart is a sibling of syscon, which holds the registers. I gues=
s <br>
&gt; I&#39;ll have to go with &quot;by_compatible&quot;?<br>
<br>
It might be better to add a property to the UART DT node that references<br=
>
the SCU syscon by phandle, that way you don&#39;t need to muck around<br>
with compatible names for the SCU syscon.<br>
<br>
Andrew<br>
</blockquote></div>

--000000000000eb68cd058ef02875--
