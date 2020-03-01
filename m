Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE51C174E9B
	for <lists+openbmc@lfdr.de>; Sun,  1 Mar 2020 17:54:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48VqB106wmzDqjX
	for <lists+openbmc@lfdr.de>; Mon,  2 Mar 2020 03:54:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::242;
 helo=mail-oi1-x242.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KGlaFMXH; dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Vq9M24lbzDqbm
 for <openbmc@lists.ozlabs.org>; Mon,  2 Mar 2020 03:53:40 +1100 (AEDT)
Received: by mail-oi1-x242.google.com with SMTP id v19so7946916oic.12
 for <openbmc@lists.ozlabs.org>; Sun, 01 Mar 2020 08:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yPjg7l2aej1F2Z8f87uo/Rpy74cXkl5WbTSb6CzHrE8=;
 b=KGlaFMXHBpmui4QURxo0sb+cr2tW3WKaYCddOqiHN/ooi0hWXcFYAa5OvRq3uAlkZ1
 W6EwaueGydNmvpcHdlF1VwgxTVhlM1t0Dr22f/6Ycfx5l4UXcZZ5V26vkvG5MOnsucX4
 16HDO9DcpQSKJvTT8yAkAPMzku45039SSPvKdJb/8pcNIeDVkC2zNRgAmL/n17gbX7YC
 3eI0h4GliF1pJsszP5px2o8Uo0CpaAj4q4BRXiYrP2cLsAu9S0ky1JeTwLAyOabO/uHe
 9nPGvpnS5u9y/JamIlCtLNZfhJOzp6tMQkRE9D7vBAPw1vaLkDvtA/oID9ZTlH/9F7Qp
 7F2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yPjg7l2aej1F2Z8f87uo/Rpy74cXkl5WbTSb6CzHrE8=;
 b=dyJFSjwylOuTzCMYCntFupgPpE7dAtas+Kw1+mP2flJaZINcGrs1xoEMteDzzVGIQE
 xLflsJJMUlr7kJNao+fnof3ZHisZmf5ajz6CjlA/j46HwnHEC0x+GADSKUxt59AqN7+J
 uRSzhUqYqSiOVgNkGY+X8mS7nTL8q1KyFGJBwe3kw67jkKrsfZjamLsU25vOO9eWAGwp
 xvodsNO3SchMdXx/gbuB4gADWur0Iz5hK4bvL5uVnpk20dlBESq9OCpMXUh+q3xLTjBy
 S92zLlryM9wO/qbijYJaOpcuqzwSQiXzublNZwHPh0fwMDGChHk7lKQCVXozgIwLeL9O
 7D9w==
X-Gm-Message-State: APjAAAUGQyFuUZ6DgEy5KDQ9Xx+1J1hKRJoRtwqJ/4EjZnQpNoOuvIjQ
 uJS6LVCJ3tifKJIBG64T6R0a4BJTeGS27FxMnN0=
X-Google-Smtp-Source: APXvYqxaZP+nY7ZSqrs/09A6ZkYJjnMouewO5ZAyASPtNwJEpmovWS8IuIrIIS+FuEfIIQhTauboztLalEOIXVxsGY0=
X-Received: by 2002:aca:cd0e:: with SMTP id d14mr8654047oig.167.1583081617120; 
 Sun, 01 Mar 2020 08:53:37 -0800 (PST)
MIME-Version: 1.0
References: <20200301094040.123189-1-tmaimon77@gmail.com>
 <20200301094040.123189-5-tmaimon77@gmail.com>
 <026fa94c-8fde-acda-e218-ffff9b5891c9@roeck-us.net>
 <CAP6Zq1hPsnJ1UxAQ-wK_pkaJqzWRQ-_g5-k0Kag2YoP+c2fPjQ@mail.gmail.com>
 <998cedf4-82cb-be1b-699f-608ea7a21064@roeck-us.net>
In-Reply-To: <998cedf4-82cb-be1b-699f-608ea7a21064@roeck-us.net>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 1 Mar 2020 19:03:32 +0200
Message-ID: <CAP6Zq1hyrXKtBo8oOCOdvNoLb0AAQHD5ksd+aCLnEw16TNzETw@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] watchdog: npcm: sets card ext1 and ext2 bootstatus
 during probe
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: multipart/alternative; boundary="00000000000070630c059fcde9ec"
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000070630c059fcde9ec
Content-Type: text/plain; charset="UTF-8"

I deeply sorry Guenter,

Each of the bit boot status have the maximum flexibility to represent the
entire resets (I will make sure to modify the commit message as in the
device tree document)
So if the user using WD0 to restart the board and WD1 for a board health
monitor it can be represented at EXT1 and EXT2.

If I will use a group for each reset type in a case above the user will
need to read the RESSR register (prefer not to do it)  to know which reset
occur.

Sorry again.

Tomer

On Sun, 1 Mar 2020 at 18:10, Guenter Roeck <linux@roeck-us.net> wrote:

