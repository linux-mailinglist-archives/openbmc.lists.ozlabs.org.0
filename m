Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 809A75E84E
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2019 18:01:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f5Sb4dDBzDqV8
	for <lists+openbmc@lfdr.de>; Thu,  4 Jul 2019 02:01:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kDK15oaL"; 
 dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f5Rk3ScbzDqSY
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jul 2019 02:00:34 +1000 (AEST)
Received: by mail-qt1-x82a.google.com with SMTP id w17so908309qto.10
 for <openbmc@lists.ozlabs.org>; Wed, 03 Jul 2019 09:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=j3NndCYvGRB/Utk8imN3G/bSX/gNK04hQzZQWBbD5yI=;
 b=kDK15oaLsh4R3o9vpT+IoKRu5NPsglySDHOEk4eZRxfGaAKdMgxjzqv/or5E728e7t
 DiX6prAc9XbGfdZ9E5UKTxCHB33Gvy1ijNjvoyZxaHh53Ij2j8jK+BMwGQWMWE47fcjX
 nuvZVE1s5lYKgaZtUFBetK7T2WiEba5rYWi2UAmDMOJkSedOImia/5/A18BKarVqzFPW
 y1cv+1GjQIwu/vdwe9+40AJsfabMQBM7VpQ/4AMnST847bj3BHBZcCUvzihTh2GuBP4J
 WHdPGLyAECZmfRIUEVELbAR66uMyXl0VepLMdphiaDuIF+rsGJjyLwAohL8h5f23Uq1I
 v+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=j3NndCYvGRB/Utk8imN3G/bSX/gNK04hQzZQWBbD5yI=;
 b=GeA5XPqkXRsSt78xdbmeCZd5DLNmUEurT5BWaf95SDgDSOfik7LrfynXYK1wXWfakG
 4NB//95AGSRK8HXZkCqi3Qb/ZwIuB2ZPoSa/l3rcnwpbu3pj6levAw5PJGI9oBHQM+Ex
 aq7E0GeqCzqF/7mElPRYK5sWKVrPs+6k6UF583AVJm9H/uQJv6RO4ZlOY2RDwlYmlQ4G
 rZnRRvy2RMAnesYGyaJrGSF8Sx4kaKOOsrkerwZFf9htQw7af3ihGXNRPCMeW4C7TjHl
 RPKcvFeo4J4ZpmVME9cLupHORhykq2R4bTTmtyTOY+k+I8DelF42RdtSZR0LxMhPhXHj
 KeLQ==
X-Gm-Message-State: APjAAAVicXIDiC9L+7PoM1/qzISLzzSFIEHORq29D5CO7SLlVMPDOq+S
 V6odJwfefs7wY8xfepP0CX5pY/iPwEcrCLiRNsNqyrdP
X-Google-Smtp-Source: APXvYqzQiNHHeoec1jISLZbtjO7JDXICsZP9QPVgfWv31FyreXqybYiiCbYPsDu85GfSe/bqToS0HyeTeAAxAJqQDaA=
X-Received: by 2002:a81:1a17:: with SMTP id a23mr23014085ywa.41.1562169631038; 
 Wed, 03 Jul 2019 09:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAMTupoRvXiZRoHMEG8iTYe+v76Xw0w6jW295-ZMXozEno0y-fw@mail.gmail.com>
In-Reply-To: <CAMTupoRvXiZRoHMEG8iTYe+v76Xw0w6jW295-ZMXozEno0y-fw@mail.gmail.com>
From: Jandra A <jandraara@gmail.com>
Date: Wed, 3 Jul 2019 11:00:20 -0500
Message-ID: <CAMTupoTeYkx2F_8gCXLq4JxV18rLpvPcoJaZjVTbwdNt6OyqNQ@mail.gmail.com>
Subject: Re: GUI workgroup meeting - Wednesday 10:00 AM CST
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Wang,
 Kuiying" <kuiying.wang@intel.com>
Content-Type: multipart/alternative; boundary="000000000000efe0db058cc8f516"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000efe0db058cc8f516
Content-Type: text/plain; charset="UTF-8"

Hello all,Please find below the notes from today's workgroup. As a note,
attendance continues to be solely IBM community members and we would love to
have others join. If there is any feedback, please reach out.

