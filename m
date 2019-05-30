Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E079530321
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2019 22:10:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FJbq0pzlzDqVQ
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 06:10:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XGWZ6eQD"; 
 dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FJbG48dBzDqVJ
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 06:10:02 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id x32so94029ybh.1
 for <openbmc@lists.ozlabs.org>; Thu, 30 May 2019 13:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HkdcoAXghpojA0zAHmbeOdsLdrj5PqbhMGaW9me48wU=;
 b=XGWZ6eQD++8AaNr1hZo8eK4eMLuW7fz0ARRj5/PmB1zX2UK9bYAEXqw0F+UXXYKzLB
 OeeBIlu6JnhfY7VRiiSeb5pnDOFm25NaajV/DGVRV5CGBwsVCPBiDAdpcOrHk69mLU2e
 Vh2v5W2djQqcpgRTzfYfFeCN/9CpldwczDiYwsXLn4Xw73XT3a8HV/lobDUwbHO8bk16
 emt91y8r3qZKXzvmqk2hcrYuiEF5umZi4uOBLn9IgIHV/QcWs6YeunZxn/vo39Wbx8xK
 TbCIdhJvlBTYaINQSHqe44r2L3SnOAKhc8xuwCJRfUO1tAq5wOtydPQ7ypyiDwaBGMZT
 IMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HkdcoAXghpojA0zAHmbeOdsLdrj5PqbhMGaW9me48wU=;
 b=mtCzIRAtPzrFKqjfKcbvT0uc/yP6EY+yrxZnCnqEM72BiH5ga7HluOTOLKKMWshlwe
 tNqf6MbYsTRwwRw5c4WP+XDLQ7dofkIhfT32o/m8bu9POV+9Tq9ZhdYXWuSkW7rk79xP
 hQs+oGB6DZLAQ4DSyjyXlrXvPeEXR3FK4Y/cd9MKLKM8CUzXtGGJuxF61KT5B9cw6zPE
 ef3MdCQ4oSdyajqlA5ZUhpvEiR+5yCZ1NMM453YY53GZEZ51CPbI9mirL3WhNWeUhnxB
 Tprjwjn1Wz15aDVG8lT8grW9MNUplOYMoUKZ//eLeFK4EFqQ/NBsKTR3almLn9JyU+Vx
 acmQ==
X-Gm-Message-State: APjAAAUuJ0ZtBR/s4DO3bmDS7Xm2WA03cax01ur5gCuoa1BYJNnZjUQL
 fN4Lc00/SgwVpf6Rw8opUBZtJhc8+/Il1Gjk4i0c5tHOocA=
X-Google-Smtp-Source: APXvYqyBc05BzTSkg5yQ7s7P9bVCPxDl/kExc2120I1PZ3kvBctnCrtbZvTYWtu2cRChSmq1UmjZ7YE17y3AX6HyXUI=
X-Received: by 2002:a25:358b:: with SMTP id c133mr2665486yba.296.1559246998075; 
 Thu, 30 May 2019 13:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <a345e6df8a574eb394eab94e70474cd8@Eltsrv03.Eltan.local>
 <CAMTupoT0SyitQiJaitvCNZ6ckq=qL_tP4Vx_61UwFqzxDDbvzw@mail.gmail.com>
 <0f690b187399475fa1737b848c601a14@Eltsrv03.Eltan.local>
In-Reply-To: <0f690b187399475fa1737b848c601a14@Eltsrv03.Eltan.local>
From: Jandra A <jandraara@gmail.com>
Date: Thu, 30 May 2019 15:09:47 -0500
Message-ID: <CAMTupoRM7UVw23vTwy=mnGGxtZ74GP8SHccUuumEKrHAb6d6Wg@mail.gmail.com>
Subject: Re: webui: setting Boot.Mode and Boot.Source
To: Wim Vervoorn <wvervoorn@eltan.com>
Content-Type: multipart/alternative; boundary="000000000000724efc058a207bb2"
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

--000000000000724efc058a207bb2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Wim,

 I don=E2=80=99t think it is suitable for us to co-create the GUI. We are
