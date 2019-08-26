Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D679D5F8
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2019 20:45:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HLYK2Jp9zDqmC
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 04:45:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com;
 envelope-from=james.mihm@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MDse3OJW"; 
 dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HLXd50fwzDqlL
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 04:45:05 +1000 (AEST)
Received: by mail-yb1-xb2d.google.com with SMTP id u68so7344368ybg.1
 for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2019 11:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o1QGiv1qP8e4q98jDBqoXVZXbJboxDKda8bmTZWb+FY=;
 b=MDse3OJWScjqK3XAg+bJ1NzGfsMy1GDI+cbpSRgmsefDQ6VauXRROZNjIJwcIZOPQK
 rLD7iUCWKhbv/7rK74qCK36tVFZwRCqhCz1K3M9PP6pu9NUuMkbmCVm6rDZZpAWFMbcm
 3wQXiRr2Sl+srQxzAyEwCXTiur82rlw5Ixq6B2TuIeRAxA/n4UV3WR0lPDsNoqNz9yfV
 FM8vwaF4Kw+3OzQ5Tll6rs5hF30GKfgWMehvmNCk4LiMF9fkUxHZPLr2az9tbFbI0Sw6
 6evfMoUVS1thMYZAay6pRq/M1Z0ZMuGLkHe7NwB++TJen3GwXNShkPiaRdT3e1TEtRud
 V+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o1QGiv1qP8e4q98jDBqoXVZXbJboxDKda8bmTZWb+FY=;
 b=lgwMcEgf+q1ruM/2che4yXsnUlgIEVKa9WPTO8Qe6SzbECCxT8Sby+jik1yA/f+hs2
 9VpBJVPWBXnwAtw1zzNgGDJUl4GWQ+wMWoYQ8KHplsRRd/A776ZnJcWGkFMMkhj2pis6
 zsn+g5kHeOs75s9fjNYT27GTp9D43w/ZNBJ+OOzjVn4CrZzSAVANCcrZNZIAEgU9XUBH
 wrEO2SKgkHlM83yAU1x55MoRTMKI94zuM0d//MOf1dql0BJcVdbuuJk33bBZXBJmNjBO
 zQTdrReLM/HniLURCPi/P+BPTB4eFByEXDt42uY+S1di8l3sv+TwEPFQwqfqP+ozynKi
 aJhw==
X-Gm-Message-State: APjAAAUf5LHf58AxiQXuAEfN5j4cI4USQxVhBq9W23Esrx0FHeBQjHJg
 suQk6pmJJ9zVC6Ob7kFsfsXd68aV5tTJfvBjNYo=
X-Google-Smtp-Source: APXvYqxhX6iDMot6aw9ttigbv7l3FkZ0z/lTHKfsOhzzk/2PDZRmzSezS1hkKrKvv7JwaCpPOwl2/xFywOIKHT2QlSk=
X-Received: by 2002:a25:7652:: with SMTP id r79mr14377971ybc.258.1566845101658; 
 Mon, 26 Aug 2019 11:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <MN2PR04MB5839D33826EF08A499E32167CDA80@MN2PR04MB5839.namprd04.prod.outlook.com>
 <CADy_Pt3tvAci8tXuZ3cTJY3tRxwnWPbD=yNL05VEYrjZKWcpEw@mail.gmail.com>
 <BYAPR21MB1191A89B2C012758241C5C72C8A80@BYAPR21MB1191.namprd21.prod.outlook.com>
 <CAEfeXvbYEA-5Hg=1Zs=Di=3HyNOpoSdM51GjSLwuiX01yHg2-w@mail.gmail.com>
 <865C376D1B77624AAA570EFEF73CE52F983F2A4E@fmsmsx118.amr.corp.intel.com>
 <BYAPR21MB11916802ED44B6397460086BC8A10@BYAPR21MB1191.namprd21.prod.outlook.com>
In-Reply-To: <BYAPR21MB11916802ED44B6397460086BC8A10@BYAPR21MB1191.namprd21.prod.outlook.com>
From: James Mihm <james.mihm@gmail.com>
Date: Mon, 26 Aug 2019 11:44:25 -0700
Message-ID: <CADy_Pt0PNASL=1eeL+KsasFhQZ69JRWkHzokmJwre+Y6++GtDQ@mail.gmail.com>
Subject: Re: Socflash says the bmc is write protected.
To: Neeraj Ladkani <neladk@microsoft.com>
Content-Type: multipart/alternative; boundary="000000000000b3d6250591098df0"
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
Cc: "Khetan, Sharad" <sharad.khetan@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Christian Svensson <bluecmd@google.com>, Zheng Bao <fishbaoz@hotmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000b3d6250591098df0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The best that can be done with the AST2500 is to disable the bridges very
early in the reset handler and in a ROM'd bootloader. This has been
mitigated in the AST2600 with an option to permanently disable the bridges.

On Mon, Aug 26, 2019 at 10:49 AM Neeraj Ladkani <neladk@microsoft.com>
wrote:

> I tried to dig more and confirmed that ASPEED does not persists locks
> during SRST.
>
>
>
>    1. Existing FW solution is not viable.  Is it possible for host to
>    hide/disable IO ports that are used by SocFlash?
>    2. Are there any HW design considerations to prevent this exploit?
>
>
>
> Neeraj
>
>
>
> *From:* Khetan, Sharad <sharad.khetan@intel.com>
> *Sent:* Monday, August 26, 2019 7:38 AM
> *To:* Christian Svensson <bluecmd@google.com>; Neeraj Ladkani <
> neladk@microsoft.com>
> *Cc:* James Mihm <james.mihm@gmail.com>; openbmc@lists.ozlabs.org; Zheng
> Bao <fishbaoz@hotmail.com>
> *Subject:* RE: Socflash says the bmc is write protected.
>
>
>
> Yes the locks will persist across any Resets (BMC or Host), to mitigate
> the vulnerability.
>
>
>
> Thanks
>
> -Sharad
>
>
>
> *From:* openbmc <openbmc-bounces+sharad.khetan=3Dintel.com@lists.ozlabs.o=
rg>
> *On Behalf Of *Christian Svensson
> *Sent:* Monday, August 26, 2019 1:44 AM
> *To:* Neeraj Ladkani <neladk@microsoft.com>
> *Cc:* James Mihm <james.mihm@gmail.com>; openbmc@lists.ozlabs.org; Zheng
> Bao <fishbaoz@hotmail.com>
> *Subject:* Re: Socflash says the bmc is write protected.
>
>
>
> Which type of reset are you referring to?
>
>
>
> - Chris
>
>
>
>
>
> On Mon, Aug 19, 2019 at 10:40 PM Neeraj Ladkani <neladk@microsoft.com>
> wrote:
>
> Can anyone confirms if these locks persists during BMC reset?
>
>
>
> Neeraj
>
>
>
>
>
> *From:* openbmc <openbmc-bounces+neladk=3Dmicrosoft.com@lists.ozlabs.org>=
 *On
> Behalf Of *James Mihm
> *Sent:* Monday, August 19, 2019 7:26 AM
> *To:* Zheng Bao <fishbaoz@hotmail.com>
> *Cc:* openbmc@lists.ozlabs.org
> *Subject:* Re: Socflash says the bmc is write protected.
>
>
>
> The P2A Bridge that is used by the socflash utility has been disabled;
> see  https://nvd.nist.gov/vuln/detail/CVE-2019-6260
> <https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd.=
nist.gov%2Fvuln%2Fdetail%2FCVE-2019-6260&data=3D02%7C01%7Cneladk%40microsof=
t.com%7C86c67159b4ca4c860aa008d72a3302e0%7C72f988bf86f141af91ab2d7cd011db47=
%7C1%7C0%7C637024270920460918&sdata=3DWHVK9sr7auwRAoA9kG6giMi4MYVNlfnXHxsdQ=
eKGb9s%3D&reserved=3D0> for
> details.
>
>
>
> On Mon, Aug 19, 2019 at 5:51 AM Zheng Bao <fishbaoz@hotmail.com> wrote:
>
> Hi, All,
>
> I use socflash to update the BMC firmware. The original BMC firmware can
> be updated, but openbmc can not be.
>
> Socflash says the BMC is protected. Does anybody know why?
>
>
>
> Thanks.
>
> Joe
>
>

--000000000000b3d6250591098df0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The best that can be done with the AST2500 is to disable t=
he bridges very early in the reset handler and in a ROM&#39;d bootloader. T=
his has been mitigated in the AST2600 with an option to permanently disable=
 the bridges.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Mon, Aug 26, 2019 at 10:49 AM Neeraj Ladkani &lt;<a href=3D=
"mailto:neladk@microsoft.com">neladk@microsoft.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_-4267959366855531349WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">I tried to dig mo=
re and confirmed that ASPEED does not persists locks during SRST.
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)"><u></u>=C2=A0<u><=
/u></span></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"gmail-m_-4267959366855531349MsoListParagraph" style=3D"color:r=
gb(0,32,96);margin-left:0in">
Existing FW solution is not viable.=C2=A0 Is it possible for host to hide/d=
isable IO ports that are used by SocFlash?
<u></u><u></u></li><li class=3D"gmail-m_-4267959366855531349MsoListParagrap=
h" style=3D"color:rgb(0,32,96);margin-left:0in">
Are there any HW design considerations to prevent this exploit? <u></u><u><=
/u></li></ol>
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)"><u></u>=C2=A0<u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">Neeraj<u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)"><u></u>=C2=A0<u><=
/u></span></p>
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Khetan, Sharad &lt;<a href=3D"mailto:sh=
arad.khetan@intel.com" target=3D"_blank">sharad.khetan@intel.com</a>&gt; <b=
r>
<b>Sent:</b> Monday, August 26, 2019 7:38 AM<br>
<b>To:</b> Christian Svensson &lt;<a href=3D"mailto:bluecmd@google.com" tar=
get=3D"_blank">bluecmd@google.com</a>&gt;; Neeraj Ladkani &lt;<a href=3D"ma=
ilto:neladk@microsoft.com" target=3D"_blank">neladk@microsoft.com</a>&gt;<b=
r>
<b>Cc:</b> James Mihm &lt;<a href=3D"mailto:james.mihm@gmail.com" target=3D=
"_blank">james.mihm@gmail.com</a>&gt;; <a href=3D"mailto:openbmc@lists.ozla=
bs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>; Zheng Bao &lt;<a hr=
ef=3D"mailto:fishbaoz@hotmail.com" target=3D"_blank">fishbaoz@hotmail.com</=
a>&gt;<br>
<b>Subject:</b> RE: Socflash says the bmc is write protected.<u></u><u></u>=
</p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Yes the locks will persist across any Resets (BMC or=
 Host), to mitigate the vulnerability.
