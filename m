Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61164C9818
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 08:10:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kN0g3VCFzDqXJ
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 16:10:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::936; helo=mail-ua1-x936.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dRTargal"; 
 dkim-atps=neutral
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kMzx1h3czDqQM
 for <openbmc@lists.ozlabs.org>; Thu,  3 Oct 2019 16:10:04 +1000 (AEST)
Received: by mail-ua1-x936.google.com with SMTP id 107so516420uau.5
 for <openbmc@lists.ozlabs.org>; Wed, 02 Oct 2019 23:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FJh66t0TytLLjAF2985Tik+7DaUmZhO3ObqSlYPZr+4=;
 b=dRTargalJw0+TpoBO9LPmluVYQhSXZlAfbURJZfYqX/WOYaXm5RPIYZ+T/+ZJFOAYB
 49AooNV3AN2nPNDKbNFP1Snex9wibvILcBRoOgFZZIuAIvk6qEt2y+EcY3r5QfDGLJfi
 pYK04/Xpciv58r+yZk77wXXgoxJqmr6IP2arA0s6peZRMxdE2z2Rzg3aWJHHz5sCGrPk
 pw5WGcrjwbHIT3JdAiO9XX78GlBe+p0lMmtro8Sy7f1HOAB1ylw0tpZLZy+GQDdVWfgA
 wBgvA7qyR7Kt5D8ai4VtOZOVRdnFld9jGeuhUtmyPwFjR99OMjM5XChZx3oiVqBxHVo+
 B0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FJh66t0TytLLjAF2985Tik+7DaUmZhO3ObqSlYPZr+4=;
 b=p+Eo1VbdpKSl29gsUu35HBSUDBnrMgkGdS76B6z7X4Kw87k9cIFwqXMglIsdu/nnNP
 HF6DGyYwcuqU4A909tXocE2YC1s9mDSy1eGKIY02oy4wBeF1gLoDhqbz3urN4jViNN17
 MSjoBqn253UipchOAKtWC9Eer0XoRC+b8hQC4YwCITrArfhQvuN7fAtGt2vEE9hQeu20
 NkMVKsF42yDGq7Ezw6dKnX3LdNvazQVy+Ma5kMy2B63atOUh1+73lTbziwwJUvleXZbZ
 wXLhAPFz0O5PUethMSvPWHdKEK1MtzhlUKKJgeNitzyMoLTvBq+adN8h+4KSaH4pIvjE
 A7BA==
X-Gm-Message-State: APjAAAWFDKDfSB9MTtSClYLFG3FZDAKDtS3GeqnbmwcmnFf0eSJMK1HC
 hiky4HVonu17ZxM/StAoK6pbyStWDkLjNDOVFYVJXg==
X-Google-Smtp-Source: APXvYqylRC5JW5GjRpM/pM+Hl7hXHKw+LkGNqMZ9lvfGe0Q9L8qw4ZI/zGIM9h7c8yC49X+ob4JwkNAjw9NJsh7YL0M=
X-Received: by 2002:ab0:6244:: with SMTP id p4mr3944265uao.0.1570083000257;
 Wed, 02 Oct 2019 23:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <17116.1570043711@localhost>
In-Reply-To: <17116.1570043711@localhost>
From: Nancy Yuen <yuenn@google.com>
Date: Wed, 2 Oct 2019 23:09:24 -0700
Message-ID: <CADfYTpHbSTz62Vb2s1coVONRKPyiQhtWD4dNbCf3+k3Xg11=3A@mail.gmail.com>
Subject: Re: security WG meetings
To: Michael Richardson <mcr@sandelman.ca>
Content-Type: multipart/alternative; boundary="00000000000080000c0593fb6fb1"
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

--00000000000080000c0593fb6fb1
Content-Type: text/plain; charset="UTF-8"

Thanks for pointing this out and correcting the wiki.  We will be meeting
again in 2 weeks  on 10/16. Please join us then.

----------
Nancy


On Wed, Oct 2, 2019 at 12:22 PM Michael Richardson <mcr@sandelman.ca> wrote:

>
> Just to mention that 10am PDT is not 19:00 UTC.
> It's 16:00 UTC.  Sadly I missed the meeting, as I scheduled it with UTC,
> thinking it the most reliable.
> I edited the wiki to change things.
>
> (Also, it would be great if the ibm webex could have the webrtc mechanism
> enabled for the meeting)
>
> --
> ]               Never tell me the odds!                 | ipv6 mesh
> networks [
> ]   Michael Richardson, Sandelman Software Works        |    IoT
> architect   [
> ]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on
> rails    [
>
>

--00000000000080000c0593fb6fb1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for pointing this out and correcting the wiki.=C2=
=A0 We will be meeting again in 2 weeks=C2=A0 on 10/16. Please join us then=
.<div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" dat=
a-smartmail=3D"gmail_signature">----------<br>Nancy</div></div><br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Wed, Oct 2, 2019 at 12:22 PM Michael Richardson &lt;<a href=3D"mailto:mcr@=
sandelman.ca">mcr@sandelman.ca</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><br>
Just to mention that 10am PDT is not 19:00 UTC.<br>
It&#39;s 16:00 UTC.=C2=A0 Sadly I missed the meeting, as I scheduled it wit=
h UTC,<br>
thinking it the most reliable.<br>
I edited the wiki to change things.<br>
<br>
(Also, it would be great if the ibm webex could have the webrtc mechanism<b=
r>
enabled for the meeting)<br>
<br>
--<br>
]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Never tell me the o=
dds!=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ipv6 me=
sh networks [<br>
]=C2=A0 =C2=A0Michael Richardson, Sandelman Software Works=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 IoT architect=C2=A0 =C2=A0[<br>
]=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:mcr@sandelman.ca" target=3D"_blank">=
mcr@sandelman.ca</a>=C2=A0 <a href=3D"http://www.sandelman.ca/" rel=3D"nore=
ferrer" target=3D"_blank">http://www.sandelman.ca/</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0ruby on rails=C2=A0 =C2=A0 [<br>
<br>
</blockquote></div>

--00000000000080000c0593fb6fb1--
