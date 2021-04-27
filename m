Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7398136CAF0
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 20:12:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FV8xm3VGvz3001
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 04:12:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 65 seconds by postgrey-1.36 at boromir;
 Wed, 28 Apr 2021 04:12:33 AEST
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FV8xY6xv8z2xMw
 for <openbmc@lists.ozlabs.org>; Wed, 28 Apr 2021 04:12:33 +1000 (AEST)
IronPort-SDR: XRwiLcS1PQ1hge1rHPV7P/kz3zvc7k7wm5KVqWMg1zyj/mDqvaS9muSvf29LPhnW50IK4YNnNo
 zAt7uh9YEptA==
X-IronPort-AV: E=McAfee;i="6200,9189,9967"; a="196119815"
X-IronPort-AV: E=Sophos;i="5.82,255,1613462400"; d="scan'208";a="196119815"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 11:11:24 -0700
IronPort-SDR: DNwVcSC7Z092btQJdXxxPEF8YHIpN3c3HQh8uRMjV8HhRyyiBZGnsi2oQFAq1F3z0PdycS9swt
 I1HRLNNkyLhA==
X-IronPort-AV: E=Sophos;i="5.82,255,1613462400"; d="scan'208";a="386237159"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.75])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 11:11:24 -0700
Subject: Re: Entity Manager error in tiogapass
To: Ed Tanous <edtanous@google.com>, Lei Yu <yulei.sh@bytedance.com>
References: <SG2PR04MB30936A198A555EEBC1DBF78AE1429@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <35577f35-feff-c87f-9948-ccdb6986b6db@intel.com>
 <CAGm54UG=qMjxSSPtPMEmnAWADjcsroa5L4sCj5FGopso3ViKOA@mail.gmail.com>
 <CAH2-KxAdB0bPwoqf_tJB+hMzgSoJ34iJfy1-cwKumUPk=KkvkA@mail.gmail.com>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Message-ID: <0b2957f2-dbf2-79c3-2788-b9105aef2db6@intel.com>
Date: Tue, 27 Apr 2021 11:11:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAH2-KxAdB0bPwoqf_tJB+hMzgSoJ34iJfy1-cwKumUPk=KkvkA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0MTaucxpZF5VXqgcZ3gIw3CPaq36zvwSt"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0MTaucxpZF5VXqgcZ3gIw3CPaq36zvwSt
Content-Type: multipart/mixed; boundary="nz8ZYq35yIINq0Vfr4cQpT4rijQWwnjXH";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: Ed Tanous <edtanous@google.com>, Lei Yu <yulei.sh@bytedance.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Jayashree D <jayashree-d@hcl.com>
Message-ID: <0b2957f2-dbf2-79c3-2788-b9105aef2db6@intel.com>
Subject: Re: Entity Manager error in tiogapass
References: <SG2PR04MB30936A198A555EEBC1DBF78AE1429@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <35577f35-feff-c87f-9948-ccdb6986b6db@intel.com>
 <CAGm54UG=qMjxSSPtPMEmnAWADjcsroa5L4sCj5FGopso3ViKOA@mail.gmail.com>
 <CAH2-KxAdB0bPwoqf_tJB+hMzgSoJ34iJfy1-cwKumUPk=KkvkA@mail.gmail.com>
In-Reply-To: <CAH2-KxAdB0bPwoqf_tJB+hMzgSoJ34iJfy1-cwKumUPk=KkvkA@mail.gmail.com>

--nz8ZYq35yIINq0Vfr4cQpT4rijQWwnjXH
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 4/27/21 9:54 AM, Ed Tanous wrote:
> On Mon, Apr 26, 2021 at 7:23 PM Lei Yu <yulei.sh@bytedance.com> wrote:
>> On Tue, Apr 27, 2021 at 12:35 AM Johnathan Mantey
>> <johnathanx.mantey@intel.com> wrote:
>>> Jayashree,
>>>
>>> On 4/26/21 9:00 AM, Jayashree D wrote:
>>>> Classification: *Confidential*
>>>>
>>>> Hi Team,
>>>>
>>>> In the latest build, I am facing the below issue in Entity Manager f=
or
>>>> tiogapass.
>>>>
>>>> Already issue has been created in Entity Manager Repo - entity-manag=
er
>>>> terminated by 'std::filesystem::__cxx11::filesystem_error' =C2=B7 Is=
sue #8
>>>> =C2=B7 openbmc/entity-manager (github.com)
>>>> <https://github.com/openbmc/entity-manager/issues/8>
>>>>
>>>> root@tiogapass:~# systemctl status
>>>> xyz.openbmc_project.EntityManager.service -l
>>>>
>>>> =E2=97=8F xyz.openbmc_project.EntityManager.service - Entity Manager=

