Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A79355A06
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 19:09:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFDXJ0DGfz302W
	for <lists+openbmc@lfdr.de>; Wed,  7 Apr 2021 03:09:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=CdjmXjlm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b31;
 helo=mail-yb1-xb31.google.com; envelope-from=sandeepajesh@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CdjmXjlm; dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFDX24kYzz2yhK
 for <openbmc@lists.ozlabs.org>; Wed,  7 Apr 2021 03:09:05 +1000 (AEST)
Received: by mail-yb1-xb31.google.com with SMTP id l9so2667919ybm.0
 for <openbmc@lists.ozlabs.org>; Tue, 06 Apr 2021 10:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C/S5/jmSYzB5e7NSIseQzjZBmBXsdNpgqSpR/qaP5hk=;
 b=CdjmXjlmfN5V0X7AJhzmcEDh3sKzZza/MUKP7Pji+y1b9AV3EJlcJojWGEGMc1VYPZ
 pE0MElZXgdgko5curHAAQ+foNsvtXS8tBuc9xIGC2NZ8Rp7NrqPrc2f+vsXalRZFSDsm
 SpdBwUltM9QP6zuIiv194auDQJrrEBCChq+zTO3IhQWV+0RKu/3qNqvzJmOAuDHK5Ay+
 pVw4427QHfwWUU/Jin+ns8MnClUeIfI1gs+4wMisMhGwE2exaHy9wFl8DDf6o8UVYp2+
 SfNzATnJrkUtX7MEnFvLA/qtvMyx2XdrQenwytwUiMhPerr5aFhvkD2N+1NZJ/MJ7NDo
 4Z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C/S5/jmSYzB5e7NSIseQzjZBmBXsdNpgqSpR/qaP5hk=;
 b=cvvuA+6mtDrYWQIlPWBZFysNszIjQIl7zFAxGIkRFI7V+1Uowe8bJ8bJdmdukdtJ9j
 4FZDZlNF+wBfVoAv21DFrfL1qLC1RZmz6hI+55Fv6ubZthYfpefsc7Eu8mAzmgj7gO20
 TAqfqcRt2Zus9W/s5kNaVqSlgSJeGPB+TbD3E4OcFMIqcXH57YZPdUqJdqvtEw+BNBms
 wrIXYP0S3qjy4t9fsWD9rf70vsL3ZfyJTfI9GzmhMrK+AWT+7LpXYe45DY7sS5eqseg9
 6fONDiAdRg2Mn1zElNLmipQLqkTzGjzJ1Cq7OxJIVqnucnpF4ybe65ujvQ7/Kt2F60J1
 7nZw==
X-Gm-Message-State: AOAM531vcxYIChUFr4Iab8L/upW/xKB1q15rxD0CKqWhmGxB2zxXqd9Q
 nB3cuSEQ1zwe6PNT8w5/Aih7teWmhtf71Yz7g6k=
X-Google-Smtp-Source: ABdhPJx9WFrJw3ivDTXQEO+Bi51wJKsvJ8AcrJEP9g4EvRGXefz5GIa/thHRXGMulKEV6pExjvbngWCxGPGMQyX987g=
X-Received: by 2002:a25:f304:: with SMTP id c4mr42997372ybs.236.1617728941856; 
 Tue, 06 Apr 2021 10:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAEMunhAZTchE56EGZAa9JbHBUTUaAigKgM4MvNr3MCcB=pm-QA@mail.gmail.com>
 <CADCscQn2Rxr9RaUwASrRMOjHkQshSkdRjqHp1RfKX5TySM3zsA@mail.gmail.com>
In-Reply-To: <CADCscQn2Rxr9RaUwASrRMOjHkQshSkdRjqHp1RfKX5TySM3zsA@mail.gmail.com>
From: sandeep sharma <sandeepajesh@gmail.com>
Date: Tue, 6 Apr 2021 22:38:50 +0530
Message-ID: <CAEMunhBko-7HgB455GX5898jznc0SoKVe=PB0n8ye-O=9Ytwrg@mail.gmail.com>
Subject: Re: how to add a new user using ipmitool
To: Tom Joseph <rushtotom@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ec193805bf50de6b"
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

--000000000000ec193805bf50de6b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Tom,

I tried to execute these commands but no success. Looks like I am missing
something related to IPMI functionality .
To debug it further I added ipmitool into openBMC build and tried to
execute IPMI commands from the openbmc shell. But except for 0x6 0x1, 0x06
0x2 & 0x6 0x03 other commands are not working. Debug logs below. Any inputs
are much appreciated.
.

























































*root@cn81xx-obmc:~# systemctl | grep -i "ipmi"
phosphor-ipmi-host.service
                                            loaded active     running
  Phosphor Inband IPMI

phosphor-ipmi-kcs@ipmi-kcs3.service
                                           loaded active     running
  Phosphor IPMI KCS DBus Bridge
                                        phosphor-ipmi-net@eth0.service

        loaded active     running         Network IPMI daemon

    xyz.openbmc_project.Logging.IPMI.service
                                                loaded active     running
      IPMI SEL Logging Service

