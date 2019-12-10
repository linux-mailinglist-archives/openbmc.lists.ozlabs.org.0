Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07168117DFF
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 03:55:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47X4SX0VJ4zDqW6
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 13:55:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d34;
 helo=mail-io1-xd34.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JeYRqQAx"; 
 dkim-atps=neutral
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47X4Rl71cBzDqVd
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 13:55:07 +1100 (AEDT)
Received: by mail-io1-xd34.google.com with SMTP id k24so17172626ioc.4
 for <openbmc@lists.ozlabs.org>; Mon, 09 Dec 2019 18:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Wsa/EpHOEH7Cf2jhkeNAcIARQg4x9MFhyU+aL358qI=;
 b=JeYRqQAxfTT/eu/sQnoGX4XWmK9ofFq97EioDC3OTeUplcpq2O/Roye49T5c33hKUU
 FkZwtJKAmm47G7iPhODcCjHXqOja87+O6p5rkNKFSw/EOWWvNaxToKGtPHDxPckbIFc2
 nY7G2DqbzT9oEjD21mPqxsLdEzVW5fZYXxTDgayC53HZh0GXsfcYYhy2T7rY5PvU2OVV
 FiHM3K+pmK+pqkVbhx2nGXMSIJlIUjm1C+w71heMZY62oVCECLKEr2BsrgvAUfTq8wUv
 KMN8r+NkPjNzw7hcGj5mPh6YYwMLi3lgj6dewRhCLZ1dpZhILsjhn94VSR5vSHWFQEn1
 ZBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Wsa/EpHOEH7Cf2jhkeNAcIARQg4x9MFhyU+aL358qI=;
 b=OSF7bUKQfPWBF52Goa8oGcCPMHfecG/ktwWS89ZN2QJ9FopeJxgXkL2f7uYvCl8Bh+
 A0Fe3nqED+SSQ7d6V9EQUm06W4fetnMj+D8JOELh3Z5OVa4hq9TAsbID2bBKe5FXAjie
 DQa0FHEfKwYU5Vx/z0H5aELc1BTLYh5CynjTrDisO5cM3i1ZfmRk5gjq17uKZwvcZXn6
 /AzPiN/z4/jdnC1KzuzPYpWKooGNSXgtkbJZS6l+tzEc4lz9rLLB0p05XOQNX6E0L4Co
 chMsnHu4E5lQHP71AGlCa7539J64MrANfMa8V3L/3vlxdnTP91Hj8RelfQAhyTCnvpt5
 /6VA==
X-Gm-Message-State: APjAAAWD7+/JAKhrOK5B1/OT/OfFJ48Jw0HPmxo4Uyr8tl3LzVlYTYW8
 GEiqTuKWn7HMXkAFDXrF/1HTqFUC1ExhHBPH4JoRGA==
X-Google-Smtp-Source: APXvYqzJQEVEMM4fk7eAHFZHJy2bpL5mh3rgMuSQFBFuXtTelJQcDu9s5PRqepz9o0qP3Xw0hIsAXsQmAaMVdedZ6XI=
X-Received: by 2002:a6b:e00f:: with SMTP id z15mr17717561iog.126.1575946503820; 
 Mon, 09 Dec 2019 18:55:03 -0800 (PST)
MIME-Version: 1.0
References: <0700dec94d76447faae7ab98c0c04516@lenovo.com>
In-Reply-To: <0700dec94d76447faae7ab98c0c04516@lenovo.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Mon, 9 Dec 2019 18:54:27 -0800
Message-ID: <CADKL2t7Fp3ecdWBxJF-xNxbsJa8TSHm=xKNDG4VpG8EJagJv3A@mail.gmail.com>
Subject: Re: Add member into Lenovo designated employees list
To: Duke KH Du <dukh@lenovo.com>
Content-Type: multipart/alternative; boundary="0000000000008bfc33059950a3ce"
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

--0000000000008bfc33059950a3ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Dec 2019 at 12:45, Duke KH Du <dukh@lenovo.com> wrote:

> Hi Master,
>
>
>
> I would like to add more members of Lenovo in the designated employee lis=
t
> as below in Red.
>
> Could you help on that?
>
>
>
> Schedule A
>
> Initial list of designated employees. NB: authorization is not tied to
> particular Contributions.
>
> Please indicate =E2=80=9CCLA Manager=E2=80=9D next to the name of any emp=
loyees listed
> below that are
>
> authorized to add or remove designated employees from this list in the
> future.
>
>
>
> CLA Manager:
>
> Duke Du dukh@lenovo.com
>
>
>
> Other designated employees:
>
> Andrew Peng pengms1@lenovo.com
>
> Yonghui Liu liuyh21@lenovo.com
>
> Lisa Liu liuyj19@lenovo.com
>
>
>
> Payne Yang pyang4@lenovo.com
>
> Harry Sung hsung1@lenovo.com
>
> Ivan Li rli11@lenovo.com
>
> Derek Lin dlin23@lenovo.com
>

You may want to add the author from this patch too:
https://gerrit.openbmc-project.xyz/c/openbmc/meta-lenovo/+/26280


>
>
> Thanks.
>
> *From:* Duke KH Du
> *Sent:* Monday, April 8, 2019 8:44 PM
> *To:* openbmc@lists.ozlabs.org
> *Subject:* Add member into Lenovo designated employees list
>
>
>
> Hi master,
>
>
>
> I would like to add our new member in Lenovo designated employees list as
> below in RED color.
>
>
>
> Could you help on it?
>
> Thanks.
>
>
>
> Schedule A
>
> Initial list of designated employees. NB: authorization is not tied to
> particular Contributions.
>
> Please indicate =E2=80=9CCLA Manager=E2=80=9D next to the name of any emp=
loyees listed
> below that are
>
> authorized to add or remove designated employees from this list in the
> future.
>
>
>
> CLA Manager:
>
> Duke Du dukh@lenovo.com
>
>
>
> Other designated employees:
>
> Andrew Peng pengms1@lenovo.com
>
>
>
> Yonghui Liu liuyh21@lenovo.com
>
>
>
> Lisa Liu liuyj19@lenovo.com
>
>
>

--0000000000008bfc33059950a3ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 6 Dec 2019 at 12:45, Duke KH Du &=
lt;<a href=3D"mailto:dukh@lenovo.com">dukh@lenovo.com</a>&gt; wrote:<br></d=
iv><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_-637164355495694304WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:rgb(31,73,125)">Hi Master,<u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(31,73,125)"><u></u>=C2=A0<u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(31,73,125)">I would like to=
 add more members of Lenovo in the designated employee list as below in Red=
.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(31,73,125)">Could you help =
on that?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(31,73,125)"><u></u>=C2=A0<u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:ArialMT">Schedule A<u></u=
><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:ArialMT">Initial list of =
designated employees. NB: authorization is not tied to particular Contribut=
ions.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:ArialMT">Please indicate
</span>=E2=80=9C<span style=3D"font-family:ArialMT">CLA Manager</span>=E2=
=80=9D<span style=3D"font-family:ArialMT"> next to the name of any employee=
s listed below that are<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:ArialMT">authorized to ad=
d or remove designated employees from this list in the future.<u></u><u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:ArialMT"><u></u>=C2=A0<u>=
</u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif">CLA Manager:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif">Duke Du
</span><a href=3D"mailto:dukh@lenovo.com" target=3D"_blank"><span style=3D"=
font-size:10.5pt;font-family:Arial,sans-serif">dukh@lenovo.com</span></a><s=
pan style=3D"font-size:10.5pt;font-family:Arial,sans-serif"><u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif">Other designated employees:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif">Andrew Peng
</span><a href=3D"mailto:pengms1@lenovo.com" target=3D"_blank"><span style=
=3D"font-size:10.5pt;font-family:Arial,sans-serif">pengms1@lenovo.com</span=
></a><span style=3D"font-size:10.5pt;font-family:Arial,sans-serif"><u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif">Yonghui Liu
</span><a href=3D"mailto:liuyh21@lenovo.com" target=3D"_blank"><span style=
=3D"font-size:10.5pt;font-family:Arial,sans-serif">liuyh21@lenovo.com</span=
></a><span style=3D"font-size:10.5pt;font-family:Arial,sans-serif"><u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif">Lisa Liu
</span><span class=3D"gmail-m_-637164355495694304MsoHyperlink"><a href=3D"m=
ailto:liuyj19@lenovo.com" target=3D"_blank"><span style=3D"font-size:10.5pt=
;font-family:Arial,sans-serif">liuyj19@lenovo.com</span></a></span><span st=
yle=3D"font-size:10.5pt;font-family:Arial,sans-serif"><u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(31,73,125)"><u></u>=C2=A0<u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red">Payne Yang <a href=3D"mail=
to:pyang4@lenovo.com" target=3D"_blank">
<span style=3D"color:red">pyang4@lenovo.com</span></a><u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:red">Harry Sung <a href=3D"mail=
to:hsung1@lenovo.com" target=3D"_blank">
<span style=3D"color:red">hsung1@lenovo.com</span></a><u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:red">Ivan Li <a href=3D"mailto:=
rli11@lenovo.com" target=3D"_blank">
<span style=3D"color:red">rli11@lenovo.com</span></a><u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:red">Derek Lin <a href=3D"mailt=
o:dlin23@lenovo.com" target=3D"_blank">
<span style=3D"color:red">dlin23@lenovo.com</span></a></span></p></div></di=
v></blockquote><div><br></div><div>You may want to add the author from this=
 patch too:=C2=A0<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/me=
