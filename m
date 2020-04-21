Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0C41B23FD
	for <lists+openbmc@lfdr.de>; Tue, 21 Apr 2020 12:40:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4960Sb1gPdzDqsw
	for <lists+openbmc@lfdr.de>; Tue, 21 Apr 2020 20:39:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::133;
 helo=mail-il1-x133.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=JnWGByFE; dkim-atps=neutral
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4960Rx4BnMzDqk5
 for <openbmc@lists.ozlabs.org>; Tue, 21 Apr 2020 20:39:25 +1000 (AEST)
Received: by mail-il1-x133.google.com with SMTP id w6so8574809ilg.1
 for <openbmc@lists.ozlabs.org>; Tue, 21 Apr 2020 03:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IVpQntjt+4J8HmfJ5TIu2emnwS8giKw9qibYSYS+cM4=;
 b=JnWGByFESHvE2sxB9sCD5tzZVPBXAOciS1Pd8O7K35mzlq84owwoHyjysBRIANM1ik
 teQaLYlUp5ZY/fQu29VsW+l0L9no1zLXrEiZt0EmRqH6FOp57mtQ/fZlMfRjI4S3Qz7u
 TRJQJhRUMUdSQoquGgQzE5h617XUUQmvDyuG7IC7v3+4wjRnbmaPBdZWiWfJFjT5ykqn
 uiXJUm/5lC0QU1b26gI1j69fv8j3CiLlgo9X/4SD1Rng7+7WxvK1yZyXZu5kNiINxirC
 7ZFMFlhYpqU0AEdPQVNWcfQiZJ0c0DK+LKEhRqWJvB2aTmpI324Ek28pHbXwWIZNgVbj
 RAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IVpQntjt+4J8HmfJ5TIu2emnwS8giKw9qibYSYS+cM4=;
 b=gcFPEXF3bu10Ft+POvi3MRnEcrv+DkxiiXQ80KnvvzdI03tiv9lkWuqeiDk7TtP90w
 pS+kCAxRR7CA+vfgdfs0Qnk47bE9E4FxDYTpQ+MOZL6IwSe1ncuSYGJxwnuqETAvI9an
 FqWx4U7ye63HdRF7PevGLqEFIxbjORE14lnY4TvPLHaIC6WxYfWUqumI2K8Rxn97GuIc
 96l8Z2l/0PU33fx3BjB+HT9DRp/kGkqt42/M3AT7I9yXHC7cwsJyrhKQgzq6EHo7BMPX
 UZNYKFzLFaJysz9pPMZ04ii9BH6N1ZQD3A3M1unntC9gv7uB4S3+2+bDl0vOlx4Irsj6
 HJtA==
X-Gm-Message-State: AGi0PuZrEhxHeAKj/uDfJJ65YBnsTpLj8YVMYZPnt83xi5RPoFZc5aWL
 IzbTOr4O937s4UAHHCn1sbCRA4NVDRl6A5MkEvhGpdjn/aVZxQ==
X-Google-Smtp-Source: APiQypLtsZWORgCNuypMTTVLCczV8wXbKwxzJIQU05ky219JN3v4FA6+4MSXg7HiYMdHZ7TDFlKkDcUvbmTyjdfcx6c=
X-Received: by 2002:a92:bbc4:: with SMTP id x65mr21311844ilk.82.1587465561247; 
 Tue, 21 Apr 2020 03:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <44bae429-2507-e044-2d0e-c4e110dfa700@linux.ibm.com>
 <9e9929c1-1c55-43ea-236d-b14c82aacf88@linux.vnet.ibm.com>
 <CADVsX8-r8ebFydQJgGQ=C7sTFVQmxk_vFinbRi2kkJ5skRgXcA@mail.gmail.com>
 <01100446-5312-2ab4-f2e4-7bab3a86631d@linux.vnet.ibm.com>
 <CADVsX8-2L6umOA8OE-8z3Buu=dKefPJa8KQvycJPPLX9QDz=nQ@mail.gmail.com>
 <CADVsX89dY1YcKmsBvsymb2dGu5_tXQNzmDCgrmf38b0_0T_y4Q@mail.gmail.com>
In-Reply-To: <CADVsX89dY1YcKmsBvsymb2dGu5_tXQNzmDCgrmf38b0_0T_y4Q@mail.gmail.com>
From: Anton Kachalov <rnouse@google.com>
Date: Tue, 21 Apr 2020 12:39:09 +0200
Message-ID: <CADVsX8_f-dgJjCCAPsGH+02Urgqq8pSa6kazJ67bcDW5i6TftQ@mail.gmail.com>
Subject: Re: Security Working Group - Wednesday April 1
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000df7f0b05a3caa0c5"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Manojeda@in.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000df7f0b05a3caa0c5
Content-Type: text/plain; charset="UTF-8"

So far there is an issue with D-Bus:

https://github.com/freedesktop/dbus/blob/master/bus/apparmor.c#L126

