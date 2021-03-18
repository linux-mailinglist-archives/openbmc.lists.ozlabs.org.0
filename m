Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2633409C1
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 17:11:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1X7s364bz3bnx
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 03:11:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=hdBZc4M2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::429;
 helo=mail-wr1-x429.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=hdBZc4M2; dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1X7d4Rq7z2yq8
 for <openbmc@lists.ozlabs.org>; Fri, 19 Mar 2021 03:10:53 +1100 (AEDT)
Received: by mail-wr1-x429.google.com with SMTP id e9so6134259wrw.10
 for <openbmc@lists.ozlabs.org>; Thu, 18 Mar 2021 09:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YOYkzToywx4dY7YT/j4foGPmwppgz7LbmE1vsVSAc9A=;
 b=hdBZc4M2/QLiixGrSQ2uxUCI+egIexX22F86O8QChxNpO8NQx8DwpewCn1HbJY/ce3
 G1e6TidYKioRs2eWuopzra1/gaTHlPVo6rWwbaj50VVT83pvGIvbZausqUCPYHIfl/5+
 O7UhWqBLqGOlGL0weCQDz8K3kAJSgI9ugceLRu6xORu46BSp4Vq8FMHz/29qgB/kGBCE
 Q5TrejDZGk3NEmRuLycueaEtoXEg4t5Bu5ZyyYjUKd3FuhC3GUEdQxYPZUmDs8j+sGdS
 B1OxVJYZJXV+48NS7CDPDEW/K81p9e8Le5drZsbe/XdvZu334pdjnmyiuvBhfX0+4k1F
 2uYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YOYkzToywx4dY7YT/j4foGPmwppgz7LbmE1vsVSAc9A=;
 b=CG68pmu83K56Sz027do5F+/tDcyraKo0tFmTb8o84DCyQCw4w7esFB9mLnPw8TujjF
 DGDqbcGwbF9LW3v/a5wbylbxwNEqoUiCdEBvevcFAX2qzi4eZRhHBTAkxGf2SqQ7Zwj9
 eMV3ZNRzrU7cmd30hz0eLGJVtSnyJwfckxam6rYSDFv80osOLl9Nz6IMk0P4c+EKK5TY
 SrEP5zhpw9MZszqQy9zB/2paIh99MYoG8aFEY6Mw25zipwo8npIuE49olVb9D4SxvPs+
 5phIRIqX41NBvXgxDmnRzWKlFTSL2jH79dea5I+b1yMrXJGbKo3xH13oWr3RBJQqIHKH
 52Bg==
X-Gm-Message-State: AOAM530R4hXjXUVnLkRKpldQh345XGja8j5Tpl8a5Yjd09NfOGmxmxyP
 69SCLysg4c+d8Q5G6Xh88U+w3RwCweJK221XjGo5kw==
X-Google-Smtp-Source: ABdhPJzelDWK2Uln1BOZgqk8btyk07PpZx+I3jDZF66W1rbpRiCdHYf9Wn8H25PRvOgoOnfy5LSLfKHHFlQNNe8RbkM=
X-Received: by 2002:adf:9bce:: with SMTP id e14mr21896wrc.29.1616083849090;
 Thu, 18 Mar 2021 09:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <SG2PR04MB30939CC20F08C50A7031DBA5E19D9@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <CAH2-KxA4tQvaxzFcAWYhYrq9WeCLrLTRdknZW66XUBzOipoFrg@mail.gmail.com>
 <SG2PR04MB3093F7CA1D6801FDF9D6C5BAE1939@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <CACWQX80yb9PiT5S=rg_xOBiqJgETwRHekN=dE18rtxKKPuWfPA@mail.gmail.com>
 <SL2PR04MB30975F3703CAFEFBC1328025E1929@SL2PR04MB3097.apcprd04.prod.outlook.com>
 <SG2PR04MB30938BD2D16A0956E2BEEFD6E16A9@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <DM6PR11MB441097913A35ADC1B63974E5946A9@DM6PR11MB4410.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB441097913A35ADC1B63974E5946A9@DM6PR11MB4410.namprd11.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Thu, 18 Mar 2021 09:10:38 -0700
Message-ID: <CAH2-KxAva6Sz6Q7GN-B8Tat+K855M1LZ2FiTcqxx7Smui=MqNA@mail.gmail.com>
Subject: Re: Negative value returns for sensor in tiogapass
To: "Ren, Zhikui" <zhikui.ren@intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Jayashree D <jayashree-d@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Mar 17, 2021 at 11:18 AM Ren, Zhikui <zhikui.ren@intel.com> wrote:
>
>
>
> -----Original Message-----
> From: openbmc <openbmc-bounces+zhikui.ren=3Dintel.com@lists.ozlabs.org> O=
n Behalf Of Jayashree D
> Sent: Wednesday, March 17, 2021 12:39 AM
> To: Ed Tanous <edtanous@google.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: RE: Negative value returns for sensor in tiogapass
>
> Classification: Public
>
> Hi Ed,
>
> PMBus spec only have read and write format. In the below link, PXE VR use=
s 11 bit format. Also sign extend the 11bit reading so that negatives show =
correctly.
>
> https://github.com/openbmc/dbus-sensors/commit/e4a970d9aea97c7c1a11c63215=
e7d3cda2124e54#diff-135678dd2046935c5dd0be8e5a5a529d33231203149e786d57b15a3=
cc0cc1240
>
>             constexpr const size_t shift =3D 16 - 11; // 11bit into 16bit
>             value <<=3D shift;
>             value >>=3D shift;
>
> Could anyone from the intel team can clarify the need of above logic used=
 in IpmbSensor.
