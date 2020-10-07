Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C3F28682C
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 21:20:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C640y3960zDqRr
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 06:20:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12a;
 helo=mail-il1-x12a.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=MSpHHAFy; dkim-atps=neutral
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C64060tKGzDqJY
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 06:19:31 +1100 (AEDT)
Received: by mail-il1-x12a.google.com with SMTP id o9so3417425ilo.0
 for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2020 12:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7kB7dedxPUFxTFHVNq8XpO3tj6V+FGrYPxp7og40fl4=;
 b=MSpHHAFypOVJC3AhNniAhBcSOzSAS2meaN/Q0cxmgqQE0KzHCCp0Uhdd4Qu64fIe2h
 eriCQ5OZDolnZMdZR5j9x5dXCMBZnto72UcisqgITrCXqi8G8RdbGLfLkKauclWlKTBA
 d2LTu9QMbcj66ZgTPwOh7wNEEbUqb5iG0mcvti5xQDW6qRSZgpxVOnl8EQ8tn2GIx6z+
 BwFtz4o8bCUVmhkSf5azyfj8drMV++l5ILErwbA1Ci94GmhFcvibv0CWSjYWR++ZEuzN
 218HCT/v/LjCajZJnVwZE+v0g+TCGpSrmzxqt2gII/1VxhEVkSX4Wc/0mT3uIqA2rmRq
 tJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7kB7dedxPUFxTFHVNq8XpO3tj6V+FGrYPxp7og40fl4=;
 b=ijlI0kEQDUpF9R6JllHZhq1tl27gVUKsL0waiFqale3gjd8DY3kscvv+mdtmZ+RKjp
 TW9ZvFTjTPZCUvY6L6dig0VnBMlrzdJUB1KuvKPS8h+16kUTCWW60F2FFz6+GFIJn9RN
 rMzkMMHTBYzio3eJQO6ea5bxx1SAHbPMjRieBKbKdZQj5eEgsMi2icTl3RFVjclLgDD4
 BnKXh/d6bI0bvRrUIhl5FotJMMvuXn7CP4tZJNRyS6r/EMg4Qfcl8QlDaschim6qn5uP
 3yXP/mq0JS64G6nLfm87nMICDaV6ccEyEv2L31uEo4GfDGqxwUmh2TVY3zDp6ZZUxVmU
 GmZQ==
X-Gm-Message-State: AOAM5317jJysHnhGGkiUNSbld/e+T5LQRjtZkgFWFIIWHjxThgKYnGv1
 tXbzuskqbm+3nQ5Q3JI9baqAo+Hyhhh4LbzpXe2MsnRdkRZcS2ca
X-Google-Smtp-Source: ABdhPJwqotY7zApoDwWDniczuBs/3O1b/9x/qZxUHxWwmk0CbLribRKiKlIUWeXmNQeyQ3s+hHit0clCrAaL+B8qGMk=
X-Received: by 2002:a92:9907:: with SMTP id p7mr4019487ili.200.1602098367467; 
 Wed, 07 Oct 2020 12:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <CY4PR04MB1033E4D796F88C0BA457B3AEB90D0@CY4PR04MB1033.namprd04.prod.outlook.com>
In-Reply-To: <CY4PR04MB1033E4D796F88C0BA457B3AEB90D0@CY4PR04MB1033.namprd04.prod.outlook.com>
From: Anton Kachalov <rnouse@google.com>
Date: Wed, 7 Oct 2020 21:19:15 +0200
Message-ID: <CADVsX883MJzB9bP0xKNOqxv=uHs0OeH87BnFfejXHULW8coVNA@mail.gmail.com>
Subject: Re: Redfish Virtual Media return InternalError
To: Brad Chou <bradc@hyvedesignsolutions.com>
Content-Type: multipart/alternative; boundary="00000000000016e9f505b119986e"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000016e9f505b119986e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey, Brad.

Try to log into the bmc and check the bmcweb logs:

# systemctl status -n 100 bmcweb.status

If it doesn't show anything meaningful, get the "Main PID" and try to
*strace* it (you need to include strace into the builded image).

On Tue, 6 Oct 2020 at 11:20, Brad Chou <bradc@hyvedesignsolutions.com>
wrote:

> Hi,
>
> I enable the =E2=80=9CDBMCWEB_ENABLE_VM_NBDPROXY=E2=80=9D flag in bmcweb =
by bbappend it :
>
> EXTRA_OECMAKE_append =3D " \
>
>     -DBMCWEB_ENABLE_VM_NBDPROXY=3DON \
>
> "
>
>
>
> Then try to use redfish virtual media.
>
> But I got an error return when get into the collection :
>
>
>
> $  curl -k -H "X-Auth-Token: $token" https://
> ${bmc}/redfish/v1/Managers/bmc/VirtualMedia
>
> {
>
>   "@odata.id": "/redfish/v1/Managers/bmc/VirtualMedia/",
>
>   "@odata.type": "#VirtualMediaCollection.VirtualMediaCollection",
>
>   "Name": "Virtual Media Services",
>
>   "error": {
>
>     "@Message.ExtendedInfo": [
>
>       {
>
>         "@odata.type": "#Message.v1_0_0.Message",
>
>         "Message": "The request failed due to an internal service error.
> The service is still operational.",
>
>         "MessageArgs": [],
>
>         "MessageId": "Base.1.4.0.InternalError",
>
>         "Resolution": "Resubmit the request.  If the problem persists,
> consider resetting the service.",
>
>         "Severity": "Critical"
>
>       }
>
>     ],
>
>     "code": "Base.1.4.0.InternalError",
>
>     "message": "The request failed due to an internal service error.  The
> service is still operational."
>
>   }
>
> }
>
>
>
>
>
> Any idea ?
>
>
>
>
>

--00000000000016e9f505b119986e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey, Brad.<div><br></div><div>Try to log into the bmc and =
check the bmcweb logs:</div><div><br></div><div># systemctl status -n 100 b=
mcweb.status<br></div><div><br></div><div>If it doesn&#39;t show anything m=
eaningful, get the &quot;Main PID&quot; and try to <b>strace</b> it (you ne=
ed to include strace into the builded image).</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 6 Oct 2020 at 11=
:20, Brad Chou &lt;<a href=3D"mailto:bradc@hyvedesignsolutions.com">bradc@h=
yvedesignsolutions.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_4678873044927031382WordSection1">
<p class=3D"MsoNormal">Hi,<u></u><u></u></p>
<p class=3D"MsoNormal">I enable the =E2=80=9CDBMCWEB_ENABLE_VM_NBDPROXY=E2=
=80=9D flag in bmcweb by bbappend it :<u></u><u></u></p>
<p class=3D"MsoNormal">EXTRA_OECMAKE_append =3D &quot; \<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 -DBMCWEB_ENABLE_VM_NBDPROXY=3DON =
\<u></u><u></u></p>
<p class=3D"MsoNormal">&quot;<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Then try to use redfish virtual media.<u></u><u></u>=
</p>
<p class=3D"MsoNormal">But I got an error return when get into the collecti=
on :<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">$=C2=A0 curl -k -H &quot;X-Auth-Token: $token&quot; =
https://${bmc}/redfish/v1/Managers/bmc/VirtualMedia<u></u><u></u></p>
<p class=3D"MsoNormal">{<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 &quot;@<a href=3D"http://odata.id" target=3D"=
_blank">odata.id</a>&quot;: &quot;/redfish/v1/Managers/bmc/VirtualMedia/&qu=
ot;,<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 &quot;@odata.type&quot;: &quot;#VirtualMediaC=
ollection.VirtualMediaCollection&quot;,<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 &quot;Name&quot;: &quot;Virtual Media Service=
s&quot;,<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 &quot;error&quot;: {<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 &quot;@Message.ExtendedInfo&quot;=
: [<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;@od=
ata.type&quot;: &quot;#Message.v1_0_0.Message&quot;,<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;Mes=
sage&quot;: &quot;The request failed due to an internal service error.=C2=
=A0 The service is still operational.&quot;,<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;Mes=
sageArgs&quot;: [],<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;Mes=
sageId&quot;: &quot;Base.1.4.0.InternalError&quot;,<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;Res=
olution&quot;: &quot;Resubmit the request.=C2=A0 If the problem persists, c=
onsider resetting the service.&quot;,<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;Sev=
erity&quot;: &quot;Critical&quot;<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 ],<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 &quot;code&quot;: &quot;Base.1.4.=
0.InternalError&quot;,<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 &quot;message&quot;: &quot;The re=
quest failed due to an internal service error.=C2=A0 The service is still o=
perational.&quot;<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 }<u></u><u></u></p>
<p class=3D"MsoNormal">}<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Any idea ?<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>

</blockquote></div>

--00000000000016e9f505b119986e--