ta-lenovo/+/26280">https://gerrit.openbmc-project.xyz/c/openbmc/meta-lenovo=
/+/26280</a></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div lang=3D"EN-US"><div class=3D"gmail-m_-637164355495694304Wor=
dSection1"><p class=3D"MsoNormal"><span style=3D"color:red"><u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(31,73,125)"><u></u>=C2=A0<u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(31,73,125)">Thanks.<u></u><=
u></u></span></p>
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Duke KH Du <br>
<b>Sent:</b> Monday, April 8, 2019 8:44 PM<br>
<b>To:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a><br>
<b>Subject:</b> Add member into Lenovo designated employees list<u></u><u><=
/u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Hi master,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I would like to add our new member in Lenovo designa=
ted employees list as below in
<span style=3D"color:red">RED </span>color.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Could you help on it?<u></u><u></u></p>
<p class=3D"MsoNormal">Thanks.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-family:ArialMT">Schedule A<u></u=
><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:ArialMT">Initial list of =
designated employees. NB: authorization is not tied to particular Contribut=
ions.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:ArialMT">Please indicate
</span>=E2=80=9C<span style=3D"font-family:ArialMT">CLA Manager</span>=E2=
=80=9D<span style=3D"font-family:ArialMT"> next to the name of any employee=
s listed below that are<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:ArialMT">authorized to ad=
d or remove designated employees from this list in the future.<u></u><u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:ArialMT"><u></u>=C2=A0<u>=
</u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif">CLA Manager:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif">Duke Du
</span><a href=3D"mailto:dukh@lenovo.com" target=3D"_blank"><span style=3D"=
font-size:10.5pt;font-family:Arial,sans-serif">dukh@lenovo.com</span></a><s=
pan style=3D"font-size:10.5pt;font-family:Arial,sans-serif"><u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif">Other designated employees:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif">Andrew Peng
</span><a href=3D"mailto:pengms1@lenovo.com" target=3D"_blank"><span style=
=3D"font-size:10.5pt;font-family:Arial,sans-serif">pengms1@lenovo.com</span=
></a><span style=3D"font-size:10.5pt;font-family:Arial,sans-serif"><u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif">Yonghui Liu
</span><a href=3D"mailto:liuyh21@lenovo.com" target=3D"_blank"><span style=
=3D"font-size:10.5pt;font-family:Arial,sans-serif">liuyh21@lenovo.com</span=
></a><span style=3D"font-size:10.5pt;font-family:Arial,sans-serif"><u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:red">Lisa Liu
</span><a href=3D"mailto:liuyj19@lenovo.com" target=3D"_blank"><span style=
=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:red">liuyj19@lenovo=
.com</span></a><span style=3D"font-size:10.5pt;font-family:Arial,sans-serif=
;color:red"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>

</blockquote></div></div>

--0000000000008bfc33059950a3ce--
