Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDD4257F63
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 19:16:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgH0Z3jTdzDqSq
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 03:15:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=kIBJViah; dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgGzY67hvzDqMF
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 03:15:03 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id s92so827186ybi.2
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 10:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fWY0qmxPlJ2X73AfXOh6HHlatRv4Die9crmLSIH8gLE=;
 b=kIBJViahNdvfVnB7a03sZzgCCg0nv0Ox9TjoP+e+luo6lpamGekdMHC40La4LaN24I
 6kI97gMjufEOGXhi5YWobl9w9wfqtuRHl7OV5AdF/q8fqvorDZ2aHYa1I+JTxLMnmFr5
 nLw6klTg4xCkgDLT3frEdcFmP4jxW50pP72CprzVRMCQxhS7Q91Go08lspQrGTIw/7Kp
 jvhZyNVVaO+fd5lbU8MmLaLsmWY/XHlnxvRQzA2vIglaliVXD3DrgSJvhhWU2AJACP+7
 HTNfeQWhBz+amqtbi52NnaqrQKJ0zZm0NE/fRfc/CHlnxCnQzLQqptRBsPpmt3zwTVmh
 7YPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fWY0qmxPlJ2X73AfXOh6HHlatRv4Die9crmLSIH8gLE=;
 b=R+ldIOK9BG3g8QUrS2Djog/gYGlJnE9hTcCHFpTw7g+pE7Bt1O0VArEJfNa6I6O4og
 CXZpGbD482h60EOGiOIKXO5d6dOM/8qLt+J94BI8eXr9gOCQPADZ/AsV+zbE0uSZ0x8O
 K61SVSbkyLPW8BZW8MzNTmV6rkqceH2yrouy05IG0PxjkowVzMx215GmF5ZXm9hed9vW
 OuSey4YSMCv74Ba5nQQeG2sKCmfQB8eZ6RReZKi/yeLA8HXf74WaoSM9lI0ilZP7zsdg
 NZO8+/cLzu5bJKIjLqgq6fwF/QMgTRwYDZHhwc2aebidytxVk8zyGIfuOVX5z2Ajuk9r
 tSZw==
X-Gm-Message-State: AOAM533XVKtO1+dYZ7J4Q3Ifmn720CdJCjSX4F/WArWWTrMe0ZyVzskk
 t6W8kEPGso1dpCZUeeWUPIrDbPbOS+Gv1C4iu3zEaQ==
X-Google-Smtp-Source: ABdhPJy4nlZcmCicni7qNdAzaZKLU9D9vZwQpBgudy+LtxsSoMYa/WrmJ4aG3jI2QMHtCNsWPjZHsczX3VZqCno+LYo=
X-Received: by 2002:a25:d4e:: with SMTP id 75mr3427040ybn.480.1598894100874;
 Mon, 31 Aug 2020 10:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR12MB3020D6DD47C7E6DBBD6530A3CD550@DM6PR12MB3020.namprd12.prod.outlook.com>
 <22E14C00-D87D-489F-AB22-6401DE8CDDF5@fb.com>
 <5e71fa32-4547-fb5e-ed50-dffe19cefc09@linux.vnet.ibm.com>
 <b9f035732b62a4bd58ea67e2ea936bdce2cec790.camel@yadro.com>
In-Reply-To: <b9f035732b62a4bd58ea67e2ea936bdce2cec790.camel@yadro.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 31 Aug 2020 10:14:49 -0700
Message-ID: <CACWQX83AXKZiTdhrXhuXg8r-2ZfJstqGANumOBzVtNHzFGonDA@mail.gmail.com>
Subject: Re: OpenBMC - FRU inventory with Entity Manager
To: Andrei Kartashev <a.kartashev@yadro.com>
Content-Type: multipart/alternative; boundary="000000000000eaa34905ae2f8af7"
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
Cc: vernon.mauery@linux.intel.com,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Jiandi An <jan@nvidia.com>, Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000eaa34905ae2f8af7
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 26, 2020 at 11:11 PM Andrei Kartashev <a.kartashev@yadro.com>
wrote:

