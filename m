Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ABD140031
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 00:48:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zLW75d0CzDr4M
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 10:48:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22b;
 helo=mail-lj1-x22b.google.com; envelope-from=krellan@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=fHB0XvXk; dkim-atps=neutral
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zLR0735RzDr3G
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 10:45:16 +1100 (AEDT)
Received: by mail-lj1-x22b.google.com with SMTP id h23so24515065ljc.8
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jan 2020 15:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zm9tbfYSw8iRwvzgb83oWyOZnQGwuv+Vhvstp9TpwMo=;
 b=fHB0XvXk/SMolyIeQ97znsquPmASFF7Yk2C+fCyle0M/ERUs7vCWPvemyW0it+HP0S
 JTutUms1T3C3yNEmXURChdKnNJNY69f40CEqIp49sZxIS/+EMwXQayYvtaRfYdX61ok7
 Qa89Y3IUu7HE7me7bflP51h27elqhkl/OQncJxzg3VA+csK6un5xVMnqQvT4ME3JKinu
 5nnqMT8scWJg59svOJo5qv8B2R6i1INNGY4fqFkhRZrFukBplK0/DigJx4u9azJSeiT2
 owlMcTLA1AW4q3iZHvf6X9vZheyLdaN0jrBTK/RyRNaHZxvmFyN6fRw1+uRcFEZqrJbu
 oTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zm9tbfYSw8iRwvzgb83oWyOZnQGwuv+Vhvstp9TpwMo=;
 b=NqTJEoIFhk6rSOH2MtuaJGY9Bcuia9BZJ37yrdnxXQpCPCcd+UhxEqw0MxHf50T2IC
 3baA/8VmTQbXOOvK48hcUFIAynFXvaSrbLsfSUVImK0/0lOyi6D0z+7B9w2iadf3vC8M
 5uIYTXVwmbm838zxQg5FrPcOJVTDA43ffQaxTys6+VuAemffG8yCjsToKQBZKQzzlszg
 BJqcPlED1SkP+tSpq3MEIZritP3DbadCgwJcjr0e6CeZZS5IlUcxa2/Gyvcu97Owwsip
 z+2BpFMZ7k4UhQhJ6cMCR4O/pq4vPY9BmqcMpffyNuWADMgH8Crzj+kSgIPKfFvqvyGF
 evCw==
X-Gm-Message-State: APjAAAVxygK6gvILiRMJFWPoRd0xmY8zCM01/moiO9qEFApmkfZUqtTF
 TXhvByS0F+/Pf4CjN7VZMKljuku9ZDeUlfhOL4cGCg==
X-Google-Smtp-Source: APXvYqxIPdpRON7t3JeQKGTl99d+hvgrMF4CtNKPid7z4wMSeqqEYTjTF7u6cpA4jT6llj/kSJNwsZ5lLQXtdwzrIhc=
X-Received: by 2002:a2e:86d6:: with SMTP id n22mr3891401ljj.77.1579218309636; 
 Thu, 16 Jan 2020 15:45:09 -0800 (PST)
MIME-Version: 1.0
References: <CANPkJS9ggqARodBg+dhUEBBXKXANFJ=bJEDEyTmPQbVF=oLOkA@mail.gmail.com>
 <afa376c6-9886-3f19-399e-81cc3f492f1e@linux.intel.com>
In-Reply-To: <afa376c6-9886-3f19-399e-81cc3f492f1e@linux.intel.com>
From: Josh Lehan <krellan@google.com>
Date: Thu, 16 Jan 2020 15:44:53 -0800
Message-ID: <CANPkJS-HB8Mpj26CZfcjGW5mGXWyeH4atE=wXNQ6__wv94ogYg@mail.gmail.com>
Subject: Re: Change 27956 dbus-sensors PSUSensor appears to break Entity ID
To: James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="0000000000005ed9be059c4a6ae7"
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, mutyalax.jayaprakash@intel.com,
 Alex Qiu <xqiu@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000005ed9be059c4a6ae7
Content-Type: text/plain; charset="UTF-8"

Nice, thanks for your fast follow-up! Here is the created issue:

https://github.com/openbmc/dbus-sensors/issues/3

Thanks!
Josh

Josh Lehan | Software Engineer | krellan@google.com | +1 650-733-8941



On Thu, Jan 16, 2020 at 11:35 AM James Feist <james.feist@linux.intel.com>
wrote:

> On 1/15/20 6:00 PM, Josh Lehan wrote:
> > Hello there.
> >
> > A recent change to dbus-sensors, 27956 on Gerrit, appears to have
> > introduced a difference which breaks the Entity ID field.
> >
> > Alex Qiu has written what the symptom is, and I traced through the code.
> > Both findings are written as comments, to that change on Gerrit.
> >
> > I'm open to suggestions on how to resolve this. There are probably many
> > people using the PSUSensor program in different ways.
> >
> > I am curious as to the behavior Intel was seeing in their project. There
> > must be a difference in the way we are using the PSUSensor program, in
> > which the way we're using it sees this as a breakage, but Intel sees
> > this as a fix. Any details that can be provided?
>
> Hi Josh,
>
> Thanks for the investigation. Would you mind creating an issue?
>
> I think this has to do with Redfish and the power schema. Upon looking
> closer, I think this patch should be reverted, and the fix be applied to
> Redfish to distinguish between power sensors and other types of sensors.
>
> I'd be fine if you created a revert as well if there is an issue to
> point to with your research.
>
> Thanks
>
> -James
>
>
>
> >
> > Thanks!
> > Josh
> >
> > Josh Lehan | Software Engineer |krellan@google.com
> > <mailto:krellan@google.com> | +1 650-733-8941 <(650)%20733-8941>
> >
>

--0000000000005ed9be059c4a6ae7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Nice, thanks for your fast follow-up! Here is the created =
issue:<div><br></div><div><a href=3D"https://github.com/openbmc/dbus-sensor=
s/issues/3">https://github.com/openbmc/dbus-sensors/issues/3</a></div><div>=
<br></div><div>Thanks!</div><div>Josh</div><div><br clear=3D"all"><div><div=
 dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><=
div dir=3D"ltr"><div><div dir=3D"ltr"><div style=3D"line-height:1.5em;paddi=
ng-top:10px;margin-top:10px;color:rgb(85,85,85);font-family:sans-serif"><sp=
an style=3D"border-width:2px 0px 0px;border-style:solid;border-color:rgb(21=
3,15,37);padding-top:2px;margin-top:2px">Josh Lehan=C2=A0|</span><span styl=
e=3D"border-width:2px 0px 0px;border-style:solid;border-color:rgb(51,105,23=
2);padding-top:2px;margin-top:2px">=C2=A0Software Engineer=C2=A0|</span><sp=
an style=3D"border-width:2px 0px 0px;border-style:solid;border-color:rgb(0,=
153,57);padding-top:2px;margin-top:2px">=C2=A0<a href=3D"mailto:krellan@goo=
gle.com" target=3D"_blank">krellan@google.com</a>=C2=A0|</span><span style=
=3D"border-width:2px 0px 0px;border-style:solid;border-color:rgb(238,178,17=
);padding-top:2px;margin-top:2px">=C2=A0+1 650-733-8941</span></div><br></d=
iv></div></div></div></div><br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 16, 2020 at 11:35 AM James=
 Feist &lt;<a href=3D"mailto:james.feist@linux.intel.com">james.feist@linux=
.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 1/15/20 6:00 PM, Josh Lehan wrote:<br>
&gt; Hello there.<br>
&gt; <br>
&gt; A recent change to dbus-sensors, 27956 on Gerrit, appears to have <br>
&gt; introduced a difference which breaks the Entity ID field.<br>
&gt; <br>
&gt; Alex Qiu has written what the symptom is, and I traced through the cod=
e. <br>
&gt; Both findings are written as comments, to that change on Gerrit.<br>
&gt; <br>
&gt; I&#39;m open to suggestions on how to resolve this. There are probably=
 many <br>
&gt; people using the PSUSensor program in different ways.<br>
&gt; <br>
&gt; I am curious as to the behavior Intel was seeing in their project. The=
re <br>
&gt; must be a difference in the way we are using the PSUSensor program, in=
 <br>
&gt; which the way we&#39;re using it sees this as a breakage, but Intel se=
es <br>
&gt; this as a fix. Any details that can be provided?<br>
<br>
Hi Josh,<br>
<br>
Thanks for the investigation. Would you mind creating an issue?<br>
<br>
I think this has to do with Redfish and the power schema. Upon looking<br>
closer, I think this patch should be reverted, and the fix be applied to <b=
r>
Redfish to distinguish between power sensors and other types of sensors.<br=
>
<br>
I&#39;d be fine if you created a revert as well if there is an issue to <br=
>
point to with your research.<br>
<br>
Thanks<br>
<br>
-James<br>
<br>
<br>
<br>
&gt; <br>
&gt; Thanks!<br>
&gt; Josh<br>
&gt; <br>
&gt; Josh Lehan=C2=A0|=C2=A0Software Engineer=C2=A0|<a href=3D"mailto:krell=
an@google.com" target=3D"_blank">krellan@google.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:krellan@google.com" target=3D"_blank">kre=
llan@google.com</a>&gt;=C2=A0|=C2=A0<a href=3D"tel:(650)%20733-8941" value=
=3D"+16507338941" target=3D"_blank">+1 650-733-8941</a><br>
&gt; <br>
</blockquote></div>

--0000000000005ed9be059c4a6ae7--
