Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 773DB340BDE
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 18:31:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1Yx736c3z3btL
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 04:31:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=TdOlPco+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::431;
 helo=mail-wr1-x431.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=TdOlPco+; dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1Ywv1sSdz2yq8
 for <openbmc@lists.ozlabs.org>; Fri, 19 Mar 2021 04:31:42 +1100 (AEDT)
Received: by mail-wr1-x431.google.com with SMTP id j7so6423285wrd.1
 for <openbmc@lists.ozlabs.org>; Thu, 18 Mar 2021 10:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EFdzkCaBV5OW7NdDLUhQlkxBDazxd1mPEIWxiJTirdE=;
 b=TdOlPco+LuZWuTzdcCq1Ah+OMNnIbCYlCuFyZzPOVGHksiA9t+/fS3Fa66CNyT8Liz
 rDRrkpD7nlXE3cYN08UFSt/yxp7zGMwew8+TOKcLksDKO0ry0pQx7QkRXZjkn8Z1tV1K
 cQZkKqiUP26sgD7iMMIpxEP9HlfMeXoyHdWLyWG7B60yZ3GomSXB+oujv1lWQs8qUrff
 vYLB+OnGYgaldprJb1Lc9cXwlXffB2on45KkdFnPv2bfOApxyk9Cibn5VfllW864CmGo
 0ypf2ZbJMoU3+hlcLiNXg21++pnM/sX0xxZjkp9d80tRDzpvYKiz8f6tdqPOqYkpfwzL
 p1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EFdzkCaBV5OW7NdDLUhQlkxBDazxd1mPEIWxiJTirdE=;
 b=ib/XmUbzwCN9u+jKMnlg+Uo0XPVAzbOREGXBHpawT9c45MTO4eqcJWxb8QBmsfLbC3
 gfnrpE69V0Dh/j9I2vFlVM5t3BGNm/5I8cOYyERsb5uMERIcHE4/f5a5eF3ce6BnDE7q
 DkHWvE7ROSeSLTjQr/mfoY3q5wMazL4vhwgiORkqW0f2+a56kysMPeLZ4m2F1ufzcWzc
 6dgMWhbfR9NJPSo4cwoOF+wD527M09uZEMYEIqeiRiJYjz0nXvN12jhzg7ipWWYwTwjT
 79iQimchBxpYEUjM8Dqnsbj+Z3ov6bWsZVUwRKNyMiEd6Ossfy0gfIgnwj6nGKfIzbEL
 V/UQ==
X-Gm-Message-State: AOAM530Gm8/1TQMhiKR8DYV2/5ajajrjR5KztQUwzpDe3/pjAXSJr3+r
 d/PyUd4X9puek6UAVSwAO5dx+iIhATf1H2VtY6MNnw==
X-Google-Smtp-Source: ABdhPJxBJHuROTIQy5CUuQqnZoVsIno4+RHDvNJBg4QAUf0S5vFQz35fL8xZxQC6Ywy5Kk/oCyMS9ihkKvAyv8W6ru0=
X-Received: by 2002:a05:6000:2c8:: with SMTP id
 o8mr332985wry.407.1616088696531; 
 Thu, 18 Mar 2021 10:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <SG2PR04MB30939CC20F08C50A7031DBA5E19D9@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <CAH2-KxA4tQvaxzFcAWYhYrq9WeCLrLTRdknZW66XUBzOipoFrg@mail.gmail.com>
 <SG2PR04MB3093F7CA1D6801FDF9D6C5BAE1939@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <CACWQX80yb9PiT5S=rg_xOBiqJgETwRHekN=dE18rtxKKPuWfPA@mail.gmail.com>
 <SL2PR04MB30975F3703CAFEFBC1328025E1929@SL2PR04MB3097.apcprd04.prod.outlook.com>
 <SG2PR04MB30938BD2D16A0956E2BEEFD6E16A9@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <DM6PR11MB441097913A35ADC1B63974E5946A9@DM6PR11MB4410.namprd11.prod.outlook.com>
 <CAH2-KxAva6Sz6Q7GN-B8Tat+K855M1LZ2FiTcqxx7Smui=MqNA@mail.gmail.com>
 <DM6PR11MB441073C8A728B64BAA84733D94699@DM6PR11MB4410.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB441073C8A728B64BAA84733D94699@DM6PR11MB4410.namprd11.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Thu, 18 Mar 2021 10:31:25 -0700
Message-ID: <CAH2-KxBu_Feznt8_J2y3FVcYZmVat+rFfoWX1_B-dqSA+AQ0xA@mail.gmail.com>
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

