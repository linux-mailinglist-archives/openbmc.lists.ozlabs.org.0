Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF459B5A0
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 19:38:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FTCK2bVbzDrdF
	for <lists+openbmc@lfdr.de>; Sat, 24 Aug 2019 03:38:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="IEmi3Lww"; 
 dkim-atps=neutral
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FTBZ2qnjzDrVB
 for <openbmc@lists.ozlabs.org>; Sat, 24 Aug 2019 03:37:57 +1000 (AEST)
Received: by mail-io1-xd2f.google.com with SMTP id t3so21805146ioj.12
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 10:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wl8+uIQ3RnLtn8CzTgoZQAojAgDTkBXqBkdrCI8Z3Ng=;
 b=IEmi3LwwEooMzn9oS1ExoKRqELIU38EDAW3ieoZ1K472pQRgUY7rkaC+aCYnkuDduJ
 3jOT3YtW95/6kdppnbAe2cXurGm7BAz+1m0rVUyboWjo12bbzDIcP6kBh142x2dpa2zb
 CMmDn0FmAzJNBJFV3YKE6qJgEVbw9rVIM0Ql7JJyDVEO+QFxFQyrJESCpp8RPm4u7CXS
 vIhpeYnL4BAxE6VZ2CF4YWHd0X8zePaGH1dlY3up3lfdYYqC69UsM9aB5wXqUWHcLCr2
 1FB7aunKmqPjQWlwmfP3Bqz1XAkewVay7REwYIzZAVksIlZ99KSCT9hZoSGzgzkSnp0X
 LzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wl8+uIQ3RnLtn8CzTgoZQAojAgDTkBXqBkdrCI8Z3Ng=;
 b=tsnSAE1ANaCZwbT80qSM6FJhQMmmwz8MF8Ms1lm3caTqJL3B0kU3gDXgae1fGLZV5I
 ENISLn4rnRj7OZCu8hneliO8pOH18TOsQaYqZK9fxIZPYYRqsvydN0HtCZJaC58TztBM
 8p3Rwcz/hFLmlU7/vsy0vrZ+wvgpDfvo3DmhaGCjBvn8RiwtGlJt0xtU6ZSQvKW8gBPN
 ur+MaIzjWXtkMYbh5bPwH3RbJAN4g0IX8I/kBuRCEivHWtec+nXDI9ouszcuwLolDcy1
 UG4iA61+rwBKG2op3xkwerR3RUvHvQy812IVmEUUEeHOq4QiuEIe6Xo4oKhwWoQsUBQV
 4naA==
X-Gm-Message-State: APjAAAWzsdxd1s1tjwrsSLSuTw4WAQHYPiEvrNCVW8a47ErZ0XRiC/j3
 Tdd7hfkwpWhi6DW7qh+4dXgD97Rf5rRrtEzRXtARRg==
X-Google-Smtp-Source: APXvYqxDsDkf/NnzimkdnxjSNuQgnHwV5vl/h1miuWRO04L+PirlZjPatcsSAZgwobbk/u+lLhCaAjSod2EsCytUKwQ=
X-Received: by 2002:a02:ce35:: with SMTP id v21mr5803877jar.108.1566581874016; 
 Fri, 23 Aug 2019 10:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <fbf557cba2d045b3a57d0adc508ae727@AUSX13MPS306.AMER.DELL.COM>
 <BYAPR21MB1191F6E61DC3BF7CA78C37CAC8AA0@BYAPR21MB1191.namprd21.prod.outlook.com>
 <cf52a78d26364365820f5b70e80ef422@AUSX13MPS306.AMER.DELL.COM>
 <9bda945a-f6b7-495a-098a-4c6399476a52@linux.vnet.ibm.com>
 <7C51D2AB-7154-43C4-9B6A-03C3FD27DF23@fb.com>
 <be08f05341ad4878bf736fa0a0a7fef4@AUSX13MPS302.AMER.DELL.COM>
 <F8031E46-95CA-4F10-8971-4B06CE546102@fb.com>
In-Reply-To: <F8031E46-95CA-4F10-8971-4B06CE546102@fb.com>
From: Kun Yi <kunyi@google.com>
Date: Fri, 23 Aug 2019 10:37:26 -0700
Message-ID: <CAGMNF6Uzv8Afr2-PnSnyOjdeM53wxzjy_NRgKp+YvTgqxn4QkA@mail.gmail.com>
Subject: Re: Telemetry Redfish Mockup location at DMTF
To: Vijay Khemka <vijaykhemka@fb.com>
Content-Type: multipart/alternative; boundary="0000000000001d287d0590cc4449"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>,
 "neladk@microsoft.com" <neladk@microsoft.com>,
 "gmills@linux.vnet.ibm.com" <gmills@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000001d287d0590cc4449
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Paul, that would be great!

