Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB9410AD87
	for <lists+openbmc@lfdr.de>; Wed, 27 Nov 2019 11:27:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NH5j16lqzDqT4
	for <lists+openbmc@lfdr.de>; Wed, 27 Nov 2019 21:27:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=ojayanth@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ilFzFA9l"; 
 dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NH4x4CqxzDqSH
 for <openbmc@lists.ozlabs.org>; Wed, 27 Nov 2019 21:26:50 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id 23so16921876otf.2
 for <openbmc@lists.ozlabs.org>; Wed, 27 Nov 2019 02:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dC2Jk8PYNBC2/MzgblORY7ryq3Qa0W2tqnIutp34KEQ=;
 b=ilFzFA9lvqdjetNq2pPb/3h2cbyOeEG2DbHDRIiP6iQloLySqGA54pAUX0ZUqm5N2L
 jzq8rrBFyYC6xU+5uZNuNez6/ZmDYBbkfOPpIyEIUQyI3lxKNbqxebaDT9GA15zgTiDw
 dWBcob/DSHQXuF5aqznTvUAo3BplMeMtnoh5/nDe5wj9qmcDTAXln8DZJi0AOhSqk1au
 94+FkZYBYa0sB4X0T93HF5YxbnetSBHorrLbO8vB2KSfBZdNhPlnpXBpIJZn1sa3GVgu
 anJNWgm3YzcJpwW56GoZ5GdDZobinnoWSN9ijaDKtOWF4Wj+ACNYJs9Q9D4vq+lHjaa4
 xNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dC2Jk8PYNBC2/MzgblORY7ryq3Qa0W2tqnIutp34KEQ=;
 b=STyN1o4tTIUbiRKaGUFCfZaw1IvfsdRpQar+jf3siV7Zquu9ZAOqyR6hFITqGWNRb0
 wSueEo5oKNUwtR5N4mrRYGBB9Ghp7DO0qzVLzTixpHPS1XF4t4ZA+q8RTOgwZPbEDL8I
 KBiWmSmMy8tjJmg+vztlYHAOqf4fKCYXer5uCx4JuZkGFbmDtc/EmhP+IbI/JceljMDK
 a0Ho/pTdUJfPqCuk2YuxefQsMLc9B6w/QaxLTMGG2J4I25pfBbtAUxPfCm2Y7Bgylf6t
 8UMYLhobjheaWTcAXIk+j0QO12sw8V3cnkk8658V5i29QNEyxKaZAMKkYkrbfSXr0MuJ
 nKhg==
X-Gm-Message-State: APjAAAUx9SAeLnpMWOYH9d4Rl0FjetgfuGx7Gq8v9k9tIc2KODZwuqA0
 C9zjo4La/vC0RPWLTQAB67Bp0S1uMk5Xl7iTW6A=
X-Google-Smtp-Source: APXvYqxWa8k5s94hLu0OTHRvyIy0Rip44ch20hgg30q1FwDHtKds/5tz7+KVDpoPdVOaxoxPq2cSdYmOlSSOwUuNYtE=
X-Received: by 2002:a9d:7642:: with SMTP id o2mr2729517otl.177.1574850406368; 
 Wed, 27 Nov 2019 02:26:46 -0800 (PST)
MIME-Version: 1.0
References: <SN6PR11MB2749157C9FFBF80F4C8FA9B492490@SN6PR11MB2749.namprd11.prod.outlook.com>
In-Reply-To: <SN6PR11MB2749157C9FFBF80F4C8FA9B492490@SN6PR11MB2749.namprd11.prod.outlook.com>
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Wed, 27 Nov 2019 15:56:35 +0530
Message-ID: <CACkAXSoC5N7VQ2v5zTMbRMJM0Ez_zv4mKH4vrRQEJ-Y+3oYfQw@mail.gmail.com>
Subject: Re: phosphor-certificate-manager refactoring.
To: "Kurzynski, Zbigniew" <zbigniew.kurzynski@intel.com>
Content-Type: multipart/alternative; boundary="0000000000000bc8c20598516f3d"
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

--0000000000000bc8c20598516f3d
Content-Type: text/plain; charset="UTF-8"

Proposal looks good,

Looking for patch sets related to this.

On Fri, Nov 22, 2019 at 2:39 PM Kurzynski, Zbigniew <
zbigniew.kurzynski@intel.com> wrote:

