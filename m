Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C83F7117BCE
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 00:51:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47X0N6528FzDqM6
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 10:51:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::230;
 helo=mail-lj1-x230.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="goqewBMH"; 
 dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WzJ70bLszDqM3
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 10:03:18 +1100 (AEDT)
Received: by mail-lj1-x230.google.com with SMTP id s22so17604276ljs.7
 for <openbmc@lists.ozlabs.org>; Mon, 09 Dec 2019 15:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0qdSkCllzw0mUaedfOP0svsRosAFILcKjZvAu8ATAus=;
 b=goqewBMHtAecQVhwdNc+Rc1nEqo2ctyJAIQp61/RqJ6j4Jtq2Qkc3QtjHNcenFaL6h
 bWpmPEWMriGK5ce/EICumLkyuUBXL6I8OGoN//OuHqFyitiGSyS6CDdQhHPyfdZWoKqH
 z4tzMba1af0Poss1S7w0XdMDqRQ3CEvcPzmCiQfMr6DlagOIrpu/RBHVbOyX0iJ10kkm
 RkUQgZydQKzr7a9gVJbFZlPirsGSIlZ6L7rl8x2dSY9YDldVCYi3lz4a04e0eK0yA1dP
 J9gYa/5iuYrUFF/s90smemPlSKaw0fSbgPowwq5l85xizzibjM+L5WsPRY3CTDoUkzhz
 uxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0qdSkCllzw0mUaedfOP0svsRosAFILcKjZvAu8ATAus=;
 b=nwwx4xuhVmunV/4KWNxnCu+ovZOO4cB+m1/QypJ+S6B9p544sSrlKRSh87shF9FOs8
 2AvMq6pIKl4FJL6CFoThXygcdT29VxLiJ+8ic8KXiDDS0+ctHkunriljCJixyvHpuYoS
 HV72e8NirjsUsZIiJwTGlMnLxRUE9U7/DbUA6lZZUTMTpurw7S4FdbjzEiOiOMtLZPlM
 Exred1DdngJbc9kSx4IuhuxkJU+mgBGdHn0e8xA1yFq0nFlbOq3g/mANZIRoY0L5Bi1u
 sx/bWRlfJVMtcvl7ERGmwgjNizvJUO6SRoeAFXY3mHysBY78ZTE2iCBMyMl79hz1H0Us
 LUYg==
X-Gm-Message-State: APjAAAVoTIKXveTcQsbYypATV16Wj0oJUssElLp7mi1XgzFQ85ZitZC3
 cddcAO4w/9rbZH8QZvXGR1pW3SiJ1A1tq0AsmvaBsg==
X-Google-Smtp-Source: APXvYqxyJiqu8179FiYpS8Kkcj4HQCgRNkS5Ydub66KacL0HsfBFsCXpqteFrbZDlIDXQbcIMj0NK1EH/qDazw/npmg=
X-Received: by 2002:a05:651c:2002:: with SMTP id
 s2mr9243225ljo.9.1575932590897; 
 Mon, 09 Dec 2019 15:03:10 -0800 (PST)
MIME-Version: 1.0
References: <DM6PR21MB13889A7DE46B9DEF6D97959BC8580@DM6PR21MB1388.namprd21.prod.outlook.com>
In-Reply-To: <DM6PR21MB13889A7DE46B9DEF6D97959BC8580@DM6PR21MB1388.namprd21.prod.outlook.com>
From: Richard Hanley <rhanley@google.com>
Date: Mon, 9 Dec 2019 15:02:59 -0800
Message-ID: <CAH1kD+YrfgnLGdiTOao4t7kXDw7494MQM7pxOAZCbEP6i4EVcw@mail.gmail.com>
Subject: Re: Managing heterogeneous systems
To: Neeraj Ladkani <neladk@microsoft.com>
Content-Type: multipart/alternative; boundary="00000000000045bc3905994d6695"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000045bc3905994d6695
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Neeraj,

This is an open question that I've been looking into as well.

For BMC to BMC communication there are a few options.

   1. If you have network connectivity you can communicate using Redfish.
   2. If you only have a PCIe connection, you'll have to use either the
   inband connection or the side band I2C*.  PLDM and MCTP are protocols th=
