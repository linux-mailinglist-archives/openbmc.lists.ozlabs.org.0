Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D32242E3
	for <lists+openbmc@lfdr.de>; Mon, 20 May 2019 23:33:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457Bvm44PszDqKs
	for <lists+openbmc@lfdr.de>; Tue, 21 May 2019 07:33:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RAHQR/Ue"; 
 dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457BvN3qg4zDqCk
 for <openbmc@lists.ozlabs.org>; Tue, 21 May 2019 07:32:46 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id v78so6287767ybv.1
 for <openbmc@lists.ozlabs.org>; Mon, 20 May 2019 14:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/RHxwsKpFuaO5Wxz3dWz8y7/oi6GZZOCwyZH+/SdDJg=;
 b=RAHQR/Ue7EebDkGfM0JWRzIXWZCk7ovRJ9vvASCqyj6Egt0ngrbY1btf+1DJlPdBvX
 bTKeju/lis2FvjJ+wv6Gw63g2tdVYrhZ3TqJJXpoII89+3sFIf0z1DinF1gbUxeD9Wy9
 P0gduWtZ8GPuuKkyxHiFfCwzHB/K+eMIitAnIuG39vsqoAO6209de4qhVcn1CMyFMZod
 Z544B3Lc9Hq1FFsjzXDqxb8zLi0GjQar6UPUKPCXsCpb21PVRXSuPnmgNusPqkIyFT/C
 cB22/dKNGKThM48WqC3EKPMaDMVXtxBWt2GyGeuz/Q4sMq1f7CVekdP93yrhJyCOXthD
 n4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/RHxwsKpFuaO5Wxz3dWz8y7/oi6GZZOCwyZH+/SdDJg=;
 b=k+XXy5QNPaibUQUyrV1kmfA69mV6iJVvJkU/9kDnk5g46qFKqAZkutcJfEMuBLxenf
 Rx9r38TuKPEgW4/3kGY03DPUie44KM51I5L2JRt26wrfKIEYy0m4CYQnZX0KO2JOXrsl
 Fa57wVmFe0T1phqSHl2kOX3ZcVcY3uDF+ElWm7RgpIx0o6UT3gRfR1wkd4zaVHji1R4K
 dlrVy0Lk5agjahjAshl8iYmNsv6KeMDy1fDp3ECDkuX2hXkas+vSOqaeiNT7XpXtx51x
 mkFmVnk30UaDqDtEOvmXUaSWACweOvDeAcbMJ2GVk0MBJiM03lH5klFdzOotc8vg82T/
 wVNA==
X-Gm-Message-State: APjAAAV6x1EC4aYy5PFRK3naEXlu7I8zADOaElp3Tc87LEw/bopk96O0
 He/c9u262gcbLfKT8XPSSmhett88zHWu2tpGwCKNHedk
X-Google-Smtp-Source: APXvYqzOp+b0b1R1YVZkGFrhmvJyqVzTOy4EG6J2I7+YMwQ8za4XePWUXF3lpoy/w8gX6bWzZUa/IVX2e4j0rKbiYOs=
X-Received: by 2002:a25:358b:: with SMTP id c133mr4206760yba.296.1558387963019; 
 Mon, 20 May 2019 14:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <a345e6df8a574eb394eab94e70474cd8@Eltsrv03.Eltan.local>
 <CAMTupoSh0s1TQySQ+FZyKc8UH5s3hEYjkwNyW+8oBEG6yUBYTw@mail.gmail.com>
 <8978ed3247124b13beccd3975514e11a@Eltsrv03.Eltan.local>
In-Reply-To: <8978ed3247124b13beccd3975514e11a@Eltsrv03.Eltan.local>
From: Jandra A <jandraara@gmail.com>
Date: Mon, 20 May 2019 16:32:32 -0500
Message-ID: <CAMTupoT0SyitQiJaitvCNZ6ckq=qL_tP4Vx_61UwFqzxDDbvzw@mail.gmail.com>
Subject: Re: webui: setting Boot.Mode and Boot.Source
To: Wim Vervoorn <wvervoorn@eltan.com>
Content-Type: multipart/alternative; boundary="000000000000f544b5058958783b"
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

--000000000000f544b5058958783b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Wim,

I believe it is scheduled for October 2019. Would you be interested in
providing feedback and co-creating the GUI design? We can schedule a 30
minute conversation to review the current design proposal and talk about
how it can be improved to best meet your needs.

Regards,
Jandra Aranguren

On Wed, May 8, 2019 at 6:15 AM Wim Vervoorn <wvervoorn@eltan.com> wrote:

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

--000000000000f544b5058958783b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Wim,<div><br></div><div>I believe i=
t is scheduled for October 2019. Would you be interested in providing feedb=
ack and co-creating the GUI design? We can schedule a 30 minute conversatio=
n to review the current design proposal and talk about how it can be improv=
ed to best meet=C2=A0your needs.=C2=A0</div><div><br></div><div>Regards,</d=
iv><div>Jandra Aranguren</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, May 8, 2019 at 6:15 AM Wim Vervoorn &=
lt;<a href=3D"mailto:wvervoorn@eltan.com" target=3D"_blank">wvervoorn@eltan=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_-5969304362012667361gmail-m_379352105150450178WordSec=
tion1">
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Hello Jandra,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Thanks for the reply. I had a look, this is =
exactly what I am looking for. Do you know when this is scheduled to be inc=
luded in the WebUI?<u></u><u></u></span></p>
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
<b>Sent:</b> Tuesday, May 7, 2019 5:27 PM<br>
<b>To:</b> Wim Vervoorn &lt;<a href=3D"mailto:wvervoorn@eltan.com" target=
=3D"_blank">wvervoorn@eltan.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a><br>
<b>Subject:</b> Re: webui: setting Boot.Mode and Boot.Source<u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<div>
<p class=3D"MsoNormal">Hello Wim,<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Yes, I&#39;m glad you ask. This is something we are =
currently working on so there is still some work to=C2=A0be done. We&#39;d =
love to get your feedback to see if what you think is missing aligns with t=
he work we have planned, and understand what your
 needs would be from this functionality as a ser. You can find the current =
design proposals here:=C2=A0<a href=3D"https://ibm.invisionapp.com/share/8E=
NYRVXAPFD#/319095138_1-_Boot_Options_-_System_On" target=3D"_blank">https:/=
/ibm.invisionapp.com/share/8ENYRVXAPFD#/319095138_1-_Boot_Options_-_System_=
On</a>
 .=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Note: To leave feedback in InVision, turn on Comment=
 mode from the bottom right hand corner of the screen and then click where =
you want to leave a comment. To navigate through the prototype, click where=
 you see flashing blue rectangles
 or use the right and left keyboard arrows<u></u><u></u></p>
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
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Tue, May 7, 2019 at 7:25 AM Wim Vervoorn &lt;<a h=
ref=3D"mailto:wvervoorn@eltan.com" target=3D"_blank">wvervoorn@eltan.com</a=
>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
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

</blockquote></div>
</div>

--000000000000f544b5058958783b--
