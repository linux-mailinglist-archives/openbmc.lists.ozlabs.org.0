Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D8B35561B
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 16:08:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF8X75zNFz30FX
	for <lists+openbmc@lfdr.de>; Wed,  7 Apr 2021 00:08:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=L+UgoF2x;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=rushtotom@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=L+UgoF2x; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF8Wv18cqz2yxN
 for <openbmc@lists.ozlabs.org>; Wed,  7 Apr 2021 00:08:42 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so9739714pjh.1
 for <openbmc@lists.ozlabs.org>; Tue, 06 Apr 2021 07:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HttPzA7TlHNPQTR81e8510IieSNcqL7Y9aJ01K0/m9s=;
 b=L+UgoF2xnP3oEgPZWkvaz99YuXXUyw1d8Paz6hLIMzpJAOzKs9hZJbTciIThWqZZN7
 v37RcyDqL/2DotZEmi2gEERMpyuAY+akUipTeUU7BMSZzQ7kWVWRGYwxTqk+fvDxgzjI
 QKxituFxJ+z6c9pof0fG/ZE/AoDc/zBsRqwIeaBUsxVbKyDZ6o0sjJaB6U+ak1fvvLsL
 YxO2PVMIyduhaohrjpjgkgR/gmmLtkuTbvG5Sx4nB0H/uFh6TFW9EgvH6gu7F7C4PiHF
 H88mEsBSR5TTEo7j4Y/wQj3p9YVhXoRazQRP/6gPCnVKJCnFyalwJZO9ywpnmrlMUEei
 fIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HttPzA7TlHNPQTR81e8510IieSNcqL7Y9aJ01K0/m9s=;
 b=XEtofojNwszSRpkPMu5DzprBxwkCfluQ7xn4wqCLaxkmY+RjAbtGymkuPUCqdt+Qbh
 ttqko+ZeDd0CSEyOEQdN6oHjpdUpMw3HhxeQWjLpZl6c53K4+trFbmifDhC+xlW/XoyN
 qGHupFRlZNOrDz9PcRl6DGBFebVyzobUCbI8B7JAQpo4+0OvpZvx5RC8BEOL8YtM+jo/
 mLyU1h1UmKwv3vJYCAG0VpLHloNaJmvanSZCjom9hNWX763BEksAB2ZTZu8gRCpnbfDo
 3+oU56lhk8jnH54jSUfy6IkfIQg+KY1ofrIpCX/WpPSjzNcmBB7rKOVH2po/NkwW6W3i
 VYPg==
X-Gm-Message-State: AOAM532ceO77Mkk6sKzn2p1UWAhXfayUXKi8l7pMyJ89doRyKGve+wKB
 pLvLuhUKOiOTmgPRUza3+6Cq389wwDgDbZphyx4=
X-Google-Smtp-Source: ABdhPJz5/erh9486n9RiRQE1huTOHn4mxyguIyIGxnYKSjwnkyKmPT8xup1M/N7htn+atVJJVJ8On7YyCAr8zR/qYbs=
X-Received: by 2002:a17:902:d30b:b029:e8:dc10:86fb with SMTP id
 b11-20020a170902d30bb02900e8dc1086fbmr14214042plc.46.1617718119102; Tue, 06
 Apr 2021 07:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAEMunhAZTchE56EGZAa9JbHBUTUaAigKgM4MvNr3MCcB=pm-QA@mail.gmail.com>
In-Reply-To: <CAEMunhAZTchE56EGZAa9JbHBUTUaAigKgM4MvNr3MCcB=pm-QA@mail.gmail.com>
From: Tom Joseph <rushtotom@gmail.com>
Date: Tue, 6 Apr 2021 19:38:27 +0530
Message-ID: <CADCscQn2Rxr9RaUwASrRMOjHkQshSkdRjqHp1RfKX5TySM3zsA@mail.gmail.com>
Subject: Re: how to add a new user using ipmitool
To: sandeep sharma <sandeepajesh@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d5fa3c05bf4e595e"
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000d5fa3c05bf4e595e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

docs/IPMITOOL-cheatsheet.md at master =C2=B7 openbmc/docs (github.com)
<https://github.com/openbmc/docs/blob/master/IPMITOOL-cheatsheet.md>

On Mon, Apr 5, 2021 at 11:17 PM sandeep sharma <sandeepajesh@gmail.com>
wrote:

> We are working on a prototype based on ast2600  and can someone please
> help me with commands to create a user using ipmitool in openbmc? Is ther=
e
> any link which I can refer for all commands related to ipmi?
>
> Steps I have tried:-
> root@cn81xx-obmc:~# ipmitool user summary 1
> Maximum IDs    : 15
> Enabled User Count  : 1
> Fixed Name Count    : 0
> root@cn81xx-obmc:~# ipmitool user list 1
> ID  Name     Callin  Link Auth IPMI Msg   Channel Priv Limit
> 1   root             false   true       true       ADMINISTRATOR
> 2                    true    false      false      NO ACCESS
> 3                    true    false      false      NO ACCESS
> 4                    true    false      false      NO ACCESS
> 5                    true    false      false      NO ACCESS
> 6                    true    false      false      NO ACCESS
> 7                    true    false      false      NO ACCESS
> 8                    true    false      false      NO ACCESS
> 9                    true    false      false      NO ACCESS
> 10                   true    false      false      NO ACCESS
> 11                   true    false      false      NO ACCESS
> 12                   true    false      false      NO ACCESS
> 13                   true    false      false      NO ACCESS
> 14                   true    false      false      NO ACCESS
> 15                   true    false      false      NO ACCESS
> root@cn81xx-obmc:~# ipmitool user set name 2 newuser
> Set User Name command failed (user 2, name newuser): Unspecified error
> root@cn81xx-obmc:~# ipmitool user set name 2 newuser -vv
> Loading IANA PEN Registry...
> Running Get PICMG Properties my_addr 0x20, transit 0, target 0
> Error response 0xc1 from Get PICMG Properties
> Running Get VSO Capabilities my_addr 0x20, transit 0, target 0
> Invalid completion code received: Invalid command
> Acquire IPMB address
> Discovered IPMB address 0x0
> Interface address: my_addr 0x20 transit 0:0 target 0x20:0 ipmb_target 0
>
> Set User Name command failed (user 2, name newuser): Unspecified error
> root@cn81xx-obmc:~#
>
> --
> Thx-
> Sandeep S
>

