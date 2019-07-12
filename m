Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6CD67546
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2019 21:07:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lj9m0bB7zDr0Q
	for <lists+openbmc@lfdr.de>; Sat, 13 Jul 2019 05:07:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::72c; helo=mail-qk1-x72c.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="XQUITo9W"; 
 dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lj962K9dzDr0L
 for <openbmc@lists.ozlabs.org>; Sat, 13 Jul 2019 05:07:15 +1000 (AEST)
Received: by mail-qk1-x72c.google.com with SMTP id r21so7248058qke.2
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jul 2019 12:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qFwbuqoesGn0JWlgvyYpsDt2oZlDn5d5vXuORiv2Nww=;
 b=XQUITo9WvyPCAm7hTEkcET5gN6QHzyp+EW7b04e5Ii7dDqUBpbUOz3InxZ2f7fEyf4
 9EKWxcEvcJSf2koBP4kwiQznoxvbW2cGAI9YDmfcBNKhUebRVXAyD3lgWmMwsVkxJoU/
 S3Kk+IZ4ri83lokmqS/1rRxn5pLRJx57nrCeQ2ZpKB8MB+NRbATeJxLzrrt43OFMdSkV
 UXMrcvxIT/aheKqF1lwkLuk9tYLeqgpY7XdsrCZQM/AL7N177XCGWCXHp4Ujd4cSONxQ
 bPkzVHGPdgIysokDuGpGEwKRa3FrGmfCAXOyu0GBkqGo1GXAUZ/mbrRCj/NA8o/XVibk
 pYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qFwbuqoesGn0JWlgvyYpsDt2oZlDn5d5vXuORiv2Nww=;
 b=hGbdyeqqWk0ZqvfpDR6lFocrR+b15h1Cnp1Gx8t3bJfamkGhDcOUyC+NIrOZLyg3gY
 u5KLkRngeToyydpUviS5Ps57zyNj8RWBDPfzFdM+G3y1RIn9t9X8eGWf9a8KMmrmDDUc
 4lLUuMP44TnURDsn752J2R9ybJavVQdX0dGsZS3bLmL5Bk0px3lCF2CidE4L6gh1AViZ
 7ZG6j23EgxRBAkqTwsYMTtrVWGsmEK2z8TG91gTsTjzst11wbgskr1acca99CQNDk66h
 dn6C8rIiBt8EJSUMIpfzXePk77GYw2PsNEJhZ8hzR6iCn7hUJIpIMKMdDuECAGVFHdgQ
 fpSg==
X-Gm-Message-State: APjAAAV9NF+D2Cst74H6gNYyhHk55zXtsIjf7txvVR59wGJEepku5guU
 jOM+nSeaeatIGJiPMsYTDS7y9ExD4Umz6ldwSMJUjg==
X-Google-Smtp-Source: APXvYqx3lLBJnwMm7cIjuvFu4d2UdV9nixzVll6U9D2l8+rbuI9XgfcpxO+zdO9Pbz+m2sJIw5EmdYFdeDy/ypY2ek4=
X-Received: by 2002:ae9:e50b:: with SMTP id w11mr7363079qkf.419.1562958432092; 
 Fri, 12 Jul 2019 12:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <626c8a30d1674c71bfb4d4995dde4ca8@lenovo.com>
In-Reply-To: <626c8a30d1674c71bfb4d4995dde4ca8@lenovo.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Fri, 12 Jul 2019 12:07:01 -0700
Message-ID: <CAJoAoZn6+AZJQWgg_79=gqmAf6016eaWexQUkJDN2q_sfewddw@mail.gmail.com>
Subject: Re: IPMI Add SEL command question
To: Harry Sung1 <hsung1@lenovo.com>
Content-Type: multipart/alternative; boundary="00000000000025484c058d809ece"
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
Cc: Derek Lin23 <dlin23@lenovo.com>, Duke KH Du <dukh@lenovo.com>,
 Andrew MS1 Peng <pengms1@lenovo.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Payne Yang <pyang4@lenovo.com>, Yonghui YH21 Liu <liuyh21@lenovo.com>,
 Lisa YJ19 Liu <liuyj19@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000025484c058d809ece
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Harry, I suggest that you participate in the discussion on the review you
linked to give suggestions. You're right that it's not implemented - if you
have a vested interest in it, your best bet is to find out what approach
Jason etc. took and see if you can help fix the problems they found in your
own implementation. Based on the inactivity there, I'm guessing Intel
deprioritized that command, so you should probably expect to drive
development effort (or modification of that patch) yourself.

On Fri, Jul 12, 2019 at 7:08 AM Harry Sung1 <hsung1@lenovo.com> wrote:

> Hi Team,
>
>
>
> I have a question about Add SEL command.
>
> This standard command seems not be implemented in =E2=80=9Cphosphor-host-=
ipmid=E2=80=9D.
>
> (
> https://github.com/openbmc/phosphor-host-ipmid/blob/master/storagehandler=
.cpp#L605
> )
>
>
>
> Though I found a patch set about it, but it doesn=E2=80=99t be merged in =
master
> due to some issues.
>
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/12951
>
>
>
> Is anyone having any plans to implement it? Or other repository we can
> refer to?
>
>
>
> Thanks,
>
> Harry
>


--=20
Emily Shaffer

--00000000000025484c058d809ece
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Harry, I suggest that you participate in the discussion on=
 the review you linked to give suggestions. You&#39;re right that it&#39;s =
not implemented - if you have a vested interest in it, your best bet is to =
find out what approach Jason etc. took and see if you can help fix the prob=
lems they found in your own implementation. Based on the inactivity there, =
I&#39;m guessing Intel deprioritized that command, so you should probably e=
xpect to drive development effort (or modification of that patch) yourself.=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Fri, Jul 12, 2019 at 7:08 AM Harry Sung1 &lt;<a href=3D"mailto:hsung1@le=
novo.com">hsung1@lenovo.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">





<div lang=3D"ZH-TW">
<div class=3D"gmail-m_1992553702417816486WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Team,<u></u><u></u></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I have a question about Add SEL=
 command. <u></u>
<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">This standard command seems not=
 be implemented in =E2=80=9Cphosphor-host-ipmid=E2=80=9D.<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(<a href=3D"https://github.com/=
openbmc/phosphor-host-ipmid/blob/master/storagehandler.cpp#L605" target=3D"=
_blank">https://github.com/openbmc/phosphor-host-ipmid/blob/master/storageh=
andler.cpp#L605</a>)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Though I found a patch set abou=
t it, but it doesn=E2=80=99t be merged in master due to some issues.<u></u>=
<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://gerrit.openb=
mc-project.xyz/c/openbmc/phosphor-host-ipmid/+/12951" target=3D"_blank">htt=
ps://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/12951</a><u=
></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is anyone having any plans to i=
mplement it? Or other repository we can refer to?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks,<u></u><u></u></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Harry<u></u><u></u></span></p>
</div>
</div>

</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Emily Shaffer</div></div>

--00000000000025484c058d809ece--
