Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D22405A50
	for <lists+openbmc@lfdr.de>; Thu,  9 Sep 2021 17:43:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H53F15RKQz2yMD
	for <lists+openbmc@lfdr.de>; Fri, 10 Sep 2021 01:43:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bxjf2YSB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32f;
 helo=mail-ot1-x32f.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=bxjf2YSB; dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H53DX1Qw3z2xsg
 for <openbmc@lists.ozlabs.org>; Fri, 10 Sep 2021 01:42:51 +1000 (AEST)
Received: by mail-ot1-x32f.google.com with SMTP id
 v33-20020a0568300921b0290517cd06302dso3001901ott.13
 for <openbmc@lists.ozlabs.org>; Thu, 09 Sep 2021 08:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=cqZG+sYYGf1XHLL3D9eLMQw35mY33Z7al/DfaBauYpM=;
 b=bxjf2YSBM6ZcEcIfH3lmTVPcCABR6LU7yG/3MIX2QbZZOlA12N58x8kb1L3Jvxo/Av
 2lx99rij126BQwuMVa7ZN/TXpE63+xBsuD9vBLMohULQwiGxcx06ltDDsjdCFa+6FeSO
 OtQG2Qb4IzHfbuJqFyz88S5npzOVQSbmQP/1YJ32CcIW1AJ3DXm26jv5xu7XzIkq3ZiF
 mo4qTGfiAV+wX9oiXh0QfnVtc8gVCwJPZ+I1QArqu0HhXQ5529LP1V22cjqDXr+M84VT
 AkZYzMdjocdjVRt3Z51DC0k7kZqxKSikxs2z5EQ3KUlpmbupiWjNyd9CrTNVe6KjNg79
 OSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=cqZG+sYYGf1XHLL3D9eLMQw35mY33Z7al/DfaBauYpM=;
 b=is5UUmzMdN4dcRXJ3ST05VKkuQkBcgYldZ9M56DoXiQtwjL6dlxDgjqI6Kdu+0S+7H
 9Q2CaeXI1sBEPngpjToAgjy+DAS1I6ojk5E8tDpiCcDfPUwqC0XkjGR2LkZLFZdR83Ct
 L4g/0B7N/V3wNyIGhu2koMC7OCCMz7B4UZdX99u/sbKW+MYw6Oq03WhLYxU1gLVdHB7G
 ftvXz1zlOkz6YDAw7SZyR0uMBBAI7zW/3q/nHJNU8FczxbKmXXAq8M79dTcv38XiKtN5
 Pterd6SlBYFI0SNYJPMftr+kbRBT5xXpk8IZRU3u5an/u/gGRZ03O3hliPAM8aHU/K/I
 b98w==
X-Gm-Message-State: AOAM532Lcw4ckdbSXIL/Dza8PFXYG1Bb2o/y2atjTqn9kOtoLaOJr+jB
 MxzA1zTElmrw3crQN2+z8TmZtPNp0KpEWA==
X-Google-Smtp-Source: ABdhPJxW96be9Z1T3zT4qrWSnWgD76agDLA1qmS4cxH44WP2L2XsZEOqIDMDkAJXwCQlvm2iLtYqZA==
X-Received: by 2002:a9d:4e06:: with SMTP id p6mr396993otf.261.1631202167690;
 Thu, 09 Sep 2021 08:42:47 -0700 (PDT)
Received: from smtpclient.apple ([2600:1700:19e0:3310:4c3f:74f6:fd38:417e])
 by smtp.gmail.com with ESMTPSA id a13sm473892ooi.3.2021.09.09.08.42.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Sep 2021 08:42:47 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: Implement OEM mechanism to handle
 xyz.openbmc_project.Condition.HostFirmware interface
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <3909e9e3-0a58-e542-a004-89278438997d@amperemail.onmicrosoft.com>
Date: Thu, 9 Sep 2021 10:42:46 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <07A6A378-47F6-4805-ABFD-D216F4D4C8FE@gmail.com>
References: <53e204da-0c8b-d161-a065-a6195550d7f7@amperemail.onmicrosoft.com>
 <3909e9e3-0a58-e542-a004-89278438997d@amperemail.onmicrosoft.com>
