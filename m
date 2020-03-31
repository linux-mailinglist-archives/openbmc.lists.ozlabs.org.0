Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DB6198E31
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 10:21:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s2NP0jFhzDqfD
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 19:21:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d34;
 helo=mail-io1-xd34.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=W9m75s8L; dkim-atps=neutral
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48s2Mj0RRKzDqTX
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 19:20:48 +1100 (AEDT)
Received: by mail-io1-xd34.google.com with SMTP id q128so20731503iof.9
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 01:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=51LgvzIuRysdza1S/JWLOvoIBPNwCakL1OiTInhVGp8=;
 b=W9m75s8LgL9sXFREWUpYHV5AZXKzEqJkiTIcpa/aBO9JuSebKLs/xBzKaNeyx2kXQT
 hgFqRvNeOMEePc9eH5n8wTJWLY+7NsBqnPGmQvM7rZiRUwp1MjblONM5ujJugzzGj5bS
 bCUbcwtdQZKLA2TuOk/sdEKk2Qjt7ta5JgmWtoF1RqC57g6bQvw10JMQGr5jlztFbzHP
 VCHcUZSTMq42BV5gk5yFxiTsCUhmbCzxVZl0HvcKw9IDGwM+RUNm5YGI/qRglI5Nw2mn
 sThNChXPEl+Dw80z2ZLoNotnkuHDnjxpqSWuJE8nS+Pei5XpG2wF1e096NuiEJYQ3DEC
 xyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=51LgvzIuRysdza1S/JWLOvoIBPNwCakL1OiTInhVGp8=;
 b=awkkfEt1s98U4V4WtyfuTtmF9aUgfWB2iJ522U7tXEpGSaVgGDqy/GBieUSCdYxatC
 yz6Byzfg50lIyqIYY2SK1IvuT1L3AXLxdxFJ5nc2womfLhNhSNjYOgRMEdFLMoT4eKOW
 NuJ8zymVYQS9lAGCGzw10GLsJtwCJHOajuuENbWtaCKH/e0QRD/eEiI9jzCXJJerrK8l
 HWK/l3cytsA2vXug+ZZrUrrRNTLOIPqxgHGHLUiyOeAuc/kJgHMRVY9sLvo39F/E4MhH
 eRC/PIx/1FEMiZzMbn0RrGFEkvChVUtdilKem0nqrD3gzgkhkIRNrVtgf9I+BwLlH1jR
 9FkQ==
X-Gm-Message-State: ANhLgQ2NfHoHs4z24yNh3dD2VKUPGhsGuHOHiGM7+/0JvZjUJuYpYd+k
 du1HNVQILIEvOJSDUi9eESCILbqgfNcsNegUQXoYs23i
X-Google-Smtp-Source: ADFU+vuJN/JUSn6IkbXPc4WVksWi7gOuzceJfsS3CssRtAhdktKw0tXiSAaMGICIVz1h/yC6BV3oTiXoz6ndcw6zS8o=
X-Received: by 2002:a6b:ec19:: with SMTP id c25mr13180304ioh.98.1585642844920; 
 Tue, 31 Mar 2020 01:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <CADVsX88r_Jf6+_UXSXOs44n4TVV8kssZ7UxPXJqoJp3AeFNWig@mail.gmail.com>
In-Reply-To: <CADVsX88r_Jf6+_UXSXOs44n4TVV8kssZ7UxPXJqoJp3AeFNWig@mail.gmail.com>
From: Anton Kachalov <rnouse@google.com>
Date: Tue, 31 Mar 2020 10:20:34 +0200
Message-ID: <CADVsX8_4gH_tejvGP3_8QqOJakcFaosdqop5dt-ekt+JjU7aKw@mail.gmail.com>
Subject: Re: SELinux or AppArmor integration status & plans
To: openbmc@lists.ozlabs.org, jrey@linux.vnet.ibm.com
Content-Type: multipart/alternative; boundary="000000000000837d4505a2223e52"
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

--000000000000837d4505a2223e52
Content-Type: text/plain; charset="UTF-8"

Gently ping.

On Wed, 25 Mar 2020 at 11:01, Anton Kachalov <rnouse@google.com> wrote:

> Hello,
>
> I'm referring to the wishlist:
>
>
> https://github.com/openbmc/openbmc/wiki/Security-working-group#security-feature-wish-list
>
> that mentions about using the SELinux feature.
>
> What is the current status and plans to integrate either SELinux or
> AppArmor?
> I'm especially interested in the hardening D-Bus (it can do both: AppArmor
> & SELinux).
>
> Thanks!
>

--000000000000837d4505a2223e52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Gently ping.</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, 25 Mar 2020 at 11:01, Anton Kachalov =
&lt;<a href=3D"mailto:rnouse@google.com">rnouse@google.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">=
<div>Hello,</div><div><br></div><div>I&#39;m referring to the wishlist:</di=
v><div><br></div>=C2=A0 =C2=A0<a href=3D"https://github.com/openbmc/openbmc=
/wiki/Security-working-group#security-feature-wish-list" target=3D"_blank">=
https://github.com/openbmc/openbmc/wiki/Security-working-group#security-fea=
ture-wish-list</a><br><div><br></div><div>that mentions about using the SEL=
inux feature.</div><div><br></div><div>What is the current status and plans=
 to integrate either SELinux or AppArmor?</div><div>I&#39;m especially inte=
rested in the hardening D-Bus (it can do both: AppArmor &amp; SELinux).</di=
v><div><br></div><div>Thanks!</div></div>
</blockquote></div>

--000000000000837d4505a2223e52--
