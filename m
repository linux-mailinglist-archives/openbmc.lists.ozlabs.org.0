Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF70F9F55
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2019 01:34:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CQcH0LqxzF5Zs
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2019 11:34:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f;
 helo=mail-ed1-x52f.google.com; envelope-from=pwvancil@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lNomfbED"; 
 dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47C9Pc3bdRzF3rP
 for <openbmc@lists.ozlabs.org>; Wed, 13 Nov 2019 01:39:41 +1100 (AEDT)
Received: by mail-ed1-x52f.google.com with SMTP id r16so15127647edq.2
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 06:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1vgVCjKjIuJatYmiZfUa7WOh3edibHpsfWihftRVIVU=;
 b=lNomfbEDnzuea23rHzNLki2PVs+MNRsM7BxiiAAzx3e4gKYcMmjxvL2bsSibHU/VcS
 /b49dLniTSeOYmPo7YXac83sH35CTbR6priuuxLyB47S1JYX4TlZ31kwPhqDsLUh5gBj
 As64DGqkfK5Qog/mSqNOxTqU2t1qV6+5FoMkh39WxPxQBdd3nbMELsBpW8GPwu/Ptkc+
 GZ2l6OHOlVkqUc/oCBjO8TWQD0RGH3+Ejg0UiFUBWOZMAFr2+fLutb8Kgezp7ckvP5KB
 MlCbUJedcM63W9i8wZ+/7VuaMZMzgurHnNrSTHZHAt2Ov4SWLJXEUwPM7qah9T2IjKs2
 iuxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1vgVCjKjIuJatYmiZfUa7WOh3edibHpsfWihftRVIVU=;
 b=d68tcFyLht+9XGlayfq87G21CEom8aC+xFmwhN46SatqB7eF9n5+uqMWc8zhGX/ICt
 U3asJOS2a7bff90L7ELl6f0D7E9dvCawTjA+ex6Y0WFpek6TFIAk5VOJqRb2hgpOcxIN
 jyyy2brQs5bCz57k0wlm5yN1AK/i786A/lTxa0QexpxfrrhMn8QYT9kQqHFNW8DjUrXt
 BcG6pGQU3tZrdHp1FExgEdQ7hD/tTIepFh4beFnOyzCclwGKe33xPojl9shiFSi15P7j
 WTVbzRgfJGHme+Niq45SSQ5wyCKJ1pRtBe8yaLquH2UZEdMBp0Tx/C5Ldd4r9OSfQKMB
 GF/A==
X-Gm-Message-State: APjAAAVVR3WeGW0Fg0VsLcwgpr2ifBH4f4NVGIwZqf/Os9wMkE/ot763
 +m5X2/Lx26GyXMd4Q1pqhnSWULHh+vyCXvNHUlc=
X-Google-Smtp-Source: APXvYqwTjAerohVnCO/tnmZEeSBOBo+xcsMyE4yz90vvgcYq0l1K4tXi0q0oOqJEkG0Q5NB7N1TqLchQ8NLzQfsbr7I=
X-Received: by 2002:a17:907:1114:: with SMTP id
 qu20mr29455642ejb.42.1573569577404; 
 Tue, 12 Nov 2019 06:39:37 -0800 (PST)
MIME-Version: 1.0
References: <D1177195-CDC9-4BB0-B9DE-6FC99B7ADE31@fuzziesquirrel.com>
 <dd81fb28-4d01-8726-9b16-81a677eb3e16@linux.intel.com>
 <8998b51b-4e67-738e-becd-63c26ea626be@linux.intel.com>
 <d69d24c7-d07f-35d4-1395-859a0df2a05a@linux.vnet.ibm.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A30F946F@IRSMSX101.ger.corp.intel.com>
 <c3dd56aa-b9e2-1efd-1da6-70b0e056446f@linux.intel.com>
 <053009AE-890C-4650-9096-D4E8ABF707AA@fuzziesquirrel.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A30F9DFD@IRSMSX101.ger.corp.intel.com>
 <9ECD367E-6573-4DA8-815E-E117AD8DF56C@fuzziesquirrel.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A30FA694@IRSMSX101.ger.corp.intel.com>
 <C6A744EB-AB05-481F-AC96-09D4DE6ABE57@fuzziesquirrel.com>
 <76cf53a7-9b1f-f724-356a-28ac97c918cc@linux.vnet.ibm.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A31034F7@IRSMSX101.ger.corp.intel.com>
 <1db5a5bd-6be6-cb93-5865-99416cc31646@linux.vnet.ibm.com>
 <6474a709-fa41-2dd5-538e-e04fb6e25431@linux.vnet.ibm.com>