To: Thang Nguyen <thang@amperemail.onmicrosoft.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Sep 8, 2021, at 8:54 PM, Thang Nguyen =
<thang@amperemail.onmicrosoft.com> wrote:
>=20
> Hi,
>=20
> Let me explain more detail about our cases:
>=20
> - Our system uses a GPIO called FW_BOOT_OK to detect if the Host is =
currently ON or OFF. The Host firmware set this GPIO when the first core =
initialized.
>=20
> - We have no problem in Host State with power control. But the problem =
is in the case of BMC rebooted while the Host is ON.
>=20
> - Before the commit =
https://github.com/openbmc/phosphor-state-manager/commit/0d1c3f1f9329c8536=
77f0581287afef83eeea0f0, phosphor-reset-host-check@.service  is used to =
check and update Host State in case of BMC rebooted. But after that =
commit, the service file was removed. This makes no target service to =
update the Host State and the host check is fail at =
https://github.com/openbmc/phosphor-state-manager/blob/0a675215d6a6d2eb13e=
030ba0f618a4691de58d4/host_check.cpp#L109.
>=20
> We would like to ask for your idea on how should we implement for the =
Host check when BMC is rebooted?

Hi Thang. Yeah, the reason for moving the logic directly into =
phosphor-host-state
is we had a window where the host state would say off (default) even =
when the
host was actually on. The other service would run and update it to the =
correct
value but there was a window where external clients would see an =
incorrect
state. So since we don=E2=80=99t want to report an invalid state, I =
needed the logic=20
within the app itself on startup.

I think you=E2=80=99re on the right path here. The design is to =
implement the
xyz.openbmc_project.Condition.HostFirmware object and support the read
of the CurrentFirmwareCondition property. Based on your GPIO state, =
you=E2=80=99d
respond accordingly to the read. That way the state-manager code will =
just
work as-is.

On where to put this code=E2=80=A6 So far we=E2=80=99ve put it in the =
area that is doing the logic,
like PLDM and IPMI. Since this is really just a GPIO read, I=E2=80=99m =
not sure the best
place. I=E2=80=99d be interested if anyone on the list has some =
thoughts. Could host it
outside of openbmc and just pull in via a recipe.

I=E2=80=99d entertain a subdirectory in phosphor-state-manager with this =
small
app (to host the interface you=E2=80=99ll want a c++ app) and service to =
run it.
We could just enable it via a meson/compile flag. It seems like it could
be fairly generic and something that other system owners could utilize.

Please take a look at =
https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-namin=
g.md
We=E2=80=99d want the GPIO utilized here to have a standard name so =
others
could potentially make use of this logic.

Andrew

>=20
>=20
> Thanks,
>=20
> Thang Q. Nguyen
>=20
> On 08/09/2021 20:19, Thu Nguyen wrote:
>> Dear Geissonator,
>>=20
>>=20
>> After commit =
https://github.com/openbmc/phosphor-state-manager/commit/0d1c3f1f9329c8536=
77f0581287afef83eeea0f0
>>=20
>> when BMC boots up, phosphor-host-state directly checks  the host =
state thru interface xyz.openbmc_project.Condition.HostFirmware.
>>=20
>> It does not check the existing of /run/openbmc/host@%d-on as before.
>>=20
>>=20
>> I plan to implement "oem mechanism" to handle the interface =
xyz.openbmc_project.Condition.HostFirmware.
>>=20
>> Which will use the GPIO interface to update the host state. I =
researched the code handle this interface in phosphor-host-ipmi and =
pldm.
>>=20
>> I wonder which repo should I upstream the code? Currently, we don't =
have any OEM repo in github to upstream the code.
>>=20
>> Do you have any idea to handle interface in bash scripts?
>>=20
>>=20
>> Regards.
>>=20
>> Thu Nguyen.
>>=20
>>=20
>>=20
>>=20
>>=20
>>=20
>>=20

