Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9141B237A
	for <lists+openbmc@lfdr.de>; Tue, 21 Apr 2020 11:59:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495zZC2cbdzDqg9
	for <lists+openbmc@lfdr.de>; Tue, 21 Apr 2020 19:59:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2c;
 helo=mail-io1-xd2c.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=dKR3m4aJ; dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495zX16mp7zDqvW
 for <openbmc@lists.ozlabs.org>; Tue, 21 Apr 2020 19:57:52 +1000 (AEST)
Received: by mail-io1-xd2c.google.com with SMTP id o127so14397829iof.0
 for <openbmc@lists.ozlabs.org>; Tue, 21 Apr 2020 02:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=If1y/pr9GcMd9Mdz1EcXbtMVTc9O4JPz8t79ANbJj34=;
 b=dKR3m4aJ8UJGS3aWyE0z+n5ZTbHWKb78UK8tRv6i8jhws3Lvb/63oK1vJJxruiJWVw
 36JMw6rwBwG5eps63v93RtmL5Zdo4MFdn9yKos+vd+zLgVKdGulPKNymRssVrQs4ljQM
 nabarZVrj6FjA4Qbu3/VD29IxGfNd4XGyqlFU8enHRLe+vzr7AaQewkZ5ABBdxKLEd9M
 YqFQxa0jGB0K0n7LVlw8dCMWeHDbH7F9KGnViFQf6tRSNq6k3smm2CCd/LrET+GOLxNe
 QarMkRS/2EDtD6FDaXEsvnPzLYn5npyusciKR2DR+t9QHorIRf6lrrAD22880MCzMgJI
 J3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=If1y/pr9GcMd9Mdz1EcXbtMVTc9O4JPz8t79ANbJj34=;
 b=XXEjIEkv/rS0bV99WLLAm799V9WPF1jk1x1jhdh5BPxfCnwUuLr7VeygMf1FKfNGVB
 panN+gUiqEvKi69b3QTiw8q4cXUsPlxr3zmcdvEUvafji9ZZEMa3AkbDdlldVHjQM4Pw
 29mGebgImm4JW8Wt0FjAiodcqv0QNngXHQagUFnvibIGBjV3bh1tYche+xE7Y5/1hmdl
 L4kwdtCskSpDPYsGCq7VB+TMWIHKcGkn6RbmLVdbTOXVe0VFiw263QIqqMLQ3/DffAbG
 mmg+XOSs5BdEvtRHEpQn6jVCtIQKvELovB7SNgdo4IesmoRE0QvFIIUCPG9W8Sa+P44f
 ffzA==
X-Gm-Message-State: AGi0PuY4qKLI1KvL9tpdJFCZWjGlxaiKD+qLsaGmCip8wDnIjm+Tj8h9
 V49qtesViVzAt+NsvyM+vB51TP/9yhjf4o5JCnx8HynGY3E=
X-Google-Smtp-Source: APiQypL9poUl35M+r0T0fvENCpkK1Twg0uty6h6WxXYAAInGp6Oc9K43k9Cg1HIH3k/bZcvZ3YOzyQvHVFt16jIW90w=
X-Received: by 2002:a5d:8553:: with SMTP id b19mr20333090ios.129.1587463068446; 
 Tue, 21 Apr 2020 02:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <44bae429-2507-e044-2d0e-c4e110dfa700@linux.ibm.com>
 <9e9929c1-1c55-43ea-236d-b14c82aacf88@linux.vnet.ibm.com>
 <CADVsX8-r8ebFydQJgGQ=C7sTFVQmxk_vFinbRi2kkJ5skRgXcA@mail.gmail.com>
 <01100446-5312-2ab4-f2e4-7bab3a86631d@linux.vnet.ibm.com>
 <CADVsX8-2L6umOA8OE-8z3Buu=dKefPJa8KQvycJPPLX9QDz=nQ@mail.gmail.com>
In-Reply-To: <CADVsX8-2L6umOA8OE-8z3Buu=dKefPJa8KQvycJPPLX9QDz=nQ@mail.gmail.com>
From: Anton Kachalov <rnouse@google.com>
Date: Tue, 21 Apr 2020 11:57:37 +0200
Message-ID: <CADVsX89dY1YcKmsBvsymb2dGu5_tXQNzmDCgrmf38b0_0T_y4Q@mail.gmail.com>
Subject: Re: Security Working Group - Wednesday April 1
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000004a7b5b05a3ca0c06"
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

--0000000000004a7b5b05a3ca0c06
Content-Type: text/plain; charset="UTF-8"

