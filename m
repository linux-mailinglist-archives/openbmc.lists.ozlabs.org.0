Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F4D9269D
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 16:24:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Bx566hKKzDqLh
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 00:24:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="LjnakeBn"; 
 dkim-atps=neutral
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Bx1c2kh6zDqXl
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 00:21:23 +1000 (AEST)
Received: by mail-ed1-x531.google.com with SMTP id p28so1836165edi.3
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 07:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mQIPrdWgdQXYPZ+HUEElExrZ+bRbeSFqDv23EpGJJww=;
 b=LjnakeBnDQuQOZowMl/27igwkhDbzG+wXrmSK1+TNliwikTL0j3wuQc05J0XJYc9Fx
 TzJPKtNmnVUDHYIh97zF2JkcOAQ6TJdeYcz3lvbrgA/SpuZm450zUsqh1K4FMudLnST5
 /YsrUDMpU8Gu+xXVjLu0DZuuTsV0s2zKfRG101mYm/qGXiF4T+6qQYX6VggCQGy4m0HV
 CXWlHfm11wqbuEUP80Dno+uYvrd38n4c4DRARabjEeAtU9bisyUpj/uGnJ0UjYUxwSjc
 v1vgHEUqbAfUZy4InhgCAWcClod3No0yDsDfw709EnNojnL4OqOrMacUyIAlTyE++BAs
 oUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mQIPrdWgdQXYPZ+HUEElExrZ+bRbeSFqDv23EpGJJww=;
 b=Qk6X+axw+eCqZzztwRpRdFpCOGZ8oirAXsZpq85RGLixAxEvuC99y/1BIqS+Du0qCV
 htDzIM80ehM9Y+7EJn2hWrcy9N7/AB/vEUN9qpmISGsrQZa6s7ajI0DOiYpl+08gRv1T
 DDmNtmudoG5YJvBTNRV+BeSYtHO5j7koj5QLvfoXN9CmXzUW4Jk1a2uqrI0G65mxZylB
 wnePuT+HN8bbfh7qtr2z/3uqfpOsbJjywOLnn+sAOZNdQtan6YnucIv6PbIwE7jt3BsB
 NoIbJeBUz7PnaTIS5imXupl1TvvwH8ZMJfnFQXw22W6UV6FzWyAeRhNEod6I5/lkgtFo
 yrwg==
X-Gm-Message-State: APjAAAWRNjtGAEII7z1zf/95q+MUS6KzhbQMFHFB3DDq80qHD4PfrRX7
 FJEdKw6pLGmPtMko2GzSv4anENTxPfJYA+TNNgSNLQ==
X-Google-Smtp-Source: APXvYqyrJ7ZwxHU/swNUWpMemJ0UmAOnli0khVjYHUU0XpLWFO44wOiJ43oaqvypthJLZwn0sL+Z8xqr3GW3ziqSkpo=
X-Received: by 2002:a17:906:19cc:: with SMTP id
 h12mr21568793ejd.304.1566224478450; 
 Mon, 19 Aug 2019 07:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <MN2PR04MB5839D33826EF08A499E32167CDA80@MN2PR04MB5839.namprd04.prod.outlook.com>
In-Reply-To: <MN2PR04MB5839D33826EF08A499E32167CDA80@MN2PR04MB5839.namprd04.prod.outlook.com>
From: Oskar Senft <osk@google.com>
Date: Mon, 19 Aug 2019 10:21:01 -0400
Message-ID: <CABoTLcQfUsz6x4ScoeaJ9ujw5XY9uyGq0xx8npBPVKem50y4vQ@mail.gmail.com>
Subject: Re: Socflash says the bmc is write protected.
To: Zheng Bao <fishbaoz@hotmail.com>
Content-Type: multipart/alternative; boundary="000000000000adbafa0590790dc3"
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

--000000000000adbafa0590790dc3
Content-Type: text/plain; charset="UTF-8"

Hi Joe

I assume this is happening due to the fixes for
https://github.com/openbmc/openbmc/issues/3475 (CVE-2019-6260), which
effectively disable all communication from the host to the BMC by default.

I'm not sure which interface socflash uses exactly, though, so I cannot
recommend on what you'd have to re-enable to make it work again. Having
said that, all of the interfaces mentioned in the CVE should really be
disabled for security reasons.

Oskar.

On Mon, Aug 19, 2019 at 8:51 AM Zheng Bao <fishbaoz@hotmail.com> wrote:

> Hi, All,
> I use socflash to update the BMC firmware. The original BMC firmware can
> be updated, but openbmc can not be.
> Socflash says the BMC is protected. Does anybody know why?
>
> Thanks.
> Joe
>

--000000000000adbafa0590790dc3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Joe<div><br></div><div>I assume this is happening due t=
o the fixes for=C2=A0<a href=3D"https://github.com/openbmc/openbmc/issues/3=
475" target=3D"_blank">https://github.com/openbmc/openbmc/issues/3475</a>=
=C2=A0(CVE-2019-6260), which effectively disable all communication from the=
 host to the BMC by default.=C2=A0</div><div><br></div><div>I&#39;m not sur=
e which interface socflash uses exactly, though, so I cannot recommend on w=
hat you&#39;d have to re-enable to make it work again. Having said that, al=
l of the interfaces mentioned in the CVE should really be disabled for secu=
rity=C2=A0reasons.</div><div><br></div><div>Oskar.</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 19, 201=
9 at 8:51 AM Zheng Bao &lt;<a href=3D"mailto:fishbaoz@hotmail.com">fishbaoz=
@hotmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
Hi, All,</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
I use socflash to update the BMC firmware. The original BMC firmware can be=
 updated, but openbmc can not be.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
Socflash says the BMC is protected. Does anybody know why?</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
Thanks. <br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
Joe<br>
</div>
</div>

</blockquote></div>

--000000000000adbafa0590790dc3--
