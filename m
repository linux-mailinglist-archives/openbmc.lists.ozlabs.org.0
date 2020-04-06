Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5B519F746
	for <lists+openbmc@lfdr.de>; Mon,  6 Apr 2020 15:55:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wsVX19l8zDrJw
	for <lists+openbmc@lfdr.de>; Mon,  6 Apr 2020 23:55:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12a;
 helo=mail-il1-x12a.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=aNQjONv7; dkim-atps=neutral
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wrlS1TVhzDr7f
 for <openbmc@lists.ozlabs.org>; Mon,  6 Apr 2020 23:21:07 +1000 (AEST)
Received: by mail-il1-x12a.google.com with SMTP id k29so14595230ilg.0
 for <openbmc@lists.ozlabs.org>; Mon, 06 Apr 2020 06:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pvJwcYgKwGhmS3S/SyT6r7Kc8YYRxE66N7ztSf3f81U=;
 b=aNQjONv7qkbNH3ljS9biTNx300kAY3FWVU0fL9cF2yxAUS+YTtlL1/+i47rFGDaPkU
 BgK9jnoqsMB7vaT+PAvCkkfoCaDrXJkeewqPd26RyjcXdLQk+V+zc/84E+PXT2IkZrzN
 CUZQGi2FZvBry/3ponEK5BP9QMRNhVciLtMmCsyi+ZSk3LUM9vGie5eDPqSUl9LKICgo
 S6qI01sUdTCKnb7xbi0B7rvnMiLuo1WoPXo/08OgqTIp83lmTNQ+wF+IDSHk6PMbAriK
 hEbF3c26yQ+vf79dZd+l3BhV3tQUSNOcOVIQomomNUEEEI24/sysVBurOJnzc+DWBK7j
 Y95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pvJwcYgKwGhmS3S/SyT6r7Kc8YYRxE66N7ztSf3f81U=;
 b=s925dICcZZw0NFVaex29k63z3pCktTMZry0tCaFYsvDuW4gg/G4cSbPgbaeHgwBCj1
 d5o7vmGPhj9dgP5EjUVaQPsSRv6aAc+Yuuw68+WopI2HNQKdqnVOQWKMYF6HzW5CYPw2
 3Tb21z0pVy36eqNfXPLHWdGOG2xs2aSvCSr6Lst7hnebPoqkWU1i06toscvGKLPBi0Sz
 lxEjkrm9x84mD6YLRuRcKjKr6RtbhOZ9yQFvhyOOJ33a9Onp5CG6pmRN8n+rvLZNK35+
 BxMrsMeTrsi20WweSXu55vz9O+TSIfxn4N7YLgFEru1FyA1bIoCgFk8u3AfRtif/o37B
 OEvA==
X-Gm-Message-State: AGi0PubSKDJ5sIk9u16+U8D73A3Gay05ojdTSEAfym/7CyA/uM/Gw/Iu
 6ciszmkbuQZmcPi0Ze+UiBk7GCSEDdm/xiH8zEV0Ow==
X-Google-Smtp-Source: APiQypIanlqpd8ThyuawFx0mbLB6+t45ybyS2IaDKdHLWlvcp+Q8Bdfj8cRRs6w8lZEpSQlgMqxY4n27ifxAXeWgF9E=
X-Received: by 2002:a92:5d8f:: with SMTP id e15mr21998987ilg.255.1586179263114; 
 Mon, 06 Apr 2020 06:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <44bae429-2507-e044-2d0e-c4e110dfa700@linux.ibm.com>
 <9e9929c1-1c55-43ea-236d-b14c82aacf88@linux.vnet.ibm.com>
 <CADVsX8-r8ebFydQJgGQ=C7sTFVQmxk_vFinbRi2kkJ5skRgXcA@mail.gmail.com>
 <01100446-5312-2ab4-f2e4-7bab3a86631d@linux.vnet.ibm.com>
In-Reply-To: <01100446-5312-2ab4-f2e4-7bab3a86631d@linux.vnet.ibm.com>
From: Anton Kachalov <rnouse@google.com>
Date: Mon, 6 Apr 2020 15:20:51 +0200
Message-ID: <CADVsX8-2L6umOA8OE-8z3Buu=dKefPJa8KQvycJPPLX9QDz=nQ@mail.gmail.com>
Subject: Re: Security Working Group - Wednesday April 1
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="00000000000087970305a29f23df"
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
Cc: openbmc@lists.ozlabs.org, Manojeda@in.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000087970305a29f23df
Content-Type: text/plain; charset="UTF-8"

Thanks you for clarifying, Ratan.

Meanwhile I would try to check what will give us AppArmor in terms of
firmware's size growth.

On Mon, 6 Apr 2020 at 13:24, Ratan Gupta <ratagupt@linux.vnet.ibm.com>
wrote:

> Hi Anton,
>
> I brought  the meta-selinux layer, that enables the selinux framework on
> obmc-phosphor-image and it increases the size of the image by 18MB.
>
> This layer enables the linux kernel support for selinux framework and
> brings in a lot of tools and scripts.
> Just to name a few,layer comes with binaries like
>
> - getenforce
> - setenforce
> - semange
> - sestatus
> - audit2why
> - audit2allow
> - restorecon
> - chcon
>
> It also brings in various scripts that would help to label the entire
> system during the first boot.
>
> While lot of these binaries may be only required by the developer during
> the inital phase if selinux enablement and not to the end customer.
>
> I need to spend a little more time to see what can we remove form the
> layer.
>
> My suggestion is  we can defer this size work for later and start working
> on how selinux can help in openBMC security.
>
> We would be publishing the se-linux use cases in a week.
>
> Manoj is working with me on bringing down the size of se-linux layer.
>
> Regards
>
> Ratan
> On 4/5/20 6:58 PM, Anton Kachalov wrote:
>
> Hello, Ratan.
>
> Would you mind breaking down the estimation, curious about what brought up
> 18MB when enabling SELinux.
> Precompiled rules in Android took 3MB on average.
>
> On Wed, 1 Apr 2020 at 16:22, Ratan Gupta <ratagupt@linux.vnet.ibm.com>
> wrote:
>
>> Hi Joseph,
>>
>> We did some POC around selinux, will share the detailed use-cases with
>> selinux which can be useful in openbmc stack.
>>
>> selinux is taking around 18MB space on flash, Is it a concern?
>>
>> Regards
>>
>> Ratan
>>
>> On 3/31/20 9:51 PM, Joseph Reynolds wrote:
>> > This is a reminder of the OpenBMC Security Working Group meeting
>> > scheduled for this Wednesday April 1 at 10:00am PDT.
>> >
>> > We'll discuss current development items, and anything else that comes
>> up.
>> >
>> > The current topics:
>> >
>> > 1. SELinux or AppArmor plans
>> >
>> > Access, agenda, and notes are in the wiki:
>> >
>> > https://github.com/openbmc/openbmc/wiki/Security-working-group
>> >
>> > - Joseph
>> >
>>
>>

--00000000000087970305a29f23df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks you for clarifying, Ratan.<div><br></div><div>Meanw=
hile I would try to check what will give us AppArmor in terms of firmware&#=
39;s size growth.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Mon, 6 Apr 2020 at 13:24, Ratan Gupta &lt;<a href=
=3D"mailto:ratagupt@linux.vnet.ibm.com">ratagupt@linux.vnet.ibm.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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

--00000000000087970305a29f23df--
