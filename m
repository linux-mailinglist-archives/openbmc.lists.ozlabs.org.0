Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F393436D9CB
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 16:47:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVhLh6dxDz303P
	for <lists+openbmc@lfdr.de>; Thu, 29 Apr 2021 00:47:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVhLV6rVpz2xYZ
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 00:47:24 +1000 (AEST)
IronPort-SDR: fooCWACogmrAA7p3gGUFzKGxczmMZ1HmyXmYMkH05sV3pTSx3q39sMGb78xyWF14lcA+IK1g5/
 LHF/gE+XdSHg==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="176870214"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="176870214"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 07:47:17 -0700
IronPort-SDR: p6MViUMe37Hi0RJeahOlaSqCB9KoefSFythHsSP5Vj0RS1sxq2OpW5IRbq37IoRdvCgZO2cKOC
 iu0g1+jTcfyQ==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="386542269"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.75])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 07:47:17 -0700
To: Jayashree D <jayashree-d@hcl.com>, Ed Tanous <edtanous@google.com>,
 Lei Yu <yulei.sh@bytedance.com>
References: <SG2PR04MB30936A198A555EEBC1DBF78AE1429@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <35577f35-feff-c87f-9948-ccdb6986b6db@intel.com>
 <CAGm54UG=qMjxSSPtPMEmnAWADjcsroa5L4sCj5FGopso3ViKOA@mail.gmail.com>
 <CAH2-KxAdB0bPwoqf_tJB+hMzgSoJ34iJfy1-cwKumUPk=KkvkA@mail.gmail.com>
 <0b2957f2-dbf2-79c3-2788-b9105aef2db6@intel.com>
 <SG2PR04MB30936D8EFD5142F6BD7CE0AFE1409@SG2PR04MB3093.apcprd04.prod.outlook.com>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Re: Entity Manager error in tiogapass
Message-ID: <0080861e-5421-3f73-1204-79bb121b7654@intel.com>
Date: Wed, 28 Apr 2021 07:47:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <SG2PR04MB30936D8EFD5142F6BD7CE0AFE1409@SG2PR04MB3093.apcprd04.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="fiKl3LDmHQJYp23vXUYYhYCe7Tho6GB9E"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fiKl3LDmHQJYp23vXUYYhYCe7Tho6GB9E
Content-Type: multipart/mixed; boundary="pv9q89SRpxKnBtDkfbGpjdAL1AhW15pNY";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: Jayashree D <jayashree-d@hcl.com>, Ed Tanous <edtanous@google.com>,
 Lei Yu <yulei.sh@bytedance.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <0080861e-5421-3f73-1204-79bb121b7654@intel.com>
Subject: Re: Entity Manager error in tiogapass
References: <SG2PR04MB30936A198A555EEBC1DBF78AE1429@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <35577f35-feff-c87f-9948-ccdb6986b6db@intel.com>
 <CAGm54UG=qMjxSSPtPMEmnAWADjcsroa5L4sCj5FGopso3ViKOA@mail.gmail.com>
 <CAH2-KxAdB0bPwoqf_tJB+hMzgSoJ34iJfy1-cwKumUPk=KkvkA@mail.gmail.com>
 <0b2957f2-dbf2-79c3-2788-b9105aef2db6@intel.com>
 <SG2PR04MB30936D8EFD5142F6BD7CE0AFE1409@SG2PR04MB3093.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB30936D8EFD5142F6BD7CE0AFE1409@SG2PR04MB3093.apcprd04.prod.outlook.com>

--pv9q89SRpxKnBtDkfbGpjdAL1AhW15pNY
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On 4/28/21 1:35 AM, Jayashree D wrote:
> Classification: Public
>
> Hi Johnathan,
>
> In tiogapass json file, Bus 16 is present. But driver (i2c-16) is not c=
reated in my hardware. So the crash occurs in entity manager.
> If this type of case occurs, can entity manager display this as error m=
assage not as crash ?
It's still unclear to me what the failure mode is based on the input=20
that has been provided.

