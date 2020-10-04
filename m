Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF942282CDA
	for <lists+openbmc@lfdr.de>; Sun,  4 Oct 2020 21:01:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C4CkV0K5nzDqH4
	for <lists+openbmc@lfdr.de>; Mon,  5 Oct 2020 06:01:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32f;
 helo=mail-wm1-x32f.google.com; envelope-from=dz4list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GhNPmfdI; dkim-atps=neutral
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C4CjY6w98zDqDY
 for <openbmc@lists.ozlabs.org>; Mon,  5 Oct 2020 06:00:27 +1100 (AEDT)
Received: by mail-wm1-x32f.google.com with SMTP id v12so6638467wmh.3
 for <openbmc@lists.ozlabs.org>; Sun, 04 Oct 2020 12:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=qzt5a+rIyy3j+Wyi10/rkB30FA2JaFO0qK6UgdQ9iV0=;
 b=GhNPmfdIIjVNJoGPT3VIMTfrCNNwQCTtl8KvLBfuoVi7HojDsnMvYTWWcWhvtr7s/R
 EQzreWjjOYNOq3UbuTdRuElFsQwImczwl5z/UMXfGV37YB3kWrV/rk0E0Wz+1k30YTKa
 ozIRa0oZg5OZn666UNCh8bITD6WzBv2kXf/nvINvIBvI0PwVbB/+DmR9zTlBA4hvdlfP
 QOLt+tFyiUrRWcyEdBcqzHB0Mpe3dgOBh8eLX7OXRtSQiUeWhFWCjICP9kw127HtjxUs
 A9ejb3XvJR3DeabZdt+SP9NRNGx6T/8oaUG3q+UbpYeLUekjd1ybC25fzLXlG/jON1tS
 xsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=qzt5a+rIyy3j+Wyi10/rkB30FA2JaFO0qK6UgdQ9iV0=;
 b=HucRYVAd0JZxvUd49Mxha//QelP31crhh4rbTWDYfnY227EwzNYlJh5Fk0FGDYcQOP
 T4NCjKgEcdPaG9owXsCECOfmNelP4xsXbWMy0yKUflXE2Kq4Qca26zc9jPIC1kyKP81H
 hB1NRmd/3AJf4yBX8Vkn3QvPaZa7Zx7GyqChClTReO+9+Hpj5PCKnMdrlgyb5yeJcwur
 0G4s2ucB145U+NpaNAATCbbPHb1SaWTjNSCDnE7OsRzvVaTDCw5ggCmC3za2Ysm11XUT
 +Tj7n4b85NUa8fXsCjO+CfQFuNov+hvh9NL/CmUA3U2L6T5XdBKsDOaAw+yqRjRpr1aa
 oL3g==
X-Gm-Message-State: AOAM531gAzjEhyy64GAnyfXI0ZsMHw41NauwKJN8/fnKUL0MlBfuisiH
 7Vx/E7Y4x/9SuncJI42SsMllUPlDFdT1Q2yIBi17/5xrFhc=
X-Google-Smtp-Source: ABdhPJxRlIG1WaqkKzIGSF5nVqbaY/PMaEpADsacyxq+zokHhOmpDY2hiugZnNhlTtHt1KXarrSwwRomafKp7lreOyE=
X-Received: by 2002:a1c:4b0f:: with SMTP id y15mr13695400wma.165.1601838017881; 
 Sun, 04 Oct 2020 12:00:17 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.8.1600999202.18771.openbmc@lists.ozlabs.org>
In-Reply-To: <mailman.8.1600999202.18771.openbmc@lists.ozlabs.org>
From: Dan Zhang <dz4list@gmail.com>
Date: Sun, 4 Oct 2020 12:00:07 -0700
Message-ID: <CAJxKyLdkPPc+R-QOHh7-xLsZPo2Z_39KDa7--s1ovBD71u3bwQ@mail.gmail.com>
Subject: Re: u-boot branches
To: openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>, 
 Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="0000000000000b2ae105b0dcfa94"
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

--0000000000000b2ae105b0dcfa94
Content-Type: text/plain; charset="UTF-8"

We have two options to pick up changes from Aspeed and upstream.
1. Be closer to Aspeed temporary:
 Rebase OpenBMC u-boot changes to aspeed-master-v2019.04, with CIT ( daily
or at least weekly). After the aspeed-master-v2019.04 activity slowed down,
which means the u-boot for AST2600 from Aspeed SDK is getting stable, we
start the effort to upstream the changes.

2. Be closer to upstream:
OpenBMC takes yocto u-boot branch, submit to OpenBMC u-boot branch,
will target upstream immediately.