On Thu, Mar 18, 2021 at 10:27 AM Ren, Zhikui <zhikui.ren@intel.com> wrote:
>
>
>
> >-----Original Message-----
> >From: Ed Tanous <edtanous@google.com>
> >Sent: Thursday, March 18, 2021 9:11 AM
> >To: Ren, Zhikui <zhikui.ren@intel.com>
> >Cc: Jayashree D <jayashree-d@hcl.com>; openbmc@lists.ozlabs.org
> >Subject: Re: Negative value returns for sensor in tiogapass
> >
> >On Wed, Mar 17, 2021 at 11:18 AM Ren, Zhikui <zhikui.ren@intel.com> wrot=
e:
> >>
> >>
> >>
> >> -----Original Message-----
> >> From: openbmc <openbmc-bounces+zhikui.ren=3Dintel.com@lists.ozlabs.org=
>
> >> On Behalf Of Jayashree D
> >> Sent: Wednesday, March 17, 2021 12:39 AM
> >> To: Ed Tanous <edtanous@google.com>
> >> Cc: openbmc@lists.ozlabs.org
> >> Subject: RE: Negative value returns for sensor in tiogapass
> >>
> >> Classification: Public
> >>
> >> Hi Ed,
> >>
> >> PMBus spec only have read and write format. In the below link, PXE VR =
uses
> >11 bit format. Also sign extend the 11bit reading so that negatives show
> >correctly.
> >>
> >> https://github.com/openbmc/dbus-
> >sensors/commit/e4a970d9aea97c7c1a11c63
> >> 215e7d3cda2124e54#diff-
> >135678dd2046935c5dd0be8e5a5a529d33231203149e786
> >> d57b15a3cc0cc1240
> >>
> >>             constexpr const size_t shift =3D 16 - 11; // 11bit into 16=
bit
> >>             value <<=3D shift;
> >>             value >>=3D shift;
> >>
> >> Could anyone from the intel team can clarify the need of above logic u=
sed in
> >IpmbSensor.
> >>
> >> [Ren, Zhikui]  This change was made to allow negative numbers be repor=
ted
> >correctly.  This can happen during test. Without the change, 255degree w=
ill be
> >reported and trip threshold event incorrectly.
> >
> >Can you walk through what your test was?  It's sounding like Jayashree w=
as
> >seeing incorrect values in a real world application.  Is it possible we =
fixed
> >something in a test by breaking something in the real world?  Can you th=
ink of
> >any other reasons why others would be seeing different behavior?
> >
> [Ren, Zhikui] The issue here is the two device's temperatures are not of =
the same format.
> PXE1410 uses PMBus LINEAR11 format, where the mantissa  is a signed 11-bi=
t 2=E2=80=99s complement integer.
> ADM1278 temperature is 11 bit, but not with LINEAR11 format.
> We should rename the current elevenBit to  linearElevenBit and add eleven=
Bit without the sign extension for ADM1278.

I'll leave it between you and Jayashree to figure out who will push
the patch, but that approach sounds reasonable to me.

>
> >> Exponent data is not used because it is always 0.
> >>
> >> Regards,
> >> Jayashree
> >>
> >> -----Original Message-----
> >> From: Jayashree D
> >> Sent: Tuesday, March 9, 2021 4:48 PM
> >> To: Ed Tanous <ed@tanous.net>
> >> Cc: Ed Tanous <edtanous@google.com>; openbmc@lists.ozlabs.org
> >> Subject: RE: Negative value returns for sensor in tiogapass
> >>
> >> Classification: Public
> >>
> >> Thanks Ed, I'll check it out.
> >>
> >> -----Original Message-----
> >> From: Ed Tanous <ed@tanous.net>
> >> Sent: Monday, March 8, 2021 9:37 PM
> >> To: Jayashree D <jayashree-d@hcl.com>
> >> Cc: Ed Tanous <edtanous@google.com>; openbmc@lists.ozlabs.org
> >> Subject: Re: Negative value returns for sensor in tiogapass
> >>
> >> [CAUTION: This Email is from outside the Organization. Unless you
> >> trust the sender, Don't click links or open attachments as it may be a
> >> Phishing email, which can steal your Information and compromise your
> >> Computer.]
> >>
> >> On Sun, Mar 7, 2021 at 10:17 PM Jayashree D <jayashree-d@hcl.com> wrot=
e:
> >> >
> >> > Classification: Public
> >> >
> >> > Hi Ed,
> >> >
> >> > In the below link, PXE1410CVR and ADM1278HSC are using the same
> >reading format.
> >> > I am not able to find any information on PXE1410CVR. If there is any=
 spec