In-Reply-To: <6474a709-fa41-2dd5-538e-e04fb6e25431@linux.vnet.ibm.com>
From: Paul Vancil <pwvancil@gmail.com>
Date: Tue, 12 Nov 2019 09:39:26 -0500
Message-ID: <CALaYK6E5eGc5S1B5utVpCgw5xzy6=3ONpZeckTKtkQ0ARHuogw@mail.gmail.com>
Subject: Re: multiple telemetry designs
To: Justin Thaler <thalerj@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000b0d09705972737b0"
X-Mailman-Approved-At: Wed, 13 Nov 2019 11:33:01 +1100
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
Cc: "Mihm, James" <james.mihm@intel.com>,
 "neladk@microsoft.com" <neladk@microsoft.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Matuszczak,
 Piotr" <piotr.matuszczak@intel.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 James Feist <james.feist@linux.intel.com>,
 "apparao.puli@linux.intel.com" <apparao.puli@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000b0d09705972737b0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Paul here.
I also commented and approved the intel design.
It looks good to me.


On Tue, Nov 12, 2019 at 9:36 AM Justin Thaler <thalerj@linux.vnet.ibm.com>
wrote:

>
>
> On 11/5/19 10:58 AM, vishwa wrote:
> > Thanks.
> >
> > So, looks like we are getting zeroed in on Intel's proposal ?. I see Ku=
n
> > approving Intel version.
> >
> > Paul: Did you have anything ?
> >
> > !! Vishwa !!
> >
> > On 11/5/19 2:26 PM, Matuszczak, Piotr wrote:
> >> Hi,
> >>
> >> I looked at this design briefly and it seems to be focusing on Redfish
> >> Telemetry Service implementation, which our design
> >> (https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24357) also
> >> covers. Dell's design assumes using collecd for gathering sensor
> >> readings.
> >
> >> -----Original Message-----
> >> From: vishwa [mailto:vishwa@linux.vnet.ibm.com]
> >> Sent: Tuesday, November 5, 2019 8:31 AM
> >> To: Brad Bishop <bradleyb@fuzziesquirrel.com>
> >> Cc: Mihm, James <james.mihm@intel.com>; Justin Thaler
> >> <thalerj@linux.vnet.ibm.com>; openbmc@lists.ozlabs.org;
> >> neladk@microsoft.com; James Feist <james.feist@linux.intel.com>;
> >> apparao.puli@linux.intel.com; Matuszczak, Piotr
> >> <piotr.matuszczak@intel.com>
> >> Subject: Re: multiple telemetry designs
> >>
> >> There is also this version from Dell:
> >> https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/23758/. Was this
> >> considered in this discussion ?.
> >>
> >> Also, from IBM's standpoint, Justin Thaler was mentioning that we
> >> wanted a "true subscription" model, in that, clients can pick and
> >> chose the specific sensors.
> >>
> >> Justin: Could you add here please ?
> Sorry for the slow response. Piotr was kind enough to walk me through
> how the proposal works and it does allow for a true subscription model.
> I still have a to do to determine how much data we will be using with
> this model so I can understand how well it scales. This is a concern for
> us as we are shifting from receiving sensor updates in an "on-change"
> model to updates every second, regardless of change. There's also
> changes in the data format that's sent, which will likely make this less
> of a concern.
>
> Thanks,
> Justin
>
> >>
> >> !! Vishwa !!
> >>
> >> On 10/28/19 10:12 PM, Brad Bishop wrote:
> >>>> On Oct 28, 2019, at 12:35 PM, Matuszczak, Piotr
> >>>> <piotr.matuszczak@intel.com> wrote:
> >>>>
> >>>> I would like to make the code opened from the very beginning.
> >>> Glad to hear it - that sounds like the best way to me :-)
> >>>
> >>> FWIW, whenever you are ready to share it, I=E2=80=99d still like to s=
ee
> >>> whatever code Intel has for the monitoring service.  It will help me
> >>> understand your design better.  It is fine if it has bugs or it isn=
=E2=80=99t
> >>> polished.  Thanks Piotr.
> >>>
> >>> -brad
>

--000000000000b0d09705972737b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Paul here.=C2=A0</div></div><div dir=3D"auto">I also=
 commented and approved the intel design.=C2=A0</div><div dir=3D"auto">It l=
ooks good to me.=C2=A0</div><div dir=3D"auto"><br></div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 12, 2019=
 at 9:36 AM Justin Thaler &lt;<a href=3D"mailto:thalerj@linux.vnet.ibm.com"=
