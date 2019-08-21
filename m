Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9F2986B8
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 23:44:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DLlp3hMWzDr45
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 07:44:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="HKCo7Zs/"; 
 dkim-atps=neutral
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DLlC4hsqzDr1X
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 07:43:49 +1000 (AEST)
Received: by mail-io1-xd31.google.com with SMTP id s21so7791999ioa.1
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 14:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MuIvm7w+h6LdI42cnP24XmOWM0ZrtJTw2uRaAfDkXUM=;
 b=HKCo7Zs/xO5u//ZEsT6Hg0DTM1ygwqyIeJRDqOaBSynD0h9lxkVjjx4autbCC1eVZZ
 3R5Tmood22J7Y4pHCfElhzWENsuQ0lkQJ3jS5eJfR9HdPdNIoBLJ/tKE1YLh4naRziGJ
 1MTKR3bFyF3dUBByJrGWsRs1tw6yHHzebAoscwSRqBHZbZ8p+kiFJ+4s8E5RcNpJqFDS
 jaUrAmK+hFji3AYNT0EImpQhD32ZaiHXlzO9T/dscOBYwQ+by+qrdHN3AXz6hYRUb8HI
 ALpPI2JOEcsphqFSl2xTwZ8Akv4uAH/I/oJO+t9UHqzsESkiuOSw3ko4VUY0bICsCUl1
 pqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MuIvm7w+h6LdI42cnP24XmOWM0ZrtJTw2uRaAfDkXUM=;
 b=kM8YZnKhMQCi6LjZwH3oEvmPyL+0eiEzN9yQo9DYvL3E4FOzLsFPA4thH5HL4oX9GF
 Q5rMP9LPoX6h9tWwR9/g16ptO4HdYrS8gfrxQ2mohW7WtsIlKW6GUqvKjuRvtZcxI1ZZ
 z2SXSKVjKGysC2NO05r192yDYq7c4TAUqNgvNsHKfzdjdaPQlKODt1+1xrysLq3DL2dy
 zi50VRffcgLRkfudmNXsaHcoMHUGiTVbcOmFjR+tWq7Q6o4y9LNydf5FPg69e7nL73Nn
 D1pMH8R+zohKahW2QW9Cb1w1Xmub3N+hzkPIN827bcrpNlWd7PFJPZRlxRWoDQ+Rf6yM
 /a4A==
X-Gm-Message-State: APjAAAUD6r+mefXdG4xl+FLHbIJlIDUU0P1Xgl6E/pCGD0s+xLebZ8Pu
 DL/PVZLAFLHQWJ3RgUZZ885GjTOUUAWKZbqBSs8H8g==
X-Google-Smtp-Source: APXvYqwAwMBqoOwY387/ZNW+/DNIcknISeubWA5Vx07kDfvYLgHnFDZJm1seSLs35leHgPf9z3rEXB9LjZKbUS/SZEg=
X-Received: by 2002:a5d:9403:: with SMTP id v3mr7289211ion.281.1566423825989; 
 Wed, 21 Aug 2019 14:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <OFEB757C0D.E4799559-ON0025843C.0016DC0E-0025843C.0017D3B9@notes.na.collabserv.com>
 <CADy_Pt3zcSaN9Eh=yM9PC1ex1Nd3XVSEWcwarohsAcm=cwz6cQ@mail.gmail.com>
 <OF3B10C288.9F732822-ON0025845C.000C161E-0025845C.000C3C4C@notes.na.collabserv.com>
In-Reply-To: <OF3B10C288.9F732822-ON0025845C.000C161E-0025845C.000C3C4C@notes.na.collabserv.com>
From: Nancy Yuen <yuenn@google.com>
Date: Wed, 21 Aug 2019 14:43:09 -0700
Message-ID: <CADfYTpFfpxuvW1jFK3BqnUUBTECbSC7z9ueib=m7PQ=7AxV=BA@mail.gmail.com>
Subject: Re: [tsc] How we can make others contribute to openbmc-test-automation
 repository
