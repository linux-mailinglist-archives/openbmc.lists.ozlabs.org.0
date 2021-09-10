Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAA7407324
	for <lists+openbmc@lfdr.de>; Fri, 10 Sep 2021 23:57:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5qVS1k3Qz2ymZ
	for <lists+openbmc@lfdr.de>; Sat, 11 Sep 2021 07:57:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=C3pZfeNw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::330;
 helo=mail-ot1-x330.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=C3pZfeNw; dkim-atps=neutral
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5qTy6nDCz2xX8
 for <openbmc@lists.ozlabs.org>; Sat, 11 Sep 2021 07:57:09 +1000 (AEST)
Received: by mail-ot1-x330.google.com with SMTP id
 m7-20020a9d4c87000000b0051875f56b95so4190849otf.6
 for <openbmc@lists.ozlabs.org>; Fri, 10 Sep 2021 14:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=leXi6ACkoZoKuFLRi0FKLuCV3THsDNu8YrLrsa+D0tw=;
 b=C3pZfeNwYELPnl1KWYGNrfeHHhIirqles73HQlDwuwPk9VjumkyBFKvuCdpcZzXCGH
 4XzMI06rq5NRhiMLAvMvpBOIIQqaHFd5mUmTakI+yVdl1XvrxvRHy1fk+7/GAPiQbZ/a
 dWjjQan3wsdDwKxSSdE5dOvEY9CKIGOs9sb0gGDJMmufRfg/z7oX+Uja086dfNfx3VEJ
 7i1/hbNb1uyCRSj/oxzdmB6fcziNqr8Hs8jRJ6S+ZObLcEzNvFu195OBBX0wJDbAwTYA
 ZFbnPMmTpRYEyvsq2eSG+q2LbYyp+UbVcohAQaGvrgUjxe0rQ1UbEP2yEsR94UrdVZix
 2sxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=leXi6ACkoZoKuFLRi0FKLuCV3THsDNu8YrLrsa+D0tw=;
 b=dvsGJ7A2kgi9jmnJAAx4FBFP1yxAwUVpDnonBdTbMBGWUHi7umEHWs6/VuiIudTYQL
 LSNHlAU06xh+v13/kdThH2olMxbr2mDcUYLr9pkaOz1qn4tsryPUs1FE8g8ze/p+CQvS
 8st7gn+K4xyowk1d6Bbgtm0/OiJSr47B1+xr/Of3j2EeJOsSQFHoUnSSPt2FXj7Ijb4f
 O441y2KJj7VY6Voj62IAFFcKdHpINfYYZeNVShzK5gDPYe3oxObFlhKGvv92BNMcbvjR
 moNdwACpwhvhtgXQXanvgHyKyxN2ySqv6qlyJx8RAm6bJcxbXHVj7TWCFEsXaT/4G/KX
 Zxkg==
X-Gm-Message-State: AOAM531I53z8uMKH3oRG6BOZFfqVwGnDWJz6EuVt0vIkPnTc9Zz8C1Dy
 xx/lZ+o8gVeGt54m/xDu/wDwP4AutVwbHg==
X-Google-Smtp-Source: ABdhPJwYlHc622mVzteB6kvLQfSqdGgW65WXojyg1QJjhbkgVQr2zTe/yvNgkXZBCCmVgr1fNGmjyQ==
X-Received: by 2002:a05:6830:1443:: with SMTP id
 w3mr6552086otp.49.1631311026699; 
 Fri, 10 Sep 2021 14:57:06 -0700 (PDT)
Received: from smtpclient.apple ([2600:1700:19e0:3310:6978:52f4:4775:56af])
 by smtp.gmail.com with ESMTPSA id q5sm1405259ooa.1.2021.09.10.14.57.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Sep 2021 14:57:05 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: Implement OEM mechanism to handle
 xyz.openbmc_project.Condition.HostFirmware interface
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <5429fce9-d715-51a1-5e8d-61b3bd434a23@amperemail.onmicrosoft.com>
Date: Fri, 10 Sep 2021 16:57:04 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <9990E419-23C1-4288-9D1A-07A1AA40C502@gmail.com>
References: <53e204da-0c8b-d161-a065-a6195550d7f7@amperemail.onmicrosoft.com>
 <3909e9e3-0a58-e542-a004-89278438997d@amperemail.onmicrosoft.com>
 <07A6A378-47F6-4805-ABFD-D216F4D4C8FE@gmail.com>
 <5429fce9-d715-51a1-5e8d-61b3bd434a23@amperemail.onmicrosoft.com>