> definitely not GUI experts.
>
>
>
> What is important for us is that the user can access the possibilities of
> the BMC using the GUI. Another thing that is of importance is that the GU=
I
> is configurable. A specific implementation may not support all OpenBMC
> features. It should be possible to disable them in the GUI.
>


No need to worry about not being GUI experts. We would love to work with
you to better understand the things you think are important in the GUI and
how you envision them working, no need to think about exactly how that
translates to a GUI -- we can propose on that end. The important thing is
to understand how you and users think of features and how you use them so
that we can design for that.
For example, when you say 'possibilities' and 'configurable', what are you
referring to? What things do you think would need to be disabled and when?



Ideally the GUI should have a way to detect support and enable and disable
> the support dynamically. The possibility to do this using variables durin=
g
> build time is also a good alternative.
>


Is this for what you are referring to above with some features being
disabled in the GUI?



Basically the schedule for the boot option implementation surprises me. To
> me the implementation seems fairly simple and if a GUI is supported this =
is
> one of the things that is important to the user.
>


Can you give more clarity on this? Are you saying the ability to do a
single one-time boot for a 'next reboot' is important to the user? If so,
why is it important?



Best,
Jandra A

On Tue, May 28, 2019 at 3:26 AM Wim Vervoorn <wvervoorn@eltan.com> wrote:

> Hello Jandra,
>
>
>
> I am sorry for the late response.
>
>
>
> I don=E2=80=99t think it is suitable for us to co-create the GUI. We are
> definitely not GUI experts.
>
>
>
> What is important for us is that the user can access the possibilities of
> the BMC using the GUI. Another thing that is of importance is that the GU=
I
> is configurable. A specific implementation may not support all OpenBMC
> features. It should be possible to disable them in the GUI.
>
>
>
> Ideally the GUI should have a way to detect support and enable and disabl=
e
> the support dynamically. The possibility to do this using variables durin=
g
> build time is also a good alternative.
>
>
>
> Basically the schedule for the boot option implementation surprises me. T=
o
> me the implementation seems fairly simple and if a GUI is supported this =
is
> one of the things that is important to the user.
>
>
>
> Best Regards,
>
> Wim Vervoorn
>
>
>
> Eltan B.V.
>
> Ambachtstraat 23
>
> 5481 SM Schijndel
>
> The Netherlands
>
>
>
> T : +31-(0)73-594 46 64
>
> E : wvervoorn@eltan.com
>
> W : http://www.eltan.com
>
>
>
>
>
> "THIS MESSAGE CONTAINS CONFIDENTIAL INFORMATION. UNLESS YOU ARE THE
> INTENDED RECIPIENT OF THIS MESSAGE, ANY USE OF THIS MESSAGE IS STRICTLY
> PROHIBITED. IF YOU HAVE RECEIVED THIS MESSAGE IN ERROR, PLEASE IMMEDIATEL=
Y
> NOTIFY THE SENDER BY TELEPHONE +31-(0)73-5944664 OR REPLY EMAIL, AND
> IMMEDIATELY DELETE THIS MESSAGE AND ALL COPIES."
>
>
>
> *From:* Jandra A [mailto:jandraara@gmail.com]
> *Sent:* Monday, May 20, 2019 11:33 PM
> *To:* Wim Vervoorn <wvervoorn@eltan.com>
> *Cc:* openbmc@lists.ozlabs.org
> *Subject:* Re: webui: setting Boot.Mode and Boot.Source
>
>
>
> Hello Wim,
>
>
>
> I believe it is scheduled for October 2019. Would you be interested in
> providing feedback and co-creating the GUI design? We can schedule a 30
> minute conversation to review the current design proposal and talk about
> how it can be improved to best meet your needs.
>
>
>
> Regards,
>
> Jandra Aranguren
>
>
>
> On Wed, May 8, 2019 at 6:15 AM Wim Vervoorn <wvervoorn@eltan.com> wrote:
>
> Hello Jandra,
>
>
>
> Thanks for the reply. I had a look, this is exactly what I am looking for=
.
> Do you know when this is scheduled to be included in the WebUI?
>
>
>
> Best Regards,
>
> Wim Vervoorn
>
>
>
> Eltan B.V.
>
> Ambachtstraat 23
>
> 5481 SM Schijndel
>
> The Netherlands
>
>
>
> T : +31-(0)73-594 46 64
>
> E : wvervoorn@eltan.com
>
> W : http://www.eltan.com
>
>
>
>
>
> "THIS MESSAGE CONTAINS CONFIDENTIAL INFORMATION. UNLESS YOU ARE THE
> INTENDED RECIPIENT OF THIS MESSAGE, ANY USE OF THIS MESSAGE IS STRICTLY
> PROHIBITED. IF YOU HAVE RECEIVED THIS MESSAGE IN ERROR, PLEASE IMMEDIATEL=
Y
> NOTIFY THE SENDER BY TELEPHONE +31-(0)73-5944664 OR REPLY EMAIL, AND
> IMMEDIATELY DELETE THIS MESSAGE AND ALL COPIES."
>
>
>
> *From:* Jandra A [mailto:jandraara@gmail.com]
> *Sent:* Tuesday, May 7, 2019 5:27 PM
> *To:* Wim Vervoorn <wvervoorn@eltan.com>
> *Cc:* openbmc@lists.ozlabs.org
> *Subject:* Re: webui: setting Boot.Mode and Boot.Source
>
>
>
> Hello Wim,
>
>
>
> Yes, I'm glad you ask. This is something we are currently working on so
> there is still some work to be done. We'd love to get your feedback to se=
e
> if what you think is missing aligns with the work we have planned, and
> understand what your needs would be from this functionality as a ser. You
> can find the current design proposals here:
> https://ibm.invisionapp.com/share/8ENYRVXAPFD#/319095138_1-_Boot_Options_=
-_System_On
> .
>
>
>
> Note: To leave feedback in InVision, turn on Comment mode from the bottom
> right hand corner of the screen and then click where you want to leave a
> comment. To navigate through the prototype, click where you see flashing
> blue rectangles or use the right and left keyboard arrows
>
>
> Please let us know if you have any questions and if you would like to set
> up some time to review this.
>
> Best,
>
> Jandra Aranguren  |  GUI Design Team
>
>
>
>
>
> On Tue, May 7, 2019 at 7:25 AM Wim Vervoorn <wvervoorn@eltan.com> wrote:
>
> Hello,
>
>
>
> Currently the webui doesn=E2=80=99t contain the functionality to change t=
he boot
> mode and boot source. Are there any plans to add this to the interface?
>
>
>
> Best Regards,
>
> Wim Vervoorn
>
>
>
>