Looks like an increase of image size for 18MB came from the dependencies
such as Python e.g. audit2allow that we can get rid of from the prod image.

I've tried to build AppArmor for OpenBMC. By default, it's being built with
Python and Perl as well, which also adds an extra 14MB of image size or
68MB -> 126MB unpacked rootfs increase.

Once such dependencies were dropped, I got a working AppArmor-enabled
system with only a 2MB increase.

On Mon, 6 Apr 2020 at 15:20, Anton Kachalov <rnouse@google.com> wrote:

> Thanks you for clarifying, Ratan.
>
> Meanwhile I would try to check what will give us AppArmor in terms of
> firmware's size growth.
>
> On Mon, 6 Apr 2020 at 13:24, Ratan Gupta <ratagupt@linux.vnet.ibm.com>
> wrote:
>
>> Hi Anton,
>>
>> I brought  the meta-selinux layer, that enables the selinux framework on
>> obmc-phosphor-image and it increases the size of the image by 18MB.
>>
>> This layer enables the linux kernel support for selinux framework and
>> brings in a lot of tools and scripts.
>> Just to name a few,layer comes with binaries like
>>
>> - getenforce
>> - setenforce
>> - semange
>> - sestatus
>> - audit2why
>> - audit2allow
>> - restorecon
>> - chcon
>>
>> It also brings in various scripts that would help to label the entire
>> system during the first boot.
>>
>> While lot of these binaries may be only required by the developer during
>> the inital phase if selinux enablement and not to the end customer.
>>
>> I need to spend a little more time to see what can we remove form the
>> layer.
>>
>> My suggestion is  we can defer this size work for later and start working
>> on how selinux can help in openBMC security.
>>
>> We would be publishing the se-linux use cases in a week.
>>
>> Manoj is working with me on bringing down the size of se-linux layer.
>>
>> Regards
>>
>> Ratan
>> On 4/5/20 6:58 PM, Anton Kachalov wrote:
>>
>> Hello, Ratan.
>>
>> Would you mind breaking down the estimation, curious about what brought
>> up 18MB when enabling SELinux.
>> Precompiled rules in Android took 3MB on average.
>>
>> On Wed, 1 Apr 2020 at 16:22, Ratan Gupta <ratagupt@linux.vnet.ibm.com>
>> wrote:
>>
>>> Hi Joseph,
>>>
>>> We did some POC around selinux, will share the detailed use-cases with
>>> selinux which can be useful in openbmc stack.
>>>
>>> selinux is taking around 18MB space on flash, Is it a concern?
>>>
>>> Regards
>>>
>>> Ratan
>>>
>>> On 3/31/20 9:51 PM, Joseph Reynolds wrote:
>>> > This is a reminder of the OpenBMC Security Working Group meeting
>>> > scheduled for this Wednesday April 1 at 10:00am PDT.
>>> >
>>> > We'll discuss current development items, and anything else that comes
>>> up.
>>> >
>>> > The current topics:
>>> >
>>> > 1. SELinux or AppArmor plans
>>> >
>>> > Access, agenda, and notes are in the wiki:
>>> >
>>> > https://github.com/openbmc/openbmc/wiki/Security-working-group
>>> >
>>> > - Joseph
>>> >
>>>
>>>

--0000000000004a7b5b05a3ca0c06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Looks like an increase of image size for =
18MB came from the dependencies such as Python e.g. audit2allow that we can=
 get rid of from the prod image.</div><div><br></div><div>I&#39;ve tried to=
 build AppArmor for OpenBMC. By default, it&#39;s being built with Python a=
nd Perl as well, which also adds an extra 14MB of image size or 68MB -&gt; =
126MB unpacked rootfs increase.</div><div><br></div><div>Once such dependen=
cies were dropped, I got a working AppArmor-enabled system with only a 2MB =
increase.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Mon, 6 Apr 2020 at 15:20, Anton Kachalov &lt;<a href=3D"mailto:=
rnouse@google.com" target=3D"_blank">rnouse@google.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Than=
ks you for clarifying, Ratan.<div><br></div><div>Meanwhile I would try to c=
heck what will give us AppArmor in terms of firmware&#39;s size growth.</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Mon, 6 Apr 2020 at 13:24, Ratan Gupta &lt;<a href=3D"mailto:ratagupt@l=
inux.vnet.ibm.com" target=3D"_blank">ratagupt@linux.vnet.ibm.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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

--0000000000004a7b5b05a3ca0c06--
