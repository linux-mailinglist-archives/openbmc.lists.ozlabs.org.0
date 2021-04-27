Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFAB36CBFF
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 21:49:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVC5g2Yc8z301D
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 05:49:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=meDzeEHh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2a;
 helo=mail-qv1-xf2a.google.com; envelope-from=vivekgani@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=meDzeEHh; dkim-atps=neutral
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVC5Q4WXSz2y8C
 for <openbmc@lists.ozlabs.org>; Wed, 28 Apr 2021 05:49:28 +1000 (AEST)
Received: by mail-qv1-xf2a.google.com with SMTP id x27so29659509qvd.2
 for <openbmc@lists.ozlabs.org>; Tue, 27 Apr 2021 12:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=i3i6fRwYNi2MTBfld91/DBcyNw3uir2M9m0tvWbNtBk=;
 b=meDzeEHh5A6GGOGoyUBE7FJvE5QdMsPvVwINrq3EO809P2hDR1DfbQ9QMTtK7K7pAT
 d4ubJVvIuunIZynPdijy8hnRyFugFJiDQpNbPP97/8FS05W2fx1FEctT99o1cPKlJxdu
 IWs7AP/onVbkMC/jk+oOiQUE/6Izr6xRAFzbrtSbp6PQ+DkJxEWydA3lOiF6Iowk8Pww
 HZgm9bs9t8dx1nRgikAIv7DbABN9PYKI1OrAPx3yg8FwvHYY9CxYfzM4DQx1bmjM6DhI
 9Paiob/fkIoH0wg7/L6qX5IeCfxO1oM3fBQ+P7EW8mr/FaO6jkRcSXUReacfnyKnZlSf
 EDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=i3i6fRwYNi2MTBfld91/DBcyNw3uir2M9m0tvWbNtBk=;
 b=hl1i04IeegCprfSL+2DBjAYrz9s6GqlG8SkZhRzS0nNL6YjTAoRtnshTL7Wda7xsm6
 zjHJ7+XFju21CIPo+Q6XgBjJe/azQay/u8eMzzfYlPJqyjieIp1jCa57xGmgqm4kgLko
 rAz2f7UOBBD4IaYcEINoCQktURXdYbUptXZuo7juvdabbxM18+ZRVJtjzDwl5VU4u/U3
 4aLJpJgARZWh5lDchXeKLDHxeILe223EAxf4EdPkl+yrCOYA4mhAT2SmVGz1fNRIUOyW
 RcSEBDaKtm+neX4Cv12Md2iEWHZsno1PDzSeRZ8enqTCvZwL4mYp3Ak9p/kxCepa2gPr
 T9fQ==
X-Gm-Message-State: AOAM531RwSZUG4YsqAOMbWIWN2KQzh28I2J4zvFH6eMBOrLxvN4u8d+H
 8KVIkHFGjA/E5zS/X3jqCNqSsXO1mWkiu8/wQpg=
X-Google-Smtp-Source: ABdhPJwn1gJvuO1bRfTbG8tmp37+p62iAB7yC8j4hK3Nou4aEdE+gp9/7zikVZJgtmimvGzIgetHbvwdnSGXbIL+nvo=
X-Received: by 2002:a0c:b399:: with SMTP id t25mr4988314qve.31.1619552963739; 
 Tue, 27 Apr 2021 12:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBbfcXj57K66ARd2_SQMCdNTPVtWk8Xrq0jn_k+WghjRcT-CA@mail.gmail.com>
 <015CB0F4-95C4-46FA-975A-595F8685405D@gmail.com>
 <CAHBbfcVcXNNK+7aP-DQMP0PPvFHy8gSptmAH08w=YUQoomFw9A@mail.gmail.com>
 <6CB9F7DF-35CA-4C58-AC92-6150D00BA6C2@gmail.com>
In-Reply-To: <6CB9F7DF-35CA-4C58-AC92-6150D00BA6C2@gmail.com>
From: Vivek Gani <vivekgani@gmail.com>
Date: Tue, 27 Apr 2021 14:49:12 -0500
Message-ID: <CAB-qw-gMf8yvpXb9R63dxF3kHSqrTSU3uhEDoxPKGTQrWCpNhA@mail.gmail.com>
Subject: Re: [pmbusplus] userspace i2c, pmbus interactions
To: Mike Jones <proclivis@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000019431705c0f98f93"
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
Reply-To: vivek@gani.org
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000019431705c0f98f93
Content-Type: text/plain; charset="UTF-8"

