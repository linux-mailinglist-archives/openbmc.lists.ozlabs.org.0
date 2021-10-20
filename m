Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C2D434DE1
	for <lists+openbmc@lfdr.de>; Wed, 20 Oct 2021 16:33:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZClS6rv1z2yp1
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 01:33:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KUBBFq2z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::332;
 helo=mail-ot1-x332.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=KUBBFq2z; dkim-atps=neutral
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZCl43DcMz2yHM
 for <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 01:33:04 +1100 (AEDT)
Received: by mail-ot1-x332.google.com with SMTP id
 34-20020a9d0325000000b00552cae0decbso6760178otv.0
 for <openbmc@lists.ozlabs.org>; Wed, 20 Oct 2021 07:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=A7gbmGRjmzxIMePDWl4zobRx2ntNL5GMGJxxY5lUvVQ=;
 b=KUBBFq2z9zkWEQjIPPkTYy1p59YCmfi4iAskPuIrwvBkT/EMrQY/09tInqZU6hWpE5
 xyZpLP9tWG46uPVQeN9ZsUOVF92KtXHAxLkkS2EBglQ6QOkJDfoBb+06gzzcqfa9I5fl
 IAbaqI2LXr0Lky0n68kVDgA6xHZNbrB9QMtsaCwmR1VOzwl5sgUkRc4usgvjA0W/IkNh
 KGwy9DJAjaRadM22fZNslOeMt8xfq9MOGuNdMmXQKfZBWicWMwvDoXUu0muc6awhQkXR
 jNsUjvQVzRWyyX9kC5f2PHqB8+sc+eQTQz8K8mgONMiD86lztXQl2JaVsgRXi4yv73LM
 bLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=A7gbmGRjmzxIMePDWl4zobRx2ntNL5GMGJxxY5lUvVQ=;
 b=qKlSDEcmk0pzrvc7fXPv1WIlp/oYCd87EHDpPImoWau14sFpHF6pfvDnYVNakUCXeT
 Het81CHxi073/CNuCyzFFy0bUTHWHOE38uIFrGSpPXZUBj5C2aaWlfcOM6zxCM9wdbBG
 RT3t0EPlvFw34MZjJyP1NMrDeujt7LukiLRX4z6NIzy8ePuB39XsDefuAA/s8JKSiY4D
 HsxzBcyo3iHxzicagIcz2VpS3k57NYmO2MrdDUJQn4iafywZTv8vD5JE2vWw4esgZqsB
 V6QBaSJtk2dlMDRb6Ytb9tFGuQhVrX89G5pdzS132iRHdHucWUEYBlTKxgIGyc/1HM1x
 h3TA==
X-Gm-Message-State: AOAM532Iz2nf87f4gVlabvZcc1Bc5KrNSn3+dZWEYy75+lGoti+5OPjg
 E1C1G68pzAGeGqtZmQZGSEWNfhKVCWlX4Q==
X-Google-Smtp-Source: ABdhPJw9Zn2UhKHFAjS64hCrjb4lMlPRT9DLwErBMd1I0zOtiiiAZ+Y4C54ij1Tng5icTaLovfLzLQ==
X-Received: by 2002:a05:6830:1655:: with SMTP id
 h21mr145174otr.269.1634740379984; 
 Wed, 20 Oct 2021 07:32:59 -0700 (PDT)
Received: from smtpclient.apple ([2600:1700:19e0:3310:bcb9:e198:43f7:6f9c])
 by smtp.gmail.com with ESMTPSA id r44sm521293otv.39.2021.10.20.07.32.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Oct 2021 07:32:59 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: Question about power_restore_policy one time in
 phosphor-state-manager repo
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <DM4PR11MB53098DFBA31C8060FA3B7FD7F4BE9@DM4PR11MB5309.namprd11.prod.outlook.com>
Date: Wed, 20 Oct 2021 09:32:58 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <1AE5C7D9-A6C3-45CD-9882-54F83D25A55B@gmail.com>
References: <DM4PR11MB53098DFBA31C8060FA3B7FD7F4BE9@DM4PR11MB5309.namprd11.prod.outlook.com>
To: "Xie, Mei" <mei.xie@intel.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Oct 20, 2021, at 6:20 AM, Xie, Mei <mei.xie@intel.com> wrote:
>=20
> Hi Geissler/all,
> =20
> I am Xie Mei from intel. I am focus on OpenBMC development. I met some =
questions, hope you can help me to figure it out. Thanks. J
> =20
> I see the below patch in phosphor-state-manager repo.=20
> We also need to auto power on after bios in-band update.=20
> But I have below questions, could you please help to look at them?
> 	=E2=80=A2 Do you know where is the definition of =
/xyz/openbmc_project/control/host0/power_restore_policy/one_time? =
Because in my code, It doesn=E2=80=99t have =
/xyz/openbmc_project/control/host0/power_restore_policy/one_time path.
> <image001.jpg>

Hi Mei, these are defined within the phosphor-settings app. They are =
pulled in via =
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosp=
hor/settings/phosphor-settings-defaults/defaults.yaml so you=E2=80=99d =
want to see if your system has some sort of override that=E2=80=99s not =
bringing this in.

> 	=E2=80=A2 I see your commit info, you use dbus to invoke =
one_time path. Where will invoke this one time function in code?

As you note below, support fro this function is in =
https://github.com/openbmc/phosphor-state-manager/blob/master/discover_sys=
tem_state.cpp

> 	=E2=80=A2 In /user/bin folder, I don=E2=80=99t have =
phosphor-discover-system-state in my platform. So maybe =
phosphor-state-manager service isn=E2=80=99t existed in my platform. =
There are several service in phosphor-state-manager =
repo?https://github.com/openbmc/phosphor-state-manager/commit/35ca2e34cd04=
b7288a5b659e4e7dcd4590056b7d

x86-power-control is an alternative to phosphor-state-manager and =
implements a lot of the same interfaces. My guess would be that you have =
this installed on your system. I=E2=80=99m not sure where their support =
is of some of these =E2=80=9Cextra=E2=80=9D features like one_time. It =
may be that if you need this one_time feature you=E2=80=99d need to =
submit some code to x86-power-control to support it similar to =
phosphor-state-manager.

> =20
> I am really appreciate if you can do me a favor.
> =20
> Best Regards,
> Mei