--000000000000724efc058a207bb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><font face=3D"verdana, sans-serif">Hello Wim,</font><=
/div><div><font face=3D"verdana, sans-serif"><br></font></div><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div lang=
=3D"EN-US"><div class=3D"gmail-m_5113381275421055585WordSection1"><p class=
=3D"MsoNormal"><font face=3D"verdana, sans-serif"><span style=3D"color:rgb(=
31,73,125)">=C2=A0</span><span style=3D"color:rgb(31,73,125)">I don=E2=80=
=99t think it is suitable for us to co-create the GUI. We are definitely no=
t GUI experts.</span></font></p><p class=3D"MsoNormal"><span style=3D"color=
:rgb(31,73,125)"><font face=3D"verdana, sans-serif"><u></u>=C2=A0<u></u></f=
ont></span></p><p class=3D"MsoNormal"><span style=3D"color:rgb(31,73,125)">=
<font face=3D"verdana, sans-serif">What is important for us is that the use=
r can access the possibilities of the BMC using the GUI. Another thing that=
 is of importance is that the GUI is configurable. A specific implementatio=
n may not support all OpenBMC features. It should be possible to disable th=
em in the GUI.</font></span></p></div></div></blockquote><div>=C2=A0</div><=
/div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div c=
lass=3D"gmail_quote"><div><font face=3D"verdana, sans-serif">No need to wor=
ry about not being GUI experts. We would love to work with you to better un=
derstand the things you think are important in the GUI and how you envision=
 them working, no need to think about exactly how that translates to a GUI =
-- we can propose on that end. The important thing is to understand how you=
 and users think of features and how you use them so that we can design for=
 that.=C2=A0</font></div></div><div class=3D"gmail_quote"><div><font face=
