Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C32E132353
	for <lists+openbmc@lfdr.de>; Sun,  2 Jun 2019 14:51:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45GykL72shzDqQ8
	for <lists+openbmc@lfdr.de>; Sun,  2 Jun 2019 22:51:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=lfprojects.org
 (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=manager@lfprojects.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=lfprojects.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lfprojects-org.20150623.gappssmtp.com
 header.i=@lfprojects-org.20150623.gappssmtp.com header.b="WYdQfzGC"; 
 dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FnMc0VcHzDqYh
 for <openbmc@lists.ozlabs.org>; Sat,  1 Jun 2019 00:46:33 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id y15so6661827ljd.9
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 07:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lfprojects-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mA+bZu7PmG/vqqhpipKMEoTGkw0OLSF8wr5Wp48ZM50=;
 b=WYdQfzGCtxiY7KY4NsO2hRH3HNmbKpJulB7TVNYVdSR3LV7pK92BlXNHZcZfK7XTws
 KvDTxuoADawonU5NX5qDuyd6PSaX9eFvSORgLvk0XHozIKW/ODMiT4EYX12NIT29syp0
 Vfh169PdaVEtmXzVisBLyipXEFL0FNZtRSvhOJGA/Wi2i6GLUY+bpdaoNX6aFIX8HiUc
 E9SOKVQSyerxBPmGLaDxLzRD2AGH4iiukHG0CXquISV4FFbNUzme8SHtUcv6GzoXHFF0
 hg7b/TmCKcWJGWTVrGZQ8JONkFHqiH2sx2vQaFlCBlNj4gUTc4isVTI16F8B9CNj3hD+
 aP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mA+bZu7PmG/vqqhpipKMEoTGkw0OLSF8wr5Wp48ZM50=;
 b=mboe7NMnpGYe0EgK8k/QczMuK7ncvGaNvHOStTlt7gR42SZHmSsmHolWhdDSz5ckad
 XFbxGzDuw659AQ32s4y7h0SFUpFv7uw1pVdt/J7jokLEDA6gp6TPc05wz2/AC75Ht66p
 OG4yRPQzRX/sUsF0Qyw2g4JzIP+XJp0hdnKHZwE+KCGV5iDqruzUQrVVVj1kUAZT7v/q
 nvBJZaJGkZtrYFxyreUT3oN+FZ0FVIbns6Yjhqkxn7WYVXU1HPwg77hcHHC+EToyLZt6
 g+xu7niCO855+58uZuoT7TsygwHuy8IegS/bAn/yF/aHhdrjxGKahnzs/vx1fhLxeBMf
 ro3Q==
X-Gm-Message-State: APjAAAUFA9w+tiHZT0k5tiXXb70QrAtllzNmLnpgHfW/1tfGQdPmVNyk
 FLQaTqSso8wXBYA5C5rg1yyrk3A3ifJACdDGMzimGQ==
X-Google-Smtp-Source: APXvYqzI38Im7mPYaXMi6SNTUXGKZeHWOKtMn9BTunADAMqAOR2Wuu9+gkBVfihfosqXlTPsJtjUSahP1XXJfF8t3n4=
X-Received: by 2002:a2e:87c9:: with SMTP id v9mr4401571ljj.100.1559313989121; 
 Fri, 31 May 2019 07:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <96a177bb54474ad0944934a0efe8ddf6@wistron.com>
 <CALVHhedPVn8bkC3hed9_6w6O9YDhw==T_vrwSfS4+gnEUnFfQQ@mail.gmail.com>
 <75559516e6674ee98b0165f0d5d853c1@wistron.com>
In-Reply-To: <75559516e6674ee98b0165f0d5d853c1@wistron.com>
From: Mike Dolan <manager@lfprojects.org>
Date: Fri, 31 May 2019 10:46:17 -0400
Message-ID: <CALVHhedjG=3L3GVKyA2Fc=_9jhXBGY6cY42MxB-daB=ABM7sqA@mail.gmail.com>
Subject: Re: Signed CLA from Wistron
To: Claire_Ku@wistron.com
Content-Type: multipart/alternative; boundary="0000000000006a478a058a301437"
X-Mailman-Approved-At: Sun, 02 Jun 2019 22:50:29 +1000
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
Cc: openbmc@lists.ozlabs.org, Timothy_Huang@wistron.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000006a478a058a301437
Content-Type: text/plain; charset="UTF-8"

Thank you this one shows the signature.

-- Mike

On Thu, May 30, 2019 at 11:15 PM <Claire_Ku@wistron.com> wrote:

> Hi Mike,
>
>
>
> Please check the page 3, thank you very much.
>
>
>
> Your sincerely,
>
> Claire
>
>
>
> *From:* Mike Dolan <manager@lfprojects.org>
> *Sent:* Friday, May 31, 2019 5:16 AM
> *To:* Claire Ku/WHQ/Wistron <Claire_Ku@wistron.com>
> *Cc:* openbmc@lists.ozlabs.org; Timothy Huang/WHQ/Wistron <
> Timothy_Huang@wistron.com>
> *Subject:* Re: Signed CLA from Wistron
>
>
>
> Hi, this file does not appear to be signed.
>
>
>
> Thanks,
>
>
>
> Mike
>
>
>
> On Wed, May 29, 2019 at 5:39 AM <Claire_Ku@wistron.com> wrote:
>
> Dear Sir/Madam,
>
>
>
> Here is the signed CLA from Wistron Corporation.
>
> Please help to approve it.
>
> Thank you very much.
>
>
>
> Yours faithfully,
>
> Claire Ku
>
>
>
>
> *---------------------------------------------------------------------------------------------------------------------------------------------------------------*
>
> *This email contains confidential or legally privileged information and is
> for the sole use of its intended recipient. *
>
> *Any unauthorized review, use, copying or distribution of this email or
> the content of this email is strictly prohibited.*
>
> *If you are not the intended recipient, you may reply to the sender and
> should delete this e-mail immediately.*
>
>
> *---------------------------------------------------------------------------------------------------------------------------------------------------------------*
>
>

--0000000000006a478a058a301437
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you this one shows the signature.<div><br></div><div=
>-- Mike</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, May 30, 2019 at 11:15 PM &lt;<a href=3D"mailto:Clai=
re_Ku@wistron.com">Claire_Ku@wistron.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">





<div lang=3D"ZH-TW">
<div class=3D"gmail-m_1960412937213685642WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Hi Mike,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Please check the page 3, thank you very much=
.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Your sincerely,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Claire<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:Calibri,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"f=
ont-size:11pt;font-family:Calibri,sans-serif"> Mike Dolan &lt;<a href=3D"ma=
ilto:manager@lfprojects.org" target=3D"_blank">manager@lfprojects.org</a>&g=
t;
<br>
<b>Sent:</b> Friday, May 31, 2019 5:16 AM<br>
<b>To:</b> Claire Ku/WHQ/Wistron &lt;<a href=3D"mailto:Claire_Ku@wistron.co=
m" target=3D"_blank">Claire_Ku@wistron.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a>; Timothy Huang/WHQ/Wistron &lt;<a href=3D"mailto=
:Timothy_Huang@wistron.com" target=3D"_blank">Timothy_Huang@wistron.com</a>=
&gt;<br>
<b>Subject:</b> Re: Signed CLA from Wistron<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi, this file does not appear t=
o be signed.=C2=A0<u></u><u></u></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks,<u></u><u></u></span></p=
>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Mike<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Wed, May 29, 2019 at 5:39 AM=
 &lt;<a href=3D"mailto:Claire_Ku@wistron.com" target=3D"_blank">Claire_Ku@w=
istron.com</a>&gt; wrote:<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Dear Sir/Madam,<u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Here is the signed CLA from Wis=
tron Corporation.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Please help to approve it.<u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thank you very much.<u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Yours faithfully,<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Claire Ku<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<p><b><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:Calibri,sans=
-serif;color:black">-------------------------------------------------------=
---------------------------------------------------------------------------=
-----------------------------</span></b><span lang=3D"EN-US"><u></u><u></u>=
</span></p>
<p><b><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:Calibri,sans=
-serif;color:black">This email contains confidential or legally privileged =
information and is for the sole use of its intended recipient.
</span></b><span lang=3D"EN-US"><u></u><u></u></span></p>
<p><b><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:Calibri,sans=
-serif;color:black">Any unauthorized review, use, copying or distribution o=
f this email or the content of this email is strictly prohibited.</span></b=
><span lang=3D"EN-US"><u></u><u></u></span></p>
<p><b><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:Calibri,sans=
-serif;color:black">If you are not the intended recipient, you may reply to=
 the sender and should delete this e-mail immediately.</span></b><span lang=
=3D"EN-US"><u></u><u></u></span></p>
<p><b><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:Calibri,sans=
-serif;color:black">-------------------------------------------------------=
---------------------------------------------------------------------------=
-----------------------------</span></b><span lang=3D"EN-US"><u></u><u></u>=
</span></p>
</div>
</blockquote>
</div>
</div>
</div>

</blockquote></div>

--0000000000006a478a058a301437--
