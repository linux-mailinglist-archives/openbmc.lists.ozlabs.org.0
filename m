Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA4AF2D76
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 12:31:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4781Sm0VQhzF6KJ
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 22:31:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d36;
 helo=mail-io1-xd36.google.com; envelope-from=rahulmaheshwari01@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WyAariNw"; 
 dkim-atps=neutral
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4781Pq64TszF33J
 for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2019 22:29:03 +1100 (AEDT)
Received: by mail-io1-xd36.google.com with SMTP id q83so1914482iod.1
 for <openbmc@lists.ozlabs.org>; Thu, 07 Nov 2019 03:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pEobS/Osd6ynY4uyNwA2LL+W/Sy5fHULIrqUUoVO28k=;
 b=WyAariNwdpFW7+7yZ0UYoWJrGlCqEoqpUUBRWdW8nLciKQ88BR+ztvmGLP4KLHQwJY
 IfUNVE4TOtVvvkD8P2yMEsiP0s5NTHKPc+JZjH1i3csa+I6hwm4ULG1chmZDh52xTBxG
 /k8je+5Qb5j5n/XWw438hecXIqvbzYBL36xnOwTpuDzel+xtQNJph54eS1p5bZ6COupI
 Dd+O/UccJfR3A7boK7pcOXcEB+4ny1zQSJZu29q75OJi4tdOkkhRN9SVTtpzQy2KuV4Q
 ccTj6CbZuXAZXca0vG0aW6UW50PHChk1OZDYWydv54wghwt4ZZaTCyBrYyy1ByWwgG0j
 0TtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pEobS/Osd6ynY4uyNwA2LL+W/Sy5fHULIrqUUoVO28k=;
 b=VH9aR4QdgkrN4wwn1cqbKnmdqf59mu0S3ehhKZ8t2dEwdJBLOarfOCPe/fkcX9e2qE
 uGBEKvJ9WsonjSVwMkcVd1/p37S6t7l3FAJX4GH2GxP5tjProYPWfLXee8C+7bkZ600j
 AV7z8Qh6kF3GCHVel3yFf2P1sCZtuHmTYBCurUw/Nky73UsKKj1FL2ub/x/h/FnEa5qe
 6rFuHvLwjaLGF6z4Om2Lu13GDgskSwohtuKchzlAlKufXILhUpBPoAOHZnxOuFrA1XZW
 usZMSiGbr+mq6mLhdzJxWdR+OAlargzaMoT19Si5EKuQ8ZfHXjvz4bV4D5liCyc1zb5W
 qOAQ==
X-Gm-Message-State: APjAAAXLeCsVt7RPD0dVaswT7x430aUNFYfLngOV2siMJkaCK2nhOp2i
 f2a0AjctOD7m00gXKRKpIyNBGkT5J/rEscT1LR3rEA==
X-Google-Smtp-Source: APXvYqzfdPWLXHGA79ov9AfqipYQaK0aunlkKEwSrwS20Vkp+e/RHv8eZMbC2ixY/ZNaya+SspErwKvXPuJiZTqtIuw=
X-Received: by 2002:a5e:a51a:: with SMTP id 26mr3014639iog.31.1573126139948;
 Thu, 07 Nov 2019 03:28:59 -0800 (PST)
MIME-Version: 1.0
References: <937d3cf0ee5b42559e145fbf87c5c9b3@quantatw.com>
 <CAAMkS12QPgcdawwV0OdvB_xFB5C78o7AqvTmKcZWYqeTgjCioQ@mail.gmail.com>
 <37a55521de3843c6a407e7faeb68f693@quantatw.com>
 <CAAMkS10zqHVNv-x8pLBtyDJVm2xTjTROHSqsA6SeELZ953wz-w@mail.gmail.com>
 <dea6fe3ac2b44de881f105adc9a0f8ba@quantatw.com>
In-Reply-To: <dea6fe3ac2b44de881f105adc9a0f8ba@quantatw.com>
From: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Date: Thu, 7 Nov 2019 16:58:47 +0530
Message-ID: <CAAMkS10g8kNCgGo5hbE=GKr+-LgSTP1W=dRv6ubDpXtwcFkpvA@mail.gmail.com>
Subject: Re: Questions about openbmc-test-automation
To: =?UTF-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
Content-Type: multipart/alternative; boundary="000000000000c233350596bff8a6"
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000c233350596bff8a6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure. Thanks for taking up the initiative.

On Thu, 7 Nov 2019, 07:07 Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C), <Tony.Lee=
@quantatw.com> wrote:

> Hi Rahul,
>
> It sounds good to me and I would like to drop code change.
>
> From: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
> Sent: Wednesday, November 6, 2019 3:13 PM
> To: Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) <Tony.Lee@quantatw.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: Questions about openbmc-test-automation
>
> Yes, that is correct way.
>
> On Wed, Nov 6, 2019 at 11:22 AM Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) <m=
ailto:
> Tony.Lee@quantatw.com> wrote:
> Hi Rahul,
>
> For example, case "Retrieve IP Address Via IPMI And Verify Using Redfish"
> in /ipmi/test_ipmi_network.robot.
> The new way is as follows:
>
> IPMI network channel logically starts from 1. For example, once it figure
> out the channel count is 3,
> we can retrieve IP addresses through channels 1, 2, and 3, and verify the=
m
> correspond to eth0, eth1, and eth2, respectively by redfish.
> Is it right?
>
> Thanks
> Best Regards,
> Tony
>
> From: Rahul Maheshwari <mailto:rahulmaheshwari01@gmail.com>
> Sent: Tuesday, November 5, 2019 6:51 PM
> To: Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) <mailto:Tony.Lee@quantatw.com>
> Cc: mailto:openbmc@lists.ozlabs.org
> Subject: Re: Questions about openbmc-test-automation
>
> Thanks for pointing that out. Passing interface/channel number is an
> easier option but we should be avoiding passing environment variable unle=
ss
> there is no other way. I would say better way to overcome this is to figu=
re
> out the channel count using "ip addr" command from BMC cli.
> Let us know if that sounds good to you.
> Also let us know if you would like to drop code change for the same?
>
> Thanks
> Rahul
>
>
>
>
>
>
> On Tue, Nov 5, 2019 at 2:28 PM Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) <ma=
ilto:mailto:
> Tony.Lee@quantatw.com> wrote:
> Hi Rahul,
>
> I'm wondering that why "REDFISH_NW_ETH0" is hardcode as
> "Managers/bmc/EthernetInterfaces/eth0/" in /data/variables.py
>
> https://github.com/openbmc/openbmc-test-automation/blob/master/data/varia=
bles.py#L155
> Furthermore, the command "lan print" didn't specify the channel number in
> /ipmi/test_ipmi_network.robot.
> Therefore, the default will print information on the first found LAN
> channel.
>
> Isn't it more reasonable to set the interface and the channel number as
> environment variables and give them default values?
>
> Thanks
> Best Regards,
> Tony
>
>