=3D"verdana, sans-serif">For=C2=A0example, when you say &#39;possibilities&=
#39; and &#39;configurable&#39;, what are you referring to? What things do =
you think would need to be disabled and when?=C2=A0</font></div></div></blo=
ckquote><div class=3D"gmail_quote"><div><br></div><div><font face=3D"verdan=
a, sans-serif"><br></font></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div lang=3D"EN-US"><div class=3D"gmail-m_5113381275421055585WordSec=
tion1"><p class=3D"MsoNormal"><span style=3D"color:rgb(31,73,125)"><font fa=
ce=3D"verdana, sans-serif"><u></u></font></span></p><p class=3D"MsoNormal">=
<font face=3D"verdana, sans-serif"><span style=3D"color:rgb(31,73,125)">Ide=
ally the GUI should have a way to detect support and enable and disable the=
 support dynamically. The possibility to do this using variables during bui=
ld time is also a good alternative.</span><span style=3D"color:rgb(31,73,12=
5)">=C2=A0</span></font></p></div></div></blockquote><div>=C2=A0</div></div=
><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div class=
=3D"gmail_quote"><div><font face=3D"verdana, sans-serif">Is this for what y=
ou are referring to above with some features being disabled in the GUI?=C2=
=A0</font></div></div></blockquote><div class=3D"gmail_quote"><div><font fa=
ce=3D"verdana, sans-serif">=C2=A0</font></div><div><font face=3D"verdana, s=
ans-serif"><br></font></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div lang=3D"EN-US"><div class=3D"gmail-m_5113381275421055585WordSection=
1"><p class=3D"MsoNormal"><span style=3D"color:rgb(31,73,125)"><font face=
=3D"verdana, sans-serif"><u></u></font></span></p><p class=3D"MsoNormal"><s=
pan style=3D"color:rgb(31,73,125)"><font face=3D"verdana, sans-serif">Basic=
ally the schedule for the boot option implementation surprises me. To me th=
e implementation seems fairly simple and if a GUI is supported this is one =
of the things that is important to the user.</font></span></p></div></div><=
/blockquote><div>=C2=A0</div></div><blockquote style=3D"margin:0 0 0 40px;b=
order:none;padding:0px"><div class=3D"gmail_quote"><div><font face=3D"verda=
na, sans-serif">Can you give more clarity on this? Are you saying the abili=
ty to do a single one-time boot for a &#39;next reboot&#39; is important to=
 the user? If so, why is it important?=C2=A0<span style=3D"color:rgb(31,73,=
125)">=C2=A0</span></font></div></div></blockquote><div class=3D"gmail_quot=
e"><div><span style=3D"color:rgb(31,73,125)"><font face=3D"verdana, sans-se=
rif"><br></font></span></div><div><span style=3D"color:rgb(31,73,125)"><fon=
t face=3D"verdana, sans-serif"><br></font></span></div><div><font color=3D"=
#000000" face=3D"verdana, sans-serif">Best,</font></div><div><font color=3D=
"#000000" style=3D"" face=3D"verdana, sans-serif">Jandra A</font></div></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, May 28, 2019 at 3:26 AM Wim Vervoorn &lt;<a href=3D"mailto:wvervo=
orn@eltan.com">wvervoorn@eltan.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_5113381275421055585WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Hello Jandra,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">I am sorry for the late response.<u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">I don=E2=80=99t think it is suitable for us =
to co-create the GUI. We are definitely not GUI experts.<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">What is important for us is that the user ca=
n access the possibilities of the BMC using the GUI. Another thing that is =
of importance is that the GUI is configurable.
 A specific implementation may not support all OpenBMC features. It should =
be possible to disable them in the GUI.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Ideally the GUI should have a way to detect =
support and enable and disable the support dynamically. The possibility to =
do this using variables during build time
 is also a good alternative.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Basically the schedule for the boot option i=
mplementation surprises me. To me the implementation seems fairly simple an=
d if a GUI is supported this is one of
 the things that is important to the user.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"NL" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif;color:rgb(31,73,125)">Best Regards,</span><span lang=3D"=