> On 3/1/20 8:08 AM, Tomer Maimon wrote:
> > Sorry Guenter probebly I didnt explain it well.
> >
> >
> > On Sun, 1 Mar 2020 at 12:48, Guenter Roeck <linux@roeck-us.net <mailto:
> linux@roeck-us.net>> wrote:
> >
> >     On 3/1/20 1:40 AM, Tomer Maimon wrote:
> >     > During probe NPCM watchdog sets the following bootstatus flags:
> >     >       - WDIOF_CARDRESET represent power and core reset.
> >     >       - WDIOF_EXTERN1 represent watchdog 0-2 reset.
> >     >       - WDIOF_EXTERN2 represent software 1-4 reset.
> >     >
> >     > Each flag is representing a group of bootstatus.
> >     > The user can configure through the device treethe exact reset
> >     > to each flag group.
> >     >
> >
> >     Sorry, this doesn't make sense to me. I could understand reporting
> >     the above, but it looks to me like devicetree is used to associate
> >     a reset bit from the controller with one of the above.
> >     Devicetree only seems to be used to associate reset status bits
> >     from the controller with WDIOF_CARDRESET, WDIOF_EXTERN1, or
> >     WDIOF_EXTERN2. That adds a lot of complexity for little if any
> >     gain.
> >
> >
> >
> >     It would make sense to set the bootstatus bits as suggested above,
> >     but that doesn't require devicetree properties.
> >
> >     More comments inline.
> >
> >     Guenter
> >
> >
> >
> > In the NPCM750 we have the following reset types:
> >
> >  1. board reset (Power on reset, Core reset)
> >  2. WD reset (0-2 WD reset).
> >  3. SW reset (1-4 SW reset).
> >
> >
> > Each board can use different reset types, because in the WD status bit
> there is not enough bits to represent the entire NPCM750 resets.
> >
> > The NPCM750 reset groups are represent as follow:
> >
> >  - WDIOF_CARDRESET represent power and core reset.
> >  - WDIOF_EXTERN1 represent watchdog 0-2 reset.
> >  - WDIOF_EXTERN2 represent software 1-4 reset.
> >
> Exactly, and I don't see a need to be more specific than that.
> This can be implemented without all the DT complexity.
>
> Guenter
>

--00000000000070630c059fcde9ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I deeply sorry Guenter,<div><br></div><div>Each of the bit=
 boot status have the maximum flexibility=C2=A0to represent the entire rese=
ts (I will make sure to modify the commit message as in the device tree doc=
ument)</div><div>So if the user using WD0 to restart the board and WD1 for =
a board health monitor it can be represented=C2=A0at EXT1 and EXT2.</div><d=
iv><br></div><div>If I will use a group for each reset type in a case above=
 the user will need to read the RESSR register (prefer not to do it)=C2=A0 =
to know which reset occur.</div><div><br></div><div>Sorry again.</div><div>=
<br></div><div>Tomer</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Sun, 1 Mar 2020 at 18:10, Guenter Roeck &lt;<a=
 href=3D"mailto:linux@roeck-us.net">linux@roeck-us.net</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On 3/1/20 8:08 AM, To=
mer Maimon wrote:<br>
&gt; Sorry Guenter probebly I didnt explain it well.<br>
&gt; <br>
&gt; <br>
&gt; On Sun, 1 Mar 2020 at 12:48, Guenter Roeck &lt;<a href=3D"mailto:linux=
@roeck-us.net" target=3D"_blank">linux@roeck-us.net</a> &lt;mailto:<a href=
=3D"mailto:linux@roeck-us.net" target=3D"_blank">linux@roeck-us.net</a>&gt;=
&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 3/1/20 1:40 AM, Tomer Maimon wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; During probe NPCM watchdog sets the following =
bootstatus flags:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- WDIOF_CARDRESET re=
present power and core reset.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- WDIOF_EXTERN1 repr=
esent watchdog 0-2 reset.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- WDIOF_EXTERN2 repr=
esent software 1-4 reset.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Each flag is representing a group of bootstatu=
s.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; The user can configure through the device tree=
the exact reset<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; to each flag group.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Sorry, this doesn&#39;t make sense to me. I could u=
nderstand reporting<br>
&gt;=C2=A0 =C2=A0 =C2=A0the above, but it looks to me like devicetree is us=
ed to associate<br>
&gt;=C2=A0 =C2=A0 =C2=A0a reset bit from the controller with one of the abo=
ve.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Devicetree only seems to be used to associate reset=
 status bits<br>
&gt;=C2=A0 =C2=A0 =C2=A0from the controller with WDIOF_CARDRESET, WDIOF_EXT=
ERN1, or<br>
&gt;=C2=A0 =C2=A0 =C2=A0WDIOF_EXTERN2. That adds a lot of complexity for li=
ttle if any<br>
&gt;=C2=A0 =C2=A0 =C2=A0gain.=C2=A0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0It would make sense to set the bootstatus bits as s=
uggested above,<br>
&gt;=C2=A0 =C2=A0 =C2=A0but that doesn&#39;t require devicetree properties.=
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0More comments inline.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Guenter=C2=A0<br>
&gt; <br>
&gt; =C2=A0<br>
&gt; <br>
&gt; In the NPCM750 we have the following reset types:<br>
&gt; <br>
&gt;=C2=A0 1. board reset (Power on reset, Core reset)<br>
&gt;=C2=A0 2. WD reset (0-2 WD reset).<br>
&gt;=C2=A0 3. SW reset (1-4 SW reset).<br>
&gt; <br>
&gt; <br>
&gt; Each board can use different reset types, because in the WD status bit=
 there is not enough bits to represent the entire NPCM750 resets.<br>
&gt; <br>
&gt; The NPCM750 reset groups are represent as follow:<br>
&gt; <br>
&gt; =C2=A0- WDIOF_CARDRESET represent power and core reset.<br>
&gt; =C2=A0- WDIOF_EXTERN1 represent watchdog 0-2 reset.<br>
&gt; =C2=A0- WDIOF_EXTERN2 represent software 1-4 reset.<br>
&gt; <br>
Exactly, and I don&#39;t see a need to be more specific than that.<br>
This can be implemented without all the DT complexity.<br>
<br>
Guenter<br>
</blockquote></div>

--00000000000070630c059fcde9ec--