Thanks Mike, to follow up with your response,

I agree that most real-world configuration ends up being mfr-specific. Over
time specs like PMBus Application Profiles may help on some aspects but
from personal experience there's variation between vendors on aspects like
detection of PMBus devices, or occasionally complexity around command
timing & order. This has led us to think around a need of defining a
standardized file format with the possibility of conventions around how
procedures are named (e.g. configure, identify, on/off, etc.) and naming
side-effects (e.g. requires power-cycle or boot stage) to make things
easier for a systems engineer to orchestrate.

We've been facilitating calls around what we'd want in a format and making
some initial rough prototypes for discussion. Most recently we looked at a
format [0] that could decouple IC vendor and system engineer aspects,
facilitate real-world scenarios of needing human-editability, and export to
JSON for use obmc runtime configuration.

This week we're trying to pick up where we left off a month ago so this is
a great time to bring up any opinions/ideas. I want to extend the
invitation out to anyone interested, send me an email and I can arrange to
get you on our mailing list or would if like me to reach-out after our next
meeting to share some highlights of what's happening.

[0]:
https://github.com/PMBusOrg/format-language-evaluation/tree/master/dhall

-Vivek Gani (CV <https://vivekgani.com/vivek_gani_resume.pdf>)
vivek@gani.org

On Tue, Apr 27, 2021 at 1:01 PM Mike Jones <proclivis@gmail.com> wrote:

> Jason
>
> On Apr 27, 2021, at 10:20 AM, Jason Ling <jasonling@google.com> wrote:
>
> Thanks Mike for the feedback
>
> And the context is more than CPU based systems, but includes Networking,
>> other boards with ASICS, etc. So broad context. Hence, it has to work
>> within linux without OBMC.
>
> Ack, although the library was written for a use-case that involves obmc,
> it doesn't *require* obmc. Should work just fine in general Linux.
>
>  Now, imagine the IC manufacturer's tool produces a file that can
>> represent a qualified algorithm that is known to work under all possible
>> scenarios, including CRC errors in parts, corrupt NVM, etc. This is what
>> all the vendors do today. They take care of all the things that can go
>> wrong. In the case of ADI, if power was lost while programming, and the BMC
>> or linux can boot from an aux supply, our data files (encoding algorithms),
>> can repair the part under ALL possible random values in the corrupt part.
>
> This would be great, especially if this is codified in the pmbus spec.
> Right now the library provides a pmbus interface but *part programming* is
> specific to each device class...no guarantee of a common interface across
> multiple parts.
>
>
> The vendors will never agree to an industry specification for programming
> beyond the standard STORE_USER_ALL. Most real world programming is MFR.
>
> This is the reason for a description file, it enables each vendor to
> innovate, yet the end user can process the file with a single engine.
>
> The problem with STORE_USER_ALL is if the power fails or the NVM fails.
>
> For example, some companies just change a few commands, say voltage, and
> then store. But if power is lost during the store, the other 99 values are
> corrupted and need repair, and the part may not even have an address on the
> bus without special commands to reset a few things. Or it might be write
> protected. Or PEC might be required, Etc.
>
>
> 1) I am interested in anything that enables our work
>
> Sure, I'll start carving out more time to make this work suitable for
> upstreaming. At the very least it should give you a mockable interface to
> allow for strong unit testing of upper layers.
>
>
> ADI has code that can implement its proprietary programming via /dev/i2c.
> All that is needed is standard SMBus code. If the programming happens in
> user space, we imagined the data processing engine using that.
>
> In that context, it would be interesting to know what you are doing, as
> you are adding value for sure. If there is an API that delineates the
> function implemented, it would be nice to review it so I can understand
> your work.
>
>
>
>> 2) I am interested in inviting someone from the community, not IC vendor,
>> to our meetings to offer advice and help us define something useful
>
> Sounds good, feel free to reach out to me on an individual basis.
>
>
> Ok. Vivek is on the same list, and he can reach out for an official invite.
>
> Mike
>
>
> On Mon, Apr 26, 2021 at 7:33 PM Mike Jones <proclivis@gmail.com> wrote:
>
>> Jason,
>>
>> I am interested, because within the PMBus Specification Committee, we are
>> working on a data language intended for device programming. And there is
>> hope that eventually it can become adopted into linux and/or OBMC.
>>
>> There is a particular use model that is being driven by the IC suppliers
>> and their tools. One reason is that all the vendors have proprietary tools,
>> but they see no competitive advantage, and would rather support a universal
>> standard.
>>
>> Imagine that programming might be done for:
>>
>> - ICT
>> - Proto Builds
>> - Engineering Bringup
>> - Remote upgrades
>>
>> And the context is more than CPU based systems, but includes Networking,
>> other boards with ASICS, etc. So broad context. Hence, it has to work
>> within linux without OBMC.
>>
>> My view is it is a linux library anyone can use, and OBMC is the piping
>> if it were exposed to a web service, state management, etc.
>>
>> Now, imagine the IC manufacturer's tool produces a file that can
>> represent a qualified algorithm that is known to work under all possible
>> scenarios, including CRC errors in parts, corrupt NVM, etc. This is what
>> all the vendors do today. They take care of all the things that can go
>> wrong. In the case of ADI, if power was lost while programming, and the BMC
>> or linux can boot from an aux supply, our data files (encoding algorithms),
>> can repair the part under ALL possible random values in the corrupt part.
>>
>> Furthermore, an integrator (CM, Design House, software team) has to deal
>> with segmented I2C busses, muxes, etc. And the integrator wants to write a
>> wrapper file that integrates all the vendor files. So this integration file
>> has to take care of muxes, order of operations, calling vendor files, etc.
>>
>> My interest is two part:
>>
>> 1) I am interested in anything that enables our work
>> 2) I am interested in inviting someone from the community, not IC vendor,
>> to our meetings to offer advice and help us define something useful
>>
>> Mike
>>
>>
>>
>> > On Apr 23, 2021, at 4:22 PM, Jason Ling <jasonling@google.com> wrote:
>> >
>> > Hi all,
>> >
>> > What started as an attempt to create a simple command line tool to
>> perform pmbus device upgrades over i2c has turned into the start of a
>> user-space i2c library (with some pmbus support).
>> >
>> > I've already reused this library in some other obmc applications and
>> it's been fairly well unit-tested. It also comes with all the public
>> interfaces mocked (so you can unit test your own code).
>> >
>> > The idea is that more and more classes get added that will support
>> different pmbus devices.
>> > General idea is that each device that gets support can expose methods
>> to allow device upgrade, black box retrieval, etc..
>> >
>> > Anyways, wanted to gauge community interest in this so I can determine
>> how motivated I should be to upstream it.
>> >
>>
>>
>

