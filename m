Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C8B1C9B59
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 21:46:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49J3r26Fq2zDqnc
	for <lists+openbmc@lfdr.de>; Fri,  8 May 2020 05:46:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b31;
 helo=mail-yb1-xb31.google.com; envelope-from=yuenn@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=R3B5r7tk; dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49J3pF39HDzDqn1
 for <openbmc@lists.ozlabs.org>; Fri,  8 May 2020 05:45:07 +1000 (AEST)
Received: by mail-yb1-xb31.google.com with SMTP id a8so3555363ybs.3
 for <openbmc@lists.ozlabs.org>; Thu, 07 May 2020 12:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DOayYlz8CtO1fjHNKP9Vx9YZ5t10Xb+cv6vLduD8/Is=;
 b=R3B5r7tkhPnyVWqsPNLkRuND3Ulo+7hnWYiFhr2P/5zOrhUlVe6cShKW3mT1D2WUzj
 ZOw5KHOAN3rJlK290YJg1WsUIH+YDolWDrTDPyK0gjKrcDL/c58PZ/i5/Xb9Hpo6eV8K
 Yhrcr307xLptvPOTuMN+Cc9D7L2LW3465MNdHDl0BmTS77z6fdC54m+T6B9irV4fDf5f
 89e1lV85qAxi59TnP/BUNQCKh5Fkiy+u983RhVsjKzEQNyLQmFjT5i2z8KeKxcxC8rGf
 mxXtIBtctbZsVJKvSBucy6kd/WaITdEm8BG661vgt0qCh2GwqP0PW9GaoW7jQcgmJ+jT
 9/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DOayYlz8CtO1fjHNKP9Vx9YZ5t10Xb+cv6vLduD8/Is=;
 b=A1IyYJdxpys0PXVS7zppr3FuK41SfIH4g8ID6dZK3TQn0H4QL7k5t7YT3j/IGiR2K2
 4ZAmAlmIbWGYEJXzRkifK6KkvLqNGgfyELV9U83Tzb6vLgRV6CKF1HP2M9DbUnzJB/uo
 BSOthcDj99ID7m5fviaqLaXpa2BY2//EoaVaWMCV8YZDw5EyCEtzjatwBsxs3n+Tgqrd
 Y9t3KJubi2SmERGp8UvMBaooYkdk4fsnJOIvNxyDvEblA08D3S9kJ9v4LunA5UKgdiIk
 WyIRvUIiv3pJRmuu7Q2MWmtqHjshlX1UPmBWqaip3Sxdlo2KKdz+/Um1XibX82lkCagk
 Si0A==
X-Gm-Message-State: AGi0PubhRp93FykfHcAjA8M52Y3fp010146gaOx5JEGhzwjOoc9T9bDP
 C9aUOmq5dzLvTM2XY8zdf/8hwUeYiYqszP/I1PEXM9QtOskoPw==
X-Google-Smtp-Source: APiQypKagJo+x8ADRCxf1biy4SrcwTe9+K3sO+CgccvyMlT/YLvM+xiGOAiQL3BTTY7ZXK9vLP76RzWnHgNKGohEHqw=
X-Received: by 2002:a25:af86:: with SMTP id g6mr446711ybh.85.1588880702758;
 Thu, 07 May 2020 12:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <CADfYTpG8Jp6rkQXnAeRjyAf41jzrJa0sPHmc7K0gbR7=EigQNw@mail.gmail.com>
 <f197f55c-f7f2-c405-f3c8-bfbd5cd5e3bd@linux.vnet.ibm.com>
 <789e1bda-63d4-479e-bfa3-12bf1603ebbc@www.fastmail.com>
In-Reply-To: <789e1bda-63d4-479e-bfa3-12bf1603ebbc@www.fastmail.com>
From: Nancy Yuen <yuenn@google.com>
Date: Thu, 7 May 2020 12:44:25 -0700
Message-ID: <CADfYTpGNRJ3Yk6h7K4iw27jn4c4VqNKnHw0PLMHyG5h+O7cQ6Q@mail.gmail.com>
Subject: Re: Multiple BMCs in a system: IPMB? Redfish? MCTP?
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: multipart/alternative; boundary="000000000000e1a48e05a5141d5e"
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

--000000000000e1a48e05a5141d5e
Content-Type: text/plain; charset="UTF-8"

On Mon, May 4, 2020 at 3:31 AM Andrew Jeffery <andrew@aj.id.au> wrote:

