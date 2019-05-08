Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6907B17599
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 12:06:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zXDR07rvzDqJ5
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 20:05:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::142; helo=mail-it1-x142.google.com;
 envelope-from=tyler.sabdon@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QAphBYNk"; 
 dkim-atps=neutral
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zXCR5yCKzDqHF
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 20:05:05 +1000 (AEST)
Received: by mail-it1-x142.google.com with SMTP id l7so3034722ite.2
 for <openbmc@lists.ozlabs.org>; Wed, 08 May 2019 03:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xAbHk+ZtmHUHgkuFZ8IOlJcwN29j6CyJKhNtiPAVuMA=;
 b=QAphBYNkL2uQ7YMIGBZenQ7K+hEIOivJrAA7FpJUi9CI043EjoBk56avyTKRi9zegP
 5o3h6l8bwXz3+jdCTz90eVuizr24gTtHrOHHfL/eRMLq7uX1kN4FG4BwZZ+5sv76O7sk
 c3AhQPpOPoEzKo6ZjYnYxXUM5s7W5cACKnQmvw4X4S04g5p2NDHKDCEeM3DOm0LquAL8
 OjT49oIooiM9PGwcPs/uNTbb2JtwH05x/CrBzGqmA5LQOU198jF9/Ju7eul7RnekWcDy
 HsuVH7nYQOelYN2t5/Z28/YFwViNqTYjLSetgggYZwLAJ3+ICJNdl8e56m5s1LUMKr7V
 bwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xAbHk+ZtmHUHgkuFZ8IOlJcwN29j6CyJKhNtiPAVuMA=;
 b=Q4u61IX9MG+IvjUNUMGcL9ayMgsGTWenMjVuDFLzXVcl55p370xPGwIPx9iU7hbGon
 v0bP3UVp398T8ALgw3Qh0wlDBb0a9HXOkBzj+I7BB55jqph5ApECumgHX77gFsv3XtBJ
 JXlNQ99VEf7y2s6QuyzIkTBwGKIwhFya0A7sO9B5zzsXw2tx5NS7CxMPmOvOUvFnV4SL
 We3A62e++5CsSV0/vyw9eJqOFRXQzYO/YjIQmOlgi6S3Ez6Ln+U/H2wdR4MtJdD59UjB
 k6YLTiu0OtYXFoCYPgV7oEK4gKwtM4ZoVwpTtB4/CjWD4QuUb6GG6JsEX6CR6Liqk/UD
 FDzg==
X-Gm-Message-State: APjAAAU+oQPuWYYkVtTFjnEY+6cNGhSrXNZDPJFGFnq4iD9bB0/B+veG
 6F2aV5JqUmpmDAOkoF6UldlOhTabFNEvEbXTNN0=
X-Google-Smtp-Source: APXvYqyJzQR5kJBVY9dy0lGkjYzU2/uYKz+drQCb4aDsRutLYDrZnHNVNkYn205taQmyLA0tTvwmETENw2v95VjaVCU=
X-Received: by 2002:a24:b701:: with SMTP id h1mr2715795itf.178.1557309903227; 
 Wed, 08 May 2019 03:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAO9PYRL4Pr2hV=Hz5dvTJzhx-x9WPJL12qZEKuh+DiCWx2RMww@mail.gmail.com>
 <CAHkHK0_FCE=QHF6tdD3DyGNcOMZHkhrkAZmgPwQ0Lr-G0-e9Qg@mail.gmail.com>
In-Reply-To: <CAHkHK0_FCE=QHF6tdD3DyGNcOMZHkhrkAZmgPwQ0Lr-G0-e9Qg@mail.gmail.com>
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Wed, 8 May 2019 18:05:03 +0800
Message-ID: <CAO9PYRKhSmuefFWFiY=XM=zEdMJ7XpKcc-UBYLUoHEDbjB9F5w@mail.gmail.com>
Subject: Re: Is there Intel node management support?
To: qianlihu <wangzhiqiang8906@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000096535b05885d7796"
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

