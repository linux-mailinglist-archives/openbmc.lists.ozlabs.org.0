Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF1A36CABE
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 20:00:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FV8h55sd6z2ym4
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 04:00:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=uHXIHDRF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::135;
 helo=mail-il1-x135.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uHXIHDRF; dkim-atps=neutral
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FV8gr39xBz2xfd
 for <openbmc@lists.ozlabs.org>; Wed, 28 Apr 2021 04:00:38 +1000 (AEST)
Received: by mail-il1-x135.google.com with SMTP id b17so50235666ilh.6
 for <openbmc@lists.ozlabs.org>; Tue, 27 Apr 2021 11:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=5zidRYZk9keskv2x4a1ko3VmVoBNaSHRjc6TAX6GsiM=;
 b=uHXIHDRF+g5/JOhzyFeWzJrOGjRfl+nyzXHPPO/3vdYwAQNSRr5pK1PW9wbdqG+XH4
 ov37EojZzeR4t0GPqM5sh5VZ61owIX2lMAINJTEG5KAqsixFZcQTCCqwfKd35yF1WzT4
 HLDLZHDMgeQgU8lLDbMyTmqMmfJBBk9qneeI1WVWeX7+YQG/zL8GsoBP4nxL4bzD6H48
 D+Pn8uXqoLMcdv63D+lo8xiTqZYuPKqWlAjP+3df/jl1EKoxe3Wv6WKMzmfsPcQFa+7X
 EDq3iPOJ2g7FoB7UE6WOROEDeJ4meYSkYEQAmLpEfLF64hsFAwGndra6Z/UccZoqAv22
 j+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=5zidRYZk9keskv2x4a1ko3VmVoBNaSHRjc6TAX6GsiM=;
 b=Ex5Ud+hn8et9Bn5oup2j+zpSWObPpwKc0TUNHqrSHvcJHThqImsGkqPVU9jGbfSb2V
 gzeZumMKfhztk8gkMHrPRXJXyVUoY1Bu1UuNibJKN+z9Og1Fq9hXKTyVRygvQ42lnYZA
 JV9pnCbGbT43ywd1VxPhZ8YE/+FUg1vBlQmhHUTl2IYZ1uZoeu9C+WVMTht8Bku6UlRx
 eFCMP1un3Kc54yETUNIJ9KnGVJuy8jhsjqeAUWMoEFjJmxpHwPQTKPHHz2cxsTdnP/pj
 QZyVT04g/FEmrLvXt0ZiUp0itiSm45GcMGxli5w5xL2EVy4K6EZ/luSLKAICb4YNdsp0
 wbew==
X-Gm-Message-State: AOAM532LfFYTfxsfXjg0yiHZkMo7hcc/Bv3lg3yLQQ23FTtAoZvYn+AM
 jWsHZhGsIJZYipIq4OSo3uM=
X-Google-Smtp-Source: ABdhPJxQC1aQ56LEyzlzQbCE9jYUMDwZnwB2ODcAk9VpVRBq2OaQfdvfHWqboOXo0UQqg6NahXlfSw==
X-Received: by 2002:a05:6e02:160a:: with SMTP id
 t10mr20762004ilu.261.1619546434465; 
 Tue, 27 Apr 2021 11:00:34 -0700 (PDT)
Received: from ?IPv6:2601:281:c001:2359:38ff:724b:93fd:63f7?
 ([2601:281:c001:2359:38ff:724b:93fd:63f7])
 by smtp.gmail.com with ESMTPSA id y19sm1637580ili.51.2021.04.27.11.00.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Apr 2021 11:00:34 -0700 (PDT)
From: Mike Jones <proclivis@gmail.com>
Message-Id: <6CB9F7DF-35CA-4C58-AC92-6150D00BA6C2@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_544E658C-D961-4B6E-B10F-3F1519DF75FA"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [pmbusplus] userspace i2c, pmbus interactions
Date: Tue, 27 Apr 2021 12:00:13 -0600
In-Reply-To: <CAHBbfcVcXNNK+7aP-DQMP0PPvFHy8gSptmAH08w=YUQoomFw9A@mail.gmail.com>
To: Jason Ling <jasonling@google.com>
References: <CAHBbfcXj57K66ARd2_SQMCdNTPVtWk8Xrq0jn_k+WghjRcT-CA@mail.gmail.com>
 <015CB0F4-95C4-46FA-975A-595F8685405D@gmail.com>
 <CAHBbfcVcXNNK+7aP-DQMP0PPvFHy8gSptmAH08w=YUQoomFw9A@mail.gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
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


