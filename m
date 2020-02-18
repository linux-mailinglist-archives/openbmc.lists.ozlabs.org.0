Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B98170E3D
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 03:11:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Sbkr3BDlzDqjx
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 13:11:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a;
 helo=mail-lf1-x12a.google.com; envelope-from=dipukuet@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=n5aQ0r1w; dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MRZt0Tp3zDqY3
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 03:46:40 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id r14so15014425lfm.5
 for <openbmc@lists.ozlabs.org>; Tue, 18 Feb 2020 08:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=22cdfCcOxfZkvLvepyw1suGGI6/+Yep1lprJoO+Hl88=;
 b=n5aQ0r1wJozrPy9Tyv0xryPQNZdiqajZTI2dWNNW2RcWgfIEvVRuHI8tjzUtVcL572
 N9Y2K6JC1YvRist0KKpnB54ivXS1RLOOEKO03Q47iRXfgglP0y/9e3AjD7qjkLNNA+mg
 5B4MyD/M5KvOnK2w+uVcnpPDp7BDV9/Rgea5X+Dxkrkb97Ui9izNNznKPVEvHIMBDoOo
 h89gVJRwacAqXu9YBUnXrR/Nqf/P2xt2yQS9I6byL0ZuQ3KJ2jtkHPCwqTmuBvLujuI6
 LopTtX3vfaryTnnxCsaKIzuvTMYOgmy7xzV1A4pRsqmfy5ot1SKhyhHP6FSA2lG5UbN2
 O4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=22cdfCcOxfZkvLvepyw1suGGI6/+Yep1lprJoO+Hl88=;
 b=gGGsMiIDJXn6i6WGxwFOsa7ekjC8of0pP7kVn0Hz9FP0Xor2v1rXV0Gl8elOqOBNCQ
 N8azwPImWKG4iFtavHGHCDkMAE0u2iok7XMvm+40BRDgj+SbGKDFhSRBW0NChFyT4vYe
 HUzvGWwLnY5V7g27X0je0r+CwcAcXjGck6pnsGfQXLpgkeWRDlgdSs/Uv535/NWI9I2c
 PX+c2co1YpdVl/mBKeIs2OwEjRbiFTABSkOJgHXV445UFQskDiQ7ssQtcsbf3msi30dM
 0pCp6DJ8hBRGOVPgAmfitO0Ve1ejboeDXeXQwO7l1S4UAfKTSSSS20ffdu5SX6J1y2lh
 bTtw==
X-Gm-Message-State: APjAAAVDSC2gS5AQUdNg7azG0DKqk9OSUI0CEES1ul47BcRe/W44ZNGJ
 zAQX5jLEIfsp963oCzzY9oi/YrJjKx4Ryydbhfs=
X-Google-Smtp-Source: APXvYqwJiz34WNC0r47THt9EPgRcJzZmPoFa4cQSGx0L2OdPTgvjoDVp+rOkcTp6nfu4AGr7IacYB/aUEIjKmSNkY6Q=
X-Received: by 2002:a19:94d:: with SMTP id 74mr10780002lfj.144.1582044393810; 
 Tue, 18 Feb 2020 08:46:33 -0800 (PST)
MIME-Version: 1.0
References: <68732B2D-EB7D-418A-86D9-3095223A31FB@linux.vnet.ibm.com>
 <5B7FD9A0-8A4A-4BCC-9BC5-77B5DEBCDD00@fuzziesquirrel.com>
In-Reply-To: <5B7FD9A0-8A4A-4BCC-9BC5-77B5DEBCDD00@fuzziesquirrel.com>
From: Ryan Arnell <ryan1arnell@gmail.com>
Date: Tue, 18 Feb 2020 10:46:22 -0600
Message-ID: <CAJF4KMyJkSaKF=wOgSPLk_zig_vfXWKxhS2oLKBWbV6GN+U8ZA@mail.gmail.com>
Subject: Re: Request for Feedback :: Time Mode setting in timemanager
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary="0000000000001caec6059edc6aea"
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:08:42 +1100
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, dadubets@us.ibm.com,
 ggoldman@us.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000001caec6059edc6aea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Brad and Vishwa for moving into the direction where we might not
require a reboot or host power off from moving to Manual to NTP or vise
versa.
We had a lot of user feedback who see this as a very inefficient task.
Goldman and David cc'ed here can also has a lot of customers who needs to
sync time often and they would not like to power off host every time that
happens.

Thanks again
Ryan

On Tue, Feb 18, 2020 at 8:43 AM Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