at
   defined to handle this use case, although I'm not sure if the OpenBMC
   implementations have been used in production.
   3. There is always IPMI, which has its own pros/cons.

For taking several BMCs and aggregating them into a single logical
interface that is exposed to the outside world, there are a few things
happening on that front.  DMTF has been working on an aggregation protocol
for Redfish.  However, it's my understanding that their proposal is more
directed at the client level, as opposed to within a single "system".

I just recently joined the community, but I've been thinking about how a
proxy layer could merge two Redfish services together.  Since Redfish is
fairly strongly typed and has a well defined mechanism for OEM extensions,
this should be pretty generally applicable.  I am planning on having a
white paper on the issue sometime after the holidays.

Another thing to note, recently DMTF released a spec for running a binary
Redfish over PLDM called RDE.  That might be a useful way of tying all
these concepts together.

I'd be curious about your thoughts and use cases here.  Would either PLDM
or Redfish fit your use case?

Regards,
Richard

*I've heard of some proposals that run a network interface over PCIe.  I
don't know enough about PCIe to know if this is a good idea.

On Mon, Dec 9, 2019 at 1:27 PM Neeraj Ladkani <neladk@microsoft.com> wrote:

> Are there any standards in managing heterogeneous systems? For example in
> a rack if there is a compute node( with its own BMC) and storage node( wi=
th
> its own BMC) connected using a PCIe switch.  How these two BMC represente=
d
> as one system ?  are there any standards for BMC =E2=80=93 BMC communicat=
ion?
>
>
>
>
>
> Neeraj
>
>
>

--00000000000045bc3905994d6695
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Neeraj,<div><br></div><div>This is an open question tha=
t I&#39;ve been looking into as well.=C2=A0=C2=A0</div><div><br></div><div>=
For BMC to BMC communication there are a few options.</div><div><ol><li>If =
you have network connectivity you can communicate using Redfish.</li><li>If=
 you only have a PCIe connection, you&#39;ll have to use either the inband =
connection or the side band I2C*.=C2=A0 PLDM and MCTP are protocols that de=
fined to handle this use case, although I&#39;m not sure if the OpenBMC imp=
lementations have been used in production.</li><li>There is always IPMI, wh=
ich has its own pros/cons.</li></ol><div>For taking several BMCs and aggreg=
ating them into a single logical interface that is exposed to the outside w=
orld, there are a few things happening on that front.=C2=A0 DMTF has been w=
orking on an aggregation protocol for Redfish.=C2=A0 However, it&#39;s my u=
nderstanding that their proposal is more directed at the client level, as o=
pposed to within a single &quot;system&quot;.</div></div><div><br></div><di=
v>I just recently joined the community, but I&#39;ve been thinking about ho=
w a proxy layer could merge two Redfish services together.=C2=A0 Since Redf=
ish is fairly strongly typed and has a well defined mechanism for OEM exten=
sions, this should be pretty generally applicable.=C2=A0 I am planning on=
=C2=A0having a white paper on the issue sometime after the holidays.</div><=
div><br></div><div>Another thing to note, recently DMTF released a spec for=
 running a binary Redfish over PLDM called RDE.=C2=A0 That might be a usefu=
l way of tying all these concepts together.=C2=A0=C2=A0</div><div><br></div=
><div>I&#39;d be curious about your thoughts and use cases here.=C2=A0 Woul=
d either PLDM or Redfish fit your use case?</div><div><br></div><div>Regard=
s,</div><div>Richard</div><div><br></div><div>*I&#39;ve heard of some propo=
sals that run a network interface over PCIe.=C2=A0 I don&#39;t know enough =
about PCIe to know if this is a good idea.</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 9, 2019 at 1:27=
 PM Neeraj Ladkani &lt;<a href=3D"mailto:neladk@microsoft.com" target=3D"_b=
lank">neladk@microsoft.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">





<div lang=3D"EN-US">
<div>
<p class=3D"MsoNormal">Are there any standards in managing heterogeneous sy=
stems? For example in a rack if there is a compute node( with its own BMC) =
and storage node( with its own BMC) connected using a PCIe switch.=C2=A0 Ho=
w these two BMC represented as one system
 ? =C2=A0are there any standards for BMC =E2=80=93 BMC communication? <u></=
u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Neeraj<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>

</blockquote></div>

--00000000000045bc3905994d6695--