>
>
> On Thu, 30 Apr 2020, at 17:08, Deepak Kodihalli wrote:
> > On 30/04/20 4:21 am, Nancy Yuen wrote:
> > > I've talked with some people a while back (long while back) about
> > > multiple BMCs in a system.  Either for redundancy or managing separate
> > > parts of a system.   I'm wondering what other people are thinking in
> > > this area if at all.
> > >
> > > We are considering similar designs and I'm looking into options for
> > > BMC-BMC communications.  Some BMCs may not be externally
> > > accessible. Here are some options that we've looked at:
> > >
> > >  1. i2c/IPMB
> > >  2. usbnet/Redfish
> > >  3. i2c/MCTP/PLDM or something else?
> > >  4. internal network via switch chip/Redfish or MCTP
> > >
> > >   I'd like to reduce our use of IPMI so I want to avoid (1).
> > >
> > > ----------
> > > Nancy
> >
> > Hi Nancy,
> >
> > I think it depends on whether the BMCs need to talk to each other for
> > platform management, or if they manage their own hosts and we need one
> > of the BMCs to broadcast out of band requests and aggregate responses.
> >
> > For the former I think PLDM over MCTP could be a good fit. This is more
> > of an "inband" use-case in my opinion so I'm not sure if Redfish is well
> > suited. For the latter, a Redfish based aggregation is a good option.
>
> I think this looks like the right approach. Certainly some thought would be
> required in designing the MCTP networks given the (intentionally) limited
> number of endpoint IDs.
>
> Andrew
>

Hi Andrew, Deepak,

Sorry for the delayed response!

For the purposes of this discussion I have BMCs managing their own host:
BMC3<--->BMC2<--->BMC1/controller<--> external.  I wrote BMC1 but there
maybe some other controller there that isn't strictly a BMC.  BMC2 would be
"passing through" information between BMC1 and BMC3.  But I don't
necessarily want BMC2 to do any form of aggregation from information from
BMC3.  For BMC1/Controller and BMC 2 we are thinking Redfish.

In my case I'm interested in what ways people are thinking BMC2 and BMC3
should be connected and speaking to each other. Is MCTP/PLDM where everyone
is leaning?

--000000000000e1a48e05a5141d5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, May 4, 2020 at 3:31 AM Andrew Jef=
fery &lt;<a href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On Thu, 30 Apr 2020, at 17:08, Deepak Kodihalli wrote:<br>
&gt; On 30/04/20 4:21 am, Nancy Yuen wrote:<br>
&gt; &gt; I&#39;ve talked with some people a while back (long while back) a=
bout <br>
&gt; &gt; multiple BMCs in a system.=C2=A0 Either for redundancy or managin=
g separate <br>
&gt; &gt; parts of a system.=C2=A0=C2=A0 I&#39;m wondering what other peopl=
e are thinking in <br>
&gt; &gt; this area if at all.<br>
&gt; &gt; <br>
&gt; &gt; We are considering similar designs and I&#39;m looking into optio=
ns for <br>
&gt; &gt; BMC-BMC communications.=C2=A0 Some BMCs may not be externally <br=
>
&gt; &gt; accessible.=C2=A0Here are some options that we&#39;ve looked at:<=
br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 1. i2c/IPMB<br>
&gt; &gt;=C2=A0 2. usbnet/Redfish<br>
&gt; &gt;=C2=A0 3. i2c/MCTP/PLDM or something else?<br>
&gt; &gt;=C2=A0 4. internal network via switch chip/Redfish or MCTP<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0I&#39;d like to reduce our use of IPMI so I want to a=
void (1).<br>
&gt; &gt; <br>
&gt; &gt; ----------<br>
&gt; &gt; Nancy<br>
&gt; <br>
&gt; Hi Nancy,<br>
&gt; <br>
&gt; I think it depends on whether the BMCs need to talk to each other for =
<br>
&gt; platform management, or if they manage their own hosts and we need one=
 <br>
&gt; of the BMCs to broadcast out of band requests and aggregate responses.=
<br>
&gt; <br>
&gt; For the former I think PLDM over MCTP could be a good fit. This is mor=
e <br>
&gt; of an &quot;inband&quot; use-case in my opinion so I&#39;m not sure if=
 Redfish is well <br>
&gt; suited. For the latter, a Redfish based aggregation is a good option.<=
br>
<br>
I think this looks like the right approach. Certainly some thought would be=
<br>
required in designing the MCTP networks given the (intentionally) limited<b=
r>
number of endpoint IDs.<br>
<br>
Andrew<br></blockquote><div><br></div><div>Hi Andrew, Deepak,</div><div><br=
></div><div>Sorry for the delayed response!</div><div><br></div><div>For th=
e purposes of this discussion I have BMCs managing their own host: BMC3&lt;=
---&gt;BMC2&lt;---&gt;BMC1/controller&lt;--&gt; external.=C2=A0 I wrote BMC=
1 but there maybe some other controller there that isn&#39;t strictly a BMC=
.=C2=A0 BMC2 would be &quot;passing through&quot; information between BMC1 =
and BMC3.=C2=A0 But I don&#39;t necessarily want BMC2 to do any form of agg=
regation from information from BMC3.=C2=A0 For BMC1/Controller and BMC 2 we=
 are thinking Redfish.=C2=A0=C2=A0</div><div><br></div><div>In my case I&#3=
9;m interested in what ways people are thinking BMC2 and BMC3 should be con=
nected and speaking to each other. Is MCTP/PLDM where everyone is leaning?<=
/div><div><br></div><div><br></div><div><br></div></div></div>

--000000000000e1a48e05a5141d5e--
