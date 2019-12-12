Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 667F811D865
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 22:16:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Ymnk44vpzDr83
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 08:16:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d42;
 helo=mail-io1-xd42.google.com; envelope-from=kunyi@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Ymmv3mdYzDr32
 for <openbmc@lists.ozlabs.org>; Fri, 13 Dec 2019 08:15:58 +1100 (AEDT)
Received: by mail-io1-xd42.google.com with SMTP id v3so158271ioj.5
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 13:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6RqXH3hwXBGypLBrD6Auj9MSqeH6nOygh4qrKzUbtv8=;
 b=iDYSr6Lup+L2MJodneexUVypGEC77Byj35Up02FUzCXynuqm0T4bjKLgXu1lzQSLuC
 N+HUq4HWUZvI9kMMU6P3AAuY6a/h+xBaxcXvSOsAtaJJgnPolYv4pMFrg9qi4Nno8lFm
 TGJClx/d51iKvx2OK8qfMzHnU4s1wKuteI9sW+bxNKy0h+jblyhgM3TXHVzUOE93w5v7
 zSK3BvXrni7oDIy1xViyW56mYl3bim/uCRsOvk/5lKrjd5Xp+bq3C54C2/o4OWZJouYG
 Yku3ZpJFa0QqdT2YDSkABQy2NGcJC6FLKTnh9Em/k+p7DKbrKRAlUJZRZSBDAyXkrq8R
 77BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6RqXH3hwXBGypLBrD6Auj9MSqeH6nOygh4qrKzUbtv8=;
 b=EJa+qJDbMrbkjt9IhNaQmJpSr1bHp3PIMzSt6Z1CPqTSW2pBP2ict5buBmW9y6F0YV
 Da56XHlYmnbuaHXTYZYLm0OUZBD6NCSCDZusPd4q47u0kvZbvugPOxsmCC82vYH2m9HE
 6RKLwyrOEh834HjuWCCqHtUE0npGnyHPTxAWgc7HxShMXeGCAXV5IXMXbjvEE8t5EBoC
 W7dyFyK/OtrsxvTiY1p9aQfWOuRatKYinG2ZF1K+FWNUEOlVOdFcpNF8FgK30uNTCx4C
 D+rr4M7zKoireDr0C0TBgBtv7ZX81pf3zl/gKqTpGckY2+kl2daW1M/SD/MxCleFeWvC
 g07A==
X-Gm-Message-State: APjAAAUjW6Um8+C7mlau6hueOV89kWwhW78MXrWpdnpP1fBauWle49Hm
 td88WOduwaWF6d03NeFAyqkXXdaBphRA703S6GZCpw==
X-Google-Smtp-Source: APXvYqwLQq4BYGQT1RsFvTB1ppN4SN6GdjpfC5FYAOQnR26k4q38JqK/53NkklHurGBPaGfU2/jaue31bx50djcW4hE=
X-Received: by 2002:a02:a58a:: with SMTP id b10mr9911506jam.86.1576185345864; 
 Thu, 12 Dec 2019 13:15:45 -0800 (PST)
MIME-Version: 1.0
References: <CAO9PYRLd5KJHiuvDxzGcw7E5CVapk3Fonm_mPDaov1zaVHZm2g@mail.gmail.com>
 <4ffc887c-9160-a5a6-2bf9-0a86c872cd60@linux.ibm.com>
 <CAO9PYRL=OHexpzjazShywXxg1w5FeUA4=dkupNXCY-85+CckJQ@mail.gmail.com>
 <1a21e764-151b-a3b5-ad4b-0d79f336d48d@linux.ibm.com>
 <CAO9PYRJGne+VxENsY6r_mGzdAxf-sUgzLu71tnRQipO9hPLV=Q@mail.gmail.com>
 <edbcee28-8f02-77c6-c9e2-8914ee7b25fd@linux.ibm.com>
In-Reply-To: <edbcee28-8f02-77c6-c9e2-8914ee7b25fd@linux.ibm.com>
From: Kun Yi <kunyi@google.com>
Date: Thu, 12 Dec 2019 13:15:16 -0800
Message-ID: <CAGMNF6U18c1H_JONFBLrCCyZtf_10F=nmUyqGYeVt_diec6VcQ@mail.gmail.com>
Subject: Re: pinctrl in phosphor-hwmon
To: Matt Spinler <mspinler@linux.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000a4768d0599883f84"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Deng Tyler <tyler.sabdon@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000a4768d0599883f84
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2019 at 12:34 PM Matt Spinler <mspinler@linux.ibm.com>
wrote:

>
>
> On 12/11/2019 12:40 AM, Deng Tyler wrote:
> > I added gpio control in my fan driver but I still met some problem.
> > While phosphor-hwmon reading fan0_input, the fan tach driver change 2
> > gpio pin and sleep 2 seconds to return rpm value for stable. There are
> > 12 fan sensors in my platform so the phosphor-hwmon need wait 24
> > senconds at least to get rpm. The waiting time cause dbus hang while
> > issuing ipmi sensor command. Do you have any suggestions?
>
> I vaguely remember someone else had this problem before, and it turned
> out to be a device driver
> problem as the reason it was so slow.
>

Yea the best test is to read from the kernel sysfs interface and post how
long it takes. If the device is misbehaving or the physical bus
(i2c/fantach) is not working properly, the delay could easily be O(seconds)


>
> Otherwise, the reads could probably be changed to be asynchronous, but
> that could be a pretty big
> change to the application.


There is some work-in-progress patch to add async read support. The patch
works, although the code change is not clean enough.
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-hwmon/+/24337


>


> >
> > Tyler
> >
> > Matt Spinler <mspinler@linux.ibm.com <mailto:mspinler@linux.ibm.com>>
> > =E6=96=BC 2019=E5=B9=B412=E6=9C=8811=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=
=8A=E5=8D=8812:29=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> >
> >
> >     On 12/9/2019 11:08 PM, Deng Tyler wrote:
> >     > Hi Matt:
> >     >     Thank for your response that's really helpful. I check the li=
nk
> >     > and it seems allow a gpio set to high before/after reading a
> >     > correspond sensor. Is it possible change 2 gpio to high/low for
> >     > reading a correspond sensor?
> >
> >     That isn't possible in the current code, but I don't see why someon=
e
> >     couldn't add that feature.
> >
> >     >
> >     > Regards,
> >     > Tyler
> >     >
> >     > Matt Spinler <mspinler@linux.ibm.com
> >     <mailto:mspinler@linux.ibm.com> <mailto:mspinler@linux.ibm.com
> >     <mailto:mspinler@linux.ibm.com>>>
> >     > =E6=96=BC 2019=E5=B9=B412=E6=9C=889=E6=97=A5 =E9=80=B1=E4=B8=80 =
=E4=B8=8B=E5=8D=8810:58=E5=AF=AB=E9=81=93=EF=BC=9A
> >     >
> >     >
> >     >
> >     >     On 12/9/2019 6:15 AM, Deng Tyler wrote:
> >     >     > Hi all:
> >     >     >     Does phosphor-hwmon support changing gpio pin before re=
ad
> >     >     > /sys/class/hwmon/hwmon0/fan*_input while monitoring fan
> >     sensor?
> >     >     In my
> >     >     > platform, fans gpio are connect to pin-mux and I need
> >     control gpio
> >     >     > before get fan tach rpm.
> >     >
> >     >     It does have the ability to modify a GPIO before/after a
> >     reading:
> >     >
> >
> https://github.com/openbmc/phosphor-hwmon/blob/master/mainloop.cpp#L447
> >     >
> >     >     configured by some lines in the conf file, like:
> >     >
> >
> https://github.com/openbmc/meta-ibm/blob/master/meta-romulus/recipes-phos=
phor/sensors/phosphor-hwmon/obmc/hwmon/iio-hwmon-battery.conf#L4
> >     >
> >     >     >
> >     >     > Regards,
> >     >     > Tyler
> >     >
> >
>
>

--=20
Regards,
Kun

--000000000000a4768d0599883f84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 12, 2019 at 12:34 PM Matt=
 Spinler &lt;<a href=3D"mailto:mspinler@linux.ibm.com">mspinler@linux.ibm.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><br>