--000000000000c233350596bff8a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Sure. Thanks for taking up the initiative.</div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 7 Nov 2=
019, 07:07 Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C), &lt;<a href=3D"mailto:To=
ny.Lee@quantatw.com">Tony.Lee@quantatw.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">Hi Rahul,<br>
<br>
It sounds good to me and I would like to drop code change.<br>
<br>
From: Rahul Maheshwari &lt;<a href=3D"mailto:rahulmaheshwari01@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">rahulmaheshwari01@gmail.com</a>&gt; <br=
>
Sent: Wednesday, November 6, 2019 3:13 PM<br>
To: Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) &lt;<a href=3D"mailto:Tony.Lee@q=
uantatw.com" target=3D"_blank" rel=3D"noreferrer">Tony.Lee@quantatw.com</a>=
&gt;<br>
Cc: <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank" rel=3D"no=
referrer">openbmc@lists.ozlabs.org</a><br>
Subject: Re: Questions about openbmc-test-automation<br>
<br>
Yes, that is correct way.<br>
<br>
On Wed, Nov 6, 2019 at 11:22 AM Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) &lt;=
mailto:<a href=3D"mailto:Tony.Lee@quantatw.com" target=3D"_blank" rel=3D"no=
referrer">Tony.Lee@quantatw.com</a>&gt; wrote:<br>
Hi Rahul,<br>
<br>
For example, case &quot;Retrieve IP Address Via IPMI And Verify Using Redfi=
sh&quot; in /ipmi/test_ipmi_network.robot.<br>
The new way is as follows:<br>
<br>
IPMI network channel logically starts from 1. For example, once it figure o=
ut the channel count is 3,<br>
we can retrieve IP addresses through channels 1, 2, and 3, and verify them =
correspond to eth0, eth1, and eth2, respectively by redfish.<br>
Is it right?<br>
<br>
Thanks<br>
Best Regards,<br>
Tony<br>
<br>
From: Rahul Maheshwari &lt;mailto:<a href=3D"mailto:rahulmaheshwari01@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">rahulmaheshwari01@gmail.com</a>&=
gt; <br>
Sent: Tuesday, November 5, 2019 6:51 PM<br>
To: Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) &lt;mailto:<a href=3D"mailto:Ton=
y.Lee@quantatw.com" target=3D"_blank" rel=3D"noreferrer">Tony.Lee@quantatw.=
com</a>&gt;<br>
Cc: mailto:<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank" re=
l=3D"noreferrer">openbmc@lists.ozlabs.org</a><br>
Subject: Re: Questions about openbmc-test-automation<br>
<br>
Thanks for pointing that out. Passing interface/channel number is an easier=
 option but we should be avoiding passing environment=C2=A0variable unless =
there is no other way. I would say better way to overcome this is to figure=
 out the channel count using &quot;ip addr&quot; command from BMC cli.=C2=
=A0<br>
Let us know if that sounds good=C2=A0to you.<br>
Also let us know if you would like to drop code change for the same?=C2=A0<=
br>
<br>
Thanks<br>
Rahul<br>
<br>
<br>
<br>
<br>
=C2=A0<br>
<br>
On Tue, Nov 5, 2019 at 2:28 PM Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) &lt;m=
ailto:<a href=3D"mailto:mailto" target=3D"_blank" rel=3D"noreferrer">mailto=
</a>:<a href=3D"mailto:Tony.Lee@quantatw.com" target=3D"_blank" rel=3D"nore=
ferrer">Tony.Lee@quantatw.com</a>&gt; wrote:<br>
Hi Rahul,<br>
=C2=A0<br>
I&#39;m wondering that why &quot;REDFISH_NW_ETH0&quot; is hardcode as &quot=
;Managers/bmc/EthernetInterfaces/eth0/&quot; in /data/variables.py<br>
<a href=3D"https://github.com/openbmc/openbmc-test-automation/blob/master/d=
ata/variables.py#L155" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://github.com/openbmc/openbmc-test-automation/blob/master/data/variables.p=
y#L155</a><br>
Furthermore, the command &quot;lan print&quot; didn&#39;t specify the chann=
el number in /ipmi/test_ipmi_network.robot.<br>
Therefore, the default will print information on the first found LAN channe=
l. <br>
=C2=A0<br>
Isn&#39;t it more reasonable to set the interface and the channel number as=
 environment variables and give them default values?<br>
=C2=A0<br>
Thanks<br>
Best Regards,<br>
Tony<br>
=C2=A0<br>
</blockquote></div>

--000000000000c233350596bff8a6--