--00000000000096535b05885d7796
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John:
    Thanks for your kindly reply. I still have lot of question about NM in
openbmc.


qianlihu <wangzhiqiang8906@gmail.com> =E6=96=BC 2019=E5=B9=B45=E6=9C=888=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8811:43=E5=AF=AB=E9=81=93=EF=BC=
=9A

> On Wed, May 8, 2019 at 11:22 AM Deng Tyler <tyler.sabdon@gmail.com> wrote=
:
> >
> > Hi all:
> >     Is there any package support Intel node management in current
> openbmc or plan to support it?
> According to my understanding, you can refer to these repos:
> [ipmbbridge] (https://github.com/openbmc/ipmbbridge)
> [node-manager] (https://github.com/Intel-BMC/node-manager)
>
This repo implement a proxy which listen message from dbus then send
command via ipmbbriedge to ME. But it seems not fully support NM command.
Am I right?
According my understanding, DCMI command(netfn: 2Ch) is subset of intel NM.
In current openbmc phosphor-ipmi-host support DCMI command such as set/get
power cap value. Do these DCMI commands  implement for intel NM?
DCMI power cap command send dbus message to bus service
"xyz.openbmc_project.Control.Power.Cap", do you know which service charge
for it?


> Also need the ipmi related patch here
>
>
> https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods/meta-wo=
lfpass/recipes-kernel/linux/linux-aspeed
>
This link seems about kernel patch. What is your mean "ipmi related patch"?=
?

Tyler

> John
> >
> > BR,
> > Tyler
>

--00000000000096535b05885d7796
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi John:</div><div>=C2=A0 =C2=A0 Tha=
nks for your kindly reply. I still have lot of question about NM in openbmc=
.</div><div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">qianlihu &lt;<a href=3D"mailto:wangzhiqiang8906@gmail.com">=
wangzhiqiang8906@gmail.com</a>&gt; =E6=96=BC 2019=E5=B9=B45=E6=9C=888=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8811:43=E5=AF=AB=E9=81=93=EF=BC=9A<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, May 8, 20=
19 at 11:22 AM Deng Tyler &lt;<a href=3D"mailto:tyler.sabdon@gmail.com" tar=
get=3D"_blank">tyler.sabdon@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi all:<br>
&gt;=C2=A0 =C2=A0 =C2=A0Is there any package support Intel node management =
in current openbmc or plan to support it?<br>
According to my understanding, you can refer to these repos:<br>
[ipmbbridge] (<a href=3D"https://github.com/openbmc/ipmbbridge" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/openbmc/ipmbbridge</a>)<br>
[node-manager] (<a href=3D"https://github.com/Intel-BMC/node-manager" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/Intel-BMC/node-manager=
</a>)<br></blockquote><div>This repo implement a proxy which listen message=
 from dbus then send command via ipmbbriedge to ME. But it seems not fully =
support NM command. Am I right?</div><div>According my understanding, DCMI =
command(netfn: 2Ch) is subset of intel NM. In current openbmc phosphor-ipmi=
-host support DCMI command such as set/get power cap value. Do these DCMI c=
ommands=C2=A0 implement for intel NM?</div><div>DCMI power cap command send=
 dbus message to bus service &quot;xyz.openbmc_project.Control.Power.Cap&qu=
ot;, do you know which service charge for it?</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
Also need the ipmi related patch here<br>
<br>
<a href=3D"https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mod=
s/meta-wolfpass/recipes-kernel/linux/linux-aspeed" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-m=
ods/meta-wolfpass/recipes-kernel/linux/linux-aspeed</a><br></blockquote><di=
v>This link seems about kernel patch. What is your mean &quot;ipmi related =
patch&quot;??</div><div>=C2=A0</div><div>Tyler</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
John<br>
&gt;<br>
&gt; BR,<br>
&gt; Tyler<br>
</blockquote></div></div></div>

--00000000000096535b05885d7796--
