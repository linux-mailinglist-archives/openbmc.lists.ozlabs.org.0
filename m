Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 651A5108240
	for <lists+openbmc@lfdr.de>; Sun, 24 Nov 2019 06:47:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47LK1r3WhnzDqrM
	for <lists+openbmc@lfdr.de>; Sun, 24 Nov 2019 16:47:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=gorojohn17@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ql1CYlXP"; 
 dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47LK174Ft7zDqY1
 for <openbmc@lists.ozlabs.org>; Sun, 24 Nov 2019 16:46:45 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id f10so9813136oto.3
 for <openbmc@lists.ozlabs.org>; Sat, 23 Nov 2019 21:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=7eX5dvBFBNWNgLj4id1+q3LR7jQV6o+i69eUZbUSwsQ=;
 b=ql1CYlXPtgyOHy2sej5ABkIsyHcE+tcoY/P1pFHXi1JKtXLIunUebltocKG7+gvXbL
 dVLGKe8sEdx4v6vn1erb02vRfixAEyIygALSQII0vjwibETfxfjZnMMNpl36UnftoTNe
 plxYUVL5jpNvD3p6quSq7h8TMz4p4+nzoIsP0STS71uUtRibnY/gkndiL4f84qr5oX1K
 woTkmknrKk/z7upB73Y2HaZGAkOsMmTn2GeOqhCeEgj8fJZek+E3jhuLYWRLWH3/c7ma
 XcSWFXdqmYkolxFVXDjEdR00IdPxRVE5sb8jkU+NAcZvvTNIPvlNKypkFSSXDiyOoMQx
 tm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=7eX5dvBFBNWNgLj4id1+q3LR7jQV6o+i69eUZbUSwsQ=;
 b=oDQ79mbn0S4EbB7cJTpOOUrTOkS5CQf01h3k4Lzx8QSg3g+hcdvpAh8kJF+2e+se9l
 XMH5ob5nC0hu8qWJlNxRkQVEuKcuo8ja+JddtKhS79+Dk2WVpZRybdyhH1mSc5/E8GcV
 ugtVfm31nntOt06lcNadg0SSrUQ3ktpanzQW8o3W/hjg0m3bM+2YXk2CHPibaTJCrLba
 cKSoXD2E9RfUwxsO2eoNSnoQEaAqMbZZy6NU+my9cQzhmFVSPM6CipKP6BDX5AnfaZEN
 k+xRRj6KHEmPJY6bQG2/8p6M4Sgw0Fpm78zfw3XlNwLaMgN/hXUf11aad+5sRmFpZBEJ
 LMcQ==
X-Gm-Message-State: APjAAAVRryEdm67NXoOq9hUfY61JhvT9fmQaNWNV8zrZ0WSi9V5m1rZd
 gL80S86Cfgd25IPTiq3NSEUd7bGfKMFk6zh02mKWvA==
X-Google-Smtp-Source: APXvYqx9zHG8GvyQRPeCgMVVYwaH4oIJxGlhr5CqAZzHPbJxqSiH4RUSs/1oUstDTcI7QL/06U02Zs9nESmFwtOoXNg=
X-Received: by 2002:a9d:846:: with SMTP id 64mr16017293oty.289.1574574402039; 
 Sat, 23 Nov 2019 21:46:42 -0800 (PST)
MIME-Version: 1.0
References: <CA+a15-X2MontTyVxihDNWXCen1P5dKC1T3=oQPTdMDkQmNCeZA@mail.gmail.com>
 <ce28a40a-e783-fae6-4526-dd5d8759794e@linux.intel.com>
In-Reply-To: <ce28a40a-e783-fae6-4526-dd5d8759794e@linux.intel.com>
From: John Chung <gorojohn17@gmail.com>
Date: Sun, 24 Nov 2019 05:46:29 +0800
Message-ID: <CA+a15-Xf-ShdqjjN9+uqTE0U2JMc7jCgAvccWRvRURkck7AU2w@mail.gmail.com>
Subject: Fwd: One questions about bmcweb Redfish logging
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000e7f2e40598112b19"
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