John Johansen has confirmed that the mainline kernel will not have
the apparmorfs/features/dbus/mask file until the mainline kernel
has AppArmor getpeersec support.

If I'm not mistaken, we do not run dbus daemons, only dbus-broker that is
clearly lack of AppArmor support:

https://github.com/bus1/dbus-broker/issues/169

https://github.com/bus1/dbus-broker/blob/master/src/launch/launcher.c#L1327

On Tue, 21 Apr 2020 at 11:57, Anton Kachalov <rnouse@google.com> wrote:

> Looks like an increase of image size for 18MB came from the dependencies
> such as Python e.g. audit2allow that we can get rid of from the prod image.
>
> I've tried to build AppArmor for OpenBMC. By default, it's being built
> with Python and Perl as well, which also adds an extra 14MB of image size
> or 68MB -> 126MB unpacked rootfs increase.
>
> Once such dependencies were dropped, I got a working AppArmor-enabled
> system with only a 2MB increase.
>
> On Mon, 6 Apr 2020 at 15:20, Anton Kachalov <rnouse@google.com> wrote:
>
>> Thanks you for clarifying, Ratan.
>>
>> Meanwhile I would try to check what will give us AppArmor in terms of
>> firmware's size growth.
>>
>> On Mon, 6 Apr 2020 at 13:24, Ratan Gupta <ratagupt@linux.vnet.ibm.com>
>> wrote:
>>
>>> Hi Anton,
>>>
>>> I brought  the meta-selinux layer, that enables the selinux framework on
>>> obmc-phosphor-image and it increases the size of the image by 18MB.
>>>
>>> This layer enables the linux kernel support for selinux framework and
>>> brings in a lot of tools and scripts.
>>> Just to name a few,layer comes with binaries like
>>>
>>> - getenforce
>>> - setenforce
>>> - semange
>>> - sestatus
>>> - audit2why
>>> - audit2allow
>>> - restorecon
>>> - chcon
>>>
>>> It also brings in various scripts that would help to label the entire
>>> system during the first boot.
>>>
>>> While lot of these binaries may be only required by the developer during
>>> the inital phase if selinux enablement and not to the end customer.
>>>
>>> I need to spend a little more time to see what can we remove form the
>>> layer.
>>>
>>> My suggestion is  we can defer this size work for later and start
>>> working on how selinux can help in openBMC security.
>>>
>>> We would be publishing the se-linux use cases in a week.
>>>
>>> Manoj is working with me on bringing down the size of se-linux layer.
>>>
>>> Regards
>>>
>>> Ratan
>>> On 4/5/20 6:58 PM, Anton Kachalov wrote:
>>>
>>> Hello, Ratan.
>>>
>>> Would you mind breaking down the estimation, curious about what brought
>>> up 18MB when enabling SELinux.
>>> Precompiled rules in Android took 3MB on average.
>>>
>>> On Wed, 1 Apr 2020 at 16:22, Ratan Gupta <ratagupt@linux.vnet.ibm.com>
>>> wrote:
>>>
>>>> Hi Joseph,
>>>>
>>>> We did some POC around selinux, will share the detailed use-cases with
>>>> selinux which can be useful in openbmc stack.
>>>>
>>>> selinux is taking around 18MB space on flash, Is it a concern?
>>>>
>>>> Regards
>>>>
>>>> Ratan
>>>>
>>>> On 3/31/20 9:51 PM, Joseph Reynolds wrote:
>>>> > This is a reminder of the OpenBMC Security Working Group meeting
>>>> > scheduled for this Wednesday April 1 at 10:00am PDT.
>>>> >
>>>> > We'll discuss current development items, and anything else that comes
>>>> up.
>>>> >
>>>> > The current topics:
>>>> >
>>>> > 1. SELinux or AppArmor plans
>>>> >
>>>> > Access, agenda, and notes are in the wiki:
>>>> >
>>>> > https://github.com/openbmc/openbmc/wiki/Security-working-group
>>>> >
>>>> > - Joseph
>>>> >
>>>>
>>>>

--000000000000df7f0b05a3caa0c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">So far there is an issue with D-Bus:<div>=
<br></div><div><a href=3D"https://github.com/freedesktop/dbus/blob/master/b=
us/apparmor.c#L126">https://github.com/freedesktop/dbus/blob/master/bus/app=
armor.c#L126</a><br></div><div><br></div><div><font face=3D"monospace" size=
=3D"1">John Johansen has confirmed that the mainline kernel will not have<b=
r>the apparmorfs/features/dbus/mask file until the mainline kernel<br>has A=
ppArmor getpeersec support.</font><br></div><div><br></div><div>If I&#39;m =
not=C2=A0mistaken, we do not run dbus daemons, only dbus-broker that is cle=
arly lack of AppArmor support:</div><div><div><br></div><div><a href=3D"htt=
ps://github.com/bus1/dbus-broker/issues/169">https://github.com/bus1/dbus-b=
roker/issues/169</a><br></div><div></div></div><div><br></div><div><a href=
=3D"https://github.com/bus1/dbus-broker/blob/master/src/launch/launcher.c#L=
1327">https://github.com/bus1/dbus-broker/blob/master/src/launch/launcher.c=
#L1327</a><br></div><div><br></div></div><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue, 21 Apr 2020 at 11:57, Anton Kachalov=
 &lt;<a href=3D"mailto:rnouse@google.com">rnouse@google.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div dir=3D"ltr">Looks like an increase of image size for 18MB came from t=