--Apple-Mail=_544E658C-D961-4B6E-B10F-3F1519DF75FA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Jason

> On Apr 27, 2021, at 10:20 AM, Jason Ling <jasonling@google.com> wrote:
>=20
> Thanks Mike for the feedback
>=20
> And the context is more than CPU based systems, but includes =
Networking, other boards with ASICS, etc. So broad context. Hence, it =
has to work within linux without OBMC.
> Ack, although the library was written for a use-case that involves =
obmc, it doesn't require obmc. Should work just fine in general Linux.
>=20
>  Now, imagine the IC manufacturer's tool produces a file that can =
represent a qualified algorithm that is known to work under all possible =
scenarios, including CRC errors in parts, corrupt NVM, etc. This is what =
all the vendors do today. They take care of all the things that can go =
wrong. In the case of ADI, if power was lost while programming, and the =
BMC or linux can boot from an aux supply, our data files (encoding =
algorithms), can repair the part under ALL possible random values in the =
corrupt part.
> This would be great, especially if this is codified in the pmbus spec. =
Right now the library provides a pmbus interface but part programming is =
specific to each device class...no guarantee of a common interface =
across multiple parts.

The vendors will never agree to an industry specification for =
programming beyond the standard STORE_USER_ALL. Most real world =
programming is MFR.

This is the reason for a description file, it enables each vendor to =
innovate, yet the end user can process the file with a single engine.

The problem with STORE_USER_ALL is if the power fails or the NVM fails.

For example, some companies just change a few commands, say voltage, and =
then store. But if power is lost during the store, the other 99 values =
are corrupted and need repair, and the part may not even have an address =
on the bus without special commands to reset a few things. Or it might =
be write protected. Or PEC might be required, Etc.

>=20
> 1) I am interested in anything that enables our work
> Sure, I'll start carving out more time to make this work suitable for =
upstreaming. At the very least it should give you a mockable interface =
to allow for strong unit testing of upper layers.

ADI has code that can implement its proprietary programming via =
/dev/i2c. All that is needed is standard SMBus code. If the programming =
happens in user space, we imagined the data processing engine using =
that.

In that context, it would be interesting to know what you are doing, as =
you are adding value for sure. If there is an API that delineates the =
function implemented, it would be nice to review it so I can understand =
your work.

> =20
> 2) I am interested in inviting someone from the community, not IC =
vendor, to our meetings to offer advice and help us define something =
useful
> Sounds good, feel free to reach out to me on an individual basis.=20

Ok. Vivek is on the same list, and he can reach out for an official =
invite.

Mike
>=20
> On Mon, Apr 26, 2021 at 7:33 PM Mike Jones <proclivis@gmail.com =
<mailto:proclivis@gmail.com>> wrote:
> Jason,
>=20
> I am interested, because within the PMBus Specification Committee, we =
are working on a data language intended for device programming. And =
there is hope that eventually it can become adopted into linux and/or =
OBMC.
>=20
> There is a particular use model that is being driven by the IC =
suppliers and their tools. One reason is that all the vendors have =
proprietary tools, but they see no competitive advantage, and would =
rather support a universal standard.
>=20
> Imagine that programming might be done for:
>=20
> - ICT
> - Proto Builds
> - Engineering Bringup
> - Remote upgrades
>=20
> And the context is more than CPU based systems, but includes =
Networking, other boards with ASICS, etc. So broad context. Hence, it =
has to work within linux without OBMC.
>=20
> My view is it is a linux library anyone can use, and OBMC is the =
piping if it were exposed to a web service, state management, etc.
>=20
> Now, imagine the IC manufacturer's tool produces a file that can =
represent a qualified algorithm that is known to work under all possible =
scenarios, including CRC errors in parts, corrupt NVM, etc. This is what =
all the vendors do today. They take care of all the things that can go =
wrong. In the case of ADI, if power was lost while programming, and the =
BMC or linux can boot from an aux supply, our data files (encoding =
algorithms), can repair the part under ALL possible random values in the =
corrupt part.
>=20
> Furthermore, an integrator (CM, Design House, software team) has to =
deal with segmented I2C busses, muxes, etc. And the integrator wants to =
write a wrapper file that integrates all the vendor files. So this =
integration file has to take care of muxes, order of operations, calling =
vendor files, etc.
>=20
> My interest is two part:
>=20
> 1) I am interested in anything that enables our work
> 2) I am interested in inviting someone from the community, not IC =
vendor, to our meetings to offer advice and help us define something =
useful
>=20
> Mike
>=20
>=20
>=20
> > On Apr 23, 2021, at 4:22 PM, Jason Ling <jasonling@google.com =
<mailto:jasonling@google.com>> wrote:
> >=20
> > Hi all,
> >=20
> > What started as an attempt to create a simple command line tool to =
perform pmbus device upgrades over i2c has turned into the start of a =
user-space i2c library (with some pmbus support).
> >=20
> > I've already reused this library in some other obmc applications and =
it's been fairly well unit-tested. It also comes with all the public =
interfaces mocked (so you can unit test your own code).
> >=20
> > The idea is that more and more classes get added that will support =
different pmbus devices.=20
> > General idea is that each device that gets support can expose =
methods to allow device upgrade, black box retrieval, etc..
> >=20
> > Anyways, wanted to gauge community interest in this so I can =
determine how motivated I should be to upstream it.
> >=20
>=20


