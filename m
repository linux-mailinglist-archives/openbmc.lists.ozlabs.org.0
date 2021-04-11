Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D65B35B222
	for <lists+openbmc@lfdr.de>; Sun, 11 Apr 2021 09:18:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJ3B81vt5z3bpr
	for <lists+openbmc@lfdr.de>; Sun, 11 Apr 2021 17:18:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=I65W1SWi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::32e;
 helo=mail-ot1-x32e.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=I65W1SWi; dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJ39w1Mvrz301J
 for <openbmc@lists.ozlabs.org>; Sun, 11 Apr 2021 17:18:09 +1000 (AEST)
Received: by mail-ot1-x32e.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so9803463otk.5
 for <openbmc@lists.ozlabs.org>; Sun, 11 Apr 2021 00:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ExAJh0Fwebd2m6AU+kxxJAykogf6uw97vrXjyPyCi8Q=;
 b=I65W1SWiAtr67fUduUjeU/mD+451E/bvDbeg61gUiazZ0zArqvDYs5Qa4C2s7+8AXo
 fODwEDIto/LDUCkOhzwL2AJjfSowkeeNKeQp2tDXgmPGKtLFX0pXS2kPS+3yzE7OvDsI
 VB2jkimRT5CnrBXubAsR5zMRxF0R2KbobKmkfqiNXaYMieQPy2Wc05C9awP2o3dG5k8q
 QsfCTkBIDBpREdN2i1MvQBrjv7y3e+VuKsEi7T/Udsa0atyJeGnhs+UewwAjRVNJ3KF/
 F01JHHxmR9J1NuGmpoqlN5KVbq6wquUFcyj9pECazu32+i/yaiiyWUXHEDW+qeHeSivn
 JkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ExAJh0Fwebd2m6AU+kxxJAykogf6uw97vrXjyPyCi8Q=;
 b=shl40ecdwOaal2MQOYF4Qayg1TazJW/fuUvL0dUzj8RTYWeOpXUitwkZB0cZUu3r/A
 ax8R6MTcWM5ZgrX4QpRkNeLimXa4FqEj0vGRaALF0B62sZrwadMyIjt4g/TdgzIgmdSl
 0loQfLJeCJDaHUk9vzcCeKh6DRTihhpfbB1DmwotUDnKIgsh8r7SX16cvalWN75G8e6V
 3e7rHlV8oAYZuTm29PhZcEvmAyimBNyNJKiQ0c+ZGPj6ZnF4g5UNbmIjgehtJ2GYCNux
 OBWr7xIXWlA7YiB+MTEskBeqrroEf/0ns5z75SN3ZwyNCGX/wrj2glaGP57F8ULA/mkR
 fghQ==
X-Gm-Message-State: AOAM533DXwPyf1Z82RWM4Zad/u8lnxRIwSFqo3F0XSm5kGlamKZlayq1
 JtXrts1dIvhlA9EaOd+nHTjwRycKcf/+FtUf+yCEEQ==
X-Google-Smtp-Source: ABdhPJzHoB1J+9KNYF2OrVbo3khkkcd/KT00R6jhidAKa3HfqQ6yi57EPiwxBFooviUMyY3JHGHQT2xBUYZU1J+glVY=
X-Received: by 2002:a05:6830:1644:: with SMTP id
 h4mr19630332otr.349.1618125486151; 
 Sun, 11 Apr 2021 00:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAEMunhAZTchE56EGZAa9JbHBUTUaAigKgM4MvNr3MCcB=pm-QA@mail.gmail.com>
 <CADCscQn2Rxr9RaUwASrRMOjHkQshSkdRjqHp1RfKX5TySM3zsA@mail.gmail.com>
 <CAEMunhBko-7HgB455GX5898jznc0SoKVe=PB0n8ye-O=9Ytwrg@mail.gmail.com>
 <CAEMunhBb2GK1UC__cYZcyhYEm8cn9gKgqSDTtXsgfOWAyV+Wpw@mail.gmail.com>
In-Reply-To: <CAEMunhBb2GK1UC__cYZcyhYEm8cn9gKgqSDTtXsgfOWAyV+Wpw@mail.gmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Sun, 11 Apr 2021 15:17:55 +0800
Message-ID: <CAGm54UEEF+AY51A7h6BHMFMv2Kde4eb=57LcoXmcE+M25quPkA@mail.gmail.com>
Subject: Re: [External] Re: how to add a new user using ipmitool
To: sandeep sharma <sandeepajesh@gmail.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Tom Joseph <rushtotom@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

We had an issue that the HOME directory for the users could not be
moved, probably due to the overlayfs.
The issue could be workarounded by not creating HOME and use /tmp instead.

It's a minor change in user_mgr.cpp in phosphor-user-manager, that
changes the arguments passed to `useradd` and `usermod`.
It's just a workaround so we did not send the patch upstream.