To: Sivas Srr <sivas.srr@in.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000b7b93c0590a777c0"
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
Cc: james.mihm@gmail.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ravindra S Rao1 <ravindra.s@in.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000b7b93c0590a777c0
Content-Type: text/plain; charset="UTF-8"

Hi Sivas,

I'm sorry I couldn't reply until now.  Internally we've kicked off a large
build, release, and testing effort to improve automation and test coverage
for various testing methods.  Our internal tools do not integrate well with
git based projects so there's a lot of work around that aspect.  Robot
based testing is also part of the effort and it's been started but it has
experiences the same challenges with integrating with our internal tools
that we need to work through.  We'll get there so you will see activity
from my team in the future.  I'm hoping it will be next quarter.

----------
Nancy


On Mon, Aug 19, 2019 at 7:14 PM Sivas Srr <sivas.srr@in.ibm.com> wrote:

> Thank you for your mail James. Expecting to hear / see good progress in
> openbmc-test-automation.
> Similarly other organization also comes up and contribute in test
> repository then it will be good.
>
>
>
> With regards,
> Sivas
>
>
> ----- Original message -----
> From: James Mihm <james.mihm@gmail.com>
> To: Sivas Srr <sivas.srr@in.ibm.com>
> Cc: openbmc@lists.ozlabs.org, Ravindra S Rao1 <ravindra.s@in.ibm.com>
> Subject: [EXTERNAL] Re: [tsc] How we can make others contribute to
> openbmc-test-automation repository
> Date: Sat, Aug 17, 2019 10:25 AM
>
> Hi Sivas, I'm sorry it's taken so long for me to respond. We do want to
> participate in the openbmc-test-automation repository. One of the
> challenges that we have is limited resources working on delivering products
> using our internal test automation tools versus the
> openbmc-test-automation. I'll discuss with my team at Intel to determine
> when can spend some cycles on this effort.
>
> Thanks, James.
>
> On Thu, Jul 18, 2019 at 10:51 PM Sivas Srr <*sivas.srr@in.ibm.com*
> <sivas.srr@in.ibm.com>> wrote:
> Hi All,
> Objective of this mail is to get contribution to openbmc-test-automation
> repository.
> Not only in automation / automation test plan / code review, Even sharing
> test results also fine.
> As openbmc common for both Intel and Power platform, If some one share
> Intel based test results of
> openbmc-test-automation test cases also good.
> Would like to get your suggestions / input on how we can make openbmc-test
> better.
> Hi Brad, Could you please have it in TSC group agenda.
> If needed, Will schedule separate meeting which aligns with all other
> convenient time.
> Thank you in advance Brad.
> With regards,
> Sivas
>
>
>
>

--000000000000b7b93c0590a777c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Sivas,<div><br></div><div>I&#39;m sorry I couldn&#39;t =
reply until now.=C2=A0 Internally we&#39;ve kicked off a large build, relea=
se, and testing effort to improve automation and test coverage for various =
testing methods.=C2=A0 Our internal tools do not integrate well with git ba=
sed projects so there&#39;s a lot of work around that aspect.=C2=A0 Robot b=
ased testing is also part of the effort and it&#39;s been started but it ha=
s experiences the same challenges with integrating with our internal tools =
that we need to work through.=C2=A0 We&#39;ll get there so you will see act=
ivity from my team in the future.=C2=A0 I&#39;m hoping it will be next quar=
ter.</div><div><br></div><div><div><div dir=3D"ltr" class=3D"gmail_signatur=
e" data-smartmail=3D"gmail_signature">----------<br>Nancy</div></div><br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Mon, Aug 19, 2019 at 7:14 PM Sivas Srr &lt;<a href=3D"mailto:sivas.s=
rr@in.ibm.com">sivas.srr@in.ibm.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr" style=3D"font-family:Ar=
ial,Helvetica,sans-serif;font-size:10pt"><div dir=3D"ltr">Thank you for you=
r mail James. Expecting to hear / see good progress in openbmc-test-automat=
ion.</div>
<div dir=3D"ltr">Similarly other organization also comes up and contribute =
in test repository then it will be good.</div>
<div dir=3D"ltr">=C2=A0</div>
<div dir=3D"ltr">=C2=A0</div>
<div dir=3D"ltr">=C2=A0</div>
<div dir=3D"ltr">With regards,</div>
<div dir=3D"ltr">Sivas</div>
<div dir=3D"ltr">=C2=A0</div>
<blockquote dir=3D"ltr" style=3D"border-left:2px solid rgb(170,170,170);mar=
gin-left:5px;padding-left:5px;direction:ltr;margin-right:0px">----- Origina=
l message -----<br>From: James Mihm &lt;<a href=3D"mailto:james.mihm@gmail.=
com" target=3D"_blank">james.mihm@gmail.com</a>&gt;<br>To: Sivas Srr &lt;<a=
 href=3D"mailto:sivas.srr@in.ibm.com" target=3D"_blank">sivas.srr@in.ibm.co=
