Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A478D174E39
	for <lists+openbmc@lfdr.de>; Sun,  1 Mar 2020 17:10:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48VpCR72F9zDr1c
	for <lists+openbmc@lfdr.de>; Mon,  2 Mar 2020 03:10:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TX4WGmrr; dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48VpBn4rBZzDqjM
 for <openbmc@lists.ozlabs.org>; Mon,  2 Mar 2020 03:09:50 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id i14so202947otp.5
 for <openbmc@lists.ozlabs.org>; Sun, 01 Mar 2020 08:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CTNialg1zp7ovIScbVpocLO//xrjvKGc9/zPpmE3Vbs=;
 b=TX4WGmrrHZwFVCTAVTGB1rnOUgSim9OwdoNPwR5z3PaLwInGq62wy/lAYJVLNPOVEO
 stBcs/XS5H3hsaucd0F9FOsmakd/CBi5+snjJyc8O/jynQ57dRZ7hfXo0bsBOZ7/KlX1
 TADGxafj7rmWS+a05Q3g8fKlbf8hw16rL/YoYQouKJvpmKSBnq1UYKKoZlnR5C0VzEFO
 2YuMETObzblQb735D8h5vH1PrdJ4FRSH6e3m4Mb39Ivb5j1OCz5gkB3lYYfGGqWrRqL7
 pYPo50wV3eLUw8Ja611+7q5uYLHl5fGCrNpkUl2QLjOTAy5DeleeEoQhR+Vr8FcY1w1E
 knpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CTNialg1zp7ovIScbVpocLO//xrjvKGc9/zPpmE3Vbs=;
 b=Kdsn/7DfRpKMjzVmJItPWIkU31D9iHwUoQsAV2FW8CUi2PospgxmgVnhwOBsvd9kQK
 ARCrNgRlMQYIr1DRVpsRccDnWiuPd0WLtFyQH3oWvK/3S7AmvUBDkdazbAKQp35l7gVQ
 9AgsEyxRCtq/2nRDr0M9jYTkDekVmr6im7jj/QGAj26jBeEcqxWo3tXjlW35RfEH6N7+
 LIwJBrt9q4b6gS4yUmoMAztVavLzBqhB5yFHn2J5joIBCBktgmZRWRXkVF1RsAh4Zep/
 mh8rnfxuwyDWk5l1TuZhVEQu6ywmB+hHQvpWY8wyeH17qpRiCN7bS6eRdTI870T8BL0S
 9yig==
X-Gm-Message-State: ANhLgQ20qSjVyNoIa2pI+Frv5mJpy/iszLH0Nb+uRJnmJinocGmdCHua
 KJthHvPyNluKfs5rXJmIbbmubMg45IiTqXxdoxE=
X-Google-Smtp-Source: ADFU+vtFnIXbTQOIG9VDhEBiWptpMNLIM/BNkkQQIXBH8yfuuuLvU7gRnMEd7pGtJoVwf45solsBkts0zhSzqSP7gio=
X-Received: by 2002:a9d:7dc9:: with SMTP id k9mr1584312otn.321.1583078987730; 
 Sun, 01 Mar 2020 08:09:47 -0800 (PST)
MIME-Version: 1.0
References: <20200301094040.123189-1-tmaimon77@gmail.com>
 <20200301094040.123189-2-tmaimon77@gmail.com>
 <6ecf9a6b-8fca-1e7a-10d0-ee518e6ecf64@roeck-us.net>
 <CAP6Zq1gYvoGwNwr2zCopQ5CcyVUjgdYK6yX1wVMmWh5gapp+zQ@mail.gmail.com>
 <e009d5e5-03a1-301c-0a65-c7f59c1be9fa@roeck-us.net>
In-Reply-To: <e009d5e5-03a1-301c-0a65-c7f59c1be9fa@roeck-us.net>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 1 Mar 2020 18:19:43 +0200
Message-ID: <CAP6Zq1j+MSCYgyQeJYid682pS0ZrHWGiX8oLr5f0GD4VLBdoPA@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] dt-binding: watchdog: add restart priority
 documentation
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: multipart/alternative; boundary="000000000000b7135c059fcd4c49"
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000b7135c059fcd4c49
Content-Type: text/plain; charset="UTF-8"

Thank you for the clarification.

I will remove the priority patch, and send a new patch set after receiving
comments for the boot status patch.

Tomer

