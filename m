Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 878DD23C1E6
	for <lists+openbmc@lfdr.de>; Wed,  5 Aug 2020 00:25:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLq8N5Gg4zDqPQ
	for <lists+openbmc@lfdr.de>; Wed,  5 Aug 2020 08:25:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::135;
 helo=mail-il1-x135.google.com; envelope-from=ticotimo@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cjciEAZg; dkim-atps=neutral
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLq7F4rZbzDq8t
 for <openbmc@lists.ozlabs.org>; Wed,  5 Aug 2020 08:24:36 +1000 (AEST)
Received: by mail-il1-x135.google.com with SMTP id c6so561785ilo.13
 for <openbmc@lists.ozlabs.org>; Tue, 04 Aug 2020 15:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CWIc7/mGjsfeIfFs8sItucGCBe1Hf+n3t/a329tzV/4=;
 b=cjciEAZgtFc+Iksc5UkjyRFcHQaZe5dWUgT36UrCZFlhT+AuIa2knM7oV9kDD+GETE
 QIcTIZvjR41JYMXAb98uQWUDKdaUjYiP/+MSnnWiQMuUvBoCS0T3HUxvKs6hthv2UmKD
 qhyvOmDYyq3t59KNFgvapqaF0fAzYWnIX3GZc7ed32pquvo1oy3puP5vO/tSn485cTTA
 qJbh89npCci37LrXrIbrPc4xf6S2pm8LVJrs2AJp5IFwoVtOrcVvM1yhVUVImb38xsd2
 Ewysm12YtYHUXQKJnuKHR1R7wauwbdkTb8IidxmIjBg9fORVYG/AxlrSMKXffewnhVQv
 8WjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CWIc7/mGjsfeIfFs8sItucGCBe1Hf+n3t/a329tzV/4=;
 b=DNJmHBhXBEVJEa91e6C9+qRpL2AimVBvq6tT9B2dbRmzBxp7Ay6B5kjMkz/+kRBQ6s
 6odld1Vt0RSGUaLNYXMOA/OPrfoApd0lma8LlEEMOXWAr4aLs6+BKlv6kzFeTNGQ2YB6
 sKM3IOhbMl9RCszUsSSKxy/2erEXOUnH3DoeHTP2kIYI3GWriViDbi3g40PXperNWPCi
 jvC2dOYGaYDOiI2F5VV6b2j/8ZafGf6cqFoRL8AgJOO6vy3MyIbBQqS2SOpV1umjfrPd
 EX/LhRV3frYPf+P5EzOwPBBZqIYGKotOou5gOJ/ZXSoEzB5g9EiuaO2EoBOnC3gb7B5/
 cYlg==
X-Gm-Message-State: AOAM531jwApWjp9bNPAPviDMA9O0/zxxwghXUupL4EE9B4GwvVHHXE20
 9p+IfpUdIyyzdtHXxIY5u6sZgmz51OsLgUKHX24=
X-Google-Smtp-Source: ABdhPJzcxb6QY86aIEiZPll70A0GurA043NWq2FpihnLaIDDNi86e2t7TmaX7oxmQQeCymrJHILj6ycEH5nZXv2BhnI=
X-Received: by 2002:a92:ba17:: with SMTP id o23mr734990ili.198.1596579872870; 
 Tue, 04 Aug 2020 15:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <CABbLDjM09zoW7xo0UdgJc=BsQ2ef7kVFbZFNVmdefc6RtHrz8Q@mail.gmail.com>
In-Reply-To: <CABbLDjM09zoW7xo0UdgJc=BsQ2ef7kVFbZFNVmdefc6RtHrz8Q@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 4 Aug 2020 15:24:22 -0700
Message-ID: <CANx9H-C3bOT=Nbn4RqxjpCcmTFij1=YqOp8fUy2td6sVU3J-AQ@mail.gmail.com>
Subject: Re: yoctoproject restructured?
To: Anony Mous <obmc.developers@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000002d950905ac14b871"
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

--0000000000002d950905ac14b871
Content-Type: text/plain; charset="UTF-8"

We are experiencing infrastructure issues on the NAS that feeds dl.yp.o

On Tue, Aug 4, 2020 at 2:28 PM Anony Mous <obmc.developers@gmail.com> wrote:

> Hi:  I have been building without issues, but I just did a fresh git to do
> a new build, and I am now failing because the system cannot fetch the file
> http://downloads.yoctoproject.org/releases/opkg/opkg.0.4.2.tar.gz.
>
> Does anyone know of a workaround for this error.
>
> Thank you!
>
>

--0000000000002d950905ac14b871
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">We are experiencing infrastructure issues on the NAS=
 that feeds dl.yp.o</div></div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Aug 4, 2020 at 2:28 PM Anony Mous &lt=
;<a href=3D"mailto:obmc.developers@gmail.com">obmc.developers@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi:=C2=
=A0 I have been building without issues, but I just did a fresh git to do a=
 new build, and I am now failing because the system cannot=C2=A0fetch the f=
ile <a href=3D"http://downloads.yoctoproject.org/releases/opkg/opkg.0.4.2.t=
ar.gz" target=3D"_blank">http://downloads.yoctoproject.org/releases/opkg/op=
kg.0.4.2.tar.gz</a>.<div><br></div><div>Does anyone know of a workaround fo=
r this error.</div><div><br></div><div>Thank you!</div><div><br></div></div=
>
</blockquote></div></div>

--0000000000002d950905ac14b871--
