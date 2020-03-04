Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 531C6178C41
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 09:09:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XRNX3PPZzDqYh
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 19:09:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=L55m+igD; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XRMq5kQBzDq5k
 for <openbmc@lists.ozlabs.org>; Wed,  4 Mar 2020 19:08:20 +1100 (AEDT)
Received: by mail-ot1-x342.google.com with SMTP id a20so1176598otl.0
 for <openbmc@lists.ozlabs.org>; Wed, 04 Mar 2020 00:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fhWRSGO85yhnu4zfmPh7Bgzjs00fMsbjWRbiBDO/QHA=;
 b=L55m+igDWv9t1xe8CzL64bQmmdq9q5oCRE7bwzIo1hxCqOTHF2jqi/BUe3v+P1O3xA
 Qc/XH/1WFFjZu68MN9MZHgae/yM4XHpCg69aBvUWRG/1c5GYt/s70Eo+3MObcGd6Zl0z
 rHOTe5aL8ITNmo1RESBdnG33HEP/TjXDNc16oMv6r0PPZS5maYvOSQQtEIK5xGVZFcUU
 R8Wwbl6E4jMhwzR0MIHxjffDFaOBS6a5NpTxw1kT0Z5X9Ln9yTLUncs+Iva67quoi2xL
 Yc7Fu5VzxCQYGrpy3U4PUkKs6lUiAxpLeRnA4A9O9+jGqfYVZpf+2wNIbFY0ONAiFJn0
 bMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fhWRSGO85yhnu4zfmPh7Bgzjs00fMsbjWRbiBDO/QHA=;
 b=AGyc2ahrmcYFZnPdvo6E5SdDKRQEdRv8/fKVcWXlskK1sVFC2IOzX4QsjmqEVrtxj2
 xj/N4tFRJV3K8dTv1FLbRSgp7sZFJoT7XCpEkr1VU20+dWJ7q2j4TkRDplBs8R1J6ixO
 fO2+DVk1MaOW3rgucNICHDaheL0ngsA4R2cwoNI3ZrrPaC23AnIEH6r6OGsIYS52T6dB
 3yV02gmdkxPkANz+5G7A/GQVWC5v5K6f3rUzhOJh4U6pVX/fS3jzXyhd/tBoZ7cyGe2Z
 26d4YeDTWeemb92F/ay0O8fqy4T7MgP9Y9Q+qoc9wjIVLYVtDEbFFUI6Rv7BKwcIhIW9
 H8eQ==
X-Gm-Message-State: ANhLgQ03X7xCzCm7zZAkmVd/A9Y2z7lQmo1lNIKkieaTxtYnG3S/868R
 7u7IkvSdC77X8vvN1uyPbfekWV6JcsI6894IxGo=
X-Google-Smtp-Source: ADFU+vvqbsvWRBG4Hwi3h9XZEQjf1bdGwE+xM0LcnR3XcZ0QrPJJWBC73vUuBm8HQx/OASMrz4X5wnnRn3GHqnSmcwg=
X-Received: by 2002:a05:6830:22d8:: with SMTP id
 q24mr1507614otc.0.1583309297525; 
 Wed, 04 Mar 2020 00:08:17 -0800 (PST)
MIME-Version: 1.0
References: <20200303100114.87786-1-tmaimon77@gmail.com>
 <20200303100114.87786-4-tmaimon77@gmail.com>
 <20200303212512.GA20448@roeck-us.net>
In-Reply-To: <20200303212512.GA20448@roeck-us.net>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 4 Mar 2020 10:18:12 +0200
Message-ID: <CAP6Zq1gW53NEH7vD9C9GK2sg1pOxeZinA5uMJQQmbntrf=2ySA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] watchdog: npcm: remove whitespaces
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: multipart/alternative; boundary="0000000000003fa67905a002ec74"
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

--0000000000003fa67905a002ec74
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

I still see the whitespaces warning in v5.6-rc4

https://github.com/torvalds/linux/blob/master/drivers/watchdog/npcm_wdt.c#L106


bash-4.2$ ./scripts/checkpatch.pl --strict --file
drivers/watchdog/npcm_wdt.c
CHECK: Please don't use multiple blank lines
#106: FILE: drivers/watchdog/npcm_wdt.c:106:
+
+

WARNING: suspect code indent for conditional statements (8, 14)
#112: FILE: drivers/watchdog/npcm_wdt.c:112:
+ else if (timeout < 3)
+      wdd->timeout = 2;

WARNING: suspect code indent for conditional statements (8, 14)
#114: FILE: drivers/watchdog/npcm_wdt.c:114:
+ else if (timeout < 6)
+      wdd->timeout = 5;

