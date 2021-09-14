Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5106040BA10
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 23:17:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8GPx1s24z2yQH
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 07:17:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bdPCNNSs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::329;
 helo=mail-ot1-x329.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=bdPCNNSs; dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8GPS5xbMz2yJh
 for <openbmc@lists.ozlabs.org>; Wed, 15 Sep 2021 07:16:42 +1000 (AEST)
Received: by mail-ot1-x329.google.com with SMTP id
 c8-20020a9d6c88000000b00517cd06302dso464271otr.13
 for <openbmc@lists.ozlabs.org>; Tue, 14 Sep 2021 14:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=onS3YJ0yAJpkU3JcMB06z6plQuufsm+bc8UmR38qd0Q=;
 b=bdPCNNSswN63SRM0Nb0FfP7/CPwbFQEUPViFjPMz5v9+ME/cCL6ZrHSbMgRY+rQ0UO
 cLG1ibcIx2Qgeu/S3F3WfONgBAActPQ/qkWyX6MQ2I+TmNQV3hlGRuGfTJWbJw5TIIEH
 23Ri3gvyxEMVavkAjddi0/aVG4xefeFShbbwxcKKatcSic2YFIt1u5EWrPx66FNUXcVG
 dgxDPoFJdIpwMn2N1rT6p4BakuEOI3NC63gvpivT28vca8UbE6yWG8rqLaQyEXnurVTY
 1e09dhdWOL4XcdRcNAc5A6HsxGJrQaEtVWwQMyK9GxqkOrTjpotoZaEUkFU+anJ/E8Cj
 U/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=onS3YJ0yAJpkU3JcMB06z6plQuufsm+bc8UmR38qd0Q=;
 b=t/9PnLYiqRxtt9oRy+sCGv3TG3y87TPV1fG/10F+u17ATx+g7fgkiTRHsAu46dQRSM
 Cf84wqK+1OCnvHLYaB99wHucN+sgSghIXc5UP/TBYfAAYcSltqNcfSHpfKnF+mckjuCV
 U9DJ/YwebkIMaoMi/Omb93Z5wzmw5bpt0tvsOJR4MlI9N5U0tXAcpfRv6eSiLkeAiA4T
 2M/8cKndoYvYC47t0oRjnEENbnr2PLbTvSttzwIJd1I+zCo4B+iX3tHYSjJYNYLCgpOB
 lFN1BgJcq0CwL+9C9QcI4MjtFQCxOJNQ+xW5++cOrYuwemj8Yl+2Xt9RE4EYGyacFdJy
 nhXA==
X-Gm-Message-State: AOAM530bROBIBnSeKK7wj3mN1dnLlpdaBC46P/aSo+aQHsJYdWZ9OAqT
 VOLuB8Z36ObQdNqA/TMfrxE=
X-Google-Smtp-Source: ABdhPJx2d5ck8UFKNvDOepuP2UcXZXru2W659sXwR7WhN+jNAVJm/D4anL5wFGhui2znkpxSWQsSkQ==
X-Received: by 2002:a05:6830:2146:: with SMTP id
 r6mr16875744otd.1.1631654198035; 
 Tue, 14 Sep 2021 14:16:38 -0700 (PDT)
Received: from smtpclient.apple ([2600:1700:19e0:3310:f179:5930:e8b0:eb2f])
 by smtp.gmail.com with ESMTPSA id 8sm2652516oix.7.2021.09.14.14.16.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Sep 2021 14:16:37 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: Implement OEM mechanism to handle
 xyz.openbmc_project.Condition.HostFirmware interface
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <2c0e3f43-f861-8300-7743-03ba47be0955@amperemail.onmicrosoft.com>
Date: Tue, 14 Sep 2021 16:16:36 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <F2B37256-0B6D-4F3F-9989-B5796C94994F@gmail.com>
References: <53e204da-0c8b-d161-a065-a6195550d7f7@amperemail.onmicrosoft.com>
 <3909e9e3-0a58-e542-a004-89278438997d@amperemail.onmicrosoft.com>
 <07A6A378-47F6-4805-ABFD-D216F4D4C8FE@gmail.com>
 <5429fce9-d715-51a1-5e8d-61b3bd434a23@amperemail.onmicrosoft.com>
 <9990E419-23C1-4288-9D1A-07A1AA40C502@gmail.com>
 <2c0e3f43-f861-8300-7743-03ba47be0955@amperemail.onmicrosoft.com>
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



