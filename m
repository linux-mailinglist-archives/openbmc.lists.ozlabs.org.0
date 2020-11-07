Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D94062AA50D
	for <lists+openbmc@lfdr.de>; Sat,  7 Nov 2020 13:40:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSxfn4wkkzDqbF
	for <lists+openbmc@lfdr.de>; Sat,  7 Nov 2020 23:40:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f36;
 helo=mail-qv1-xf36.google.com; envelope-from=tbnguyen1985@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BIFDhEFJ; dkim-atps=neutral
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSxdh2mzczDq5b
 for <openbmc@lists.ozlabs.org>; Sat,  7 Nov 2020 23:38:59 +1100 (AEDT)
Received: by mail-qv1-xf36.google.com with SMTP id y11so1365618qvu.10
 for <openbmc@lists.ozlabs.org>; Sat, 07 Nov 2020 04:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=mPzxjaPXb+9m0rNZZRA5mlS3nkxQ96IGX3QSfQfKqcw=;
 b=BIFDhEFJyolH7IyJ6mCRqmE2B8JMTV+P5bXWP9Qa0EeJy7Hx6x+58UUIPfgeiMP+Gp
 torrY8epE1c6g5FOTvPxA0zZ6cgShkXoidHRZUyLRgI4JMZmhRS/G/Vuq8+HNVg+aXTt
 G4GDMV2pWtP7TG83BilCxsWZOALHot8XPc25XTr75YbJunyNe5FF0PVROUqmW/L+uhpT
 j1XHL5VkTDGRFbA2+RjqsXK/pZU/5sYs9cc29C28gCX2QHDsZqWspAwPMC9WFTBZAn+A
 bAD3CLvvJh3zutXkkgMfNY4tmtF1pP3lqHDa5P/rHaMPJ067B7onJSfWHhZ2DMAC+yCI
 luSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mPzxjaPXb+9m0rNZZRA5mlS3nkxQ96IGX3QSfQfKqcw=;
 b=gIQ0Dn74TQN5EF4T0Go0GdE4LK+a3E/UIt9yA+RHXmZJ1j12tmJYVvEMmhGnT+FyuE
 OqIjxGOrUdy1Bxh1DrG+iDfZRD3EgA3fGqkiocahn+gZ1ati+DZjx8QYLPA7tnWKZ8uw
 C7k4FmCqoD1fqPsWDggplAW+GjS2zUA+m2HTkn3aC5gw7fBZ+94HnNveUs39iRJNChVy
 F9FkSuuHepFGpB48XT30rCM6U7v27UbyFDkXXmgsnTYruTJds5tZzRgr9tf9L+DjFgvp
 FNOF/VnHPZeW7lSj+LL/U0JHx3OqW2H6f/NiRUBYaVK1NiGdpxR5p70AltpllGFck5Od
 QX4g==
X-Gm-Message-State: AOAM532O1vkzkiCDr6jXnOGled3b6NA452IORbyZltwLWsdLuDoc5vVI
 7x75BpF/bdxb/ZWWaMnjr8k2MkXKY4K4Fo+l4yq6zIWp7Z0=
X-Google-Smtp-Source: ABdhPJydAq2HFv8fAdmBdXtya+dh20uBPyKMobIg9kAsZn9QXOYk9zfIzXGcRqPRemZ2oKYLcXNZjrOMvILMVCAGJvE=
X-Received: by 2002:ad4:4e84:: with SMTP id dy4mr6104332qvb.47.1604752735410; 
 Sat, 07 Nov 2020 04:38:55 -0800 (PST)
MIME-Version: 1.0
From: Thu Ba Nguyen <tbnguyen1985@gmail.com>
Date: Sat, 7 Nov 2020 19:38:44 +0700
Message-ID: <CALioo35rFrsCcK+j8GW8DCAHqw_y_r8e9cMg-SmNLQ5ydMajNg@mail.gmail.com>
Subject: phosphor-logging: entry() failed parse message.
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000bf1d0805b3839c9d"
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

--000000000000bf1d0805b3839c9d
Content-Type: text/plain; charset="UTF-8"

Hi,

In openBmc, We are using phosphor-logging.
When I log:
log<level::INFO>(
"watchdog: Timed out",
entry("ACTION=%s", convertForMessage(action).c_str()),
entry("TIMER_USE=%s", convertForMessage(expiredTimerUse()).c_str()),
entry("TARGET=%s", target->second.c_str()));
The message in entry() is losted.
Do I need to add any option when building?

Thanks.
Thu Nguyen.

--000000000000bf1d0805b3839c9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<div><br></div><div>In openBmc, We are=
 using phosphor-logging.</div><div>When I log:</div><div><div style=3D"colo=
r:rgb(212,212,212);background-color:rgb(30,30,30);font-family:Menlo,Monaco,=
&quot;Courier New&quot;,monospace;font-size:18px;line-height:27px;white-spa=
ce:pre"><div><span style=3D"color:rgb(220,220,170)">log</span>&lt;<span sty=
le=3D"color:rgb(78,201,176)">level</span>::<span style=3D"color:rgb(78,201,=
176)">INFO</span>&gt;(</div><div>            <span style=3D"color:rgb(206,1=
45,120)">&quot;watchdog: Timed out&quot;</span>,</div><div>            <spa=
n style=3D"color:rgb(220,220,170)">entry</span>(<span style=3D"color:rgb(20=
6,145,120)">&quot;ACTION=3D%s&quot;</span>, <span style=3D"color:rgb(220,22=
0,170)">convertForMessage</span>(<span style=3D"color:rgb(156,220,254)">act=
ion</span>).<span style=3D"color:rgb(220,220,170)">c_str</span>()),</div><d=
iv>            <span style=3D"color:rgb(220,220,170)">entry</span>(<span st=
yle=3D"color:rgb(206,145,120)">&quot;TIMER_USE=3D%s&quot;</span>, <span sty=
le=3D"color:rgb(220,220,170)">convertForMessage</span>(<span style=3D"color=
:rgb(220,220,170)">expiredTimerUse</span>()).<span style=3D"color:rgb(220,2=
20,170)">c_str</span>()),</div><div>            <span style=3D"color:rgb(22=
0,220,170)">entry</span>(<span style=3D"color:rgb(206,145,120)">&quot;TARGE=
T=3D%s&quot;</span>, <span style=3D"color:rgb(156,220,254)">target</span>-&=
gt;<span style=3D"color:rgb(156,220,254)">second</span>.<span style=3D"colo=
r:rgb(220,220,170)">c_str</span>()));</div></div></div><div>The message in =
entry() is losted.</div><div>Do I need to add any option when building?</di=
v><div><br></div><div>Thanks.</div><div>Thu Nguyen.</div></div></div>

--000000000000bf1d0805b3839c9d--
