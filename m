Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0D91374BF
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 18:24:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vVGl13ldzDqgj
	for <lists+openbmc@lfdr.de>; Sat, 11 Jan 2020 04:24:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::130;
 helo=mail-il1-x130.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ElykqbvM; dkim-atps=neutral
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vVFV2CLYzDqdp
 for <openbmc@lists.ozlabs.org>; Sat, 11 Jan 2020 04:23:34 +1100 (AEDT)
Received: by mail-il1-x130.google.com with SMTP id v15so2389211iln.0
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jan 2020 09:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NUB7bfQ1WCY9TQqdm60Xy366CIAdDuhorWVuiFqdCxE=;
 b=ElykqbvMdfKTcycUCbxsuvWMcWK+6p1zTrK7fwv478h29R/A01vXHm4HcZYDc0rTIX
 4c55yFDlgvNI1AMlj69AwfhmCvzi692vkLN93FNpIhGWvK+w0Bq/nfLFtJxhCkM2wOG5
 ACTLdWQedZiKkDjcGhwiii2SF7pTyYVXpPP/+yXpz4VXo4VUQqk6/w0CPK40YOBPaKMD
 M/bhmi55ymstmHFR90HYPWBaDfjpbVq52+5TdInDs0PImnJ+rVcDuy/wrTE66TAKdOLr
 qocT74jeRiplIIK+b5LWz+RTJD3fjofOmVsTMzaeX4/AtB3JPqi24dS9JNvb5LjfYKjn
 K2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NUB7bfQ1WCY9TQqdm60Xy366CIAdDuhorWVuiFqdCxE=;
 b=gDa0/kb4IfpdDTlh+DXSVwpmegqGMSHLDXKHVcjWiiXtlYOXGxMk51NfNFUECqcYYI
 LMCwOa76v+RyfpDi4gqpohvSWcVUlEeRgO6b4gm/f5RPdDaUwjg4fRjuShXvxWjEeh9u
 vsiBNgGjjx9grrud7pUgvrdi0qGcVYbSvKJkKypav/kaEad3yBz8QYp0cWdyC5AQP2v5
 /yKOWMAaTzcQKQGtyCHki3SqIF8gLBv/VQAwZmAGUTC1EGNW753NebmgjDwNJ7gzdNwO
 B7rLRAGsURMAZ5ui6LSpSfMb8MseMApheU6P9cwuoF5SGZXvrHA8DZcsZaTB0/8M4z3N
 hEBQ==
X-Gm-Message-State: APjAAAWCtO8n7yvYUtJhTufxSEuS09osBlJ/pvQ5TjbU169Jzn6v1a1+
 VuqyY46VSvRDXYYsNZTzoNyM1NXRhjPVywCiQwLdFg==
X-Google-Smtp-Source: APXvYqwz3ZqMwzO+z1tw5P1pcG20PYmhBnCvFGCOpo9Sgj2IC6OjXgv+PTOuvZ2VBZP7rkQBQH/6/uQH0H5YeiaTUKU=
X-Received: by 2002:a92:b74c:: with SMTP id c12mr3304670ilm.154.1578677010892; 
 Fri, 10 Jan 2020 09:23:30 -0800 (PST)
MIME-Version: 1.0
References: <0700dec94d76447faae7ab98c0c04516@lenovo.com>
In-Reply-To: <0700dec94d76447faae7ab98c0c04516@lenovo.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Fri, 10 Jan 2020 09:22:55 -0800
Message-ID: <CADKL2t5wk+2Yd39=XLih7vFsACrgmsJp96b-su_S5zLis6EgDg@mail.gmail.com>
Subject: Re: Add member into Lenovo designated employees list
To: kurt.r.taylor@gmail.com
Content-Type: multipart/alternative; boundary="000000000000736871059bcc6243"
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
 Duke KH Du <dukh@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000736871059bcc6243
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kurt,

Could you take a look at the CCLA update from Lenovo when you get a chance?

Thanks,
Benjamin


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

--000000000000736871059bcc6243
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Kurt,<div><br></div><div>Could you take a look at the C=
CLA update from Lenovo when you get a chance?</div><div><br></div><div>Than=
ks,</div><div>Benjamin</div></div><br><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Fri, 6 Dec 2019 at 12:45, Duke KH Du &lt=
;<a href=3D"mailto:dukh@lenovo.com">dukh@lenovo.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_8818170090434688875WordSection1">
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
</span><span class=3D"gmail-m_8818170090434688875MsoHyperlink"><a href=3D"m=
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
<span style=3D"color:red">dlin23@lenovo.com</span></a><u></u><u></u></span>=
</p>
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

</blockquote></div>

--000000000000736871059bcc6243--
