Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB82B31E335
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 00:47:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DgvfK6pRsz30KS
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 10:47:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=Q1SKjoWv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2d;
 helo=mail-io1-xd2d.google.com; envelope-from=yuenn@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Q1SKjoWv; dkim-atps=neutral
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dgvf652fSz2ydJ
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 10:47:40 +1100 (AEDT)
Received: by mail-io1-xd2d.google.com with SMTP id e133so154805iof.8
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 15:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M13nSPhIf6N1oE1NldUk7lxgijOkf7SUfBDYE7CbyCg=;
 b=Q1SKjoWvJI8t3aGULew5BgFWmyLKqIi0ZHiVx/wvQRel7EUbtBzmj3fZrv9eB2hPK5
 Z6UY3eM6M7u8gj3RNYsz45pLr5VgUFgswVzO0V9KyhXxEUWTxsxXGt9KH+xBckbbfDMF
 7ZtAsTlFbW7Y8bRDXhfJTnHbfr+pIsFoZvpuoX4QOLukYuH6nmb6DCyTe5a0HEjuQSxD
 7pTNNkHjb/QmFYbghwDBfR5NMCNRknIyzBNRAEQdgBU+4Y4eJFIXsrSxTbu9xthENqjj
 0rDvehJBXTqouQv5fq0gU8aYdOuNdBBKdX5kzAojw07Rg8JkeNCQu5N77c7QhS9/zyHj
 O7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M13nSPhIf6N1oE1NldUk7lxgijOkf7SUfBDYE7CbyCg=;
 b=EHr90O3wOgA4o9Q7JC5tvMaQzmW7pBNUxjqwYLZo96eNwVDszC7kni2a6HE1ab9EQ9
 woiCNnaLrYyBBiwf1+0oEFQSf4IniS3enH69z1wJELnes7xDFchDp/qjHhZPTcnWmmep
 fNrctmx68hm8029fqHc2ez7Khgl50fsQc/IQaTStaEVQkg2GwmaQaG6adEnwDQLj0L8S
 NEaV+yXZMhF8aoVi2igpU4EyX3zhQ+RTC+gA7lUQWJFJ2p5zQNxNLH27+tJsuikEmJzE
 +4a0Lv+oWDu+mcSf3RKsiTYkocqyrcMNhX6gC2+hqeNtpyY8B35xiORPqbxkjmg+ZpA7
 5Akw==
X-Gm-Message-State: AOAM532gTCnDH2PVYagxbw1D43upN/PPZyt/z3ZQ7+ikisvjYUxIEkC2
 NsFizSW2tpFVtZTksfbExUCiB6Mg4gK2Ckv08ywoisZ7ZdiZYg==
X-Google-Smtp-Source: ABdhPJwjTN0rIjNmMP6SX7rxjootRAuLj0PrVa+qcXaSJ/fgoq6W76NJaczglK8GnaGdTDkz+jsX5BOqKn9DtX0V1IM=
X-Received: by 2002:a05:6638:b12:: with SMTP id
 a18mr1904741jab.114.1613605656278; 
 Wed, 17 Feb 2021 15:47:36 -0800 (PST)
MIME-Version: 1.0
References: <71820e5a-1231-1937-1344-dee9f4a03600@os.amperecomputing.com>
In-Reply-To: <71820e5a-1231-1937-1344-dee9f4a03600@os.amperecomputing.com>
From: Nancy Yuen <yuenn@google.com>
Date: Wed, 17 Feb 2021 15:46:59 -0800
Message-ID: <CADfYTpF9yX0xheCwu5mftWs9b4YAe=ttGNNsf7GL8KkpW4dAcw@mail.gmail.com>
Subject: Re: Any convention on putting source codes into openbmc/openbmc
 repository
To: Thang Nguyen <thang@os.amperecomputing.com>
Content-Type: multipart/alternative; boundary="000000000000f38a1205bb90d7a4"
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

--000000000000f38a1205bb90d7a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Code should be put into an appropriate repo, and repos created where
necessary.  Then referenced in recipes from openbmc/openbmc metalayers.

On Wed, Feb 17, 2021 at 12:55 AM Thang Nguyen <thang@os.amperecomputing.com=
>
wrote:

> Hi,
>
> We implemented several features using c/cpp codes. Currently we put the
> c/cpp source into the openbmc repository like below:
>
>
> https://github.com/ampere-openbmc/openbmc/tree/ampere/meta-ampere/meta-co=
mmon/recipes-ac01/host/ampere-host-error-monitor
>
>
> https://github.com/ampere-openbmc/openbmc/tree/ampere/meta-ampere/meta-ja=
de/recipes-ampere/host/ampere-scp-failover
>
> I check from http://github.com/openbmc/openbmc but don't see source
> codes put there. Is there any rule that prevent source codes put into
> the openbmc repository?
>
>
> Best Regards,
>
> Thang Q. Nguyen -
>
>

--=20

