Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44156485441
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 15:21:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTWrR0xH3z2yX9
	for <lists+openbmc@lfdr.de>; Thu,  6 Jan 2022 01:21:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ln416Cbu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530;
 helo=mail-ed1-x530.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ln416Cbu; dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTWr21znFz2xtQ
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jan 2022 01:21:21 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id o6so162718789edc.4
 for <openbmc@lists.ozlabs.org>; Wed, 05 Jan 2022 06:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z4sXk1y7RGLfimxinWoRMqF1L7q7RJKRrfrkWphuAGs=;
 b=ln416CbunrOgJCFYsGx4mMJFhq2bZvjgrD/43pSSe5did/Fbek1LdyqlQiy/NrnalZ
 QOrFkbEWuNKQsB/uw5gqpqDGukXUq7isHScur4lmSnUw7bSIhWEx6RoIw8QtQTu9Dlt6
 QoKL73uvp3yZk+QuLdr6DuMdDbO/uP3RuL4ZrTmzgR1YoiSGJSlLLIagnCyaFYtqhl8X
 3I05wTtVGJhs5bcN8jU/kXALBxYT5lOzMgM2Hh1nOw2y90SNNhoafJ6UfSZrpIWInsQE
 MNoxCIRmvyrm0RKqXjbqYumfdyInjMfGn0CpABvGVlkkujvYpyIDfilAwiy1EdZiMUZY
 T9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z4sXk1y7RGLfimxinWoRMqF1L7q7RJKRrfrkWphuAGs=;
 b=FMSv/SDzq/M4p/UNSts3zcuOQ/wTUionjcQ2FL6COyoJVejak4vwxMyxa77LguQu/x
 nEQgqK88xFGGwWkZx3+uzeLhAvhvH1cvIyZsh/Bbzg8AVuVLxxauFKUIag4ySB7RYA4t
 wUg/q8Jrw/DXZ9/24J7oQylWFnAqNGDUiYFDvBFMcH+b2vNOL935gt+mI6QqLEoOELjP
 J8uxwzfC1x4v6do77p0KMZUM+01xcyC0MXaBJAIi3o/tTu+eDWWQW+O5rvUXg+85Xvlw
 791ebN3WWhU2Qn7+sSD6yE4yTI3gxOD4A9eho/89FFz9Fkjr9blTAGN94X/u4k4E6Aa4
 1PuQ==
X-Gm-Message-State: AOAM530ve1rts2QHpjXxHGPuiIAOohAeM2VCqLRrlnrsk/OL85MZwwKI
 yJR54b/VtP9Tv6yRZVvtT2VyL8ivYSVr5r0JybI=
X-Google-Smtp-Source: ABdhPJwX5waQbGA550miRWbYtTvhVM3H9G7swamtT92RXx4Sgu/ebWaj2OH0Z8zppcXe8+xf3FL9x9jDbqSlD4sSbiA=
X-Received: by 2002:a17:906:517:: with SMTP id
 j23mr41315470eja.453.1641392474711; 
 Wed, 05 Jan 2022 06:21:14 -0800 (PST)
MIME-Version: 1.0
References: <CAA7TbctqbhbfV5e-QH-QcuwgfHPVLj3z6wFAXKMo6cd-=A1ZYg@mail.gmail.com>
 <CACWQX80YTyuMYozJgpLx36X_7sbwdp2O+BGCdxJQXyMPA+VjxQ@mail.gmail.com>
In-Reply-To: <CACWQX80YTyuMYozJgpLx36X_7sbwdp2O+BGCdxJQXyMPA+VjxQ@mail.gmail.com>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Wed, 5 Jan 2022 19:53:18 +0530
Message-ID: <CAA7TbcspNFo4UyfL-3iG9KWEHep4jfBhP=1U0KCegaNbvcWfmw@mail.gmail.com>
Subject: Re: New repository request for platform specific Bridge IC code
To: Ed Tanous <ed@tanous.net>
Content-Type: multipart/alternative; boundary="00000000000064693f05d4d67710"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, velumanit@hcl.com,
 patrickw3@fb.com, Amithash Prasad <amithash@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000064693f05d4d67710
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 5, 2022 at 1:20 AM Ed Tanous <ed@tanous.net> wrote:

> On Mon, Jan 3, 2022 at 11:55 PM Kumar Thangavel
> <kumarthangavel.hcl@gmail.com> wrote:
> >
> > Hi All,
> >
> >        In our system, Bridge IC will act as a bridge between host and
> BMC. All the IPMI commands from the host are routed to Bridge IC and Bridge
> IC will forward those commands to BMC.  Similarly, BMC will route IPMI
> commands to Bridge IC and it's forward to host.
> >
> > We wanted to put this platform specific Bridge IC related code and ipmb
> commands handling code. So, we need a new repository to add these codes or
> suggestions to add these codes in any other existing repository.
> >
> > Could you please provide your suggestions on this.
>
> There aren't a lot of details here, so it's kind of hard to make
> concrete suggestions given how short the above description is.



> Can you please put some more details in, background, links, ect


Please find the link below for the yosemiteV2 Design specification.
https://www.opencompute.org/documents/facebook-multi-node-server-platform-yosemite-v2-design-specification

 Our platform is a Multi-node server platform that hosts four Open Compute
Platform (OCP) compliant One Socket (1S) server cards.
 Bridge IC is connected to the BMC on each 1S server through a dedicated I2
C bus as the management interface between a 1S server and the BMC.
 Those server cards are connected to BMC via bridgeIC. All the ipmb
commands from hosts are routed via bridge IC to BMC.
 This bridge IC controls the ipmb communication. This is handling all the
OEM commands and that are platform specific.

 We need to handle the ipmb commands for firmware update of bios/cpld and
bridge IC etc
 and for some other features related to bridge IC.

 Since this is a platform specific feature, we request a new repository to
have this code.
 Going forward, We have Yosemite V3 and other platforms as well. We may use
this new repository for our other platforms.


> Some questions off the top of my head:
>
> 1. How does this differ from MCU sensor in the dbus-sensors repo,
> which also manages a "bridge" IC?


    MCU sensors are different. bridge IC does not manage the MCU sensor.
  These are oem commands. This is not linked with BMC.


> IPMBSensor also implements IPMB, how will code be reused in this new
> repository?
>

 IPMB standard commands can be in IPMBSensor. Only oem commands are
handling in this
new repository.


> 2. Who is going to be the maintainer of this repository?  Ideally it
> would be someone that has been a maintainer before, or someone that
> can mentor in how to be a maintainer.
>

 Patrick Williams can be one of the maintainers.

3. How is this code going to be configured?

4. Where is the design doc for this new feature?  How is it going to
> work, what features are going to be exposed?  What new interfaces will
> be needed?
>

We need to decide to have a new repository for this feature or any other
suggestions/opinions from the community.
Will make the design document for this feature and explain all these
information in detail


>
> >
> > Thanks,
> > Kumar.
>

