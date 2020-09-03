Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4319D25C778
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 18:52:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bj6KX1myDzDr9C
	for <lists+openbmc@lfdr.de>; Fri,  4 Sep 2020 02:52:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::331;
 helo=mail-ot1-x331.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=FNYvO+UD; dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bj5Fx1QLbzDr10
 for <openbmc@lists.ozlabs.org>; Fri,  4 Sep 2020 02:03:47 +1000 (AEST)
Received: by mail-ot1-x331.google.com with SMTP id g10so3168070otq.9
 for <openbmc@lists.ozlabs.org>; Thu, 03 Sep 2020 09:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HsISgZHME7uUBkn7flzsWs5Tz3KnkoW+/wjeDVT0gRs=;
 b=FNYvO+UDqAaC+SOw2mjh/cQaxKMf84PDOOfYwSI+rtwSy/OPgdoEaeRUlsFDd2DBYc
 aUyJDi5/gXY1mKPlAww4fzFHjb01RbWmNRW3xi9NruIVUkxuzykMGLjV3w+i6UNuqJNp
 4asQ2sn0PgqNyuGpwHDqsJr/J/62TcX3J5t9buEzZKLP/+sI1f/mokC3aTZwU9StnyBy
 hhVcZyzdTQxJEVlFUMLM/yi48hZjjZt8ayvENTE+Ij4QKrEl/8Ga/Npq0hmL2E8Rr5sk
 C2Gd/6OgwMVdb2LdiVsTdcrmOccPkhKGr5ueBMgXfjcPQ14YAipEoeslay7jeJevh0hR
 HDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HsISgZHME7uUBkn7flzsWs5Tz3KnkoW+/wjeDVT0gRs=;
 b=VzeK82PiV8h3NGRkjUIdN/Tlpkk+BYQizPAXa4zp++0STGP3x0gz0Wg3ZHC45FVSaO
 opjf2W+qeOg7ZTIRzLku14iB3jIbKiuqmKfaAtwweBJUwmnh9ckgfs0JnP4OpT106uXx
 aefushnWY7zx/YtC8bDd4jyty/6hLvof10oWIrTdAx4q5dW90NUeOi3JVoBw/qZc+1tP
 gnwjCkyKDwh12ddrHCvV+m1iYiSu9VmDCUQS1IkBX2SdAosB9ttg6lYUCC8FNYwIbCG5
 /92yRTk57HViSq3Z040NdbXy2W1sH/2qjFeAve/IbL4pqYV67qVEzxVm9SruQlv161c/
 92pg==
X-Gm-Message-State: AOAM531HAGTTkBU2c3RA8kNbcnRuKZAveDWG3xUe1UXaMZWYFAwHfx7v
 4cNpHiatWokSPHSJvYrMWZiIIAnBve4YX8+aBZ/S3Q==
X-Google-Smtp-Source: ABdhPJxn1bMQZijIbiQ9as/O/mMy1qftrfW6gb+HVoRiIi5bLE+1rXlyemhjLVPfI7u/NDi5DOB1wdqmSgfPlIajTeM=
X-Received: by 2002:a9d:6f06:: with SMTP id n6mr1832721otq.302.1599149018018; 
 Thu, 03 Sep 2020 09:03:38 -0700 (PDT)
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
 <CAA_a9xL8TYcW-c3U=C2uT5NQ=WG-A0DPgrC1E=mr11h6fPBemA@mail.gmail.com>
 <CABXOdTe3V68T-yveu1XW4Px_C=SUKP_ra7ALsFzZVO70SJu4BA@mail.gmail.com>
In-Reply-To: <CABXOdTe3V68T-yveu1XW4Px_C=SUKP_ra7ALsFzZVO70SJu4BA@mail.gmail.com>
From: Alex Qiu <xqiu@google.com>
Date: Thu, 3 Sep 2020 09:03:26 -0700
Message-ID: <CAA_a9xKotRbuMkvJA7Y0dij8KkFDeXpC_zn5d=ZvuDcxMT9APw@mail.gmail.com>
Subject: Re: Dealing with a sensor which doesn't have valid reading until host
 is powered up
To: Guenter Roeck <groeck@google.com>
Content-Type: multipart/alternative; boundary="00000000000029f80e05ae6ae5b8"
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Josh Lehan <krellan@google.com>, James Feist <james.feist@linux.intel.com>,
 Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000029f80e05ae6ae5b8
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

For that, this was referring to the OpenBMC application. What I meant is
that even normal sensors stopped working... . Sry for the confusion...

- Alex Qiu


On Thu, Sep 3, 2020 at 8:31 AM Guenter Roeck <groeck@google.com> wrote:

> On Wed, Sep 2, 2020 at 3:07 PM Alex Qiu <xqiu@google.com> wrote:
> >
> > Hi James,
> >
> > I just tried, now I have no reading at all... I saw you marked your pull
> request to work in progress. I'll wait for further updates...
> >
> I may be missing something, but isn't that the idea ?
>
> Thanks,
> Guenter
>
> > - Alex Qiu
> >
> >
> > On Wed, Sep 2, 2020 at 1:31 PM Alex Qiu <xqiu@google.com> wrote:
> >>
> >> Hi James,
> >>
> >> I think Ed has mentioned the same thing in an internal discussion. I'll
> give it a try.
> >>
> >> Anyhow, as discussed with Guenter, EAGAIN still may not be a good use
> of our case here, as it's not something that a busy loop should wait for.
> I've also changed the driver to return ENODATA.
> >>
> >> Thanks!
> >>
> >> - Alex Qiu
> >>
> >>
> >> On Wed, Sep 2, 2020 at 10:59 AM James Feist <
> james.feist@linux.intel.com> wrote:
> >>>
> >>> On 8/31/2020 3:08 PM, Alex Qiu wrote:
> >>> > Hi James,
> >>> >
> >>> > I just came through this doc
> >>> > (
> https://www.boost.org/doc/libs/1_74_0/doc/html/boost_asio/overview/posix/stream_descriptor.html
> ).
> >>> > Looks like that it's a terrible idea for hwmon driver to return
> EAGAIN
> >>> > for dbus-sensors. With that, I think the proper fix is also to use
> other
> >>> > errno instead in our driver, and this caveat should be probably
> >>> > documented somewhere.
> >>> >
> >>>
> >>> Hi Alex,
> >>>
> >>> I hit something similar with peci where timeouts was causing the scan
> >>> loop to hang. I remembered that back when we were developing ipmbbridge
> >>> we hit something similar with i2c, and the work around was to use the
> >>> tcp socket instead
> >>>
> https://www.boost.org/doc/libs/1_74_0/doc/html/boost_asio/reference/ip__tcp/socket.html
> >>> as it could correctly handle the errors. This worked for me for the
> >>> CpuSensor and is a easy to implement change that might be worth trying
> >>> for other sensors
> >>> https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/36181.
> >>>
> >>> Thanks
> >>>
> >>> James
>

--00000000000029f80e05ae6ae5b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Guenter,<div><br></div><div>For that, this was referrin=
g to the OpenBMC application. What I meant is that even normal sensors stop=
ped=C2=A0working... . Sry for the confusion...<br clear=3D"all"><div><div d=
ir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><di=
v dir=3D"ltr"><div><br></div>- Alex Qiu</div></div></div><br></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, =
Sep 3, 2020 at 8:31 AM Guenter Roeck &lt;<a href=3D"mailto:groeck@google.co=
m">groeck@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Wed, Sep 2, 2020 at 3:07 PM Alex Qiu &lt;<a href=3D"=
mailto:xqiu@google.com" target=3D"_blank">xqiu@google.com</a>&gt; wrote:<br=
>
&gt;<br>
&gt; Hi James,<br>
&gt;<br>
&gt; I just tried, now I have no reading at all... I saw you marked your pu=
ll request to work in progress. I&#39;ll wait for further updates...<br>
&gt;<br>
I may be missing something, but isn&#39;t that the idea ?<br>
<br>
Thanks,<br>
Guenter<br>
<br>
&gt; - Alex Qiu<br>
&gt;<br>
&gt;<br>
&gt; On Wed, Sep 2, 2020 at 1:31 PM Alex Qiu &lt;<a href=3D"mailto:xqiu@goo=
gle.com" target=3D"_blank">xqiu@google.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi James,<br>
&gt;&gt;<br>
&gt;&gt; I think Ed has mentioned the same thing in an internal discussion.=
 I&#39;ll give it a try.<br>
&gt;&gt;<br>
&gt;&gt; Anyhow, as discussed with Guenter, EAGAIN still may not be a good =
use of our case here, as it&#39;s not something that a busy loop should wai=
t for. I&#39;ve also changed the driver to return ENODATA.<br>
&gt;&gt;<br>
&gt;&gt; Thanks!<br>
&gt;&gt;<br>
&gt;&gt; - Alex Qiu<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Sep 2, 2020 at 10:59 AM James Feist &lt;<a href=3D"mailto:=
james.feist@linux.intel.com" target=3D"_blank">james.feist@linux.intel.com<=
/a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 8/31/2020 3:08 PM, Alex Qiu wrote:<br>
&gt;&gt;&gt; &gt; Hi James,<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; I just came through this doc<br>
&gt;&gt;&gt; &gt; (<a href=3D"https://www.boost.org/doc/libs/1_74_0/doc/htm=
l/boost_asio/overview/posix/stream_descriptor.html" rel=3D"noreferrer" targ=
et=3D"_blank">https://www.boost.org/doc/libs/1_74_0/doc/html/boost_asio/ove=
rview/posix/stream_descriptor.html</a>).<br>
&gt;&gt;&gt; &gt; Looks like that it&#39;s a terrible idea for hwmon driver=
 to return EAGAIN<br>
&gt;&gt;&gt; &gt; for dbus-sensors. With that, I think the proper fix is al=
so to use other<br>
&gt;&gt;&gt; &gt; errno instead in our driver, and this caveat should be pr=
obably<br>
&gt;&gt;&gt; &gt; documented somewhere.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Hi Alex,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I hit something similar with peci where timeouts was causing t=
he scan<br>
&gt;&gt;&gt; loop to hang. I remembered that back when we were developing i=
pmbbridge<br>
&gt;&gt;&gt; we hit something similar with i2c, and the work around was to =
use the<br>
&gt;&gt;&gt; tcp socket instead<br>
&gt;&gt;&gt; <a href=3D"https://www.boost.org/doc/libs/1_74_0/doc/html/boos=
t_asio/reference/ip__tcp/socket.html" rel=3D"noreferrer" target=3D"_blank">=
https://www.boost.org/doc/libs/1_74_0/doc/html/boost_asio/reference/ip__tcp=
/socket.html</a><br>
&gt;&gt;&gt; as it could correctly handle the errors. This worked for me fo=
r the<br>
&gt;&gt;&gt; CpuSensor and is a easy to implement change that might be wort=
h trying<br>
&gt;&gt;&gt; for other sensors<br>
&gt;&gt;&gt; <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/dbus-s=
ensors/+/36181" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc=
-project.xyz/c/openbmc/dbus-sensors/+/36181</a>.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; James<br>
</blockquote></div>

--00000000000029f80e05ae6ae5b8--