> >available, could you please share it.
> >> > It will be helpful to analyze both the specs and fix the problem.
> >>
> >> I don't have any specs available for those.  I would assume they follo=
w the
> >pmbus spec though, you might start there.
> >>
> >> >
> >> > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
gi
> >> > th
> >> > ub.com%2Fopenbmc%2Fdbus-
> >sensors%2Fblob%2Fmaster%2Fsrc%2FIpmbSensor.c
> >> > pp
> >> > %23L144&amp;data=3D04%7C01%7Cjayashree-
> >d%40hcl.com%7C8676d30f4d3a4dda1
> >> > e0
> >> >
> >e08d8e24c4957%7C189de737c93a4f5a8b686f4ca9941912%7C0%7C0%7C637508
> >164
> >> > 56
> >> >
> >8775248%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2
> >luMzIi
> >> > LC
> >> >
> >JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D5lhuUdfI%2BG75C8I1
> >HDAa
> >> > EH
> >> > VP46%2Bz1r3nJV0ek3CiiR4%3D&amp;reserved=3D0
> >> >
> >> > Regards,
> >> > Jayashree
> >> >
> >> >
> >> > -----Original Message-----
> >> > From: Ed Tanous <edtanous@google.com>
> >> > Sent: Friday, February 26, 2021 9:57 PM
> >> > To: Jayashree D <jayashree-d@hcl.com>
> >> > Cc: openbmc@lists.ozlabs.org
> >> > Subject: Re: Negative value returns for sensor in tiogapass
> >> >
> >> > [CAUTION: This Email is from outside the Organization. Unless you
> >> > trust the sender, Don't click links or open attachments as it may be
> >> > a Phishing email, which can steal your Information and compromise
> >> > your Computer.]
> >> >
> >> > On Fri, Feb 26, 2021 at 12:55 AM Jayashree D <jayashree-d@hcl.com>
> >wrote:
> >> > >
> >> > > Classification: Public
> >> > >
> >> > > Hi Team,
> >> > >
> >> > >
> >> > >
> >> > > Recently, I have tested sensors for tiogapass, in which one sensor
> >returns negative value.
> >> > >
> >> > > After analysing the code in the dbus-sensors repo, I found the fol=
lowing
> >issue.
> >> > >
> >> > >
> >> > >
> >> > > dbus-sensors/IpmbSensor.cpp at master * openbmc/dbus-sensors
> >> > > (github.com)
> >> > >
> >> > >
> >> > >
> >> > > From the above link, We need only below line in the code to proces=
s the
> >HSC sensors value for tiogapass.
> >> > >
> >> > >
> >> > >
> >> > > int16_t value =3D ((data[4] << 8) | data[3]);
> >> > >
> >> > >
> >> > >
> >> > > Since the below logic is added, the values get shifted and getting
> >negative values as output.
> >> > >
> >> > >
> >> > >
> >> > > constexpr const size_t shift =3D 16 - 11; // 11bit into 16bit
> >> > >
> >> > > value <<=3D shift;
> >> > >
> >> > > value >>=3D shift;
> >> > >
> >> > >
> >> > >
> >> > > Could you please suggest any idea to resolve this issue.
> >> >
> >> > I haven't looked at this in detail, but we should follow whatever th=
e spec
> >says here.  If whomever wrote this originally put in the wrong math (whi=
ch
> >seems likely, given they were implementing 4 types and probably only usi=
ng
> >one) then we should just get it fixed and do what the spec says.
> >> >
> >> > >
> >> > >
> >> > >
> >> > > Regards,
> >> > >
> >> > > Jayashree
> >> > >
> >> > >
> >> > >
> >> > > ::DISCLAIMER::
> >> > > ________________________________
> >> > > The contents of this e-mail and any attachment(s) are confidential=
 and
> >intended for the named recipient(s) only. E-mail transmission is not
> >guaranteed to be secure or error-free as information could be intercepte=
d,
> >corrupted, lost, destroyed, arrive late or incomplete, or may contain vi=
ruses in
> >transmission. The e mail and its contents (with or without referred erro=
rs)
> >shall therefore not attach any liability on the originator or HCL or its=
 affiliates.
> >Views or opinions, if any, presented in this email are solely those of t=
he
> >author and may not necessarily reflect the views or opinions of HCL or i=
ts
> >affiliates. Any form of reproduction, dissemination, copying, disclosure=
,
> >modification, distribution and / or publication of this message without =
the
> >prior written consent of authorized representative of HCL is strictly pr=
ohibited.
> >If you have received this email in error please delete it and notify the=
 sender
> >immediately. Before opening any email and/or attachments, please check
> >them for viruses and other defects.
> >> > > ________________________________