--00000000000064693f05d4d67710
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 5, 2022 at 1:20 AM Ed Tan=
ous &lt;<a href=3D"mailto:ed@tanous.net" target=3D"_blank">ed@tanous.net</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Mon, Jan 3, 2022 at 11:55 PM Kumar Thangavel<br>
&lt;<a href=3D"mailto:kumarthangavel.hcl@gmail.com" target=3D"_blank">kumar=
thangavel.hcl@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi All,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 In our system, Bridge IC will act as a brid=
ge between host and BMC. All the IPMI commands from the host are routed to =
Bridge IC and Bridge IC will forward those commands to BMC.=C2=A0 Similarly=
, BMC will route IPMI commands to Bridge IC and it&#39;s forward to host.<b=
r>
&gt;<br>
&gt; We wanted to put this platform specific Bridge IC related code and ipm=
b commands handling code. So, we need a new repository to add these codes o=
r suggestions to add these codes in any other existing repository.<br>
&gt;<br>
&gt; Could you please provide your suggestions on this.<br>
<br>
There aren&#39;t a lot of details here, so it&#39;s kind of hard to make<br=
>
concrete suggestions given how short the above description is.=C2=A0 </bloc=
kquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">C=
an you please put some more details in, background, links, ect=C2=A0</block=
quote><div>=C2=A0<br><div>Please find the link below for the yosemiteV2 Des=
ign specification.</div><div><a aria-label=3D"Link https://www.opencompute.=
org/documents/facebook-multi-node-server-platform-yosemite-v2-design-specif=
ication" title=3D"https://www.opencompute.org/documents/facebook-multi-node=
-server-platform-yosemite-v2-design-specification" href=3D"https://www.open=
compute.org/documents/facebook-multi-node-server-platform-yosemite-v2-desig=
n-specification" rel=3D"noopener noreferrer" target=3D"_blank" tabindex=3D"=
-1" style=3D"box-sizing:border-box;outline-style:none;color:rgb(98,100,167)=
;text-decoration-line:none;font-family:&quot;Segoe UI&quot;,system-ui,&quot=
;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14=
px">https://www.opencompute.org/documents/facebook-multi-node-server-platfo=
rm-yosemite-v2-design-specification</a><br><br>=C2=A0Our platform is a Mult=
i-node server platform that hosts four Open
Compute Platform (OCP) compliant One Socket (1S) server cards.=C2=A0</div><=
div>=C2=A0Bridge IC is connected to the BMC on each 1S server through a ded=
icated I2 C bus as the management interface between a 1S server and the BMC=
.=C2=A0=C2=A0<br>=C2=A0Those server cards are connected to BMC via bridgeIC=
. All the ipmb commands from hosts are routed via bridge IC to BMC.<br>=C2=
=A0This bridge IC controls the ipmb communication. This is handling all the=
 OEM commands and that are platform specific.</div><div><br></div>=C2=A0We =
need to handle the ipmb commands for firmware update of bios/cpld and bridg=
e IC etc</div><div>=C2=A0and for some other features related to bridge IC.<=
br><br>=C2=A0Since this is a platform specific feature, we request a new re=
pository to have this code.</div><div>=C2=A0Going forward, We have Yosemite=
 V3 and other platforms as well. We may use this new repository for our oth=
er platforms.<br>=C2=A0 =C2=A0=C2=A0<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Some=C2=A0questions off the top of my head:<br>
<br>
1. How does this differ from MCU sensor in the dbus-sensors repo,<br>
which also manages a &quot;bridge&quot; IC?=C2=A0 </blockquote><div><br>=C2=
=A0 =C2=A0 MCU sensors are different. bridge IC does not manage the MCU sen=
sor.</div><div>=C2=A0 These are oem commands. This is not linked with BMC.<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">IPM=
BSensor also implements IPMB, how will code be reused in this new repositor=
y?<br></blockquote><div>=C2=A0=C2=A0<br>=C2=A0IPMB standard commands can be=
 in IPMBSensor. Only oem commands are handling in this</div><div>new reposi=
tory.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
2. Who is going to be the maintainer of this repository?=C2=A0 Ideally it<b=
r>
would be someone that has been a maintainer before, or someone that<br>
can mentor in how to be a maintainer.<br></blockquote><div>=C2=A0 =C2=A0 =
=C2=A0=C2=A0<br>=C2=A0Patrick Williams can be one of the=C2=A0maintainers.<=
/div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
3. How is this code going to be configured?</blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
4. Where is the design doc for this new feature?=C2=A0 How is it going to<b=
r>
work, what features are going to be exposed?=C2=A0 What new interfaces will=
<br>
be needed?<br></blockquote><div><br></div><div>We need to decide to have a =
new repository for this feature or any other suggestions/opinions from the =
community.<br>Will make the design document for this feature and explain al=
l these information in detail</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Kumar.<br>
</blockquote></div></div>

--00000000000064693f05d4d67710--