system-phosphor\x2dipmi\x2dkcs.slice
                                            loaded active     active
   system-phosphor\x2dipmi\x2dkcs.slice

system-phosphor\x2dipmi\x2dnet.slice
                                            loaded active     active
   system-phosphor\x2dipmi\x2dnet.slice
                                         phosphor-ipmi-net@eth0.socket

         loaded active     running         phosphor-ipmi-net@eth0.socket

    root@cn81xx-obmc:~# root@cn81xx-obmc:~# ipmitool raw 0x6 0x1 00 00 80
00 02 00 f7 04 00 00 00 00 00 00 00root@cn81xx-obmc:~# ipmitool raw 0x6
0x25       Unable to send RAW command (channel=3D0x0 netfn=3D0x6 lun=3D0x0
cmd=3D0x25 rsp=3D0xff): Unspecified errorroot@cn81xx-obmc:~# ipmitool raw 0=
x6
0x25 -vvvvvLoading IANA PEN Registry...  Allocating     29 entries  [
 27] 16777214 | A Debug Assisting Company, Ltd.  [    26]    52538 | Ampere
Computing  [    25]    51974 | Raptor Computing Systems, LLC  [    24]
 49769 | YADRO  [    23]    49150 | Vertiv Co  [    22]    48512 | Inspur
Group Co.,Ltd.  [    21]    48482 | Linaro Ltd  [    20]    45065 | Insyde
[    19]    40981 | Facebook, Inc.  [    18]    40092 | Wiwynn Corporation
[    17]    33049 | Mellanox Technologies LTD  [    16]    20974 | American
Megatrends, Inc  [    15]    19046 | Lenovo Enterprise Business Group  [
 14]    11183 | Mitac International Corp.  [    13]    11129 | Google,
Inc.  [    12]     8554 | Departement Elektrotechnik, ETH Zuerich  [    11]
    7244 | Quanta Computer Inc.  [    10]     6569 | INVENTEC CORPORATION