--000000000000e7f2e40598112b19
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

I am forwarding this email for others might have the same question about
Redfish logging.

Thanks,
John

---------- Forwarded message ---------
=E5=AF=84=E4=BB=B6=E8=80=85=EF=BC=9A Bills, Jason M <jason.m.bills@linux.in=
tel.com>
Date: 2019=E5=B9=B411=E6=9C=887=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=
=881:20
Subject: Re: One questions about bmcweb Redfish logging
To: John Chung <gorojohn17@gmail.com>


Hi John,

For future reference, you can send these mails to the OpenBMC mailing
list as others may have similar questions.

On 11/6/2019 4:39 AM, John Chung wrote:
> Hi Jason,
>
> This is John, a software engineer studying in OpenBMC.
>
> May I consult you about bmcweb Redfish logging?
>
> Digging into bmcweb, I noticed that system log will refer from
> /var/log/redfish* files and generated redfish event log.
> However, I didn't find out which application generate the files in
> /var/log/. Not sure it comes from rsyslog or not.
It does come from rsyslog, but I haven't been able to fully port it to
upstream openbmc, yet.

>
> Would you kindly give me a hint about how to generate the files in
> /var/log ?
The rsyslog configuration we use can be found here:
https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods/meta-comm=
on/recipes-extended/rsyslog
.

Thanks,
-Jason

>
> Thanks a lot for your help and time.
>
> Best regards,
> John

--000000000000e7f2e40598112b19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>I am forwarding this email for =
others might have the same question about Redfish logging.</div><div><br></=
div><div>Thanks,</div><div>John<br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">---------- Forwarded message ---------<br>=E5=
=AF=84=E4=BB=B6=E8=80=85=EF=BC=9A <strong class=3D"gmail_sendername" dir=3D=
"auto">Bills, Jason M</strong> <span dir=3D"auto">&lt;<a href=3D"mailto:jas=
on.m.bills@linux.intel.com">jason.m.bills@linux.intel.com</a>&gt;</span><br=
>Date: 2019=E5=B9=B411=E6=9C=887=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=
=8D=881:20<br>Subject: Re: One questions about bmcweb Redfish logging<br>To=
: John Chung &lt;<a href=3D"mailto:gorojohn17@gmail.com">gorojohn17@gmail.c=
om</a>&gt;<br></div><br><br>Hi John,<br>
<br>
For future reference, you can send these mails to the OpenBMC mailing <br>
list as others may have similar questions.<br>
<br>
On 11/6/2019 4:39 AM, John Chung wrote:<br>
&gt; Hi Jason,<br>
&gt; <br>
&gt; This is John, a software engineer studying in OpenBMC.<br>
&gt; <br>
&gt; May I consult you about bmcweb Redfish logging?<br>
&gt; <br>
&gt; Digging into bmcweb, I noticed that system log will refer from <br>
&gt; /var/log/redfish* files and generated redfish event log.<br>
&gt; However, I didn&#39;t find out which application generate the files in=
 <br>
&gt; /var/log/. Not sure it comes from rsyslog or not.<br>
It does come from rsyslog, but I haven&#39;t been able to fully port it to =
<br>
upstream openbmc, yet.<br>
<br>
&gt; <br>
&gt; Would you kindly give me a hint about how to generate the files in <br=
>
&gt; /var/log ?<br>
The rsyslog configuration we use can be found here: <br>
<a href=3D"https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mod=
s/meta-common/recipes-extended/rsyslog" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods/meta-co=
mmon/recipes-extended/rsyslog</a>.<br>
<br>
Thanks,<br>
-Jason<br>
<br>
&gt; <br>
&gt; Thanks a lot for=C2=A0your help and time.<br>
&gt; <br>
&gt; Best regards,<br>
&gt; John<br>
</div></div></div>

--000000000000e7f2e40598112b19--
