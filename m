Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C26A36B6EA
	for <lists+openbmc@lfdr.de>; Mon, 26 Apr 2021 18:35:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTVqj2v7zz2yxm
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 02:35:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Tue, 27 Apr 2021 02:35:02 AEST
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FTVqV40c8z2xgN
 for <openbmc@lists.ozlabs.org>; Tue, 27 Apr 2021 02:35:02 +1000 (AEST)
IronPort-SDR: VM7XuOBoL5VDvByPV5OydKACW8Q4BUEIzF5VOHL8gHL4NCf/5yiF2TOqGd/kpa/qOUTPmAhngu
 XSuF8Ce5ovmg==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="260317853"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="260317853"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 09:33:47 -0700
IronPort-SDR: MWKvQR8PBY9wLBAtbmHXGvQTShizSxz45dpjSHsaO1xk7mUsSCZqEC1qjgmN3hz2mIGWid/XpA
 amTfVmaMHuhQ==
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="385849912"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.75])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 09:33:47 -0700
Subject: Re: Entity Manager error in tiogapass
To: Jayashree D <jayashree-d@hcl.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <SG2PR04MB30936A198A555EEBC1DBF78AE1429@SG2PR04MB3093.apcprd04.prod.outlook.com>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Message-ID: <35577f35-feff-c87f-9948-ccdb6986b6db@intel.com>
Date: Mon, 26 Apr 2021 09:32:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <SG2PR04MB30936A198A555EEBC1DBF78AE1429@SG2PR04MB3093.apcprd04.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0bNdOIKRMPCwgLwtPnaUHxm7rgkrvA61q"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0bNdOIKRMPCwgLwtPnaUHxm7rgkrvA61q
Content-Type: multipart/mixed; boundary="Ifvklf3dy9c4VGqVwTBI8pwgdxTtc6yi9";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: Jayashree D <jayashree-d@hcl.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <35577f35-feff-c87f-9948-ccdb6986b6db@intel.com>
Subject: Re: Entity Manager error in tiogapass
References: <SG2PR04MB30936A198A555EEBC1DBF78AE1429@SG2PR04MB3093.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB30936A198A555EEBC1DBF78AE1429@SG2PR04MB3093.apcprd04.prod.outlook.com>

--Ifvklf3dy9c4VGqVwTBI8pwgdxTtc6yi9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Jayashree,

On 4/26/21 9:00 AM, Jayashree D wrote:
>
> Classification: *Confidential*
>
> Hi Team,
>
> In the latest build, I am facing the below issue in Entity Manager for =

> tiogapass.
>
> Already issue has been created in Entity Manager Repo - entity-manager =

> terminated by 'std::filesystem::__cxx11::filesystem_error' =C2=B7 Issue=
 #8=20
> =C2=B7 openbmc/entity-manager (github.com)=20
> <https://github.com/openbmc/entity-manager/issues/8>
>
> root@tiogapass:~# systemctl status=20
> xyz.openbmc_project.EntityManager.service -l
>
> =E2=97=8F xyz.openbmc_project.EntityManager.service - Entity Manager
>
> =C2=A0=C2=A0=C2=A0=C2=A0 Loaded: loaded=20
> (]8;;file://tiogapass/lib/systemd/system/xyz.openbmc_project.EntityMana=
ger.service/lib/systemd/system/xyz.openbmc_project.EntityManager.service]=
8;;;=20
> enabled; vendor preset: enabled)
>
> =C2=A0=C2=A0=C2=A0=C2=A0 Active: active (running) since Thu 1970-01-01 =
00:04:10 UTC; 25s ago
>
> =C2=A0=C2=A0=C2=A0 Process: 851 ExecStartPre=3D/bin/mkdir -p /var/confi=
guration=20
> (code=3Dexited, status=3D0/SUCCESS)
>
> =C2=A0=C2=A0=C2=A0 Process: 852 ExecStartPre=3D/bin/mkdir -p /tmp/overl=
ays=20
> (code=3Dexited, status=3D0/SUCCESS)
>
> =C2=A0=C2=A0 Main PID: 853 (entity-manager)
>
> =C2=A0=C2=A0=C2=A0=C2=A0 CGroup: /system.slice/xyz.openbmc_project.Enti=
tyManager.service
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =E2=94=94=E2=94=80853 /usr/bin/entity-manager
>
> Jan 01 00:04:09 tiogapass systemd[1]: Starting Entity Manager...
>
> Jan 01 00:04:10 tiogapass systemd[1]: Started Entity Manager.
>
> Jan 01 00:04:27 tiogapass entity-manager[853]: Inventory Added
>
> Jan 01 00:04:27 tiogapass entity-manager[853]: terminate called after=20
> throwing an instance of 'std::filesystem::__cxx11::filesystem_error'
>
> Jan 01 00:04:27 tiogapass entity-manager[853]:=C2=A0=C2=A0 what():=C2=A0=
 filesystem=20