The directory_iterator only iterates over directories/files that are=20
present. If i2c-16 isn't there, there won't be a path iterator value=20
assigned, and the code should continue looking for files that do exist.
There is also a secondary test to make sure the item in the path=20
iterator is a directory, and if it is not, the directory is ignored via=20
a "continue" statement.

The code prior to this commit used directory_iterator in a loop instead=20
of recursive_directory_iterator. The latter was suggested by Ed Tanous=20
to simplify the logic/indent level. I agreed the solution looked cleaner =

and implemented it. Perhaps this introduced an unexpected artifact that=20
did not exist in the preceding implementation of the directory recursion.=


> Regards,
> Jayashree.
>
> -----Original Message-----
> From: Johnathan Mantey <johnathanx.mantey@intel.com>
> Sent: Tuesday, April 27, 2021 11:41 PM
> To: Ed Tanous <edtanous@google.com>; Lei Yu <yulei.sh@bytedance.com>
> Cc: openbmc@lists.ozlabs.org; Jayashree D <jayashree-d@hcl.com>
> Subject: Re: Entity Manager error in tiogapass
>
>
>
> On 4/27/21 9:54 AM, Ed Tanous wrote:
>> On Mon, Apr 26, 2021 at 7:23 PM Lei Yu <yulei.sh@bytedance.com> wrote:=

>>> On Tue, Apr 27, 2021 at 12:35 AM Johnathan Mantey
>>> <johnathanx.mantey@intel.com> wrote:
>>>> Jayashree,
>>>>
>>>> On 4/26/21 9:00 AM, Jayashree D wrote:
>>>>> Classification: *Confidential*
>>>>>
>>>>> Hi Team,
>>>>>
>>>>> In the latest build, I am facing the below issue in Entity Manager
>>>>> for tiogapass.
>>>>>
>>>>> Already issue has been created in Entity Manager Repo -
>>>>> entity-manager terminated by
>>>>> 'std::filesystem::__cxx11::filesystem_error' =C2=B7 Issue #8 =C2=B7=

>>>>> openbmc/entity-manager (github.com)
>>>>> <https://github.com/openbmc/entity-manager/issues/8>
>>>>>
>>>>> root@tiogapass:~# systemctl status
>>>>> xyz.openbmc_project.EntityManager.service -l
>>>>>
>>>>> =E2=97=8F xyz.openbmc_project.EntityManager.service - Entity Manage=
r
>>>>>
>>>>>        Loaded: loaded
>>>>> (]8;;file://tiogapass/lib/systemd/system/xyz.openbmc_project.Entity=

>>>>> Manager.service/lib/systemd/system/xyz.openbmc_project.EntityManage=

>>>>> r.service]8;;;
>>>>> enabled; vendor preset: enabled)
>>>>>
>>>>>        Active: active (running) since Thu 1970-01-01 00:04:10 UTC;
>>>>> 25s ago
>>>>>
>>>>>       Process: 851 ExecStartPre=3D/bin/mkdir -p /var/configuration
>>>>> (code=3Dexited, status=3D0/SUCCESS)
>>>>>
>>>>>       Process: 852 ExecStartPre=3D/bin/mkdir -p /tmp/overlays
>>>>> (code=3Dexited, status=3D0/SUCCESS)
>>>>>
>>>>>      Main PID: 853 (entity-manager)
>>>>>
>>>>>        CGroup:
>>>>> /system.slice/xyz.openbmc_project.EntityManager.service
>>>>>
>>>>>                =E2=94=94=E2=94=80853 /usr/bin/entity-manager
>>>>>
>>>>> Jan 01 00:04:09 tiogapass systemd[1]: Starting Entity Manager...
>>>>>
>>>>> Jan 01 00:04:10 tiogapass systemd[1]: Started Entity Manager.
>>>>>
>>>>> Jan 01 00:04:27 tiogapass entity-manager[853]: Inventory Added
>>>>>
>>>>> Jan 01 00:04:27 tiogapass entity-manager[853]: terminate called
>>>>> after throwing an instance of 'std::filesystem::__cxx11::filesystem=
_error'
>>>>>
>>>>> Jan 01 00:04:27 tiogapass entity-manager[853]:   what():  filesyste=
m
>>>>> error: recursive directory iterator cannot open directory: No such
>>>>> file or directory [/sys/bus/i2c/devices/i2c-16]
>>>>>
>>>> Check this portion of src/Overlay.cpp static bool
>>>> deviceIsCreated(const std::string& devicePath,
>>>>                                std::shared_ptr<uint64_t> bus,
>>>>                                std::shared_ptr<uint64_t> address,
>>>>                                const bool retrying)
>>>>
>>>> I placed a comment describing the intent of the directory iterator.
>>>> I have not seen the issue described on our systems, nor in QEMU
>>>> (reported by another dev), so I'm not able to identify the issue.
>>> The issue is reported at
>>> https://github.com/openbmc/entity-manager/issues/8, and the commit
>>> that introduces the issue is
>>> https://github.com/openbmc/entity-manager/commit/9b86787adea3f8f29fac=

