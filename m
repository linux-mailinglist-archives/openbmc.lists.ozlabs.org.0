Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEB84E63BD
	for <lists+openbmc@lfdr.de>; Thu, 24 Mar 2022 13:56:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPQGR0b2Rz30GN
	for <lists+openbmc@lfdr.de>; Thu, 24 Mar 2022 23:56:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BTgzShhr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2b;
 helo=mail-yb1-xb2b.google.com; envelope-from=srid.11486@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=BTgzShhr; dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPQG06pg2z302S
 for <openbmc@lists.ozlabs.org>; Thu, 24 Mar 2022 23:56:22 +1100 (AEDT)
Received: by mail-yb1-xb2b.google.com with SMTP id y142so8254432ybe.11
 for <openbmc@lists.ozlabs.org>; Thu, 24 Mar 2022 05:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=2kTLa06OZ5Fb32YD6vZXURcoS2kSW+t/HZrHp9UPUWc=;
 b=BTgzShhrfYR7c0yM6zJE6/Vi4HOm2R3daU8RJ0953y9VHxOEaIloSpLpCK3mFiwh8a
 G4rc0YMpiTOnFJ1ekxE8FeAmsw/zqCotzl40Ks85ASa+LA7g22CSxtSeRIne9sFM80lI
 lgstNYAV/ythCEq3llQjrHQUUF2mf5YtvwJdDovssOfwq3FOKW/3PUedsYhkjKE+nMZw
 i2gJbsLTU3pFTdM+HU0GswtC3YvbFoDCYSR/vYiJjAeWPg7fuZ3SZz8puq3ayRU7BDm6
 2dvJ3yT9Q5YWjocpUrcWVr6np6t+KXbLhJ98XtEmkZmlinN/++jY/JP6BxX5eiyFmBB6
 +gJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=2kTLa06OZ5Fb32YD6vZXURcoS2kSW+t/HZrHp9UPUWc=;
 b=0bavRIM7+Jh8ypEFikxroShnP4oH8alRTBFbxHV/JxC4tc9FbPlTuSxkcqFY131qBW
 abnKdb5USV7lvy9ekPVI1yJ0wt/IBt0nrNvYJQ8cNn/xG0bFi9ahpD8wF2Tr8r+x/Caa
 E+FOJ5LpXjekL5gjyJSkNMbYD3JJWsMvkOVqIR2S5oTwQmCwIgxXq/xQxnXz0Q2zhQ7r
 lkaKteWZqRDVBhGtnBfYayYRgz16dthQyHVXev8cyEPIrTwhTbRTCQZ/WHDmYGfyS+VB
 5kQy9AdnKQcC7h5HO9bQRil8IK/GjmPsNWt21GZ7DYV53GNAfq9VWmghpu+XvMGWB2+1
 endg==
X-Gm-Message-State: AOAM531xjS8eksUs0HU23PB7Vk3DUXQ1rPW8A1BoM5CyY+T/GR/bfH7c
 R2YI2/b+oL4pczdTpTmSprGNWYo63ngdh2ZbIZXFoADrwAlms+8O
X-Google-Smtp-Source: ABdhPJyGknkhK2xBuL9UzZpXp6s0OTh2HtP4c4lwDo6dg7zRSTQJg1KNURZwmufYZn+n8X+wCnHbaHrtPnLB1no+RY8=
X-Received: by 2002:a25:d8e:0:b0:636:ef10:4144 with SMTP id
 136-20020a250d8e000000b00636ef104144mr4122415ybn.510.1648126578781; Thu, 24
 Mar 2022 05:56:18 -0700 (PDT)
MIME-Version: 1.0
From: sri d <srid.11486@gmail.com>
Date: Thu, 24 Mar 2022 18:26:07 +0530
Message-ID: <CALXuKJc_pYJv0xYWtN5mzbHwpbHshukg34BjSzhqmpTdUMXwXg@mail.gmail.com>
Subject: Multi-led configuration in dts
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000045f45d05daf65ffb"
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
Cc: spinler@us.ibm.com, andrew@aj.id.au, bradleyb@fuzziesquirrel.com,
 velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000045f45d05daf65ffb