<br>
On 12/11/2019 12:40 AM, Deng Tyler wrote:<br>
&gt; I added gpio control in my fan driver but I still met some problem. <b=
r>
&gt; While phosphor-hwmon reading fan0_input, the fan tach driver change 2 =
<br>
&gt; gpio pin and sleep 2 seconds=C2=A0to return rpm value for stable. Ther=
e are <br>
&gt; 12 fan sensors in my platform so the phosphor-hwmon need wait 24 <br>
&gt; senconds at least to get rpm. The waiting time cause dbus hang while <=
br>
&gt; issuing ipmi sensor command. Do you have any suggestions?<br>
<br>
I vaguely remember someone else had this problem before, and it turned <br>
out to be a device driver<br>
problem as the reason it was so slow.<br></blockquote><div><br></div><div>Y=
ea the best test is to read from the kernel sysfs interface and post how lo=
ng it takes. If the device is misbehaving or the physical=C2=A0bus (i2c/fan=
tach) is not working properly, the delay could easily be O(seconds)</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Otherwise, the reads could probably be changed to be asynchronous, but <br>
that could be a pretty big<br>
change to the application.</blockquote><div><br></div><div>There is some wo=
rk-in-progress patch to add async read support. The patch works, although t=
he code change is not clean enough.</div><div><a href=3D"https://gerrit.ope=
nbmc-project.xyz/c/openbmc/phosphor-hwmon/+/24337">https://gerrit.openbmc-p=
roject.xyz/c/openbmc/phosphor-hwmon/+/24337</a></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">=C2=A0</blockquote><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; Tyler<br>
&gt;<br>
&gt; Matt Spinler &lt;<a href=3D"mailto:mspinler@linux.ibm.com" target=3D"_=
blank">mspinler@linux.ibm.com</a> &lt;mailto:<a href=3D"mailto:mspinler@lin=
ux.ibm.com" target=3D"_blank">mspinler@linux.ibm.com</a>&gt;&gt; <br>
&gt; =E6=96=BC 2019=E5=B9=B412=E6=9C=8811=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=
=B8=8A=E5=8D=8812:29=E5=AF=AB=E9=81=93=EF=BC=9A<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 12/9/2019 11:08 PM, Deng Tyler wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi Matt:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 Thank for your response that&#39=
;s really helpful. I check the link<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; and it seems allow a gpio set to high before/a=
fter reading a<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; correspond=C2=A0sensor. Is it possible change =
2 gpio to high/low for<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; reading a correspond sensor?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0That isn&#39;t possible in the current code, but I =
don&#39;t see why someone<br>
&gt;=C2=A0 =C2=A0 =C2=A0couldn&#39;t add that feature.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Tyler<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Matt Spinler &lt;<a href=3D"mailto:mspinler@li=
nux.ibm.com" target=3D"_blank">mspinler@linux.ibm.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mspinler@linux.ibm.com=
" target=3D"_blank">mspinler@linux.ibm.com</a>&gt; &lt;mailto:<a href=3D"ma=
ilto:mspinler@linux.ibm.com" target=3D"_blank">mspinler@linux.ibm.com</a><b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mspinler@linux.ibm.com=
" target=3D"_blank">mspinler@linux.ibm.com</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =E6=96=BC 2019=E5=B9=B412=E6=9C=889=E6=97=A5 =
=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8810:58=E5=AF=AB=E9=81=93=EF=BC=9A<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0On 12/9/2019 6:15 AM, Deng =
Tyler wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi all:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 Does pho=
sphor-hwmon support=C2=A0changing gpio pin before read<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; /sys/class/hwmon/hwmon=
0/fan*_input while=C2=A0monitoring=C2=A0fan<br>
&gt;=C2=A0 =C2=A0 =C2=A0sensor?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0In my<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; platform, fans gpio ar=
e connect to pin-mux and I need<br>
&gt;=C2=A0 =C2=A0 =C2=A0control gpio<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; before get fan tach rp=
m.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0It does have the ability to=
 modify a GPIO before/after a<br>
&gt;=C2=A0 =C2=A0 =C2=A0reading:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/openbmc/phosphor-hwmo=
n/blob/master/mainloop.cpp#L447" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/openbmc/phosphor-hwmon/blob/master/mainloop.cpp#L447</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0configured by some lines in=
 the conf file, like:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/openbmc/meta-ibm/blob=
/master/meta-romulus/recipes-phosphor/sensors/phosphor-hwmon/obmc/hwmon/iio=
-hwmon-battery.conf#L4" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/openbmc/meta-ibm/blob/master/meta-romulus/recipes-phosphor/sensors/pho=
sphor-hwmon/obmc/hwmon/iio-hwmon-battery.conf#L4</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Tyler<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Regards,<div>Kun</div></div></d=
iv></div>

--000000000000a4768d0599883f84--
