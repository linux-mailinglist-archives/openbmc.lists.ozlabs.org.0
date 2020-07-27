Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FB522FCA6
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 01:09:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFwVN5F5bzDqpr
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 09:09:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=xWX6XcHY; dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFwSR0QTFzDr1S
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 09:07:34 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id 133so9614938ybu.7
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jul 2020 16:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XQCOOmeFTVE7TH4FHXNPEpE6xFux8orGxMnUm/70OPU=;
 b=xWX6XcHYfgYqOCbtyyGumaUOy03BhZcstbADxkx5nqfmtdSz7ekjm9mJmL0PmsRA2Q
 46qDUkC4gMaFuAj0oCVXMvafZ/+VKqUxVtbZBHkAXIhZ/TL7xIhSAi83S59wc6+4NmLG
 H44L703kt7cVQZn857WJ6ay+cKG75gTvZx47o7IeKdtkfhB/PW9d95gLHgxfIsMrZudi
 wnZE/Hl2Mg5W0v3disTAAofIbcbvJesApXmwIl+AGGUJdHYtX40X3A1O6q2UuAXTO1cj
 BY0PzmqOe5QYIHKWKFiuWibqX2JG+fxO7waPazKBrgrps70E0v6+6x7JQe6TVyixXgIT
 EWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XQCOOmeFTVE7TH4FHXNPEpE6xFux8orGxMnUm/70OPU=;
 b=Rvr1hDsbOTSwK+A7DNYFCmmj6Vtpc9JdRbR/2Ym1+srYxq9AXKX0q7S0ly8b07Bjrt
 mXOuPo4fwvVXjQgYqiI52sVqx0T8VB01Ctjk0XcFLhtsB1/vc2gOkX8FeiYOcmoXQNVB
 /bHn130Yj1uF/vsDLT3y6GHUaBzMPBjY25pql45IzQmbkj1/9A8rGgIvEjiPo8FUeOBV
 OzX7YGiz5eNtp1TBbnkPCmOK2VOnFlABggsqcGuV6h4RR/hvQqEypD7yqT7go8jXb3sN
 893tfNfOKvo5yk6hlvE75VC5oRX2SsRMZvRd9ZhTwt8/Gm6nrM6BjLxKj3AoeLddbLF8
 jHCw==
X-Gm-Message-State: AOAM532RQ7Dt8G4KAIkXBQy3OEZCYWLGo/1pQCC1DIWoDnzORSj51RwS
 bV0FFlInV4FELuSChP6Nts1mfSIEUoQ2mMCa2+yUYw==
X-Google-Smtp-Source: ABdhPJzyhAeXmniB1r876pVLkuYY3RLha4hdCzZ1JikapWlEqQ+CHAm/2R7TXm6mjpAsdic3imO8bu68DQBTrEWTzOY=
X-Received: by 2002:a5b:74d:: with SMTP id s13mr34343788ybq.170.1595891249834; 
 Mon, 27 Jul 2020 16:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <30dabaf6-b18d-a94b-af46-3291233b5ad1@linux.ibm.com>
 <77906538-41BD-4600-B6FE-9886921BB0B9@gmail.com>
In-Reply-To: <77906538-41BD-4600-B6FE-9886921BB0B9@gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 27 Jul 2020 16:07:19 -0700
Message-ID: <CACWQX835DWC6GwZYzn3v2v7wsrJ_mVPQyT0=D3hfQnNaoWSJgg@mail.gmail.com>
Subject: Re: Query regarding using the Redfish in OpenBMC
To: Mike Jones <proclivis@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000000c0bb405ab7463d5"
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
Cc: khader basha shaik <shaikkhaderbasha601@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "openbmcbump-github@yahoo.com" <openbmcbump-github@yahoo.com>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000000c0bb405ab7463d5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2020 at 4:13 PM Mike Jones <proclivis@gmail.com> wrote:
>
> Some progress. On the hacked build, there were three problems:
>
> 1) bmcweb failed at start
> 2) Wrong port
> 3) Can=E2=80=99t login
>
> The failure was found by compiling it with logging. /var/log/redfish was
missing. Touching the file and executing bmcweb& got it up.

This was a bug.  Pull master up to at least this commit:
https://github.com/openbmc/bmcweb/commit/7f4eb5887f9a52a2832ee9b6e067495759=
03128a