> Since there is a plan to move to EM for inventory, I believe it is
> really good idea to also have support for FruDevice in phosphor-host-
> ipmid. Then we can have a common way on how to handle it.
> Same for SDR BTW.
>

+1.  This was attempted a long time ago, but nobody was able to come up
with a design that kept the "old" way working for those that needed it, and
at the time there were some missing features.  Given where entity manager
has gotten, it's probably time to start that discussion up again.  Do you
think you could put together a patch that does what you describe?


>
> But there is other thing: there is catastrophically not enough
> documentation for EntityManager/dbus-sensors. Looks like common way
> just to adjust existing config and hope that it still will work.
> <sorry, was all the day trying to get adcsensors work yesterday>
>

That being the case, would you mind taking a look at the docs changes I
just put up.  It's trying to improve the EM documentation a bit, although I
realize it doesn't get all the way to where it needs to be.
https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/36110

Also, it'd be great if you can come up with some concrete examples of what
else we can improve in this regard.  Unfortunately the "copy an existing
config and modify" approach was the best way we found to make platform
ports easy.  A lot of systems tend to look pretty similar, based on similar
reference platforms, so usually there's something to use as a starting
point.  Building a config from scratch using first principals and
documentation is kind of daunting, and became a non-starter for most
people, given that the config files tend to be large.

What were the biggest roadblocks you hit trying to get ADCSensor working?

--000000000000eaa34905ae2f8af7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 26, 2020 at 11:11 PM Andrei K=
artashev &lt;<a href=3D"mailto:a.kartashev@yadro.com">a.kartashev@yadro.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Since there is a plan to move to EM for inventory, I believe it is<br>
really good idea to also have support for FruDevice in phosphor-host-<br>
ipmid. Then we can have a common way on how to handle it.<br>
Same for SDR BTW.<br></blockquote><div><br></div><div>+1.=C2=A0 This was at=
tempted a long time ago, but nobody was able to come up with a design that =
kept the &quot;old&quot; way working for those that needed it, and at the t=
ime there were some missing features.=C2=A0 Given where entity manager has =
gotten, it&#39;s probably time to start that discussion up again.=C2=A0 Do =
you think you could put together a patch that does what you describe?<br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
But there is other thing: there is catastrophically not enough<br>
documentation for EntityManager/dbus-sensors. Looks like common way<br>
just to adjust existing config and hope that it still will work.<br>
&lt;sorry, was all the day trying to get adcsensors work yesterday&gt; <br>=
</blockquote><div><br></div><div>That being the case, would you mind taking=
 a look at the docs changes I just put up.=C2=A0 It&#39;s trying to improve=
 the EM documentation a bit, although I realize it doesn&#39;t get all the =
way to where it needs to be.</div><div><a href=3D"https://gerrit.openbmc-pr=
oject.xyz/c/openbmc/entity-manager/+/36110">https://gerrit.openbmc-project.=
xyz/c/openbmc/entity-manager/+/36110</a><br></div><div><br></div><div>Also,=
 it&#39;d be great if you can come up with some concrete examples of what e=
lse we can improve in this regard.=C2=A0 Unfortunately the &quot;copy an ex=
isting config and modify&quot; approach was the best way we found to make p=
latform ports easy.=C2=A0 A lot of systems tend to look pretty similar, bas=
ed on similar reference platforms, so usually there&#39;s something to use =
as a starting point.=C2=A0 Building a config from scratch using first princ=
ipals and documentation is kind of daunting, and became a non-starter for m=
ost people, given that the config files tend to be large.</div><div><br></d=
iv><div>What were the biggest roadblocks you hit trying to get ADCSensor wo=
rking?</div><div>=C2=A0</div></div></div>

--000000000000eaa34905ae2f8af7--
