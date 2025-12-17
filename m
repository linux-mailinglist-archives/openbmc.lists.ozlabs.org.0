Return-Path: <openbmc+bounces-1048-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53712CC7239
	for <lists+openbmc@lfdr.de>; Wed, 17 Dec 2025 11:44:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWVmJ2MLpz2yrZ;
	Wed, 17 Dec 2025 21:44:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765968272;
	cv=none; b=fxEKz9jUDRnv/VpaRCTaQwYLx7kmUGET4wwVmmL1DbElrjlxJSvGUWdjNOleP7a5UmZCBqXW9ikx5S+hYhu4YCeSd8nnFs47xmH79ux5DU475slrfq+Imhheeee0h38v1m6JO4T5+OLko2xBCRTfE8OHcMe3zmJ+cC9bzjlAt16+OBNX9P4wbGi1y/9d8owKCKoPLP7TY4Y6FLAa27Zxv24NpX3j4BinGT+l/ryM2bDzk47UK8KL45FYK4U8XU7+q8vans/DkdT6bPY4VZ24cY6waRgT14QXBBQ9g5KATvj306ck087x7cKIgeA4+sCI04xSKOEjB15pusVBaR531A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765968272; c=relaxed/relaxed;
	bh=916Ad++n3T2xgtqdqi5iXEdEsTwh/wOKOqmTe0PDenA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gBkBSxhtwYvH4zhZC5HtBp2b4W4I4q9nyGDMGKL8DTgE3JYqkIXA/H3HpvPKs2TPFBGVjZtb+z6S+HVZeaTiDQrkaVspieU7ao8DbhnESXMv9e4As6BDSiH0lYIk8x2nID7cpIpkAy4p0SazPcZFzi44CYTIH9LVoVChzmzpfBhwpm7OZHJiEpKm+14eLLDoYsuketFUDkVrEuGDTvJ2/NGizcrGqUJMugnnAi7r0lr70qeJVUxiNTg/GJS+L7OVpfNhWii8QrFzZhna9sYuepDIOheDhCMIxbR4xQyPBDpGhpumYBgrQJLQ1B6D2CTWrhJV4wirhihN9KnLJ0U34Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cYmk2U7A; dkim-atps=neutral; spf=pass (client-ip=209.85.128.176; helo=mail-yw1-f176.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cYmk2U7A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.176; helo=mail-yw1-f176.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWVmG1Kqxz2yrX
	for <openbmc@lists.ozlabs.org>; Wed, 17 Dec 2025 21:44:29 +1100 (AEDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78a6a7654a4so50720407b3.0
        for <openbmc@lists.ozlabs.org>; Wed, 17 Dec 2025 02:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765968206; x=1766573006; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=916Ad++n3T2xgtqdqi5iXEdEsTwh/wOKOqmTe0PDenA=;
        b=cYmk2U7AerZCXMewxvgU6RQt9yQqEmP/x0Mzr6sn4qgux7AymAa2+cXk/SVN8BVZuI
         8vgSqXZFD+76yqwf2Kz0brEPc4F+osOT6rXmByk4i807yTz1l2sNJEpHsDuu/EwjCoCE
         tcDMwOKsq+S+jNke/TaIidn4WU5+8RPIOiM9AbAvnsgIF9Ti4qx3mG8VqMf/GnGIVP3Z
         bFR6EBT0MwCN3hXG19L79U6EGPTGx827fLDtJIPT/oJ9H1JFmQnK8uNxKid4dsOQqm7/
         9GOAS16+cqG6yqrQQTjFb3n+6Tqt36mIy0FiyNIqDTQyUEiUMsQGoE3Ed7iq8ZZAaDAE
         umbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765968206; x=1766573006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=916Ad++n3T2xgtqdqi5iXEdEsTwh/wOKOqmTe0PDenA=;
        b=vXA3sDPFMjldXFaP4YFBMgiJ3fz/d3sOFPxuLcSvpsLlSLI536pyzNRLdOIGahz+LM
         UyFe/9n0ac6THAcHc39U2ENE5RvN4sFB/S+78wcyyl4YiFo0xIpWrcu1KUsBaAZ7f79u
         5oycJbLRfd/Gmy0W2WIIr8dIki6rXbew+oESeosP1iTHiKjZ6KaNBx1Wz7PkwFGEWnuC
         bLy/NxpyuxF8e0hnontgIkDjiLbUIwcGAT9lXuI8wmysOGQKuaNqoc9Jw6LqRoxhEATt
         2GjRXmvBultJXw1fFfqvtSPcvNsTBoYnmtxQua7uuYC1E0aWZUaCLVvHjwkzvXgregY3
         o1+Q==
X-Gm-Message-State: AOJu0YwFG4DOWVj8OG165xAhcdpmangaFBFG7/eZ8snuFHPPsTz59DRu
	Gz6l6rAdN7+IeyvvqThxY3cDtF3zu1SVRXgF05JSZ8dqGMDgsyDuhqJFe151nYk8uOfzWd+hYhE
	6VlrYUl73OI8GvG8CcDXFSUdJG79EH7rJvMtb
X-Gm-Gg: AY/fxX7bBmtiYup4t7WuUSeHx6jSvRaxIB6DMRK5ENyZMDn9HvSxuGO60t0nnjJyGMA
	7zTIkI5Ay/0SUe/6A3MnDsmkL9G5moGbkq8VhgIiz8rUy3sEEZAU+SSHG5evY0/tyOoMnCNzYkW
	llwP9Jp6+PTy54b6nsS6IxSgOPH/B/2sinymqAZRwkkUB1hE0uERskoQYMPPkrU5MH53LSH5kF/
	JHryw34CAG0BBlsGKVSeaNh3T9JBqSTRTqq4nftFoDcHCsJ/gP8cdpuPsQR3CWnKZculgNs
X-Google-Smtp-Source: AGHT+IFE4/2qGR2fmqObU9mDINpOOcv98jVhIgoqrtbbhu/DvjhWF96RHqz4mUsMORPPfVV+qqNv26Y0KoUeu/sUaM4=
X-Received: by 2002:a05:690c:3807:b0:78f:8f4c:884e with SMTP id
 00721157ae682-78f8f4c8e0dmr31364197b3.21.1765968206209; Wed, 17 Dec 2025
 02:43:26 -0800 (PST)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <4ec04355da4aa5595297f31bdd190d4e2c1f4cb2.camel@codeconstruct.com.au>
In-Reply-To: <4ec04355da4aa5595297f31bdd190d4e2c1f4cb2.camel@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 17 Dec 2025 12:43:14 +0200
X-Gm-Features: AQt7F2oZoY3ANaWX1-qI9p60nUEGXGhlaW0V4lC4RalxqjoWKlzZvWYJ63tdjsI
Message-ID: <CAP6Zq1gh24LcnyZF7yt_TYoBMqj=mnkBcZOzkN1g8qQb0fQ8HA@mail.gmail.com>
Subject: Re: openbmc/linux dev-6.18
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: openbmc <openbmc@lists.ozlabs.org>, Cosmo Chou <chou.cosmo@gmail.com>, 
	Eddie James <eajames@linux.ibm.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Leo Yang <Leo-Yang@quantatw.com>, Peter Yin <peteryin.openbmc@gmail.com>, 
	"tomer.maimon" <tomer.maimon@nuvoton.com>, Matt Johnston <matt@codeconstruct.com.au>, 
	Tan Siewert <tan@siewert.io>
Content-Type: multipart/alternative; boundary="0000000000009da75d0646238327"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--0000000000009da75d0646238327
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

Thank you very much for pushing dev-6.18 to the OpenBMC Linux kernel
repository!

Do you have an estimate for when the dev-6.18 branch might become the
default branch for the OpenBMC Linux kernel?

Thanks,

Tomer

On Wed, 17 Dec 2025 at 12:09, Andrew Jeffery <andrew@codeconstruct.com.au>
wrote:

> Hi all,
>
> Linux v6.18 is a new long-term stable release[1], and I've now pushed a
> branch[2] and corresponding recipe patches[3] moving OpenBMC over to
> it.
>
> [1]: https://www.kernel.org/category/releases.html
> [2]: https://github.com/openbmc/linux/tree/dev-6.18
> [3]: https://gerrit.openbmc.org/q/topic:%22openbmc-linux-dev-6.18%22
>
> The patch migration was done in two steps, first from v6.12 to v6.17,
> and then from v6.17 to v6.18. The multi-step effort was mainly a means
> to test my own process. If anyone's interested in what that looks like
> I'm happy to talk through it with you.
>
> The patches listed below were either dropped or modified, listed by
> step.
>
> Please test dev-6.18 on your platforms and report any issues.
>
> Andrew
>
> ---
>
> Dropped or modified migrating from v6.12 to v6.17:
>
>    Amit Sunil Dhamne (1):
>          usb: typec: tcpm: Add support for parsing pd-revision DT property
>
>    Andrew Jeffery (2):
>          soc: aspeed: lpc-snoop: Rearrange channel paths
>          soc: aspeed: lpc-snoop: Lift channel config to const structs
>
>    Breno Leitao (1):
>          Revert "x86/bugs: Make spectre user default depend on
> MITIGATION_SPECTRE_V2" on v6.6 and older
>
>    Cosmo Chou (1):
>          dt-bindings: trivial-devices: add mps,mp5998
>
>    Eddie James (3):
>          leds: pca955x: Optimize probe led selection
>          leds: pca955x: Add HW blink support
>          leds: Ensure hardware blinking turns off when requested
>
>    Jeremy Kerr (2):
>          net: mctp: Add MCTP USB transport driver
>          net: mctp: separate routing database from routing operations
>
>    Leo Yang (1):
>          hwmon: Add driver for TI INA233 Current and Power Monitor
>
>    Peter Yin (1):
>          dt-bindings: trivial-devices: add isil,isl69260
>
>    Tomer Maimon (2):
>          reset: npcm: register npcm8xx clock auxiliary bus device
>          clk: npcm8xx: add clock controller
>
>    Wensheng Wang (1):
>          dt-bindings: hwmon: Add MPS mp2869,mp29608,mp29612,mp29816 and
> mp29502
>
> Dropped or modified migrating from v6.17 to v6.18:
>
>    Amit Sunil Dhamne (2):
>          usb: typec: tcpm: unregister existing source caps before
> re-registration
>          usb: typec: tcpm: fix use-after-free case in
> tcpm_register_source_caps
>
>    Andrew Jeffery (2):
>          ARM: dts: aspeed: Rework APB nodes
>          Revert "ARM: dts: aspeed: Rework APB nodes"
>
>    Greg Kroah-Hartman (1):
>          usb: typec: fix up incorrectly backported "usb: typec: tcpm:
> unregister existing source caps before re-registration"
>
>    Matt Johnston (1):
>          mctp i3c: handle NULL header address
>
>    Michael Grzeschik (1):
>          usb: typec: tcpm: allow switching to mode accessory to mux
> properly
>
>    RD Babiera (1):
>          usb: typec: tcpm: apply vbus before data bringup in
> tcpm_src_attach
>
>    Tan Siewert (1):
>          ARM: dts: aspeed: e3c256d4i: convert NVMEM content to layout
> syntax
>
>    Wensheng Wang (1):
>          dt-bindings: hwmon: Add MPS mp2869,mp29608,mp29612,mp29816 and
> mp29502
>
>
>

--0000000000009da75d0646238327
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Andrew,<div><br></div><div><p dir=3D"auto" class=3D"gma=
il-break-words" style=3D"box-sizing:border-box;border-style:solid;border-wi=
dth:0px;border-color:rgba(5,5,5,0.06);margin:7px 0px;color:rgb(10,10,10);fo=
nt-family:universalSans,Inter,Roboto,&quot;Open Sans&quot;,Arial,sans-serif=
,ui-sans-serif,system-ui,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Seg=
oe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;,&quot;Noto Color Emoji&quot;;=
letter-spacing:-0.1px;background-color:rgb(252,252,252)">Thank you very muc=
h for pushing dev-6.18 to the OpenBMC Linux kernel repository!</p><p dir=3D=
"auto" class=3D"gmail-break-words" style=3D"box-sizing:border-box;border-st=
yle:solid;border-width:0px;border-color:rgba(5,5,5,0.06);margin:7px 0px;col=
or:rgb(10,10,10);font-family:universalSans,Inter,Roboto,&quot;Open Sans&quo=
t;,Arial,sans-serif,ui-sans-serif,system-ui,sans-serif,&quot;Apple Color Em=
oji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;,&quot;Noto=
 Color Emoji&quot;;letter-spacing:-0.1px;background-color:rgb(252,252,252)"=
>Do you have an estimate for when the dev-6.18 branch might become the defa=
ult branch for the OpenBMC Linux kernel?</p></div><div><br></div><div>Thank=
s,</div><div><br></div><div>Tomer</div></div><br><div class=3D"gmail_quote =
gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 17 Dec=
 2025 at 12:09, Andrew Jeffery &lt;<a href=3D"mailto:andrew@codeconstruct.c=
om.au">andrew@codeconstruct.com.au</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Hi all,<br>
<br>
Linux v6.18 is a new long-term stable release[1], and I&#39;ve now pushed a=
<br>
branch[2] and corresponding recipe patches[3] moving OpenBMC over to<br>
it.<br>
<br>
[1]: <a href=3D"https://www.kernel.org/category/releases.html" rel=3D"noref=
errer" target=3D"_blank">https://www.kernel.org/category/releases.html</a><=
br>
[2]: <a href=3D"https://github.com/openbmc/linux/tree/dev-6.18" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/openbmc/linux/tree/dev-6.18</a=
><br>
[3]: <a href=3D"https://gerrit.openbmc.org/q/topic:%22openbmc-linux-dev-6.1=
8%22" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc.org/q/top=
ic:%22openbmc-linux-dev-6.18%22</a><br>
<br>
The patch migration was done in two steps, first from v6.12 to v6.17,<br>
and then from v6.17 to v6.18. The multi-step effort was mainly a means<br>
to test my own process. If anyone&#39;s interested in what that looks like<=
br>
I&#39;m happy to talk through it with you.<br>
<br>
The patches listed below were either dropped or modified, listed by<br>
step.<br>
<br>
Please test dev-6.18 on your platforms and report any issues.<br>
<br>
Andrew<br>
<br>
---<br>
<br>
Dropped or modified migrating from v6.12 to v6.17:<br>
<br>
=C2=A0 =C2=A0Amit Sunil Dhamne (1):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usb: typec: tcpm: Add support for parsing=
 pd-revision DT property<br>
<br>
=C2=A0 =C2=A0Andrew Jeffery (2):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0soc: aspeed: lpc-snoop: Rearrange channel=
 paths<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0soc: aspeed: lpc-snoop: Lift channel conf=
ig to const structs<br>
<br>
=C2=A0 =C2=A0Breno Leitao (1):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Revert &quot;x86/bugs: Make spectre user =
default depend on MITIGATION_SPECTRE_V2&quot; on v6.6 and older<br>
<br>
=C2=A0 =C2=A0Cosmo Chou (1):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dt-bindings: trivial-devices: add mps,mp5=
998<br>
<br>
=C2=A0 =C2=A0Eddie James (3):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0leds: pca955x: Optimize probe led selecti=
on<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0leds: pca955x: Add HW blink support<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0leds: Ensure hardware blinking turns off =
when requested<br>
<br>
=C2=A0 =C2=A0Jeremy Kerr (2):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0net: mctp: Add MCTP USB transport driver<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0net: mctp: separate routing database from=
 routing operations<br>
<br>
=C2=A0 =C2=A0Leo Yang (1):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwmon: Add driver for TI INA233 Current a=
nd Power Monitor<br>
<br>
=C2=A0 =C2=A0Peter Yin (1):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dt-bindings: trivial-devices: add isil,is=
l69260<br>
<br>
=C2=A0 =C2=A0Tomer Maimon (2):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reset: npcm: register npcm8xx clock auxil=
iary bus device<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk: npcm8xx: add clock controller<br>
<br>
=C2=A0 =C2=A0Wensheng Wang (1):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dt-bindings: hwmon: Add MPS mp2869,mp2960=
8,mp29612,mp29816 and mp29502<br>
<br>
Dropped or modified migrating from v6.17 to v6.18:<br>
<br>
=C2=A0 =C2=A0Amit Sunil Dhamne (2):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usb: typec: tcpm: unregister existing sou=
rce caps before re-registration<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usb: typec: tcpm: fix use-after-free case=
 in tcpm_register_source_caps<br>
<br>
=C2=A0 =C2=A0Andrew Jeffery (2):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARM: dts: aspeed: Rework APB nodes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Revert &quot;ARM: dts: aspeed: Rework APB=
 nodes&quot;<br>
<br>
=C2=A0 =C2=A0Greg Kroah-Hartman (1):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usb: typec: fix up incorrectly backported=
 &quot;usb: typec: tcpm: unregister existing source caps before re-registra=
tion&quot;<br>
<br>
=C2=A0 =C2=A0Matt Johnston (1):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mctp i3c: handle NULL header address<br>
<br>
=C2=A0 =C2=A0Michael Grzeschik (1):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usb: typec: tcpm: allow switching to mode=
 accessory to mux properly<br>
<br>
=C2=A0 =C2=A0RD Babiera (1):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usb: typec: tcpm: apply vbus before data =
bringup in tcpm_src_attach<br>
<br>
=C2=A0 =C2=A0Tan Siewert (1):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARM: dts: aspeed: e3c256d4i: convert NVME=
M content to layout syntax<br>
<br>
=C2=A0 =C2=A0Wensheng Wang (1):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dt-bindings: hwmon: Add MPS mp2869,mp2960=
8,mp29612,mp29816 and mp29502<br>
<br>
<br>
</blockquote></div>

--0000000000009da75d0646238327--