--Apple-Mail=_544E658C-D961-4B6E-B10F-3F1519DF75FA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Jason<br class=3D""><div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D"">On Apr 27, 2021, at 10:20 AM, =
Jason Ling &lt;<a href=3D"mailto:jasonling@google.com" =
class=3D"">jasonling@google.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D"">Thanks Mike for the feedback<div class=3D""><br =
class=3D""></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">And the context is more than CPU =
based systems, but includes Networking, other boards with ASICS, etc. So =
broad context. Hence, it has to work within linux without =
OBMC.</blockquote><div class=3D"">Ack, although the library was written =
for a use-case that involves obmc, it doesn't <i =
class=3D"">require</i>&nbsp;obmc. Should work just fine in general =
Linux.</div><div class=3D""><br class=3D""></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">&nbsp;Now, imagine the IC =
manufacturer's tool produces a file that can represent a qualified =
algorithm that is known to work under all possible scenarios, including =
CRC errors in parts, corrupt NVM, etc. This is what all the vendors do =
today. They take care of all the things that can go wrong. In the case =
of ADI, if power was lost while programming, and the BMC or linux can =
boot from an aux supply, our data files (encoding algorithms), can =
repair the part under ALL possible random values in the corrupt =
part.</blockquote>This would be great, especially if this is codified in =
the pmbus spec. Right now the library provides a pmbus interface but <i =
class=3D"">part programming</i>&nbsp;is specific to each device =
class...no guarantee of a common interface across multiple parts.<br =
class=3D""></div></div></blockquote><div><br class=3D""></div><div>The =
vendors will never agree to an industry specification for programming =
beyond the standard STORE_USER_ALL. Most real world programming is =
MFR.</div><div><br class=3D""></div><div>This is the reason for a =
description file, it enables each vendor to innovate, yet the end user =
can process the file with a single engine.</div><div><br =
class=3D""></div><div>The problem with STORE_USER_ALL is if the power =
fails or the NVM fails.</div><div><br class=3D""></div><div>For example, =
some companies just change a few commands, say voltage, and then store. =
But if power is lost during the store, the other 99 values are corrupted =
and need repair, and the part may not even have an address on the bus =
without special commands to reset a few things. Or it might be write =
protected. Or PEC might be required, Etc.</div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><br =
class=3D""><div class=3D""><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">1) I am interested in anything that =
enables our work</blockquote><div class=3D"">Sure, I'll start carving =
out more time to make this work suitable for upstreaming. At the very =
least it should give you a mockable interface to allow for strong unit =
testing of upper layers.</div></div></div></div></blockquote><div><br =
class=3D""></div><div>ADI has code that can implement its proprietary =
programming via /dev/i2c. All that is needed is standard SMBus code. If =
the programming happens in user space, we imagined the data processing =
engine using that.</div><div><br class=3D""></div><div>In that context, =
it would be interesting to know what you are doing, as you are adding =
value for sure. If there is an API that delineates the function =
implemented, it would be nice to review it so I can understand your =
work.</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div dir=3D"ltr" class=3D""><div class=3D""><div =
class=3D"">&nbsp;</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">2) I am interested in inviting =
someone from the community, not IC vendor, to our meetings to offer =
advice and help us define something useful</blockquote><div =
class=3D"">Sounds good, feel free to reach out to me on an individual =
basis.&nbsp;</div></div></div></div></blockquote><div><br =
class=3D""></div>Ok. Vivek is on the same list, and he can reach out for =
an official invite.</div><div><br class=3D""></div><div>Mike<br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><br =
class=3D""><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Apr 26, 2021 at 7:33 PM Mike Jones &lt;<a =
href=3D"mailto:proclivis@gmail.com" class=3D"">proclivis@gmail.com</a>&gt;=
 wrote:<br class=3D""></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Jason,<br class=3D"">
