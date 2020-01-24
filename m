Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0510F149073
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 22:48:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 484CSc21zZzDqf2
	for <lists+openbmc@lfdr.de>; Sat, 25 Jan 2020 08:48:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22d;
 helo=mail-lj1-x22d.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=rzQFwJK6; dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 484CRk6h3wzDqdM
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jan 2020 08:47:46 +1100 (AEDT)
Received: by mail-lj1-x22d.google.com with SMTP id h23so4212043ljc.8
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jan 2020 13:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sHulpNPz8Ez7eCSmVoE73OtoMDp/dvKiISmX/8N4MJE=;
 b=rzQFwJK60Fh2cooYaBQZqNfcNDiOI0ptsfB0+xj/8yM/D6YINNMvfDNfMNBwr8vMvd
 c65bCfgFjvHBhS1/X0jg1vc30ZAldV+u2TWkLptyWuFwW5lcZ5ZifZPohee5fjQR5LZ8
 xHF+gOddBaJFOEOYOCg9hTHigyqm43MZiYSXZzan72fmMJ27PXauspykpwsZoKIisT/X
 R2uqGxtf/c9GPtwEFHw5SyB+GsRmAWClAllXaPZaEfum21NAz/VULLhoNIFUeqLe8Y3E
 2K6Z7TU7BLUVBO5jrS9svtCfWcFkRW1uLPV8UEVsBLqkSk+hoGhgCNfNiSOTmD5/D2ux
 DhHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sHulpNPz8Ez7eCSmVoE73OtoMDp/dvKiISmX/8N4MJE=;
 b=TW3/olV/pb7yMk6m879KCBj4Mx8pKP7pAmaF9t0GpuxAH4ACTAEDkFWzP4Bvsm7RPm
 uVGGKguJXkq1BGjPLUTkY3CdvbJ2IiGGcf2VsnQQqQ/A5WCvbKTE+B29CkkhkZ6Z3njH
 sVN6WB8LRK3UFphfrUvKDrcHE0vpnEe1/7R+535yDBISMsPpJ8r2Di8J927B9iBm+12Q
 K/3/XbVJg/gNl6olPmuIbQkrmmmMWAhBhVK1Ilg3Xw4cQMPMtQo46g1G7FPb4Vyg1zpR
 prmn7wgjmpBspZ3q7/S1qJ7uhWRwyQW8QVw5jksteJCpzMBf3XjgIfcKa6KflcsRLfkw
 PBRQ==
X-Gm-Message-State: APjAAAWsUGBq5Em2NbniJ3O5g5NVTbIOEqLhntaQltdz0mOj/m7NUBDl
 KYW8uFSE0W4Qxy38qa9vf8BDKaqV22Bb4lGeFqAbYA==
X-Google-Smtp-Source: APXvYqzH2V+CpEmHRYPpmuac9WqcA84qlMFPUaqPr3YzeulS98Jl7w1+OiQq6MjGaIqUGWHJkdsuHedagl0j8N70+5g=
X-Received: by 2002:a05:651c:20f:: with SMTP id
 y15mr2904036ljn.7.1579902460570; 
 Fri, 24 Jan 2020 13:47:40 -0800 (PST)
MIME-Version: 1.0
References: <67e599e4-0b45-aa01-1e27-d49c52873646@linux.intel.com>
 <13B92308-8346-4B8F-9A1C-139A0B11A762@fb.com>
In-Reply-To: <13B92308-8346-4B8F-9A1C-139A0B11A762@fb.com>
From: Richard Hanley <rhanley@google.com>
Date: Fri, 24 Jan 2020 13:47:29 -0800
Message-ID: <CAH1kD+bewL+yeW82bb_1uJx1cx6y_EC5oLXEHkwGwWM8wy8TUw@mail.gmail.com>
Subject: Re: Reg OpenBMC PMCI Workgroup
To: Vijay Khemka <vijaykhemka@fb.com>
Content-Type: multipart/alternative; boundary="000000000000f1783c059ce9b405"
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
Cc: "tomjoseph@in.ibm.com" <tomjoseph@in.ibm.com>, "Mihm,
 James" <James.Mihm@intel.com>,
 "iwona.winiarska@intel.com" <iwona.winiarska@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "piotr.matuszczak@intel.com" <piotr.matuszczak@intel.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, "Thomaiyar,
 Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 "sumanth.bhat@linux.intel.com" <sumanth.bhat@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000f1783c059ce9b405
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