option-1: get changes from Aspeed is easy, but in this case we need some
important feature / patch from upstream, we need back ports.

option-2: get changes from Aspeed will need more effort than just a simple
cherry pick.

Considering Aspeed is still developing both the AST2600 chip and SDK, I
would like to vote for option-1, as now, there will be much more changes
needed from Aspeed instead of from upstream.

BRs
Dan Zhang

>
>
> ---------- Forwarded message ----------
> From: Michael Richardson <mcr@sandelman.ca>
> To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <
> openbmc@lists.ozlabs.org>, Eddie James <eajames@linux.ibm.com>
> Cc:
> Bcc:
> Date: Thu, 24 Sep 2020 14:02:29 -0400
> Subject: Re: u-boot branches
>
> Joel Stanley <joel@jms.id.au> wrote:
>     > I've chosen to rebase the openbmc changes on top of their branch. The
>     > old branch is still accessible at archive/v2019.04-aspeed-openbmc-1.
>     > The bitbake recipe will continue to work as it uses the nobranch=1
>     > flag, and specifies the version based on the SHA.
>
>     > The new branch contains their aspeed-master-v2019.04 tree as of
> today,
>     > with the OpenBMC changes applied on top.
>
> Is this any closer to upstream u-boot?
> Or is it diverging further?
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

--0000000000000b2ae105b0dcfa94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div></div><div>We have two opt=
ions to pick up changes from Aspeed and upstream.</div><div>1. Be closer to=
 Aspeed temporary:<br></div><div>=C2=A0Rebase OpenBMC u-boot changes to asp=
eed-master-v2019.04, with CIT ( daily or at least weekly). After the aspeed=
-master-v2019.04 activity slowed down, which means the u-boot for AST2600 f=
rom Aspeed SDK is getting stable, we start the effort to upstream the chang=
es.</div><div>=C2=A0</div><div>2. Be closer to upstream:</div><div> OpenBMC=
 takes yocto u-boot branch, submit to OpenBMC u-boot branch, <br></div><div=
>will target upstream immediately.<br></div><div><br></div><div><br> </div>=
<div><div><div><div class=3D"gmail_quote">option-1: get changes from Aspeed=
 is easy, but in this case we need some important feature / patch from upst=
ream, we need back ports. <br></div><div class=3D"gmail_quote"><br></div><d=
iv class=3D"gmail_quote">option-2: get changes from Aspeed will need more e=
ffort than just a simple cherry pick. <br></div><div class=3D"gmail_quote">=
<br></div><div class=3D"gmail_quote">Considering Aspeed is still developing=
 both the AST2600 chip and SDK, I would like to vote for option-1, as now, =
there will be much more changes needed from Aspeed instead of from upstream=
. <br></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote"=
>BRs</div><div class=3D"gmail_quote">Dan Zhang<br></div><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br><br>---------=
- Forwarded message ----------<br>From:=C2=A0Michael Richardson &lt;<a href=
=3D"mailto:mcr@sandelman.ca" target=3D"_blank">mcr@sandelman.ca</a>&gt;<br>=
To:=C2=A0Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au" target=3D"_blan=
k">joel@jms.id.au</a>&gt;, OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@l=
ists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;, Eddie =
James &lt;<a href=3D"mailto:eajames@linux.ibm.com" target=3D"_blank">eajame=
s@linux.ibm.com</a>&gt;<br>Cc:=C2=A0<br>Bcc:=C2=A0<br>Date:=C2=A0Thu, 24 Se=
p 2020 14:02:29 -0400<br>Subject:=C2=A0Re: u-boot branches<br><br>
Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au" target=3D"_blank">joel@j=
ms.id.au</a>&gt; wrote:<br>
=C2=A0 =C2=A0 &gt; I&#39;ve chosen to rebase the openbmc changes on top of =
their branch. The<br>
=C2=A0 =C2=A0 &gt; old branch is still accessible at archive/v2019.04-aspee=
d-openbmc-1.<br>
=C2=A0 =C2=A0 &gt; The bitbake recipe will continue to work as it uses the =
nobranch=3D1<br>
=C2=A0 =C2=A0 &gt; flag, and specifies the version based on the SHA.<br>
<br>
=C2=A0 =C2=A0 &gt; The new branch contains their aspeed-master-v2019.04 tre=
e as of today,<br>
=C2=A0 =C2=A0 &gt; with the OpenBMC changes applied on top.<br>
<br>
Is this any closer to upstream u-boot?<br>
Or is it diverging further?<br>
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
</blockquote></div></div></div></div></div>

--0000000000000b2ae105b0dcfa94--
