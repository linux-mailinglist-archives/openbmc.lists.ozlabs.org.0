Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7706D3312DA
	for <lists+openbmc@lfdr.de>; Mon,  8 Mar 2021 17:07:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvNXh3Ngsz3cZg
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 03:07:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=TknkXriH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=TknkXriH; dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvNXS4Jhrz3cK0
 for <openbmc@lists.ozlabs.org>; Tue,  9 Mar 2021 03:07:36 +1100 (AEDT)
Received: by mail-yb1-xb34.google.com with SMTP id x19so10705903ybe.0
 for <openbmc@lists.ozlabs.org>; Mon, 08 Mar 2021 08:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OQtoIJ9YAawsun9TUDRK8cAUBNbVb0RiRTAocG6+qJU=;
 b=TknkXriHwJ1d9nL4RsjOZeanx44j5XuetbdwtNZFcsx5qiBibH8Boo3czZJPpLs1LC
 BnYvZXhXGTbe+ARoehZKF8iQAVhRXHDZmiCOL6wyXTFNEpfnbYtXdt6JiEgigmtD0Lk2
 hvcpgnCKYijXEFRDNLd1CJLOjkU6AT02sZE1ptt2BRm02ZzniVGrKIw97dGwB/zWkHIR
 ipcVKvfWNs1v9ow6dDnP8QaRH7plC6dt9WI202o5/yYt7ehTOf4LjFqQbCI1G1k4r96/
 dnOj4n+x67Q5TfL6F/Ny+qLbLOfrqCSmHs21lr5EpRjDVzOjx9BcENpFcDSa+jnZup5U
 0gsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OQtoIJ9YAawsun9TUDRK8cAUBNbVb0RiRTAocG6+qJU=;
 b=c5ZgCxjX3zRdxjljS3NiHifHjdYkFTxn4cS3JbvFVX53ubqT3ZOsemIf3fk41lL1lx
 4LOnTGAqpfgBf+w7KOUA7iBgQolgwhBc64j1lZJcyIA882bgXij6iErXI9pxexXidg1f
 LClNA+jAakAjWzuaoeYvWEuuAcaCLKzP/rluWspDuE/cgdRar4hGF6X43Wz69MDtC1wU
 PlyaAfEfWM+dO4SkKpaDEN2gkYRUJCpx6zM6Gq2OjyMmhmZKWlnAbwcDPyxERwWYfsDX
 N3iUfvduH3LiBZysxSiCJsb+p3BCDlOD45ikbzVry3fmXmrpEH9zsn/JKgky+8bay8IT
 kQOg==
X-Gm-Message-State: AOAM533veHb2E74cmV+rifk5sZWZn4Jg1GEvLoJHA7Abp/6rUuKbvv4Q
 uFeT5k0oiKS4kh0p/FGtKf0kwqibK2mo2sCGqA+x3w==
X-Google-Smtp-Source: ABdhPJxRmGyEHwWjW/OdPu5evA+hAYGl4OpEs43bpwxdAXBpjvRl/GtuwMBTprh6FUBY+wr8FNWlCEgGwMQjfF+pXbk=
X-Received: by 2002:a25:7356:: with SMTP id o83mr32389010ybc.170.1615219651438; 
 Mon, 08 Mar 2021 08:07:31 -0800 (PST)
MIME-Version: 1.0
References: <SG2PR04MB30939CC20F08C50A7031DBA5E19D9@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <CAH2-KxA4tQvaxzFcAWYhYrq9WeCLrLTRdknZW66XUBzOipoFrg@mail.gmail.com>
 <SG2PR04MB3093F7CA1D6801FDF9D6C5BAE1939@SG2PR04MB3093.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB3093F7CA1D6801FDF9D6C5BAE1939@SG2PR04MB3093.apcprd04.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 8 Mar 2021 08:07:20 -0800
Message-ID: <CACWQX80yb9PiT5S=rg_xOBiqJgETwRHekN=dE18rtxKKPuWfPA@mail.gmail.com>
Subject: Re: Negative value returns for sensor in tiogapass
To: Jayashree D <jayashree-d@hcl.com>
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
Cc: Ed Tanous <edtanous@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Mar 7, 2021 at 10:17 PM Jayashree D <jayashree-d@hcl.com> wrote:
>
> Classification: Public
>
> Hi Ed,
>
> In the below link, PXE1410CVR and ADM1278HSC are using the same reading f=
ormat.
> I am not able to find any information on PXE1410CVR. If there is any spec=
 available, could you please share it.
> It will be helpful to analyze both the specs and fix the problem.

I don't have any specs available for those.  I would assume they
follow the pmbus spec though, you might start there.

>
> https://github.com/openbmc/dbus-sensors/blob/master/src/IpmbSensor.cpp#L1=
44
>
> Regards,
> Jayashree
>
>
> -----Original Message-----
> From: Ed Tanous <edtanous@google.com>
> Sent: Friday, February 26, 2021 9:57 PM
> To: Jayashree D <jayashree-d@hcl.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: Negative value returns for sensor in tiogapass
>
> [CAUTION: This Email is from outside the Organization. Unless you trust t=
he sender, Don=E2=80=99t click links or open attachments as it may be a Phi=
shing email, which can steal your Information and compromise your Computer.=
]
>
> On Fri, Feb 26, 2021 at 12:55 AM Jayashree D <jayashree-d@hcl.com> wrote:
> >
> > Classification: Public
> >
> > Hi Team,
> >
> >
> >
> > Recently, I have tested sensors for tiogapass, in which one sensor retu=
rns negative value.
> >
> > After analysing the code in the dbus-sensors repo, I found the followin=
g issue.
> >
> >
> >
> > dbus-sensors/IpmbSensor.cpp at master =C2=B7 openbmc/dbus-sensors
> > (github.com)
> >
> >
> >
> > From the above link, We need only below line in the code to process the=
 HSC sensors value for tiogapass.
> >
> >
> >
> > int16_t value =3D ((data[4] << 8) | data[3]);
> >
> >
> >
> > Since the below logic is added, the values get shifted and getting nega=
tive values as output.
> >
> >
> >
> > constexpr const size_t shift =3D 16 - 11; // 11bit into 16bit
> >
> > value <<=3D shift;
> >
> > value >>=3D shift;
> >
> >
> >
> > Could you please suggest any idea to resolve this issue.
>
> I haven't looked at this in detail, but we should follow whatever the spe=
c says here.  If whomever wrote this originally put in the wrong math (whic=
h seems likely, given they were implementing 4 types and probably only usin=
g one) then we should just get it fixed and do what the spec says.
>
> >
> >
> >
> > Regards,
> >
> > Jayashree
> >
> >
> >
> > ::DISCLAIMER::
> > ________________________________
> > The contents of this e-mail and any attachment(s) are confidential and =
intended for the named recipient(s) only. E-mail transmission is not guaran=
teed to be secure or error-free as information could be intercepted, corrup=
ted, lost, destroyed, arrive late or incomplete, or may contain viruses in =
transmission. The e mail and its contents (with or without referred errors)=
 shall therefore not attach any liability on the originator or HCL or its a=
ffiliates. Views or opinions, if any, presented in this email are solely th=
ose of the author and may not necessarily reflect the views or opinions of =
HCL or its affiliates. Any form of reproduction, dissemination, copying, di=
sclosure, modification, distribution and / or publication of this message w=
ithout the prior written consent of authorized representative of HCL is str=
ictly prohibited. If you have received this email in error please delete it=
 and notify the sender immediately. Before opening any email and/or attachm=
ents, please check them for viruses and other defects.
> > ________________________________