[     9]     4128 | ARM Ltd.  [     8]     2487 | Phoenix Technologies
Ltd.  [     7]     1694 | HCL Technologies Limited  [     6]     1271 |
Ciena Corporation  [     5]      674 | Dell Inc.  [     4]      343 | Intel
Corporation  [     3]        2 | IBM (https://w3.ibm.com/standards
<https://w3.ibm.com/standards> )  [     2]        0 | Reserved  [     1]
 1048575 | Unspecified  [     0]        0 | UnknownRunning Get PICMG
Properties my_addr 0x20, transit 0, target 0Error response 0xc1 from Get
PICMG PropertiesRunning Get VSO Capabilities my_addr 0x20, transit 0,
target 0Invalid completion code received: Invalid commandAcquire IPMB
addressDiscovered IPMB address 0x0Interface address: my_addr 0x20 transit
0:0 target 0x20:0 ipmb_target 0RAW REQ (channel=3D0x0 netfn=3D0x6 lun=3D0x0
cmd=3D0x25 data_len=3D0)Unable to send RAW command (channel=3D0x0 netfn=3D0=
x6
lun=3D0x0 cmd=3D0x25 rsp=3D0xff): Unspecified errorroot@cn81xx-obmc:~#*


















*root@cn81xx-obmc:~# ipmitool channel info 1Channel 0x1 info:  Channel
Medium Type   : 802.3 LAN  Channel Protocol Type : IPMB-1.0  Session
Support       : multi-session  Active Session Count  : 0  Protocol Vendor
ID    : 7154  Volatile(active) Settings    Alerting            : enabled
Per-message Auth    : enabled    User Level Auth     : enabled    Access
Mode         : always available  Non-Volatile Settings    Alerting
   : enabled    Per-message Auth    : enabled    User Level Auth     :
enabled    Access Mode         : always availableroot@cn81xx-obmc:~# *





















*root@cn81xx-obmc:~# ipmitool user list 1   ID  Name     Callin  Link Auth
IPMI Msg   Channel Priv Limit1   root             false   true       true
    ADMINISTRATOR2                    true    false      false      NO
ACCESS3                    true    false      false      NO ACCESS4
           true    false      false      NO ACCESS5                    true
   false      false      NO ACCESS6                    true    false
 false      NO ACCESS7                    true    false      false      NO
ACCESS8                    true    false      false      NO ACCESS9
           true    false      false      NO ACCESS10                   true
   false      false      NO ACCESS11                   true    false
 false      NO ACCESS12                   true    false      false      NO
ACCESS13                   true    false      false      NO ACCESS14
            true    false      false      NO ACCESS15
true    false      false      NO ACCESSroot@cn81xx-obmc:~# ipmitool user
summary 1Maximum IDs    : 15Enabled User Count  : 1Fixed Name Count    :
0root@cn81xx-obmc:~# *



*root@cn81xx-obmc:~# ipmitool -I dbus user set name 2 newuserSet User Name
command failed (user 2, name newuser): Unspecified
errorroot@cn81xx-obmc:~# *

thx
sandeep S

On Tue, Apr 6, 2021 at 7:38 PM Tom Joseph <rushtotom@gmail.com> wrote:

> docs/IPMITOOL-cheatsheet.md at master =C2=B7 openbmc/docs (github.com)
> <https://github.com/openbmc/docs/blob/master/IPMITOOL-cheatsheet.md>
>
> On Mon, Apr 5, 2021 at 11:17 PM sandeep sharma <sandeepajesh@gmail.com>
> wrote:
>
>> We are working on a prototype based on ast2600  and can someone please
>> help me with commands to create a user using ipmitool in openbmc? Is the=
re
>> any link which I can refer for all commands related to ipmi?
>>
>> Steps I have tried:-
>> root@cn81xx-obmc:~# ipmitool user summary 1
>> Maximum IDs    : 15
>> Enabled User Count  : 1
>> Fixed Name Count    : 0
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
>> root@cn81xx-obmc:~# ipmitool user set name 2 newuser
>> Set User Name command failed (user 2, name newuser): Unspecified error
>> root@cn81xx-obmc:~# ipmitool user set name 2 newuser -vv
>> Loading IANA PEN Registry...
>> Running Get PICMG Properties my_addr 0x20, transit 0, target 0
>> Error response 0xc1 from Get PICMG Properties
>> Running Get VSO Capabilities my_addr 0x20, transit 0, target 0
>> Invalid completion code received: Invalid command
>> Acquire IPMB address
>> Discovered IPMB address 0x0
>> Interface address: my_addr 0x20 transit 0:0 target 0x20:0 ipmb_target 0
>>
>> Set User Name command failed (user 2, name newuser): Unspecified error
>> root@cn81xx-obmc:~#
>>
>> --
>> Thx-
>> Sandeep S
>>
>

--=20
Thx-
Sandeep S

--000000000000ec193805bf50de6b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+VGhhbmtzwqBUb20sPGJyPjxicj5JIHRyaWVkIHRvIGV4ZWN1dGUgdGhl
c2UgY29tbWFuZHMgYnV0IG5vIHN1Y2Nlc3MuIExvb2tzIGxpa2UgSSBhbSBtaXNzaW5nIHNvbWV0
aGluZyByZWxhdGVkIHRvIElQTUkgZnVuY3Rpb25hbGl0eSAuwqA8ZGl2PlRvIGRlYnVnIGl0IGZ1
cnRoZXIgSSBhZGRlZCBpcG1pdG9vbCBpbnRvIG9wZW5CTUMgYnVpbGQgYW5kIHRyaWVkIHRvIGV4
ZWN1dGUgSVBNSSBjb21tYW5kcyBmcm9tIHRoZSBvcGVuYm1jIHNoZWxsLiBCdXQgZXhjZXB0IGZv
ciAweDYgMHgxLCAweDA2IDB4MiAmYW1wOyAweDYgMHgwMyBvdGhlcsKgY29tbWFuZHMgYXJlIG5v
dCB3b3JraW5nLiBEZWJ1Z8KgbG9ncyBiZWxvdy4gQW55IGlucHV0cyBhcmUgbXVjaCBhcHByZWNp
YXRlZC48YnI+Ljxicj48YnI+PGk+cm9vdEBjbjgxeHgtb2JtYzp+IyBzeXN0ZW1jdGwgfCBncmVw
IC1pICZxdW90O2lwbWkmcXVvdDsgwqAgwqAgPGJyPsKgIHBob3NwaG9yLWlwbWktaG9zdC5zZXJ2
aWNlIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGxvYWRlZCBhY3RpdmUgwqAgwqAgcnVubmluZyDC
oCDCoCDCoCDCoCBQaG9zcGhvciBJbmJhbmQgSVBNSSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxi
cj7CoCBwaG9zcGhvci1pcG1pLWtjc0BpcG1pLWtjczMuc2VydmljZSDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxvYWRl
ZCBhY3RpdmUgwqAgwqAgcnVubmluZyDCoCDCoCDCoCDCoCBQaG9zcGhvciBJUE1JIEtDUyBEQnVz
IEJyaWRnZSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCA8YnI+wqAgcGhvc3Bob3ItaXBtaS1uZXRAZXRoMC5zZXJ2aWNlIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIGxvYWRlZCBhY3RpdmUgwqAgwqAgcnVubmluZyDCoCDCoCDCoCDCoCBO
ZXR3b3JrIElQTUkgZGFlbW9uIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxicj7CoCB4eXoub3Bl
bmJtY19wcm9qZWN0LkxvZ2dpbmcuSVBNSS5zZXJ2aWNlIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGxvYWRlZCBhY3RpdmUgwqAgwqAg
cnVubmluZyDCoCDCoCDCoCDCoCBJUE1JIFNFTCBMb2dnaW5nIFNlcnZpY2UgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqA8YnI+wqAgc3lzdGVtLXBob3NwaG9yXHgyZGlwbWlceDJka2NzLnNsaWNlIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IGxvYWRlZCBhY3RpdmUgwqAgwqAgYWN0aXZlIMKgIMKgIMKgIMKgIMKgc3lzdGVtLXBob3NwaG9y
XHgyZGlwbWlceDJka2NzLnNsaWNlIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPsKgIHN5c3RlbS1waG9zcGhvclx4MmRpcG1pXHgyZG5l
dC5zbGljZSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBsb2FkZWQgYWN0aXZlIMKgIMKgIGFjdGl2ZSDCoCDCoCDCoCDCoCDC
oHN5c3RlbS1waG9zcGhvclx4MmRpcG1pXHgyZG5ldC5zbGljZSDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj7CoCBwaG9zcGhvci1pcG1p
LW5ldEBldGgwLnNvY2tldCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxvYWRlZCBhY3RpdmUgwqAgwqAg
cnVubmluZyDCoCDCoCDCoCDCoCBwaG9zcGhvci1pcG1pLW5ldEBldGgwLnNvY2tldCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCA8YnI+cm9vdEBjbjgxeHgtb2JtYzp+I8KgPGJyPjxicj5yb290QGNuODF4eC1vYm1jOn4jIGlw
bWl0b29sIHJhdyAweDYgMHgxPGJyPsKgMDAgMDAgODAgMDAgMDIgMDAgZjcgMDQgMDAgMDAgMDAg
MDAgMDAgMDAgMDA8YnI+cm9vdEBjbjgxeHgtb2JtYzp+IyBpcG1pdG9vbCByYXcgMHg2IDB4MjUg
wqAgwqAgwqAgPGJyPlVuYWJsZSB0byBzZW5kIFJBVyBjb21tYW5kIChjaGFubmVsPTB4MCBuZXRm
bj0weDYgbHVuPTB4MCBjbWQ9MHgyNSByc3A9MHhmZik6IFVuc3BlY2lmaWVkIGVycm9yPGJyPnJv
b3RAY244MXh4LW9ibWM6fiMgaXBtaXRvb2wgcmF3IDB4NiAweDI1IC12dnZ2djxicj5Mb2FkaW5n
IElBTkEgUEVOIFJlZ2lzdHJ5Li4uPGJyPsKgIEFsbG9jYXRpbmcgwqAgwqAgMjkgZW50cmllczxi
cj7CoCBbIMKgIMKgMjddIDE2Nzc3MjE0IHwgQSBEZWJ1ZyBBc3Npc3RpbmcgQ29tcGFueSwgTHRk
Ljxicj7CoCBbIMKgIMKgMjZdIMKgIMKgNTI1MzggfCBBbXBlcmUgQ29tcHV0aW5nPGJyPsKgIFsg
wqAgwqAyNV0gwqAgwqA1MTk3NCB8IFJhcHRvciBDb21wdXRpbmcgU3lzdGVtcywgTExDPGJyPsKg
IFsgwqAgwqAyNF0gwqAgwqA0OTc2OSB8IFlBRFJPPGJyPsKgIFsgwqAgwqAyM10gwqAgwqA0OTE1
MCB8IFZlcnRpdiBDbzxicj7CoCBbIMKgIMKgMjJdIMKgIMKgNDg1MTIgfCBJbnNwdXIgR3JvdXAg
Q28uLEx0ZC48YnI+wqAgWyDCoCDCoDIxXSDCoCDCoDQ4NDgyIHwgTGluYXJvIEx0ZDxicj7CoCBb
IMKgIMKgMjBdIMKgIMKgNDUwNjUgfCBJbnN5ZGU8YnI+wqAgWyDCoCDCoDE5XSDCoCDCoDQwOTgx
IHwgRmFjZWJvb2ssIEluYy48YnI+wqAgWyDCoCDCoDE4XSDCoCDCoDQwMDkyIHwgV2l3eW5uIENv
cnBvcmF0aW9uPGJyPsKgIFsgwqAgwqAxN10gwqAgwqAzMzA0OSB8IE1lbGxhbm94IFRlY2hub2xv
Z2llcyBMVEQ8YnI+wqAgWyDCoCDCoDE2XSDCoCDCoDIwOTc0IHwgQW1lcmljYW4gTWVnYXRyZW5k
cywgSW5jPGJyPsKgIFsgwqAgwqAxNV0gwqAgwqAxOTA0NiB8IExlbm92byBFbnRlcnByaXNlIEJ1
c2luZXNzIEdyb3VwPGJyPsKgIFsgwqAgwqAxNF0gwqAgwqAxMTE4MyB8IE1pdGFjIEludGVybmF0
aW9uYWwgQ29ycC48YnI+wqAgWyDCoCDCoDEzXSDCoCDCoDExMTI5IHwgR29vZ2xlLCBJbmMuPGJy
PsKgIFsgwqAgwqAxMl0gwqAgwqAgODU1NCB8IERlcGFydGVtZW50IEVsZWt0cm90ZWNobmlrLCBF
VEggWnVlcmljaDxicj7CoCBbIMKgIMKgMTFdIMKgIMKgIDcyNDQgfCBRdWFudGEgQ29tcHV0ZXIg
SW5jLjxicj7CoCBbIMKgIMKgMTBdIMKgIMKgIDY1NjkgfCBJTlZFTlRFQyBDT1JQT1JBVElPTjxi
cj7CoCBbIMKgIMKgIDldIMKgIMKgIDQxMjggfCBBUk0gTHRkLjxicj7CoCBbIMKgIMKgIDhdIMKg
IMKgIDI0ODcgfCBQaG9lbml4IFRlY2hub2xvZ2llcyBMdGQuPGJyPsKgIFsgwqAgwqAgN10gwqAg
wqAgMTY5NCB8IEhDTCBUZWNobm9sb2dpZXMgTGltaXRlZDxicj7CoCBbIMKgIMKgIDZdIMKgIMKg
IDEyNzEgfCBDaWVuYSBDb3Jwb3JhdGlvbjxicj7CoCBbIMKgIMKgIDVdIMKgIMKgIMKgNjc0IHwg
RGVsbCBJbmMuPGJyPsKgIFsgwqAgwqAgNF0gwqAgwqAgwqAzNDMgfCBJbnRlbCBDb3Jwb3JhdGlv
bjxicj7CoCBbIMKgIMKgIDNdIMKgIMKgIMKgIMKgMiB8IElCTSAoPGEgaHJlZj0iaHR0cHM6Ly93
My5pYm0uY29tL3N0YW5kYXJkcyI+aHR0cHM6Ly93My5pYm0uY29tL3N0YW5kYXJkczwvYT4gKTxi
cj7CoCBbIMKgIMKgIDJdIMKgIMKgIMKgIMKgMCB8IFJlc2VydmVkPGJyPsKgIFsgwqAgwqAgMV0g
wqAxMDQ4NTc1IHwgVW5zcGVjaWZpZWQ8YnI+wqAgWyDCoCDCoCAwXSDCoCDCoCDCoCDCoDAgfCBV
bmtub3duPGJyPjxiPlJ1bm5pbmcgR2V0IFBJQ01HIFByb3BlcnRpZXMgbXlfYWRkciAweDIwLCB0
cmFuc2l0IDAsIHRhcmdldCAwPGJyPkVycm9yIHJlc3BvbnNlIDB4YzEgZnJvbSBHZXQgUElDTUcg
UHJvcGVydGllczxicj48L2I+UnVubmluZyBHZXQgVlNPIENhcGFiaWxpdGllcyBteV9hZGRyIDB4
MjAsIHRyYW5zaXQgMCwgdGFyZ2V0IDA8YnI+SW52YWxpZCBjb21wbGV0aW9uIGNvZGUgcmVjZWl2
ZWQ6IEludmFsaWQgY29tbWFuZDxicj5BY3F1aXJlIElQTUIgYWRkcmVzczxicj5EaXNjb3ZlcmVk
IElQTUIgYWRkcmVzcyAweDA8YnI+SW50ZXJmYWNlIGFkZHJlc3M6IG15X2FkZHIgMHgyMCB0cmFu
c2l0IDA6MCB0YXJnZXQgMHgyMDowIGlwbWJfdGFyZ2V0IDA8YnI+PGJyPlJBVyBSRVEgKGNoYW5u
ZWw9MHgwIG5ldGZuPTB4NiBsdW49MHgwIGNtZD0weDI1IGRhdGFfbGVuPTApPGJyPlVuYWJsZSB0
byBzZW5kIFJBVyBjb21tYW5kIChjaGFubmVsPTB4MCBuZXRmbj0weDYgbHVuPTB4MCBjbWQ9MHgy
NSByc3A9MHhmZik6IFVuc3BlY2lmaWVkIGVycm9yPGJyPnJvb3RAY244MXh4LW9ibWM6fiM8YnI+
PC9pPjxicj48aT5yb290QGNuODF4eC1vYm1jOn4jIGlwbWl0b29sIGNoYW5uZWwgaW5mbyAxPGJy
PkNoYW5uZWwgMHgxIGluZm86PGJyPsKgIENoYW5uZWwgTWVkaXVtIFR5cGUgwqAgOiA4MDIuMyBM
QU48YnI+wqAgQ2hhbm5lbCBQcm90b2NvbCBUeXBlIDogSVBNQi0xLjA8YnI+wqAgU2Vzc2lvbiBT
dXBwb3J0IMKgIMKgIMKgIDogbXVsdGktc2Vzc2lvbjxicj7CoCBBY3RpdmUgU2Vzc2lvbiBDb3Vu
dCDCoDogMDxicj7CoCBQcm90b2NvbCBWZW5kb3IgSUQgwqAgwqA6IDcxNTQ8YnI+wqAgVm9sYXRp
bGUoYWN0aXZlKSBTZXR0aW5nczxicj7CoCDCoCBBbGVydGluZyDCoCDCoCDCoCDCoCDCoCDCoDog
ZW5hYmxlZDxicj7CoCDCoCBQZXItbWVzc2FnZSBBdXRoIMKgIMKgOiBlbmFibGVkPGJyPsKgIMKg
IFVzZXIgTGV2ZWwgQXV0aCDCoCDCoCA6IGVuYWJsZWQ8YnI+wqAgwqAgQWNjZXNzIE1vZGUgwqAg
wqAgwqAgwqAgOiBhbHdheXMgYXZhaWxhYmxlPGJyPsKgIE5vbi1Wb2xhdGlsZSBTZXR0aW5nczxi
cj7CoCDCoCBBbGVydGluZyDCoCDCoCDCoCDCoCDCoCDCoDogZW5hYmxlZDxicj7CoCDCoCBQZXIt
bWVzc2FnZSBBdXRoIMKgIMKgOiBlbmFibGVkPGJyPsKgIMKgIFVzZXIgTGV2ZWwgQXV0aCDCoCDC
oCA6IGVuYWJsZWQ8YnI+wqAgwqAgQWNjZXNzIE1vZGUgwqAgwqAgwqAgwqAgOiBhbHdheXMgYXZh
aWxhYmxlPGJyPnJvb3RAY244MXh4LW9ibWM6fiMgPGJyPjwvaT48YnI+PGk+cm9vdEBjbjgxeHgt
b2JtYzp+IyBpcG1pdG9vbCB1c2VyIGxpc3QgMSDCoCA8YnI+SUQgwqBOYW1lCSDCoCDCoCBDYWxs
aW4gwqBMaW5rIEF1dGgJSVBNSSBNc2cgwqAgQ2hhbm5lbCBQcml2IExpbWl0PGJyPjEgwqAgcm9v
dCDCoCDCoCDCoCDCoCDCoCDCoCBmYWxzZSDCoCB0cnVlIMKgIMKgIMKgIHRydWUgwqAgwqAgwqAg
QURNSU5JU1RSQVRPUjxicj4yIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHJ1ZSDCoCDC
oGZhbHNlIMKgIMKgIMKgZmFsc2UgwqAgwqAgwqBOTyBBQ0NFU1M8YnI+MyDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHRydWUgwqAgwqBmYWxzZSDCoCDCoCDCoGZhbHNlIMKgIMKgIMKgTk8g
QUNDRVNTPGJyPjQgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0cnVlIMKgIMKgZmFsc2Ug
wqAgwqAgwqBmYWxzZSDCoCDCoCDCoE5PIEFDQ0VTUzxicj41IMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgdHJ1ZSDCoCDCoGZhbHNlIMKgIMKgIMKgZmFsc2UgwqAgwqAgwqBOTyBBQ0NFU1M8
YnI+NiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRydWUgwqAgwqBmYWxzZSDCoCDCoCDC
oGZhbHNlIMKgIMKgIMKgTk8gQUNDRVNTPGJyPjcgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB0cnVlIMKgIMKgZmFsc2UgwqAgwqAgwqBmYWxzZSDCoCDCoCDCoE5PIEFDQ0VTUzxicj44IMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHJ1ZSDCoCDCoGZhbHNlIMKgIMKgIMKgZmFsc2Ug
wqAgwqAgwqBOTyBBQ0NFU1M8YnI+OSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRydWUg
wqAgwqBmYWxzZSDCoCDCoCDCoGZhbHNlIMKgIMKgIMKgTk8gQUNDRVNTPGJyPjEwIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHRydWUgwqAgwqBmYWxzZSDCoCDCoCDCoGZhbHNlIMKgIMKgIMKg
Tk8gQUNDRVNTPGJyPjExIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHRydWUgwqAgwqBmYWxz
ZSDCoCDCoCDCoGZhbHNlIMKgIMKgIMKgTk8gQUNDRVNTPGJyPjEyIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIHRydWUgwqAgwqBmYWxzZSDCoCDCoCDCoGZhbHNlIMKgIMKgIMKgTk8gQUNDRVNT
PGJyPjEzIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHRydWUgwqAgwqBmYWxzZSDCoCDCoCDC
oGZhbHNlIMKgIMKgIMKgTk8gQUNDRVNTPGJyPjE0IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHRydWUgwqAgwqBmYWxzZSDCoCDCoCDCoGZhbHNlIMKgIMKgIMKgTk8gQUNDRVNTPGJyPjE1IMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHRydWUgwqAgwqBmYWxzZSDCoCDCoCDCoGZhbHNlIMKg
IMKgIMKgTk8gQUNDRVNTPGJyPnJvb3RAY244MXh4LW9ibWM6fiMgaXBtaXRvb2wgdXNlciBzdW1t
YXJ5IDE8YnI+TWF4aW11bSBJRHMJIMKgIMKgOiAxNTxicj5FbmFibGVkIFVzZXIgQ291bnQgwqA6
IDE8YnI+Rml4ZWQgTmFtZSBDb3VudCDCoCDCoDogMDxicj5yb290QGNuODF4eC1vYm1jOn4jwqA8
L2k+PGJyPjxicj48aT5yb290QGNuODF4eC1vYm1jOn4jIGlwbWl0b29sIC1JIGRidXMgdXNlciBz
ZXQgbmFtZSAyIG5ld3VzZXI8YnI+U2V0IFVzZXIgTmFtZSBjb21tYW5kIGZhaWxlZCAodXNlciAy
LCBuYW1lIG5ld3VzZXIpOiBVbnNwZWNpZmllZCBlcnJvcjxicj5yb290QGNuODF4eC1vYm1jOn4j
wqA8L2k+PGJyPjxicj50aHg8YnI+c2FuZGVlcCBTPC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9
ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gVHVlLCBB
cHIgNiwgMjAyMSBhdCA3OjM4IFBNIFRvbSBKb3NlcGggJmx0OzxhIGhyZWY9Im1haWx0bzpydXNo
dG90b21AZ21haWwuY29tIj5ydXNodG90b21AZ21haWwuY29tPC9hPiZndDsgd3JvdGU6PGJyPjwv
ZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4
IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5n
LWxlZnQ6MWV4Ij48ZGl2IGRpcj0ibHRyIj48ZGl2IGRpcj0ibHRyIj48YSBocmVmPSJodHRwczov
L2dpdGh1Yi5jb20vb3BlbmJtYy9kb2NzL2Jsb2IvbWFzdGVyL0lQTUlUT09MLWNoZWF0c2hlZXQu
bWQiIHRhcmdldD0iX2JsYW5rIj5kb2NzL0lQTUlUT09MLWNoZWF0c2hlZXQubWQgYXQgbWFzdGVy
IMK3IG9wZW5ibWMvZG9jcyAoZ2l0aHViLmNvbSk8L2E+PGJyPjwvZGl2PjwvZGl2Pjxicj48ZGl2
IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9u
IE1vbiwgQXByIDUsIDIwMjEgYXQgMTE6MTcgUE0gc2FuZGVlcCBzaGFybWEgJmx0OzxhIGhyZWY9
Im1haWx0bzpzYW5kZWVwYWplc2hAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+c2FuZGVlcGFq
ZXNoQGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0i
Z21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6
MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBkaXI9Imx0
ciI+DQoNCldlIGFyZSB3b3JraW5nIG9uIGEgcHJvdG90eXBlIGJhc2VkIG9uIGFzdDI2MDDCoCBh
bmQgY2FuIHNvbWVvbmUgcGxlYXNlIGhlbHAgbWUgd2l0aCBjb21tYW5kcyB0byBjcmVhdGUgYSB1
c2VyIHVzaW5nIGlwbWl0b29sIGluIG9wZW5ibWM/IElzIHRoZXJlIGFueSBsaW5rIHdoaWNoIEkg
Y2FuIHJlZmVyIGZvciBhbGwgY29tbWFuZHMgcmVsYXRlZCB0byBpcG1pPzxkaXY+PGJyPlN0ZXBz
IEkgaGF2ZSB0cmllZDotPGJyPnJvb3RAY244MXh4LW9ibWM6fiMgaXBtaXRvb2wgdXNlciBzdW1t
YXJ5IDE8YnI+TWF4aW11bSBJRHMJIMKgIMKgOiAxNTxicj5FbmFibGVkIFVzZXIgQ291bnQgwqA6
IDE8YnI+Rml4ZWQgTmFtZSBDb3VudCDCoCDCoDogMDxicj5yb290QGNuODF4eC1vYm1jOn4jIGlw
bWl0b29sIHVzZXIgbGlzdCAxPGJyPklEIMKgTmFtZQkgwqAgwqAgQ2FsbGluIMKgTGluayBBdXRo
CUlQTUkgTXNnIMKgIENoYW5uZWwgUHJpdiBMaW1pdDxicj4xIMKgIHJvb3QgwqAgwqAgwqAgwqAg
wqAgwqAgZmFsc2UgwqAgdHJ1ZSDCoCDCoCDCoCB0cnVlIMKgIMKgIMKgIEFETUlOSVNUUkFUT1I8
YnI+MiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRydWUgwqAgwqBmYWxzZSDCoCDCoCDC
oGZhbHNlIMKgIMKgIMKgTk8gQUNDRVNTPGJyPjMgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB0cnVlIMKgIMKgZmFsc2UgwqAgwqAgwqBmYWxzZSDCoCDCoCDCoE5PIEFDQ0VTUzxicj40IMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHJ1ZSDCoCDCoGZhbHNlIMKgIMKgIMKgZmFsc2Ug
wqAgwqAgwqBOTyBBQ0NFU1M8YnI+NSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRydWUg
wqAgwqBmYWxzZSDCoCDCoCDCoGZhbHNlIMKgIMKgIMKgTk8gQUNDRVNTPGJyPjYgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB0cnVlIMKgIMKgZmFsc2UgwqAgwqAgwqBmYWxzZSDCoCDCoCDC
oE5PIEFDQ0VTUzxicj43IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHJ1ZSDCoCDCoGZh
bHNlIMKgIMKgIMKgZmFsc2UgwqAgwqAgwqBOTyBBQ0NFU1M8YnI+OCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHRydWUgwqAgwqBmYWxzZSDCoCDCoCDCoGZhbHNlIMKgIMKgIMKgTk8gQUND
RVNTPGJyPjkgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0cnVlIMKgIMKgZmFsc2UgwqAg
wqAgwqBmYWxzZSDCoCDCoCDCoE5PIEFDQ0VTUzxicj4xMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCB0cnVlIMKgIMKgZmFsc2UgwqAgwqAgwqBmYWxzZSDCoCDCoCDCoE5PIEFDQ0VTUzxicj4x
MSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB0cnVlIMKgIMKgZmFsc2UgwqAgwqAgwqBmYWxz
ZSDCoCDCoCDCoE5PIEFDQ0VTUzxicj4xMiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB0cnVl
IMKgIMKgZmFsc2UgwqAgwqAgwqBmYWxzZSDCoCDCoCDCoE5PIEFDQ0VTUzxicj4xMyDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCB0cnVlIMKgIMKgZmFsc2UgwqAgwqAgwqBmYWxzZSDCoCDCoCDC
oE5PIEFDQ0VTUzxicj4xNCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB0cnVlIMKgIMKgZmFs
c2UgwqAgwqAgwqBmYWxzZSDCoCDCoCDCoE5PIEFDQ0VTUzxicj4xNSDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB0cnVlIMKgIMKgZmFsc2UgwqAgwqAgwqBmYWxzZSDCoCDCoCDCoE5PIEFDQ0VT
Uzxicj5yb290QGNuODF4eC1vYm1jOn4jIGlwbWl0b29sIHVzZXIgc2V0IG5hbWUgMiBuZXd1c2Vy
IMKgIMKgIMKgIDxicj5TZXQgVXNlciBOYW1lIGNvbW1hbmQgZmFpbGVkICh1c2VyIDIsIG5hbWUg
bmV3dXNlcik6IFVuc3BlY2lmaWVkIGVycm9yPGJyPnJvb3RAY244MXh4LW9ibWM6fiMgaXBtaXRv
b2wgdXNlciBzZXQgbmFtZSAyIG5ld3VzZXIgLXZ2IDxicj5Mb2FkaW5nIElBTkEgUEVOIFJlZ2lz
dHJ5Li4uPGJyPlJ1bm5pbmcgR2V0IFBJQ01HIFByb3BlcnRpZXMgbXlfYWRkciAweDIwLCB0cmFu
c2l0IDAsIHRhcmdldCAwPGJyPkVycm9yIHJlc3BvbnNlIDB4YzEgZnJvbSBHZXQgUElDTUcgUHJv
cGVydGllczxicj5SdW5uaW5nIEdldCBWU08gQ2FwYWJpbGl0aWVzIG15X2FkZHIgMHgyMCwgdHJh
bnNpdCAwLCB0YXJnZXQgMDxicj5JbnZhbGlkIGNvbXBsZXRpb24gY29kZSByZWNlaXZlZDogSW52
YWxpZCBjb21tYW5kPGJyPkFjcXVpcmUgSVBNQiBhZGRyZXNzPGJyPkRpc2NvdmVyZWQgSVBNQiBh
ZGRyZXNzIDB4MDxicj5JbnRlcmZhY2UgYWRkcmVzczogbXlfYWRkciAweDIwIHRyYW5zaXQgMDow
IHRhcmdldCAweDIwOjAgaXBtYl90YXJnZXQgMDxicj48YnI+U2V0IFVzZXIgTmFtZSBjb21tYW5k
IGZhaWxlZCAodXNlciAyLCBuYW1lIG5ld3VzZXIpOiBVbnNwZWNpZmllZCBlcnJvcjxicj5yb290
QGNuODF4eC1vYm1jOn4jwqA8YnIgY2xlYXI9ImFsbCI+PGRpdj48YnI+PC9kaXY+LS0gPGJyPjxk
aXYgZGlyPSJsdHIiPjxkaXYgZGlyPSJsdHIiPjxkaXY+VGh4LTwvZGl2PjxkaXY+U2FuZGVlcCBT
PGJyPjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pg0KPC9ibG9ja3F1b3RlPjwvZGl2Pg0K
PC9ibG9ja3F1b3RlPjwvZGl2PjxiciBjbGVhcj0iYWxsIj48ZGl2Pjxicj48L2Rpdj4tLSA8YnI+
PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX3NpZ25hdHVyZSI+PGRpdiBkaXI9Imx0ciI+PGRp
dj5UaHgtPC9kaXY+PGRpdj5TYW5kZWVwIFM8YnI+PC9kaXY+PC9kaXY+PC9kaXY+DQo=
--000000000000ec193805bf50de6b--