To: Thu Nguyen <thu@amperemail.onmicrosoft.com>
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
Cc: openbmc@lists.ozlabs.org, Thang Nguyen <thang@amperemail.onmicrosoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Sep 10, 2021, at 6:34 AM, Thu Nguyen =
<thu@amperemail.onmicrosoft.com> wrote:
>=20
> Hi Andrew,
>=20
>=20
> Please see my comments:
>=20
>=20
> Thanks.
>=20
> Thu Nguyen.
>=20
> On 09/09/2021 22:42, Andrew Geissler wrote:
>>=20
>>> On Sep 8, 2021, at 8:54 PM, Thang Nguyen =
<thang@amperemail.onmicrosoft.com> wrote:
>>>=20
>>> Hi,
>>>=20
>>> Let me explain more detail about our cases:
>>>=20
>>> - Our system uses a GPIO called FW_BOOT_OK to detect if the Host is =
currently ON or OFF. The Host firmware set this GPIO when the first core =
initialized.
>>>=20
>>> - We have no problem in Host State with power control. But the =
problem is in the case of BMC rebooted while the Host is ON.
>>>=20
>>> - Before the commit =
https://github.com/openbmc/phosphor-state-manager/commit/0d1c3f1f9329c8536=
77f0581287afef83eeea0f0, phosphor-reset-host-check@.service  is used to =
check and update Host State in case of BMC rebooted. But after that =
commit, the service file was removed. This makes no target service to =
update the Host State and the host check is fail at =
https://github.com/openbmc/phosphor-state-manager/blob/0a675215d6a6d2eb13e=
030ba0f618a4691de58d4/host_check.cpp#L109.
>>>=20
>>> We would like to ask for your idea on how should we implement for =
the Host check when BMC is rebooted?
>> Hi Thang. Yeah, the reason for moving the logic directly into =
phosphor-host-state
>> is we had a window where the host state would say off (default) even =
when the
>> host was actually on. The other service would run and update it to =
the correct
>> value but there was a window where external clients would see an =
incorrect
>> state. So since we don=E2=80=99t want to report an invalid state, I =
needed the logic
>> within the app itself on startup.
>>=20
>> I think you=E2=80=99re on the right path here. The design is to =
implement the
>> xyz.openbmc_project.Condition.HostFirmware object and support the =
read
>> of the CurrentFirmwareCondition property. Based on your GPIO state, =
you=E2=80=99d
>> respond accordingly to the read. That way the state-manager code will =
just
>> work as-is.
>>=20
>> On where to put this code=E2=80=A6 So far we=E2=80=99ve put it in the =
area that is doing the logic,
>> like PLDM and IPMI. Since this is really just a GPIO read, I=E2=80=99m =
not sure the best
>> place. I=E2=80=99d be interested if anyone on the list has some =
thoughts. Could host it
>> outside of openbmc and just pull in via a recipe.
>>=20
>> I=E2=80=99d entertain a subdirectory in phosphor-state-manager with =
this small
>> app (to host the interface you=E2=80=99ll want a c++ app) and service =
to run it.
>> We could just enable it via a meson/compile flag. It seems like it =
could
>> be fairly generic and something that other system owners could =
utilize.
>=20
> So you mean we can add the code in subdirectory in =
phosphor-state-manager code.

Yes

> And the code have to generic enough to be reused in others systems and =
should include compile flag to enable/disable it.

Yes. We=E2=80=99ll just treat it as a sub-package within the =
state-manager bitbake recipe
and users can pull it in if they want it.

>=20
> This code will response the host state base on the GPIO pins status.
>=20
>>=20
>> Please take a look at =
https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-namin=
g.md
>> We=E2=80=99d want the GPIO utilized here to have a standard name so =
others
>> could potentially make use of this logic.
>=20
> In the specs, I don't see any sections mention about the host GPIOs.

I was hoping you could name the GPIO=E2=80=99s in the dts so they could =
be generic
and then others who want to make use of your function could just use the
same names in their dts.

So you=E2=80=99d make a proposed change to that document. A new =E2=80=9CH=
ost Status=E2=80=9D
section. Something like host0-status, host1-status, =E2=80=A6

Then ideally we could avoid the need for the json file below and the =
code
just looks for the GPIO=E2=80=99s using libgpiod. Although if they =
really can have
different polarities, that may be an issue.

>=20
> So I think I will use the GPIO configuration file host_gpios.json with =
below format.
>=20
> {
>   "host_state":{
>     "host_0":[
>       {
>         "KEY": 48,
>         "Polarity": "High"
>       },
>       {
>         "KEY": 49,
>         "Polarity": "Low"
>       }
>     ],
>     "host_1":[
>       {
>         "KEY": 202,
>         "Polarity": "Low"
>       },
>       {
>         "KEY": 203,
>         "Polarity": "High"
>       }
>     ]
>   }
> }
>=20
> The host_state fields will contain the GPIO settings to verify the =
running state of the hosts.
>=20
> I will support multi-host setting. For each host, I will also support =
identify the host state thru one or some GPIO pin status.
>=20
>>=20
>> Andrew
>>=20
>>>=20
>>> Thanks,
>>>=20
>>> Thang Q. Nguyen
>>>=20
>>> On 08/09/2021 20:19, Thu Nguyen wrote:
>>>> Dear Geissonator,
>>>>=20
>>>>=20
>>>> After commit =
https://github.com/openbmc/phosphor-state-manager/commit/0d1c3f1f9329c8536=
77f0581287afef83eeea0f0
>>>>=20
>>>> when BMC boots up, phosphor-host-state directly checks  the host =
state thru interface xyz.openbmc_project.Condition.HostFirmware.
>>>>=20
>>>> It does not check the existing of /run/openbmc/host@%d-on as =
before.
>>>>=20
>>>>=20
>>>> I plan to implement "oem mechanism" to handle the interface =
xyz.openbmc_project.Condition.HostFirmware.
>>>>=20
>>>> Which will use the GPIO interface to update the host state. I =
researched the code handle this interface in phosphor-host-ipmi and =
pldm.
>>>>=20
>>>> I wonder which repo should I upstream the code? Currently, we don't =
have any OEM repo in github to upstream the code.
>>>>=20
>>>> Do you have any idea to handle interface in bash scripts?
>>>>=20
>>>>=20
>>>> Regards.
>>>>=20
>>>> Thu Nguyen.
>>>>=20
>>>>=20
>>>>=20
>>>>=20
>>>>=20
>>>>=20
>>>>=20

