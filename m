Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B2B358B07
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 19:12:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGSVV4m0Zz30HW
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 03:12:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=F6Fq8vw8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::536;
 helo=mail-ed1-x536.google.com; envelope-from=nanzhou@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=F6Fq8vw8; dkim-atps=neutral
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGSVF3CnCz304Y
 for <openbmc@lists.ozlabs.org>; Fri,  9 Apr 2021 03:11:47 +1000 (AEST)
Received: by mail-ed1-x536.google.com with SMTP id h10so3288246edt.13
 for <openbmc@lists.ozlabs.org>; Thu, 08 Apr 2021 10:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=len5q6ftWHFznSCVqncq2BhfbayA9/gtOL1GEOwrEWQ=;
 b=F6Fq8vw8avHv5sulDkJu+HLVzDl0b2EQnVdZaqVJ47XzmWZaOu2IGkQOUjpBw7UPgZ
 BHYM7xawyl0wiautqXILY5+q+vlofVXD5AsgaCwLj4JBg583Xl/Sic+eie8c9tokGYu1
 oytHwUAyFrXIywzBb7c9RKIo9kTdDrakFT9AJ1pkAGpxZz4WK7ipIfH6RT4JdyNW+MKc
 zrkGNX0WMD4B5hsqQVm6NfNX1KF723ip4AQLuTmkWzs0lfyzYdv9OLkbNufEnuWRNjkI
 AXuHh2r/wRXRC5VaQx19NWIankzlz9FpnBH0tB+3DM1JtMlXipSSBPAKGzUzzZTH6IAA
 pL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=len5q6ftWHFznSCVqncq2BhfbayA9/gtOL1GEOwrEWQ=;
 b=je1ZRLzwbEFbeaqU3TtaYafyShcXkXDR5GmdOJx1ea+hyHNIH4POSc6pdeSAHir4BQ
 MFV8SKU5WN+ISgpV+CFNkewySx/T714LDnwOrBM3BA3z0CQ9xgo/5T5L9T7SWzSC5+Qs
 +DVf2U4GovvdbMf1cd3vM7WXyQm/qF77Qhhv5ejaH7W0j4e+poviGRGZ1x8VBle5XEGB
 UR31TjQ2RplozU1pgxaE6gG0WkhlSz8MWqzOufgtLJ16ciCJzBD65jVGe/5iKfnQjgcA
 pu1X4iPYwrX9ypODHyGBoGuQFRnJ8Bj0oP1TDcpO/ht+CRPTcO9IL15HNkyO63VQw9qt
 Ijdw==
X-Gm-Message-State: AOAM532mOyV0okYvKeYgwHHtYX1L8fS/ec8lxZY0OJw0ot5zPa4ea508
 VGqYY2aHtqf8YblabPd2FJrD431Jq6Icg/wTdOUeQg==
X-Google-Smtp-Source: ABdhPJx17W9OQvitQ++dvul/yP5l/V92x3BhUCNDoGT3h393CJkuTSx5tlor3Mgue71nxpOQFuD79QXGNLwp2zPjm7M=
X-Received: by 2002:aa7:de8b:: with SMTP id j11mr12881199edv.363.1617901898240; 
 Thu, 08 Apr 2021 10:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <TY2PR04MB39339884DCB08EC59BC95894957E9@TY2PR04MB3933.apcprd04.prod.outlook.com>
 <TYZPR04MB4239076E95381F8E9E9E06FA84749@TYZPR04MB4239.apcprd04.prod.outlook.com>
 <CACWQX83hhkDpp3Rsb1dkbgUqHYfRRYouW7wT_7eNXkfocRuHmg@mail.gmail.com>
In-Reply-To: <CACWQX83hhkDpp3Rsb1dkbgUqHYfRRYouW7wT_7eNXkfocRuHmg@mail.gmail.com>
From: Nan Zhou <nanzhou@google.com>
Date: Thu, 8 Apr 2021 10:11:27 -0700
Message-ID: <CAOLfGj5XjRgY53eT7MNp5sA2u-umGGm-YZ=uB13cCBeuvQ=u0Q@mail.gmail.com>
Subject: Re: [phosphor-virtual-sensor] get sensor service fail
To: Ed Tanous <ed@tanous.net>
Content-Type: multipart/alternative; boundary="000000000000ed817b05bf7923e0"
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
Cc: =?UTF-8?B?QWxhbiBLdW8gKOmDreaMr+e2rSk=?= <Alan_Kuo@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "edtanous@google.com" <edtanous@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000ed817b05bf7923e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ed,

Thanks for your reply.