On Thu, Apr 8, 2021 at 2:08 PM sandeep sharma <sandeepajesh@gmail.com> wrot=
e:
>
> Can some experts help us here?
>
> On Tue, Apr 6, 2021 at 10:38 PM sandeep sharma <sandeepajesh@gmail.com> w=
rote:
>>
>> Thanks Tom,
>>
>> I tried to execute these commands but no success. Looks like I am missin=
g something related to IPMI functionality .
>> To debug it further I added ipmitool into openBMC build and tried to exe=
cute IPMI commands from the openbmc shell. But except for 0x6 0x1, 0x06 0x2=
 & 0x6 0x03 other commands are not working. Debug logs below. Any inputs ar=
e much appreciated.
>> .
>>
>> root@cn81xx-obmc:~# systemctl | grep -i "ipmi"
>>   phosphor-ipmi-host.service                                            =
                                                 loaded active     running =
        Phosphor Inband IPMI
>>   phosphor-ipmi-kcs@ipmi-kcs3.service                                   =
                                                 loaded active     running =
        Phosphor IPMI KCS DBus Bridge
>>   phosphor-ipmi-net@eth0.service                                        =
                                                 loaded active     running =
        Network IPMI daemon
>>   xyz.openbmc_project.Logging.IPMI.service                              =
                                                 loaded active     running =
        IPMI SEL Logging Service
>>   system-phosphor\x2dipmi\x2dkcs.slice                                  =
                                                 loaded active     active  =
        system-phosphor\x2dipmi\x2dkcs.slice
>>   system-phosphor\x2dipmi\x2dnet.slice                                  =
                                                 loaded active     active  =
        system-phosphor\x2dipmi\x2dnet.slice
>>   phosphor-ipmi-net@eth0.socket                                         =
                                                 loaded active     running =
        phosphor-ipmi-net@eth0.socket
