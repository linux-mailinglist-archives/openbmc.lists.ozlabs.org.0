Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C82FF3757
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 19:36:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478Btg384kzF6cx
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2019 05:36:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TZKaiPO9"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478Bsq48mXzF6cv
 for <openbmc@lists.ozlabs.org>; Fri,  8 Nov 2019 05:35:27 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id m15so2882670otq.7
 for <openbmc@lists.ozlabs.org>; Thu, 07 Nov 2019 10:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OvfAfqBV95/Vs4Ku6YBB5QW8fmzhsVNuh6obvWotnSY=;
 b=TZKaiPO97p4eWsZtXyzl+4706hV34zqLPr+8oC6Mm+VLgJNY+g9zDydf0l5gW9bPyk
 z28vOurA2wf2onh47cBRgEDiTRAYke8ittYk1iVrW6fl2i5ocMit09YKmNCDIu69jmVk
 NnjztGCkaoml0g7mJhgX1sBbnZIPwkMWVvvmABvJhDR9LawSmEZ283NT1PdmF5uL1VIr
 j7Y+H0nHrB6xOh4y47lIvnm6UeWNj1pVNMih+kBP/SzbyaC1HVIcSKgbajdSRkZXKsSj
 QWrpYZLyBZBvuuWlUEPNhnZb4EeAo8jBlvOWEpSRFnD5EXhESB+VREfuVKIFMkdCRZOB
 g0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OvfAfqBV95/Vs4Ku6YBB5QW8fmzhsVNuh6obvWotnSY=;
 b=H02h5tvJvqqjfbTHxLZwZ6qf5ZbylWiAY2EMkjATmuN6WEZXj9irrPHliSK45ZGF7f
 Z9SSSEEZLMlRA1zZUiW3jO8mQQwiyrz8ymEwpNum8oFWjYJ+4RMozO4t+AOEYjGeMbJZ
 WevNIalGsZq9g9hQr8MYqHrvYB0SMrZh+sEJlu/hKwi1QfpdJ+EAUZ7QixF7/HvkqdrU
 LOaVwE3LAPZFbutpwY0mTCk4y47jQV6Pa6pqUVcv/Wji+jEditwdoyEocaFcnMtr+y9X
 /XqTnjrP071xD+HuXOYOZspr91q3haTuRHGh/bDvSh7a1tLAsEQoGD4YYHuDZ0TWyzhi
 ADIQ==
X-Gm-Message-State: APjAAAWkPCp5T1HzyiAm3tS8zuUTRn8srIvY0A7LIJbkR+51kOm0UreR
 V4ZHbZxlzPbW1zh9sFNuAAY6XqjXbj6DVHwxJY8=
X-Google-Smtp-Source: APXvYqzmyQSn2cqx2TGS1BrhINu51FCsawMN7Q7T9QvpOIZ2zoksJYaOAvaF1pfA1yP/l11YKPMx4dhQ3Z9S3hC8hzQ=
X-Received: by 2002:a9d:4c13:: with SMTP id l19mr4031490otf.269.1573151723920; 
 Thu, 07 Nov 2019 10:35:23 -0800 (PST)
MIME-Version: 1.0
References: <20191106145331.25740-1-tmaimon77@gmail.com>
 <1bacac547977493e50bb1fadfaf4b9ad5b4fdf0c.camel@pengutronix.de>
In-Reply-To: <1bacac547977493e50bb1fadfaf4b9ad5b4fdf0c.camel@pengutronix.de>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 7 Nov 2019 20:45:03 +0200
Message-ID: <CAP6Zq1j5mpmU+eNP7sE_=hcXqKx90+msHin9seM_+e=+D+y2_g@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] reset: npcm: add NPCM reset driver support
To: Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: multipart/alternative; boundary="000000000000aea1b70596c5ed64"
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
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000aea1b70596c5ed64
Content-Type: text/plain; charset="UTF-8"

Hi Philipp and Rob,

