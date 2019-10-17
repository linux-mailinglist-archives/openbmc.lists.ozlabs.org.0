Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D611DB332
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 19:22:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vGFg3LSwzDqby
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 04:22:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::534;
 helo=mail-ed1-x534.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="mailpSGt"; 
 dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vGDr0184zDqbs
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 04:22:03 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id a15so2396699edt.6
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 10:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AVo7JIQ2JqMjKNUZwxLxUwERtdKBR7/9/U5YKPFXP68=;
 b=mailpSGtIjN7DeqPKiCtKceTHh4RjnKXRBa7ODSkDSYNIKa0V1rH7VybGYSr0ldHaP
 bODRbcd4UkUYpD2NSAddleCKc3kmmO8yZpKCzpWLnhZYuVAPZwTnYNyns6KfUdqMSPPH
 2ROImfP5ED6Ssh1ybDRMTQiNTGO9XJgLQOzZ1dC8lWHeen4+gJKfJN2rL5Fd3OEMSQOO
 qvCVZGgMLuyNldmihWUqNbKYmJzoE+pDpHOhO86GD2S9np7GBCx1wnCzKX6e8KlCaESB
 U0dLb/cf53wX5pJ6OTGfrn+64jdlmuFd1mem8Y8Q09Pgwd2X7nWcgCMTRRuS/v5sXCo7
 jsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AVo7JIQ2JqMjKNUZwxLxUwERtdKBR7/9/U5YKPFXP68=;
 b=K9y/l4B/EyFQJHAG76rXokJSd1pgFzb/Wk2OuFyOkDH5hu++j0vqcC+/XJQ9m6Lhem
 5mEPud6WsG+mKsrJ5dLZMuz8O3b517k0UPXv9b2Ue7muhvCkatWMlauP+H8yUBQeBQOC
 NR2k+bWYxIfpXgr0fGHUGHUDmKXrCRCz2iIao89I5KCAsHWX2XXAC4X37NXQ7IngxZda
 L9uFdQwpRwaytDkSQbXLr+4BWpoV/JOL58WGO7tNbB6EAME0UkcS8d0V+yA573fHAOmd
 F2PGCDZIyCiLNYjNjcpTIxbcgBwlGaR1HodTR9+4Q/Tl9cnLc3lrmCNecBqCDRdrheAt
 bgxA==
X-Gm-Message-State: APjAAAWKLFls61COia7ACX/x/7uvA2R867UHrYs8DBce8wVz5w+HExk4
 3JxoRi2OWAftfinSwawKLNxwUySZAPOlkEfEcJIKyw7a
X-Google-Smtp-Source: APXvYqxYwAQpVIp0VwklRbriq/4F4QzRzGxcOx1S+e7juIM9wqf2PlvKQsqzEIbn8+SUVkCXWI1Kru2ZyI3z9F4UsyU=
X-Received: by 2002:a50:8dc9:: with SMTP id s9mr5005128edh.168.1571332918597; 
 Thu, 17 Oct 2019 10:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <EA590716-271A-4F5C-9B36-80260B7F35B6@fb.com>
 <21807.1571306216@dooku.sandelman.ca>
 <CABoTLcTWzDmn+up4Qq_h=X+YNty=XyTQqHKRDr6N+5ELY=xOZg@mail.gmail.com>
 <cd3563fd-47bb-2c09-beda-5ce5ba8c8aa0@linux.intel.com>
In-Reply-To: <cd3563fd-47bb-2c09-beda-5ce5ba8c8aa0@linux.intel.com>
From: Oskar Senft <osk@google.com>
Date: Thu, 17 Oct 2019 13:21:42 -0400
Message-ID: <CABoTLcRsJSSeB81jx-7WCXAfrB2CvB+ZbXvnmPxCaikCVpu=0Q@mail.gmail.com>
Subject: Re: x86-power-control
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000704d2a05951e74f2"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Michael Richardson <mcr@sandelman.ca>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000704d2a05951e74f2
Content-Type: text/plain; charset="UTF-8"

Hi Jason


> In our DTS we use gpio-line-names to name all of the GPIOs in one block:
>
> &gpio {
>         status = "okay";
>         gpio-line-names =
> [...]
>         /*D0-D7*/       "","","","","","","","",
>         /*E0-E7*/
>  "RESET_BUTTON","RESET_OUT","POWER_BUTTON","POWER_OUT","","","","",
>         /*F0-F7*/       "NMI_OUT","","","","CPU_ERR0","CPU_ERR1","","",
>         /*G0-G7*/
>  "CPU_ERR2","CPU_CATERR","PCH_BMC_THERMTRIP","","","","","",
>

Ugh, ok - that's a nice trick. But it's also a little messy :-/ Is that the
"officially recommended" way? I guess, since the other option I tried
doesn't work!.

Is that purely used for naming lines, or does it have any semantic impact?

Thanks
Oskar.

--000000000000704d2a05951e74f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Jason<div><br></div></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>In o=
ur DTS we use gpio-line-names to name all of the GPIOs in one block:<br>
<br>
&amp;gpio {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio-line-names =3D<br>[...]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*D0-D7*/=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot=
;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&q=
uot;,&quot;&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*E0-E7*/=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;RESET=
_BUTTON&quot;,&quot;RESET_OUT&quot;,&quot;POWER_BUTTON&quot;,&quot;POWER_OU=
T&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*F0-F7*/=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;NMI_O=
UT&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;CPU_ERR0&quot;,&quot;=
CPU_ERR1&quot;,&quot;&quot;,&quot;&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*G0-G7*/=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;CPU_E=
RR2&quot;,&quot;CPU_CATERR&quot;,&quot;PCH_BMC_THERMTRIP&quot;,&quot;&quot;=
,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<br></blockquote><div>=
<br></div><div>Ugh, ok - that&#39;s a nice trick. But it&#39;s also a littl=
e messy :-/ Is that the &quot;officially recommended&quot; way? I guess, si=
nce the other option I tried doesn&#39;t work!.</div><div><br></div><div>Is=
 that purely used for naming lines, or does it have any semantic impact?</d=
iv><div><br></div><div>Thanks</div><div>Oskar.=C2=A0</div></div></div>

--000000000000704d2a05951e74f2--