>> root@cn81xx-obmc:~#
>>
>> root@cn81xx-obmc:~# ipmitool raw 0x6 0x1
>>  00 00 80 00 02 00 f7 04 00 00 00 00 00 00 00
>> root@cn81xx-obmc:~# ipmitool raw 0x6 0x25
>> Unable to send RAW command (channel=3D0x0 netfn=3D0x6 lun=3D0x0 cmd=3D0x=
25 rsp=3D0xff): Unspecified error
>> root@cn81xx-obmc:~# ipmitool raw 0x6 0x25 -vvvvv
>> Loading IANA PEN Registry...
>>   Allocating     29 entries
>>   [    27] 16777214 | A Debug Assisting Company, Ltd.
>>   [    26]    52538 | Ampere Computing
>>   [    25]    51974 | Raptor Computing Systems, LLC
>>   [    24]    49769 | YADRO
>>   [    23]    49150 | Vertiv Co
>>   [    22]    48512 | Inspur Group Co.,Ltd.
>>   [    21]    48482 | Linaro Ltd
>>   [    20]    45065 | Insyde
>>   [    19]    40981 | Facebook, Inc.
>>   [    18]    40092 | Wiwynn Corporation
>>   [    17]    33049 | Mellanox Technologies LTD
>>   [    16]    20974 | American Megatrends, Inc
>>   [    15]    19046 | Lenovo Enterprise Business Group
>>   [    14]    11183 | Mitac International Corp.
>>   [    13]    11129 | Google, Inc.
>>   [    12]     8554 | Departement Elektrotechnik, ETH Zuerich
>>   [    11]     7244 | Quanta Computer Inc.
>>   [    10]     6569 | INVENTEC CORPORATION
>>   [     9]     4128 | ARM Ltd.
>>   [     8]     2487 | Phoenix Technologies Ltd.
>>   [     7]     1694 | HCL Technologies Limited
>>   [     6]     1271 | Ciena Corporation
>>   [     5]      674 | Dell Inc.
>>   [     4]      343 | Intel Corporation
>>   [     3]        2 | IBM (https://w3.ibm.com/standards )
>>   [     2]        0 | Reserved
>>   [     1]  1048575 | Unspecified
>>   [     0]        0 | Unknown
>> Running Get PICMG Properties my_addr 0x20, transit 0, target 0
>> Error response 0xc1 from Get PICMG Properties
>> Running Get VSO Capabilities my_addr 0x20, transit 0, target 0
>> Invalid completion code received: Invalid command
>> Acquire IPMB address
>> Discovered IPMB address 0x0
>> Interface address: my_addr 0x20 transit 0:0 target 0x20:0 ipmb_target 0
>>
>> RAW REQ (channel=3D0x0 netfn=3D0x6 lun=3D0x0 cmd=3D0x25 data_len=3D0)
>> Unable to send RAW command (channel=3D0x0 netfn=3D0x6 lun=3D0x0 cmd=3D0x=
25 rsp=3D0xff): Unspecified error
>> root@cn81xx-obmc:~#
>>
>> root@cn81xx-obmc:~# ipmitool channel info 1
>> Channel 0x1 info:
>>   Channel Medium Type   : 802.3 LAN
>>   Channel Protocol Type : IPMB-1.0
>>   Session Support       : multi-session
>>   Active Session Count  : 0
>>   Protocol Vendor ID    : 7154
>>   Volatile(active) Settings
>>     Alerting            : enabled
>>     Per-message Auth    : enabled
>>     User Level Auth     : enabled
>>     Access Mode         : always available
>>   Non-Volatile Settings
>>     Alerting            : enabled
>>     Per-message Auth    : enabled
>>     User Level Auth     : enabled
>>     Access Mode         : always available
>> root@cn81xx-obmc:~#
>>
>> root@cn81xx-obmc:~# ipmitool user list 1
>> ID  Name     Callin  Link Auth IPMI Msg   Channel Priv Limit
>> 1   root             false   true       true       ADMINISTRATOR
>> 2                    true    false      false      NO ACCESS
>> 3                    true    false      false      NO ACCESS
>> 4                    true    false      false      NO ACCESS
>> 5                    true    false      false      NO ACCESS
>> 6                    true    false      false      NO ACCESS
>> 7                    true    false      false      NO ACCESS
>> 8                    true    false      false      NO ACCESS
>> 9                    true    false      false      NO ACCESS
>> 10                   true    false      false      NO ACCESS
>> 11                   true    false      false      NO ACCESS
>> 12                   true    false      false      NO ACCESS
>> 13                   true    false      false      NO ACCESS
>> 14                   true    false      false      NO ACCESS
>> 15                   true    false      false      NO ACCESS
>> root@cn81xx-obmc:~# ipmitool user summary 1
>> Maximum IDs    : 15
>> Enabled User Count  : 1
>> Fixed Name Count    : 0
>> root@cn81xx-obmc:~#
>>
>> root@cn81xx-obmc:~# ipmitool -I dbus user set name 2 newuser
>> Set User Name command failed (user 2, name newuser): Unspecified error
>> root@cn81xx-obmc:~#
>>
>> thx
>> sandeep S
>>
>> On Tue, Apr 6, 2021 at 7:38 PM Tom Joseph <rushtotom@gmail.com> wrote:
>>>
>>> docs/IPMITOOL-cheatsheet.md at master =C2=B7 openbmc/docs (github.com)
>>>
>>> On Mon, Apr 5, 2021 at 11:17 PM sandeep sharma <sandeepajesh@gmail.com>=
 wrote:
>>>>
>>>> We are working on a prototype based on ast2600  and can someone please=
 help me with commands to create a user using ipmitool in openbmc? Is there=
 any link which I can refer for all commands related to ipmi?
>>>>
>>>> Steps I have tried:-
>>>> root@cn81xx-obmc:~# ipmitool user summary 1
>>>> Maximum IDs    : 15
>>>> Enabled User Count  : 1
>>>> Fixed Name Count    : 0
>>>> root@cn81xx-obmc:~# ipmitool user list 1
>>>> ID  Name     Callin  Link Auth IPMI Msg   Channel Priv Limit
>>>> 1   root             false   true       true       ADMINISTRATOR
>>>> 2                    true    false      false      NO ACCESS
>>>> 3                    true    false      false      NO ACCESS
>>>> 4                    true    false      false      NO ACCESS
>>>> 5                    true    false      false      NO ACCESS
>>>> 6                    true    false      false      NO ACCESS
>>>> 7                    true    false      false      NO ACCESS
>>>> 8                    true    false      false      NO ACCESS
>>>> 9                    true    false      false      NO ACCESS
>>>> 10                   true    false      false      NO ACCESS
>>>> 11                   true    false      false      NO ACCESS
>>>> 12                   true    false      false      NO ACCESS
>>>> 13                   true    false      false      NO ACCESS
>>>> 14                   true    false      false      NO ACCESS
>>>> 15                   true    false      false      NO ACCESS
>>>> root@cn81xx-obmc:~# ipmitool user set name 2 newuser
>>>> Set User Name command failed (user 2, name newuser): Unspecified error
>>>> root@cn81xx-obmc:~# ipmitool user set name 2 newuser -vv
>>>> Loading IANA PEN Registry...
>>>> Running Get PICMG Properties my_addr 0x20, transit 0, target 0
>>>> Error response 0xc1 from Get PICMG Properties
>>>> Running Get VSO Capabilities my_addr 0x20, transit 0, target 0
>>>> Invalid completion code received: Invalid command
>>>> Acquire IPMB address
>>>> Discovered IPMB address 0x0
>>>> Interface address: my_addr 0x20 transit 0:0 target 0x20:0 ipmb_target =
0
>>>>
>>>> Set User Name command failed (user 2, name newuser): Unspecified error
>>>> root@cn81xx-obmc:~#
>>>>
>>>> --
>>>> Thx-
>>>> Sandeep S
>>
>>
>>
>> --
>> Thx-
>> Sandeep S
>
>
>
> --
> Thx-
> Sandeep S



--=20
BRs,
Lei YU