>
>
> > On Feb 18, 2020, at 7:56 AM, Vishwanatha Subbanna <
> vishwa@linux.vnet.ibm.com> wrote:
> >
> > Hello,
> >
> > Sending this email requesting feedback on one of the feature that we
> currently have in phosphor-timemanager.
> >
> > Time manager uses TimeMode setting and can have either [NTP] or [Manual=
]
> as the valid options and are provided via xyz/openbmc_projects/settings/
> for external users.
> >
> > When the system power is off and BMC is in ready state, any changes to
> these settings are readily consumed by time manager daemon.
> >
> > However, if the user changes the setting when the Host is booting,
> timemanager puts them in deferred state. Meaning, timemanager does not ta=
ke
> the settings into effect until the Host is powered off.
>
> Can you elaborate on why it does this?
>
> >
> > So, if someone wants to move from [Manual] to [NTP] or vice-versa, when
> the Host is [On], they need to [power-off] the Host and power it back on.
>
> This seems less than ideal?  Would you agree?
>
> >
> > This design was chosen because we wanted to give priority to Host.
>
> What does it mean to give priority to the Host?  Are you trying to hide
> time changes in the time from the host?  Why?
>
> > Some of us are asking me if we can make a change to take the setting
> changes in effect immediately, not caring the state of the Host.
>
> Without additional background this is what seems intuitive to me.
>
> >
> > Please could you help with your thoughts on this ?.. What is the
> Industry norm on this ?
>
> FWIW on our (IBM) system designs we usually hook an RTC up to the BMC, an=
d
> any host software needing a RTC has to get it via some in-band software
> interface.  I think I heard somewhere though that often in other systems
> designs the RTC is connected to the host processors and the BMC doesn=E2=
=80=99t
> have access to it.

--0000000000001caec6059edc6aea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Thanks Brad and=C2=A0<span style=3D"font-family:Arial,H=
elvetica,sans-serif">Vishwa for moving into the direction where we might no=
t require a reboot or host power off from moving to Manual to NTP or vise v=
ersa.=C2=A0</span></div><div class=3D"gmail_default" style=3D"">We had a lo=
t of user feedback who see this as a very inefficient task.=C2=A0</div><div=
 class=3D"gmail_default" style=3D"">Goldman and David cc&#39;ed here can al=
so has a lot of customers=C2=A0who needs to sync time often and they=C2=A0w=
ould not like to power off host every time that happens.=C2=A0</div><div cl=
ass=3D"gmail_default" style=3D""><br></div><div class=3D"gmail_default" sty=
le=3D"">Thanks again</div><div class=3D"gmail_default" style=3D"">Ryan=C2=
=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Tue, Feb 18, 2020 at 8:43 AM Brad Bishop &lt;<a href=3D"mailto:=
bradleyb@fuzziesquirrel.com">bradleyb@fuzziesquirrel.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
&gt; On Feb 18, 2020, at 7:56 AM, Vishwanatha Subbanna &lt;<a href=3D"mailt=
o:vishwa@linux.vnet.ibm.com" target=3D"_blank">vishwa@linux.vnet.ibm.com</a=
>&gt; wrote:<br>
&gt; <br>
&gt; Hello,<br>
&gt; <br>
&gt; Sending this email requesting feedback on one of the feature that we c=
urrently have in phosphor-timemanager.<br>
&gt; <br>
&gt; Time manager uses TimeMode setting and can have either [NTP] or [Manua=
l] as the valid options and are provided via xyz/openbmc_projects/settings/=
 for external users.<br>
&gt; <br>
&gt; When the system power is off and BMC is in ready state, any changes to=
 these settings are readily consumed by time manager daemon.<br>
&gt; <br>
&gt; However, if the user changes the setting when the Host is booting, tim=
emanager puts them in deferred state. Meaning, timemanager does not take th=
e settings into effect until the Host is powered off.<br>
<br>
Can you elaborate on why it does this?<br>
<br>
&gt; <br>
&gt; So, if someone wants to move from [Manual] to [NTP] or vice-versa, whe=
n the Host is [On], they need to [power-off] the Host and power it back on.=
<br>
<br>
This seems less than ideal?=C2=A0 Would you agree?<br>
<br>
&gt; <br>
&gt; This design was chosen because we wanted to give priority to Host.<br>
<br>
What does it mean to give priority to the Host?=C2=A0 Are you trying to hid=
e time changes in the time from the host?=C2=A0 Why?<br>
<br>
&gt; Some of us are asking me if we can make a change to take the setting c=
hanges in effect immediately, not caring the state of the Host.<br>
<br>
Without additional background this is what seems intuitive to me.<br>
<br>
&gt; <br>
&gt; Please could you help with your thoughts on this ?.. What is the Indus=
try norm on this ?<br>
<br>
FWIW on our (IBM) system designs we usually hook an RTC up to the BMC, and =
any host software needing a RTC has to get it via some in-band software int=
erface.=C2=A0 I think I heard somewhere though that often in other systems =
designs the RTC is connected to the host processors and the BMC doesn=E2=80=
=99t have access to it.</blockquote></div>

--0000000000001caec6059edc6aea--
