Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A94DE357C23
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 08:08:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FG9nC44pyz30Lc
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 16:08:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Ib2EiwSf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2b;
 helo=mail-yb1-xb2b.google.com; envelope-from=sandeepajesh@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ib2EiwSf; dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FG9my2NgQz304F
 for <openbmc@lists.ozlabs.org>; Thu,  8 Apr 2021 16:08:31 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id 82so1382710yby.7
 for <openbmc@lists.ozlabs.org>; Wed, 07 Apr 2021 23:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ILfHFTKSvsSCx3BWC7ztwBTsBvDo2kgTVB2DD7YwAzk=;
 b=Ib2EiwSfmrMOFXSuq6d3tBL1YPR7s7S7693/Lys+ovYJ/P+1b0T4VFN/FWo9OdpaCP
 4DDRQ5immF2gF4XrVBNVVFw+hHZxomNCz96c78puou6ObejhTHBqX9PN/bADy0KRYaGP
 Mz/fdGegSgV7XPvMDpoY0Im+FZwAwsgDEmc4iUd+0w41p9bRogs2TuOMafn2Uxb4Ni3Z
 oWebdxDFJut9gA/iYLKdDGZR9I9HPT6E9smdhBMiGdVSVn0F8QMZqbQxvFIciC1swh5r
 JYW1WfKN9au7Kcu4icdkYx++Lp8iioxshRP88hkM17egTNZ1hCeCkismINSeH93gYccY
 rxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ILfHFTKSvsSCx3BWC7ztwBTsBvDo2kgTVB2DD7YwAzk=;
 b=jbED0FGCaH5OMfahDTD90645jdio99mYQNo4KMPWY+u97+ZEcPza8hKT8fhni7wWB9
 VOtr+Ixlm8urW8ENx3Xa72UBGcgjcUd27jHhEk81akLMQsjVAAzi2oWx2Cprsz2QhZxa
 FxIXnAx+FVnjLcCCC0l9YCKgVEK5LCtKXBOmpVMMOJluQM1YFTYsGc10gSbc3CRZWY2o
 8BE7NWOYY9aU8AukiWye7/c7lBlJ2YbSRf37DS1suCrbe9A4e4lOOK7TgTiTA4NJ+S1s
 +qBVVO7zHGcHjtiXfaIniNebxK1ANjlferOvVgOLBvMG/N5Privq0a11mTRvgYWbztkA
 8v+w==
X-Gm-Message-State: AOAM533D3N1NTdgmPqj29QegnZNC/oYv8SBJkv+qIQamp9xiVR3S439N
 GoUgk8UKGhaONZa0da99/5ZlUu23kmGwcDam5LE=
X-Google-Smtp-Source: ABdhPJwzN4mD+QSfialS/eaUteqmgsjo7DJNFPq+ghDhcyxihZtX/oC8Kx+MMi44UQvkiwZRP4g7iPpu5gurakt6X5Y=
X-Received: by 2002:a25:9088:: with SMTP id t8mr9432885ybl.318.1617862100555; 
 Wed, 07 Apr 2021 23:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAEMunhAZTchE56EGZAa9JbHBUTUaAigKgM4MvNr3MCcB=pm-QA@mail.gmail.com>
 <CADCscQn2Rxr9RaUwASrRMOjHkQshSkdRjqHp1RfKX5TySM3zsA@mail.gmail.com>
 <CAEMunhBko-7HgB455GX5898jznc0SoKVe=PB0n8ye-O=9Ytwrg@mail.gmail.com>
In-Reply-To: <CAEMunhBko-7HgB455GX5898jznc0SoKVe=PB0n8ye-O=9Ytwrg@mail.gmail.com>
From: sandeep sharma <sandeepajesh@gmail.com>
Date: Thu, 8 Apr 2021 11:38:09 +0530
Message-ID: <CAEMunhBb2GK1UC__cYZcyhYEm8cn9gKgqSDTtXsgfOWAyV+Wpw@mail.gmail.com>
Subject: Re: how to add a new user using ipmitool
To: Tom Joseph <rushtotom@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000cc996905bf6fdf7b"
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

--000000000000cc996905bf6fdf7b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can some experts help us here?

On Tue, Apr 6, 2021 at 10:38 PM sandeep sharma <sandeepajesh@gmail.com>
wrote:

> Thanks Tom,
>
> I tried to execute these commands but no success. Looks like I am missing
> something related to IPMI functionality .
> To debug it further I added ipmitool into openBMC build and tried to
> execute IPMI commands from the openbmc shell. But except for 0x6 0x1, 0x0=
6
> 0x2 & 0x6 0x03 other commands are not working. Debug logs below. Any inpu=
ts
> are much appreciated.
> .
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
> *root@cn81xx-obmc:~# systemctl | grep -i "ipmi"
> phosphor-ipmi-host.service
>                                             loaded active     running
>   Phosphor Inband IPMI
>
> phosphor-ipmi-kcs@ipmi-kcs3.service
>                                            loaded active     running
>   Phosphor IPMI KCS DBus Bridge
>                                         phosphor-ipmi-net@eth0.service
>
>         loaded active     running         Network IPMI daemon
>
>     xyz.openbmc_project.Logging.IPMI.service
>                                                 loaded active     running
>       IPMI SEL Logging Service
>
> system-phosphor\x2dipmi\x2dkcs.slice
>                                             loaded active     active
>    system-phosphor\x2dipmi\x2dkcs.slice
>
> system-phosphor\x2dipmi\x2dnet.slice
>                                             loaded active     active
>    system-phosphor\x2dipmi\x2dnet.slice
>                                          phosphor-ipmi-net@eth0.socket
>
>          loaded active     running         phosphor-ipmi-net@eth0.socket
>
>     root@cn81xx-obmc:~# root@cn81xx-obmc:~# ipmitool raw 0x6 0x1 00 00 80
> 00 02 00 f7 04 00 00 00 00 00 00 00root@cn81xx-obmc:~# ipmitool raw 0x6
> 0x25       Unable to send RAW command (channel=3D0x0 netfn=3D0x6 lun=3D0x=
0
> cmd=3D0x25 rsp=3D0xff): Unspecified errorroot@cn81xx-obmc:~# ipmitool raw=
 0x6