NL" style=3D"color:rgb(31,73,125)"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"NL" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif;color:rgb(31,73,125)">Wim Vervoorn<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"NL" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"NL" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif;color:rgb(31,73,125)">Eltan B.V.</span><span lang=3D"NL"=
 style=3D"font-size:11pt;font-family:Calibri,sans-serif;color:rgb(31,73,125=
)"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"NL" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif;color:rgb(31,73,125)">Ambachtstraat 23<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"DE" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif;color:rgb(31,73,125)">5481 SM Schijndel<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"DE" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif;color:rgb(31,73,125)">The Netherlands<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"DE" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"DE" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif;color:rgb(31,73,125)">T : +31-(0)73-594 46 64</span><spa=
n lang=3D"DE" style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rg=
b(31,73,125)"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"DE" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif;color:rgb(31,73,125)">E : <a href=3D"mailto:wvervoorn@el=
tan.com" target=3D"_blank">wvervoorn@eltan.com</a></span><span lang=3D"DE" =
style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(31,73,125)">=
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif;color:rgb(31,73,125)">W :
<a href=3D"http://www.eltan.com/" target=3D"_blank">http://www.eltan.com</a=
><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif;color:rgb(31,73,125)">&quot;THIS MESSAGE CONTAINS CONFIDENTIAL INFOR=
MATION. UNLESS YOU ARE THE INTENDED RECIPIENT OF THIS MESSAGE, ANY USE OF T=
HIS MESSAGE IS STRICTLY PROHIBITED. IF YOU HAVE
 RECEIVED THIS MESSAGE IN ERROR, PLEASE IMMEDIATELY NOTIFY THE SENDER BY TE=
LEPHONE +31-(0)73-5944664 OR REPLY EMAIL, AND IMMEDIATELY DELETE THIS MESSA=
GE AND ALL COPIES.&quot;=C2=A0</span><span style=3D"font-size:11pt;font-fam=
ily:Calibri,sans-serif;color:rgb(31,73,125)"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:Calibri=
,sans-serif">From:</span></b><span style=3D"font-size:11pt;font-family:Cali=
bri,sans-serif"> Jandra A [mailto:<a href=3D"mailto:jandraara@gmail.com" ta=
rget=3D"_blank">jandraara@gmail.com</a>]
<br>
<b>Sent:</b> Monday, May 20, 2019 11:33 PM<br>
<b>To:</b> Wim Vervoorn &lt;<a href=3D"mailto:wvervoorn@eltan.com" target=
=3D"_blank">wvervoorn@eltan.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a><br>
<b>Subject:</b> Re: webui: setting Boot.Mode and Boot.Source<u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Hello Wim,<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I believe it is scheduled for October 2019. Would yo=
u be interested in providing feedback and co-creating the GUI design? We ca=
n schedule a 30 minute conversation to review the current design proposal a=
nd talk about how it can be improved
 to best meet=C2=A0your needs.=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Regards,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Jandra Aranguren<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Wed, May 8, 2019 at 6:15 AM Wim Vervoorn &lt;<a h=
ref=3D"mailto:wvervoorn@eltan.com" target=3D"_blank">wvervoorn@eltan.com</a=
>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Hello Jandra,</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">=C2=A0</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Thanks for the reply. I had a look, this is =
exactly what I am looking for. Do you know when this is
 scheduled to be included in the WebUI?</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">=C2=A0</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span lang=3D"NL" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif;color:rgb(31,73,125)">Best Regards,</span><u></u><u></u>=
