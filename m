Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C39181E44
	for <lists+openbmc@lfdr.de>; Wed, 11 Mar 2020 17:51:53 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cyfY6pBQzDqRX
	for <lists+openbmc@lfdr.de>; Thu, 12 Mar 2020 03:51:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=209.85.208.170;
 helo=mail-lj1-f170.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cydv0kgrzDqNR
 for <openbmc@lists.ozlabs.org>; Thu, 12 Mar 2020 03:51:14 +1100 (AEDT)
Received: by mail-lj1-f170.google.com with SMTP id w1so3143533ljh.5
 for <openbmc@lists.ozlabs.org>; Wed, 11 Mar 2020 09:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f6WZoxhuTYU3X2PdKD+wLp8zipSn6vaMzIOszFAj5ns=;
 b=MlRVSEwhAIsAMHOTAmutdPFgotnSKd4ksSx7lxOnIFw4r8OAzxszTvnPkAjo38STYn
 c7dMB6nCtNDVLhCCyXQQmmZB3V1OgqJ1aqnzsCwl/ZLI3h9945MtyWT39YbRJtdC2etj
 kD9n6sMcjlGhAja9aUVOM1Fw1Kc6J4n33EO+V4yNQMfQQErz2Ff2WCNgb1eG5sURKY7J
 DNDbF5UcPdgUoEre62YJw28DoD/C+lkBPo67zQfBS1Wg2LCpGApBVe55tqvpig39U36w
 xdVzVvQt9+nQkz6uC8A73rn2XtZmStpqpNoRSWEMC1UFWpMVd/zpnuSA71m/59qbh+mo
 9G4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f6WZoxhuTYU3X2PdKD+wLp8zipSn6vaMzIOszFAj5ns=;
 b=T1cdcmsLnHbiBjV/+IpNGvSymIhnHY6juC3tIeeCUzdgWG/2wU6o/kEHUkmAbfemTV
 8NP2EpOTJzMc5xWEbw93Q4YHUlrr0ZIcpJbXCTuYK6ZgnsEYfbQsE1Eg4i2MRthV4wbJ
 R/xWXTCSGW7eqxkwQmX2W09lCulEJoEf1h1YSbqWrmQ0Ytsbe2hbEruhyTwzSqpo65ht
 JfjwIMuTUwMxbIaHOlcjO1bqojc2DasBMNjUHzE2cGMFHYmAjYrGzQh04Urr/ISHOrTy
 ydAspEoWmCS2VYk7pIFcJB5tshQ33xnwaxJ6ExS/adP2wtsdUeDl5jBazYDF6W6HoIor
 rF4A==
X-Gm-Message-State: ANhLgQ1YyfQp6SRxNMzIKuaIZh/bsbou7CX2fUyGYO3hpTHVi8+Glpol
 vOTjyCF2OhFtUcn+b+zWT+P0bTNroXeg8gK4sQO9Dw==
X-Google-Smtp-Source: ADFU+vu3jD8VgNLbctbDnPMP92uRDXGFK6Non/Ze/zsEbcKcossqWxt2KHTQt1xpS25eDNo5eNVjQTXgYrGfaeYrn2Y=
X-Received: by 2002:a2e:b554:: with SMTP id a20mr2692020ljn.34.1583945468223; 
 Wed, 11 Mar 2020 09:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAH1kD+a-3tb-=Xi17w=qrW3xLTJCk9JHF1b+PA=hvkekjSWt-w@mail.gmail.com>
 <DED4A00E-CF36-4CB4-97B1-CD9BB96BF3C4@fuzziesquirrel.com>
In-Reply-To: <DED4A00E-CF36-4CB4-97B1-CD9BB96BF3C4@fuzziesquirrel.com>
From: Richard Hanley <rhanley@google.com>
Date: Wed, 11 Mar 2020 09:50:57 -0700
Message-ID: <CAH1kD+ZKjw7PKqhzYaytJvcJKOAc0QDSXi61=kvUFpp4ANGpkA@mail.gmail.com>
Subject: Re: Adding a detailed physical model to bmcweb
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary="000000000000fa5ece05a0970a74"
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