Alan and I were talking about what attribute we should use for "the time
that an event occurred", "Created" or "EventTimestamp". Both attributes in
the Redfish schema are optional, my understanding after reading the
description was that "Created" is when the LogEntry gets created in the
LogEntryCollection in the web server (BmcWeb); IIUC, in BmcWeb, new Log
Entries are not created until they get queried; "EventTimestamp" on the
other hand is when an event originally occurred.

The context is that we are implementing both the PULL model and PUSH model
of Redfish POST codes and Host Serial Logs, and we care about when events
occurred in both models.  In the PUSH model, the web server will send an
array of "Event", in which there is an "EventTimestamp" attribute that we
can use for each event. In the PULL model, we will query the
LogEntryCollection in LogService, and currently, there is only "Created"
but not "EventTimestamp" in BmcWeb. So we are sending this email to ask for
comments.

>
> > We think that using =E2=80=9CEventTimestamp=E2=80=9D will be more suita=
ble than
> =E2=80=9CCreated=E2=80=9D in LogServices.
> Why?  Can you give more details here on what you're trying to accomplish?

We are talking about the following three options,

1. change all the current "Created" attributes in BmcWeb LogService to
"EventTimestamp"
2. keep "Created" as is; add a new attribute "EventTimestamp"
3. keep everything as is; use "Created" to represent "the time that an
event occurred"

We are fine with either of the three options. The email is to ask the
upstream and look for opinions from people.

Thanks,
Nan

On Thu, Apr 8, 2021 at 9:36 AM Ed Tanous <ed@tanous.net> wrote:

> On Thu, Apr 8, 2021 at 7:01 AM Alan Kuo (=E9=83=AD=E6=8C=AF=E7=B6=AD) <Al=
an_Kuo@quantatw.com>
> wrote:
> >
> > Hi all,
> >
> >
> >
> > In the current implementation of bmcweb LogServices, the time of the
> "Created" property is the time when the event is generated, which does no=
t
> match the description of the redfish schema. The "Created" property means
> the date and time when the log entry was created.
>
> It should be noted, Created has been present since 1.0.0 of LogEntry,
> EventTimestamp was added in LogEntry v1.1.0.  Based on the
> descriptions, it's not clear to me what the intended difference is,
> seeing as how they're both of type Edm.DateTimeOffset.  Based on the
> description, the two would be identical on an OpenBMC system, the
> LogEntry is "Created" at the same time it occurs.
>
> >
> > We think that using =E2=80=9CEventTimestamp=E2=80=9D will be more suita=
ble than
> =E2=80=9CCreated=E2=80=9D in LogServices.
>
> Why?  Can you give more details here on what you're trying to accomplish?
>
> >
> >
> >
> > Could you give me some suggestion ? Or am I misunderstanding the
> definition of schema?
>
> This is probably a better question for the Redfish forum, unless
> there's documentation on what the intended difference between those
> two parameters are.
>
> >
> >
> >
> > Here is an example:
> >
> > {
> >
> >       "@odata.id":
> "/redfish/v1/Systems/system/LogServices/PostCodes/Entries/B5-83",
> >
> >       "@odata.type": "#LogEntry.v1_4_0.LogEntry",
> >
> >       "Created": "1970-01-01T00:01:43+00:00",    <=3D  It should be
> EventTimestamp
> >
> >       "EntryType": "Event",
> >
> >       "Id": "B5-83",
> >
> >       "Message": "Boot Count: 1: TS Offset: 65.4769; POST Code: 0x01",
> >
> >       "MessageArgs": [
> >
> >         "1",
> >
> >         "65.4769",
> >
> >         "0x01"
> >
> >       ],
> >
> >       "MessageId": "OpenBMC.0.1.BIOSPOSTCode",
> >
> >       "Name": "POST Code Log Entry",
> >
> >       "Severity": "OK"
> >
> > }
> >
> >
> >
> > Thanks,
> >
> > Alan
> >
> >
> >
> > From: openbmc <openbmc-bounces+alan_kuo=3Dquantatw.com@lists.ozlabs.org=
>
> On Behalf Of Harvey Wu (=E5=90=B3=E5=B4=87=E7=B6=AD)
> > Sent: Monday, March 29, 2021 5:14 PM
> > To: openbmc@lists.ozlabs.org
> > Cc: Duke Du (=E6=9D=9C=E7=A5=A5=E5=98=89) <Duke.Du@quantatw.com>; Fran =
Hsu (=E5=BE=90=E8=AA=8C=E8=AC=99) <
> Fran.Hsu@quantatw.com>; George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC) <George=
.Hung@quantatw.com>
> > Subject: [phosphor-virtual-sensor] get sensor service fail
> >
> >
> >
> > Hi All,
> >
> >
> >
> >         In current phosphor-virtual-sensor, the function getService wil=
l
> return empty string only when catch error name =3D
> =E2=80=9Cxyz.openbmc_project.Common.Error.ResourceNotFound=E2=80=9D (
> https://github.com/openbmc/phosphor-virtual-sensor/blob/master/dbusUtils.=
hpp#L37
> ).
> >
> >         But in my system, when bus call didn=E2=80=99t get sensor servi=
ce, the
> exception name will be =E2=80=9Corg.freedesktop.DBus.Error.FileNotFound=
=E2=80=9D, and then
> service will be get failed.
> >
> >         It seems need to modified the origin condition or add another
> elseif condition. Do I misunderstand something?
> >
> >
> >
> >
> >
> > Thanks.
> >
> >
> >
> > Harvey Wu
> >
> > Email: Harvey.Wu@quantatw.com
> >
> > Ext: 17408
> >
> >
>

