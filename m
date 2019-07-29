Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C0D782FC
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 03:15:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xhZZ2yznzDqRt
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 11:15:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="T0etBk1y"; 
 dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xhYy10YfzDqRm
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2019 11:15:00 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id k8so57790822edr.11
 for <openbmc@lists.ozlabs.org>; Sun, 28 Jul 2019 18:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yoy2QjEOrLE95IGkZji1BDK/RTN3iII9BjX4ZvGVdWo=;
 b=T0etBk1yy0E8Zqd1SrKEOn8Rs2wrMCETONKnLwziKkNJ3nol+6+QfbXqxICN2UiA+e
 Zi7TTQLj16P1X9RbfXyI79ZLhM3Lryvd/oWEOA3jbT04iq2QLYoFbeqnm6Z5H5anH86y
 OWw1Gk6fjq68yYMmbNrOtWviOo/4m2hXWQeNCwGWiPqSiUdxE2DnEK1ErarD//FgejfA
 iRx8rsniXbALJbrChCeLqDZkkXp1Vqp2n5zEFnP7jcprz+yMW1HCNTkAIiJmzzipXuTx
 ggHarEjsEIW3+wA2bYeUdzP7CxeOPuO9kFiLrP3Ldnh2tKUsG8PYzxJD1vA/OTKTsq3H
 NAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yoy2QjEOrLE95IGkZji1BDK/RTN3iII9BjX4ZvGVdWo=;
 b=qihxrfEQlQ3SLtZaNKyUXlzj7lCtRgyRkXLUFTXFEqaHnOcbfGwlcQfK0TcRSiErYr
 qdpkdEqhvjRs4xU9Xab0wNImT4PKP67Z0dbZ/VMBR4HK5AzUkijn6WecLPG5N3I4Cf96
 HIXDekInpgGWxXdfQcoICrP0yKaQmIVsmKgyBlWxw1T/l0EA/B94UNlwjQKlIKqDJ0E/
 Ij+W/wDzPM64AwcTmfJhzZMMVHPmjTFSYb5yKrmhvexIPYhs5TLQolWcqE3AbbdrJtn/
 B6FELurRglSPe99pgMRnsdPzUInt6Q7NL7ZyVK/mOs0e/OKG0qwb+rKLcGMyAGanM6Xz
 bcPw==
X-Gm-Message-State: APjAAAVaFB9PZyrnbUmDsIzrJxT+UcwTy5Pz9cWCeLlFWmx62dDlS4dN
 zF2TcqqZ9/CfIqmDziZG71u2sRJ8/wmdWRdTdQyJWQ==
X-Google-Smtp-Source: APXvYqwr8HbmLWIPSB++QfrL2/vbQuyAMxm5b3/B9V8nL3NS3NMxixC3VwU806+Mj54ZGP8pXJfkhpj4MdxrCo/Uxwo=
X-Received: by 2002:a17:906:3f91:: with SMTP id
 b17mr55701882ejj.74.1564362893481; 
 Sun, 28 Jul 2019 18:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190727134242.49847-1-osk@google.com>
 <9fb8c99449cebd68fb5975890dedaa06ce7808ae.camel@kernel.crashing.org>
 <CABoTLcRPXffZuKy-DTFUVKJQRydSzMDynYRgBbZ_470iVN1KnA@mail.gmail.com>
 <CABoTLcTSFvQruPRnoRPgiWjOXNDOCSnAXVesG7f1WAuLLLVSSg@mail.gmail.com>
 <6b31627a8c5a2616c83783550517961b7ed8f3cb.camel@ozlabs.org>
In-Reply-To: <6b31627a8c5a2616c83783550517961b7ed8f3cb.camel@ozlabs.org>
From: Oskar Senft <osk@google.com>
Date: Sun, 28 Jul 2019 21:14:36 -0400
Message-ID: <CABoTLcQF4_He15F5oO0Pxjdm6f7pLCxBF77cz7wR=jjWaednYQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/tty/serial/8250: Make Aspeed VUART SIRQ polarity
 configurable
To: Jeremy Kerr <jk@ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000915423058ec79ebd"
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000915423058ec79ebd
Content-Type: text/plain; charset="UTF-8"

Hi Jeremy

In my understanding the SIRQ polarity should be the same for all UARTs on
the particular bus, i.e. both UARTs controlled by the SuperI/O and the
VUART or PUART (pass-through). However, the host controls the UARTs on the
SuperI/O itself. The VUART is covered by this code and we don't have a
PUART driver yet.

It might make sense to have this as a global setting which each driver
could read. But wouldn't this be an exercise for the future where we
actually have a second device? I don't think the Aspeed currently has any
other devices that could generate a SIRQ (except for the PUART for which
there's no driver).

Having said that, ideally I'd like the SIRQ polarity to be auto-configured
from the LPC/eSPI HW pin strap anyway. I have the code for that almost
done. Maybe we shouldn't even have the sysfs interface for it and I should
strip that out?

Thanks
Oskar.

On Sun, Jul 28, 2019 at 8:51 PM Jeremy Kerr <jk@ozlabs.org> wrote:

> Hi Oskar,
>
> > For LPC, the polarity should be set to 1, for eSPI the default of 0 is
> > correct.
>
> Would there ever be a case where different SIRQs need different
> polarities? If not, we may want this to be global, rather than for each
> device (the VUART being one...)
>
> Cheers,
>
>
> Jeremy
>
>

--000000000000915423058ec79ebd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jeremy<div><br></div><div>In my understanding the SIRQ =
polarity should be the same for all UARTs on the particular bus, i.e. both =
UARTs controlled by the SuperI/O and the VUART or PUART (pass-through). How=
ever, the host controls the UARTs on the SuperI/O itself. The VUART is cove=
red by this code and we don&#39;t have a PUART driver yet.</div><div><br></=
div><div>It might make sense to have this as a global setting which each dr=
iver could read. But wouldn&#39;t this be an exercise for the future where =
we actually have a second device? I don&#39;t think the Aspeed currently ha=
s any other devices that could generate a SIRQ (except for the PUART for wh=
ich there&#39;s no driver).</div><div><br></div><div>Having said that, idea=
lly I&#39;d like the SIRQ polarity to be auto-configured from the LPC/eSPI =
HW pin strap anyway. I have the code for that almost done. Maybe we shouldn=
&#39;t even have the sysfs interface for it and I should strip that out?</d=
iv><div><br></div><div>Thanks</div><div>Oskar.</div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jul 28, 2019 at=
 8:51 PM Jeremy Kerr &lt;<a href=3D"mailto:jk@ozlabs.org">jk@ozlabs.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi O=
skar,<br>
<br>
&gt; For LPC, the polarity should be set to 1, for eSPI the default of 0 is=
<br>
&gt; correct.<br>
<br>
Would there ever be a case where different SIRQs need different<br>
polarities? If not, we may want this to be global, rather than for each<br>
device (the VUART being one...)<br>
<br>
Cheers,<br>
<br>
<br>
Jeremy<br>
<br>
</blockquote></div>

--000000000000915423058ec79ebd--
