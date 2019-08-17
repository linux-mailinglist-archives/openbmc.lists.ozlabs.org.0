Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB48590D02
	for <lists+openbmc@lfdr.de>; Sat, 17 Aug 2019 06:55:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 469SZ05ytyzDrcF
	for <lists+openbmc@lfdr.de>; Sat, 17 Aug 2019 14:55:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c2e; helo=mail-yw1-xc2e.google.com;
 envelope-from=james.mihm@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OYMAepll"; 
 dkim-atps=neutral
Received: from mail-yw1-xc2e.google.com (mail-yw1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 469SYQ4SHSzDrSq
 for <openbmc@lists.ozlabs.org>; Sat, 17 Aug 2019 14:55:20 +1000 (AEST)
Received: by mail-yw1-xc2e.google.com with SMTP id m11so2463235ywh.3
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 21:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H6JdUbObSlye/F5zmSdY24mMSPoUM9r5QS/9UmgyPkE=;
 b=OYMAepllOtlkcHZym/g8joPY+QglV6oLNKXsj8k2bjr4m88auQ1hD+mD3FAAbZ7Rmm
 T7zE6AUa8lPNMtMQR4xhmh4VNudcO11uOVJf7aySCKFHqxDt5BCxShaGYwPBOzqU0KuW
 lyovvnBkFurfUOop6gWiFBaCzrYDBfmSjUlYcSiatzabbAS3bQ0TGmIBjxOLOuDXJkZJ
 prIXqNPnXNEQJ1vkgrW5NlqnuU/td/Q5Z3Pvr3KL0TLQAFyckHb7ZTaXSF860nGNxbYo
 OzD9KlPSA257z0VAeL2aZ4FcqIP7ClZINHtUEbDVULjxQI1Oi6CV5z/yIiNMKnZ42BZo
 ozyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H6JdUbObSlye/F5zmSdY24mMSPoUM9r5QS/9UmgyPkE=;
 b=Jy8UDBJv0/ptQ/CCYqKPD2+0k4L/WbfXIhVBbjeQ31eB8x0UzBHHICDOC9nrArTUOS
 0JQ34mjJ+FMNaRr6JSy8M6ooavQkD6x7z0HY7trQ8MOhVVWX0tt/soxSG4MNamjWATrB
 KHAxFZ2bKAQblVZ0rB06VXQX4yu1E2RUGcUtqFA41k/1zTWMinPOUxIcOhCy3Utmubny
 pwk47N6v8iUV0Psw4wmAXLKTzA6yxDZ4YnnacTxvxJrCfgyXQpu5DIbyfNzLD/Onb476
 AM21PsUKlOO9sB0FpmlUr2a5UCmVoX8+ik7oXodfU79l09/PGqXjJDq6xJoHBYSGV1r4
 bM5g==
X-Gm-Message-State: APjAAAVKR1Ah+WBw4ZVRsmEpJ4Fj39imnWmnTWYJI3FQ/n2YVoiYslnQ
 /5qJK4+54XxtjokwRPu4H+62MM3aoUc0wBvsYpI=
X-Google-Smtp-Source: APXvYqyRXhCpwA+Y1/rXVGQ+FzUST8LF9dr894EkgPsAnkTGlItpGgqkU1BKRQRshNNs56vDfziNoD06sWBTZn9cYrA=
X-Received: by 2002:a0d:c985:: with SMTP id l127mr9155165ywd.332.1566017717120; 
 Fri, 16 Aug 2019 21:55:17 -0700 (PDT)
MIME-Version: 1.0
References: <OFEB757C0D.E4799559-ON0025843C.0016DC0E-0025843C.0017D3B9@notes.na.collabserv.com>
In-Reply-To: <OFEB757C0D.E4799559-ON0025843C.0016DC0E-0025843C.0017D3B9@notes.na.collabserv.com>
From: James Mihm <james.mihm@gmail.com>
Date: Fri, 16 Aug 2019 21:54:39 -0700
Message-ID: <CADy_Pt3zcSaN9Eh=yM9PC1ex1Nd3XVSEWcwarohsAcm=cwz6cQ@mail.gmail.com>
Subject: Re: [tsc] How we can make others contribute to openbmc-test-automation
 repository
To: Sivas Srr <sivas.srr@in.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000bdb1bb059048e907"
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
Cc: openbmc@lists.ozlabs.org, Ravindra S Rao1 <ravindra.s@in.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000bdb1bb059048e907
Content-Type: text/plain; charset="UTF-8"

Hi Sivas, I'm sorry it's taken so long for me to respond. We do want to
participate in the openbmc-test-automation repository. One of the
challenges that we have is limited resources working on delivering products
using our internal test automation tools versus the
openbmc-test-automation. I'll discuss with my team at Intel to determine
when can spend some cycles on this effort.

Thanks, James.

On Thu, Jul 18, 2019 at 10:51 PM Sivas Srr <sivas.srr@in.ibm.com> wrote:

> Hi All,
>
> Objective of this mail is to get contribution to openbmc-test-automation
> repository.
> Not only in automation / automation test plan / code review, Even sharing
> test results also fine.
> As openbmc common for both Intel and Power platform, If some one share
> Intel based test results of
> openbmc-test-automation test cases also good.
>
> Would like to get your suggestions / input on how we can make openbmc-test
> better.
>
> Hi Brad, Could you please have it in TSC group agenda.
> If needed, Will schedule separate meeting which aligns with all other
> convenient time.
> Thank you in advance Brad.
>
> With regards,
> Sivas
>
>
>
>
>

--000000000000bdb1bb059048e907
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Sivas, I&#39;m sorry it&#39;s taken so long for me=
 to respond. We do want to participate in the openbmc-test-automation repos=
itory. One of the challenges that we have is limited resources working on d=
elivering products using our internal test automation tools versus the open=
bmc-test-automation. I&#39;ll discuss with my team at Intel to determine wh=
en can spend some cycles on this effort.<div><br></div><div>Thanks, James.<=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Thu, Jul 18, 2019 at 10:51 PM Sivas Srr &lt;<a href=3D"mailto:sivas=
.srr@in.ibm.com">sivas.srr@in.ibm.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div class=3D"gmail-m_-176877250727129=
4365socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial,Helvetica,sa=
ns-serif;font-size:10pt"><div dir=3D"ltr">Hi All,</div>
<div dir=3D"ltr">=C2=A0</div>
<div dir=3D"ltr">Objective of this mail is to get contribution to openbmc-t=
est-automation repository.</div>
<div dir=3D"ltr">Not only in automation / automation test plan / code revie=
w, Even sharing test results also fine.</div>
<div dir=3D"ltr">As openbmc common for both Intel and Power platform, If so=
me one share Intel based test results of</div>
<div dir=3D"ltr">openbmc-test-automation test cases also good.</div>
<div dir=3D"ltr">=C2=A0</div>
<div dir=3D"ltr">Would like to get your suggestions / input on how we can m=
ake openbmc-test better.</div>
<div dir=3D"ltr">=C2=A0</div>
<div dir=3D"ltr">Hi Brad, Could you please have it in TSC group agenda.</di=
v>
<div dir=3D"ltr">If needed, Will schedule separate meeting which aligns wit=
h all other convenient time.</div>
<div dir=3D"ltr">Thank you in advance Brad.</div>
<div dir=3D"ltr">=C2=A0</div>
<div dir=3D"ltr">With regards,</div>
<div dir=3D"ltr">Sivas</div>
<div dir=3D"ltr">=C2=A0</div>
<div dir=3D"ltr">=C2=A0</div>
<div dir=3D"ltr">=C2=A0</div></div><br>

</blockquote></div>

--000000000000bdb1bb059048e907--
