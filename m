Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7360E36C942
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 18:21:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FV6Tv2ct4z2yyx
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 02:21:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=FkRtECqq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b35;
 helo=mail-yb1-xb35.google.com; envelope-from=jasonling@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=FkRtECqq; dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FV6Tg1MZnz2y8C
 for <openbmc@lists.ozlabs.org>; Wed, 28 Apr 2021 02:21:40 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id i4so32491009ybe.2
 for <openbmc@lists.ozlabs.org>; Tue, 27 Apr 2021 09:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NKPAyRm9wflvabe0l2vwmJg+/uAqoeEU/YRQYb5EPIk=;
 b=FkRtECqqDiggTIxcq6ac5VP6pbK8w752E/m0qK8eTeTc+pk2METNhASqaYTucmGVcF
 sL/azhkKYzHy7TOwNdzU1ijoZGgfkl+Y/upxdiuL0hxNrKGVYynDr62fS5IjWWASjXbR
 d8fpQ+fB5Bw1Hc3p93753EP3Ms6oM/byVspfJK7q0yE8mphlRVcEhJusnMBoypnVfs7v
 yc0zSG83qGbI1G2UGqMTUZiu1G7HnFG2PjXwJiW2dWAF2YCoe811A5f++oO3F72af6ue
 UzW7BgLpATUCID3HmDWszqOmVW3fNsquQR5ZfoTPJ70suKOLPCGQ5Cg3bvMJmUA6DXRI
 SiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NKPAyRm9wflvabe0l2vwmJg+/uAqoeEU/YRQYb5EPIk=;
 b=dunUi8ZbhVSj0fnLR+oHs33wEqCy9+1wfkcrIsvKH72Fkuhd8561P3iB1tZTNsTU+o
 XAmT0RfFOkRRwCxgL7zjvDS32/E3xwTiYJyL3uW4P6uW0fi3ChMw7P3v2U8hVkuAQdam
 KZiu84hpc1HsEXvxDS38pF/tOxeBqdo3eOzHHKPOzZ7DBSI76s7Qw+2E51NplpgSh+xq
 va62tHk94irDza3JBT8VrYn6oXl3P7n8TqOtbPutxieKaUfgUaz1IzkfdY5mkLtU/bHk
 T9Oh4TTRDGHN1olKFlfSaOMc/T3GiG/vK7cKvD9I7AnRTC8KZKspsULSoGb/RbZA8jfm
 EP7g==
X-Gm-Message-State: AOAM5309/YlaEYlQtYzUkHnB2IoPne2MUt6xh32OeVESHXTrFYNJMb01
 /OAWAVJqaj3z40IGkLKD2RWabiLGRt2RHPYoig8Nwg==
X-Google-Smtp-Source: ABdhPJzZXXdtBILXj73mOP+6bMflg2IB7F3dLd1GbJq6+L2AeCx0A+7cRmz979HA7FrsWaedYLiBiIvUWzUm63xmgMw=
X-Received: by 2002:a25:41d0:: with SMTP id
 o199mr34078283yba.467.1619540495821; 
 Tue, 27 Apr 2021 09:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBbfcXj57K66ARd2_SQMCdNTPVtWk8Xrq0jn_k+WghjRcT-CA@mail.gmail.com>
 <015CB0F4-95C4-46FA-975A-595F8685405D@gmail.com>
In-Reply-To: <015CB0F4-95C4-46FA-975A-595F8685405D@gmail.com>
From: Jason Ling <jasonling@google.com>
Date: Tue, 27 Apr 2021 09:20:56 -0700
Message-ID: <CAHBbfcVcXNNK+7aP-DQMP0PPvFHy8gSptmAH08w=YUQoomFw9A@mail.gmail.com>
Subject: Re: [pmbusplus] userspace i2c, pmbus interactions
To: Mike Jones <proclivis@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000f4700a05c0f6a70b"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000f4700a05c0f6a70b
Content-Type: text/plain; charset="UTF-8"

Thanks Mike for the feedback

And the context is more than CPU based systems, but includes Networking,
> other boards with ASICS, etc. So broad context. Hence, it has to work
> within linux without OBMC.