> On Sep 10, 2021, at 10:07 PM, Thu Nguyen =
<thu@amperemail.onmicrosoft.com> wrote:
>=20
> Hi Andrew,
>=20
> Please see my comments.
>=20
> Thanks.
>=20
> Thu Nguyen.
>=20
> On 11/09/2021 04:57, Andrew Geissler wrote:
>>=20
>>> On Sep 10, 2021, at 6:34 AM, Thu Nguyen =
<thu@amperemail.onmicrosoft.com> wrote:
>>>=20
>>> Hi Andrew,
>>>=20
>>>=20
>>> Please see my comments:
>>>=20
>>>=20
>>> Thanks.
>>>=20
>>> Thu Nguyen.
>>>=20
>>> On 09/09/2021 22:42, Andrew Geissler wrote:
>>>>> On Sep 8, 2021, at 8:54 PM, Thang Nguyen =
<thang@amperemail.onmicrosoft.com> wrote:
>>>>>=20
>>>>> Hi,
>>>>>=20
>>>>> Let me explain more detail about our cases:
>>>>>=20
>>>>> - Our system uses a GPIO called FW_BOOT_OK to detect if the Host =
is currently ON or OFF. The Host firmware set this GPIO when the first =
core initialized.
>>>>>=20
>>>>> - We have no problem in Host State with power control. But the =
problem is in the case of BMC rebooted while the Host is ON.
>>>>>=20
>>>>> - Before the commit =
https://github.com/openbmc/phosphor-state-manager/commit/0d1c3f1f9329c8536=
77f0581287afef83eeea0f0, phosphor-reset-host-check@.service  is used to =
check and update Host State in case of BMC rebooted. But after that =
commit, the service file was removed. This makes no target service to =
update the Host State and the host check is fail at =
https://github.com/openbmc/phosphor-state-manager/blob/0a675215d6a6d2eb13e=
030ba0f618a4691de58d4/host_check.cpp#L109.
>>>>>=20
>>>>> We would like to ask for your idea on how should we implement for =
the Host check when BMC is rebooted?
>>>> Hi Thang. Yeah, the reason for moving the logic directly into =
phosphor-host-state
>>>> is we had a window where the host state would say off (default) =
even when the
>>>> host was actually on. The other service would run and update it to =
the correct
>>>> value but there was a window where external clients would see an =
incorrect
>>>> state. So since we don=E2=80=99t want to report an invalid state, I =
needed the logic
>>>> within the app itself on startup.
>>>>=20
>>>> I think you=E2=80=99re on the right path here. The design is to =
implement the
>>>> xyz.openbmc_project.Condition.HostFirmware object and support the =
read
>>>> of the CurrentFirmwareCondition property. Based on your GPIO state, =
you=E2=80=99d
>>>> respond accordingly to the read. That way the state-manager code =
will just
>>>> work as-is.
>>>>=20
>>>> On where to put this code=E2=80=A6 So far we=E2=80=99ve put it in =
the area that is doing the logic,
>>>> like PLDM and IPMI. Since this is really just a GPIO read, I=E2=80=99=
m not sure the best
>>>> place. I=E2=80=99d be interested if anyone on the list has some =
thoughts. Could host it
>>>> outside of openbmc and just pull in via a recipe.
>>>>=20
>>>> I=E2=80=99d entertain a subdirectory in phosphor-state-manager with =
this small
>>>> app (to host the interface you=E2=80=99ll want a c++ app) and =
service to run it.
>>>> We could just enable it via a meson/compile flag. It seems like it =
could
>>>> be fairly generic and something that other system owners could =
utilize.
>>> So you mean we can add the code in subdirectory in =
phosphor-state-manager code.
>> Yes
>>=20
>>> And the code have to generic enough to be reused in others systems =
and should include compile flag to enable/disable it.
>> Yes. We=E2=80=99ll just treat it as a sub-package within the =
state-manager bitbake recipe
>> and users can pull it in if they want it.
>>=20
>>> This code will response the host state base on the GPIO pins status.
>>>=20
>>>> Please take a look at =
https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-namin=
g.md
>>>> We=E2=80=99d want the GPIO utilized here to have a standard name so =
others
>>>> could potentially make use of this logic.
>>> In the specs, I don't see any sections mention about the host GPIOs.
>> I was hoping you could name the GPIO=E2=80=99s in the dts so they =
could be generic
>> and then others who want to make use of your function could just use =
the
>> same names in their dts.
>>=20
>> So you=E2=80=99d make a proposed change to that document. A new =
=E2=80=9CHost Status=E2=80=9D
>> section. Something like host0-status, host1-status, =E2=80=A6
>=20
> If we use the dts definition, we will be limited by the number of GPIO =
pins which are used to
> identify the host state and also their polarities.

