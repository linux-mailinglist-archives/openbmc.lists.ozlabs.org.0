Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADCF305D2
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 02:33:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FQR66lYMzDqXS
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 10:33:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=lfprojects.org
 (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=manager@lfprojects.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=lfprojects.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lfprojects-org.20150623.gappssmtp.com
 header.i=@lfprojects-org.20150623.gappssmtp.com header.b="Rr5jPLlx"; 
 dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FL4H2NcMzDqQM
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 07:16:42 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id r15so6142910lfm.11
 for <openbmc@lists.ozlabs.org>; Thu, 30 May 2019 14:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lfprojects-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n+orujHmP10OnNremQPCvUn3K4iD9oBUY0GNkm/X9Bw=;
 b=Rr5jPLlxcxrbfME6bQmhLF1+cAgJf9aB9RmxM6LEtfFOEqWDIXKqgVoR3bbJBEc5xM
 RHFBhBopcvyfVyrq06PMh6XC01bAXZjrcDUSpleN4jqD2zACQ2sPHrAVGIMfz4WJQ3wx
 j1c2vdMOQMFrNkv/caT5nsiyvbABAVwsCHbCvhkB2VPl82AOLiBqfRKiY228sH9R/Qfx
 /ily4PEBKzPV0GnNbHZTwcCYP43CXPf6wpD7vYO9smQNkHC+8LNGxo1+71Cbg/4lhafj
 GZVmJWc0Ue/4IxjDd+2NdJNbAxgwQVybwbVk+D/1CzyIdauIugC28ulQJzXWu9cy1uhC
 6DLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n+orujHmP10OnNremQPCvUn3K4iD9oBUY0GNkm/X9Bw=;
 b=q3ZRoGYttb7mNgV+k7o2bAnbOxx4dqRbtnV6TEG6OjgzW4zpXyNbjomtd41Y09+Dph
 nMVpIuGT+Ls+kraCGDbpxXVO3iXTO/XaonbP/X6q4jHxSH8D1kuPFrlXwvytgrhJtIFm
 3cWffCYeqr6QzJPCU2ePp33K+P221JfQYYYWniXttIxgteclRDrHlvsmG811tRYx7jIz
 geSEfKn6OauH4wWod4/5efMxac7pkw4SoLAsXmQb0R8b941Qb5ri6pJOAfrGQ6Q23MZx
 6bQbOPOscYs8hrsv0m9MGvtYvzIF61911GA9WrlaVcf456XxbbQid4CcJKX5OkreLxU/
 lGyw==
X-Gm-Message-State: APjAAAUPag+hk3TJumSDvuze8//DtG1J6Cfcr3saH7oZ8HFup4ymYf6z
 3HK0V3cfXo6mA4DS5F4BsRud9DVqqcY8b7s+XjaHTQ==
X-Google-Smtp-Source: APXvYqwoPmMnSJkKWkL2cHjwPttcHSGP4Qac76LBDT97qhbGrOBvGf0E39q9vG5C0XFqaE7lZ4hqKWf548PezMMXtqk=
X-Received: by 2002:a19:ed07:: with SMTP id y7mr3506668lfy.56.1559250997407;
 Thu, 30 May 2019 14:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <96a177bb54474ad0944934a0efe8ddf6@wistron.com>
In-Reply-To: <96a177bb54474ad0944934a0efe8ddf6@wistron.com>
From: Mike Dolan <manager@lfprojects.org>
Date: Thu, 30 May 2019 17:16:25 -0400
Message-ID: <CALVHhedPVn8bkC3hed9_6w6O9YDhw==T_vrwSfS4+gnEUnFfQQ@mail.gmail.com>
Subject: Re: Signed CLA from Wistron
To: Claire_Ku@wistron.com
Content-Type: multipart/alternative; boundary="000000000000d1082b058a2169dd"
X-Mailman-Approved-At: Fri, 31 May 2019 10:25:29 +1000
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

--000000000000d1082b058a2169dd
Content-Type: text/plain; charset="UTF-8"

Hi, this file does not appear to be signed.

Thanks,

Mike

On Wed, May 29, 2019 at 5:39 AM <Claire_Ku@wistron.com> wrote:

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

--000000000000d1082b058a2169dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, this file does not appear to be signed.=C2=A0<div><br>=
</div><div>Thanks,</div><div><br></div><div>Mike</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 29, 2019=
 at 5:39 AM &lt;<a href=3D"mailto:Claire_Ku@wistron.com">Claire_Ku@wistron.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">





<div lang=3D"ZH-TW">
<div class=3D"gmail-m_-6404953693796521501WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Dear Sir/Madam,<u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Here is the signed CLA from Wis=
tron Corporation.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Please help to approve it.<u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thank you very much.<u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Yours faithfully,<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Claire Ku<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>

<p><span style=3D"font-family:Calibri;font-size:11pt;color:rgb(0,0,0)"><b>-=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
--------</b></span></p>
<p><span style=3D"font-family:Calibri;font-size:11pt;color:rgb(0,0,0)"><b>T=
his email contains confidential or legally privileged information and is fo=
r the sole use of its intended recipient. </b></span></p>
<p><span style=3D"font-family:Calibri;font-size:11pt;color:rgb(0,0,0)"><b>A=
ny unauthorized review, use, copying or distribution of this email or the c=
ontent of this email is strictly prohibited.</b></span></p>
<p><span style=3D"font-family:Calibri;font-size:11pt;color:rgb(0,0,0)"><b>I=
f you are not the intended recipient, you may reply to the sender and shoul=
d delete this e-mail immediately.</b></span></p>
<p><span style=3D"font-family:Calibri;font-size:11pt;color:rgb(0,0,0)"><b>-=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
--------</b></span></p></div>

</blockquote></div>

--000000000000d1082b058a2169dd--