Ack, although the library was written for a use-case that involves obmc, it
doesn't *require* obmc. Should work just fine in general Linux.

 Now, imagine the IC manufacturer's tool produces a file that can represent
> a qualified algorithm that is known to work under all possible scenarios,
> including CRC errors in parts, corrupt NVM, etc. This is what all the
> vendors do today. They take care of all the things that can go wrong. In
> the case of ADI, if power was lost while programming, and the BMC or linux
> can boot from an aux supply, our data files (encoding algorithms), can
> repair the part under ALL possible random values in the corrupt part.

This would be great, especially if this is codified in the pmbus spec.
Right now the library provides a pmbus interface but *part programming* is
specific to each device class...no guarantee of a common interface across
multiple parts.

1) I am interested in anything that enables our work

Sure, I'll start carving out more time to make this work suitable for
upstreaming. At the very least it should give you a mockable interface to
allow for strong unit testing of upper layers.


> 2) I am interested in inviting someone from the community, not IC vendor,
> to our meetings to offer advice and help us define something useful

Sounds good, feel free to reach out to me on an individual basis.

On Mon, Apr 26, 2021 at 7:33 PM Mike Jones <proclivis@gmail.com> wrote:

> Jason,
>
> I am interested, because within the PMBus Specification Committee, we are
> working on a data language intended for device programming. And there is
> hope that eventually it can become adopted into linux and/or OBMC.
>
> There is a particular use model that is being driven by the IC suppliers
> and their tools. One reason is that all the vendors have proprietary tools,
> but they see no competitive advantage, and would rather support a universal
> standard.
>
> Imagine that programming might be done for:
>
> - ICT
> - Proto Builds
> - Engineering Bringup
> - Remote upgrades
>
> And the context is more than CPU based systems, but includes Networking,
> other boards with ASICS, etc. So broad context. Hence, it has to work
> within linux without OBMC.
>
> My view is it is a linux library anyone can use, and OBMC is the piping if
> it were exposed to a web service, state management, etc.
>
> Now, imagine the IC manufacturer's tool produces a file that can represent
> a qualified algorithm that is known to work under all possible scenarios,
> including CRC errors in parts, corrupt NVM, etc. This is what all the
> vendors do today. They take care of all the things that can go wrong. In
> the case of ADI, if power was lost while programming, and the BMC or linux
> can boot from an aux supply, our data files (encoding algorithms), can
> repair the part under ALL possible random values in the corrupt part.
>
> Furthermore, an integrator (CM, Design House, software team) has to deal
> with segmented I2C busses, muxes, etc. And the integrator wants to write a
> wrapper file that integrates all the vendor files. So this integration file
> has to take care of muxes, order of operations, calling vendor files, etc.
>
> My interest is two part:
>
> 1) I am interested in anything that enables our work
> 2) I am interested in inviting someone from the community, not IC vendor,
> to our meetings to offer advice and help us define something useful
>
> Mike
>
>
>
> > On Apr 23, 2021, at 4:22 PM, Jason Ling <jasonling@google.com> wrote:
> >
> > Hi all,
> >
> > What started as an attempt to create a simple command line tool to
> perform pmbus device upgrades over i2c has turned into the start of a
> user-space i2c library (with some pmbus support).
> >
> > I've already reused this library in some other obmc applications and
> it's been fairly well unit-tested. It also comes with all the public
> interfaces mocked (so you can unit test your own code).
> >
> > The idea is that more and more classes get added that will support
> different pmbus devices.
> > General idea is that each device that gets support can expose methods to
> allow device upgrade, black box retrieval, etc..
> >
> > Anyways, wanted to gauge community interest in this so I can determine
> how motivated I should be to upstream it.
> >
>
>

--000000000000f4700a05c0f6a70b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Mike for the feedback<div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">And the context is more than CPU based s=
ystems, but includes Networking, other boards with ASICS, etc. So broad con=
text. Hence, it has to work within linux without OBMC.</blockquote><div>Ack=
, although the library was written for a use-case that involves obmc, it do=
esn&#39;t <i>require</i>=C2=A0obmc. Should work just fine in general Linux.=
</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=
=A0Now, imagine the IC manufacturer&#39;s tool produces a file that can rep=
resent a qualified algorithm that is known to work under all possible scena=
rios, including CRC errors in parts, corrupt NVM, etc. This is what all the=
 vendors do today. They take care of all the things that can go wrong. In t=
