Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BAE1BECF3
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 02:26:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CGQ770zvzDr9y
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 10:26:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b30;
 helo=mail-yb1-xb30.google.com; envelope-from=yuenn@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Kk/cOaTi; dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CGPP1T2LzDq5t
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 10:25:28 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id t18so2272232ybp.2
 for <openbmc@lists.ozlabs.org>; Wed, 29 Apr 2020 17:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xBTAGiswUij+u+M8Arh/nmkJKMGBe2F1yEsWM/lOy0M=;
 b=Kk/cOaTiHmoNs3zykJEjTgyqQ/8ZgHMYbetWNCT8QTUqpI2f+lenh8p26Alqo9TaRS
 BnH0zzQOngmPJ8qM0+jeTpHWjhZrMEiQgiX9GogpEapsgSUhtTsy+k8Xg/n6brYqEj3j
 ff3MEUSy/pumLUrNEzq+xSbWYvuZChvsK94GqIYaJP7J1Nh6Uekd8tYZmtsRExZRyTHA
 2BW1eT1cscWB5F5ndPPGf+uvOnfLTkpmHQbWGRstkHvFtMRPxdET2rGUSLigY7n/VtVl
 flUnG+zPtKUOK3q8xgsWUvecbcilxDf6nBX1mux5WtVGZZvnowcT/uEpR+bnLjVAWWsT
 os/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xBTAGiswUij+u+M8Arh/nmkJKMGBe2F1yEsWM/lOy0M=;
 b=apxkB56bSwzCvg0lBl20qw6NHS3woG0l6WD132jXBrUn+hfeYlN5uukMAS40c8KDv/
 89sjn5wKftjuSuNxnwHBuXMSsR86sN286ubRgqzH8Tg1HNOknVtTSrpmVbaQD61mg+Nq
 yJFbtPQwf/WM+CgnkDo9uYKGwR5N1xSg4ZGiQ2fHPcJkhtiviAq6g1nOotaqY+5Lm7oB
 WtYkGUv8zoYqSmXNlPtvZESd0mLTDhNyBpZuPBMMRyJE132FsJwSCpZXDaZRq6U8ZGIK
 u1yXmR/dCvGS7IgD4NHM+QYnB4moUadwzfIkLm29PpNgRggw89oBaIs1yDBiv98xDUem
 X72A==
X-Gm-Message-State: AGi0PuYCA2T1oosCQukMSEheRFO3H5aizXA9skr2w0+VKbeonav76P04
 JH00mTzWTzv0wCiXNEFc0lP2w+fg3X+FOEikgS4Wyg==
X-Google-Smtp-Source: APiQypJUOiPCMsOuuM2vfX9eJZrtZhTQq0DlE4pHsCXyTsPXGm8vM5HYO6YIN5BROlttIa5LB2Ykpxp91Qbo2jSdPlI=
X-Received: by 2002:a5b:583:: with SMTP id l3mr1499580ybp.521.1588206324863;
 Wed, 29 Apr 2020 17:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <CADfYTpG8Jp6rkQXnAeRjyAf41jzrJa0sPHmc7K0gbR7=EigQNw@mail.gmail.com>
 <59A41CBD-05E4-4CE5-BFDB-19CA52FC8460@fb.com>
In-Reply-To: <59A41CBD-05E4-4CE5-BFDB-19CA52FC8460@fb.com>
From: Nancy Yuen <yuenn@google.com>
Date: Wed, 29 Apr 2020 17:24:48 -0700
Message-ID: <CADfYTpGeVOx8bfEZgXga1Pokk18xw+=-6ONjCyfMt7tQGumCrw@mail.gmail.com>
Subject: Re: Multiple BMCs in a system: IPMB? Redfish? MCTP?
To: Vijay Khemka <vijaykhemka@fb.com>
Content-Type: multipart/alternative; boundary="000000000000d3523905a47719b3"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000d3523905a47719b3
Content-Type: text/plain; charset="UTF-8"

Neeraj, I was not considering aggregation in this case, just having the
intermediate BMC "route".

Vijay, thanks.  I was wondering what your applications for IPMB were for.
What's the rationale for using IPMB vs something else?  In your multihost
system, one BMC supports multiple host CPUs?  Are there also multiple BMCs?

----------
Nancy


On Wed, Apr 29, 2020 at 5:15 PM Vijay Khemka <vijaykhemka@fb.com> wrote:

> Hi Nancy,
>
> We are currently using (1) in our current multi host design. Option (3)
> also looks good.
>
>
>
> Regards
>
> -Vijay
>
>
>
> *From: *openbmc <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org> on
> behalf of Nancy Yuen <yuenn@google.com>
> *Date: *Wednesday, April 29, 2020 at 3:53 PM
> *To: *OpenBMC Maillist <openbmc@lists.ozlabs.org>
> *Subject: *Multiple BMCs in a system: IPMB? Redfish? MCTP?
>
>
>
> I've talked with some people a while back (long while back) about multiple
> BMCs in a system.  Either for redundancy or managing separate parts of a
> system.   I'm wondering what other people are thinking in this area if at
> all.
>
>
>
> We are considering similar designs and I'm looking into options for
> BMC-BMC communications.  Some BMCs may not be externally accessible. Here
> are some options that we've looked at:
>
>    1. i2c/IPMB
>    2. usbnet/Redfish
>    3. i2c/MCTP/PLDM or something else?
>    4. internal network via switch chip/Redfish or MCTP
>
>  I'd like to reduce our use of IPMI so I want to avoid (1).
>
>
>
> ----------
> Nancy
>

--000000000000d3523905a47719b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Neeraj, I was not considering aggregation in this case, ju=
st having=C2=A0the intermediate BMC &quot;route&quot;.<div><br></div><div>V=
ijay, thanks.=C2=A0 I was wondering what your applications for IPMB were fo=
r.=C2=A0 What&#39;s the rationale for using IPMB vs something else?=C2=A0 I=
n your multihost system, one BMC supports multiple host CPUs?=C2=A0 Are the=
re also multiple BMCs?</div><div><br clear=3D"all"><div><div dir=3D"ltr" da=
ta-smartmail=3D"gmail_signature">----------<br>Nancy</div></div><br></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Wed, Apr 29, 2020 at 5:15 PM Vijay Khemka &lt;<a href=3D"mailto:vijaykhem=
ka@fb.com" target=3D"_blank">vijaykhemka@fb.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div>
<p class=3D"MsoNormal">Hi Nancy,<u></u><u></u></p>
<p class=3D"MsoNormal">We are currently using (1) in our current multi host=
 design. Option (3) also looks good.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Regards<u></u><u></u></p>
<p class=3D"MsoNormal">-Vijay<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(181,196,223);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From: =
</span></b><span style=3D"font-size:12pt;color:black">openbmc &lt;openbmc-b=
ounces+vijaykhemka=3D<a href=3D"mailto:fb.com@lists.ozlabs.org" target=3D"_=
blank">fb.com@lists.ozlabs.org</a>&gt; on behalf of Nancy Yuen &lt;<a href=
=3D"mailto:yuenn@google.com" target=3D"_blank">yuenn@google.com</a>&gt;<br>
<b>Date: </b>Wednesday, April 29, 2020 at 3:53 PM<br>
<b>To: </b>OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org"=
 target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
<b>Subject: </b>Multiple BMCs in a system: IPMB? Redfish? MCTP?<u></u><u></=
u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">I&#39;ve talked with some people a while back (long =
while back) about multiple BMCs in a system.=C2=A0 Either for redundancy or=
 managing separate parts of a system.=C2=A0=C2=A0 I&#39;m wondering what ot=
her people are thinking in this area if at all.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">We are considering similar designs and I&#39;m looki=
ng into options for BMC-BMC communications.=C2=A0 Some BMCs may not be exte=
rnally accessible.=C2=A0Here are some options that we&#39;ve looked at:<u><=
/u><u></u></p>
</div>
<div>
<ol start=3D"1" type=3D"1">
<li class=3D"MsoNormal">
i2c/IPMB<u></u><u></u></li><li class=3D"MsoNormal">
usbnet/Redfish<u></u><u></u></li><li class=3D"MsoNormal">
i2c/MCTP/PLDM or something else?<u></u><u></u></li><li class=3D"MsoNormal">
internal network via switch chip/Redfish or MCTP<u></u><u></u></li></ol>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0I&#39;d like to reduce our use of IPMI so I wa=
nt to avoid (1).<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">----------<br>
Nancy<u></u><u></u></p>
</div>
</div>
</div>
</div>

</blockquote></div>

--000000000000d3523905a47719b3--