>thalerj@linux.vnet.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><br>
<br>
On 11/5/19 10:58 AM, vishwa wrote:<br>
&gt; Thanks.<br>
&gt; <br>
&gt; So, looks like we are getting zeroed in on Intel&#39;s proposal ?. I s=
ee Kun <br>
&gt; approving Intel version.<br>
&gt; <br>
&gt; Paul: Did you have anything ?<br>
&gt; <br>
&gt; !! Vishwa !!<br>
&gt; <br>
&gt; On 11/5/19 2:26 PM, Matuszczak, Piotr wrote:<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; I looked at this design briefly and it seems to be focusing on Red=
fish <br>
&gt;&gt; Telemetry Service implementation, which our design <br>
&gt;&gt; (<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24=
357" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-project.xy=
z/c/openbmc/docs/+/24357</a>) also <br>
&gt;&gt; covers. Dell&#39;s design assumes using collecd for gathering sens=
or <br>
&gt;&gt; readings.<br>
&gt; <br>
&gt;&gt; -----Original Message-----<br>
&gt;&gt; From: vishwa [mailto:<a href=3D"mailto:vishwa@linux.vnet.ibm.com" =
target=3D"_blank">vishwa@linux.vnet.ibm.com</a>]<br>
&gt;&gt; Sent: Tuesday, November 5, 2019 8:31 AM<br>
&gt;&gt; To: Brad Bishop &lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com"=
 target=3D"_blank">bradleyb@fuzziesquirrel.com</a>&gt;<br>
&gt;&gt; Cc: Mihm, James &lt;<a href=3D"mailto:james.mihm@intel.com" target=
=3D"_blank">james.mihm@intel.com</a>&gt;; Justin Thaler <br>
&gt;&gt; &lt;<a href=3D"mailto:thalerj@linux.vnet.ibm.com" target=3D"_blank=
">thalerj@linux.vnet.ibm.com</a>&gt;; <a href=3D"mailto:openbmc@lists.ozlab=
s.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>; <br>
&gt;&gt; <a href=3D"mailto:neladk@microsoft.com" target=3D"_blank">neladk@m=
icrosoft.com</a>; James Feist &lt;<a href=3D"mailto:james.feist@linux.intel=
.com" target=3D"_blank">james.feist@linux.intel.com</a>&gt;; <br>
&gt;&gt; <a href=3D"mailto:apparao.puli@linux.intel.com" target=3D"_blank">=
apparao.puli@linux.intel.com</a>; Matuszczak, Piotr <br>
&gt;&gt; &lt;<a href=3D"mailto:piotr.matuszczak@intel.com" target=3D"_blank=
">piotr.matuszczak@intel.com</a>&gt;<br>
&gt;&gt; Subject: Re: multiple telemetry designs<br>
&gt;&gt;<br>
&gt;&gt; There is also this version from Dell:<br>
&gt;&gt; <a href=3D"https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/2=
3758/" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-project.=
xyz/#/c/openbmc/docs/+/23758/</a>. Was this <br>
&gt;&gt; considered in this discussion ?.<br>
&gt;&gt;<br>
&gt;&gt; Also, from IBM&#39;s standpoint, Justin Thaler was mentioning that=
 we <br>
&gt;&gt; wanted a &quot;true subscription&quot; model, in that, clients can=
 pick and <br>
&gt;&gt; chose the specific sensors.<br>
&gt;&gt;<br>
&gt;&gt; Justin: Could you add here please ?<br>
Sorry for the slow response. Piotr was kind enough to walk me through <br>
how the proposal works and it does allow for a true subscription model. <br=
>
I still have a to do to determine how much data we will be using with <br>
this model so I can understand how well it scales. This is a concern for <b=
r>
us as we are shifting from receiving sensor updates in an &quot;on-change&q=
uot; <br>
model to updates every second, regardless of change. There&#39;s also <br>
changes in the data format that&#39;s sent, which will likely make this les=
s <br>
of a concern.<br>
<br>
Thanks,<br>
Justin<br>
<br>
&gt;&gt;<br>
&gt;&gt; !! Vishwa !!<br>
&gt;&gt;<br>
&gt;&gt; On 10/28/19 10:12 PM, Brad Bishop wrote:<br>
&gt;&gt;&gt;&gt; On Oct 28, 2019, at 12:35 PM, Matuszczak, Piotr <br>
&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:piotr.matuszczak@intel.com" target=
=3D"_blank">piotr.matuszczak@intel.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I would like to make the code opened from the very beginni=
ng.<br>
&gt;&gt;&gt; Glad to hear it - that sounds like the best way to me :-)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; FWIW, whenever you are ready to share it, I=E2=80=99d still li=
ke to see <br>
&gt;&gt;&gt; whatever code Intel has for the monitoring service.=C2=A0 It w=
ill help me <br>
&gt;&gt;&gt; understand your design better.=C2=A0 It is fine if it has bugs=
 or it isn=E2=80=99t <br>
&gt;&gt;&gt; polished.=C2=A0 Thanks Piotr.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -brad<br>
</blockquote></div></div>

--000000000000b0d09705972737b0--