On Fri, Aug 23, 2019 at 10:25 AM Vijay Khemka <vijaykhemka@fb.com> wrote:

> Thanks Paul,
> I am sure it will help openbmc developers.
>
> Regards
> -Vijay
>
> =EF=BB=BFOn 8/22/19, 2:47 PM, "Paul.Vancil@dell.com" <Paul.Vancil@dell.co=
m> wrote:
>
>     Vijay,
>     Since DMTF has not released it as public and it has quite a few error=
s
> in it, they don=E2=80=99t want to until fixed.
>     I will create an OpenBMC Telemetry mockup that looks more OpenBMC lik=
e
> based on OpenBMC platform mockups I have pulled at plugfests.
>     Then I'll put the corrected Telemetry resources under that.
>
>     Thanks
>     paulv
>
>     -----Original Message-----
>     From: Vijay Khemka <vijaykhemka@fb.com>
>     Sent: Thursday, August 22, 2019 3:28 PM
>     To: Gunnar Mills; Vancil, Paul; neladk@microsoft.com;
> openbmc@lists.ozlabs.org
>     Subject: Re: Telemetry Redfish Mockup location at DMTF
>
>
>     [EXTERNAL EMAIL]
>
>
>
>     On 8/21/19, 2:38 PM, "openbmc on behalf of Gunnar Mills"
> <openbmc-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of
> gmills@linux.vnet.ibm.com> wrote:
>
>
>         On 8/21/2019 12:08 PM, Paul.Vancil@dell.com wrote:
>         > Neeraj,
>         > It works if you have access to the github.com/DMTF/Redfish repo=
.
>     We as Facebook also don't have access to this private repo. Can you
> please move this into our openbmc repo.
>
>         Hi Neeraj,
>
>         Link worked for me as well.
>         Microsoft is a Redfish Forum Supporter so you should be able to
> get
>         access to the github.com/DMTF/Redfish repo by:
>
>         1. Joining the DMTF here:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.dmtf.org_join&=
d=3DDwIDaQ&c=3D5VD0RTtNlTh3ycd41b3MUw&r=3Dv9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcr=
IaqU7USl5g&m=3DCRLT0Mj8dIHh7TsfJyYVTbIn1IdB_SL5AreZnOliaZM&s=3DoP3WYvhsOYh9=
WYhE3FTtugavIQd3g1K0ACukoZJ9nI0&e=3D
>         2. After joining the DMTF, join the Redfish forum here:
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__members.dmtf.org_a=
pps_org_workgroup_portal_&d=3DDwIDaQ&c=3D5VD0RTtNlTh3ycd41b3MUw&r=3Dv9MU0Ki=
9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&m=3DCRLT0Mj8dIHh7TsfJyYVTbIn1IdB_SL5Ar=
eZnOliaZM&s=3D4LUyq3jKZk1--RO8oeVO0kKD08900lQBKzVn8HDS5qg&e=3D
>                  Menu > Group > All Groups -- Select "Redfish Forum"
>         3. Send an email to the Redfish forum asking for your GitHub ID t=
o
> be
>         given access to the private Redfish repository
>
>         - Gunnar
>
>
>         > For those who have access to the DMTF private repo on github,
> The location of the current Telemetry mockup is:
>         >
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__nam06.safelinks.pr=
otection.outlook.com_-3Furl-3Dhttps-253A-252F-252Fgithub.com-252FDMTF-252FR=
edfish-252Ftree-252Fmaster-252Fmockups-252Fpublic-2Dtelemetry-26amp-3Bdata-=
3D02-257C01-257Cneladk-2540microsoft.com-257C23e27aa9627a47be38be08d725d4d0=
f5-257C72f988bf86f141af91ab2d7cd011db47-257C1-257C0-257C637019468286104259-=
26amp-3Bsdata-3DXZs0FM7p97grbS50EuS0lAWk-252Br-252BaMuGxReRSxgZ1Lvs-253D-26=
amp-3Breserved-3D0&d=3DDwIDaQ&c=3D5VD0RTtNlTh3ycd41b3MUw&r=3Dv9MU0Ki9pWnTXC=
WwjHPVgpnCR80vXkkcrIaqU7USl5g&m=3DCRLT0Mj8dIHh7TsfJyYVTbIn1IdB_SL5AreZnOlia=
ZM&s=3Dcut7-U8mr2c2_ni-6AzSwIBxkTNTgMOH7zFwNCrEe7Q&e=3D
>         >
>
>
>
>
>

