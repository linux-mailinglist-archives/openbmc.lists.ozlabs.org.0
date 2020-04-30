Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 120761BED9B
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 03:33:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CHvw2KhhzDr7J
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 11:33:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2d;
 helo=mail-yb1-xb2d.google.com; envelope-from=yuenn@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=K/4sXSuM; dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CHvB5ZB0zDr7J
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 11:32:53 +1000 (AEST)
Received: by mail-yb1-xb2d.google.com with SMTP id i16so2313690ybq.9
 for <openbmc@lists.ozlabs.org>; Wed, 29 Apr 2020 18:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lOCegcfdQ3GQ5dY18MQD5ZV0zjTlOuTU+M7ecQKrxkc=;
 b=K/4sXSuM4Bvp8aRj0WyhTMTw/R2SR7MoX5U2T/4l6RYmfsENfyKziKntDb1+MnyFpq
 lEOK9OMDmERmwILSa9cnPVn3iwNBKgJJDelo5UGwqbl4cCwvUbC9Y4kfEeWX8HtX69bF
 Vk2p+grFAvhapngkS/ITL5LziSSva71hxqNHZGpRP98p/DTFRpWH+HGm94iYzo0ZUSj9
 luNXYtT35PYMzFSxCYbxXX7tISTSGC1TmHuV8VQNXHRfAzYM5PNZyY61Ao7WoRpLqkTy
 pSaevVjsFc3i41lbm+aKNa5kcCfQnx2IEp03w7mFCH8cbkEI41I1z0222ZRb+ynwzYwf
 4Hfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lOCegcfdQ3GQ5dY18MQD5ZV0zjTlOuTU+M7ecQKrxkc=;
 b=PHNvLK9VM1Ll7dIIOA0BkPNjtKhfLzV5mUnGeGtg9Zb+4/mM4gLBLS8JF9WAlvLq2D
 v6dVRiDQiASPc8YNWYP7cFHD6anoFDJ5IfHqjbywfZFxhSi/w1/0SmNWh6ICSkJ1CXnR
 9Aq8qmVH+ZEacO62eQUI5TktRDqFPuxMJDZHh4fsiis+u6BqYbxF9lSAdOZtma++0/S6
 qoepy2bDwXlkcb7tysni1wJpDdCiMsXgDC76NUNER/4RHG5HW30IwWQt+yq4vbunK8In
 yVWaeU+o1FRuT9tWrEqS+i/ZClAc8awLDTV5rq6trwXttLJYBDwPXnnTBB/ttAYZl0+o
 7Lfw==
X-Gm-Message-State: AGi0PubiR3z926d85bd2XYz6gReKyawsTFvR1f4LRUY5IlLBFK9j1nK8
 7kcA2f5PQ+1vCXO4naTld7K2wHlQSSow2b0pPzA60Q==
X-Google-Smtp-Source: APiQypK4kC9Joi4mQH4h6RPG4CoK5aKptCEgUWhCflDnDjQq4psSd/k7TFB0p+NrWpkmql8+xo0e+f2rKWuu4yVwlPQ=
X-Received: by 2002:a25:e907:: with SMTP id n7mr1915183ybd.85.1588210369253;
 Wed, 29 Apr 2020 18:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <CADfYTpG8Jp6rkQXnAeRjyAf41jzrJa0sPHmc7K0gbR7=EigQNw@mail.gmail.com>
 <59A41CBD-05E4-4CE5-BFDB-19CA52FC8460@fb.com>
 <CADfYTpGeVOx8bfEZgXga1Pokk18xw+=-6ONjCyfMt7tQGumCrw@mail.gmail.com>
 <CBE4A094-E71A-4997-8AAE-6B5962D42556@fb.com>
In-Reply-To: <CBE4A094-E71A-4997-8AAE-6B5962D42556@fb.com>
From: Nancy Yuen <yuenn@google.com>
Date: Wed, 29 Apr 2020 18:32:12 -0700
Message-ID: <CADfYTpGjup=UXM-bzBD9ZbMkF8T-fZdS3sRr2u_=9hVYgqkFWg@mail.gmail.com>
Subject: Re: Multiple BMCs in a system: IPMB? Redfish? MCTP?
To: Vijay Khemka <vijaykhemka@fb.com>
Content-Type: multipart/alternative; boundary="000000000000e3d3a305a4780a8b"
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

--000000000000e3d3a305a4780a8b
Content-Type: text/plain; charset="UTF-8"

Vijay, I wonder if IPMB would still be used in later generations or would
something like MCTP be considered?
----------
Nancy


On Wed, Apr 29, 2020 at 5:42 PM Vijay Khemka <vijaykhemka@fb.com> wrote:

> Nancy,
>
> We have multiple hosts which has a small controller called BIC (Bridge
> IC). This BIC on each host connected via i2c to main BMC and communicates
> through ipmi messages to BMC over IPMB/i2c.
>
>
>
> Regards
>
> -Vijay
>
>
>
> *From: *Nancy Yuen <yuenn@google.com>
> *Date: *Wednesday, April 29, 2020 at 5:25 PM
> *To: *Vijay Khemka <vijaykhemka@fb.com>
> *Cc: *OpenBMC Maillist <openbmc@lists.ozlabs.org>
> *Subject: *Re: Multiple BMCs in a system: IPMB? Redfish? MCTP?
>
>
>
> Neeraj, I was not considering aggregation in this case, just having the
> intermediate BMC "route".
>
>
>
> Vijay, thanks.  I was wondering what your applications for IPMB were for.
> What's the rationale for using IPMB vs something else?  In your multihost
> system, one BMC supports multiple host CPUs?  Are there also multiple BMCs?
>
>
> ----------
> Nancy
>
>
>
>
>
> On Wed, Apr 29, 2020 at 5:15 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
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
>

--000000000000e3d3a305a4780a8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Vijay, I wonder if IPMB would still be used in later gener=
ations or would something like MCTP be considered?<br clear=3D"all"><div><d=
iv dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"=
>----------<br>Nancy</div></div><br></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 29, 2020 at 5:42 PM Vijay K=
hemka &lt;<a href=3D"mailto:vijaykhemka@fb.com">vijaykhemka@fb.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_7908806319401427381WordSection1">
<p class=3D"MsoNormal">Nancy,<u></u><u></u></p>
<p class=3D"MsoNormal">We have multiple hosts which has a small controller =
called BIC (Bridge IC). This BIC on each host connected via i2c to main BMC=
 and communicates through ipmi messages to BMC over IPMB/i2c.<u></u><u></u>=
</p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Regards<u></u><u></u></p>
<p class=3D"MsoNormal">-Vijay<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(181,196,223);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From: =
</span></b><span style=3D"font-size:12pt;color:black">Nancy Yuen &lt;<a hre=
f=3D"mailto:yuenn@google.com" target=3D"_blank">yuenn@google.com</a>&gt;<br=
>
<b>Date: </b>Wednesday, April 29, 2020 at 5:25 PM<br>
<b>To: </b>Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.com" target=3D=
"_blank">vijaykhemka@fb.com</a>&gt;<br>
<b>Cc: </b>OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org"=
 target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
<b>Subject: </b>Re: Multiple BMCs in a system: IPMB? Redfish? MCTP?<u></u><=
u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Neeraj, I was not considering aggregation in this ca=
se, just having=C2=A0the intermediate BMC &quot;route&quot;.
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Vijay, thanks.=C2=A0 I was wondering what your appli=
cations for IPMB were for.=C2=A0 What&#39;s the rationale for using IPMB vs=
 something else?=C2=A0 In your multihost system, one BMC supports multiple =
host CPUs?=C2=A0 Are there also multiple BMCs?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><br clear=3D"all">
<u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal">----------<br>
Nancy<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Wed, Apr 29, 2020 at 5:15 PM Vijay Khemka &lt;<a =
href=3D"mailto:vijaykhemka@fb.com" target=3D"_blank">vijaykhemka@fb.com</a>=
&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<div>
<div>
<p class=3D"MsoNormal">Hi Nancy,<u></u><u></u></p>
<p class=3D"MsoNormal">We are currently using (1) in our current multi host=
 design. Option (3) also looks good.<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Regards<u></u><u></u></p>
<p class=3D"MsoNormal">-Vijay<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(181,196,223);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From:
</span></b><span style=3D"font-size:12pt;color:black">openbmc &lt;openbmc-b=
ounces+vijaykhemka=3D<a href=3D"mailto:fb.com@lists.ozlabs.org" target=3D"_=
blank">fb.com@lists.ozlabs.org</a>&gt; on behalf of Nancy Yuen &lt;<a href=
=3D"mailto:yuenn@google.com" target=3D"_blank">yuenn@google.com</a>&gt;<br>
<b>Date: </b>Wednesday, April 29, 2020 at 3:53 PM<br>
<b>To: </b>OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org"=
 target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
<b>Subject: </b>Multiple BMCs in a system: IPMB? Redfish? MCTP?</span><u></=
u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">I&#39;ve talked with some people a while back (long =
while back) about multiple BMCs in a system.=C2=A0 Either for redundancy or=
 managing separate parts of a system.=C2=A0=C2=A0 I&#39;m wondering what
 other people are thinking in this area if at all.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">We are considering similar designs and I&#39;m looki=
ng into options for BMC-BMC communications.=C2=A0 Some BMCs may not be exte=
rnally accessible.=C2=A0Here are some options that we&#39;ve looked
 at:<u></u><u></u></p>
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
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">----------<br>
Nancy<u></u><u></u></p>
</div>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</div>

</blockquote></div>

--000000000000e3d3a305a4780a8b--