>>> 2acbb9fa0f48fbcf244a
>>>
>>> Could you kindly investigate the exception and see how to make it not=
 crash?
>> It sounds like Jonathan isn't able to reproduce.  Do you think you
>> could capture the full stack trace from the exception?  Do you have
>> anything odd on your systems that would cause the differing behavior?
>>
>>> --
>>> BRs,
>>> Lei YU
> This may be just wishful thinking....
> Looking at the JSON input file for bus 16:
> "Bus": 16,
>               "Name": "MB_C2_AVA_RTEMP",
>
> Would the recent sdbusplus encoding changes cause an issue?
> The "_C2" is going to be translated into something that may be problema=
tic.
>
> Does applying
> https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/42512 change a=
nything?
>
> --
> Johnathan Mantey
> Senior Software Engineer
> *azad te**chnology partners*
> Contributing to Technology Innovation since 1992
> Phone: (503) 712-6764
> Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>=

>
>
> ::DISCLAIMER::
> ________________________________
> The contents of this e-mail and any attachment(s) are confidential and =
intended for the named recipient(s) only. E-mail transmission is not guar=
anteed to be secure or error-free as information could be intercepted, co=
rrupted, lost, destroyed, arrive late or incomplete, or may contain virus=
es in transmission. The e mail and its contents (with or without referred=
 errors) shall therefore not attach any liability on the originator or HC=
L or its affiliates. Views or opinions, if any, presented in this email a=
re solely those of the author and may not necessarily reflect the views o=
r opinions of HCL or its affiliates. Any form of reproduction, disseminat=
ion, copying, disclosure, modification, distribution and / or publication=
 of this message without the prior written consent of authorized represen=
tative of HCL is strictly prohibited. If you have received this email in =
error please delete it and notify the sender immediately. Before opening =
any email and/or attachments, please check them for viruses and other def=
ects.
> ________________________________

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>



--pv9q89SRpxKnBtDkfbGpjdAL1AhW15pNY--

--fiKl3LDmHQJYp23vXUYYhYCe7Tho6GB9E
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEynmy4K0ckuoyjA+Ocg9x5uaKcAFAmCJdXQFAwAAAAAACgkQOcg9x5uaKcAc
lgf6Ax8g1B4u4L5hXbrmSL4WnyDkWdDmIoLdWE2b816BYyf21z3pL7pJtde6CoKjQHAo3Ig5szd+
PompZh9k2Q5cTKH5mOQEdm6xZPit9IYtpAq9aaKFe8Z7/OTQKOa6zc9yW+xvIw0eFQc6jNHu8rYI
CLJnljJ6Sz9yjRawSgsPcjFS8zi/8C5zdL2OH92nLbQGbpfxSM+P3eDMZstG09D8tpqP1IgaXKQ2
RH6v5qztnYeEvQofAcAPfAlkNDHYwESw2gMDRYmdZ/GTnd4Ov+lroJbb8U8nd38GpchUaQ6mdPaU
9NP3zqNL1RMgauflT6n3ykWKp3OvFWdWNxmM1Sej4Q==
=xLme
-----END PGP SIGNATURE-----

--fiKl3LDmHQJYp23vXUYYhYCe7Tho6GB9E--
