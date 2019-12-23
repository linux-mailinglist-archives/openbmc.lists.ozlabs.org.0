Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B7812911C
	for <lists+openbmc@lfdr.de>; Mon, 23 Dec 2019 04:14:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47h4Ff2sd0zDqRy
	for <lists+openbmc@lfdr.de>; Mon, 23 Dec 2019 14:14:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::135;
 helo=mail-il1-x135.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vfvesNSS"; 
 dkim-atps=neutral
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47h4Dz6JN6zDqF5
 for <openbmc@lists.ozlabs.org>; Mon, 23 Dec 2019 14:13:39 +1100 (AEDT)
Received: by mail-il1-x135.google.com with SMTP id s15so12940913iln.1
 for <openbmc@lists.ozlabs.org>; Sun, 22 Dec 2019 19:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mSv3DYv+gtF368sXEx/EHoG9aqMXULOhqpeKdFULVrw=;
 b=vfvesNSS3oDVzVeKr81PVR3wzoAvpHHBOrejWUAbH1+iGubAqypzDSZxPagRpmiL44
 x4XmgUJfw4HwNQ3WZrq9SNV5PkdzMe1czVfvXwiAmxz42BaixoRd7/ure9kHUabcskeS
 t+kNUplIkWghvFQVv2sBQULbFpExn3Xp6Ppf3DdOv+mn/HTpOAZN8faRJHrIikW/4Tk/
 LPIzlSaqxhcxiwZq4+mv1ocaKzg0+UC5AV2jIK6/GFj5VMU60soWE63txfVzdrsiDe/s
 5uWPZUpzLLYE8Zb2llBurkr7wi/mkdOjrUg7K+s3A/P28zEFbhzIlkGMy1NEY9VG+p4r
 yX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mSv3DYv+gtF368sXEx/EHoG9aqMXULOhqpeKdFULVrw=;
 b=O+yso/0UwOljcAL6rGQN1xeKlnR3Rg+7tcltKITzHGVS4xlu/k9Z2HegD/7qaK2NpN
 btcVAncKstzi7HtsZ0HR2Qn/Wt42SFxV7ro0D6erLGl0MtgT8OjtgBSVKygP5E4DEyJl
 Q/vanwTssexI+Mk64ehsHRWBRcosRD6iI/Rx8I8771DYPhEijcmNDVYwctk53W2Yuvh3
 sZe7zVt+MN9xxLN3WLnQCW7KvIRWXrqhgXT00EiH3vRVWa1JjCIiP7rXc6TtTB+C5yB5
 Z7uXC41w0Rit8oh7qO9WeEaJS8zoAZTNWPDg9s2QPm4s2DBVg8oALR2bG28X9arbroQ0
 5oTw==
X-Gm-Message-State: APjAAAXhYjpJJZUHPi9UnPc/EIOrZpThJ4iQzJvDsC8wqnSTtpPjvpYH
 yQXFERLlYedP86dGnYs1g6mQ2eOc60L1SyYQ2Hw=
X-Google-Smtp-Source: APXvYqygpxsZXEGoK0upoAg/EztD4jzHebijOXrKeXSbKjc/y+YweMejv1mtwz+lpAFAK4sHwfcrqoTtTMs1SsRSXEo=
X-Received: by 2002:a92:8108:: with SMTP id e8mr25320972ild.138.1577070816409; 
 Sun, 22 Dec 2019 19:13:36 -0800 (PST)
MIME-Version: 1.0
References: <2153c03a-fd09-fb67-7051-5e889e5d2f8b@linux.intel.com>
 <CAARXrt=wL7ZT=tGzP-DQTgEwiSZOfdQ4n1kvE5oa6HhyPV3UfQ@mail.gmail.com>
 <33a034df-8e29-681e-f83d-aa496f558d4f@linux.intel.com>
 <CAARXrtnL8-zpiL73E5E=q9=WcX_BDa31ZbcThBTNyMr1UF1HpQ@mail.gmail.com>
 <B8C11063-6338-4AC3-892C-701EF7ED077E@fuzziesquirrel.com>
In-Reply-To: <B8C11063-6338-4AC3-892C-701EF7ED077E@fuzziesquirrel.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 23 Dec 2019 11:13:26 +0800
Message-ID: <CAARXrt=w5P6=LzWMN2fVWyJQ0U6ibyzP=YziC5RUGiyudMfzgg@mail.gmail.com>
Subject: Re: Power Supply Cold Redundancy
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>, "Yang,
 Cheng C" <cheng.c.yang@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Dec 20, 2019 at 9:12 PM Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
>
>
> > On Dec 19, 2019, at 10:15 PM, Lei YU <mine260309@gmail.com> wrote:
> >
> > On Fri, Dec 20, 2019 at 10:31 AM Yang, Cheng C
> > <cheng.c.yang@linux.intel.com> wrote:
> >>
> >> Originally, I also thought I may push my code to phosphor-power, but
> >> when I was trying to devtool modify phosphor-power, I found a error ha=
ppen
> >>
> >> ERROR: Nothing PROVIDES 'openpower-dbus-interfaces' (but
> >> /home/cyang29/openbmc-openbmc/meta-phosphor/recipes-phosphor/power/pho=
sphor-power_git.bb
> >> DEPENDS on or otherwise requires it).
> >>
> >> We do not use openpower-dbus-interfaces.
> >
> > Right, that is a problem, and the good news is that Matt is already mov=
ing
> > openpower-dbus-interfaces into phosphor-dbus-interfaces
> > (https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/=
+/27380),
> > so it will be no problem in future :)
>
> This ^ does help but I don=E2=80=99t think its the whole story.  It sound=
s like phosphor-power needs a meson option to turn off its dependency on or=
g.openpower dbus interfaces=E2=80=A6regardless of what repository is provid=
ing those.
>
> Going a step further - what are the org.openpower interfaces that phospho=
r-power depends on anyway?  Can they just be moved to xyz.openbmc_project?

There is nothing special but an interface defined in org.open_power.
When Matt's commit of moving openpower-dbus-interfaces into
phosphor-dbus-interfaces is merged, the related code in phosphor-power
could be simply moved to xyz.openbmc_project.
