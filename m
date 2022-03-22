Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E561F4E425D
	for <lists+openbmc@lfdr.de>; Tue, 22 Mar 2022 15:53:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNDyL5Sglz3dpS
	for <lists+openbmc@lfdr.de>; Wed, 23 Mar 2022 01:53:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LUsxTPqV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=logananth13.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LUsxTPqV; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNDkG6ZVHz3bgZ
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2022 01:43:18 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id
 mm17-20020a17090b359100b001c6da62a559so2988713pjb.3
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2022 07:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=jfF9NMILaJ2Nkq4CJz/T31XEn8Uxk+F+4L5XP/HMc5A=;
 b=LUsxTPqVrCMGPAWUR/AeJ4iFe/J0zb78B++7c5NUoAeSOI/K4se2/OYAgPHYJo+Yl9
 RkCtRNvb81Ibg4Dygyy3exaj2P5qUN2y8bJViNZJkUiefxvg+CbP/Ht/b1jicW+vdUG+
 gh2H3CkRyy/M4y5D02fCPx47IpMOIzWM468TZOWXWjvvuLTGtxzRU2NRkJ548Z1Uc5cU
 MRWzF37ncmfyABt36qM9rlwF6WmrEc72Nq8L5bOdgBDo5gMfFNS62zBdLaUXSNVQJMfE
 Z1ijg9TbHg8xCbMskhBpVi6Z217qfPguX/pDfbl3WlHkPBQmd7bzMWsdCDFohe+mDXqn
 oW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=jfF9NMILaJ2Nkq4CJz/T31XEn8Uxk+F+4L5XP/HMc5A=;
 b=H83fgK0h7k+5/SNM0zKoL9reee+r1FtpgMBRTvEAdfqrCth3Ay7KcEtPX2sHapaeJ4
 fggPR9Rj40I/Iy5hP8et/DnAwHUOyVuKT+Ksh15SqpGZVEg0uaz2b82Vzv3y2PbSrUrg
 bA6f2CyIcnrSPw65LZyP3Xrflh/6F7P1f+UpqzFhGahgg8xZfsKSvVzMzWYLNaDxezIc
 WvrUzPuYFmzCy993EwkAAkyzWcdlFoq4q/rAbfZWWMfOOZmDdFEyXhNaAyj/feN+ljeX
 ZWUKWR/yuleJU+zVHw16Zv01xO6bDi144XqdTFk/bMyPTwfgf3ICdNZv6UTf/BA6Msxo
 aIxA==
X-Gm-Message-State: AOAM531syeXnQ5SLZ3DUrnSlOuwP96qJluL9dlsAnoquF5am3C8TjWMD
 q1pKbr6aSNolOAqmi19KSgXHYjWn8Bn7ZcqI0m6pupwZIzc=
X-Google-Smtp-Source: ABdhPJyIu8R8gM8VD9mIiuZ4Soer+F5U8/CT4hNHvNqOsA9L3YFmlrojb4ctaR1v7phWK4me5cawLnw5HppWf0rmOPA=
X-Received: by 2002:a17:90b:1642:b0:1c7:2497:3807 with SMTP id
 il2-20020a17090b164200b001c724973807mr5405248pjb.176.1647960195738; Tue, 22
 Mar 2022 07:43:15 -0700 (PDT)
MIME-Version: 1.0
From: logananth hcl <logananth13.hcl@gmail.com>
Date: Tue, 22 Mar 2022 20:13:04 +0530
Message-ID: <CAGpPFEHeN0NL3EJ238BbGLNpaayRo4SGcfWdRTdNiEgpq2a0Ng@mail.gmail.com>
Subject: Applying patches to U-boot 2019.04
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000012320805dacfa245"
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
Cc: velumanit@hcl.com, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000012320805dacfa245
Content-Type: text/plain; charset="UTF-8"

Hai all,
I'm trying to port the u-boot to the 2019.04-aspeed-openbmc,
Here trying to apply *.patch file and also applying the defconfig for the
u-boot from the specific meta-layer.

In this case, the defconfig file changes have been applied clearly to
u-boot in tmp, but those patch files are copying to the machine tmp folder
but not applied to the code!

Is there any restriction for applying patches to the 2019.04-aspeed openbmc
?
If not, is there any other suggestion for applying patches.

--00000000000012320805dacfa245
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hai all,<div>I&#39;m trying to port the u-boot to the 2019=
.04-aspeed-openbmc,<br>Here trying to apply *.patch file and also applying =
the defconfig for the u-boot from the specific meta-layer.</div><div><br>In=
 this case, the defconfig file changes have been applied clearly to u-boot =
in tmp, but those patch files are copying to the machine tmp folder but not=
 applied to the code!</div><div><br>Is there any restriction for applying p=
atches to the 2019.04-aspeed openbmc ?</div><div>If not, is there any other=
 suggestion for applying patches.=C2=A0<br></div></div>

--00000000000012320805dacfa245--
