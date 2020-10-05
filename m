Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C03D82837AA
	for <lists+openbmc@lfdr.de>; Mon,  5 Oct 2020 16:26:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C4jZz2xPGzDqHP
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 01:26:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=ZyymK2yH; dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C4jYv5c4FzDqDq
 for <openbmc@lists.ozlabs.org>; Tue,  6 Oct 2020 01:25:38 +1100 (AEDT)
Received: by mail-yb1-xb30.google.com with SMTP id j76so6832169ybg.3
 for <openbmc@lists.ozlabs.org>; Mon, 05 Oct 2020 07:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9FhawziPrbxCGFuEruKn4rKB9DAsUvKuhmNrHkpEEXQ=;
 b=ZyymK2yHyoHP8ZsY/mR+f7W1rG6ZFFBTdqlq5wvqz2CsFds8ze6bLZTc7sX/pNyQwU
 X/gOqWdeMuoFJ0G33kAmpypo8LGVDif7WKPn8iIad/hf/qUuV/JGTCUPSnNQxh9aBV1e
 KpsJXCLng111S0BymY/YSZ2rhXoJ3Rm9jgC2x1WS92pKRVra7eBbbbgan22K22/+2mpA
 qxIpo4w0xc8DLxt/Y++D1CtM8RAnYVHVG05VxTptGCnMQRQYd8Lx/EbSR5/cBSQAW4B9
 ReIdfTYtScyTUgIzxNLLIlOEFw2Yu/i+2jeUPCQbbOpcvcmPq72vRay50LuIeUwgwDev
 mn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9FhawziPrbxCGFuEruKn4rKB9DAsUvKuhmNrHkpEEXQ=;
 b=UI98K9f8uYQ6Lo2X+af2XSVyYPSaP5UGkooTkVR+ENIx2a5k+/kSl2EuEQI/bPpbcu
 lOTfk4DX5rkOxc743z/8vodufwWnId6iR/7yt0sucBf/oZwpIFPchagwSAOjLOWoqAPy
 tGe21zNjsvH8o8SbhWsy5DupQ/tOeceehiNaJaLOe096Cmm8OJqm7sEImzBRaiMO3q1i
 VpsOmquYKofldbxcvgYNgrjmOP/L/Qv9p5FKDubnkPXAwKxh/J5wt4idoYwYN+T6vSbS
 uQtx1nNC1GGlHWOzJjNyl5NOWoJNODCmoQkkD4lVScrQ1BDM6zcz1XJMGscMjdkzHBqk
 I9kA==
X-Gm-Message-State: AOAM533v5WMxceGAANXaYxFYBXynd8ScsReS/RwXA7W1LE9D/3n9GaCq
 RTRLLbO/y69UVH1fpuOvM2m/qNUk67NlQTwhsqyAmQ==
X-Google-Smtp-Source: ABdhPJz/PCMEM/vFdsT8lAEYw5WnziNdHBmN+v0go3OSN8xlJ3P5DJVSYmgFqMbPYsajRsOv17TBP8gF5WGhzB18Hls=
X-Received: by 2002:a25:74d7:: with SMTP id p206mr276287ybc.170.1601907934596; 
 Mon, 05 Oct 2020 07:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <SG2PR04MB3093F4B562F454122B7F4596E10C0@SG2PR04MB3093.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB3093F4B562F454122B7F4596E10C0@SG2PR04MB3093.apcprd04.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 5 Oct 2020 07:25:23 -0700
Message-ID: <CACWQX83t7k5iVRAsL+7EcGr2QL3LgbM2N09iOiro747cMqDe1w@mail.gmail.com>
Subject: Re: Firmware version under IPMB sensors
To: Jayashree D <jayashree-d@hcl.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Oct 4, 2020 at 11:43 PM Jayashree D <jayashree-d@hcl.com> wrote:
>
> Classification: HCL Internal
>
> Hi Team,
>
>
>
> In my system, host is connected to IPMB and host related information is retrieved using IPMB bus.
> I plan to add firmware versions in the dbus-sensors. Adding this as another entity as like ipmbsensor.
> This will help in having all transaction in IPMB sensor.

Sounds reasonable.  Do you intend on using the get device id command
to determine the version number?  What piece of hardware are you
connecting to?