m</a>&gt;<br>Cc: <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_bla=
nk">openbmc@lists.ozlabs.org</a>, Ravindra S Rao1 &lt;<a href=3D"mailto:rav=
indra.s@in.ibm.com" target=3D"_blank">ravindra.s@in.ibm.com</a>&gt;<br>Subj=
ect: [EXTERNAL] Re: [tsc] How we can make others contribute to openbmc-test=
-automation repository<br>Date: Sat, Aug 17, 2019 10:25 AM<br>=C2=A0<br><fo=
nt size=3D"3">Hi=C2=A0Sivas, I&#39;m sorry it&#39;s taken so long for me to=
 respond. We do want to participate in the openbmc-test-automation reposito=
ry. One of the challenges that we have is limited resources working on deli=
vering products using our internal test automation tools versus the openbmc=
-test-automation. I&#39;ll discuss with my team at Intel to determine when =
can spend some cycles on this effort.</font><br><br><font size=3D"3">Thanks=
, James.</font><br><br><font size=3D"3">On Thu, Jul 18, 2019 at 10:51 PM Si=
vas Srr &lt;</font><a href=3D"mailto:sivas.srr@in.ibm.com" target=3D"_blank=
"><u><font size=3D"3" color=3D"#0000ff">sivas.srr@in.ibm.com</font></u></a>=
<font size=3D"3">&gt;=C2=A0wrote:</font><br><font size=3D"3">Hi All,</font>=
<font size=3D"3">=C2=A0</font><br><font size=3D"3">Objective of this mail i=
s to get contribution to openbmc-test-automation repository.</font><br><fon=
t size=3D"3">Not only in automation / automation test plan / code review, E=
ven sharing test results also fine.</font><br><font size=3D"3">As openbmc c=
ommon for both Intel and Power platform, If some one share Intel based test=
 results of</font><br><font size=3D"3">openbmc-test-automation test cases a=
lso good.</font><font size=3D"3">=C2=A0</font><br><font size=3D"3">Would li=
ke to get your suggestions / input on how we can make openbmc-test better.<=
/font><font size=3D"3">=C2=A0</font><br><font size=3D"3">Hi Brad, Could you=
 please have it in TSC group agenda.</font><br><font size=3D"3">If needed, =
Will schedule separate meeting which aligns with all other convenient time.=
</font><br><font size=3D"3">Thank you in advance Brad.</font><font size=3D"=
3">=C2=A0</font><br><font size=3D"3">With regards,</font><br><font size=3D"=
3">Sivas</font><font size=3D"3">=C2=A0</font><font size=3D"3">=C2=A0</font>=
<font size=3D"3">=C2=A0</font></blockquote>
<div dir=3D"ltr">=C2=A0</div></div><br>

</blockquote></div>

--000000000000b7b93c0590a777c0--