Content-Type: text/plain; charset="UTF-8"

Hi Team,

I am working on implementing Power and system identification LEDs, in which
LEDs are connected to GPIO pins directly. I need to handle two colors (blue
& yellow) for LEDs in *.dts file.
In phosphor-led-sysfs repo, whether multi-led configuration is handled ?
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml

As far as I analyzed, multi-led seems to work for dedicated LED controllers
and not for GPIO pins directly. Is there a way we can make it work for
directly connected GPIOs ?
https://www.phoronix.com/scan.php?page=news_item&px=Linux-5.9-Multi-Color-LEDs

Thanks,
Jayashree

--00000000000045f45d05daf65ffb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"color:rgb(36,36,36);font-family:&quot;=
Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji=
&quot;,sans-serif;font-size:14px;font-variant-ligatures:normal;font-variant=
-caps:normal;letter-spacing:normal;text-align:start;text-indent:0px;text-tr=
ansform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial;display=
:inline;float:none">Hi Team,</span></div><div><span style=3D"color:rgb(36,3=
6,36);font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&qu=
ot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px;font-variant-ligat=
ures:normal;font-variant-caps:normal;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;display:inline;float:none"><br></span></div><div><span sty=
le=3D"color:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,system-ui,&quot;=
Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14p=
x;font-variant-ligatures:normal;font-variant-caps:normal;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial;display:inline;float:none"></span></di=
v><div><span style=3D"color:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,=
system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-ser=
if;font-size:14px;font-variant-ligatures:normal;font-variant-caps:normal;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial;display:inline;float:n=
one">I am working on implementing Power and system identification LEDs, in =
which LEDs are connected to GPIO pins directly. I need to handle two colors=
 (blue &amp; yellow) for LEDs in *.dts file.<br>In phosphor-led-sysfs repo,=
 whether multi-led configuration is handled ? <a href=3D"https://github.com=
/torvalds/linux/blob/master/Documentation/devicetree/bindings/leds/leds-cla=
ss-multicolor.yaml">https://github.com/torvalds/linux/blob/master/Documenta=
tion/devicetree/bindings/leds/leds-class-multicolor.yaml</a><br></span></di=
v><div><span style=3D"color:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,=
system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-ser=
if;font-size:14px;font-variant-ligatures:normal;font-variant-caps:normal;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial;display:inline;float:n=
one"><br></span></div><div><span style=3D"color:rgb(36,36,36);font-family:&=
quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI =
Emoji&quot;,sans-serif;font-size:14px;font-variant-ligatures:normal;font-va=
riant-caps:normal;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial;di=
splay:inline;float:none">As far as I analyzed, multi-led seems to work for =
dedicated LED controllers and not for GPIO pins directly. Is there a way we=
 can make it work for directly connected GPIOs ?<br><a href=3D"https://www.=
phoronix.com/scan.php?page=3Dnews_item&amp;px=3DLinux-5.9-Multi-Color-LEDs"=
>https://www.phoronix.com/scan.php?page=3Dnews_item&amp;px=3DLinux-5.9-Mult=
i-Color-LEDs</a></span></div><div><span style=3D"color:rgb(36,36,36);font-f=
amily:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Se=
goe UI Emoji&quot;,sans-serif;font-size:14px;font-variant-ligatures:normal;=
font-variant-caps:normal;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial;display:inline;float:none"><br></span></div><div><span style=3D"color:=
rgb(36,36,36);font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color =
Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px;font-varia=
nt-ligatures:normal;font-variant-caps:normal;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-=
decoration-color:initial;display:inline;float:none">Thanks,</span></div><di=
v><span style=3D"color:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,syste=
m-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;fo=
nt-size:14px;font-variant-ligatures:normal;font-variant-caps:normal;letter-=
spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial;display:inline;float:none">=
Jayashree<br></span></div></div>

--00000000000045f45d05daf65ffb--