--000000000000ed817b05bf7923e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ed,=C2=A0<div><br></div><div>Thanks for your reply.=C2=
=A0</div><div><br></div><div>Alan and I were talking about what attribute w=
e should use for &quot;the time that an event occurred&quot;, &quot;Created=
&quot; or &quot;EventTimestamp&quot;. Both attributes in the Redfish schema=
 are optional, my understanding after reading the description=C2=A0was that=
 &quot;Created&quot; is when the LogEntry gets created in the LogEntryColle=
ction in the web server (BmcWeb); IIUC, in BmcWeb, new Log Entries=C2=A0are=
 not created until they get queried; &quot;EventTimestamp&quot; on the othe=
r hand is when an event originally occurred.=C2=A0</div><div><br></div><div=
>The context is that we are implementing both the PULL model and PUSH model=
 of Redfish POST codes and Host Serial Logs, and we care about when events =
occurred in both models.=C2=A0 In the PUSH model, the web server will send =
an array of &quot;Event&quot;, in which there is an &quot;EventTimestamp&qu=
ot; attribute that we can use for each event. In the PULL model, we will qu=
ery the LogEntryCollection in LogService, and currently, there is only &quo=
t;Created&quot; but not &quot;EventTimestamp&quot; in BmcWeb. So we are sen=
ding this email to ask for comments.=C2=A0=C2=A0<br></div><div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-im" st=
yle=3D"color:rgb(80,0,80)">&gt;<br></span><span class=3D"gmail-im" style=3D=
"color:rgb(80,0,80)">&gt; We think that using =E2=80=9CEventTimestamp=E2=80=
=9D will be more suitable than =E2=80=9CCreated=E2=80=9D in LogServices.</s=
pan><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)"><br></span>Why?=
=C2=A0 Can you give more details here on what you&#39;re trying to accompli=
sh?</blockquote><div>We are talking about the following three options,</div=
><div><br></div><div>1. change all the current &quot;Created&quot; attribut=
es in BmcWeb LogService to &quot;EventTimestamp&quot;=C2=A0</div><div>2. ke=
ep &quot;Created&quot; as is; add a new attribute=C2=A0&quot;EventTimestamp=
&quot;</div><div>3. keep everything as is; use &quot;Created&quot;=C2=A0to =
represent=C2=A0&quot;the time that an event occurred&quot;</div><div><br></=
div><div>We are fine with either of the three options. The email is to ask =
the upstream and look for opinions from people.=C2=A0=C2=A0</div><div><br><=
/div><div>Thanks,</div><div>Nan</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 8, 2021 at 9:36 AM Ed Tano=
us &lt;<a href=3D"mailto:ed@tanous.net">ed@tanous.net</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Apr 8, 2021 at=
 7:01 AM Alan Kuo (=E9=83=AD=E6=8C=AF=E7=B6=AD) &lt;<a href=3D"mailto:Alan_=