Thanks a lot for your support!

Tomer

On Thu, 7 Nov 2019 at 14:59, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Hi Tomer,
>
> On Wed, 2019-11-06 at 16:53 +0200, Tomer Maimon wrote:
> > This patch set adds reset controller support
> > for the Nuvoton NPCM Baseboard Management Controller (BMC).
> >
> > Apart of controlling all NPCM BMC reset module lines the NPCM reset
> driver
> > support NPCM BMC software reset to restarting the NPCM BMC.
> >
> > Supporting NPCM USB-PHY reset as follow:
> >
> > NPCM BMC USB-PHY connected to two modules USB device (UDC) and USB host.
> >
> > If we will restart the USB-PHY at the UDC probe and later the
> > USB host probe will restart USB-PHY again it will disable the UDC
> > and vice versa.
> >
> > The solution is to reset the USB-PHY at the reset probe stage before
> > the UDC and the USB host are initializing.
> >
> > NPCM reset driver tested on NPCM750 evaluation board.
> >
> > Addressed comments from:.
> >  - Philipp Zabel
> >
> > Changes since version 4:
> >  - Check for stored GCR string in the of_device_id->data to gain
> >    GCR regmap access.
> >  - Adding check if the user used undefined reset pins
> >    in the of_xlate function.
> >  - Remove nr_resets initialization since it of_xlate replaced
> >    with the custom version.
>
> Thanks, all three applied to reset/next with Rob's R-b.
>
> regards
> Philipp
>
>

--000000000000aea1b70596c5ed64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Philipp and Rob,<div><br></div><div>Thanks a lot for yo=
ur support!</div><div><br></div><div>Tomer</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 7 Nov 2019 at 14:59=
, Philipp Zabel &lt;<a href=3D"mailto:p.zabel@pengutronix.de">p.zabel@pengu=
tronix.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi Tomer,<br>
<br>
On Wed, 2019-11-06 at 16:53 +0200, Tomer Maimon wrote:<br>
&gt; This patch set adds reset controller support <br>
&gt; for the Nuvoton NPCM Baseboard Management Controller (BMC).<br>
&gt; <br>
&gt; Apart of controlling all NPCM BMC reset module lines the NPCM reset dr=
iver<br>
&gt; support NPCM BMC software reset to restarting the NPCM BMC.<br>
&gt; <br>
&gt; Supporting NPCM USB-PHY reset as follow:<br>
&gt; <br>
&gt; NPCM BMC USB-PHY connected to two modules USB device (UDC) and USB hos=
t.<br>
&gt; <br>
&gt; If we will restart the USB-PHY at the UDC probe and later the <br>
&gt; USB host probe will restart USB-PHY again it will disable the UDC<br>
&gt; and vice versa.<br>
&gt; <br>
&gt; The solution is to reset the USB-PHY at the reset probe stage before <=
br>
&gt; the UDC and the USB host are initializing.<br>
&gt; <br>
&gt; NPCM reset driver tested on NPCM750 evaluation board.<br>
&gt; <br>
&gt; Addressed comments from:.<br>
&gt;=C2=A0 - Philipp Zabel<br>
&gt; <br>
&gt; Changes since version 4:<br>
&gt;=C2=A0 - Check for stored GCR string in the of_device_id-&gt;data to ga=
in<br>
&gt;=C2=A0 =C2=A0 GCR regmap access. <br>
&gt;=C2=A0 - Adding check if the user used undefined reset pins<br>
&gt;=C2=A0 =C2=A0 in the of_xlate function.<br>
&gt;=C2=A0 - Remove nr_resets initialization since it of_xlate replaced <br=
>
&gt;=C2=A0 =C2=A0 with the custom version.<br>
<br>
Thanks, all three applied to reset/next with Rob&#39;s R-b.<br>
<br>
regards<br>
Philipp<br>
<br>
</blockquote></div>

--000000000000aea1b70596c5ed64--