Reviewed Network Settings designs

   - Decided the fields DNS servers and IP address tables would always be
   text input fields (as opposed to in read-only mode with an edit mode that
   can trigger input fields.
   - No need for a 'add static IP address' button until we support
   zeroconfig.
   - Agreed to review test plan early next week.

<https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group#reviewed-local-user-management-designs>Reviewed
Local User Management designs

   - Showed proposals for how a sys admin might perform a manual unlock of
   a user; need to revisit and determine if there is an API for unlocking a
   user, or what happens when the timeout value is set to 0.
   - Updated the password requirements displayed in the mockups.


Best,
GUI Design Team



On Tue, Jul 2, 2019 at 8:04 AM Jandra A <jandraara@gmail.com> wrote:

> Hello all,
>
> The GUI design workgroup will be meeting Wednesday July 3 at 10:00AM CST.
>
> Tentative agenda:
>
>    1. Updates on Intel-specific icon changes mentioned last meeting
>    (Intel)
>    2. Share research findings and updates on design layout (Intel)
>    3. Review updates on Local User Management panel (IBM)
>    4. Current System log page design features discussion (IBM)
>    5. Review TPM required policy mockups (IBM)
>
> Please add any other agenda items here:
> https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group
>
> As a note, attendance has been solely IBM community members. We would love
> to have others join. We are hoping that changing the time from 7:00 AM
> Central
> to 10:00 AM Central will make that possible for people invested in the
> GUI to attend.
>
> Meeting Link:
> https://ibm.webex.com/ibm/j.php?MTID=m49792ce33d5af28f2823638d351732f3
>
> Best,
> GUI Design Team
>

--000000000000efe0db058cc8f516
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><h4 style=3D"box-sizing:border-box;margin=
-bottom:16px;margin-top:24px;line-height:1.25;color:rgb(36,41,46)"><font fa=
ce=3D"verdana, sans-serif" style=3D"font-weight:normal">Hello all,</font></=
h4><h4 style=3D"box-sizing:border-box;margin-bottom:16px;margin-top:24px;li=
ne-height:1.25;color:rgb(36,41,46)"><font face=3D"verdana, sans-serif" styl=
e=3D"font-weight:normal">Please find below the notes from today&#39;s workg=
roup. As a note, attendance continues to be solely IBM community members an=
d we would love=C2=A0<span style=3D"color:rgb(34,34,34)">to have others joi=
n. If there is any feedback, please reach out.=C2=A0</span><br><br>Reviewed=
 Network Settings designs</font></h4><ul style=3D"box-sizing:border-box;mar=
gin-bottom:16px;margin-top:0px;padding-left:2em;color:rgb(36,41,46)"><li st=
yle=3D"box-sizing:border-box"><font face=3D"verdana, sans-serif">Decided th=
e fields DNS servers and IP address tables would always be text input field=
s (as opposed to in read-only mode with an edit mode that can trigger input=
 fields.</font></li><li style=3D"box-sizing:border-box;margin-top:0.25em"><=
font face=3D"verdana, sans-serif">No need for a &#39;add static IP address&=
#39; button until we support zeroconfig.</font></li><li style=3D"box-sizing=
:border-box;margin-top:0.25em"><font face=3D"verdana, sans-serif">Agreed to=
 review test plan early next week.</font></li></ul><h4 style=3D"box-sizing:=
border-box;margin-bottom:16px;margin-top:24px;line-height:1.25;color:rgb(36=
,41,46)"><a id=3D"gmail-user-content-reviewed-local-user-management-designs=
" class=3D"gmail-anchor" href=3D"https://github.com/openbmc/openbmc/wiki/GU=
I-Design-work-group#reviewed-local-user-management-designs" style=3D"box-si=
zing:border-box;background-color:transparent;color:rgb(3,102,214);text-deco=
ration-line:none;float:left;line-height:1;padding-right:4px"></a><font face=
=3D"verdana, sans-serif" style=3D"font-weight:normal">Reviewed Local User M=
anagement designs</font></h4><ul style=3D"box-sizing:border-box;margin-bott=
om:16px;margin-top:0px;padding-left:2em;color:rgb(36,41,46)"><li style=3D"b=
ox-sizing:border-box"><font face=3D"verdana, sans-serif">Showed proposals f=
or how a sys admin might perform a manual unlock of a user; need to revisit=
 and determine if there is an API for unlocking a user, or what happens whe=
n the timeout value is set to 0.</font></li><li style=3D"box-sizing:border-=
box;margin-top:0.25em"><font face=3D"verdana, sans-serif" style=3D"">Update=
d the password requirements displayed in the mockups.</font></li></ul><div>=
<font color=3D"#24292e" face=3D"verdana, sans-serif"><br></font></div><div>=
<font color=3D"#24292e" face=3D"verdana, sans-serif">Best,</font></div><div=
><font color=3D"#24292e" face=3D"verdana, sans-serif">GUI Design Team=C2=A0=
</font></div><div><font color=3D"#24292e" face=3D"verdana, sans-serif"><br>=
</font></div><div><font color=3D"#24292e" face=3D"verdana, sans-serif"><br>=
</font></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, Jul 2, 2019 at 8:04 AM Jandra A &lt;<a href=3D"mailto:=
jandraara@gmail.com">jandraara@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><div><span st=
yle=3D"background-color:transparent"><font face=3D"verdana, sans-serif">Hel=
lo all,=C2=A0</font></span></div><div><span style=3D"background-color:trans=
parent;color:rgb(36,41,46)"><font face=3D"verdana, sans-serif"><br></font><=
/span></div><div><span style=3D"background-color:transparent;color:rgb(36,4=
1,46)"><font face=3D"verdana, sans-serif">The=C2=A0<span class=3D"gmail-m_4=
095254717547176167gmail-m_-1492632449708843752gmail-il">GUI</span>=C2=A0des=
ign=C2=A0<span class=3D"gmail-m_4095254717547176167gmail-m_-149263244970884=
3752gmail-il">workgroup</span>=C2=A0will be meeting Wednesday July 3 at 10:=
00AM CST.=C2=A0</font></span></div><div><span style=3D"background-color:tra=
nsparent;color:rgb(36,41,46)"><font face=3D"verdana, sans-serif"><br></font=
></span></div><div><font color=3D"#24292e" face=3D"verdana, sans-serif">Ten=
tative agenda:=C2=A0</font></div></div><div><ol><li style=3D"margin-left:15=
px"><font face=3D"verdana, sans-serif">Updates on Intel-specific icon chang=
es mentioned last meeting (Intel)</font></li><li style=3D"margin-left:15px"=
><font face=3D"verdana, sans-serif">Share research findings and updates on =
design layout (Intel)</font></li><li style=3D"margin-left:15px"><font face=
=3D"verdana, sans-serif">Review updates on Local User Management panel (IBM=
)</font></li><li style=3D"margin-left:15px"><font face=3D"verdana, sans-ser=
if">Current System log page design features discussion (IBM)</font></li><li=
 style=3D"margin-left:15px"><font face=3D"verdana, sans-serif">Review TPM r=
equired policy mockups (IBM)<br></font></li></ol></div><div><div><font face=
=3D"verdana, sans-serif">Please add any other agenda items here:=C2=A0<a hr=
ef=3D"https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group" target=
=3D"_blank">https://github.com/openbmc/openbmc/wiki/<span class=3D"gmail-m_=
4095254717547176167gmail-m_-1492632449708843752gmail-il">GUI</span>-Design-=
<span class=3D"gmail-m_4095254717547176167gmail-m_-1492632449708843752gmail=
-il">work</span>-<span class=3D"gmail-m_4095254717547176167gmail-m_-1492632=
449708843752gmail-il">group</span></a></font></div><div><font face=3D"verda=
na, sans-serif"><br></font></div><div><font face=3D"verdana, sans-serif">As=
 a note, attendance has been solely IBM community members. We would love<br=
>to have others join. We are hoping that changing the time from 7:00 AM Cen=
tral<br>to 10:00 AM Central will make that possible for people invested in =
the<br>GUI to attend.<br></font></div><div><font face=3D"verdana, sans-seri=
f"><br></font></div><div><font face=3D"verdana, sans-serif"><span style=3D"=
box-sizing:border-box;color:rgb(36,41,46)">Meeting Link</span><span style=
=3D"color:rgb(36,41,46)">:=C2=A0</span><a href=3D"https://ibm.webex.com/ibm=
/j.php?MTID=3Dm49792ce33d5af28f2823638d351732f3" rel=3D"nofollow" style=3D"=
color:rgb(3,102,214);box-sizing:border-box;text-decoration-line:none" targe=
t=3D"_blank">https://ibm.webex.com/ibm/j.php?MTID=3Dm49792ce33d5af28f282363=
8d351732f3</a><br style=3D"box-sizing:border-box;color:rgb(36,41,46)"></fon=
t></div><div><font face=3D"verdana, sans-serif"><br></font></div><div><span=
 style=3D"background-color:transparent;color:rgb(36,41,46)"><font face=3D"v=
erdana, sans-serif">Best,</font></span></div><div><span style=3D"background=
-color:transparent;color:rgb(36,41,46)"><font face=3D"verdana, sans-serif">=
<span class=3D"gmail-m_4095254717547176167gmail-m_-1492632449708843752gmail=
-m_-2158016735816270648gmail-m_-274210038052043966gmail-m_65252157389506143=
23gmail-m_-6172510825241159069gmail-il"><span class=3D"gmail-m_409525471754=
7176167gmail-m_-1492632449708843752gmail-il">GUI</span></span>=C2=A0<span c=
lass=3D"gmail-m_4095254717547176167gmail-m_-1492632449708843752gmail-m_-215=
8016735816270648gmail-m_-274210038052043966gmail-m_6525215738950614323gmail=
-m_-6172510825241159069gmail-il">Design</span>=C2=A0Team=C2=A0</font></span=
></div></div></div>
</blockquote></div></div>

--000000000000efe0db058cc8f516--