> error: recursive directory iterator cannot open directory: No such=20
> file or directory [/sys/bus/i2c/devices/i2c-16]
>

Check this portion of src/Overlay.cpp
static bool deviceIsCreated(const std::string& devicePath,
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 std::shared_ptr<uint64_t> bus,
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 std::shared_ptr<uint64_t> address,
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 const bool retrying)

I placed a comment describing the intent of the directory iterator. I=20
have not seen the issue described on our systems, nor in QEMU (reported=20
by another dev), so I'm not able to identify the issue.
>
> Regards,
>
> Jayashree
>
> ::DISCLAIMER::
> -----------------------------------------------------------------------=
-
> The contents of this e-mail and any attachment(s) are confidential and =

> intended for the named recipient(s) only. E-mail transmission is not=20
> guaranteed to be secure or error-free as information could be=20
> intercepted, corrupted, lost, destroyed, arrive late or incomplete, or =

> may contain viruses in transmission. The e mail and its contents (with =

> or without referred errors) shall therefore not attach any liability=20
> on the originator or HCL or its affiliates. Views or opinions, if any, =

> presented in this email are solely those of the author and may not=20
> necessarily reflect the views or opinions of HCL or its affiliates.=20
> Any form of reproduction, dissemination, copying, disclosure,=20
> modification, distribution and / or publication of this message=20
> without the prior written consent of authorized representative of HCL=20
> is strictly prohibited. If you have received this email in error=20
> please delete it and notify the sender immediately. Before opening any =

> email and/or attachments, please check them for viruses and other defec=
ts.
> -----------------------------------------------------------------------=
-

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>



--Ifvklf3dy9c4VGqVwTBI8pwgdxTtc6yi9--

--0bNdOIKRMPCwgLwtPnaUHxm7rgkrvA61q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEynmy4K0ckuoyjA+Ocg9x5uaKcAFAmCG6zkFAwAAAAAACgkQOcg9x5uaKcDz
jwf/YzQObAvviiYjZyAxFynDCDkNNrnnb0Z/eqDXZz6+4r7c3ijGzbXdpreL/x8zRRelRmNotDo8
RkRMP13jpTs4t25HnwFKBHP3LWmp/mcbvixw3d68hijMOGxL78y4ck60PGhSegWUGge8o8JtfvaN
+WjhR6m5YELqMNVrRXAlDC9BvWaCs5wR/RN7fUGxCED0AVBf3ltVm4n7qlCbQuxJka/J2hR+PaNf
Brx+wvKpkOV35rfOzFTg9CYeQqOK7uJVzH8wQkcFzGF7GtDLGtBeSOEKHVLEPYZN7736u7i/07eS
UIK7lpUz8+L5G25sgK8B2NOFcKzxQ+rltsXMwNUi6Q==
=+2t0
-----END PGP SIGNATURE-----

--0bNdOIKRMPCwgLwtPnaUHxm7rgkrvA61q--