WARNING: suspect code indent for conditional statements (8, 14)
#116: FILE: drivers/watchdog/npcm_wdt.c:116:
+ else if (timeout < 11)
+      wdd->timeout = 10;

WARNING: suspect code indent for conditional statements (8, 14)
#118: FILE: drivers/watchdog/npcm_wdt.c:118:
+ else if (timeout < 22)
+      wdd->timeout = 21;

WARNING: suspect code indent for conditional statements (8, 14)
#120: FILE: drivers/watchdog/npcm_wdt.c:120:
+ else if (timeout < 44)
+      wdd->timeout = 43;

WARNING: suspect code indent for conditional statements (8, 14)
#122: FILE: drivers/watchdog/npcm_wdt.c:122:
+ else if (timeout < 87)
+      wdd->timeout = 86;

WARNING: suspect code indent for conditional statements (8, 14)
#124: FILE: drivers/watchdog/npcm_wdt.c:124:
+ else if (timeout < 173)
+      wdd->timeout = 172;

WARNING: suspect code indent for conditional statements (8, 14)
#126: FILE: drivers/watchdog/npcm_wdt.c:126:
+ else if (timeout < 688)
+      wdd->timeout = 687;

WARNING: suspect code indent for conditional statements (8, 14)
#128: FILE: drivers/watchdog/npcm_wdt.c:128:
+ else
+      wdd->timeout = 2750;

Thanks,

Tomer

On Tue, 3 Mar 2020 at 23:25, Guenter Roeck <linux@roeck-us.net> wrote:

> On Tue, Mar 03, 2020 at 12:01:14PM +0200, Tomer Maimon wrote:
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>
> Turns out this problem does not actually exist in the upstream driver
> (as of v5.6-rc4). You might want to align your code with the upstream
> kernel.
>
> Guenter
>
> > ---
> >  drivers/watchdog/npcm_wdt.c | 19 +++++++++----------
> >  1 file changed, 9 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
> > index 84a728af6664..bd38bf1ee6a1 100644
> > --- a/drivers/watchdog/npcm_wdt.c
> > +++ b/drivers/watchdog/npcm_wdt.c
> > @@ -123,30 +123,29 @@ static int npcm_wdt_stop(struct watchdog_device
> *wdd)
> >       return 0;
> >  }
> >
> > -
> >  static int npcm_wdt_set_timeout(struct watchdog_device *wdd,
> >                               unsigned int timeout)
> >  {
> >       if (timeout < 2)
> >               wdd->timeout = 1;
> >       else if (timeout < 3)
> > -           wdd->timeout = 2;
> > +             wdd->timeout = 2;
> >       else if (timeout < 6)
> > -           wdd->timeout = 5;
> > +             wdd->timeout = 5;
> >       else if (timeout < 11)
> > -           wdd->timeout = 10;
> > +             wdd->timeout = 10;
> >       else if (timeout < 22)
> > -           wdd->timeout = 21;
> > +             wdd->timeout = 21;
> >       else if (timeout < 44)
> > -           wdd->timeout = 43;
> > +             wdd->timeout = 43;
> >       else if (timeout < 87)
> > -           wdd->timeout = 86;
> > +             wdd->timeout = 86;
> >       else if (timeout < 173)
> > -           wdd->timeout = 172;
> > +             wdd->timeout = 172;
> >       else if (timeout < 688)
> > -           wdd->timeout = 687;
> > +             wdd->timeout = 687;
> >       else
> > -           wdd->timeout = 2750;
> > +             wdd->timeout = 2750;
> >
> >       if (watchdog_active(wdd))
> >               npcm_wdt_start(wdd);
>

--0000000000003fa67905a002ec74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Guenter,<div><br></div><div>I still see the whitespaces=
 warning in v5.6-rc4</div><div><br></div><div><a href=3D"https://github.com=
/torvalds/linux/blob/master/drivers/watchdog/npcm_wdt.c#L106">https://githu=
b.com/torvalds/linux/blob/master/drivers/watchdog/npcm_wdt.c#L106</a>=C2=A0=
=C2=A0<br></div><div><br></div><div><font face=3D"monospace">bash-4.2$ ./sc=
ripts/<a href=3D"http://checkpatch.pl">checkpatch.pl</a> --strict --file dr=
ivers/watchdog/npcm_wdt.c <br>CHECK: Please don&#39;t use multiple blank li=
nes<br>#106: FILE: drivers/watchdog/npcm_wdt.c:106:<br>+<br>+<br><br>WARNIN=
G: suspect code indent for conditional statements (8, 14)<br>#112: FILE: dr=
ivers/watchdog/npcm_wdt.c:112:<br>+	else if (timeout &lt; 3)<br>+	 =C2=A0 =
=C2=A0 =C2=A0wdd-&gt;timeout =3D 2;<br><br>WARNING: suspect code indent for=
 conditional statements (8, 14)<br>#114: FILE: drivers/watchdog/npcm_wdt.c:=
114:<br>+	else if (timeout &lt; 6)<br>+	 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeou=
t =3D 5;<br><br>WARNING: suspect code indent for conditional statements (8,=
 14)<br>#116: FILE: drivers/watchdog/npcm_wdt.c:116:<br>+	else if (timeout =
&lt; 11)<br>+	 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 10;<br><br>WARNING: =
suspect code indent for conditional statements (8, 14)<br>#118: FILE: drive=
rs/watchdog/npcm_wdt.c:118:<br>+	else if (timeout &lt; 22)<br>+	 =C2=A0 =C2=
=A0 =C2=A0wdd-&gt;timeout =3D 21;<br><br>WARNING: suspect code indent for c=
onditional statements (8, 14)<br>#120: FILE: drivers/watchdog/npcm_wdt.c:12=
0:<br>+	else if (timeout &lt; 44)<br>+	 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout=
 =3D 43;<br><br>WARNING: suspect code indent for conditional statements (8,=
 14)<br>#122: FILE: drivers/watchdog/npcm_wdt.c:122:<br>+	else if (timeout =