>
> Some doc said port 8080, but it is 18080.

Ideally you'd be using the bmcweb.socket file for socket activation, which
defaults to 443.  port 18080 only happens when you launch bmcweb by hand.
I=E2=80=99m guessing you copied the binary over by hand and didn=E2=80=99t =
do a make
install?


>
> DHCP is not working, so I boot to console with hdmi and keyboard and make
a static address with ifconfig. Will deal with later.
>
> Login was because groups were missing. Found where that was in
meta-phosphor and added.

The login groups should be made automatically by the recipe.  If you're
using it, and they're not present, this might be worth a bug getting filed.


>
> Now I have the webui up.

Yee Haw!


>
> On the evb build, it is trying to build images that fail when checking
file size. I think this is because meta-phosphor has IMAGE_FSTYPES +=3D wit=
h
some mtb images, and meta-rasberrypi has IMAGE_FSTYPES ?=3D and I assume +=
=3D
wins or mixes. I think if I add IMAGE_FSTYPES =3D in local.conf, it would
override it and probably work.

This might be related to rpi using ext4 images, not squashfs images.

>
> Waiting for a long rebuild...

Groan.... yep.  Highly recommend a ridiculously overpowered build machine
for yocto builds.

--0000000000000c0bb405ab7463d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>On Fri, Jul 24, 2020 at 4:13 PM Mike Jones &lt;<a hre=
f=3D"mailto:proclivis@gmail.com" target=3D"_blank">proclivis@gmail.com</a>&=
gt; wrote:<br>
&gt;<br>
&gt; Some progress. On the hacked build, there were three problems:<br>
&gt;<br>
&gt; 1) bmcweb failed at start<br>
&gt; 2) Wrong port<br>
&gt; 3) Can=E2=80=99t login<br>
&gt;<br>
&gt; The failure was found by compiling it with logging. /var/log/redfish w=
as missing. Touching the file and executing bmcweb&amp; got it up.<br>
<br></div><div>
This was a bug.=C2=A0 Pull master up to at least this commit:<br>
<a href=3D"https://github.com/openbmc/bmcweb/commit/7f4eb5887f9a52a2832ee9b=
6e06749575903128a" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
openbmc/bmcweb/commit/7f4eb5887f9a52a2832ee9b6e06749575903128a</a></div><di=
v><br>
<br>
&gt;<br>
&gt; Some doc said port 8080, but it is 18080.<br>
<br></div><div><div dir=3D"auto">
Ideally you&#39;d be using the bmcweb.socket file for socket activation, wh=
ich defaults to 443.=C2=A0 port 18080 only happens when you launch bmcweb b=
y hand.=C2=A0 I=E2=80=99m guessing you copied the binary over by hand and d=
idn=E2=80=99t do a make install?</div></div><div><br>
<br>
&gt;<br>
&gt; DHCP is not working, so I boot to console with hdmi and keyboard and m=
ake a static address with ifconfig. Will deal with later.<br>
&gt;<br>
&gt; Login was because groups were missing. Found where that was in meta-ph=
osphor and added.<br>
<br></div><div>
The login groups should be made automatically by the recipe.=C2=A0 If you&#=
39;re using it, and they&#39;re not present, this might be worth a bug gett=
ing filed.</div><div><br>
<br>
&gt;<br>
&gt; Now I have the webui up.<br>
<br></div><div>
Yee Haw!</div><div><br>
<br>
&gt;<br>
&gt; On the evb build, it is trying to build images that fail when checking=
 file size. I think this is because meta-phosphor has IMAGE_FSTYPES +=3D wi=
th some mtb images, and meta-rasberrypi has IMAGE_FSTYPES ?=3D and I assume=
 +=3D wins or mixes. I think if I add IMAGE_FSTYPES =3D in local.conf, it w=
ould override it and probably work.<br></div><div><br></div><div>
This might be related to rpi using ext4 images, not squashfs images.</div><=
div><br>
&gt;<br>
&gt; Waiting for a long rebuild...<br>
<br></div><div>
Groan.... yep.=C2=A0 Highly recommend a ridiculously overpowered build mach=
ine for yocto builds.<br>
</div>
</div>

--0000000000000c0bb405ab7463d5--