he dependencies such as Python e.g. audit2allow that we can get rid of from=
 the prod image.</div><div><br></div><div>I&#39;ve tried to build AppArmor =
for OpenBMC. By default, it&#39;s being built with Python and Perl as well,=
 which also adds an extra 14MB of image size or 68MB -&gt; 126MB unpacked r=
ootfs increase.</div><div><br></div><div>Once such dependencies were droppe=
d, I got a working AppArmor-enabled system with only a 2MB increase.</div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon,=
 6 Apr 2020 at 15:20, Anton Kachalov &lt;<a href=3D"mailto:rnouse@google.co=
m" target=3D"_blank">rnouse@google.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Thanks you for clari=
fying, Ratan.<div><br></div><div>Meanwhile I would try to check what will g=
ive us AppArmor in terms of firmware&#39;s size growth.</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 6 Apr =
2020 at 13:24, Ratan Gupta &lt;<a href=3D"mailto:ratagupt@linux.vnet.ibm.co=
m" target=3D"_blank">ratagupt@linux.vnet.ibm.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    <p>Hi Anton,</p>
    <p>I brought=C2=A0 the meta-selinux layer, that enables the selinux
      framework on obmc-phosphor-image and it increases the size of the
      image by 18MB.</p>
    <p>This layer enables the linux kernel support for selinux framework
      and brings in a lot of tools and scripts.<br>
      Just to name a few,layer comes with binaries like</p>
    <p>- getenforce<br>
      - setenforce<br>
      - semange<br>
      - sestatus<br>
      - audit2why<br>
      - audit2allow<br>
      - restorecon<br>
      - chcon</p>
    <p>It also brings in various scripts that would help to label the
      entire system during the first boot.</p>
    <p>While lot of these binaries may be only required by the developer
      during the inital phase if selinux enablement and not to the end
      customer.</p>
    <p>I need to spend a little more time to see what can we remove form
      the layer. <br>
    </p>
    <p>My suggestion is=C2=A0 we can defer this size work for later and sta=
rt
      working on how selinux can help in openBMC security.</p>
    <p>We would be publishing the se-linux use cases in a week.=C2=A0 <br>
    </p>
    <p>Manoj is working with me on bringing down the size of se-linux
      layer.<br>
    </p>
    <p>Regards</p>
    <p>Ratan<br>
    </p>
    <div>On 4/5/20 6:58 PM, Anton Kachalov
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">Hello, Ratan.
        <div><br>
        </div>
        <div>Would you mind breaking down the estimation, curious about
          what brought up 18MB when enabling SELinux.</div>
        <div>Precompiled rules in Android took 3MB on average.</div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Wed, 1 Apr 2020 at 16:22,
          Ratan Gupta &lt;<a href=3D"mailto:ratagupt@linux.vnet.ibm.com" ta=
rget=3D"_blank">ratagupt@linux.vnet.ibm.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi
          Joseph,<br>
          <br>
          We did some POC around selinux, will share the detailed
          use-cases with <br>
          selinux which can be useful in openbmc stack.<br>
          <br>
          selinux is taking around 18MB space on flash, Is it a concern?<br=
>
          <br>
          Regards<br>
          <br>
          Ratan<br>
          <br>
          On 3/31/20 9:51 PM, Joseph Reynolds wrote:<br>
          &gt; This is a reminder of the OpenBMC Security Working Group
          meeting <br>
          &gt; scheduled for this Wednesday April 1 at 10:00am PDT.<br>
          &gt;<br>
          &gt; We&#39;ll discuss current development items, and anything
          else that comes up.<br>
          &gt;<br>
          &gt; The current topics:<br>
          &gt;<br>
          &gt; 1. SELinux or AppArmor plans<br>
          &gt;<br>
          &gt; Access, agenda, and notes are in the wiki:<br>
          &gt;<br>
          &gt; <a href=3D"https://github.com/openbmc/openbmc/wiki/Security-=
working-group" rel=3D"noreferrer" target=3D"_blank">https://github.com/open=
bmc/openbmc/wiki/Security-working-group</a><br>
          &gt;<br>
          &gt; - Joseph<br>
          &gt;<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
  </div>

</blockquote></div>
</blockquote></div></div>
</blockquote></div></div>

--000000000000df7f0b05a3caa0c5--