This confuses me a bit. A device tree (dts) is machine specific file in
the kernel which represents your system. You can have as many GPIO=E2=80=99=
s
defined as you have in your system.

>=20
> Because the GPIOs polarities are depended on the platform which =
designed by hardware team.
> We can't ask them to fix the GPIOs polarities, I think.

Digging a bit further, the dts allows you to define GPIO=E2=80=99s as =
ACTIVE_HIGH or=20
ACTIVE_LOW, I think you can just utilize this to ensure uniformity on =
reading
them and knowing if the host is running or not.

This way userspace just uses libgpiod to look for the appropriate GPIO
using a standard name, and returns the on/off based on the reading.

>=20
>>=20
>> Then ideally we could avoid the need for the json file below and the =
code
>> just looks for the GPIO=E2=80=99s using libgpiod. Although if they =
really can have
>> different polarities, that may be an issue.
>>=20
> Yes. That is why I suggest the GPIOs setting.
>>> So I think I will use the GPIO configuration file host_gpios.json =
with below format.
>>>=20
>>> {
>>>   "host_state":{
>>>     "host_0":[
>>>       {
>>>         "KEY": 48,
>>>         "Polarity": "High"
>>>       },
>>>       {
>>>         "KEY": 49,
>>>         "Polarity": "Low"
>>>       }
>>>     ],
>>>     "host_1":[
>>>       {
>>>         "KEY": 202,
>>>         "Polarity": "Low"
>>>       },
>>>       {
>>>         "KEY": 203,
>>>         "Polarity": "High"
>>>       }
>>>     ]
>>>   }
>>> }
>>>=20
>>> The host_state fields will contain the GPIO settings to verify the =
running state of the hosts.
>>>=20
>>> I will support multi-host setting. For each host, I will also =
support identify the host state thru one or some GPIO pin status.
>>>=20
>>>> Andrew
>>>>=20
>>>>> Thanks,
>>>>>=20
>>>>> Thang Q. Nguyen
>>>>>=20
>>>>> On 08/09/2021 20:19, Thu Nguyen wrote:
>>>>>> Dear Geissonator,
>>>>>>=20
>>>>>>=20
>>>>>> After commit =
https://github.com/openbmc/phosphor-state-manager/commit/0d1c3f1f9329c8536=
77f0581287afef83eeea0f0
>>>>>>=20
>>>>>> when BMC boots up, phosphor-host-state directly checks  the host =
state thru interface xyz.openbmc_project.Condition.HostFirmware.
>>>>>>=20
>>>>>> It does not check the existing of /run/openbmc/host@%d-on as =
before.
>>>>>>=20
>>>>>>=20
>>>>>> I plan to implement "oem mechanism" to handle the interface =
xyz.openbmc_project.Condition.HostFirmware.
>>>>>>=20
>>>>>> Which will use the GPIO interface to update the host state. I =
researched the code handle this interface in phosphor-host-ipmi and =
pldm.
>>>>>>=20
>>>>>> I wonder which repo should I upstream the code? Currently, we =
don't have any OEM repo in github to upstream the code.
>>>>>>=20
>>>>>> Do you have any idea to handle interface in bash scripts?
>>>>>>=20
>>>>>>=20
>>>>>> Regards.
>>>>>>=20
>>>>>> Thu Nguyen.

