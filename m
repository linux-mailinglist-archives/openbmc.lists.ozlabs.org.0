Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 053D6288F51
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 18:59:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C7Dnr6zFLzDqcy
	for <lists+openbmc@lfdr.de>; Sat, 10 Oct 2020 03:59:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=netdepot.com (client-ip=2607:f8b0:4864:20::c35;
 helo=mail-oo1-xc35.google.com; envelope-from=mwynkoop@netdepot.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=netdepot.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=netdepot.com header.i=@netdepot.com header.a=rsa-sha256
 header.s=google header.b=fvfAxNA+; dkim-atps=neutral
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C7Dmx4ZhKzDqZT
 for <openbmc@lists.ozlabs.org>; Sat, 10 Oct 2020 03:58:52 +1100 (AEDT)
Received: by mail-oo1-xc35.google.com with SMTP id w7so2523319oow.7
 for <openbmc@lists.ozlabs.org>; Fri, 09 Oct 2020 09:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netdepot.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=YMNJeQ0/WWW4OYWR3TM1MEXIN1q3IiOtIPJPaUn92nE=;
 b=fvfAxNA+AQ6MUudPIpER86+eg3ZoUbMjBi6tH/EnLc1+qiWjEPWEGsIBkdZCQAOWrj
 L+/5DDKUCGnivgSzz6gGppxYrqQffgZlKvxnGcCjOuGJOaRJ7ABDQurGVSnOfSaGOOnm
 XDZOuoWK1Urh+d3SZ0fYjt1P/QqtemRb6kOc7qhIljG2EKN+wRe6bdxzxTdQa3TcLlnw
 1EFePbS7A8I0RJP9MmeACCiI6RmZ0da66W/pugHM9DIG7ONn77AlZtbpqy0lZ7oppqFT
 DG4+DXi1aKkUZBQB83D9pkzLMZpOWbFs0A9G8NhuaEUSGHMlJ86i7LVY2ECzLzIpDLaA
 4EmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YMNJeQ0/WWW4OYWR3TM1MEXIN1q3IiOtIPJPaUn92nE=;
 b=e8iX7idQEJ4riu+/uZBr+QcvmG70FPFhTwxhrYjT93X3u0M4j1oqChNIDh7Fn/mTMv
 pgtNjUMmjWvsr0CExPRZoLlr8Uqr9CYgZjXsNlZGtUJbkaEjWSSCa4n4xsu6qSH56n5M
 kXFHnxpWfLmK7umSTDeFOGU83ITWdsUZHnwNoaO0sMs+BimAFhAhmlXGNgtsz/DZ2EVC
 T+QC4abdyelmNP+Jlc4WLuQZUMRj8NJwn9oLDpU9+SyzYhqJxEgiOUIz9P+FTTN3+3vL
 A6HaqP684b/6pivs4TNDOyopLnWqWAh8mOXUNr2LqqqSynYcRRsG7YxKr1enwTrTJU8K
 Id2Q==
X-Gm-Message-State: AOAM531VLscnxom31ymsGcsESjO7JIFDA4gBBn4Qb3ZfbvvVwPF/Hrzh
 NbB6YKBTDAJWmNlT/yBgZDYOimwiA46SDCteEAahtO4haW+FMl6S
X-Google-Smtp-Source: ABdhPJwt0qwB34QL8o4buuaPL1wRfvnI3o/DuA6mN5u+PJfs8UDAhuw1dHWmfxUJWWecvxL0plB+h38W/74CA6KM8C4=
X-Received: by 2002:a4a:e592:: with SMTP id o18mr9613072oov.28.1602262729208; 
 Fri, 09 Oct 2020 09:58:49 -0700 (PDT)
MIME-Version: 1.0
From: Mac Wynkoop <mwynkoop@netdepot.com>
Date: Fri, 9 Oct 2020 11:58:38 -0500
Message-ID: <CAMqc+eJk4P1HKZvx5JhNAcnRjnnHY2ZsquRXyrP74kVogtrkcQ@mail.gmail.com>
Subject: Nuvoton WPCM450 Support
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000cfc98605b13fdc89"
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

--000000000000cfc98605b13fdc89
Content-Type: text/plain; charset="UTF-8"

Hi Everyone,

Does anyone know if the Nuvoton WPCM450 BMC would support being flashed to
OpenBMC?

Thanks,
Mac Wynkoop, Senior Datacenter Engineer
*NetDepot.com:* Cloud Servers; Delivered
Houston | Atlanta | NYC | Colorado Springs

1-844-25-CLOUD Ext 806

--000000000000cfc98605b13fdc89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Everyone,<div><br></div><div>Does anyone know if the=C2=
=A0Nuvoton WPCM450 BMC would support being flashed to OpenBMC?</div><div><b=
r></div><div>Thanks,<br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_=
signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div di=
r=3D"ltr"><div style=3D"margin:0px;padding:0px 0px 20px;width:1512px;font-f=
amily:Roboto,RobotoDraft,Helvetica,Arial,sans-serif;font-size:medium"><div>=
<div style=3D"font-size:12.8px;margin:8px 0px 0px;padding:0px"><div><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Mac Wynkoop, Sen=
ior Datacenter Engineer<br><b>NetDepot.com:</b>=C2=A0Cloud Servers; Deliver=
ed</div><div>Houston | Atlanta | NYC | Colorado Springs</div><div><br>1-844=
-25-CLOUD Ext 806</div><div><br></div><div><br></div></div></div></div></di=
v></div></div></div></div><div></div><div></div></div></div><div></div></di=
v></div></div></div></div></div></div></div></div>

--000000000000cfc98605b13fdc89--
