Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E54E63E0FDB
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 10:08:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgLpF5hT3z3cHQ
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 18:08:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=RsWM27Pe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=wh800805@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RsWM27Pe; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgLnx4kRNz2xYs
 for <openbmc@lists.ozlabs.org>; Thu,  5 Aug 2021 18:08:04 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 o44-20020a17090a0a2fb0290176ca3e5a2fso7473308pjo.1
 for <openbmc@lists.ozlabs.org>; Thu, 05 Aug 2021 01:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=cS4TvA9yomUdwNyov6KKwCU9zXgo1u0jjaepLIzjoKw=;
 b=RsWM27PeFCvjXUJK2FCVTxFeU3iSIdWhvOf4o3C4+VSbczpWl3lB0UPVl9wdyktaDQ
 fTELwMq92py8yU+8tMX0+U6lbOy7DJY8ML1hdfQkLwNkF/8iG6LiJ08oux6BYvz52atU
 dlwmz1toti6hy3HtO5uKI9Bq5/W+i5GNKrZErxogSsz7xukJO857bCRJWrt290DIxiyw
 ttl+3Iayq6ovyPr3IAAnOSN98O/4lwOcJtoKQZ7Y1ax7OSqw2Z+FS0LjvzQ06VYGghE2
 CKEj1xhO19qyh0NosWflxZH6nj4GGtmu/weGRDPvBAYblNWExeeySLLFKC+zo4LE+SLx
 /EuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=cS4TvA9yomUdwNyov6KKwCU9zXgo1u0jjaepLIzjoKw=;
 b=LFdjO3TPA5TrtAPqNe1Jhqw/sek23Yv+rVVEg31pR6HHHv9cgGASne+TqJ0Jzz7OHZ
 eGuuhpk38AzCamEKCW8m/wvtq0Co9DVGEY5bnevtpG9Ao5UsK27pFdv5mSkXS+wNsifZ
 vbYlQOXJ72uOh1TESR5dQDfT6PEimj/7rImXtyyEZiSL9PspywlLJofRQEfILSYdJmC3
 xNjbIMwX6EYRltfaesERnoYDi5rQTCUVohwzhXy349VhSR+AK9U152Ed3lgzfG9Qi013
 +PvzuS/tIpMVjRfxyztbMkTGI3ArJOfUN5ou9uizH3tqLBfvmPeE8Iv55Pxy9d8cJ/mB
 +UPA==
X-Gm-Message-State: AOAM533vfMLvFYBqIqcnP2xfwl4llWeFV92zbvTLYODEI28iReQGVGo+
 fvN3QijaS2rCIgHhpMEjQw==
X-Google-Smtp-Source: ABdhPJwBf/QuRCCGHd25M9xgQsB9HTDFmcSQuQF7Jy+39JheHbPRYWM/bTCvhi8IKHZAH8oUO1gLOw==
X-Received: by 2002:a17:90b:1bcc:: with SMTP id
 oa12mr3484635pjb.94.1628150880944; 
 Thu, 05 Aug 2021 01:08:00 -0700 (PDT)
Received: from smtpclient.apple (220-128-110-82.HINET-IP.hinet.net.
 [220.128.110.82])
 by smtp.gmail.com with ESMTPSA id o192sm5663487pfd.78.2021.08.05.01.07.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Aug 2021 01:08:00 -0700 (PDT)
From: =?utf-8?B?5ZCz56eJ5piM?= <wh800805@gmail.com>
Message-Id: <9C46B5AD-5390-4369-BFC3-251DAC5C02F8@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_D5676AB1-8122-4233-BB4D-95404EBECC00"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: Module develop issue
Date: Thu, 5 Aug 2021 16:07:58 +0800
In-Reply-To: <8bb488fe-a2a0-4fca-b751-ab20db1f4578@www.fastmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
References: <E8EC142E-B62A-432D-AAAA-661528534DAC@gmail.com>
 <C552EA2E-A750-4E7C-A3ED-8C1B05B7228C@gmail.com>
 <8bb488fe-a2a0-4fca-b751-ab20db1f4578@www.fastmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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


--Apple-Mail=_D5676AB1-8122-4233-BB4D-95404EBECC00
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Andrew

Thanks you response! I already fixed the issue.=20
I download the linux source code form "https://github.com/openbmc/linux =
<https://github.com/openbmc/linux>=E2=80=9D, and replace the kernel path =
on file "meta-aspeed/recipes-kernel/linux/linux-aspeed.inc=E2=80=9D. Now =
I can build the out of tree module and install to my machine.

BR
Paul


> Andrew Jeffery <andrew@aj.id.au> =E6=96=BC 2021=E5=B9=B48=E6=9C=883=E6=97=
=A5 =E4=B8=8B=E5=8D=887:42 =E5=AF=AB=E9=81=93=EF=BC=9A
>=20
>=20
>=20
> On Mon, 2 Aug 2021, at 19:31, =E5=90=B3=E7=A7=89=E6=98=8C wrote:
>> Hi teams
>>=20
>> Today, I try to install SDK, I can build and run "hello world=E2=80=9D,=
 but I=20
>> still can=E2=80=99t build the hello-mod module.
>> Please give me some suggestions. Many thanks!
>=20
> I'm not aware of anyone else in the OpenBMC community developing =
kernel=20
> modules this way, which might be why you haven't got many responses.
>=20
> My approach is just to work on the kernel directly (i.e. clone the=20
> kernel sources and add your code to the appropriate locations). Is =
this=20
> something that you can try?
>=20
> Andrew


--Apple-Mail=_D5676AB1-8122-4233-BB4D-95404EBECC00
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
Andrew<div class=3D""><br class=3D""></div><div class=3D"">Thanks you =
response! I already fixed the issue.&nbsp;</div><div class=3D"">I =
download the linux source code form "<a =
href=3D"https://github.com/openbmc/linux" =
class=3D"">https://github.com/openbmc/linux</a>=E2=80=9D, and replace =
the kernel path on file =
"meta-aspeed/recipes-kernel/linux/linux-aspeed.inc=E2=80=9D. Now I can =
build the out of tree module and install to my machine.</div><div =
class=3D""><br class=3D""></div><div class=3D"">BR</div><div =
class=3D"">Paul</div><div class=3D""><br class=3D""><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">Andrew =
Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au" =
class=3D"">andrew@aj.id.au</a>&gt; =E6=96=BC 2021=E5=B9=B48=E6=9C=883=E6=97=
=A5 =E4=B8=8B=E5=8D=887:42 =E5=AF=AB=E9=81=93=EF=BC=9A</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D""><br =
class=3D""><br class=3D"">On Mon, 2 Aug 2021, at 19:31, =E5=90=B3=E7=A7=89=
=E6=98=8C wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">Hi =
teams<br class=3D""><br class=3D"">Today, I try to install SDK, I can =
build and run "hello world=E2=80=9D, but I <br class=3D"">still can=E2=80=99=
t build the hello-mod module.<br class=3D"">Please give me some =
suggestions. Many thanks!<br class=3D""></blockquote><br class=3D"">I'm =
not aware of anyone else in the OpenBMC community developing kernel <br =
class=3D"">modules this way, which might be why you haven't got many =
responses.<br class=3D""><br class=3D"">My approach is just to work on =
the kernel directly (i.e. clone the <br class=3D"">kernel sources and =
add your code to the appropriate locations). Is this <br =
class=3D"">something that you can try?<br class=3D""><br =
class=3D"">Andrew<br class=3D""></div></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_D5676AB1-8122-4233-BB4D-95404EBECC00--
