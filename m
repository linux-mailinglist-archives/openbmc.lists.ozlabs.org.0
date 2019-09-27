Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B57DC0A13
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2019 19:14:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fz1d2db8zDqyZ
	for <lists+openbmc@lfdr.de>; Sat, 28 Sep 2019 03:14:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cQNq0v11"; 
 dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fz0p1f6ZzDqyS
 for <openbmc@lists.ozlabs.org>; Sat, 28 Sep 2019 03:13:59 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id f19so1349547plr.3
 for <openbmc@lists.ozlabs.org>; Fri, 27 Sep 2019 10:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hZPG1I8f0dt1eVZGMQu7gQTVBe5KYTMpSz5oSb1HPbg=;
 b=cQNq0v117jysMnMAso6WYRePv8anYTXV+ox8WCqRe8vBKUxN/LAM+huZJsdke5vAED
 6BOj9vGfSbhzorCO0tgWQM0kQvrAd4RWeeXx7PHML1EbPA2VRbpG8NZgrHDQ09evM6+H
 WMCYKGapGfjIqRUvOeWGk4zjd7Y2WL8dwDm28bCTovkEaPYbpnsllxwUM1/CwwSJsyZ/
 LFilIJwzEdhB/CGu+jxYYfzR5oQ23L+qF7Q+o4PMXtNBNjZr2m/zUKrfgq56WoZ4sLL8
 /CF9zWcLiCIEqqthwGxU6FYECGDWFJ9t9kzLXqPOS4PmPooGEk1lnTeVxH5ZZSWZXTHI
 /G/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hZPG1I8f0dt1eVZGMQu7gQTVBe5KYTMpSz5oSb1HPbg=;
 b=XYvIBL/3JIGrm3IqvZi6MtymWuuSibuIvywFEHeemYZt/Pkg/BAD1P5cw6hrM83o3p
 sHEG8W1HNCUKMnIRPcmSjwLrzXTGySp6S2TA81rBHDsdyfa/Z35m4skRmXaLH5jk6azS
 pCsfJoX20nxer3Fd+4GcOFgBZOfzNJ3isj2TflW3AH8s7+am6m0k3zGyvW33QHDRfTJi
 +0Ir3s7y0KpRskCC2MklaVbzD+ruByi+Vs4k3wKLcdxFe5PedwAJOn3TbcZRo7Ek9mdj
 dUpeRBWOyVJe7PkNQRlIvGGwk7PfOn1qRHGrGnA2gFzPDgf8rdO7E2hiKUq60jyMLere
 cjLg==
X-Gm-Message-State: APjAAAXNQh3u+LRnVO+rEFOOSDSySn6rMOFtrgCLlUWHIon0d+4rAJvI
 BqjzsERzwv8g9LdReU4WMcgIWiwK1AjuSA5lPyFOlg==
X-Google-Smtp-Source: APXvYqx1fHmpn/+0gfZ/Xl9plsSRGv+rkThEe6ySw78qlnvUcEosWvz942hDxfnyTeXCnd0qfpsORABfrHc4cnBSmLs=
X-Received: by 2002:a17:902:bb87:: with SMTP id
 m7mr5774787pls.179.1569604435992; 
 Fri, 27 Sep 2019 10:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR03MB4068E6EB742A7088B92362A7AEA40@HK0PR03MB4068.apcprd03.prod.outlook.com>
 <CAO=notyaNX1JO2S6AdJd39oP-JqKef62G5w=2h2j-AXCrz1-WQ@mail.gmail.com>
 <HK0PR03MB5123707BA82D7033A19F36EADFBE0@HK0PR03MB5123.apcprd03.prod.outlook.com>
 <CAO=notwu0jC6+UMeadRtuHtT2Ywbu1iW0jMgtoJwnQUjak_Eag@mail.gmail.com>
 <HK0PR03MB51238E446D25BACAEA63D42ADF870@HK0PR03MB5123.apcprd03.prod.outlook.com>
 <CAO=notwkXhMERGn0Zq75QLFDTNvZKvr3vtCaTvsvcA0o-FvTFA@mail.gmail.com>
 <HK0PR03MB51234C094514020D58C9C68BDF860@HK0PR03MB5123.apcprd03.prod.outlook.com>
 <CAO=notz3Q9ZE4oVbHD8kBBHyt_fixECv7tzzkMLzHsemPJPdBA@mail.gmail.com>
 <HK0PR03MB5123CF14A8A07F9D4A0D4875DF810@HK0PR03MB5123.apcprd03.prod.outlook.com>