Kuo@quantatw.com" target=3D"_blank">Alan_Kuo@quantatw.com</a>&gt; wrote:<br=
>
&gt;<br>
&gt; Hi all,<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; In the current implementation of bmcweb LogServices, the time of the &=
quot;Created&quot; property is the time when the event is generated, which =
does not match the description of the redfish schema. The &quot;Created&quo=
t; property means the date and time when the log entry was created.<br>
<br>
It should be noted, Created has been present since 1.0.0 of LogEntry,<br>
EventTimestamp was added in LogEntry v1.1.0.=C2=A0 Based on the<br>
descriptions, it&#39;s not clear to me what the intended difference is,<br>
seeing as how they&#39;re both of type Edm.DateTimeOffset.=C2=A0 Based on t=
he<br>
description, the two would be identical on an OpenBMC system, the<br>
LogEntry is &quot;Created&quot; at the same time it occurs.<br>
<br>
&gt;<br>
&gt; We think that using =E2=80=9CEventTimestamp=E2=80=9D will be more suit=
able than =E2=80=9CCreated=E2=80=9D in LogServices.<br>
<br>
Why?=C2=A0 Can you give more details here on what you&#39;re trying to acco=
mplish?<br>
<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Could you give me some suggestion ? Or am I misunderstanding the defin=
ition of schema?<br>
<br>
This is probably a better question for the Redfish forum, unless<br>
there&#39;s documentation on what the intended difference between those<br>
two parameters are.<br>
<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Here is an example:<br>
&gt;<br>
&gt; {<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;@<a href=3D"http://odata.id" rel=3D"no=
referrer" target=3D"_blank">odata.id</a>&quot;: &quot;/redfish/v1/Systems/s=
ystem/LogServices/PostCodes/Entries/B5-83&quot;,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;@odata.type&quot;: &quot;#LogEntry.v1_=
4_0.LogEntry&quot;,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Created&quot;: &quot;1970-01-01T00:01:=
43+00:00&quot;,=C2=A0 =C2=A0 &lt;=3D=C2=A0 It should be EventTimestamp<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;EntryType&quot;: &quot;Event&quot;,<br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Id&quot;: &quot;B5-83&quot;,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Message&quot;: &quot;Boot Count: 1: TS=
 Offset: 65.4769; POST Code: 0x01&quot;,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;MessageArgs&quot;: [<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;1&quot;,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;65.4769&quot;,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;0x01&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;MessageId&quot;: &quot;OpenBMC.0.1.BIO=
SPOSTCode&quot;,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Name&quot;: &quot;POST Code Log Entry&=
quot;,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Severity&quot;: &quot;OK&quot;<br>
&gt;<br>
&gt; }<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt; Alan<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; From: openbmc &lt;openbmc-bounces+alan_kuo=3D<a href=3D"mailto:quantat=
w.com@lists.ozlabs.org" target=3D"_blank">quantatw.com@lists.ozlabs.org</a>=
&gt; On Behalf Of Harvey Wu (=E5=90=B3=E5=B4=87=E7=B6=AD)<br>
&gt; Sent: Monday, March 29, 2021 5:14 PM<br>
&gt; To: <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">open=
bmc@lists.ozlabs.org</a><br>
&gt; Cc: Duke Du (=E6=9D=9C=E7=A5=A5=E5=98=89) &lt;<a href=3D"mailto:Duke.D=
u@quantatw.com" target=3D"_blank">Duke.Du@quantatw.com</a>&gt;; Fran Hsu (=
=E5=BE=90=E8=AA=8C=E8=AC=99) &lt;<a href=3D"mailto:Fran.Hsu@quantatw.com" t=
arget=3D"_blank">Fran.Hsu@quantatw.com</a>&gt;; George Hung (=E6=B4=AA=E5=
=BF=A0=E6=95=AC) &lt;<a href=3D"mailto:George.Hung@quantatw.com" target=3D"=
_blank">George.Hung@quantatw.com</a>&gt;<br>
&gt; Subject: [phosphor-virtual-sensor] get sensor service fail<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Hi All,<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0In current phosphor-virtual-sensor, t=
he function getService will return empty string only when catch error name =
=3D =E2=80=9Cxyz.openbmc_project.Common.Error.ResourceNotFound=E2=80=9D (<a=
 href=3D"https://github.com/openbmc/phosphor-virtual-sensor/blob/master/dbu=
sUtils.hpp#L37" rel=3D"noreferrer" target=3D"_blank">https://github.com/ope=
nbmc/phosphor-virtual-sensor/blob/master/dbusUtils.hpp#L37</a>).<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0But in my system, when bus call didn=
=E2=80=99t get sensor service, the exception name will be =E2=80=9Corg.free=
desktop.DBus.Error.FileNotFound=E2=80=9D, and then service will be get fail=
ed.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0It seems need to modified the origin =
condition or add another elseif condition. Do I misunderstand something?<br=
>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Thanks.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Harvey Wu<br>
&gt;<br>
&gt; Email: <a href=3D"mailto:Harvey.Wu@quantatw.com" target=3D"_blank">Har=
vey.Wu@quantatw.com</a><br>
&gt;<br>
&gt; Ext: 17408<br>
&gt;<br>
&gt;<br>
</blockquote></div>

--000000000000ed817b05bf7923e0--
