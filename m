Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C13611BF7F1
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 14:10:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CZ2Z6JbxzDr8g
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 22:10:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2f;
 helo=mail-io1-xd2f.google.com; envelope-from=rahulmaheshwari01@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LjK3sJ0N; dkim-atps=neutral
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CZ1B367qzDq7h
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 22:08:57 +1000 (AEST)
Received: by mail-io1-xd2f.google.com with SMTP id i3so1148327ioo.13
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 05:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eXIP4bT3vw3b/v05S0vnDxJE73od+3wMsoVo6c5ZGDc=;
 b=LjK3sJ0Nl9+EUvRcMygWd1dCn1TJgbmmaQq+MTnSHW7wWok0d5UUxrIZIa+nWFbhjR
 I/jXZ7Yx8neOxjDKi4KtOmn9/0G7Y4uulhPcO3IfKusTPt0UxvDlSIE/7vBJXYRb94Id
 y3TUFoS45K5rKkkKIbXi0ksf5ahwWTA6VUU63Mai/B0nSVpklqz6FhsWUXe9QXQVJBKV
 VUv218AMaF8p23y+Xwf5CVDg106x6igEjq8gGUIeSc91NcWFsAoJCCIiDUN4ti8nk6Ld
 JsNtr7KmhPN35mqsckePUhJABVuvZQ/Sf80vQ8o92sTcD1M74J5No9x2MZQKXAfETME8
 JjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eXIP4bT3vw3b/v05S0vnDxJE73od+3wMsoVo6c5ZGDc=;
 b=SINg4oE6QyzStJzGfrqBQuVfD/9CGrRE4WS3LilA2QexTJTHGE5baQ/+EdhTyvG6E6
 c12Y+MNg40xXhco2CUXfyg9SJH7M0KX+EL3JP4JCVgk8J84/bM42PLhXazQCeW8Bm3rd
 40J39bC1/iy8KlJkMEl0fpjrFegfHO+4+KVTZKAfPKZDqKoYMsO5i9RNiYcs7j/ME2h7
 4OpElxHoom/hHAzYyayE+RrGTlcOpD6bv56aa4wmP3Mbod2Y0/8zwFJCbZykncRXsksu
 yJJY605U52zYTZgj6Y53QUVbEq5MKKi3WDZCXOqQ9VdqrUkh6mk3PanS1tWdf//DQs4Z
 IzYw==
X-Gm-Message-State: AGi0PuYxX9fdFpcWTM9Y0SpPNXXSRqD+YcfbZ3BTkZvHJ2Bj0vCNlBLW
 /U+ub3TgaojRQYCqbw24GGv1vy4IcwVz5j3rPqLZ1nSjqXU=
X-Google-Smtp-Source: APiQypIGaNxMR3tcGtlAqq6NxDYjJuS+bJ1CixVzWBbJZSkIYWAlawZKQJBkf7F7ugybNRlsnoRCHj6tHK3nG8tK5cA=
X-Received: by 2002:a02:603:: with SMTP id 3mr1452910jav.132.1588248533564;
 Thu, 30 Apr 2020 05:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <77fbcecc2f4b4ceab3dca7319b2a9f66@quantatw.com>
In-Reply-To: <77fbcecc2f4b4ceab3dca7319b2a9f66@quantatw.com>
From: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Date: Thu, 30 Apr 2020 17:39:03 +0530
Message-ID: <CAAMkS13sM+zjAmSGp9Vx1O-ocWbLDcwgft18iruM96BS7wMx8A@mail.gmail.com>
Subject: Re: Test suite 'test_bmc_network_conf' in openbmc-test-automation
To: =?UTF-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
Content-Type: multipart/alternative; boundary="000000000000a8848805a480ed9e"
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

--000000000000a8848805a480ed9e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

prkatti1@in.ibm.com

Prashant
Can you look at this query?

Thanks,
Rahul

On Wed, Apr 29, 2020 at 3:56 PM Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) <Ton=
y.Lee@quantatw.com>
wrote:

> Hi Rahul,
>
> Cases like 'Configure Broadcast IP', 'Configure Multicast IP' and
> 'Configure Loopback IP' in redfish test_bmc_network_conf.robot.
> In these cases, when using redfish to set an invalid type ip (such as
> broadcast ip), an HTTP_BAD_REQUEST response is expected.
>
> However, the invalid type ip in openbmc repo 'bmcweb' has no restrictions=
.
> Therefore, those test cases related to setting invalid type ip or gateway
> will fail.
>
> Do you have any suggestions for this issue? Will these cases also fail in
> your environment?
>
> Thanks
> Best Regards,
> Tony
>
>
>

--000000000000a8848805a480ed9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><a href=3D"mailto:prkatti1@in.ibm.com" ta=
rget=3D"_blank" title=3D"Send mail to prkatti1@in.ibm.com" class=3D"gmail-i=
c-bizcard-email-anchor gmail-bcKeyNav gmail-ic-bizcard-clickable-anchor" ta=
bindex=3D"0" style=3D"outline:none;color:rgb(255,255,255);text-transform:lo=
wercase;font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,&quot;Lucida=
 Grande&quot;,sans-serif;font-size:12px;text-align:center;background-color:=
rgb(50,92,128)">prkatti1@in.ibm.com</a></div><div class=3D"gmail_quote"><di=
v class=3D"gmail_attr"><br></div><div class=3D"gmail_attr">Prashant</div><d=
iv class=3D"gmail_attr">Can you look at this query?</div><div class=3D"gmai=
l_attr"><br></div><div class=3D"gmail_attr">Thanks,</div><div class=3D"gmai=
l_attr">Rahul</div><div dir=3D"ltr" class=3D"gmail_attr"><br></div><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Apr 29, 2020 at 3:56 PM Tony Lee (=E6=
=9D=8E=E6=96=87=E5=AF=8C) &lt;<a href=3D"mailto:Tony.Lee@quantatw.com">Tony=
.Lee@quantatw.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Hi Rahul, <br>
<br>
Cases like &#39;Configure Broadcast IP&#39;, &#39;Configure Multicast IP&#3=
9; and &#39;Configure Loopback IP&#39; in redfish test_bmc_network_conf.rob=
ot.<br>
In these cases, when using redfish to set an invalid type ip (such as broad=
cast ip), an HTTP_BAD_REQUEST response is expected.<br>
<br>
However, the invalid type ip in openbmc repo &#39;bmcweb&#39; has no restri=
ctions.<br>
Therefore, those test cases related to setting invalid type ip or gateway w=
ill fail.<br>
<br>
Do you have any suggestions for this issue? Will these cases also fail in y=
our environment?<br>
<br>
Thanks<br>
Best Regards,<br>
Tony<br>
<br>
<br>
</blockquote></div></div>

--000000000000a8848805a480ed9e--