he case of ADI, if power was lost while programming, and the BMC or linux c=
an boot from an aux supply, our data files (encoding algorithms), can repai=
r the part under ALL possible random values in the corrupt part.</blockquot=
e>This would be great, especially if this is codified in the pmbus spec. Ri=
ght now the library provides a pmbus interface but <i>part programming</i>=
=C2=A0is specific to each device class...no guarantee of a common interface=
 across multiple parts.<br><br><div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">1) I am interested in anything that enables our work</blockquote=
><div>Sure, I&#39;ll start carving out more time to make this work suitable=
 for upstreaming. At the very least it should give you a mockable interface=
 to allow for strong unit testing of upper layers.</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">2) I am interested in invit=
ing someone from the community, not IC vendor, to our meetings to offer adv=
ice and help us define something useful</blockquote><div>Sounds good, feel =
free to reach out to me on an individual basis.=C2=A0</div></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Ap=
r 26, 2021 at 7:33 PM Mike Jones &lt;<a href=3D"mailto:proclivis@gmail.com"=
>proclivis@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Jason,<br>
<br>
I am interested, because within the PMBus Specification Committee, we are w=
orking on a data language intended for device programming. And there is hop=
e that eventually it can become adopted into linux and/or OBMC.<br>
<br>
There is a particular use model that is being driven by the IC suppliers an=
d their tools. One reason is that all the vendors have proprietary tools, b=
ut they see no competitive advantage, and would rather support a universal =
standard.<br>
<br>
Imagine that programming might be done for:<br>
<br>
- ICT<br>
- Proto Builds<br>
- Engineering Bringup<br>
- Remote upgrades<br>
<br>
And the context is more than CPU based systems, but includes Networking, ot=
her boards with ASICS, etc. So broad context. Hence, it has to work within =
linux without OBMC.<br>
<br>
My view is it is a linux library anyone can use, and OBMC is the piping if =
it were exposed to a web service, state management, etc.<br>
<br>
Now, imagine the IC manufacturer&#39;s tool produces a file that can repres=
ent a qualified algorithm that is known to work under all possible scenario=
s, including CRC errors in parts, corrupt NVM, etc. This is what all the ve=
ndors do today. They take care of all the things that can go wrong. In the =
case of ADI, if power was lost while programming, and the BMC or linux can =
boot from an aux supply, our data files (encoding algorithms), can repair t=
he part under ALL possible random values in the corrupt part.<br>
<br>
Furthermore, an integrator (CM, Design House, software team) has to deal wi=
th segmented I2C busses, muxes, etc. And the integrator wants to write a wr=
apper file that integrates all the vendor files. So this integration file h=
as to take care of muxes, order of operations, calling vendor files, etc.<b=
r>
<br>
My interest is two part:<br>
<br>
1) I am interested in anything that enables our work<br>
2) I am interested in inviting someone from the community, not IC vendor, t=
o our meetings to offer advice and help us define something useful<br>
<br>
Mike<br>
<br>
<br>
<br>
&gt; On Apr 23, 2021, at 4:22 PM, Jason Ling &lt;<a href=3D"mailto:jasonlin=
g@google.com" target=3D"_blank">jasonling@google.com</a>&gt; wrote:<br>
&gt; <br>
&gt; Hi all,<br>
&gt; <br>
&gt; What started as an attempt to create a simple command line tool to per=
form pmbus device upgrades over i2c has turned into the start of a user-spa=
ce i2c library (with some pmbus support).<br>
&gt; <br>
&gt; I&#39;ve already reused this library in some other obmc applications a=
nd it&#39;s been fairly well unit-tested. It also comes with all the public=
 interfaces mocked (so you can unit test your own code).<br>
&gt; <br>
&gt; The idea is that more and more classes get added that will support dif=
ferent pmbus devices. <br>
&gt; General idea is that each device that gets support can expose methods =
to allow device upgrade, black box retrieval, etc..<br>
&gt; <br>
&gt; Anyways, wanted to gauge community interest in this so I can determine=
 how motivated I should be to upstream it.<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000f4700a05c0f6a70b--