--000000000000fa5ece05a0970a74
Content-Type: text/plain; charset="UTF-8"

>Right, so where we have shared interest I think is how this service works
>and exports its information to _any_ BMC service (not just bmcweb -
>exporting the mapping information via external interfaces is less of a
>priority over here).  Can you say any more about this service?

I'm not sure at the moment.  Google has some software that runs on the host
machine to build a physical model.  I'll check in with the developers to
see if what they are doing is applicable to a BMC.  I'll follow up once I
get a better idea on how this service could be constructed.

Thanks,
Richard

On Wed, Mar 11, 2020 at 8:45 AM Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

> at 5:22 PM, Richard Hanley <rhanley@google.com> wrote:
>
> > One of the requirements we have for our data center management software
> > is that we need to be able to map resources (e.g. actions, telemetry,
> and
> > assemblies) directly to the physical component that it originated from
> as
> > well as how those components are physically connected.
> >
> > Historically this mapping was done through a custom protocol on the
> host,
> > and we would like to move this to a Redfish service on the BMC.
>
> Hi Richard.  We (IBM) also have a need for the same detailed mapping
> information but from other services on the BMC.
>
> > Let's just say for the moment that we get a service that collects this
> > information
>
>
> Right, so where we have shared interest I think is how this service works
> and exports its information to _any_ BMC service (not just bmcweb -
> exporting the mapping information via external interfaces is less of a
> priority over here).  Can you say any more about this service?
>
> thanks!
>
> -brad
>

--000000000000fa5ece05a0970a74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;Right, so where we have shared interest I think is how=
 this service works=C2=A0<br>&gt;and exports its information to _any_ BMC s=
ervice (not just bmcweb -=C2=A0<br>&gt;exporting the mapping information vi=
a external interfaces is less of a=C2=A0<br>&gt;priority over here).=C2=A0 =
Can you say any more about this service?<br><div><br></div><div>I&#39;m not=
 sure at the moment.=C2=A0 Google has some software that runs on the host m=
achine to build a physical model.=C2=A0 I&#39;ll check in with the develope=
rs to see if what they are doing is applicable to a BMC.=C2=A0 I&#39;ll fol=
low up once I get a better idea on how this service could be constructed.</=
div><div><br></div><div>Thanks,</div><div>Richard</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 11, 2020=
 at 8:45 AM Brad Bishop &lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com">=
bradleyb@fuzziesquirrel.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">at 5:22 PM, Richard Hanley &lt;<a href=3D"mailto=
:rhanley@google.com" target=3D"_blank">rhanley@google.com</a>&gt; wrote:<br=
>
<br>
&gt; One of the requirements we have for our data center management softwar=
e=C2=A0 <br>
&gt; is that we need to be able to map resources (e.g. actions, telemetry, =
and=C2=A0 <br>
&gt; assemblies) directly to the physical component that it originated from=
 as=C2=A0 <br>
&gt; well as how those components are physically connected.<br>
&gt;<br>
&gt; Historically this mapping was done through a custom protocol on the ho=
st,=C2=A0 <br>
&gt; and we would like to move this to a Redfish service on the BMC.<br>
<br>
Hi Richard.=C2=A0 We (IBM) also have a need for the same detailed mapping=
=C2=A0 <br>
information but from other services on the BMC.<br>
<br>
&gt; Let&#39;s just say for the moment that we get a service that collects =
this=C2=A0 <br>
&gt; information<br>
<br>
<br>
Right, so where we have shared interest I think is how this service works=
=C2=A0 <br>
and exports its information to _any_ BMC service (not just bmcweb -=C2=A0 <=
br>
exporting the mapping information via external interfaces is less of a=C2=
=A0 <br>
priority over here).=C2=A0 Can you say any more about this service?<br>
<br>
thanks!<br>
<br>
-brad<br>
</blockquote></div>

--000000000000fa5ece05a0970a74--
