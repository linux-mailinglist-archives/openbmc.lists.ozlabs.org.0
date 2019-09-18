Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C98B679D
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 18:00:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YPpJ0bQnzF4kB
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 02:00:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="E2lEj+oH"; 
 dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YPnV5yWMzF4fm
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 01:59:57 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id u12so134596pls.12
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 08:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BeSr5s465PJHyDiz2DUorAwfuxZMJVjwJ4wWgwH7Iic=;
 b=E2lEj+oHvursBBV+Q2+4dvJZywRmRQzX174gr0pXMXZMkq18IfzQM4e5yZ+Js6R9lb
 9lkUpZxmYhT4lLpQX26w+kBzvg4wbkDUjVr/7/rZhpOBKN4czruDrExTvObeH/DZELY5
 oUaN9uAXP4GRx6WXOM4CeTx5pmWhLdCo0w4ah16aq8QCTjwLuUkk5S7wbp1i3qh88p1H
 HNKAF24DdOdhId5ZFzwFsGJLYSDBgL5crZdklA2d9N0jWsHL9RrLl+Da9fQ7luMuqBlb
 zJJ9D8D0LR2Zh2I13SxcYt3b/dvehkZ1v3UFbEv++3JX64jxtgsJ1brtiRkiwJgx/bmF
 FTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BeSr5s465PJHyDiz2DUorAwfuxZMJVjwJ4wWgwH7Iic=;
 b=lPFmn2hIfAVU5l2LXR+C+tR0Au7pBd48t+FRh9GUf/aOmZBx2C7t+VSjhfDPxLz+oa
 oidDukQUmu6t1nyhmegDitGB5X9k3B/EKovRtDmwPJvJcXoGfsd7SFNskJwxj9s1Dae+
 WdS2DIxigK6WGagNnCpFKBSz1sjaRX/jA4zNoHZ5RSJ05wtgX1EBh722YQy89vI+8lNM
 IRQg/HyvaqEtlxAmg8BXWmjKtN5UqltaplCqwmXJ+pEMd5fiOHXPfM/FseiCGrapMUe+
 m78b7Nxp1cCBv6+58j3Cfg3nwltl81I2rqs0CjP6q2NZF5RrD5S6v9HzxvW2kPQt6MLX
 5/sg==
X-Gm-Message-State: APjAAAXzWp1ZGcZZak+tCgwCtFqQ9wGfKX86FvKFR2nguwZY79z+DiUz
 YgnVdXwmOReMuAPpfurAm1CKrt1G/a5x7qDG5ZDRjA==
X-Google-Smtp-Source: APXvYqzkmJruK1COpggfcd0yc12w6VygOIjvAHZ9lCC2sTuaUfw/cSn4UXP0gZkNkrOHKPGcG2lX4VCreD3jdjVB94c=
X-Received: by 2002:a17:902:760a:: with SMTP id
 k10mr4779192pll.183.1568822393620; 
 Wed, 18 Sep 2019 08:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR03MB5123D25A4F88B901BFB853DFDF8E0@HK0PR03MB5123.apcprd03.prod.outlook.com>
In-Reply-To: <HK0PR03MB5123D25A4F88B901BFB853DFDF8E0@HK0PR03MB5123.apcprd03.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 18 Sep 2019 08:59:42 -0700
Message-ID: <CAO=notwyv46-oo8McimPcr1tq+TchK0A9Jc-LxyHPnU=WGcYjQ@mail.gmail.com>
Subject: Re: code review about phosphor-ipmi-flash
To: CS20 CTCchien <CTCCHIEN@nuvoton.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 18, 2019 at 1:13 AM CS20 CTCchien <CTCCHIEN@nuvoton.com> wrote:
>
> Hello Patrick,
>
>
>
> You have a comment in this link about recipes-phosphor/flash/phosphor-sof=
tware-manager_%.bbappend
>
> https://gerrit.openbmc-project.xyz/c/openbmc/meta-nuvoton/+/25220/2/recip=
es-phosphor/flash/phosphor-software-manager_%2525.bbappend#1
>
>
>
> do you mean I should use "verify-signature-nuvoton" instead of "verify-si=
gnature" ?

No, I'm saying your bbappend file is overriding the PACKAGECONFIG with
a weak default that'll be applied to any machine in a multi-machine
environment that parses that bbappend file.  Your other bbappend does
the same thing.  We use machine or other overrides to safely allow
modifying only select systems.

https://github.com/openbmc/meta-nuvoton/blob/master/conf/machine/include/nu=
voton.inc#L6

This is an example of the override.  In this case, if a MACHINE
includes that file, they'll have that override available to them, and
so recipes with

PACKAGECONFIG_nuvoton ... will be picked up, but only for them.

Similarly, all the items in this file:
https://gerrit.openbmc-project.xyz/c/openbmc/meta-nuvoton/+/25220/2/recipes=
-phosphor/ipmi/phosphor-ipmi-flash_%2525.bbappend

Can be locked by a machine override.

However, from the discussion with Brad, you're going to want to take
the values you're defining, "0xc0008000, 0xF0848000" ... and add them
to the core recipe itself with useful names. Right above this:
https://github.com/openbmc/meta-phosphor/blob/master/recipes-phosphor/ipmi/=
phosphor-ipmi-flash_git.bb#L38

Then if someone wants to enable a specific nuvoton feature, they
assign IPMI_FLASH_BMC_ADDRESS_theirmachine =3D NUVOTON_FLASH_PCIVGA ...
or whatever in their bbappend.

>
> Thanks
>
>
>
>
>
> B.R.
>
> Medad
>
> ________________________________
> The privileged confidential information contained in this email is intend=
ed for use only by the addressees as indicated by the original sender of th=
is email. If you are not the addressee indicated in this email or are not r=
esponsible for delivery of the email to such a person, please kindly reply =
to the sender indicating this fact and delete all copies of it from your co=
mputer and network server immediately. Your cooperation is highly appreciat=
ed. It is advised that any unauthorized use of confidential information of =
Nuvoton is strictly prohibited; and any information in this email irrelevan=
t to the official business of Nuvoton shall be deemed as neither given nor =
endorsed by Nuvoton.