<br class=3D"">
I am interested, because within the PMBus Specification Committee, we =
are working on a data language intended for device programming. And =
there is hope that eventually it can become adopted into linux and/or =
OBMC.<br class=3D"">
<br class=3D"">
There is a particular use model that is being driven by the IC suppliers =
and their tools. One reason is that all the vendors have proprietary =
tools, but they see no competitive advantage, and would rather support a =
universal standard.<br class=3D"">
<br class=3D"">
Imagine that programming might be done for:<br class=3D"">
<br class=3D"">
- ICT<br class=3D"">
- Proto Builds<br class=3D"">
- Engineering Bringup<br class=3D"">
- Remote upgrades<br class=3D"">
<br class=3D"">
And the context is more than CPU based systems, but includes Networking, =
other boards with ASICS, etc. So broad context. Hence, it has to work =
within linux without OBMC.<br class=3D"">
<br class=3D"">
My view is it is a linux library anyone can use, and OBMC is the piping =
if it were exposed to a web service, state management, etc.<br class=3D"">=

<br class=3D"">
Now, imagine the IC manufacturer's tool produces a file that can =
represent a qualified algorithm that is known to work under all possible =
scenarios, including CRC errors in parts, corrupt NVM, etc. This is what =
all the vendors do today. They take care of all the things that can go =
wrong. In the case of ADI, if power was lost while programming, and the =
BMC or linux can boot from an aux supply, our data files (encoding =
algorithms), can repair the part under ALL possible random values in the =
corrupt part.<br class=3D"">
<br class=3D"">
Furthermore, an integrator (CM, Design House, software team) has to deal =
with segmented I2C busses, muxes, etc. And the integrator wants to write =
a wrapper file that integrates all the vendor files. So this integration =
file has to take care of muxes, order of operations, calling vendor =
files, etc.<br class=3D"">
<br class=3D"">
My interest is two part:<br class=3D"">
<br class=3D"">
1) I am interested in anything that enables our work<br class=3D"">
2) I am interested in inviting someone from the community, not IC =
vendor, to our meetings to offer advice and help us define something =
useful<br class=3D"">
<br class=3D"">
Mike<br class=3D"">
<br class=3D"">
<br class=3D"">
<br class=3D"">
&gt; On Apr 23, 2021, at 4:22 PM, Jason Ling &lt;<a =
href=3D"mailto:jasonling@google.com" target=3D"_blank" =
class=3D"">jasonling@google.com</a>&gt; wrote:<br class=3D"">
&gt; <br class=3D"">
&gt; Hi all,<br class=3D"">
&gt; <br class=3D"">
&gt; What started as an attempt to create a simple command line tool to =
perform pmbus device upgrades over i2c has turned into the start of a =
user-space i2c library (with some pmbus support).<br class=3D"">
&gt; <br class=3D"">
&gt; I've already reused this library in some other obmc applications =
and it's been fairly well unit-tested. It also comes with all the public =
interfaces mocked (so you can unit test your own code).<br class=3D"">
&gt; <br class=3D"">
&gt; The idea is that more and more classes get added that will support =
different pmbus devices. <br class=3D"">
&gt; General idea is that each device that gets support can expose =
methods to allow device upgrade, black box retrieval, etc..<br class=3D"">=

&gt; <br class=3D"">
&gt; Anyways, wanted to gauge community interest in this so I can =
determine how motivated I should be to upstream it.<br class=3D"">
&gt; <br class=3D"">
<br class=3D"">
</blockquote></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_544E658C-D961-4B6E-B10F-3F1519DF75FA--
