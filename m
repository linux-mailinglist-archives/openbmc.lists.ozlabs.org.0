Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3D129C58B
	for <lists+openbmc@lfdr.de>; Tue, 27 Oct 2020 19:22:05 +0100 (CET)
Received: from bilbo.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLKmV2lMczDqQ5
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 05:22:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::62f;
 helo=mail-ej1-x62f.google.com; envelope-from=pparth@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=hChQc3M/; dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLKlB5f7TzDqNp
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 05:20:52 +1100 (AEDT)
Received: by mail-ej1-x62f.google.com with SMTP id gs25so3634681ejb.1
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2020 11:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Fdv6J7SAlNNiK8WD66QV9NZbdhdklMUrP8sSo25+cL0=;
 b=hChQc3M//fZ4jG99gY3M+rwPOkZZXSIXpByxasLoDXb5mR4V2oKEE9E6F4dKlMJSSB
 pkajhUX3cbUrBhNn3xKKlMBzCJsAieEmkVJJvm+XQprIEj8ejbzess2JX++HWoSpHbsW
 Ak9gihljR7Yx4VQRt6W3+ycJZvYiFMWAybVqcUC/50JSkAksIwIiZfYoiHsyVyZtZytk
 ro/l2IRShNLvghD6OJy2Q+0l6P8rdXTu7Z8reH+Ssfv0G0FsqUPUI0keHCUmgaaid+1g
 SRTH4hyeWrAnFW3Evnn72AtnLrvh8NHZUHGVG3olV7oJDnteGu/vARcdqAdRanlcPGp1
 bAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Fdv6J7SAlNNiK8WD66QV9NZbdhdklMUrP8sSo25+cL0=;
 b=F5qs+YtmnLBojCXQggAltD7VkgiVO6IkJahDxiaxlptNBJyMle+5xqQSAeNcQGTHER
 dcoOUooPSHCIdD3sjVWNH2mO04n9DKz5SpgDEn0ux9YfJFnpbjNX+sfCdE8yo4coi+WP
 xkM3ItmIWS4mhYiQGdZT3GdmBR5kOr32IChi1zypyDP8pWiCsDVh8yY7rlnRgidX6C+z
 tpo+Ocs58vBNG7PhyG6wQghbBuyT9fbMcMB4gisAJVivotVfF9Swo5Zs1hXC1GznbKqd
 SbWSAfFApxu13mbQQD7coldiA/zWbgYiqEjBs5TaNd131que5284NOKVFPa2Vjf6mxon
 hz4Q==
X-Gm-Message-State: AOAM533Dw1dTWos2TD2hUI82HAVQd2hwcxsfZvi0Ah4iAFFBkYH/tGXJ
 yIl6ic8n6jZ9kQkypyYI7os7isAoNWHDkT1k914WVmLwSkebHmxS
X-Google-Smtp-Source: ABdhPJwxxalFpI3SFHuCFS5k2ibQAoPGHRG/B7p8ChDUi/hssaIrewmDOs2k/HjwAYWvCEWrSJNq+vd6RQd9fcyy1NA=
X-Received: by 2002:a17:906:60d3:: with SMTP id
 f19mr3807166ejk.141.1603822846935; 
 Tue, 27 Oct 2020 11:20:46 -0700 (PDT)
MIME-Version: 1.0
From: Parth Shukla <timevortex@google.com>
Date: Tue, 27 Oct 2020 19:20:10 +0100
Message-ID: <CAC1Cx+uC+0wX-xp=FB2D80A4HujZ=ZKKHQhGcSePbyofeo6T2A@mail.gmail.com>
Subject: Security Working Group Meeting - Wed 28 October
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000139cd705b2ab1b55"
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

--000000000000139cd705b2ab1b55
Content-Type: text/plain; charset="UTF-8"

This is a reminder of the OpenBMC Security Working Group meeting scheduled
for this Wednesday October 28 at 10:00am PDT.

We'll discuss the following items on the agenda
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>,
and anything else that comes up:

   1. Gerrit review BMCWeb - DoS - maximum number of  persistent sessions
   https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/37501
   2. (Joseph) OpenBMC list of security topics - email
   https://lists.ozlabs.org/pipermail/openbmc/2020-October/023606.html .
   The main idea is to reorganize the security wiki around this list.
   3. (Joseph) BMC Configuration wiki -
   https://github.com/openbmc/openbmc/wiki/Configuration-guide (Guide for
   BMC system integrators and BMC admins).  What is the best way to proceed?
   Get this into docs repo?
   4. Security implementation of Linux kernel livepatching.
   https://lists.ozlabs.org/pipermail/openbmc/2020-October/023723.html

Access, agenda and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group

Regards,
Parth

--000000000000139cd705b2ab1b55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto">This is a reminder of the OpenBMC Securi=
ty Working Group meeting scheduled for this Wednesday October 28 at 10:00am=
 PDT.<br><br>We&#39;ll discuss the following items on the=C2=A0<a href=3D"h=
ttps://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWm=
AOI/edit" target=3D"_blank">agenda</a>, and anything else that comes up:<br=
></div><div><ol><li>Gerrit review BMCWeb - DoS - maximum number of =C2=A0pe=
rsistent sessions <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/b=
mcweb/+/37501">https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/37501<=
/a>=C2=A0</li><li>(Joseph) OpenBMC list of security topics - email <a href=
=3D"https://lists.ozlabs.org/pipermail/openbmc/2020-October/023606.html">ht=
tps://lists.ozlabs.org/pipermail/openbmc/2020-October/023606.html</a> .=C2=
=A0 The main idea is to reorganize the security wiki around this list.</li>=
<li>(Joseph) BMC Configuration wiki - <a href=3D"https://github.com/openbmc=
/openbmc/wiki/Configuration-guide">https://github.com/openbmc/openbmc/wiki/=
Configuration-guide</a> (Guide for BMC system integrators and BMC admins).=
=C2=A0 What is the best way to proceed?=C2=A0 Get this into docs repo?</li>=
<li>Security implementation of Linux kernel livepatching. =C2=A0<a href=3D"=
https://lists.ozlabs.org/pipermail/openbmc/2020-October/023723.html">https:=
//lists.ozlabs.org/pipermail/openbmc/2020-October/023723.html</a>=C2=A0</li=
></ol></div><div dir=3D"auto"><font face=3D"sans-serif"><span style=3D"font=
-size:12.8px">Access, agenda and notes are in the wiki:</span></font></div>=
<div dir=3D"auto"><font face=3D"sans-serif"><span style=3D"font-size:12.8px=
"><a href=3D"https://github.com/openbmc/openbmc/wiki/Security-working-group=
" target=3D"_blank">https://github.com/openbmc/openbmc/wiki/Security-workin=
g-group</a></span></font></div><div dir=3D"auto"><font face=3D"sans-serif">=
<span style=3D"font-size:12.8px"><br></span></font></div><div dir=3D"auto">=
<font face=3D"sans-serif"><span style=3D"font-size:12.8px">Regards,</span><=
/font></div><div dir=3D"auto"><font face=3D"sans-serif"><span style=3D"font=
-size:12.8px">Parth</span></font></div></div>

--000000000000139cd705b2ab1b55--
