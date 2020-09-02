Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA2925B64E
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 00:08:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhdP90pjYzDr0d
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 08:08:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::229;
 helo=mail-oi1-x229.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=RDwSyLNL; dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhdNL6fqpzDqQH
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 08:07:44 +1000 (AEST)
Received: by mail-oi1-x229.google.com with SMTP id u126so836668oif.13
 for <openbmc@lists.ozlabs.org>; Wed, 02 Sep 2020 15:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XpPPm9+7hlKcq0mv4Go/opHqZ9IfTytgi49asEf/Fa4=;
 b=RDwSyLNLfGXUNtSEREJIDmg6mQ9mRei+vE29zsN+48zgiSejwlD9EiGpNJaZy93Hli
 abbXmfJKL0CLQ17/DgY5z7ukgJ7XTyJhqRR9CP4imOSDhDHedNZLoN2GRyjqy4+PpplO
 doz4fb93TJmJENy+bngNtyOMaXWdhzHJ+VK7Kuls7DekjE2hkuG5qv4WCsFI6fHswcTi
 CjNh+45x1U3AWzARU2hEOXHZrpXsmTmbzKJ5OYlN1DOvikGo0TJGq5le+IIOXkZw7aMQ
 y/nXjGMWTLlmgqVGTgZBkK1GK10xr91u535WAtdz8iTwSdaNEenQBzzXgKisTcaTlNu3
 GNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XpPPm9+7hlKcq0mv4Go/opHqZ9IfTytgi49asEf/Fa4=;
 b=XAIwJo4zBk7uVf06VlVqVL1bqfBmxdbp8TkqiGS6Ndem7e1VNoJ55fZiIWg1Em1rzz
 xADrbhFROEiK2MILB0Oi5KzH4v8VDGaPyzqoWk+0wHIZq+PSPisw67yj3VRwDhcg0/7P
 ypWIzdcouISrrQ/cjaa+s+oRKiSw9oP+CX30Dd1n5S/JeRezA4lEz0UiPWgjW31wCtdY
 dtwtAyrXd4FutvyK7SMc6ruYsVPzMF4CvR/R9919S4Ap9McMt+CbHGPTc+5N5BxLyDjP
 ABwL7dQ64GvRXxeQHqDg7iInRvKcNNZcNoK6l7kY+pFC2cyaRxSntskqU8qlAWVSbat8
 YPlQ==
X-Gm-Message-State: AOAM53362gPAm4CbMeH4hXB+jfTtau1uJTqkiEj6oI7f/Dgyk71uEnq3
 +l3hzqWBl+AmzXBA9wFyBnxGsMWhXsoHo0ECTmfDTw==
X-Google-Smtp-Source: ABdhPJwghDIYahDNqk+bqt0fmrh0/61u6dbg3CMS9TGDCpwIV5lKmHiszzuBIFf3Cw7P8BzOHUTGuRt/hqiQ5Z/l9RU=
X-Received: by 2002:aca:ec50:: with SMTP id k77mr154015oih.35.1599084462497;
 Wed, 02 Sep 2020 15:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xLk5JhUjEkiWka6LSXJ1gD-BcH0PqgENqroisDKEUyztA@mail.gmail.com>
 <CAA_a9xJ54rpnKm0y+hrEG2YjuFzzhqKBEJbStsu4Q126APgbVg@mail.gmail.com>
 <9129e6cf-76a8-deea-7e8c-1ac17cf45b4b@linux.intel.com>
 <CAA_a9x+A+OkbdTW_M4KT=6eV982Lg_0PoWaYvW47c0Aoh676-w@mail.gmail.com>
 <9679c401-28ce-3197-f871-2cccd2940885@linux.intel.com>
 <CAA_a9xLXDPP-4SodzEnnASupm7GTtB_My+6GbPrtR9A0S23KLg@mail.gmail.com>
 <CAA_a9x+dyj+K7Zr-3nPUoOp35WjVRjHDo7L0AJ2BSp6sV9M_bA@mail.gmail.com>
 <e9f84dab-54c2-d254-6767-14cfc2197318@linux.intel.com>
 <CAA_a9xJ6nAP+nkPoGL1pPEM5zwxYWYQA6TiYgx9qZMw+gBjn_g@mail.gmail.com>
In-Reply-To: <CAA_a9xJ6nAP+nkPoGL1pPEM5zwxYWYQA6TiYgx9qZMw+gBjn_g@mail.gmail.com>
From: Alex Qiu <xqiu@google.com>
Date: Wed, 2 Sep 2020 15:07:31 -0700
Message-ID: <CAA_a9xL8TYcW-c3U=C2uT5NQ=WG-A0DPgrC1E=mr11h6fPBemA@mail.gmail.com>
Subject: Re: Dealing with a sensor which doesn't have valid reading until host
 is powered up
To: James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="0000000000005ad31705ae5bdd1f"
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 Guenter Roeck <groeck@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>, Josh Lehan <krellan@google.com>,
 Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000005ad31705ae5bdd1f
Content-Type: text/plain; charset="UTF-8"

