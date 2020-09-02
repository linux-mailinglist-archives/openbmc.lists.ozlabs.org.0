Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D318825B553
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 22:32:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhbGl6bsqzDqkj
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 06:32:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ZtReVvK2; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhbFt5tpzzDr15
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 06:32:00 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id x14so630067oic.9
 for <openbmc@lists.ozlabs.org>; Wed, 02 Sep 2020 13:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mgKzaPK/V2l+eD54+7MG48tHoyTgmhL4nferZOxsUQc=;
 b=ZtReVvK2jXPtLckLmcLCwXvJFQAm13dJDgjlax7wCCH3Cyg/Q1m32Jb7lXT+dhyXUo
 pJAnyq9jU4JVWPPawTD9kUiXsw8YvdaHH+lkEp8J8yH3Fd1InZce7hPrrPjjcRg23egF
 TtePTZFZZ3C8QzQVHD0DOExu0qbH0EKRWxhnZU9sSnnKzIEXHy4SrdQNL0ZwLcvprcRB
 cKojz06fwJD7alK9mj3LG7XFfelWbuA75Wm+wCvojMZal74V2oMn4QZyjplbv+sxcgTT
 W9uxnzHxI07z6PYm5NqDcZZpuL1za4JoGDlK2u9si5nhmd2ypFyMSORumuFEW/S4X8/X
 PFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mgKzaPK/V2l+eD54+7MG48tHoyTgmhL4nferZOxsUQc=;
 b=IL92yaqXD7SxxAHq3iP5SCw99gOr66Un/m0RNS1I+HWfNv2biw+kD6KuUoksKI2979
 NOSEcM07+89O8p19T2+MiirafPPZLiN/NqqiMVvQlTMohxNDnjy+LmZ+OQziCr/n5Jxz
 U5wLix74faLTkNasFtjrd37EDLG3q5/5lSFcbtBJZbFHndthsujSDMxFuQ36AW236twQ
 0v+sscsADOyhDlje4VH2rQr0kU1XxkBp8JplYHTG9iEJ6KF0mhlfllTI+Li0JAPz0mLY
 hyi0Jx1sq7JpFr51Hhxw9qB3vgj8GDLzknrJmoNjoal7OHQ5CLagtKPSUfOnJUyDMOfB
 VI6A==
X-Gm-Message-State: AOAM532if+yt53rOao4Cteusxc04TiTV/peOmBaipTa2Rmj56T29m2PQ
 sEuSa40aAmcE6jTNVoTqZ+yfWYynalA2bvN2ITv1JQ==
X-Google-Smtp-Source: ABdhPJyd0LBwEQxJBoVdEBSNU0Te5MQxi5tZILCd8BO6P9iu7A3pvROO/TovNOFhW/qCWwlkuf91/et+CurG/g3bXDc=
X-Received: by 2002:aca:ec50:: with SMTP id k77mr3130616oih.35.1599078716656; 
 Wed, 02 Sep 2020 13:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xLk5JhUjEkiWka6LSXJ1gD-BcH0PqgENqroisDKEUyztA@mail.gmail.com>
 <CAA_a9xJ54rpnKm0y+hrEG2YjuFzzhqKBEJbStsu4Q126APgbVg@mail.gmail.com>
 <9129e6cf-76a8-deea-7e8c-1ac17cf45b4b@linux.intel.com>
 <CAA_a9x+A+OkbdTW_M4KT=6eV982Lg_0PoWaYvW47c0Aoh676-w@mail.gmail.com>
 <9679c401-28ce-3197-f871-2cccd2940885@linux.intel.com>
 <CAA_a9xLXDPP-4SodzEnnASupm7GTtB_My+6GbPrtR9A0S23KLg@mail.gmail.com>
 <CAA_a9x+dyj+K7Zr-3nPUoOp35WjVRjHDo7L0AJ2BSp6sV9M_bA@mail.gmail.com>
 <e9f84dab-54c2-d254-6767-14cfc2197318@linux.intel.com>
In-Reply-To: <e9f84dab-54c2-d254-6767-14cfc2197318@linux.intel.com>
From: Alex Qiu <xqiu@google.com>
Date: Wed, 2 Sep 2020 13:31:45 -0700
Message-ID: <CAA_a9xJ6nAP+nkPoGL1pPEM5zwxYWYQA6TiYgx9qZMw+gBjn_g@mail.gmail.com>
Subject: Re: Dealing with a sensor which doesn't have valid reading until host
 is powered up
To: James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000e037c105ae5a8685"
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

--000000000000e037c105ae5a8685
Content-Type: text/plain; charset="UTF-8"

Hi James,

I think Ed has mentioned the same thing in an internal discussion. I'll
give it a try.

Anyhow, as discussed with Guenter, EAGAIN still may not be a good use of
our case here, as it's not something that a busy loop should wait for. I've
also changed the driver to return ENODATA.

Thanks!

- Alex Qiu


On Wed, Sep 2, 2020 at 10:59 AM James Feist <james.feist@linux.intel.com>
wrote:

> On 8/31/2020 3:08 PM, Alex Qiu wrote:
> > Hi James,
> >
> > I just came through this doc
> > (
> https://www.boost.org/doc/libs/1_74_0/doc/html/boost_asio/overview/posix/stream_descriptor.html).
>
> > Looks like that it's a terrible idea for hwmon driver to return EAGAIN
> > for dbus-sensors. With that, I think the proper fix is also to use other
> > errno instead in our driver, and this caveat should be probably
> > documented somewhere.
> >
>
> Hi Alex,
>
> I hit something similar with peci where timeouts was causing the scan
> loop to hang. I remembered that back when we were developing ipmbbridge
> we hit something similar with i2c, and the work around was to use the
> tcp socket instead
>
> https://www.boost.org/doc/libs/1_74_0/doc/html/boost_asio/reference/ip__tcp/socket.html
> as it could correctly handle the errors. This worked for me for the
> CpuSensor and is a easy to implement change that might be worth trying
> for other sensors
> https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/36181.
>
> Thanks
>
> James
>

--000000000000e037c105ae5a8685
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi James,<div><br></div><div>I think Ed has mentioned the =
same=C2=A0thing in an internal discussion. I&#39;ll give it=C2=A0a try.</di=
v><div><br></div><div>Anyhow, as discussed with Guenter, EAGAIN still may n=
ot be a good use of our case here, as it&#39;s not something that a busy lo=
op should wait for. I&#39;ve also changed the driver to return ENODATA.</di=
v><div><br></div><div>Thanks!<br clear=3D"all"><div><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><d=
iv><br></div>- Alex Qiu</div></div></div><br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 2, 2020 at 1=
0:59 AM James Feist &lt;<a href=3D"mailto:james.feist@linux.intel.com">jame=
s.feist@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On 8/31/2020 3:08 PM, Alex Qiu wrote:<br>
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

--000000000000e037c105ae5a8685--