--000000000000d5fa3c05bf4e595e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><a href=3D"https://github.com/openbmc/doc=
s/blob/master/IPMITOOL-cheatsheet.md">docs/IPMITOOL-cheatsheet.md at master=
 =C2=B7 openbmc/docs (github.com)</a><br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 5, 2021 at 11:17=
 PM sandeep sharma &lt;<a href=3D"mailto:sandeepajesh@gmail.com">sandeepaje=
sh@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr">

We are working on a prototype based on ast2600=C2=A0 and can someone please=
 help me with commands to create a user using ipmitool in openbmc? Is there=
 any link which I can refer for all commands related to ipmi?<div><br>Steps=
 I have tried:-<br>root@cn81xx-obmc:~# ipmitool user summary 1<br>Maximum I=
Ds	 =C2=A0 =C2=A0: 15<br>Enabled User Count =C2=A0: 1<br>Fixed Name Count =
=C2=A0 =C2=A0: 0<br>root@cn81xx-obmc:~# ipmitool user list 1<br>ID =C2=A0Na=
me	 =C2=A0 =C2=A0 Callin =C2=A0Link Auth	IPMI Msg =C2=A0 Channel Priv Limit=
<br>1 =C2=A0 root =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 false =C2=A0 tr=
ue =C2=A0 =C2=A0 =C2=A0 true =C2=A0 =C2=A0 =C2=A0 ADMINISTRATOR<br>2 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0true =C2=A0 =
=C2=A0false =C2=A0 =C2=A0 =C2=A0false =C2=A0 =C2=A0 =C2=A0NO ACCESS<br>3 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0true =
=C2=A0 =C2=A0false =C2=A0 =C2=A0 =C2=A0false =C2=A0 =C2=A0 =C2=A0NO ACCESS<=
br>4 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t=
rue =C2=A0 =C2=A0false =C2=A0 =C2=A0 =C2=A0false =C2=A0 =C2=A0 =C2=A0NO ACC=
ESS<br>5 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0true =C2=A0 =C2=A0false =C2=A0 =C2=A0 =C2=A0false =C2=A0 =C2=A0 =C2=A0NO=
 ACCESS<br>6 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0true =C2=A0 =C2=A0false =C2=A0 =C2=A0 =C2=A0false =C2=A0 =C2=A0 =C2=
=A0NO ACCESS<br>7 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0true =C2=A0 =C2=A0false =C2=A0 =C2=A0 =C2=A0false =C2=A0 =C2=
=A0 =C2=A0NO ACCESS<br>8 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0true =C2=A0 =C2=A0false =C2=A0 =C2=A0 =C2=A0false =C2=
=A0 =C2=A0 =C2=A0NO ACCESS<br>9 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0true =C2=A0 =C2=A0false =C2=A0 =C2=A0 =C2=A0fals=
e =C2=A0 =C2=A0 =C2=A0NO ACCESS<br>10 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 true =C2=A0 =C2=A0false =C2=A0 =C2=A0 =C2=A0fal=
se =C2=A0 =C2=A0 =C2=A0NO ACCESS<br>11 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 true =C2=A0 =C2=A0false =C2=A0 =C2=A0 =C2=A0fal=
se =C2=A0 =C2=A0 =C2=A0NO ACCESS<br>12 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 true =C2=A0 =C2=A0false =C2=A0 =C2=A0 =C2=A0fal=
se =C2=A0 =C2=A0 =C2=A0NO ACCESS<br>13 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 true =C2=A0 =C2=A0false =C2=A0 =C2=A0 =C2=A0fal=
se =C2=A0 =C2=A0 =C2=A0NO ACCESS<br>14 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 true =C2=A0 =C2=A0false =C2=A0 =C2=A0 =C2=A0fal=
se =C2=A0 =C2=A0 =C2=A0NO ACCESS<br>15 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 true =C2=A0 =C2=A0false =C2=A0 =C2=A0 =C2=A0fal=
se =C2=A0 =C2=A0 =C2=A0NO ACCESS<br>root@cn81xx-obmc:~# ipmitool user set n=
ame 2 newuser =C2=A0 =C2=A0 =C2=A0 <br>Set User Name command failed (user 2=
, name newuser): Unspecified error<br>root@cn81xx-obmc:~# ipmitool user set=
 name 2 newuser -vv <br>Loading IANA PEN Registry...<br>Running Get PICMG P=
roperties my_addr 0x20, transit 0, target 0<br>Error response 0xc1 from Get=
 PICMG Properties<br>Running Get VSO Capabilities my_addr 0x20, transit 0, =
target 0<br>Invalid completion code received: Invalid command<br>Acquire IP=
MB address<br>Discovered IPMB address 0x0<br>Interface address: my_addr 0x2=
0 transit 0:0 target 0x20:0 ipmb_target 0<br><br>Set User Name command fail=
ed (user 2, name newuser): Unspecified error<br>root@cn81xx-obmc:~#=C2=A0<b=
r clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><di=
v>Thx-</div><div>Sandeep S<br></div></div></div></div></div>
</blockquote></div>

--000000000000d5fa3c05bf4e595e--