In-Reply-To: <HK0PR03MB5123CF14A8A07F9D4A0D4875DF810@HK0PR03MB5123.apcprd03.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 27 Sep 2019 10:13:44 -0700
Message-ID: <CAO=notwUTprsLbHVUh_FeFCrRQ8R6Xyzb6g45Dc5P_U2U+=rOw@mail.gmail.com>
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

On Thu, Sep 26, 2019 at 8:24 PM CS20 CTCchien <CTCCHIEN@nuvoton.com> wrote:
>
> Hello  Patrick,
>
> I add the code to phosphor-ipmi-flash.
> But build failed,
> Do you know how could I know what is the error?
> Thanks

The jenkins logs aren't kept around long, so they are not super
helpful in this case.  You should run the build locally to validate
your CL.

You can follow these steps to do so:

https://github.com/openbmc/docs/blob/master/local-ci-build.md

>
>
>
> B.R.
> Medad
>
> -----Original Message-----
> From: Patrick Venture <venture@google.com>
> Sent: Thursday, September 26, 2019 10:33 PM
> To: CS20 CTCchien <CTCCHIEN@nuvoton.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: Re: phosphor-ipmi-flash: A problem in BMC FW update over LPC
>
> On Wed, Sep 25, 2019 at 10:30 PM CS20 CTCchien <CTCCHIEN@nuvoton.com> wro=
te:
> >
> > Hello Patrick,
> >
> > Should I move enable-nuvoton-p2a-mbox and enable-nuvoton-p2a-vga to PAC=
KAGECONFIG in phosphor-ipmi-flash_git.bb?
>
> Please add the code that supports them first to phosphor-ipmi-flash.
> Otherwise they're invalid options.
>
> Also, please always include the mailing list unless the communication is =
strictly confidential and then follow whatever rules apply.
>
> Thanks.
>
> >
> > B.R.
> > Medad
> >
> > -----Original Message-----
> > From: Patrick Venture <venture@google.com>
> > Sent: Wednesday, September 25, 2019 12:29 PM
> > To: CS20 CTCchien <CTCCHIEN@nuvoton.com>
> > Subject: Re: phosphor-ipmi-flash: A problem in BMC FW update over LPC
> >
> > On Tue, Sep 24, 2019 at 7:10 PM CS20 CTCchien <CTCCHIEN@nuvoton.com> wr=
ote:
> > >
> > > Hello Patrick,
> > >
> > > You mentioned " If you dropped these values in meta-phosphor/recipes-=
phosphor/ipmi/phosphor-ipmi-flash_git.bb, I would +2 it."
> > >
> > > In
> > >
> > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__gerrit.openbmc=
-
> > > 2D
> > > project.xyz_c_openbmc_meta-2Dphosphor_-2B_25440_3_nuvoton-2Dlayer_re
> > > ci
> > > pes-2Dphosphor_ipmi_phosphor-2Dipmi-2Dflash-5F-252525.bbappend-235&d
> > > =3DD
> > > wIFaQ&c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&r=3DHqT4ScbSY2Y=
NT4
> > > sF
> > > BmDErzNgMDeKfQmTiR08x2qtobg&m=3DpU2gA8MnD8d5MLAxqPVtD1a4cOienC3F0H-3B=
G
> > > 5a Z80&s=3DIIpKpu1IRFCg1egtL7Ol_rdHMcJKojurE_UB5RyoPQo&e=3D
> > >
> > > do you mean I should move these values to phosphor-ipmi-flash_git.bb =
?
> >
> > The three nuvoton named values. yeah> If you put those there, that'd ma=
ke sense to me.
> >
> > >
> > > thanks
> > >
> > > B.R.
> > > Medad
> > > ________________________________
> > > ________________________________
> > >  The privileged confidential information contained in this email is i=
ntended for use only by the addressees as indicated by the original sender =
of this email. If you are not the addressee indicated in this email or are =
not responsible for delivery of the email to such a person, please kindly r=
eply to the sender indicating this fact and delete all copies of it from yo=
ur computer and network server immediately. Your cooperation is highly appr=
eciated. It is advised that any unauthorized use of confidential informatio=
n of Nuvoton is strictly prohibited; and any information in this email irre=
levant to the official business of Nuvoton shall be deemed as neither given=
 nor endorsed by Nuvoton.
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