--=20
Regards,
Kun

--0000000000001d287d0590cc4449
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Paul, that would be=C2=A0great!</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 23, 2019=
 at 10:25 AM Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.com">vijaykh=
emka@fb.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Thanks Paul,<br>
I am sure it will help openbmc developers.<br>
<br>
Regards<br>
-Vijay<br>
<br>
=EF=BB=BFOn 8/22/19, 2:47 PM, &quot;<a href=3D"mailto:Paul.Vancil@dell.com"=
 target=3D"_blank">Paul.Vancil@dell.com</a>&quot; &lt;<a href=3D"mailto:Pau=
l.Vancil@dell.com" target=3D"_blank">Paul.Vancil@dell.com</a>&gt; wrote:<br=
>
<br>
=C2=A0 =C2=A0 Vijay,<br>
=C2=A0 =C2=A0 Since DMTF has not released it as public and it has quite a f=
ew errors in it, they don=E2=80=99t want to until fixed.<br>
=C2=A0 =C2=A0 I will create an OpenBMC Telemetry mockup that looks more Ope=
nBMC like based on OpenBMC platform mockups I have pulled at plugfests.<br>
=C2=A0 =C2=A0 Then I&#39;ll put the corrected Telemetry resources under tha=
t.<br>
<br>
=C2=A0 =C2=A0 Thanks<br>
=C2=A0 =C2=A0 paulv<br>
<br>
=C2=A0 =C2=A0 -----Original Message-----<br>
=C2=A0 =C2=A0 From: Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.com" =
target=3D"_blank">vijaykhemka@fb.com</a>&gt; <br>
=C2=A0 =C2=A0 Sent: Thursday, August 22, 2019 3:28 PM<br>
=C2=A0 =C2=A0 To: Gunnar Mills; Vancil, Paul; <a href=3D"mailto:neladk@micr=
osoft.com" target=3D"_blank">neladk@microsoft.com</a>; <a href=3D"mailto:op=
enbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a><br>
=C2=A0 =C2=A0 Subject: Re: Telemetry Redfish Mockup location at DMTF<br>
<br>
<br>
=C2=A0 =C2=A0 [EXTERNAL EMAIL] <br>
<br>
<br>
<br>
=C2=A0 =C2=A0 On 8/21/19, 2:38 PM, &quot;openbmc on behalf of Gunnar Mills&=
quot; &lt;openbmc-bounces+vijaykhemka=3D<a href=3D"mailto:fb.com@lists.ozla=
bs.org" target=3D"_blank">fb.com@lists.ozlabs.org</a> on behalf of <a href=
=3D"mailto:gmills@linux.vnet.ibm.com" target=3D"_blank">gmills@linux.vnet.i=
bm.com</a>&gt; wrote:<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 On 8/21/2019 12:08 PM, <a href=3D"mailto:Paul.V=
ancil@dell.com" target=3D"_blank">Paul.Vancil@dell.com</a> wrote:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; Neeraj,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; It works if you have access to the <a href=
=3D"http://github.com/DMTF/Redfish" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/DMTF/Redfish</a> repo.<br>
=C2=A0 =C2=A0 We as Facebook also don&#39;t have access to this private rep=
o. Can you please move this into our openbmc repo.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Hi Neeraj,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Link worked for me as well.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Microsoft is a Redfish Forum Supporter so you s=
hould be able to get <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 access to the <a href=3D"http://github.com/DMTF=
/Redfish" rel=3D"noreferrer" target=3D"_blank">github.com/DMTF/Redfish</a> =
repo by:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1. Joining the DMTF here: <a href=3D"https://ur=
ldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.dmtf.org_join&amp;d=3DDwID=
aQ&amp;c=3D5VD0RTtNlTh3ycd41b3MUw&amp;r=3Dv9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcr=
IaqU7USl5g&amp;m=3DCRLT0Mj8dIHh7TsfJyYVTbIn1IdB_SL5AreZnOliaZM&amp;s=3DoP3W=
YvhsOYh9WYhE3FTtugavIQd3g1K0ACukoZJ9nI0&amp;e=3D" rel=3D"noreferrer" target=
=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.dmtf=
.org_join&amp;d=3DDwIDaQ&amp;c=3D5VD0RTtNlTh3ycd41b3MUw&amp;r=3Dv9MU0Ki9pWn=
TXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&amp;m=3DCRLT0Mj8dIHh7TsfJyYVTbIn1IdB_SL5Ar=
eZnOliaZM&amp;s=3DoP3WYvhsOYh9WYhE3FTtugavIQd3g1K0ACukoZJ9nI0&amp;e=3D</a> =
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 2. After joining the DMTF, join the Redfish for=
um here: <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://urldefense.proofpoint.com/v2=
/url?u=3Dhttps-3A__members.dmtf.org_apps_org_workgroup_portal_&amp;d=3DDwID=
aQ&amp;c=3D5VD0RTtNlTh3ycd41b3MUw&amp;r=3Dv9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcr=
IaqU7USl5g&amp;m=3DCRLT0Mj8dIHh7TsfJyYVTbIn1IdB_SL5AreZnOliaZM&amp;s=3D4LUy=
q3jKZk1--RO8oeVO0kKD08900lQBKzVn8HDS5qg&amp;e=3D" rel=3D"noreferrer" target=
=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__members.=
dmtf.org_apps_org_workgroup_portal_&amp;d=3DDwIDaQ&amp;c=3D5VD0RTtNlTh3ycd4=
1b3MUw&amp;r=3Dv9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&amp;m=3DCRLT0Mj8=
dIHh7TsfJyYVTbIn1IdB_SL5AreZnOliaZM&amp;s=3D4LUyq3jKZk1--RO8oeVO0kKD08900lQ=
BKzVn8HDS5qg&amp;e=3D</a> <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Menu &gt; Gro=
up &gt; All Groups -- Select &quot;Redfish Forum&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 3. Send an email to the Redfish forum asking fo=
r your GitHub ID to be <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 given access to the private Redfish repository<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Gunnar<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; For those who have access to the DMTF priv=
ate repo on github, The location of the current Telemetry mockup is:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0<a href=3D"https://urldefense.=
proofpoint.com/v2/url?u=3Dhttps-3A__nam06.safelinks.protection.outlook.com_=
-3Furl-3Dhttps-253A-252F-252Fgithub.com-252FDMTF-252FRedfish-252Ftree-252Fm=
aster-252Fmockups-252Fpublic-2Dtelemetry-26amp-3Bdata-3D02-257C01-257Cnelad=
k-2540microsoft.com-257C23e27aa9627a47be38be08d725d4d0f5-257C72f988bf86f141=
af91ab2d7cd011db47-257C1-257C0-257C637019468286104259-26amp-3Bsdata-3DXZs0F=
M7p97grbS50EuS0lAWk-252Br-252BaMuGxReRSxgZ1Lvs-253D-26amp-3Breserved-3D0&am=
p;d=3DDwIDaQ&amp;c=3D5VD0RTtNlTh3ycd41b3MUw&amp;r=3Dv9MU0Ki9pWnTXCWwjHPVgpn=
CR80vXkkcrIaqU7USl5g&amp;m=3DCRLT0Mj8dIHh7TsfJyYVTbIn1IdB_SL5AreZnOliaZM&am=
p;s=3Dcut7-U8mr2c2_ni-6AzSwIBxkTNTgMOH7zFwNCrEe7Q&amp;e=3D" rel=3D"noreferr=
er" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=
__nam06.safelinks.protection.outlook.com_-3Furl-3Dhttps-253A-252F-252Fgithu=
b.com-252FDMTF-252FRedfish-252Ftree-252Fmaster-252Fmockups-252Fpublic-2Dtel=
emetry-26amp-3Bdata-3D02-257C01-257Cneladk-2540microsoft.com-257C23e27aa962=
7a47be38be08d725d4d0f5-257C72f988bf86f141af91ab2d7cd011db47-257C1-257C0-257=
C637019468286104259-26amp-3Bsdata-3DXZs0FM7p97grbS50EuS0lAWk-252Br-252BaMuG=
xReRSxgZ1Lvs-253D-26amp-3Breserved-3D0&amp;d=3DDwIDaQ&amp;c=3D5VD0RTtNlTh3y=
cd41b3MUw&amp;r=3Dv9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&amp;m=3DCRLT0=
Mj8dIHh7TsfJyYVTbIn1IdB_SL5AreZnOliaZM&amp;s=3Dcut7-U8mr2c2_ni-6AzSwIBxkTNT=
gMOH7zFwNCrEe7Q&amp;e=3D</a> <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Regards,<div>Kun</div></div></d=
iv>

--0000000000001d287d0590cc4449--