>>>>
>>>>       Loaded: loaded
>>>> (]8;;file://tiogapass/lib/systemd/system/xyz.openbmc_project.EntityM=
anager.service/lib/systemd/system/xyz.openbmc_project.EntityManager.servi=
ce]8;;;
>>>> enabled; vendor preset: enabled)
>>>>
>>>>       Active: active (running) since Thu 1970-01-01 00:04:10 UTC; 25=
s ago
>>>>
>>>>      Process: 851 ExecStartPre=3D/bin/mkdir -p /var/configuration
>>>> (code=3Dexited, status=3D0/SUCCESS)
>>>>
>>>>      Process: 852 ExecStartPre=3D/bin/mkdir -p /tmp/overlays
>>>> (code=3Dexited, status=3D0/SUCCESS)
>>>>
>>>>     Main PID: 853 (entity-manager)
>>>>
>>>>       CGroup: /system.slice/xyz.openbmc_project.EntityManager.servic=
e
>>>>
>>>>               =E2=94=94=E2=94=80853 /usr/bin/entity-manager
>>>>
>>>> Jan 01 00:04:09 tiogapass systemd[1]: Starting Entity Manager...
>>>>
>>>> Jan 01 00:04:10 tiogapass systemd[1]: Started Entity Manager.
>>>>
>>>> Jan 01 00:04:27 tiogapass entity-manager[853]: Inventory Added
>>>>
>>>> Jan 01 00:04:27 tiogapass entity-manager[853]: terminate called afte=
r
>>>> throwing an instance of 'std::filesystem::__cxx11::filesystem_error'=

>>>>
>>>> Jan 01 00:04:27 tiogapass entity-manager[853]:   what():  filesystem=

>>>> error: recursive directory iterator cannot open directory: No such
>>>> file or directory [/sys/bus/i2c/devices/i2c-16]
>>>>
>>> Check this portion of src/Overlay.cpp
>>> static bool deviceIsCreated(const std::string& devicePath,
>>>                               std::shared_ptr<uint64_t> bus,
>>>                               std::shared_ptr<uint64_t> address,
>>>                               const bool retrying)
>>>
>>> I placed a comment describing the intent of the directory iterator. I=

>>> have not seen the issue described on our systems, nor in QEMU (report=
ed
>>> by another dev), so I'm not able to identify the issue.
>> The issue is reported at
>> https://github.com/openbmc/entity-manager/issues/8, and the commit
>> that introduces the issue is
>> https://github.com/openbmc/entity-manager/commit/9b86787adea3f8f29fac2=
acbb9fa0f48fbcf244a
>>
>> Could you kindly investigate the exception and see how to make it not =
crash?
> It sounds like Jonathan isn't able to reproduce.  Do you think you
> could capture the full stack trace from the exception?  Do you have
> anything odd on your systems that would cause the differing behavior?
>
>> --
>> BRs,
>> Lei YU

This may be just wishful thinking....
Looking at the JSON input file for bus 16:
"Bus": 16,
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Name=
": "MB_C2_AVA_RTEMP",

Would the recent sdbusplus encoding changes cause an issue?
The "_C2" is going to be translated into something that may be problemati=
c.

Does applying=20
https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/42512 change=20
anything?

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>



--nz8ZYq35yIINq0Vfr4cQpT4rijQWwnjXH--

--0MTaucxpZF5VXqgcZ3gIw3CPaq36zvwSt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEynmy4K0ckuoyjA+Ocg9x5uaKcAFAmCIU8sFAwAAAAAACgkQOcg9x5uaKcBN
Pgf8Cvfs53uZPMv852m8FGgeggGEqBaGJi1XbFVAyYjZMp/e/SZY0ckMlQd4ySQghzGUtV0yvCii
SeqQoI+UmcuKvjV3t0nakGAzCdPDwDWTA7XvfjqsVpF652WmR0heSv2seCKkg4lsUIpO7lXDsGRH
yP9UKsWeKXxivt4DnXPv7eGlfX3Stk+x5IIndJJ0A+E0A2312d5OZPsQee6RumZjHxP9CxSV5KUb
YrgQixB1V3rc3TAbF/JTekWu57NxhMCWaXNjGPfRoMYQNtBbcRSQvXc9EKLMIaFsXFiocwJpmkcI
GR+nau8rHg9N4IBtJnSWmg2H2QlYejpj5tvX/1kCgg==
=LOvd
-----END PGP SIGNATURE-----

--0MTaucxpZF5VXqgcZ3gIw3CPaq36zvwSt--