&lt; 87)<br>+	 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 86;<br><br>WARNING: =
suspect code indent for conditional statements (8, 14)<br>#124: FILE: drive=
rs/watchdog/npcm_wdt.c:124:<br>+	else if (timeout &lt; 173)<br>+	 =C2=A0 =
=C2=A0 =C2=A0wdd-&gt;timeout =3D 172;<br><br>WARNING: suspect code indent f=
or conditional statements (8, 14)<br>#126: FILE: drivers/watchdog/npcm_wdt.=
c:126:<br>+	else if (timeout &lt; 688)<br>+	 =C2=A0 =C2=A0 =C2=A0wdd-&gt;ti=
meout =3D 687;<br><br>WARNING: suspect code indent for conditional statemen=
ts (8, 14)<br>#128: FILE: drivers/watchdog/npcm_wdt.c:128:<br>+	else<br>+	 =
=C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 2750;</font><br></div><div><font fa=
ce=3D"monospace"><br></font></div><div><font face=3D"arial, sans-serif">Tha=
nks,</font></div><div><font face=3D"arial, sans-serif"><br></font></div><di=
v><font face=3D"arial, sans-serif">Tomer</font></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 3 Mar 2020 a=
t 23:25, Guenter Roeck &lt;<a href=3D"mailto:linux@roeck-us.net">linux@roec=
k-us.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Tue, Mar 03, 2020 at 12:01:14PM +0200, Tomer Maimon wrote:<br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
<br>
Turns out this problem does not actually exist in the upstream driver<br>
(as of v5.6-rc4). You might want to align your code with the upstream<br>
kernel.<br>
<br>
Guenter<br>
<br>
&gt; ---<br>
&gt;=C2=A0 drivers/watchdog/npcm_wdt.c | 19 +++++++++----------<br>
&gt;=C2=A0 1 file changed, 9 insertions(+), 10 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c=
<br>
&gt; index 84a728af6664..bd38bf1ee6a1 100644<br>
&gt; --- a/drivers/watchdog/npcm_wdt.c<br>
&gt; +++ b/drivers/watchdog/npcm_wdt.c<br>
&gt; @@ -123,30 +123,29 @@ static int npcm_wdt_stop(struct watchdog_device =
*wdd)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -<br>
&gt;=C2=A0 static int npcm_wdt_set_timeout(struct watchdog_device *wdd,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int timeout)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (timeout &lt; 2)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =
=3D 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (timeout &lt; 3)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 2=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (timeout &lt; 6)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 5;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 5=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (timeout &lt; 11)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 10;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 1=
0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (timeout &lt; 22)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 21;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 2=
1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (timeout &lt; 44)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 43;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 4=
3;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (timeout &lt; 87)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 86;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 8=
6;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (timeout &lt; 173)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 172;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 1=
72;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (timeout &lt; 688)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 687;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 6=
87;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 2750;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 2=
750;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (watchdog_active(wdd))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm_wdt_start(w=
dd);<br>
</blockquote></div>

--0000000000003fa67905a002ec74--