--00000000000019431705c0f98f93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thanks Mike, to follow up with your respo=
nse,<br></div><div dir=3D"ltr"><br></div><div>I agree that most real-world =
configuration ends up being mfr-specific. Over time specs like PMBus Applic=
ation Profiles may help on some aspects but from personal experience there&=
#39;s variation between vendors on aspects like detection of PMBus devices,=
 or occasionally complexity around command timing &amp; order. This has led=
 us to think around a need of defining a standardized file format with the =
possibility of conventions around how procedures are named (e.g. configure,=
 identify, on/off, etc.) and naming side-effects (e.g. requires power-cycle=
 or boot stage) to make things easier for a systems engineer to orchestrate=
.</div><div><br></div><div>We&#39;ve been facilitating calls around what we=
&#39;d want in a format and making some initial rough prototypes for discus=
sion. Most recently we looked at a format [0] that could decouple IC vendor=
 and system engineer aspects, facilitate real-world scenarios of needing hu=
man-editability, and export to JSON for use obmc runtime configuration. <br=
></div><div><br></div><div>This week we&#39;re trying to pick up where we l=
eft off a month ago so this is a great time to bring up any opinions/ideas.=
 I want to extend the invitation out to anyone interested, send me an email=
 and I can arrange to get you on our mailing list or would if like me to re=
