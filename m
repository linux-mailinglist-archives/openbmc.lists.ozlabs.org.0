Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6C25190A
	for <lists+openbmc@lfdr.de>; Mon, 24 Jun 2019 18:53:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Xb2T19wLzDqQm
	for <lists+openbmc@lfdr.de>; Tue, 25 Jun 2019 02:53:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c36; helo=mail-yw1-xc36.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gtk+xqd2"; 
 dkim-atps=neutral
Received: from mail-yw1-xc36.google.com (mail-yw1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Xb161yKBzDqBW
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jun 2019 02:51:54 +1000 (AEST)
Received: by mail-yw1-xc36.google.com with SMTP id m16so6088452ywh.12
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jun 2019 09:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fZBvZh1LXih26qliibBPrM3MLe0oZdhFF4XNclcKkQg=;
 b=gtk+xqd2Ef/9h5H3F4EdzWTq4EbxndgLon9d+SrZHgCYI2LPPVySY5QyMAa2KlMQ/S
 OtAsMrslkJFBTGSCRatoQGByAcg/pifYEBIoGZgFp/yntxNFOMSHtWaybs9DDQ4XUgIa
 b07qSOnhi/0XV7yIbfXV62pHrNzn1egvT5jwO53WAVA0UaxMyVi0gHKJlAGN9KSBQrQR
 2WN8n4lHlk8SjdMFwiQ0dC7MoHLmz9XZ1vy9C5FXSYgx1gJQqSxag6sNXCSVBVO04O5Q
 JANuf9Z6g8Q36kRgB8mcNBmKm4gVVIZXKLK1On7b7Eh+c60Q2JqNqrPT4SRpwfBWdQPd
 i2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fZBvZh1LXih26qliibBPrM3MLe0oZdhFF4XNclcKkQg=;
 b=AzFjIUJsYi7DXprIt/gM8y+3xL0u5lT/zwdxK+5zULBZpmljGVdjn9qAkOZ56zdDM1
 7MzEVw6mdC2slgK/XGcSoBKR6qggqaHpFZOoXiI9YeqJt5A0cPOjx53Zo/G1fZo98WRr
 2LHknRddxOwk+hfA5AbTTrfJBkpmnVS4jJXsqufnIQaOseg/UTResl09dpSyEbfOFV94
 QzhF4pzilAH6uL1xNxjJ09Ofavz3ES4Z2bO3PSXA3kHH4IeWQ5HmrYVyEmedSNNqzGEA
 f67rM2mILAlAPumGa9D1qyl7/SAGEyf6fIYjkn+DlF1puTy46K9aUYqGgw2Sa3hoCgw7
 7ATA==
X-Gm-Message-State: APjAAAV8tpdB2xMCp9LtncfkmhvR+gAeRVQB2VfBZ6K7y26alTNdhHPk
 KES2pyl+AZzXUKdbvXrWF4niPL8osPRlaNMrQdE=
X-Google-Smtp-Source: APXvYqyUqKWSSGj7bX8/DKKUtZw5u24tCWGTdy4bLPcj1rE6Zi6VDziSqZscG0r7cRWtxar0zwGbH0QlnNK3tOx3a6Y=
X-Received: by 2002:a81:1153:: with SMTP id 80mr24611032ywr.39.1561395110466; 
 Mon, 24 Jun 2019 09:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.3250.1560532343.4162.openbmc@lists.ozlabs.org>
 <tencent_69C7E9EC6F65C50D0F925BFF@qq.com>
 <CAOUmYFRYB3i_-sLBMbmOXJX3-Lo49QjfK2G01XFHbj4Mndx4sA@mail.gmail.com>
 <CAMTupoQ9fovzOcFH__Ljq=y8RKAp8_7WYunzQ8xNcc6Qjk+Dvg@mail.gmail.com>
 <tencent_799D81715559779D478D3D61@qq.com>
 <CAOUmYFTVYjXwXP_oC6+yMUaUS8d15=Ys5BDqGjc-N5JBQC8HQg@mail.gmail.com>
 <tencent_1BF1F4AC2B9970D9471A8668@qq.com>
In-Reply-To: <tencent_1BF1F4AC2B9970D9471A8668@qq.com>
From: Jandra A <jandraara@gmail.com>
Date: Mon, 24 Jun 2019 11:51:39 -0500
Message-ID: <CAMTupoTUFv3TCY=D8OatOTCeoBdCsbqXVep5ZM6vXdJ1EGgr-A@mail.gmail.com>
Subject: Re: Re: Network Settings GUI
To: xiuzhi <1450335857@qq.com>
Content-Type: multipart/alternative; boundary="000000000000e9d845058c14a090"
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
Cc: openbmc <openbmc@lists.ozlabs.org>, rxsun <rxsun@zd-tech.com.cn>,
 Derick <derick.montague@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000e9d845058c14a090
Content-Type: text/plain; charset="UTF-8"

Hi Xiuzhi and Ruixia,

It would be great to set some time to align on the requirements from design
and how to work together so that your team can start on the so front-end
development.

Like Derick said, we meet every other Wednesday at 10:00 Central time to
discuss GUI issues, with the next one being next Wednesday (July 3rd).
Hopefully you can make that.

If you cannot, I am happy to meet at 7:00 or 8:00 AM Central time this
Wednesday (June 26th) or Friday (June 28th). Please let me know.

Regards,

On Wed, Jun 19, 2019 at 8:30 PM xiuzhi <1450335857@qq.com> wrote:

> Hi Derick,
> >> The IPV6 webui should support both IPV4 and IPV6 on a single interface
> at the same time and users can set IPV4 and IPV6 on the same network
> webpage from Lenovo test cases.
>
> >Thank you!
>
> >>  Ruixia (her email: rxsun@zd-tech.com.cn;), form my team can do
> front-end  to implement your design .  It would be best if the IPV6 feature
> could be achieved in one to two months.
>
> >It would be great if she were able to join our GUI Community
> workgroup. It's every other Wednesday at 10:00 Central Time. We use
> these to discuss all the GUI issues. Where are you located?
>   I am in BeiJing  UTC+8. The meeting time is  Wednesday  23:00 Beijing
> Time (Wednesday 10:00 am Central Daylight Time),isn't it?
> >GUI Community Workgroup Wiki:
> https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group
>
> Best,
> Xiuzhi
>

--000000000000e9d845058c14a090
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Xiuzhi and Ruixia,=C2=A0<div><br></div><div>It wou=
ld be great to set some time to align on the requirements from design and h=
ow to work together so that your team can start on the so front-end develop=
ment.=C2=A0=C2=A0<br><br>Like Derick said, we meet every other Wednesday at=
 10:00 Central time to discuss GUI issues, with the next one being next Wed=
nesday (July 3rd). Hopefully you can make that.=C2=A0</div><div><br></div><=
div>If you cannot, I am happy to meet at 7:00 or 8:00 AM Central time this =
Wednesday (June 26th) or Friday (June 28th). Please let me know.=C2=A0</div=
><div><br></div><div>Regards,</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 19, 2019 at 8:30 PM xiuzhi &=
lt;<a href=3D"mailto:1450335857@qq.com">1450335857@qq.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>Hi Derick,</d=
iv><div>&gt;&gt; The IPV6 webui should support both IPV4 and IPV6 on a sing=
le interface at the same time and users can set IPV4 and IPV6 on the same n=
etwork webpage from Lenovo test cases.</div><div><br>&gt;Thank you!<br><br>=
&gt;&gt;=C2=A0 Ruixia (her email: <a href=3D"mailto:rxsun@zd-tech.com.cn" t=
arget=3D"_blank">rxsun@zd-tech.com.cn</a>;), form my team can do=C2=A0 fron=
t-end=C2=A0 to implement your design .=C2=A0 It would be best if the IPV6 f=
eature could be achieved in one to two months.<br><br>&gt;It would be great=
 if she were able to join our GUI Community<br>workgroup. It&#39;s every ot=
her Wednesday at 10:00 Central Time. We use<br>these to discuss all the GUI=
 issues. Where are you located?<br>=C2=A0 I am in BeiJing=C2=A0 UTC+8. The =
meeting time is=C2=A0=C2=A0Wednesday=C2=A0 23:00 Beijing Time (Wednesday 10=
:00 am=C2=A0<span style=3D"font-family:Arial,Helvetica,sans-serif;font-size=
:17px">Central Daylight Time</span>),isn&#39;t it?</div><div>&gt;GUI Commun=
ity Workgroup Wiki:<br><a href=3D"https://github.com/openbmc/openbmc/wiki/G=
UI-Design-work-group" target=3D"_blank">https://github.com/openbmc/openbmc/=
wiki/GUI-Design-work-group</a><br></div><div><br></div><div>Best,</div><div=
>Xiuzhi</div></blockquote></div>

--000000000000e9d845058c14a090--
