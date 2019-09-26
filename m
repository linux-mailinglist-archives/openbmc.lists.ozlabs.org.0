Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 857E0BF520
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 16:34:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fHW64DFjzDqs2
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2019 00:34:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="EvFgkye5"; 
 dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fHTv3CDnzDqmT
 for <openbmc@lists.ozlabs.org>; Fri, 27 Sep 2019 00:33:22 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id h195so1961314pfe.5
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 07:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tgMrqSknzbjfnQKYqI6CjdbkVLc5brS2XmNdwBs/BGY=;
 b=EvFgkye5BBxxzmJA8iaZeO/d2fJ2U5rEnMfF3wAGje/N5Cfdf8kq9Y6CwEyHTL6WyI
 qlXa4BbX7qtZJjJFXTcOsxqIPvI8hu/2j7ANaRg8n5Qf/la7s7FEZ9OW0DtCvenmYEl3
 SxakUJOREf4ERoMTWW9zMTQHdSe3Vws2Q7z7OUdIcfHxm4jo2wo169yQaw2jHrj7z3nR
 2/UEhCS1Ag1C3V+DwLEcap76LNg7dYa7IAqZqKMKHqtOkwbp5933LF4ZCgChdfB37+y2
 og0wTwfkDeUgWVE0uEIdrKgFEr37ei+iUPSqpRjFQNb1CRtK4HnB29fZd16Rvdf9h7je
 kY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tgMrqSknzbjfnQKYqI6CjdbkVLc5brS2XmNdwBs/BGY=;
 b=YVow9lsxqaGJE2klZIeWbrufmbI8ACSd5djzldxR7J7ID23KG8UFas11Kt6xreD2TI
 /8Nk+7EZv5UUjuYloVmcW0qkm1UxMCLSrMUqsXouega4ljpXtTD0j7Yg3F3govzPbuvX
 uohh01jf0I+qjo92/rIyffuRW6GXvanqk+A44aMuLpJ/XUnJsfc1p56R6Z+4dRK5tUTy
 2y5x00ip1N8bq7Kjk0eE//lbMDfpJEZ9Zx3Vvu1yrgdSWy6+REyE2fmzUvGzNBIhlo4/
 HQW2oBo2+koLMIOdldw/Rmundwuxl2nadIXVnB6DYMrQGgIPcu8718JAx8JmccyVNQVC
 HQRw==
X-Gm-Message-State: APjAAAWCyhO97rtE8cn3w7gp6nQU89qgvpDPzq2NHnfZ1Nf6nxx2n1/t
 PSFSXrUSNNrOtiGqwro0yxtfBazvTkAmaQlbIn9ksP00Jpg=
X-Google-Smtp-Source: APXvYqzV5UYrLAdhyZMFch8dZ7c2l0R/imEw5cUGF7dPdFLKgi+B8isrfkMox/FY+kF7mhrrmfwxYGMnNdSTpn5RCBo=
X-Received: by 2002:a62:fb06:: with SMTP id x6mr4091110pfm.186.1569508398603; 
 Thu, 26 Sep 2019 07:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR03MB4068E6EB742A7088B92362A7AEA40@HK0PR03MB4068.apcprd03.prod.outlook.com>
 <CAO=notyaNX1JO2S6AdJd39oP-JqKef62G5w=2h2j-AXCrz1-WQ@mail.gmail.com>
 <HK0PR03MB5123707BA82D7033A19F36EADFBE0@HK0PR03MB5123.apcprd03.prod.outlook.com>
 <CAO=notwu0jC6+UMeadRtuHtT2Ywbu1iW0jMgtoJwnQUjak_Eag@mail.gmail.com>
 <HK0PR03MB51238E446D25BACAEA63D42ADF870@HK0PR03MB5123.apcprd03.prod.outlook.com>
 <CAO=notwkXhMERGn0Zq75QLFDTNvZKvr3vtCaTvsvcA0o-FvTFA@mail.gmail.com>
 <HK0PR03MB51234C094514020D58C9C68BDF860@HK0PR03MB5123.apcprd03.prod.outlook.com>
In-Reply-To: <HK0PR03MB51234C094514020D58C9C68BDF860@HK0PR03MB5123.apcprd03.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 26 Sep 2019 07:33:07 -0700
Message-ID: <CAO=notz3Q9ZE4oVbHD8kBBHyt_fixECv7tzzkMLzHsemPJPdBA@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 25, 2019 at 10:30 PM CS20 CTCchien <CTCCHIEN@nuvoton.com> wrote=
:
>
> Hello Patrick,
>
> Should I move enable-nuvoton-p2a-mbox and enable-nuvoton-p2a-vga to PACKA=
GECONFIG in phosphor-ipmi-flash_git.bb?

Please add the code that supports them first to phosphor-ipmi-flash.
Otherwise they're invalid options.

Also, please always include the mailing list unless the communication
is strictly confidential and then follow whatever rules apply.

Thanks.

>
> B.R.
> Medad
>
> -----Original Message-----
> From: Patrick Venture <venture@google.com>
> Sent: Wednesday, September 25, 2019 12:29 PM
> To: CS20 CTCchien <CTCCHIEN@nuvoton.com>
> Subject: Re: phosphor-ipmi-flash: A problem in BMC FW update over LPC
>
> On Tue, Sep 24, 2019 at 7:10 PM CS20 CTCchien <CTCCHIEN@nuvoton.com> wrot=
e:
> >
> > Hello Patrick,
> >
> > You mentioned " If you dropped these values in meta-phosphor/recipes-ph=
osphor/ipmi/phosphor-ipmi-flash_git.bb, I would +2 it."
> >
> > In
> >
> > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__gerrit.openbmc-2=
D
> > project.xyz_c_openbmc_meta-2Dphosphor_-2B_25440_3_nuvoton-2Dlayer_reci
> > pes-2Dphosphor_ipmi_phosphor-2Dipmi-2Dflash-5F-252525.bbappend-235&d=3D=
D
> > wIFaQ&c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&r=3DHqT4ScbSY2YNT=
4sF
> > BmDErzNgMDeKfQmTiR08x2qtobg&m=3DpU2gA8MnD8d5MLAxqPVtD1a4cOienC3F0H-3BG5=
a
> > Z80&s=3DIIpKpu1IRFCg1egtL7Ol_rdHMcJKojurE_UB5RyoPQo&e=3D
> >
> > do you mean I should move these values to phosphor-ipmi-flash_git.bb ?
>
> The three nuvoton named values. yeah> If you put those there, that'd make=
 sense to me.
>
> >
> > thanks
> >
> > B.R.
> > Medad
> > ________________________________
> > ________________________________
> >  The privileged confidential information contained in this email is int=
ended for use only by the addressees as indicated by the original sender of=
 this email. If you are not the addressee indicated in this email or are no=
t responsible for delivery of the email to such a person, please kindly rep=
ly to the sender indicating this fact and delete all copies of it from your=
 computer and network server immediately. Your cooperation is highly apprec=
iated. It is advised that any unauthorized use of confidential information =
of Nuvoton is strictly prohibited; and any information in this email irrele=
vant to the official business of Nuvoton shall be deemed as neither given n=
or endorsed by Nuvoton.
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