> Hi everyone,
> I think it is good time to do some code refactoring in
> phosphor-certificate-manager.
> The certificate manager supports few certificate types, each is managed by
> a separate service instance.
>         phosphor-certificate-manager@authority.service,
> phosphor-certificate-manager@bmcweb.service,
> phosphor-certificate-manager@nslcd.service
> Initially the certificate manager was designed to support single
> certificate file. But now one of its instances supports multiple files and
> the code for that case differs quite much from the rest.
> I would like to propose a small refactoring of this code in following
> steps:
>
> Step 1.
> Create a new subclass of Certificate. The base class will remain as is,
> focusing on single certificate approach, while its derived child will
> extend it with support for multiple certificates.
> The Manager class seems quite generic and I would leave it as is. Two
> instances will operate on the base Certificate class, while the third will
> use class derived from the Certificate.
>
> Step 2.
> Moving files:
>         1.
> meta-phosphor/recipes-phosphor/certificate/phosphor-nslcd-cert-config/env
>         2.
> meta-phosphor/recipes-phosphor/certificate/phosphor-nslcd-authority-cert-config/env
>         3.
> meta-phosphor/recipes-phosphor/certificate/phosphor-bmcweb-cert-config/env
> to repository phosphor-certificate-manager under a new directory 'service'
>
> Getting rid of below recipes and moving their functionality to
> phosphor-certificate-manager_git.bb if possible.
>         phosphor-bmcweb-cert-config.bb, phosphor-nslcd-cert-config.bb,
> phosphor-nslcd-authority-cert-config.bb
>
> Step 3.
> Changing the way of managing and storing TrustStore certificates.
>
> Now all certificates are stored and managed directly in a
> /etc/ssl/certs/authority/ , but files in that directory are subject to many
> restrictions like:
>         the files must be named using the subject name's hash and an
> extension of '.0',
>         If there are two files with the same hash they should have
> different extension number,
>         Extension numbers cannot have gaps, which is a problem when we
> delete some certificates.
>
> I propose to store certificate files in a separate location, where file
> names do not have such restrictions.
> And put in this folder /etc/ssl/certs/authority/ only soft links to
> original files.
> Each time when any of certificate will be changed/deleted/added the
> manager should simply delete all links from /etc/ssl/certs/authority and
> the recreate them by iterating all certs files.
>
> Please let me know if you have any concerns.
>
> -Zbigniew
> --------------------------------------------------------------------
>
> Intel Technology Poland sp. z o.o.
> ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII
> Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP
> 957-07-52-316 | Kapital zakladowy 200.000 PLN.
>
> Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego
> adresata i moze zawierac informacje poufne. W razie przypadkowego
> otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej
> usuniecie; jakiekolwiek
> przegladanie lub rozpowszechnianie jest zabronione.
> This e-mail and any attachments may contain confidential material for the
> sole use of the intended recipient(s). If you are not the intended
> recipient, please contact the sender and delete all copies; any review or
> distribution by
> others is strictly prohibited.
>
>

--0000000000000bc8c20598516f3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Proposal looks good, <br></div><div><br></div><div>Lo=
oking for patch sets related to this.</div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 22, 2019 at 2:39 PM =
Kurzynski, Zbigniew &lt;<a href=3D"mailto:zbigniew.kurzynski@intel.com">zbi=
gniew.kurzynski@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hi everyone,=C2=A0 <br>
I think it is good time to do some code refactoring in phosphor-certificate=
-manager.<br>
The certificate manager supports few certificate types, each is managed by =
a separate service instance.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 phosphor-certificate-manager@authority.service,=
 phosphor-certificate-manager@bmcweb.service, phosphor-certificate-manager@=
nslcd.service<br>
Initially the certificate manager was designed to support single certificat=
e file. But now one of its instances supports multiple files and the code f=
or that case differs quite much from the rest.<br>
I would like to propose a small refactoring of this code in following steps=
:<br>
<br>
Step 1.<br>
Create a new subclass of Certificate. The base class will remain as is, foc=
using on single certificate approach, while its derived child will extend i=
t with support for multiple certificates.<br>
The Manager class seems quite generic and I would leave it as is. Two insta=
nces will operate on the base Certificate class, while the third will use c=
lass derived from the Certificate.<br>
<br>
Step 2.<br>
Moving files:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1. meta-phosphor/recipes-phosphor/certificate/p=
hosphor-nslcd-cert-config/env<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 2. meta-phosphor/recipes-phosphor/certificate/p=
hosphor-nslcd-authority-cert-config/env<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 3. meta-phosphor/recipes-phosphor/certificate/p=
hosphor-bmcweb-cert-config/env<br>
to repository phosphor-certificate-manager under a new directory &#39;servi=
ce&#39;<br>
<br>
Getting rid of below recipes and moving their functionality to <a href=3D"h=
ttp://phosphor-certificate-manager_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">phosphor-certificate-manager_git.bb</a> if possible.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://phosphor-bmcweb-cert-config.b=
b" rel=3D"noreferrer" target=3D"_blank">phosphor-bmcweb-cert-config.bb</a>,=
 <a href=3D"http://phosphor-nslcd-cert-config.bb" rel=3D"noreferrer" target=
=3D"_blank">phosphor-nslcd-cert-config.bb</a>, <a href=3D"http://phosphor-n=
slcd-authority-cert-config.bb" rel=3D"noreferrer" target=3D"_blank">phospho=
r-nslcd-authority-cert-config.bb</a><br>
<br>
Step 3.<br>
Changing the way of managing and storing TrustStore certificates.<br>
<br>
Now all certificates are stored and managed directly in a /etc/ssl/certs/au=
thority/ , but files in that directory are subject to many restrictions lik=
e: <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 the files must be named using the subject name&=
#39;s hash and an extension of &#39;.0&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 If there are two files with the same hash they =
should have different extension number,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Extension numbers cannot have gaps, which is a =
problem when we delete some certificates.<br>
<br>
I propose to store certificate files in a separate location, where file nam=
es do not have such restrictions.<br>
And put in this folder /etc/ssl/certs/authority/ only soft links to origina=
l files.<br>
Each time when any of certificate will be changed/deleted/added the manager=
 should simply delete all links from /etc/ssl/certs/authority and the recre=
ate them by iterating all certs files.<br>
<br>
Please let me know if you have any concerns.<br>
<br>
-Zbigniew<br>
--------------------------------------------------------------------<br>
<br>
Intel Technology Poland sp. z o.o.<br>
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydz=
ial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-31=
6 | Kapital zakladowy 200.000 PLN.<br>
<br>
Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata=
 i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wi=
adomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiek=
olwiek<br>
przegladanie lub rozpowszechnianie jest zabronione.<br>
This e-mail and any attachments may contain confidential material for the s=
ole use of the intended recipient(s). If you are not the intended recipient=
, please contact the sender and delete all copies; any review or distributi=
on by<br>
others is strictly prohibited.<br>
<br>
</blockquote></div>

--0000000000000bc8c20598516f3d--