On Sun, 1 Mar 2020 at 17:46, Guenter Roeck <linux@roeck-us.net> wrote:

> On 3/1/20 7:36 AM, Tomer Maimon wrote:
> >
> >
> > On Sun, 1 Mar 2020 at 12:06, Guenter Roeck <linux@roeck-us.net <mailto:
> linux@roeck-us.net>> wrote:
> >
> >     On 3/1/20 1:40 AM, Tomer Maimon wrote:
> >     > Add device tree restart priority documentation.
> >     >
> >
> >     I think this warrants an explanation _why_ this is needed.
> >     What is the use case ? Not just theory, please.
> >
> >
> > In the NPCM750 there is two initiated restarts:
> >
> >   * Software reset
> >   * WD reset
> >
> > the Software restart found at NPCM reset driver
> > https://github.com/torvalds/linux/blob/master/drivers/reset/reset-npcm.c
> >
> > In NPCM WD driver the restart is configure as well, I will like to add
> the priority so the user will have maximum flexibility if he using both
> restarts
> >
>
> This is not the intended use case for restart priority. It is not
> intended to be user configurable. The idea is that the more thorough
> restart gets higher priority. This is implied by the restart method,
> not by user preferences.
>
> Also, the idea behind supporting multiple means to reset the system
> is to be able to support multiple means to restart, some of which
> may not always be available. In that situation, the priority means,
> and is supposed to mean, "pick the best restart method available".
> Again, that is determined by system design, and not supposed to
> be configurable by the user.
>
> On top of that, a watchdog driver based reset is almost always
> a reset of last resort, to be chosen only if nothing else is available
> in a given system. The existence of the reset driver confirms that
> this is not different for this driver/chip.
>
> Guenter
>

--000000000000b7135c059fcd4c49
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for the clarification.=C2=A0<br><div><br></div><=
div>I will remove the priority patch, and send a new patch set after receiv=
ing comments for the boot status patch.</div><div><br></div><div>Tomer</div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Sun, 1 Mar 2020 at 17:46, Guenter Roeck &lt;<a href=3D"mailto:linux@roe=
ck-us.net">linux@roeck-us.net</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On 3/1/20 7:36 AM, Tomer Maimon wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Sun, 1 Mar 2020 at 12:06, Guenter Roeck &lt;<a href=3D"mailto:linux=
@roeck-us.net" target=3D"_blank">linux@roeck-us.net</a> &lt;mailto:<a href=
=3D"mailto:linux@roeck-us.net" target=3D"_blank">linux@roeck-us.net</a>&gt;=
&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 3/1/20 1:40 AM, Tomer Maimon wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Add device tree restart priority documentation=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I think this warrants an explanation _why_ this is =
needed.<br>
&gt;=C2=A0 =C2=A0 =C2=A0What is the use case ? Not just theory, please.<br>
&gt; <br>
&gt; <br>
&gt; In the NPCM750 there is two=C2=A0initiated=C2=A0restarts:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0* Software reset<br>
&gt;=C2=A0 =C2=A0* WD reset<br>
&gt; <br>
&gt; the Software restart found at NPCM reset driver<br>
&gt; <a href=3D"https://github.com/torvalds/linux/blob/master/drivers/reset=
/reset-npcm.c" rel=3D"noreferrer" target=3D"_blank">https://github.com/torv=
alds/linux/blob/master/drivers/reset/reset-npcm.c</a><br>
&gt; <br>
&gt; In NPCM WD driver the restart is configure as well, I will like to add=
 the priority so the user will have maximum flexibility=C2=A0if he using bo=
th restarts<br>
&gt; <br>
<br>
This is not the intended use case for restart priority. It is not<br>
intended to be user configurable. The idea is that the more thorough<br>
restart gets higher priority. This is implied by the restart method,<br>
not by user preferences.<br>
<br>
Also, the idea behind supporting multiple means to reset the system<br>
is to be able to support multiple means to restart, some of which<br>
may not always be available. In that situation, the priority means,<br>
and is supposed to mean, &quot;pick the best restart method available&quot;=
.<br>
Again, that is determined by system design, and not supposed to<br>
be configurable by the user.<br>
<br>
On top of that, a watchdog driver based reset is almost always<br>
a reset of last resort, to be chosen only if nothing else is available<br>
in a given system. The existence of the reset driver confirms that<br>
this is not different for this driver/chip.<br>
<br>
Guenter<br>
</blockquote></div>

--000000000000b7135c059fcd4c49--
