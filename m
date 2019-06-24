Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BE3518B9
	for <lists+openbmc@lfdr.de>; Mon, 24 Jun 2019 18:31:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XZYl0xlYzDqTP
	for <lists+openbmc@lfdr.de>; Tue, 25 Jun 2019 02:31:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="p9rwO+U0"; 
 dkim-atps=neutral
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XZY32STBzDqHv
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jun 2019 02:31:01 +1000 (AEST)
Received: by mail-io1-xd36.google.com with SMTP id k8so382052iot.1
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jun 2019 09:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V1SlGS5YEUjndDbRrTrU9fMy9etdA3E69Tis4l66fMI=;
 b=p9rwO+U05LffayE7hVc7fYZm3+pUheDcNsOqy3MgUbKGZMGEf8aJKTpt4ehDAnu9wu
 7W6hJhYCHm2vX+ucqFLEQmlx+8qD3DrQKrhaX5slEnKbcw+AfACjbCo8Q/8XWeOv2Y/A
 jpgxdF0GQqtvVDoXrTQa9VQSSkCiAaiSWyors8YhsedNpERMLBzEwhf1slTDPYGDr+z2
 hDYxbMjCcjgXyBteeglpoNfjgt6NuVTDobCfATD5C2QMW6hBNBBFWVxgStVeVTaCCRoI
 4CdQ1MElGqTF8YS2oDX1atWXR5BPDT90OFMNGQMgsqbUQcufydPSooBKuu8tGZUrzM3I
 vB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V1SlGS5YEUjndDbRrTrU9fMy9etdA3E69Tis4l66fMI=;
 b=ICtmhFaY42/cGpBA8bwrMaXYTyhiYlPpSNiBzpdeJ7a64ajTC1SnrGixi1nbOctcVg
 2KfhNiCOi1Ds233drq9csbWy2+TSjUpMHPlPN72CFL7TQhnC7Ng80BYq+eY5jLOIZZTP
 S8POk7Z7g7O8dMQjFdaT3bCXQ4L2ohbRiSk6P6sPztruVqk5z89ClDednKq5u/Eacmsc
 kajMfmFBzyFmnB55+vrAPgkSVClZbIwnuPgY/TYRoCzCfHe+0y0KvSSKGMeAsb/Ywvtf
 3NUHKxJSFfTzYTWNXjaFNzRC930rpfYCPes/ijFc9lJOy/09e9itJ4i9EcQH6B6Dz3FP
 vTKg==
X-Gm-Message-State: APjAAAU2+w9S8e52y0LtAsjU6bBg+AAFqTVkoOSGPT3zRInsWsLwjMAE
 6chCUY+WlGw7PdQOVEZenaiKrhT5ZJGXaWDvmMlPzMHPA5k=
X-Google-Smtp-Source: APXvYqwg2zQ8raeSlVtL8EDrzCsexjt+WUNU4V4J+Z0Zk6IqvjyNWtVDeFC5zs2eYdsu/YAseqsAAdcXWs+d8tfA+c8=
X-Received: by 2002:a6b:4107:: with SMTP id n7mr9991511ioa.12.1561393857610;
 Mon, 24 Jun 2019 09:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <CADfYTpEGPt5Bo+X689iaaFm5zWsx4CZrtj9yuNiedw5X5Orejw@mail.gmail.com>
 <CACPK8XfBwP1M01BNuy0E3DwYdvpJLw-GNyRq9tPrtV2OuzgfBA@mail.gmail.com>
In-Reply-To: <CACPK8XfBwP1M01BNuy0E3DwYdvpJLw-GNyRq9tPrtV2OuzgfBA@mail.gmail.com>
From: Nancy Yuen <yuenn@google.com>
Date: Mon, 24 Jun 2019 09:30:20 -0700
Message-ID: <CADfYTpHYLE32+E=7Vi_HOUU1mSUeVkPnMZbe8DYcWHeXA1nPfA@mail.gmail.com>
Subject: Re: OpenBMC Hackathon will be at OSFC Sept 2019
To: Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="0000000000003d83a2058c14563f"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000003d83a2058c14563f
Content-Type: text/plain; charset="UTF-8"

Looking forward to your presentations Joel!  See you there.

----------
Nancy


On Thu, Jun 20, 2019 at 5:36 PM Joel Stanley <joel@jms.id.au> wrote:

> On Thu, 20 Jun 2019 at 15:35, Nancy Yuen <yuenn@google.com> wrote:
> >
> > OpenBMC will hold a Hackathon as part of the Open Source Firmware
> Conference (OSFC) in September.  OpenBMC will have it's own track there.
> Several other firmware projects will also represented.  Registration is
> required and there is a limit on the number of spots added with this track.
> Please register early.
>
> Great! I've registered and have travel sorted. I plan to submit a talk
> on the openbmc kernel/u-boot efforts, and I would also like to talk
> about our qemu work.
>
> I look forward to seeing everyone in September.
>
> Cheers,
>
> Joel
>

--0000000000003d83a2058c14563f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looking forward to your presentations Joel!=C2=A0 See you =
there.<div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature=
" data-smartmail=3D"gmail_signature">----------<br>Nancy</div></div><br></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Thu, Jun 20, 2019 at 5:36 PM Joel Stanley &lt;<a href=3D"mailto:joel@=
jms.id.au">joel@jms.id.au</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Thu, 20 Jun 2019 at 15:35, Nancy Yuen &lt;<a hr=
ef=3D"mailto:yuenn@google.com" target=3D"_blank">yuenn@google.com</a>&gt; w=
rote:<br>
&gt;<br>
&gt; OpenBMC will hold a Hackathon as part of the Open Source Firmware Conf=
erence (OSFC) in September.=C2=A0 OpenBMC will have it&#39;s own track ther=
e.=C2=A0 Several other firmware projects will also represented.=C2=A0 Regis=
tration is required and there is a limit on the number of spots added with =
this track. Please register early.<br>
<br>
Great! I&#39;ve registered and have travel sorted. I plan to submit a talk<=
br>
on the openbmc kernel/u-boot efforts, and I would also like to talk<br>
about our qemu work.<br>
<br>
I look forward to seeing everyone in September.<br>
<br>
Cheers,<br>
<br>
Joel<br>
</blockquote></div>

--0000000000003d83a2058c14563f--
