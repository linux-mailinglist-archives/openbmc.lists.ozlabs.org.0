Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 895E2ADE04
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 19:28:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Rw9z19S4zDqQB
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 03:28:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="vaNLG7Ol"; 
 dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Rw8d1zL4zDqR1
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 03:27:29 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d3so6856480plr.1
 for <openbmc@lists.ozlabs.org>; Mon, 09 Sep 2019 10:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LKcTgJzQnklshv3e84k2fYU47pTP9wU2zEq5qRM9vs4=;
 b=vaNLG7OlB+ZOlUcGirGvgs4rAXoKysyBQ/JvFUCh3dUit7EyDyObbMdEQqy4ztUDvp
 RTfvcvLroPlyCzQ29frRkp/q7dYL+RgwI54IgUzIP6dMCK/x5ysCwG51yEA9m7Df05pz
 xwbH/WnwPZWymp4YTjy9m7PU6thaYjwpq2w/qUsmp5htRUxC0NWdzCEHF2k+GI7KFyOq
 yh/T6VaAPuWocAJ+FRqGd5lIuPPxhWHAAH9y5AWRiOHffKiLHrMTO1hPyaXOWUA8jjfK
 ZaQLMRbFxw/5OXotIigBhiNQ0CFoJSwd0rTc4gyagbvY+MCDV5R3t9iNvH6SECR2LJ80
 Lfng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LKcTgJzQnklshv3e84k2fYU47pTP9wU2zEq5qRM9vs4=;
 b=Uy8VSki+5XyNTBV8IeTGDevL/qCz32HU9YOrZ5FlkWSDnOIHuAr471VaOesE/FwAr9
 fny/WpP47jSjY1QXJw5J/pMFWUgTxG3EdTb0ZtzZJ4m4ELFck08pumxJm6ay5koLfHm2
 L0V3JP5ERqOHUzqsolBvVABVa9S0fI+st5Gyb+4pOXJZh5BM3eQ9wwFXeDng3lbaF1LX
 8Yf8yt+MoUY9qK/nTiCpUcEeDfDjypOXk/MhsKrYCah3AoCXrS6iFUMnprotIgvI8+mB
 PGh0STTLZ66uKRPdd4Blr3Lk/g9j4S7ZoaIVrSA54EuqavAP4Z0C+1Ffow6rzQBrXFIf
 yvyA==
X-Gm-Message-State: APjAAAXN/AobKGvvJCCz2Qoy1/BjlnF7JM2kPCi4NX+sQq9GI8xMQLXn
 IGeBkdk775gN9CTUFLelWleHyyDIVR3VBzydO5BUww==
X-Google-Smtp-Source: APXvYqxTxlt9/80SpE1BnpQcVkBcEUtlotrZpZON5ORbyze/QmnYbVoieESQz/Miwdzr/vYiesn1q51aAoUY2Zpdl0U=
X-Received: by 2002:a17:902:848c:: with SMTP id
 c12mr25298857plo.47.1568050045489; 
 Mon, 09 Sep 2019 10:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR03MB4068E6EB742A7088B92362A7AEA40@HK0PR03MB4068.apcprd03.prod.outlook.com>
 <CAO=notyaNX1JO2S6AdJd39oP-JqKef62G5w=2h2j-AXCrz1-WQ@mail.gmail.com>
 <HK0PR03MB5123707BA82D7033A19F36EADFBE0@HK0PR03MB5123.apcprd03.prod.outlook.com>