<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks<u></u><u></u></p>
<p class=3D"MsoNormal">-Sharad<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><a name=3D"m_-4267959366855531349______replyseparato=
r"></a><b>From:</b> openbmc &lt;<a href=3D"mailto:openbmc-bounces+sharad.kh=
etan=3Dintel.com@lists.ozlabs.org" target=3D"_blank">openbmc-bounces+sharad=
.khetan=3Dintel.com@lists.ozlabs.org</a>&gt;
<b>On Behalf Of </b>Christian Svensson<br>
<b>Sent:</b> Monday, August 26, 2019 1:44 AM<br>
<b>To:</b> Neeraj Ladkani &lt;<a href=3D"mailto:neladk@microsoft.com" targe=
t=3D"_blank">neladk@microsoft.com</a>&gt;<br>
<b>Cc:</b> James Mihm &lt;<a href=3D"mailto:james.mihm@gmail.com" target=3D=
"_blank">james.mihm@gmail.com</a>&gt;;
<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists=
.ozlabs.org</a>; Zheng Bao &lt;<a href=3D"mailto:fishbaoz@hotmail.com" targ=
et=3D"_blank">fishbaoz@hotmail.com</a>&gt;<br>
<b>Subject:</b> Re: Socflash says the bmc is write protected.<u></u><u></u>=
</p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Which type of reset are you=C2=A0referring to?<u></u=
><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal">- Chris<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Mon, Aug 19, 2019 at 10:40 PM Neeraj Ladkani &lt;=
<a href=3D"mailto:neladk@microsoft.com" target=3D"_blank">neladk@microsoft.=
com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin:5pt 0i=
n 5pt 4.8pt">
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">Can anyone confir=
ms if these locks persists during BMC reset?
</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">=C2=A0</span><u><=
/u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">Neeraj</span><u><=
/u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">=C2=A0</span><u><=
/u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">=C2=A0</span><u><=
/u><u></u></p>
<p class=3D"MsoNormal"><b>From:</b> openbmc &lt;openbmc-bounces+neladk=3D<a=
 href=3D"mailto:microsoft.com@lists.ozlabs.org" target=3D"_blank">microsoft=
.com@lists.ozlabs.org</a>&gt;
<b>On Behalf Of </b>James Mihm<br>
<b>Sent:</b> Monday, August 19, 2019 7:26 AM<br>
<b>To:</b> Zheng Bao &lt;<a href=3D"mailto:fishbaoz@hotmail.com" target=3D"=
_blank">fishbaoz@hotmail.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a><br>
<b>Subject:</b> Re: Socflash says the bmc is write protected.<u></u><u></u>=
</p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">The P2A Bridge that is used by the socflash utility =
has been disabled; see=C2=A0
<a href=3D"https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fnvd.nist.gov%2Fvuln%2Fdetail%2FCVE-2019-6260&amp;data=3D02%7C01%7Cnelad=
k%40microsoft.com%7C86c67159b4ca4c860aa008d72a3302e0%7C72f988bf86f141af91ab=
2d7cd011db47%7C1%7C0%7C637024270920460918&amp;sdata=3DWHVK9sr7auwRAoA9kG6gi=
Mi4MYVNlfnXHxsdQeKGb9s%3D&amp;reserved=3D0" target=3D"_blank">
https://nvd.nist.gov/vuln/detail/CVE-2019-6260</a>=C2=A0for details.<u></u>=
<u></u></p>
</div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Mon, Aug 19, 2019 at 5:51 AM Zheng Bao &lt;<a hre=
f=3D"mailto:fishbaoz@hotmail.com" target=3D"_blank">fishbaoz@hotmail.com</a=
>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin:5pt 0i=
n 5pt 4.8pt">
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;color:black">Hi, All,<=
/span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;color:black">I use soc=
flash to update the BMC firmware. The original BMC firmware can be updated,=
 but openbmc can not be.</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;color:black">Socflash =
says the BMC is protected. Does anybody know why?</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;color:black">=C2=A0</s=
pan><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;color:black">Thanks.
</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;color:black">Joe</span=
><u></u><u></u></p>
</div>
</div>
</blockquote>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</div>

</blockquote></div>

--000000000000b3d6250591098df0--