+1 on interest from PST time zone.  I know I've personally been struggling
with how to get meetings that cover most timezones.  I'm starting to think
that a possible system is to alternating between two set times.  That way
most people can be somewhat involved.

Regards,
Richard

On Tue, Jan 21, 2020 at 11:01 AM Vijay Khemka <vijaykhemka@fb.com> wrote:

> Hi Richard,
>
> I would love to be part of this group but I am in PST so none of those
> time would work.
>
>
>
> Regards
>
> -Vijay
>
>
>
> *From: *openbmc <openbmc-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org> o=
n
> behalf of "Thomaiyar, Richard Marian" <
> richard.marian.thomaiyar@linux.intel.com>
> *Date: *Tuesday, January 21, 2020 at 7:08 AM
> *To: *OpenBMC Maillist <openbmc@lists.ozlabs.org>, Andrew Jeffery <
> andrew@aj.id.au>, Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, "
> tomjoseph@in.ibm.com" <tomjoseph@in.ibm.com>, "iwona.winiarska@intel.com"
> <iwona.winiarska@intel.com>, "piotr.matuszczak@intel.com" <
> piotr.matuszczak@intel.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>, "
> sumanth.bhat@linux.intel.com" <sumanth.bhat@linux.intel.com>, "Mihm,
> James" <James.Mihm@Intel.com>
> *Subject: *Reg OpenBMC PMCI Workgroup
>
>
>
> All,
>
> In order to co-ordinate the PMCI implementation in OpenBMC (MCTP, PLDM,
> SPDM etc.), thought of having OpenBMC PMCI workgroup. Workgroups main
> objective will be to discuss PMCI related design, and to speed up the
> implementation in a collaborative manner with the community. This has
> already been discussed in IRC, and few people already showed interest in
> having a weekly / bi-weekly call for the same.
>
> Let me know if you are interested in joining and contributing the same,
> and what time will be convenient for you. Finding time convenient for all
> time zone=E2=80=99s will be difficult but will try to see. So far people =
from
> Bangalore, Australia & Poland have shown interest / already contributing,
> and hence listed out times convenient for them. Please reply to me your
> convenient time, if below mentioned time doesn=E2=80=99t suit. (Based on =
the reply,
> will try to select).
>
> Option1 : Monday -  3 PM to 4 PM IST (10:30 to 11:30 AM Poland / 8:30 to
> 9:30 PM ACT).
>
> Option2: Tuesday  (Same as above)
>
> Option 3: Monday - An hour earlier. (2 PM to 3 PM IST (9:30 to 10:30 AM
> Poland / 7:30 to 8:30 PM ACT).
>
> Option 4: Tuesday =E2=80=93 same time as option 3
>
>
>
> Regards,
>
> Richard
>

--000000000000f1783c059ce9b405
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Richard,<div><br></div><div>+1 on interest from PST tim=
e zone.=C2=A0 I know I&#39;ve personally been struggling with how to get me=
etings that cover most timezones.=C2=A0 I&#39;m starting to think that a po=
ssible system is to alternating between two set times.=C2=A0 That way most =
people can be somewhat involved.<br></div><div><br></div><div>Regards,</div=
><div>Richard</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, Jan 21, 2020 at 11:01 AM Vijay Khemka &lt;<a hre=
f=3D"mailto:vijaykhemka@fb.com" target=3D"_blank">vijaykhemka@fb.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div>
<p class=3D"MsoNormal">Hi Richard,<u></u><u></u></p>
<p class=3D"MsoNormal">I would love to be part of this group but I am in PS=
T so none of those time would work.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Regards<u></u><u></u></p>
<p class=3D"MsoNormal">-Vijay<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(181,196,223);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From: =
</span></b><span style=3D"font-size:12pt;color:black">openbmc &lt;openbmc-b=
ounces+vijaykhemka=3D<a href=3D"mailto:fb.com@lists.ozlabs.org" target=3D"_=
blank">fb.com@lists.ozlabs.org</a>&gt; on behalf of &quot;Thomaiyar, Richar=
d Marian&quot; &lt;<a href=3D"mailto:richard.marian.thomaiyar@linux.intel.c=
om" target=3D"_blank">richard.marian.thomaiyar@linux.intel.com</a>&gt;<br>
<b>Date: </b>Tuesday, January 21, 2020 at 7:08 AM<br>
<b>To: </b>OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org"=
 target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;, Andrew Jeffery &lt;<a =
href=3D"mailto:andrew@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt;, =
Deepak Kodihalli &lt;<a href=3D"mailto:dkodihal@linux.vnet.ibm.com" target=
=3D"_blank">dkodihal@linux.vnet.ibm.com</a>&gt;, &quot;<a href=3D"mailto:to=
mjoseph@in.ibm.com" target=3D"_blank">tomjoseph@in.ibm.com</a>&quot; &lt;<a=
 href=3D"mailto:tomjoseph@in.ibm.com" target=3D"_blank">tomjoseph@in.ibm.co=
m</a>&gt;, &quot;<a href=3D"mailto:iwona.winiarska@intel.com" target=3D"_bl=
ank">iwona.winiarska@intel.com</a>&quot; &lt;<a href=3D"mailto:iwona.winiar=
ska@intel.com" target=3D"_blank">iwona.winiarska@intel.com</a>&gt;, &quot;<=
a href=3D"mailto:piotr.matuszczak@intel.com" target=3D"_blank">piotr.matusz=
czak@intel.com</a>&quot;
 &lt;<a href=3D"mailto:piotr.matuszczak@intel.com" target=3D"_blank">piotr.=
matuszczak@intel.com</a>&gt;, Brad Bishop &lt;<a href=3D"mailto:bradleyb@fu=
zziesquirrel.com" target=3D"_blank">bradleyb@fuzziesquirrel.com</a>&gt;, &q=
uot;<a href=3D"mailto:sumanth.bhat@linux.intel.com" target=3D"_blank">suman=
th.bhat@linux.intel.com</a>&quot; &lt;<a href=3D"mailto:sumanth.bhat@linux.=
intel.com" target=3D"_blank">sumanth.bhat@linux.intel.com</a>&gt;, &quot;Mi=
hm, James&quot; &lt;James.Mihm@Intel.com&gt;<br>
<b>Subject: </b>Reg OpenBMC PMCI Workgroup<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal">All,
<u></u><u></u></p>
<p class=3D"MsoNormal">In order to co-ordinate the PMCI implementation in O=
penBMC (MCTP, PLDM, SPDM etc.), thought of having OpenBMC PMCI workgroup. W=
orkgroups main objective will be to discuss PMCI related
 design, and to speed up the implementation in a collaborative manner with =
the community. This has already been discussed in IRC, and few people alrea=
dy showed interest in having a weekly / bi-weekly call for the same.
<u></u><u></u></p>
<p class=3D"MsoNormal">Let me know if you are interested in joining and con=
tributing the same, and what time will be convenient for you. Finding time =
convenient for all time zone=E2=80=99s will be difficult but
 will try to see. So far people from Bangalore, Australia &amp; Poland have=
 shown interest / already contributing, and hence listed out times convenie=
nt for them. Please reply to me your convenient time, if below mentioned ti=
me doesn=E2=80=99t suit. (Based on the reply,
 will try to select). <u></u><u></u></p>
<p class=3D"MsoNormal">Option1 : Monday -=C2=A0 3 PM to 4 PM IST (10:30 to =
11:30 AM Poland / 8:30 to 9:30 PM ACT).<u></u><u></u></p>
<p class=3D"MsoNormal">Option2: Tuesday=C2=A0 (Same as above)<u></u><u></u>=
</p>
<p class=3D"MsoNormal">Option 3: Monday - An hour earlier. (2 PM to 3 PM IS=
T (9:30 to 10:30 AM Poland / 7:30 to 8:30 PM ACT).<u></u><u></u></p>
<p class=3D"MsoNormal">Option 4: Tuesday =E2=80=93 same time as option 3<u>=
</u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Regards,<u></u><u></u></p>
<p class=3D"MsoNormal">Richard<u></u><u></u></p>
</div>
</div>

</blockquote></div>

--000000000000f1783c059ce9b405--