</p>
<p class=3D"MsoNormal"><span lang=3D"NL" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif;color:rgb(31,73,125)">Wim Vervoorn</span><u></u><u></u><=
/p>
<p class=3D"MsoNormal"><span lang=3D"NL" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif;color:rgb(31,73,125)">=C2=A0</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span lang=3D"NL" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif;color:rgb(31,73,125)">Eltan B.V.</span><u></u><u></u></p=
>
<p class=3D"MsoNormal"><span lang=3D"NL" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif;color:rgb(31,73,125)">Ambachtstraat 23</span><u></u><u><=
/u></p>
<p class=3D"MsoNormal"><span lang=3D"DE" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif;color:rgb(31,73,125)">5481 SM Schijndel</span><u></u><u>=
</u></p>
<p class=3D"MsoNormal"><span lang=3D"DE" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif;color:rgb(31,73,125)">The Netherlands</span><u></u><u></=
u></p>
<p class=3D"MsoNormal"><span lang=3D"DE" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif;color:rgb(31,73,125)">=C2=A0</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span lang=3D"DE" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif;color:rgb(31,73,125)">T : +31-(0)73-594 46 64</span><u><=
/u><u></u></p>
<p class=3D"MsoNormal"><span lang=3D"DE" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif;color:rgb(31,73,125)">E :
<a href=3D"mailto:wvervoorn@eltan.com" target=3D"_blank">wvervoorn@eltan.co=
m</a></span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif;color:rgb(31,73,125)">W :
<a href=3D"http://www.eltan.com/" target=3D"_blank">http://www.eltan.com</a=
></span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif;color:rgb(31,73,125)">=C2=A0</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif;color:rgb(31,73,125)">=C2=A0</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif;color:rgb(31,73,125)">&quot;THIS MESSAGE CONTAINS CONFIDENTIAL INFOR=
MATION. UNLESS YOU ARE THE INTENDED RECIPIENT OF THIS MESSAGE,
 ANY USE OF THIS MESSAGE IS STRICTLY PROHIBITED. IF YOU HAVE RECEIVED THIS =
MESSAGE IN ERROR, PLEASE IMMEDIATELY NOTIFY THE SENDER BY TELEPHONE +31-(0)=
73-5944664 OR REPLY EMAIL, AND IMMEDIATELY DELETE THIS MESSAGE AND ALL COPI=
ES.&quot;=C2=A0</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">=C2=A0</span><u></u><u></u></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:Calibri=
,sans-serif">From:</span></b><span style=3D"font-size:11pt;font-family:Cali=
bri,sans-serif"> Jandra A [mailto:<a href=3D"mailto:jandraara@gmail.com" ta=
rget=3D"_blank">jandraara@gmail.com</a>]
<br>
<b>Sent:</b> Tuesday, May 7, 2019 5:27 PM<br>
<b>To:</b> Wim Vervoorn &lt;<a href=3D"mailto:wvervoorn@eltan.com" target=
=3D"_blank">wvervoorn@eltan.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a><br>
<b>Subject:</b> Re: webui: setting Boot.Mode and Boot.Source</span><u></u><=
u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<div>
<div>
<p class=3D"MsoNormal">Hello Wim,<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Yes, I&#39;m glad you ask. This is something we are =
currently working on so there is still some work to=C2=A0be done. We&#39;d =
love to get your feedback to see if what you think is missing aligns
 with the work we have planned, and understand what your needs would be fro=
m this functionality as a ser. You can find the current design proposals he=
re:=C2=A0<a href=3D"https://ibm.invisionapp.com/share/8ENYRVXAPFD#/31909513=
8_1-_Boot_Options_-_System_On" target=3D"_blank">https://ibm.invisionapp.co=
m/share/8ENYRVXAPFD#/319095138_1-_Boot_Options_-_System_On</a>
 .=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Note: To leave feedback in InVision, turn on Comment=
 mode from the bottom right hand corner of the screen and then click where =
you want to leave a comment. To navigate through the
 prototype, click where you see flashing blue rectangles or use the right a=
nd left keyboard arrows<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><br>
Please let us know if you have any questions and if you would like to set u=
p some time to review this.=C2=A0<br>
<br>
Best,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Jandra Aranguren=C2=A0 |=C2=A0 GUI Design=C2=A0Team<=
u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
</div>
</div>
</div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Tue, May 7, 2019 at 7:25 AM Wim Vervoorn &lt;<a h=
ref=3D"mailto:wvervoorn@eltan.com" target=3D"_blank">wvervoorn@eltan.com</a=
>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"MsoNormal">Hello,<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Currently the webui doesn=E2=80=99t contain the func=
tionality to change the boot mode and boot source. Are there any plans to a=
dd this to the interface?<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal"><span lang=3D"NL" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif">Best Regards,</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span lang=3D"NL" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif">Wim Vervoorn</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span lang=3D"NL" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif">=C2=A0</span><u></u><u></u></p>
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
</div>

</blockquote></div>

--000000000000724efc058a207bb2--