Hi James,

I just tried, now I have no reading at all... I saw you marked your pull
request to work in progress. I'll wait for further updates...

- Alex Qiu


On Wed, Sep 2, 2020 at 1:31 PM Alex Qiu <xqiu@google.com> wrote:

> Hi James,
>
> I think Ed has mentioned the same thing in an internal discussion. I'll
> give it a try.
>
> Anyhow, as discussed with Guenter, EAGAIN still may not be a good use of
> our case here, as it's not something that a busy loop should wait for. I've
> also changed the driver to return ENODATA.
>
> Thanks!
>
> - Alex Qiu
>
>
> On Wed, Sep 2, 2020 at 10:59 AM James Feist <james.feist@linux.intel.com>
> wrote:
>
>> On 8/31/2020 3:08 PM, Alex Qiu wrote:
>> > Hi James,
>> >
>> > I just came through this doc
>> > (
>> https://www.boost.org/doc/libs/1_74_0/doc/html/boost_asio/overview/posix/stream_descriptor.html).
>>
>> > Looks like that it's a terrible idea for hwmon driver to return EAGAIN
>> > for dbus-sensors. With that, I think the proper fix is also to use
>> other
>> > errno instead in our driver, and this caveat should be probably
>> > documented somewhere.
>> >
>>
>> Hi Alex,
>>
>> I hit something similar with peci where timeouts was causing the scan
>> loop to hang. I remembered that back when we were developing ipmbbridge
>> we hit something similar with i2c, and the work around was to use the
>> tcp socket instead
>>
>> https://www.boost.org/doc/libs/1_74_0/doc/html/boost_asio/reference/ip__tcp/socket.html
>> as it could correctly handle the errors. This worked for me for the
>> CpuSensor and is a easy to implement change that might be worth trying
>> for other sensors
>> https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/36181.
>>
>> Thanks
>>
>> James
>>
>

--0000000000005ad31705ae5bdd1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi James,<div><br></div><div>I just tried, now I have no r=
eading at all... I saw you marked your pull request to work in progress. I&=
#39;ll wait for further updates...<br clear=3D"all"><div><div dir=3D"ltr" c=
lass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr=
"><div><br></div>- Alex Qiu</div></div></div><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 2, 2020 =
at 1:31 PM Alex Qiu &lt;<a href=3D"mailto:xqiu@google.com">xqiu@google.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr">Hi James,<div><br></div><div>I think Ed has mentioned the s=
ame=C2=A0thing in an internal discussion. I&#39;ll give it=C2=A0a try.</div=
><div><br></div><div>Anyhow, as discussed with Guenter, EAGAIN still may no=
t be a good use of our case here, as it&#39;s not something that a busy loo=
p should wait for. I&#39;ve also changed the driver to return ENODATA.</div=
><div><br></div><div>Thanks!<br clear=3D"all"><div><div dir=3D"ltr"><div di=
r=3D"ltr"><div><br></div>- Alex Qiu</div></div></div><br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep =
2, 2020 at 10:59 AM James Feist &lt;<a href=3D"mailto:james.feist@linux.int=
el.com" target=3D"_blank">james.feist@linux.intel.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On 8/31/2020 3:08 PM, =
Alex Qiu wrote:<br>
&gt; Hi James,<br>
&gt; <br>
&gt; I just came through this doc <br>
&gt; (<a href=3D"https://www.boost.org/doc/libs/1_74_0/doc/html/boost_asio/=
overview/posix/stream_descriptor.html" rel=3D"noreferrer" target=3D"_blank"=
>https://www.boost.org/doc/libs/1_74_0/doc/html/boost_asio/overview/posix/s=
tream_descriptor.html</a>). <br>
&gt; Looks like that it&#39;s a terrible idea for hwmon driver to return EA=
GAIN <br>
&gt; for dbus-sensors. With that, I think the proper fix is also to use oth=
er <br>
&gt; errno instead in our driver, and this=C2=A0caveat should be probably <=
br>
&gt; documented somewhere.<br>
&gt; <br>
<br>
Hi Alex,<br>
<br>
I hit something similar with peci where timeouts was causing the scan <br>
loop to hang. I remembered that back when we were developing ipmbbridge <br=
>
we hit something similar with i2c, and the work around was to use the <br>
tcp socket instead <br>
<a href=3D"https://www.boost.org/doc/libs/1_74_0/doc/html/boost_asio/refere=
nce/ip__tcp/socket.html" rel=3D"noreferrer" target=3D"_blank">https://www.b=
oost.org/doc/libs/1_74_0/doc/html/boost_asio/reference/ip__tcp/socket.html<=
/a> <br>
as it could correctly handle the errors. This worked for me for the <br>
CpuSensor and is a easy to implement change that might be worth trying <br>
for other sensors <br>
<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/3618=
1" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-project.xyz/=
c/openbmc/dbus-sensors/+/36181</a>.<br>
<br>
Thanks<br>
<br>
James<br>
</blockquote></div>
</blockquote></div>

--0000000000005ad31705ae5bdd1f--
