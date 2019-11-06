Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F5DF1004
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 08:12:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477HmL2MLCzF5WL
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 18:12:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::136;
 helo=mail-il1-x136.google.com; envelope-from=rahulmaheshwari01@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WThCIvUf"; 
 dkim-atps=neutral
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477Hlg4kwNzF5Tj
 for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2019 18:11:59 +1100 (AEDT)
Received: by mail-il1-x136.google.com with SMTP id r9so4161297ilq.10
 for <openbmc@lists.ozlabs.org>; Tue, 05 Nov 2019 23:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qc83hs7Sc9qQ6ctpz4T94uQo/uYIp7lPz5JWZYxuxcE=;
 b=WThCIvUfsMt0neueZnIC2rHyC6uOFI8k9R+5xneyJjT/qoFn/ViniBgGdp06LAvzDZ
 OTloS5PL922jKF/I/sQeYtVkmuKrDtZneQEH4GBbG8EhGnqgShVdS0S1U8w1Cffgq3qf
 3119fqbrYKR9Zjp23N9UDCzoFLU5wYkO68VVoZyEW6E+iNodK0ffAZXLLDww+YkHs6/V
 ksuUlaEVtzFVshfWI79P/YXzi4nIxu7i8QlNtJOn/H9VzuqbhDIgvHJmqhMXExXncRgC
 Vv+OBVY8QjdT3ei3abWl9R9WS6dshQ6xY89f0+oaWCL3NNIzI/8dzzwyFcWY7hNmseEK
 PfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qc83hs7Sc9qQ6ctpz4T94uQo/uYIp7lPz5JWZYxuxcE=;
 b=L61S+rbJm/C9TNYLNWS2+Z9ve2GG84fFQBhl4+Nc5IP8x6X8bIBgTGs+I1cOr2e/SJ
 nfelUcQay86S16oeqE89s3jlAWKCyfw1C9Pt9z2jkqQx6YUdKvNTgDdPk1dPv7ShGAIB
 Fo59jWLuj68Shw9xq63hV9kTYyUlvgil2Or/KnGlfP+6HeMEwP4j5c/kGdBKhqKmpF7k
 mUqVmqOS7mb1Fi/rrFLvhsUDmaYe75DgYeo/zkofQ4odCFx4YLXe6XUn0QBabqhb3Gi5
 XWouP0vkpCQHDzMfrsPh4GYrORr3ksD/S54r9oSktJ18QDIgDR7K4biOK6opnEMvKXNl
 JnmA==
X-Gm-Message-State: APjAAAXU43XM0pZnpAfRPXk9YAP+pCF2LO3UyMDAh2H0mFXgBLGipCgf
 TP9AjvH6k7whyjVOqnLdiLKev4plgQYUBj8vxgQv1A==
X-Google-Smtp-Source: APXvYqw6NPWTW6g4T2/qiO3YU1RCfRbjy/JirVlCqDH+cHJnYYfgdzJD1nENqBOb6tJTxcmQkspW5FqGe0bbLeBjj5s=
X-Received: by 2002:a92:8897:: with SMTP id m23mr1119592ilh.36.1573024315565; 
 Tue, 05 Nov 2019 23:11:55 -0800 (PST)
MIME-Version: 1.0
References: <937d3cf0ee5b42559e145fbf87c5c9b3@quantatw.com>
 <CAAMkS12QPgcdawwV0OdvB_xFB5C78o7AqvTmKcZWYqeTgjCioQ@mail.gmail.com>
 <37a55521de3843c6a407e7faeb68f693@quantatw.com>
In-Reply-To: <37a55521de3843c6a407e7faeb68f693@quantatw.com>
From: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Date: Wed, 6 Nov 2019 12:42:32 +0530
Message-ID: <CAAMkS10zqHVNv-x8pLBtyDJVm2xTjTROHSqsA6SeELZ953wz-w@mail.gmail.com>
Subject: Re: Questions about openbmc-test-automation
To: =?UTF-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
Content-Type: multipart/alternative; boundary="0000000000008d6b9e0596a8439a"
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

--0000000000008d6b9e0596a8439a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, that is correct way.

On Wed, Nov 6, 2019 at 11:22 AM Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) <Ton=
y.Lee@quantatw.com>
wrote:

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
> From: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
> Sent: Tuesday, November 5, 2019 6:51 PM
> To: Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) <Tony.Lee@quantatw.com>
> Cc: openbmc@lists.ozlabs.org
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
ilto:
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

--0000000000008d6b9e0596a8439a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, that is correct way.<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 6, 2019 at 11:22 =
AM Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) &lt;<a href=3D"mailto:Tony.Lee@qu=
antatw.com">Tony.Lee@quantatw.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Rahul,<br>
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
From: Rahul Maheshwari &lt;<a href=3D"mailto:rahulmaheshwari01@gmail.com" t=
arget=3D"_blank">rahulmaheshwari01@gmail.com</a>&gt; <br>
Sent: Tuesday, November 5, 2019 6:51 PM<br>
To: Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) &lt;<a href=3D"mailto:Tony.Lee@q=
uantatw.com" target=3D"_blank">Tony.Lee@quantatw.com</a>&gt;<br>
Cc: <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@l=
ists.ozlabs.org</a><br>
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
ailto:<a href=3D"mailto:Tony.Lee@quantatw.com" target=3D"_blank">Tony.Lee@q=
uantatw.com</a>&gt; wrote:<br>
Hi Rahul,<br>
=C2=A0<br>
I&#39;m wondering that why &quot;REDFISH_NW_ETH0&quot; is hardcode as &quot=
;Managers/bmc/EthernetInterfaces/eth0/&quot; in /data/variables.py<br>
<a href=3D"https://github.com/openbmc/openbmc-test-automation/blob/master/d=
ata/variables.py#L155" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/openbmc/openbmc-test-automation/blob/master/data/variables.py#L155</a><=
br>
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

--0000000000008d6b9e0596a8439a--
