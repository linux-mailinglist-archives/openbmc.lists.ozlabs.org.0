Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED49EFBF7
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 12:03:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476mx62qf2zDrRB
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 22:03:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2f;
 helo=mail-io1-xd2f.google.com; envelope-from=rahulmaheshwari01@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GBpWrW2U"; 
 dkim-atps=neutral
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476mf03HVxzF4SG
 for <openbmc@lists.ozlabs.org>; Tue,  5 Nov 2019 21:50:13 +1100 (AEDT)
Received: by mail-io1-xd2f.google.com with SMTP id c11so22047360iom.10
 for <openbmc@lists.ozlabs.org>; Tue, 05 Nov 2019 02:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N4r+hQoyvDXpXsBZJ4yBnJqNlkNk6jIkL/AAZE4WdFo=;
 b=GBpWrW2UOP6ah7m+TssjqGK1GNAwilMl1ijsxXhTnI6Er7FSOQ4AlWVK42t26fG45U
 Iqb2CEKjIijd/n+Hk+ku2bidg77325FAnoF79r+9LnoANs3eLi5UFVHFFV1nF9Ew1rCT
 Z3De6237eCYZZ6s99kTo8ijiliSvjVOsK0f39saTlfMq/YvG7XO3Gqs769mH9n0mLKuT
 FadLVfebUo/rgo+uZstH/1WRWP+tIatCXKOSXwBovGXY44rnygArhOYgB/smCo+Z0cKg
 MOabVu+K0mIqoNgkmynQzZal0TWdAn6BfnBHOp2NX3o4Fu6JocBFa5GGvNYrlWMU9LfW
 dkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N4r+hQoyvDXpXsBZJ4yBnJqNlkNk6jIkL/AAZE4WdFo=;
 b=lh3gsLUlffyXEa9JtWEGIeCI+ZykI/MMBWNq8IVyxJUNwZd8S/0TSuqcWvy6Iq7+aH
 wrtkYzekriSHPJhmduMXX1oJoOLCeGFcDcLMv0MVwGImWytstaCFOX89KIyGvsPo9HmH
 qQjz5MsHFemZ9WXzj2yKBa1JXHmsWvXw9hasa0YJgVKfplyynk+c+FZTLk1m6f4ver8E
 8k0Iho2qTVy88Kzruod/nn6FjRN4t+fEB9CEyYrX626VB38nZP6Sr5oHTtgbUgSwY+io
 0B08ori7JwYeh0gmPW451xQDiqXJYjxnaNMAfWpNQDY2zzD6u55UWuWx4uTrU06OZ8l/
 RTRw==
X-Gm-Message-State: APjAAAURymcmg8pZ39NnS4jtf8kYihL1itqZ4mbTbGAf4Ae0+vermDD/
 fQCSiCVGdCmcxQyG+XwNheyy6Cgv8fzR1j4iQYV9iDNv
X-Google-Smtp-Source: APXvYqyRQLKDjhZz9muaMF+5eQj3cTgZkLifcIxNXjUgODozVvCYh7aR+FsQDqpQnboJPI73jmpNLVZr+0cnOP0aaCA=
X-Received: by 2002:a5e:a51a:: with SMTP id 26mr812198iog.31.1572951006544;
 Tue, 05 Nov 2019 02:50:06 -0800 (PST)
MIME-Version: 1.0
References: <937d3cf0ee5b42559e145fbf87c5c9b3@quantatw.com>
In-Reply-To: <937d3cf0ee5b42559e145fbf87c5c9b3@quantatw.com>
From: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Date: Tue, 5 Nov 2019 16:20:39 +0530
Message-ID: <CAAMkS12QPgcdawwV0OdvB_xFB5C78o7AqvTmKcZWYqeTgjCioQ@mail.gmail.com>
Subject: Re: Questions about openbmc-test-automation
To: =?UTF-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
Content-Type: multipart/alternative; boundary="000000000000fe8ab1059697311c"
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

--000000000000fe8ab1059697311c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for pointing that out. Passing interface/channel number is an easier
option but we should be avoiding passing environment variable unless there
is no other way. I would say better way to overcome this is to figure out
the channel count using "ip addr" command from BMC cli.
Let us know if that sounds good to you.
Also let us know if you would like to drop code change for the same?

Thanks
Rahul






On Tue, Nov 5, 2019 at 2:28 PM Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) <Tony=
.Lee@quantatw.com> wrote:

> Hi Rahul,
>
>
>
> I'm wondering that why "REDFISH_NW_ETH0" is hardcode as
> "Managers/bmc/EthernetInterfaces/eth0/" in /data/variables.py
>
>
> https://github.com/openbmc/openbmc-test-automation/blob/master/data/varia=
bles.py#L155
>
> Furthermore, the command "lan print" didn't specify the channel number in
> /ipmi/test_ipmi_network.robot.
>
> Therefore, the default will print information on the first found LAN
> channel.
>
>
>
> Isn't it more reasonable to set the interface and the channel number as
> environment variables and give them default values?
>
>
>
> Thanks
>
> Best Regards,
>
> Tony
>
>
>

--000000000000fe8ab1059697311c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div></div><div>Thanks for pointing that ou=
t. Passing interface/channel number is an easier option but we should be av=
oiding passing environment=C2=A0variable unless there is no other way. I wo=
uld say better way to overcome this is to figure out the channel count usin=
g &quot;ip addr&quot; command from BMC cli.=C2=A0<div>Let us know if that s=
ounds good=C2=A0to you.</div><div>Also let us know if you would like to dro=
p code change for the same?=C2=A0<div><div><div><br></div><div>Thanks</div>=
<div>Rahul</div></div></div></div><div><br></div><div><br><div><br></div><d=
iv><br></div><div>=C2=A0</div></div></div></div></div></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 5, =
2019 at 2:28 PM Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) &lt;<a href=3D"mailt=
o:Tony.Lee@quantatw.com">Tony.Lee@quantatw.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"ZH-TW">
<div class=3D"gmail-m_3386610193825965617WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Rahul,<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I&#39;m wondering that why &quo=
t;REDFISH_NW_ETH0&quot; is hardcode as &quot;Managers/bmc/EthernetInterface=
s/eth0/&quot; in /data/variables.py<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://github.com/o=
penbmc/openbmc-test-automation/blob/master/data/variables.py#L155" target=
=3D"_blank">https://github.com/openbmc/openbmc-test-automation/blob/master/=
data/variables.py#L155</a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Furthermore, the command &quot;=
lan print&quot; didn&#39;t specify the channel number in /ipmi/test_ipmi_ne=
twork.robot.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Therefore, the default will pri=
nt information on the first found LAN channel.
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Isn&#39;t it more reasonable to=
 set the interface and the channel number as environment variables and give=
 them default values?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards,<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Tony<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
</div>

</blockquote></div>

--000000000000fe8ab1059697311c--