>
> [Ren, Zhikui]  This change was made to allow negative numbers be reported=
 correctly.  This can happen during test. Without the change, 255degree wil=
l be reported and trip threshold event incorrectly.

Can you walk through what your test was?  It's sounding like Jayashree
was seeing incorrect values in a real world application.  Is it
possible we fixed something in a test by breaking something in the
real world?  Can you think of any other reasons why others would be
seeing different behavior?

> Exponent data is not used because it is always 0.
>
> Regards,
> Jayashree
>
> -----Original Message-----
> From: Jayashree D
> Sent: Tuesday, March 9, 2021 4:48 PM
> To: Ed Tanous <ed@tanous.net>
> Cc: Ed Tanous <edtanous@google.com>; openbmc@lists.ozlabs.org
> Subject: RE: Negative value returns for sensor in tiogapass
>
> Classification: Public
>
> Thanks Ed, I'll check it out.
>
> -----Original Message-----
> From: Ed Tanous <ed@tanous.net>
> Sent: Monday, March 8, 2021 9:37 PM
> To: Jayashree D <jayashree-d@hcl.com>
> Cc: Ed Tanous <edtanous@google.com>; openbmc@lists.ozlabs.org
> Subject: Re: Negative value returns for sensor in tiogapass
>
> [CAUTION: This Email is from outside the Organization. Unless you trust t=
he sender, Don't click links or open attachments as it may be a Phishing em=
ail, which can steal your Information and compromise your Computer.]
>
> On Sun, Mar 7, 2021 at 10:17 PM Jayashree D <jayashree-d@hcl.com> wrote:
> >
> > Classification: Public
> >
> > Hi Ed,
> >
> > In the below link, PXE1410CVR and ADM1278HSC are using the same reading=
 format.
> > I am not able to find any information on PXE1410CVR. If there is any sp=
ec available, could you please share it.
> > It will be helpful to analyze both the specs and fix the problem.
>
> I don't have any specs available for those.  I would assume they follow t=
he pmbus spec though, you might start there.
>
> >
> > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
h
> > ub.com%2Fopenbmc%2Fdbus-sensors%2Fblob%2Fmaster%2Fsrc%2FIpmbSensor.cpp
> > %23L144&amp;data=3D04%7C01%7Cjayashree-d%40hcl.com%7C8676d30f4d3a4dda1e=
0
> > e08d8e24c4957%7C189de737c93a4f5a8b686f4ca9941912%7C0%7C0%7C63750816456
> > 8775248%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC
> > JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D5lhuUdfI%2BG75C8I1HDAaE=
H
> > VP46%2Bz1r3nJV0ek3CiiR4%3D&amp;reserved=3D0
> >
> > Regards,
> > Jayashree
> >
> >
> > -----Original Message-----
> > From: Ed Tanous <edtanous@google.com>
> > Sent: Friday, February 26, 2021 9:57 PM
> > To: Jayashree D <jayashree-d@hcl.com>
> > Cc: openbmc@lists.ozlabs.org
> > Subject: Re: Negative value returns for sensor in tiogapass
> >
> > [CAUTION: This Email is from outside the Organization. Unless you
> > trust the sender, Don't click links or open attachments as it may be a
> > Phishing email, which can steal your Information and compromise your
> > Computer.]
> >
> > On Fri, Feb 26, 2021 at 12:55 AM Jayashree D <jayashree-d@hcl.com> wrot=
e:
> > >
> > > Classification: Public
> > >
> > > Hi Team,
> > >
> > >
> > >
> > > Recently, I have tested sensors for tiogapass, in which one sensor re=
turns negative value.
> > >
> > > After analysing the code in the dbus-sensors repo, I found the follow=
ing issue.
> > >
> > >
> > >
> > > dbus-sensors/IpmbSensor.cpp at master * openbmc/dbus-sensors
> > > (github.com)
> > >
> > >
> > >
> > > From the above link, We need only below line in the code to process t=
he HSC sensors value for tiogapass.
> > >
> > >
> > >
> > > int16_t value =3D ((data[4] << 8) | data[3]);
> > >
> > >
> > >
> > > Since the below logic is added, the values get shifted and getting ne=
gative values as output.
> > >
> > >
> > >
> > > constexpr const size_t shift =3D 16 - 11; // 11bit into 16bit
> > >
> > > value <<=3D shift;
> > >
> > > value >>=3D shift;
> > >
> > >
> > >
> > > Could you please suggest any idea to resolve this issue.
> >
> > I haven't looked at this in detail, but we should follow whatever the s=
pec says here.  If whomever wrote this originally put in the wrong math (wh=
ich seems likely, given they were implementing 4 types and probably only us=
ing one) then we should just get it fixed and do what the spec says.
> >
> > >
> > >
> > >
> > > Regards,
> > >
> > > Jayashree
> > >
> > >
> > >
> > > ::DISCLAIMER::
> > > ________________________________
> > > The contents of this e-mail and any attachment(s) are confidential an=
d intended for the named recipient(s) only. E-mail transmission is not guar=
anteed to be secure or error-free as information could be intercepted, corr=
upted, lost, destroyed, arrive late or incomplete, or may contain viruses i=
n transmission. The e mail and its contents (with or without referred error=
s) shall therefore not attach any liability on the originator or HCL or its=
 affiliates. Views or opinions, if any, presented in this email are solely =
those of the author and may not necessarily reflect the views or opinions o=
f HCL or its affiliates. Any form of reproduction, dissemination, copying, =
disclosure, modification, distribution and / or publication of this message=
 without the prior written consent of authorized representative of HCL is s=
trictly prohibited. If you have received this email in error please delete =
it and notify the sender immediately. Before opening any email and/or attac=
hments, please check them for viruses and other defects.
> > > ________________________________