ach-out after our next meeting to share some highlights of what&#39;s happe=
ning.<br></div><div><br></div><div>[0]: <a href=3D"https://github.com/PMBus=
Org/format-language-evaluation/tree/master/dhall">https://github.com/PMBusO=
rg/format-language-evaluation/tree/master/dhall</a> <br></div><div><br> </d=
iv><div>-Vivek Gani (<a href=3D"https://vivekgani.com/vivek_gani_resume.pdf=
">CV</a>)</div><div><a href=3D"mailto:vivek@gani.org">vivek@gani.org</a><br=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Tue, Apr 27, 2021 at 1:01 PM Mike Jones &lt;<a href=3D"mailto:proclivis=
@gmail.com">proclivis@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div style=3D"overflow-wrap: break-word;">=
Jason<br><div><br><blockquote type=3D"cite"><div>On Apr 27, 2021, at 10:20 =
AM, Jason Ling &lt;<a href=3D"mailto:jasonling@google.com" target=3D"_blank=
">jasonling@google.com</a>&gt; wrote:</div><br><div><div dir=3D"ltr">Thanks=
 Mike for the feedback<div><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">And the context is more than CPU based systems, but includes Ne=
tworking, other boards with ASICS, etc. So broad context. Hence, it has to =
work within linux without OBMC.</blockquote><div>Ack, although the library =
was written for a use-case that involves obmc, it doesn&#39;t <i>require</i=
>=C2=A0obmc. Should work just fine in general Linux.</div><div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0Now, imagine the IC m=
anufacturer&#39;s tool produces a file that can represent a qualified algor=
ithm that is known to work under all possible scenarios, including CRC erro=
rs in parts, corrupt NVM, etc. This is what all the vendors do today. They =
take care of all the things that can go wrong. In the case of ADI, if power=
 was lost while programming, and the BMC or linux can boot from an aux supp=
ly, our data files (encoding algorithms), can repair the part under ALL pos=
sible random values in the corrupt part.</blockquote>This would be great, e=
specially if this is codified in the pmbus spec. Right now the library prov=
ides a pmbus interface but <i>part programming</i>=C2=A0is specific to each=
 device class...no guarantee of a common interface across multiple parts.<b=
r></div></div></blockquote><div><br></div><div>The vendors will never agree=
 to an industry specification for programming beyond the standard STORE_USE=
R_ALL. Most real world programming is MFR.</div><div><br></div><div>This is=
 the reason for a description file, it enables each vendor to innovate, yet=
 the end user can process the file with a single engine.</div><div><br></di=
v><div>The problem with STORE_USER_ALL is if the power fails or the NVM fai=
ls.</div><div><br></div><div>For example, some companies just change a few =
commands, say voltage, and then store. But if power is lost during the stor=
e, the other 99 values are corrupted and need repair, and the part may not =
even have an address on the bus without special commands to reset a few thi=
ngs. Or it might be write protected. Or PEC might be required, Etc.</div><b=
r><blockquote type=3D"cite"><div><div dir=3D"ltr"><br><div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">1) I am interested in anything that enabl=
es our work</blockquote><div>Sure, I&#39;ll start carving out more time to =
make this work suitable for upstreaming. At the very least it should give y=
ou a mockable interface to allow for strong unit testing of upper layers.</=
div></div></div></div></blockquote><div><br></div><div>ADI has code that ca=
n implement its proprietary programming via /dev/i2c. All that is needed is=
 standard SMBus code. If the programming happens in user space, we imagined=
 the data processing engine using that.</div><div><br></div><div>In that co=
ntext, it would be interesting to know what you are doing, as you are addin=
g value for sure. If there is an API that delineates the function implement=
ed, it would be nice to review it so I can understand your work.</div><br><=
blockquote type=3D"cite"><div><div dir=3D"ltr"><div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">2) I am interested in inviting =
someone from the community, not IC vendor, to our meetings to offer advice =
and help us define something useful</blockquote><div>Sounds good, feel free=
 to reach out to me on an individual basis.=C2=A0</div></div></div></div></=
blockquote><div><br></div>Ok. Vivek is on the same list, and he can reach o=
ut for an official invite.</div><div><br></div><div>Mike<br><blockquote typ=
e=3D"cite"><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Mon, Apr 26, 2021 at 7:33 PM Mike Jones &lt;<a href=3D"mailto:=
proclivis@gmail.com" target=3D"_blank">proclivis@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Jason,<br>
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
</div></blockquote></div><br></div></blockquote></div></div>

--00000000000019431705c0f98f93--