Nancy Yuen

=E2=80=A2

Google Platforms

=E2=80=A2

yuenn@google.com

=E2=80=A2

Google LLC

--000000000000f38a1205bb90d7a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Code should be put into an appropriate repo, and repos cre=
ated where necessary.=C2=A0 Then referenced in recipes from openbmc/openbmc=
 metalayers.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Wed, Feb 17, 2021 at 12:55 AM Thang Nguyen &lt;<a href=3D"ma=
ilto:thang@os.amperecomputing.com">thang@os.amperecomputing.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
We implemented several features using c/cpp codes. Currently we put the <br=
>
c/cpp source into the openbmc repository like below:<br>
<br>
<a href=3D"https://github.com/ampere-openbmc/openbmc/tree/ampere/meta-amper=
e/meta-common/recipes-ac01/host/ampere-host-error-monitor" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/ampere-openbmc/openbmc/tree/ampere/=
meta-ampere/meta-common/recipes-ac01/host/ampere-host-error-monitor</a><br>
<br>
<a href=3D"https://github.com/ampere-openbmc/openbmc/tree/ampere/meta-amper=
e/meta-jade/recipes-ampere/host/ampere-scp-failover" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/ampere-openbmc/openbmc/tree/ampere/meta-a=
mpere/meta-jade/recipes-ampere/host/ampere-scp-failover</a><br>
<br>
I check from <a href=3D"http://github.com/openbmc/openbmc" rel=3D"noreferre=
r" target=3D"_blank">http://github.com/openbmc/openbmc</a> but don&#39;t se=
e source <br>
codes put there. Is there any rule that prevent source codes put into <br>
the openbmc repository?<br>
<br>
<br>
Best Regards,<br>
<br>
Thang Q. Nguyen -<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><span><div dir=3D"ltr" style=3D=
"margin-left:0pt" align=3D"left"><span><div dir=3D"ltr" align=3D"left"><tab=
le style=3D"border:none;border-collapse:collapse"><colgroup><col width=3D"7=
6"><col width=3D"7"><col width=3D"111"><col width=3D"7"><col width=3D"122">=
<col width=3D"7"><col width=3D"71"></colgroup><tbody><tr style=3D"height:15=
pt"><td style=3D"border-top:1.5pt solid rgb(213,15,37);vertical-align:middl=
e;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1.38;text-align:cent=
er;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-fam=
ily:Roboto,sans-serif;color:rgb(102,102,102);background-color:transparent;f=
ont-weight:700;vertical-align:baseline;white-space:pre-wrap">Nancy Yuen</sp=
an></p></td><td style=3D"border-top:1.5pt solid rgb(102,102,102);vertical-a=
lign:middle;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1.38;text-=
align:center;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11p=
t;font-family:Arial;color:rgb(255,0,0);background-color:transparent;font-we=
ight:700;vertical-align:baseline;white-space:pre-wrap">=E2=80=A2</span></p>=
</td><td style=3D"border-top:1.5pt solid rgb(51,105,232);vertical-align:mid=
dle;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1.38;text-align:ce=
nter;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-f=
amily:Roboto,sans-serif;color:rgb(102,102,102);background-color:transparent=
;font-weight:700;vertical-align:baseline;white-space:pre-wrap">Google Platf=
orms=C2=A0</span></p></td><td style=3D"border-top:1.5pt solid rgb(102,102,1=
02);vertical-align:middle;overflow:hidden"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;text-align:center;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:11pt;font-family:Arial;color:rgb(61,133,198);background-color:tr=
ansparent;font-weight:700;vertical-align:baseline;white-space:pre-wrap">=E2=
=80=A2</span></p></td><td style=3D"border-top:1.5pt solid rgb(0,153,57);ver=
tical-align:middle;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1.3=
8;text-align:center;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-s=
ize:10pt;font-family:Roboto,sans-serif;color:rgb(102,102,102);background-co=
lor:transparent;font-weight:700;vertical-align:baseline;white-space:pre-wra=
p"><a href=3D"mailto:yuenn@google.com" target=3D"_blank">yuenn@google.com</=
a></span></p></td><td style=3D"border-top:1.5pt solid rgb(102,102,102);vert=
ical-align:middle;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1.38=
;text-align:center;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-si=
ze:11pt;font-family:Arial;color:rgb(0,153,57);background-color:transparent;=
font-weight:700;vertical-align:baseline;white-space:pre-wrap">=E2=80=A2</sp=
an></p></td><td style=3D"border-top:1.5pt solid rgb(238,178,17);vertical-al=
ign:middle;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1.38;text-a=
lign:center;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt=
;font-family:Roboto,sans-serif;color:rgb(102,102,102);background-color:tran=
sparent;font-weight:700;vertical-align:baseline;white-space:pre-wrap">Googl=
e LLC</span></p></td></tr></tbody></table></div></span></div></span></div><=
/div>

--000000000000f38a1205bb90d7a4--