> 0x25 -vvvvvLoading IANA PEN Registry...  Allocating     29 entries  [
>  27] 16777214 | A Debug Assisting Company, Ltd.  [    26]    52538 | Ampe=
re
> Computing  [    25]    51974 | Raptor Computing Systems, LLC  [    24]
>  49769 | YADRO  [    23]    49150 | Vertiv Co  [    22]    48512 | Inspur
> Group Co.,Ltd.  [    21]    48482 | Linaro Ltd  [    20]    45065 | Insyd=
e
> [    19]    40981 | Facebook, Inc.  [    18]    40092 | Wiwynn Corporatio=
n
> [    17]    33049 | Mellanox Technologies LTD  [    16]    20974 | Americ=
an
> Megatrends, Inc  [    15]    19046 | Lenovo Enterprise Business Group  [
>  14]    11183 | Mitac International Corp.  [    13]    11129 | Google,
> Inc.  [    12]     8554 | Departement Elektrotechnik, ETH Zuerich  [    1=
1]
>     7244 | Quanta Computer Inc.  [    10]     6569 | INVENTEC CORPORATION
> [     9]     4128 | ARM Ltd.  [     8]     2487 | Phoenix Technologies
> Ltd.  [     7]     1694 | HCL Technologies Limited  [     6]     1271 |
> Ciena Corporation  [     5]      674 | Dell Inc.  [     4]      343 | Int=
el
> Corporation  [     3]        2 | IBM (https://w3.ibm.com/standards
> <https://w3.ibm.com/standards> )  [     2]        0 | Reserved  [     1]
>  1048575 | Unspecified  [     0]        0 | UnknownRunning Get PICMG
> Properties my_addr 0x20, transit 0, target 0Error response 0xc1 from Get
> PICMG PropertiesRunning Get VSO Capabilities my_addr 0x20, transit 0,
> target 0Invalid completion code received: Invalid commandAcquire IPMB
> addressDiscovered IPMB address 0x0Interface address: my_addr 0x20 transit
> 0:0 target 0x20:0 ipmb_target 0RAW REQ (channel=3D0x0 netfn=3D0x6 lun=3D0=
x0
> cmd=3D0x25 data_len=3D0)Unable to send RAW command (channel=3D0x0 netfn=
=3D0x6
> lun=3D0x0 cmd=3D0x25 rsp=3D0xff): Unspecified errorroot@cn81xx-obmc:~#*
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
> *root@cn81xx-obmc:~# ipmitool channel info 1Channel 0x1 info:  Channel
> Medium Type   : 802.3 LAN  Channel Protocol Type : IPMB-1.0  Session
> Support       : multi-session  Active Session Count  : 0  Protocol Vendor
> ID    : 7154  Volatile(active) Settings    Alerting            : enabled
> Per-message Auth    : enabled    User Level Auth     : enabled    Access
> Mode         : always available  Non-Volatile Settings    Alerting
>    : enabled    Per-message Auth    : enabled    User Level Auth     :
> enabled    Access Mode         : always availableroot@cn81xx-obmc:~# *
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
> *root@cn81xx-obmc:~# ipmitool user list 1   ID  Name     Callin  Link Aut=
h
> IPMI Msg   Channel Priv Limit1   root             false   true       true
>     ADMINISTRATOR2                    true    false      false      NO
> ACCESS3                    true    false      false      NO ACCESS4
>            true    false      false      NO ACCESS5                    tr=
ue
>    false      false      NO ACCESS6                    true    false
>  false      NO ACCESS7                    true    false      false      N=
O
> ACCESS8                    true    false      false      NO ACCESS9
>            true    false      false      NO ACCESS10                   tr=
ue
>    false      false      NO ACCESS11                   true    false
>  false      NO ACCESS12                   true    false      false      N=
O
> ACCESS13                   true    false      false      NO ACCESS14
>             true    false      false      NO ACCESS15
> true    false      false      NO ACCESSroot@cn81xx-obmc:~# ipmitool user
> summary 1Maximum IDs    : 15Enabled User Count  : 1Fixed Name Count    :
> 0root@cn81xx-obmc:~# *
>
>
>
> *root@cn81xx-obmc:~# ipmitool -I dbus user set name 2 newuserSet User Nam=
e
> command failed (user 2, name newuser): Unspecified
> errorroot@cn81xx-obmc:~# *
>
> thx
> sandeep S
>
> On Tue, Apr 6, 2021 at 7:38 PM Tom Joseph <rushtotom@gmail.com> wrote:
>
>> docs/IPMITOOL-cheatsheet.md at master =C2=B7 openbmc/docs (github.com)
>> <https://github.com/openbmc/docs/blob/master/IPMITOOL-cheatsheet.md>
>>
>> On Mon, Apr 5, 2021 at 11:17 PM sandeep sharma <sandeepajesh@gmail.com>
>> wrote:
>>
>>> We are working on a prototype based on ast2600  and can someone please
>>> help me with commands to create a user using ipmitool in openbmc? Is th=
ere
>>> any link which I can refer for all commands related to ipmi?
>>>
>>> Steps I have tried:-
>>> root@cn81xx-obmc:~# ipmitool user summary 1
>>> Maximum IDs    : 15
>>> Enabled User Count  : 1
>>> Fixed Name Count    : 0
>>> root@cn81xx-obmc:~# ipmitool user list 1
>>> ID  Name     Callin  Link Auth IPMI Msg   Channel Priv Limit
>>> 1   root             false   true       true       ADMINISTRATOR
>>> 2                    true    false      false      NO ACCESS
>>> 3                    true    false      false      NO ACCESS
>>> 4                    true    false      false      NO ACCESS
>>> 5                    true    false      false      NO ACCESS
>>> 6                    true    false      false      NO ACCESS
>>> 7                    true    false      false      NO ACCESS
>>> 8                    true    false      false      NO ACCESS
>>> 9                    true    false      false      NO ACCESS
>>> 10                   true    false      false      NO ACCESS
>>> 11                   true    false      false      NO ACCESS
>>> 12                   true    false      false      NO ACCESS
>>> 13                   true    false      false      NO ACCESS
>>> 14                   true    false      false      NO ACCESS
>>> 15                   true    false      false      NO ACCESS
>>> root@cn81xx-obmc:~# ipmitool user set name 2 newuser
>>> Set User Name command failed (user 2, name newuser): Unspecified error
>>> root@cn81xx-obmc:~# ipmitool user set name 2 newuser -vv
>>> Loading IANA PEN Registry...
>>> Running Get PICMG Properties my_addr 0x20, transit 0, target 0
>>> Error response 0xc1 from Get PICMG Properties
>>> Running Get VSO Capabilities my_addr 0x20, transit 0, target 0
>>> Invalid completion code received: Invalid command
>>> Acquire IPMB address
>>> Discovered IPMB address 0x0
>>> Interface address: my_addr 0x20 transit 0:0 target 0x20:0 ipmb_target 0
>>>
>>> Set User Name command failed (user 2, name newuser): Unspecified error
>>> root@cn81xx-obmc:~#
>>>
>>> --
>>> Thx-
>>> Sandeep S
>>>
>>
>
> --
> Thx-
> Sandeep S
>


--=20
Thx-
Sandeep S

--000000000000cc996905bf6fdf7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+Q2FuIHNvbWUgZXhwZXJ0cyBoZWxwIHVzIGhlcmU/PC9kaXY+PGJyPjxk
aXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+
T24gVHVlLCBBcHIgNiwgMjAyMSBhdCAxMDozOCBQTSBzYW5kZWVwIHNoYXJtYSAmbHQ7PGEgaHJl
Zj0ibWFpbHRvOnNhbmRlZXBhamVzaEBnbWFpbC5jb20iPnNhbmRlZXBhamVzaEBnbWFpbC5jb208
L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBz
dHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2Io
MjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgZGlyPSJsdHIiPlRoYW5rc8KgVG9t
LDxicj48YnI+SSB0cmllZCB0byBleGVjdXRlIHRoZXNlIGNvbW1hbmRzIGJ1dCBubyBzdWNjZXNz
LiBMb29rcyBsaWtlIEkgYW0gbWlzc2luZyBzb21ldGhpbmcgcmVsYXRlZCB0byBJUE1JIGZ1bmN0
aW9uYWxpdHkgLsKgPGRpdj5UbyBkZWJ1ZyBpdCBmdXJ0aGVyIEkgYWRkZWQgaXBtaXRvb2wgaW50
byBvcGVuQk1DIGJ1aWxkIGFuZCB0cmllZCB0byBleGVjdXRlIElQTUkgY29tbWFuZHMgZnJvbSB0
aGUgb3BlbmJtYyBzaGVsbC4gQnV0IGV4Y2VwdCBmb3IgMHg2IDB4MSwgMHgwNiAweDIgJmFtcDsg
MHg2IDB4MDMgb3RoZXLCoGNvbW1hbmRzIGFyZSBub3Qgd29ya2luZy4gRGVidWfCoGxvZ3MgYmVs
b3cuIEFueSBpbnB1dHMgYXJlIG11Y2ggYXBwcmVjaWF0ZWQuPGJyPi48YnI+PGJyPjxpPnJvb3RA
Y244MXh4LW9ibWM6fiMgc3lzdGVtY3RsIHwgZ3JlcCAtaSAmcXVvdDtpcG1pJnF1b3Q7IMKgIMKg
IDxicj7CoCBwaG9zcGhvci1pcG1pLWhvc3Quc2VydmljZSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBsb2FkZWQgYWN0aXZlIMKgIMKgIHJ1bm5pbmcgwqAgwqAgwqAgwqAgUGhvc3Bob3IgSW5iYW5k
IElQTUkgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+wqAgcGhvc3Bob3ItaXBtaS1rY3NAaXBt
aS1rY3MzLnNlcnZpY2UgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsb2FkZWQgYWN0aXZlIMKgIMKgIHJ1bm5pbmcgwqAg
wqAgwqAgwqAgUGhvc3Bob3IgSVBNSSBLQ1MgREJ1cyBCcmlkZ2UgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgPGJyPsKgIHBo
b3NwaG9yLWlwbWktbmV0QGV0aDAuc2VydmljZSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBsb2FkZWQgYWN0
aXZlIMKgIMKgIHJ1bm5pbmcgwqAgwqAgwqAgwqAgTmV0d29yayBJUE1JIGRhZW1vbiDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCA8YnI+wqAgeHl6Lm9wZW5ibWNfcHJvamVjdC5Mb2dnaW5nLklQTUku
c2VydmljZSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBsb2FkZWQgYWN0aXZlIMKgIMKgIHJ1bm5pbmcgwqAgwqAgwqAgwqAgSVBNSSBT
RUwgTG9nZ2luZyBTZXJ2aWNlIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPsKgIHN5c3RlbS1waG9zcGhv
clx4MmRpcG1pXHgyZGtjcy5zbGljZSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBsb2FkZWQgYWN0aXZlIMKgIMKgIGFjdGl2
ZSDCoCDCoCDCoCDCoCDCoHN5c3RlbS1waG9zcGhvclx4MmRpcG1pXHgyZGtjcy5zbGljZSDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj7C
oCBzeXN0ZW0tcGhvc3Bob3JceDJkaXBtaVx4MmRuZXQuc2xpY2UgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgbG9hZGVkIGFj
dGl2ZSDCoCDCoCBhY3RpdmUgwqAgwqAgwqAgwqAgwqBzeXN0ZW0tcGhvc3Bob3JceDJkaXBtaVx4
MmRuZXQuc2xpY2UgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqA8YnI+wqAgcGhvc3Bob3ItaXBtaS1uZXRAZXRoMC5zb2NrZXQgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBsb2FkZWQgYWN0aXZlIMKgIMKgIHJ1bm5pbmcgwqAgwqAgwqAgwqAgcGhvc3Bo
b3ItaXBtaS1uZXRAZXRoMC5zb2NrZXQgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgPGJyPnJvb3RAY244MXh4LW9ibWM6fiPC
oDxicj48YnI+cm9vdEBjbjgxeHgtb2JtYzp+IyBpcG1pdG9vbCByYXcgMHg2IDB4MTxicj7CoDAw
IDAwIDgwIDAwIDAyIDAwIGY3IDA0IDAwIDAwIDAwIDAwIDAwIDAwIDAwPGJyPnJvb3RAY244MXh4
LW9ibWM6fiMgaXBtaXRvb2wgcmF3IDB4NiAweDI1IMKgIMKgIMKgIDxicj5VbmFibGUgdG8gc2Vu
ZCBSQVcgY29tbWFuZCAoY2hhbm5lbD0weDAgbmV0Zm49MHg2IGx1bj0weDAgY21kPTB4MjUgcnNw
PTB4ZmYpOiBVbnNwZWNpZmllZCBlcnJvcjxicj5yb290QGNuODF4eC1vYm1jOn4jIGlwbWl0b29s
IHJhdyAweDYgMHgyNSAtdnZ2dnY8YnI+TG9hZGluZyBJQU5BIFBFTiBSZWdpc3RyeS4uLjxicj7C
oCBBbGxvY2F0aW5nIMKgIMKgIDI5IGVudHJpZXM8YnI+wqAgWyDCoCDCoDI3XSAxNjc3NzIxNCB8
IEEgRGVidWcgQXNzaXN0aW5nIENvbXBhbnksIEx0ZC48YnI+wqAgWyDCoCDCoDI2XSDCoCDCoDUy
NTM4IHwgQW1wZXJlIENvbXB1dGluZzxicj7CoCBbIMKgIMKgMjVdIMKgIMKgNTE5NzQgfCBSYXB0
b3IgQ29tcHV0aW5nIFN5c3RlbXMsIExMQzxicj7CoCBbIMKgIMKgMjRdIMKgIMKgNDk3NjkgfCBZ
QURSTzxicj7CoCBbIMKgIMKgMjNdIMKgIMKgNDkxNTAgfCBWZXJ0aXYgQ288YnI+wqAgWyDCoCDC
oDIyXSDCoCDCoDQ4NTEyIHwgSW5zcHVyIEdyb3VwIENvLixMdGQuPGJyPsKgIFsgwqAgwqAyMV0g
wqAgwqA0ODQ4MiB8IExpbmFybyBMdGQ8YnI+wqAgWyDCoCDCoDIwXSDCoCDCoDQ1MDY1IHwgSW5z
eWRlPGJyPsKgIFsgwqAgwqAxOV0gwqAgwqA0MDk4MSB8IEZhY2Vib29rLCBJbmMuPGJyPsKgIFsg
wqAgwqAxOF0gwqAgwqA0MDA5MiB8IFdpd3lubiBDb3Jwb3JhdGlvbjxicj7CoCBbIMKgIMKgMTdd
IMKgIMKgMzMwNDkgfCBNZWxsYW5veCBUZWNobm9sb2dpZXMgTFREPGJyPsKgIFsgwqAgwqAxNl0g
wqAgwqAyMDk3NCB8IEFtZXJpY2FuIE1lZ2F0cmVuZHMsIEluYzxicj7CoCBbIMKgIMKgMTVdIMKg
IMKgMTkwNDYgfCBMZW5vdm8gRW50ZXJwcmlzZSBCdXNpbmVzcyBHcm91cDxicj7CoCBbIMKgIMKg
MTRdIMKgIMKgMTExODMgfCBNaXRhYyBJbnRlcm5hdGlvbmFsIENvcnAuPGJyPsKgIFsgwqAgwqAx
M10gwqAgwqAxMTEyOSB8IEdvb2dsZSwgSW5jLjxicj7CoCBbIMKgIMKgMTJdIMKgIMKgIDg1NTQg
fCBEZXBhcnRlbWVudCBFbGVrdHJvdGVjaG5paywgRVRIIFp1ZXJpY2g8YnI+wqAgWyDCoCDCoDEx
XSDCoCDCoCA3MjQ0IHwgUXVhbnRhIENvbXB1dGVyIEluYy48YnI+wqAgWyDCoCDCoDEwXSDCoCDC
oCA2NTY5IHwgSU5WRU5URUMgQ09SUE9SQVRJT048YnI+wqAgWyDCoCDCoCA5XSDCoCDCoCA0MTI4
IHwgQVJNIEx0ZC48YnI+wqAgWyDCoCDCoCA4XSDCoCDCoCAyNDg3IHwgUGhvZW5peCBUZWNobm9s
b2dpZXMgTHRkLjxicj7CoCBbIMKgIMKgIDddIMKgIMKgIDE2OTQgfCBIQ0wgVGVjaG5vbG9naWVz
IExpbWl0ZWQ8YnI+wqAgWyDCoCDCoCA2XSDCoCDCoCAxMjcxIHwgQ2llbmEgQ29ycG9yYXRpb248
YnI+wqAgWyDCoCDCoCA1XSDCoCDCoCDCoDY3NCB8IERlbGwgSW5jLjxicj7CoCBbIMKgIMKgIDRd
IMKgIMKgIMKgMzQzIHwgSW50ZWwgQ29ycG9yYXRpb248YnI+wqAgWyDCoCDCoCAzXSDCoCDCoCDC
oCDCoDIgfCBJQk0gKDxhIGhyZWY9Imh0dHBzOi8vdzMuaWJtLmNvbS9zdGFuZGFyZHMiIHRhcmdl
dD0iX2JsYW5rIj5odHRwczovL3czLmlibS5jb20vc3RhbmRhcmRzPC9hPiApPGJyPsKgIFsgwqAg
wqAgMl0gwqAgwqAgwqAgwqAwIHwgUmVzZXJ2ZWQ8YnI+wqAgWyDCoCDCoCAxXSDCoDEwNDg1NzUg
fCBVbnNwZWNpZmllZDxicj7CoCBbIMKgIMKgIDBdIMKgIMKgIMKgIMKgMCB8IFVua25vd248YnI+
PGI+UnVubmluZyBHZXQgUElDTUcgUHJvcGVydGllcyBteV9hZGRyIDB4MjAsIHRyYW5zaXQgMCwg
dGFyZ2V0IDA8YnI+RXJyb3IgcmVzcG9uc2UgMHhjMSBmcm9tIEdldCBQSUNNRyBQcm9wZXJ0aWVz
PGJyPjwvYj5SdW5uaW5nIEdldCBWU08gQ2FwYWJpbGl0aWVzIG15X2FkZHIgMHgyMCwgdHJhbnNp
dCAwLCB0YXJnZXQgMDxicj5JbnZhbGlkIGNvbXBsZXRpb24gY29kZSByZWNlaXZlZDogSW52YWxp
ZCBjb21tYW5kPGJyPkFjcXVpcmUgSVBNQiBhZGRyZXNzPGJyPkRpc2NvdmVyZWQgSVBNQiBhZGRy
ZXNzIDB4MDxicj5JbnRlcmZhY2UgYWRkcmVzczogbXlfYWRkciAweDIwIHRyYW5zaXQgMDowIHRh
cmdldCAweDIwOjAgaXBtYl90YXJnZXQgMDxicj48YnI+UkFXIFJFUSAoY2hhbm5lbD0weDAgbmV0
Zm49MHg2IGx1bj0weDAgY21kPTB4MjUgZGF0YV9sZW49MCk8YnI+VW5hYmxlIHRvIHNlbmQgUkFX
IGNvbW1hbmQgKGNoYW5uZWw9MHgwIG5ldGZuPTB4NiBsdW49MHgwIGNtZD0weDI1IHJzcD0weGZm
KTogVW5zcGVjaWZpZWQgZXJyb3I8YnI+cm9vdEBjbjgxeHgtb2JtYzp+Izxicj48L2k+PGJyPjxp
PnJvb3RAY244MXh4LW9ibWM6fiMgaXBtaXRvb2wgY2hhbm5lbCBpbmZvIDE8YnI+Q2hhbm5lbCAw
eDEgaW5mbzo8YnI+wqAgQ2hhbm5lbCBNZWRpdW0gVHlwZSDCoCA6IDgwMi4zIExBTjxicj7CoCBD
aGFubmVsIFByb3RvY29sIFR5cGUgOiBJUE1CLTEuMDxicj7CoCBTZXNzaW9uIFN1cHBvcnQgwqAg
wqAgwqAgOiBtdWx0aS1zZXNzaW9uPGJyPsKgIEFjdGl2ZSBTZXNzaW9uIENvdW50IMKgOiAwPGJy
PsKgIFByb3RvY29sIFZlbmRvciBJRCDCoCDCoDogNzE1NDxicj7CoCBWb2xhdGlsZShhY3RpdmUp
IFNldHRpbmdzPGJyPsKgIMKgIEFsZXJ0aW5nIMKgIMKgIMKgIMKgIMKgIMKgOiBlbmFibGVkPGJy
PsKgIMKgIFBlci1tZXNzYWdlIEF1dGggwqAgwqA6IGVuYWJsZWQ8YnI+wqAgwqAgVXNlciBMZXZl
bCBBdXRoIMKgIMKgIDogZW5hYmxlZDxicj7CoCDCoCBBY2Nlc3MgTW9kZSDCoCDCoCDCoCDCoCA6
IGFsd2F5cyBhdmFpbGFibGU8YnI+wqAgTm9uLVZvbGF0aWxlIFNldHRpbmdzPGJyPsKgIMKgIEFs
ZXJ0aW5nIMKgIMKgIMKgIMKgIMKgIMKgOiBlbmFibGVkPGJyPsKgIMKgIFBlci1tZXNzYWdlIEF1
dGggwqAgwqA6IGVuYWJsZWQ8YnI+wqAgwqAgVXNlciBMZXZlbCBBdXRoIMKgIMKgIDogZW5hYmxl
ZDxicj7CoCDCoCBBY2Nlc3MgTW9kZSDCoCDCoCDCoCDCoCA6IGFsd2F5cyBhdmFpbGFibGU8YnI+
cm9vdEBjbjgxeHgtb2JtYzp+IyA8YnI+PC9pPjxicj48aT5yb290QGNuODF4eC1vYm1jOn4jIGlw
bWl0b29sIHVzZXIgbGlzdCAxIMKgIDxicj5JRCDCoE5hbWUJIMKgIMKgIENhbGxpbiDCoExpbmsg
QXV0aAlJUE1JIE1zZyDCoCBDaGFubmVsIFByaXYgTGltaXQ8YnI+MSDCoCByb290IMKgIMKgIMKg
IMKgIMKgIMKgIGZhbHNlIMKgIHRydWUgwqAgwqAgwqAgdHJ1ZSDCoCDCoCDCoCBBRE1JTklTVFJB
VE9SPGJyPjIgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0cnVlIMKgIMKgZmFsc2UgwqAg
wqAgwqBmYWxzZSDCoCDCoCDCoE5PIEFDQ0VTUzxicj4zIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgdHJ1ZSDCoCDCoGZhbHNlIMKgIMKgIMKgZmFsc2UgwqAgwqAgwqBOTyBBQ0NFU1M8YnI+
NCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRydWUgwqAgwqBmYWxzZSDCoCDCoCDCoGZh
bHNlIMKgIMKgIMKgTk8gQUNDRVNTPGJyPjUgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0
cnVlIMKgIMKgZmFsc2UgwqAgwqAgwqBmYWxzZSDCoCDCoCDCoE5PIEFDQ0VTUzxicj42IMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHJ1ZSDCoCDCoGZhbHNlIMKgIMKgIMKgZmFsc2UgwqAg
wqAgwqBOTyBBQ0NFU1M8YnI+NyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRydWUgwqAg
wqBmYWxzZSDCoCDCoCDCoGZhbHNlIMKgIMKgIMKgTk8gQUNDRVNTPGJyPjggwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB0cnVlIMKgIMKgZmFsc2UgwqAgwqAgwqBmYWxzZSDCoCDCoCDCoE5P
IEFDQ0VTUzxicj45IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHJ1ZSDCoCDCoGZhbHNl
IMKgIMKgIMKgZmFsc2UgwqAgwqAgwqBOTyBBQ0NFU1M8YnI+MTAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgdHJ1ZSDCoCDCoGZhbHNlIMKgIMKgIMKgZmFsc2UgwqAgwqAgwqBOTyBBQ0NFU1M8
YnI+MTEgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdHJ1ZSDCoCDCoGZhbHNlIMKgIMKgIMKg
ZmFsc2UgwqAgwqAgwqBOTyBBQ0NFU1M8YnI+MTIgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
dHJ1ZSDCoCDCoGZhbHNlIMKgIMKgIMKgZmFsc2UgwqAgwqAgwqBOTyBBQ0NFU1M8YnI+MTMgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdHJ1ZSDCoCDCoGZhbHNlIMKgIMKgIMKgZmFsc2UgwqAg
wqAgwqBOTyBBQ0NFU1M8YnI+MTQgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdHJ1ZSDCoCDC
oGZhbHNlIMKgIMKgIMKgZmFsc2UgwqAgwqAgwqBOTyBBQ0NFU1M8YnI+MTUgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgdHJ1ZSDCoCDCoGZhbHNlIMKgIMKgIMKgZmFsc2UgwqAgwqAgwqBOTyBB
Q0NFU1M8YnI+cm9vdEBjbjgxeHgtb2JtYzp+IyBpcG1pdG9vbCB1c2VyIHN1bW1hcnkgMTxicj5N
YXhpbXVtIElEcwkgwqAgwqA6IDE1PGJyPkVuYWJsZWQgVXNlciBDb3VudCDCoDogMTxicj5GaXhl
ZCBOYW1lIENvdW50IMKgIMKgOiAwPGJyPnJvb3RAY244MXh4LW9ibWM6fiPCoDwvaT48YnI+PGJy
PjxpPnJvb3RAY244MXh4LW9ibWM6fiMgaXBtaXRvb2wgLUkgZGJ1cyB1c2VyIHNldCBuYW1lIDIg
bmV3dXNlcjxicj5TZXQgVXNlciBOYW1lIGNvbW1hbmQgZmFpbGVkICh1c2VyIDIsIG5hbWUgbmV3
dXNlcik6IFVuc3BlY2lmaWVkIGVycm9yPGJyPnJvb3RAY244MXh4LW9ibWM6fiPCoDwvaT48YnI+
PGJyPnRoeDxicj5zYW5kZWVwIFM8L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVv
dGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBUdWUsIEFwciA2LCAyMDIx
IGF0IDc6MzggUE0gVG9tIEpvc2VwaCAmbHQ7PGEgaHJlZj0ibWFpbHRvOnJ1c2h0b3RvbUBnbWFp
bC5jb20iIHRhcmdldD0iX2JsYW5rIj5ydXNodG90b21AZ21haWwuY29tPC9hPiZndDsgd3JvdGU6
PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjow
cHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtw
YWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRpcj0ibHRyIj48ZGl2IGRpcj0ibHRyIj48YSBocmVmPSJo
dHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9kb2NzL2Jsb2IvbWFzdGVyL0lQTUlUT09MLWNoZWF0
c2hlZXQubWQiIHRhcmdldD0iX2JsYW5rIj5kb2NzL0lQTUlUT09MLWNoZWF0c2hlZXQubWQgYXQg
bWFzdGVyIMK3IG9wZW5ibWMvZG9jcyAoZ2l0aHViLmNvbSk8L2E+PGJyPjwvZGl2PjwvZGl2Pjxi
cj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0
dHIiPk9uIE1vbiwgQXByIDUsIDIwMjEgYXQgMTE6MTcgUE0gc2FuZGVlcCBzaGFybWEgJmx0Ozxh
IGhyZWY9Im1haWx0bzpzYW5kZWVwYWplc2hAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+c2Fu
ZGVlcGFqZXNoQGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBj
bGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVy
LWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBk
aXI9Imx0ciI+DQoNCldlIGFyZSB3b3JraW5nIG9uIGEgcHJvdG90eXBlIGJhc2VkIG9uIGFzdDI2
MDDCoCBhbmQgY2FuIHNvbWVvbmUgcGxlYXNlIGhlbHAgbWUgd2l0aCBjb21tYW5kcyB0byBjcmVh
dGUgYSB1c2VyIHVzaW5nIGlwbWl0b29sIGluIG9wZW5ibWM/IElzIHRoZXJlIGFueSBsaW5rIHdo
aWNoIEkgY2FuIHJlZmVyIGZvciBhbGwgY29tbWFuZHMgcmVsYXRlZCB0byBpcG1pPzxkaXY+PGJy
PlN0ZXBzIEkgaGF2ZSB0cmllZDotPGJyPnJvb3RAY244MXh4LW9ibWM6fiMgaXBtaXRvb2wgdXNl
ciBzdW1tYXJ5IDE8YnI+TWF4aW11bSBJRHMJIMKgIMKgOiAxNTxicj5FbmFibGVkIFVzZXIgQ291
bnQgwqA6IDE8YnI+Rml4ZWQgTmFtZSBDb3VudCDCoCDCoDogMDxicj5yb290QGNuODF4eC1vYm1j
On4jIGlwbWl0b29sIHVzZXIgbGlzdCAxPGJyPklEIMKgTmFtZQkgwqAgwqAgQ2FsbGluIMKgTGlu
ayBBdXRoCUlQTUkgTXNnIMKgIENoYW5uZWwgUHJpdiBMaW1pdDxicj4xIMKgIHJvb3QgwqAgwqAg
wqAgwqAgwqAgwqAgZmFsc2UgwqAgdHJ1ZSDCoCDCoCDCoCB0cnVlIMKgIMKgIMKgIEFETUlOSVNU
UkFUT1I8YnI+MiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRydWUgwqAgwqBmYWxzZSDC
oCDCoCDCoGZhbHNlIMKgIMKgIMKgTk8gQUNDRVNTPGJyPjMgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB0cnVlIMKgIMKgZmFsc2UgwqAgwqAgwqBmYWxzZSDCoCDCoCDCoE5PIEFDQ0VTUzxi
cj40IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHJ1ZSDCoCDCoGZhbHNlIMKgIMKgIMKg
ZmFsc2UgwqAgwqAgwqBOTyBBQ0NFU1M8YnI+NSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHRydWUgwqAgwqBmYWxzZSDCoCDCoCDCoGZhbHNlIMKgIMKgIMKgTk8gQUNDRVNTPGJyPjYgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0cnVlIMKgIMKgZmFsc2UgwqAgwqAgwqBmYWxzZSDC
oCDCoCDCoE5PIEFDQ0VTUzxicj43IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHJ1ZSDC
oCDCoGZhbHNlIMKgIMKgIMKgZmFsc2UgwqAgwqAgwqBOTyBBQ0NFU1M8YnI+OCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHRydWUgwqAgwqBmYWxzZSDCoCDCoCDCoGZhbHNlIMKgIMKgIMKg
Tk8gQUNDRVNTPGJyPjkgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0cnVlIMKgIMKgZmFs
c2UgwqAgwqAgwqBmYWxzZSDCoCDCoCDCoE5PIEFDQ0VTUzxicj4xMCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB0cnVlIMKgIMKgZmFsc2UgwqAgwqAgwqBmYWxzZSDCoCDCoCDCoE5PIEFDQ0VT
Uzxicj4xMSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB0cnVlIMKgIMKgZmFsc2UgwqAgwqAg
wqBmYWxzZSDCoCDCoCDCoE5PIEFDQ0VTUzxicj4xMiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCB0cnVlIMKgIMKgZmFsc2UgwqAgwqAgwqBmYWxzZSDCoCDCoCDCoE5PIEFDQ0VTUzxicj4xMyDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB0cnVlIMKgIMKgZmFsc2UgwqAgwqAgwqBmYWxzZSDC
oCDCoCDCoE5PIEFDQ0VTUzxicj4xNCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB0cnVlIMKg
IMKgZmFsc2UgwqAgwqAgwqBmYWxzZSDCoCDCoCDCoE5PIEFDQ0VTUzxicj4xNSDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCB0cnVlIMKgIMKgZmFsc2UgwqAgwqAgwqBmYWxzZSDCoCDCoCDCoE5P
IEFDQ0VTUzxicj5yb290QGNuODF4eC1vYm1jOn4jIGlwbWl0b29sIHVzZXIgc2V0IG5hbWUgMiBu
ZXd1c2VyIMKgIMKgIMKgIDxicj5TZXQgVXNlciBOYW1lIGNvbW1hbmQgZmFpbGVkICh1c2VyIDIs
IG5hbWUgbmV3dXNlcik6IFVuc3BlY2lmaWVkIGVycm9yPGJyPnJvb3RAY244MXh4LW9ibWM6fiMg
aXBtaXRvb2wgdXNlciBzZXQgbmFtZSAyIG5ld3VzZXIgLXZ2IDxicj5Mb2FkaW5nIElBTkEgUEVO
IFJlZ2lzdHJ5Li4uPGJyPlJ1bm5pbmcgR2V0IFBJQ01HIFByb3BlcnRpZXMgbXlfYWRkciAweDIw
LCB0cmFuc2l0IDAsIHRhcmdldCAwPGJyPkVycm9yIHJlc3BvbnNlIDB4YzEgZnJvbSBHZXQgUElD
TUcgUHJvcGVydGllczxicj5SdW5uaW5nIEdldCBWU08gQ2FwYWJpbGl0aWVzIG15X2FkZHIgMHgy
MCwgdHJhbnNpdCAwLCB0YXJnZXQgMDxicj5JbnZhbGlkIGNvbXBsZXRpb24gY29kZSByZWNlaXZl
ZDogSW52YWxpZCBjb21tYW5kPGJyPkFjcXVpcmUgSVBNQiBhZGRyZXNzPGJyPkRpc2NvdmVyZWQg
SVBNQiBhZGRyZXNzIDB4MDxicj5JbnRlcmZhY2UgYWRkcmVzczogbXlfYWRkciAweDIwIHRyYW5z
aXQgMDowIHRhcmdldCAweDIwOjAgaXBtYl90YXJnZXQgMDxicj48YnI+U2V0IFVzZXIgTmFtZSBj
b21tYW5kIGZhaWxlZCAodXNlciAyLCBuYW1lIG5ld3VzZXIpOiBVbnNwZWNpZmllZCBlcnJvcjxi
cj5yb290QGNuODF4eC1vYm1jOn4jwqA8YnIgY2xlYXI9ImFsbCI+PGRpdj48YnI+PC9kaXY+LS0g
PGJyPjxkaXYgZGlyPSJsdHIiPjxkaXYgZGlyPSJsdHIiPjxkaXY+VGh4LTwvZGl2PjxkaXY+U2Fu
ZGVlcCBTPGJyPjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pg0KPC9ibG9ja3F1b3RlPjwv
ZGl2Pg0KPC9ibG9ja3F1b3RlPjwvZGl2PjxiciBjbGVhcj0iYWxsIj48ZGl2Pjxicj48L2Rpdj4t
LSA8YnI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdj5UaHgtPC9kaXY+PGRpdj5T
YW5kZWVwIFM8YnI+PC9kaXY+PC9kaXY+PC9kaXY+DQo8L2Jsb2NrcXVvdGU+PC9kaXY+PGJyIGNs
ZWFyPSJhbGwiPjxkaXY+PGJyPjwvZGl2Pi0tIDxicj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21h
aWxfc2lnbmF0dXJlIj48ZGl2IGRpcj0ibHRyIj48ZGl2PlRoeC08L2Rpdj48ZGl2PlNhbmRlZXAg
Uzxicj48L2Rpdj48L2Rpdj48L2Rpdj4NCg==
--000000000000cc996905bf6fdf7b--