In-Reply-To: <HK0PR03MB5123707BA82D7033A19F36EADFBE0@HK0PR03MB5123.apcprd03.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 9 Sep 2019 10:27:14 -0700
Message-ID: <CAO=notwu0jC6+UMeadRtuHtT2Ywbu1iW0jMgtoJwnQUjak_Eag@mail.gmail.com>
Subject: Re: phosphor-ipmi-flash: A problem in BMC FW update over LPC
To: CS20 CTCchien <CTCCHIEN@nuvoton.com>
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
Cc: CS20 KWLiu <KWLIU@nuvoton.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Sep 1, 2019 at 8:02 PM CS20 CTCchien <CTCCHIEN@nuvoton.com> wrote:
>
> Hi Patrick,
>
> I use latest phosphor-ipmi-flash, and I met an error about /flash/image i=
n bmc/config-static-bmc-reboot.json.in,
> I change it to /flash/static, then the issue disappeared.
> Did I miss something?

The name of the thing in the json file is the type to use now with the
"--type" parameter, not the whole name, just the ending.  So
/flash/static becomes --type static, and /flash/image becomes --type
image

It was a change related to needing to support arbitrary update targets.
>
> Thanks
>
> B.R.
> Medad
>
>
> -----Original Message-----
> From: Patrick Venture <venture@google.com>
> Sent: Friday, August 23, 2019 10:43 PM
> To: CS20 KWLiu <KWLIU@nuvoton.com>; Benjamin Fair <benjaminfair@google.co=
m>
> Cc: CS20 CTCchien <CTCCHIEN@nuvoton.com>; Corey Chen (=E9=99=B3=E5=BF=97=
=E9=8A=98) <Corey.Chen@quantatw.com>; Fran Hsu (=E5=BE=90=E8=AA=8C=E8=AC=99=
) <Fran.Hsu@quantatw.com>; Samuel Jiang (=E6=B1=9F=E9=A8=8F=E5=85=88) <Samu=
el.Jiang@quantatw.com>; George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC) <George.H=
ung@quantatw.com>; openbmc@lists.ozlabs.org
> Subject: Re: phosphor-ipmi-flash: A problem in BMC FW update over LPC
>
> On Fri, Aug 23, 2019 at 4:13 AM CS20 KWLiu <KWLIU@nuvoton.com> wrote:
> >
> > Hello Patrick:
> >
> >
> >
> > We are currently trying to enable the BMC FW update over LPC on our pla=
tform (nuvoton BMC), but we encounter a problem with BIOS.
> > The BIOS engineer has reserved memory region as mmio space, but we coul=
dn't see any data change in this region during run burn_my_bmc.
> > We have checked the BMC setting(in lpc_nuvoton.c and LDN SHM) but we co=
uldn't identify the root cause of this problem.
>
> +Benjamin Fair
>
> I don't know the Nuvoton BMC that well, but I do know that I tested it on=
 a system we have that uses it.  I'm adding Benjamin as he's more familiar =
with any nuances associated with Nuvoton's BMC.
>
> >
> >
> >
> > Is there any settings we lost?
> >
> >
> >
> > Thanks,
> >
> > Joseph
> >
> > ________________________________
> > The privileged confidential information contained in this email is inte=
nded for use only by the addressees as indicated by the original sender of =
this email. If you are not the addressee indicated in this email or are not=
 responsible for delivery of the email to such a person, please kindly repl=
y to the sender indicating this fact and delete all copies of it from your =
computer and network server immediately. Your cooperation is highly appreci=
ated. It is advised that any unauthorized use of confidential information o=
f Nuvoton is strictly prohibited; and any information in this email irrelev=
ant to the official business of Nuvoton shall be deemed as neither given no=
r endorsed by Nuvoton.
> ________________________________
> ________________________________
>  The privileged confidential information contained in this email is inten=
ded for use only by the addressees as indicated by the original sender of t=
his email. If you are not the addressee indicated in this email or are not =
responsible for delivery of the email to such a person, please kindly reply=
 to the sender indicating this fact and delete all copies of it from your c=
omputer and network server immediately. Your cooperation is highly apprecia=
ted. It is advised that any unauthorized use of confidential information of=
 Nuvoton is strictly prohibited; and any information in this email irreleva=
nt to the official business of Nuvoton shall be deemed as neither given nor=
 endorsed by Nuvoton.
