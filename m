Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 952D554EF6C
	for <lists+openbmc@lfdr.de>; Fri, 17 Jun 2022 05:20:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPPSk3fkHz3bqW
	for <lists+openbmc@lfdr.de>; Fri, 17 Jun 2022 13:20:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-nuvoton-onmicrosoft-com header.b=qX54l28J;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nuvoton.com (client-ip=2a01:111:f400:feab::620; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=chli30@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-nuvoton-onmicrosoft-com header.b=qX54l28J;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20620.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPPSC2rKTz30JK
	for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2022 13:20:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FP+2xAu09hKCwXuhmxwa6/talwietbq1f5dPX+5ystNMUNaZY5EAv0na9DNm6C7Zlms1BjyshzS36OgK5YeW8SgopjbbrfpRXbC0IJHfXNWYhbf2Htw5/jtqdVuL4cpf/yj3EFxK0TUZFBpvPOUR5SPRJPFk7VlquZVnH8sVzZzv+RjjsuDu24xll/WQepzxscADWJPw1+b97bnyd7w7bwz6+OFnRuHtNLcBe1mseiPBL3dz2IOP03/bGuOaEYLwe/e6q0/i+JfdUlWpz9zyzMTiIeUpmsLEnjD9ghlfKJA2RHM+3o3LbHhdB9T/mEDyCQ3whcSmvEafx3ARLTpNAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhHtLpYcbwD2QTv9GqoPz2PndZZLJuVYKkLN5aqO/OI=;
 b=DhKKuejw5JJ31/09LCRHScfDw/M1DaCho6FNsVcrpOaA2R/pWJlKy9CSBSSHZjb8xjN1F1Z59eDhcVGJa0j0yvqYK47odCLM7xJRQ3v4es7hq6XX7m71+x3AFfFPimJBLToxAexssqP0iLVXgOvfVYcBlJu2E3nYWbixjcdO8RehjudBa2YD25K0dZt5x/UEr2xBTLS6XTHd6bSdAxGvtt7eQxqnzokItFOeNTdkk86DABVul1CZCya+6AWo4L0fWDxCv23zeu/ojvBLbvEnOIcwlXKdtXiGkOPRPUK6PIDyi/0ooxpN/6mT5IAHJgIMlRx/BdSYLyeqRHbFj7HhQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhHtLpYcbwD2QTv9GqoPz2PndZZLJuVYKkLN5aqO/OI=;
 b=qX54l28JWDcwIt69PaHHigi9Yow/gim0R75OzQG4DQvb+D6oRKFErTtl78uHdaJauLh/pA5b7sc68grapjNqLgTCIUdu4LRcsbqsQv/lBxUfnG4MzOSL3OdtEhMuQOFwovyiSN5zEqm8qKGlEMedrcaj6QMyPFgXf1eXuFK0e50=
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com (2603:1096:203:bf::11)
 by TY2PR03MB3949.apcprd03.prod.outlook.com (2603:1096:404:a9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.10; Fri, 17 Jun
 2022 03:20:04 +0000
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::154b:d390:51c5:ace6]) by HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::154b:d390:51c5:ace6%6]) with mapi id 15.20.5373.009; Fri, 17 Jun 2022
 03:20:04 +0000
From: "CHLI30@nuvoton.com" <CHLI30@nuvoton.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Tim Lee
	<timlee660101@gmail.com>
Subject: RE: [phosphor-ipmi-host] static assertion be raised in aarch64 build
Thread-Topic: [phosphor-ipmi-host] static assertion be raised in aarch64 build
Thread-Index: Adh7E1A0RBnDUQomT8akrW8kFEDvBAGzl48g
Date: Fri, 17 Jun 2022 03:20:04 +0000
Message-ID:  <HK0PR03MB5090F2D83AD05E5774A65910CFAF9@HK0PR03MB5090.apcprd03.prod.outlook.com>
References:  <HK0PR03MB5090481BE38DBC9CBC513F99CFA49@HK0PR03MB5090.apcprd03.prod.outlook.com>
In-Reply-To:  <HK0PR03MB5090481BE38DBC9CBC513F99CFA49@HK0PR03MB5090.apcprd03.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ea5453c-942f-4cdd-3cf5-08da501045ae
x-ms-traffictypediagnostic: TY2PR03MB3949:EE_
x-microsoft-antispam-prvs:  <TY2PR03MB3949B1A8D72A721D1B617286CFAF9@TY2PR03MB3949.apcprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  IDmLloombooxNNsZAmgJ7x7QWIXmWSQZYY4G8HO3oPd7Ds90NWLWdTNEbXDos35XPbuki5w0MiNuTj+RukVMY1ktap9SYktD17DyubFNPZe6ytodf/X7zitDfM771f0nJYBAHBdMPKRLaPric0OtdQEzBELxF06mYcvKG00lx5sCRlbPqrqzr1nIaLVr1z+UEgf1/yq/1DRQvEW4Xz7NnpoaQk582rOXjJQ1PyLGPYu/O43ksywgEk4kuf436p6reB2Cu/Lnu0W1oBjRyjAcbrmtpbT3DXSP/ZufD0QLRpeoedeXTVNVySW1hZGdYQ3yy1cD5A58hh9MzswzTvmCqf/3/AI9g/m2vjEDlDdQsSJDGB1cgdZwZI4sKpGVvZg+RSzOMs8eOA+varH60BA03edN/JZbI6pGiPtpDmNe7gi4c7RTIA6yxtOa3xo/48psCzT/rk80b9k/x/53Oz0/UNWCfIs4bePY/c/+HToUu3P5HFThqXjbtRg2CdMKyaA4BMDEOqNB+ZHzE5ng4jREelo786RIiqBPc7cQQnO/NVKvCEd+fVHKMKW6JyJNPn4Tu6oLAXti+XVnSxj0kiez2pylMxR+a//Tg6d3kgN71fSgzbsMBdHeEPTexqDrt6myIEW1IQEaZEjCbmuabvWqvlrQClbgkJzZ8kwsxk5p3ms5Z5HggOOVeShp4CBUWV8JeOsF6/8BxEMRon7Rbz/KSMfAq5rO+RluQ2g5iqOZ+22/bz+pmKKPfAfFGKaAo5Ob1OJOZ0ueukk1P7H1LeZWxi5gyJm9E1/pBz1rlOqJ2LxFaGNzDwutg8/+PwMEofdfHkXJeRn8MIvGxwpaaluiVQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR03MB5090.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(76116006)(71200400001)(55016003)(64756008)(66446008)(5660300002)(66476007)(9686003)(8936002)(66556008)(8676002)(38070700005)(7696005)(186003)(66946007)(110136005)(83380400001)(86362001)(53546011)(122000001)(26005)(38100700002)(316002)(166002)(966005)(33656002)(52536014)(2906002)(6506007)(508600001)(414714003)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?6njKJ3sjrqIpFG6sI7gXkNqvrlod+I65VXKk1ATj0MRd/XU32JI9XzGS93iV?=
 =?us-ascii?Q?PxLveGCk7S+aAXvIfDIvORKgqhFEUajqp+GMy25iZw3FQFVK5ESqZ3sCeDg4?=
 =?us-ascii?Q?6nqhghcMV376BhMiwviNPfRf44hUG39c0YrEJ4RVWaaJkpSmomEpGBNkuV1q?=
 =?us-ascii?Q?of4pilsjijeXPMx8V2zOHw52kOmpc+zT8YWCq7bI4VIVJax1aMDD8gYl26VG?=
 =?us-ascii?Q?7ciO6Ets+Ik5ajq63tjAoUsQjVzCxY+N82fEs0PcKkLoie802+LzYzNw97zb?=
 =?us-ascii?Q?wsmqjcDJa+ra8LAl0/8rObqWMU433Z2qxkBxm+w3vB0W5ecVFVc1cfIZd2Fq?=
 =?us-ascii?Q?eieJ4e+Eg3bSpp6X3A0ce7tts/ikxu7+O2JjqJQus1/4AQysgshZ56LzeqNN?=
 =?us-ascii?Q?W20EZyvnHo1NqSOX6qrwx3EZM+DmoFFSmD5kJ/JC0XyeyUcOWjubpNLDtbMR?=
 =?us-ascii?Q?MgPn/w7KHr2vI5U6QuL5zCXWhleV6lDpfO0O3pwsFJE8l51lkzPEelUlVzku?=
 =?us-ascii?Q?RytiPCOyqlps0xv89nMCaNKLAKHdJ99Fs4ntri6PgXh0CEj0uVH+my1HiIql?=
 =?us-ascii?Q?r8d3tRqaDJAAjAyQLMFqnY5/zuczN/YVD8S6RnnRIQaEErkB0U8XBUjt76eh?=
 =?us-ascii?Q?BNc+HlceS1nF9+Set/LkwWZwh3aJPHn0C905YAzaLrwc+FqD6Co5yJBEIxHr?=
 =?us-ascii?Q?5EhI6oKYcWJNazHVk3uONWktJ2/mctClJ5KnNGCSO1RvigXEpVi2LIgqRwJP?=
 =?us-ascii?Q?tLbp5mJB+6giO9KQuS5b/t95bZTZER4liqkdKv+yuwg905BSl145B/h35elh?=
 =?us-ascii?Q?J8xsTmsb0ZNm4Jx7LVpDuicZQmLOEOYmepF23SfHUhksGbEDrxGA6p/sLjvh?=
 =?us-ascii?Q?uY7dNYfqtL5eq/MqRs7QJlnHsnOa4p+0i4a2RBeLPilEDPGf7ZCeB9RjFVX8?=
 =?us-ascii?Q?lIsXcKKKhgjYXG7F9USmnBfofjzj3KDCLM3HjQ211jfoVonUX09F55gjXP6D?=
 =?us-ascii?Q?XEwnxvEZL5H6k4pHxl3NVHXwsVc96jyEXPRWsZHP0xquiEYqn2ZXqBa3Pab6?=
 =?us-ascii?Q?2OfhUXZXPMvDnlLdK6XadMH9IjULV/RlzPtEbEng+A2g9Wbk96N0IrHZYunM?=
 =?us-ascii?Q?+a+ciCJlRVJLpBSlSpz8D3OoRg8Hnr6FK6ewJrJeFepzVnzO4mhGk7UCyxNe?=
 =?us-ascii?Q?3wl3hkdx0J0Ycn6z3AeahP8XABoN/jPPxV/VRVxB7ozqhigIFxCIzM5R6yrK?=
 =?us-ascii?Q?A7j0N7ulWdh2CJJP88MzS8h9mlnD2jwEld+aCjJ1YlRaEw+v0xnuyB3RWaHs?=
 =?us-ascii?Q?XD+vYd6br7oUUpYvMT5TIwbXd7yEYdRvw0nzIgywjawBg1LHN7Xv1Aeuu33X?=
 =?us-ascii?Q?pJBFslVxHECX1ST4NRXmHrezzzuxtF3WNJlv0YjG8NBN2LVPWbVu7eOHohVW?=
 =?us-ascii?Q?6jq6XeN7wCozxKEUkEAerG0NMjL3exCbet09dv75J3eT18J2f/TM3nLHwbxg?=
 =?us-ascii?Q?r4fVHZgD19qQeV460V+KzAe45tVbY0yet1qI8QVgXqESv98Nhcx4YavG3GBU?=
 =?us-ascii?Q?jdUfFOkQO294LZq6iIrD644nFmPoOBkeA2cnxKSlgBHq9Q2HIoSt56opb1Tz?=
 =?us-ascii?Q?iwQ0hZqhnof3yeuJ4Epkvx0sWlZwY9mcGkMIZXPsHWi1Fvsq/vztPdc0mr39?=
 =?us-ascii?Q?yGI2fcgFSTxtnNb4klbINGAG0ZLqNxjpefLAzsMoa/tIwnyJX+AEOFfN3UXg?=
 =?us-ascii?Q?5Vo85AINIA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_HK0PR03MB5090F2D83AD05E5774A65910CFAF9HK0PR03MB5090apcp_"
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB5090.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea5453c-942f-4cdd-3cf5-08da501045ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2022 03:20:04.4779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Q2PdnlQdlZAkOkKMcR6PRCXZkiNtIt5ZRBmyTXhLVfR//LyO4MI3oIARrK2AQVwmjkAin6dy8o8w5KZSMaRfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR03MB3949
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

--_000_HK0PR03MB5090F2D83AD05E5774A65910CFAF9HK0PR03MB5090apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,
Share the root cause about this kind of compile error in ipmid at aarch64 p=
latform.
After debugging with boost/multiprecision owner, we have found the root cau=
se why boost v1.79.0 got this compile error in ipmid.
More detail you can refer from https://github.com/boostorg/multiprecision/i=
ssues/472

Summary root cause from boost community:
We changed all bit counts from unsigned to std::size_t,
specifically for platforms like arm64 (and windows!) where unsigned is narr=
ower than size_t
so that the maximum representable number isn't unnecessarily constrained.

This then changes the interface for cpp_int_backend to use size_t rather th=
an unsigned for the bit counts.
On most platforms and most use cases, this makes no perceptible difference,
but unfortunately this appears to be one situation where it really does mak=
e a difference. Apparently this is true even though:

template <unsigned N>
using fixed_uint_t =3D
    boost::multiprecision::number<boost::multiprecision::cpp_int_backend<
        N, N, boost::multiprecision::unsigned_magnitude,
        boost::multiprecision::unchecked, void>>;

Is declared with an unsigned parameter, when partially specializing for fix=
ed_uint_t
you need to use the actual type of the template parameter in the underlying=
 template, not the type used in the template alias! :(

Solution:
In boost v1.78.0 that use unsigned type for all bit counts, and v1.79.0 use=
 std::size_t type instead it.
Thus, ipmid need to change all usage of unsigned for bitcounts to a new typ=
edef bitcount_t which is size_t for Boost-1.79 and later,
and unsigned for Boost-1.78 and earlier.

Verified:
With this patch then ipmid compile error at aarch64 platform was resolved a=
nd ipmitool sdr command also pass.

Best regards,
Tim
From: CS20 CHLi30 <CHLI30@nuvoton.com>
Sent: Wednesday, June 8, 2022 4:41 PM
To: openbmc@lists.ozlabs.org; Tim Lee <timlee660101@gmail.com>; CS20 CHLi30=
 <CHLI30@nuvoton.com>
Subject: RE: [phosphor-ipmi-host] static assertion be raised in aarch64 bui=
ld

Dear All,

We have fixed this compile error of ipmid after we change boost version fro=
m v1.79.0 to v1.78.0.
(Using openbmc/poky/meta/recipes-support/boost/boost_1.78.0.bb instead of b=
oost_1.79.0.bb)

Previous boost v1.78.0 without this compile error in ipmid no matter arm or=
 aarch64 platform.
But, the latest boost v1.79.0 meet this compile error in ipmid only aarch64=
 platform when we upgrade newer openbmc.
Currently, we try to diff between v1.78.0 and v1.79.0 of boost. If there is=
 any finding, we will update it.

If you have some suggestions or opinions, welcome provide it. Thanks in adv=
ance.

Best regards,
Tim
From: CS20 CHLi30 <CHLI30@nuvoton.com<mailto:CHLI30@nuvoton.com>>
Sent: Thursday, June 2, 2022 6:11 PM
To: openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org>; CS20 CHLi30 =
<CHLI30@nuvoton.com<mailto:CHLI30@nuvoton.com>>; Tim Lee <timlee660101@gmai=
l.com<mailto:timlee660101@gmail.com>>
Subject: [phosphor-ipmi-host] static assertion be raised in aarch64 build

Hi All,
Is anyone meet this kind of static_assert() be raised in "pack.hpp" and "un=
pack.hpp"?

We meet one compile error in "aarch64" platform with the newer commit (5d38=
067).
However, the same commit without this compile error in "arm" platform.
I try to diff "arm" and "aarch64" compile options,
Unfortunately, didn't find any clues to fix this build error in aarch64 pla=
tform.

Error message of log.do_compile:
error: static assertion failed: Attempt to pack a type that has no IPMI unp=
ack operation
error: static assertion failed: Attempt to unpack a type that has no IPMI u=
npack operation
....
cc1plus: all warnings being treated as errors
Makefile:1344: recipe for target 'libipmi20_la-sensorhandler.lo' failed
make[2]: Leaving directory '/home/tim/npcm-master/openbmc/build/evb-npcm845=
/tmp/work/cortexa35-openbmc-linux/phosphor-ipmi-host/1.0+gitAUTOINC+5d38067=
181-r1/build'
Makefile:1599: recipe for target 'all-recursive' failed
make[2]: *** [libipmi20_la-sensorhandler.lo] Error 1
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory '/home/tim/npcm-master/openbmc/build/evb-npcm845=
/tmp/work/cortexa35-openbmc-linux/phosphor-ipmi-host/1.0+gitAUTOINC+5d38067=
181-r1/build'
ERROR: oe_runmake failed

More messages in log.do_compile:
/home/tim/npcm-master/openbmc/build/evb-npcm845/tmp/work/cortexa35-openbmc-=
linux/phosphor-ipmi-host/1.0+gitAUTOINC+5d38067181-r1/build/../git/include/=
ipmid/message/unpack.hpp: In instantiation of 'static int ipmi::message::de=
tails::UnpackSingle<A>::op(ipmi::message::Payload&, T&) [with T =3D boost::=
multiprecision::number<boost::multiprecision::backends::cpp_int_backend<24,=
 24, boost::multiprecision::unsigned_magnitude, boost::multiprecision::unch=
ecked, void>, boost::multiprecision::et_off>]':
/home/tim/npcm-master/openbmc/build/evb-npcm845/tmp/work/cortexa35-openbmc-=
linux/phosphor-ipmi-host/1.0+gitAUTOINC+5d38067181-r1/build/../git/include/=
ipmid/message.hpp:440:45:   required from 'int ipmi::message::Payload::unpa=
ck(Arg&&, Args&& ...) [with Arg =3D boost::multiprecision::number<boost::mu=
ltiprecision::backends::cpp_int_backend<24, 24, boost::multiprecision::unsi=
gned_magnitude, boost::multiprecision::unchecked, void>, boost::multiprecis=
ion::et_off>&; Args =3D {}]'
../git/ipmid-new.cpp:300:37:   required from here
/home/tim/npcm-master/openbmc/build/evb-npcm845/tmp/work/cortexa35-openbmc-=
linux/phosphor-ipmi-host/1.0+gitAUTOINC+5d38067181-r1/build/../git/include/=
ipmid/message/unpack.hpp:123:46: error: static assertion failed: Attempt to=
 unpack a type that has no IPMI unpack operation
  123 |                 utility::dependent_false<T>::value,
      |                                              ^~~~~
/home/tim/npcm-master/openbmc/build/evb-npcm845/tmp/work/cortexa35-openbmc-=
linux/phosphor-ipmi-host/1.0+gitAUTOINC+5d38067181-r1/build/../git/include/=
ipmid/message/unpack.hpp:123:46: note: 'std::integral_constant<bool, false>=
::value' evaluates to false
/home/tim/npcm-master/openbmc/build/evb-npcm845/tmp/work/cortexa35-openbmc-=
linux/phosphor-ipmi-host/1.0+gitAUTOINC+5d38067181-r1/build/../git/include/=
ipmid/message/unpack.hpp:126:5: error: no return statement in function retu=
rning non-void [-Werror=3Dreturn-type]
  126 |     }
      |     ^
......
/home/tim/npcm-master/openbmc/build/evb-npcm845/tmp/work/cortexa35-openbmc-=
linux/phosphor-ipmi-host/1.0+gitAUTOINC+5d38067181-r1/build/../git/include/=
ipmid/message/pack.hpp: In instantiation of 'static int ipmi::message::deta=
ils::PackSingle<A>::op(ipmi::message::Payload&, const T&) [with T =3D boost=
::multiprecision::number<boost::multiprecision::backends::cpp_int_backend<2=
4, 24, boost::multiprecision::unsigned_magnitude, boost::multiprecision::un=
checked, void>, boost::multiprecision::et_off>]':
/home/tim/npcm-master/openbmc/build/evb-npcm845/tmp/work/cortexa35-openbmc-=
linux/phosphor-ipmi-host/1.0+gitAUTOINC+5d38067181-r1/build/../git/include/=
ipmid/message.hpp:262:43:   required from 'int ipmi::message::Payload::pack=
(Arg&&, Args&& ...) [with Arg =3D boost::multiprecision::number<boost::mult=
iprecision::backends::cpp_int_backend<24, 24, boost::multiprecision::unsign=
ed_magnitude, boost::multiprecision::unchecked, void>, boost::multiprecisio=
n::et_off>&; Args =3D {}]'
../git/ipmid-new.cpp:308:16:   required from here
/home/tim/npcm-master/openbmc/build/evb-npcm845/tmp/work/cortexa35-openbmc-=
linux/phosphor-ipmi-host/1.0+gitAUTOINC+5d38067181-r1/build/../git/include/=
ipmid/message/pack.hpp:80:28: error: static assertion failed: Attempt to pa=
ck a type that has no IPMI pack operation
   80 |         static_assert(std::is_integral_v<T>,
      |                       ~~~~~^~~~~~~~~~~~~~~~

static_assert() in unpack.hpp:
template <typename T>
struct UnpackSingle
{
    static int op(Payload& p, T& t)
    {
            static_assert(
                utility::dependent_false<T>::value,
                "Attempt to unpack a type that has no IPMI unpack operation=
");

static_assert() in pack.hpp:
template <typename T>
struct PackSingle
{
    static int op(Payload& p, const T& t)
    {
        static_assert(std::is_integral_v<T>,
                      "Attempt to pack a type that has no IPMI pack operati=
on");

Best regards,
Tim
________________________________
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email to such a person, please kindly reply to=
 the sender indicating this fact and delete all copies of it from your comp=
uter and network server immediately. Your cooperation is highly appreciated=
. It is advised that any unauthorized use of confidential information of Nu=
voton is strictly prohibited; and any information in this email irrelevant =
to the official business of Nuvoton shall be deemed as neither given nor en=
dorsed by Nuvoton.

--_000_HK0PR03MB5090F2D83AD05E5774A65910CFAF9HK0PR03MB5090apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Hi All,=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Share t=
he root cause about this kind of compile error in ipmid at aarch64 platform=
.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">After d=
ebugging with boost/multiprecision owner, we have found the root cause why =
boost v1.79.0 got this compile error in ipmid.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">More de=
tail you can refer from
<a href=3D"https://github.com/boostorg/multiprecision/issues/472">https://g=
ithub.com/boostorg/multiprecision/issues/472</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"color:#1F497D">Summ=
ary root cause from boost community:<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">We chan=
ged all bit counts from unsigned to std::size_t,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">specifi=
cally for platforms like arm64 (and windows!) where unsigned is narrower th=
an size_t<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">so that=
 the maximum representable number isn't unnecessarily constrained.<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">This th=
en changes the interface for cpp_int_backend to use size_t rather than unsi=
gned for the bit counts.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">On most=
 platforms and most use cases, this makes no perceptible difference,<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">but unf=
ortunately this appears to be one situation where it really does make a dif=
ference. Apparently this is true even though:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">templat=
e &lt;unsigned N&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">using f=
ixed_uint_t =3D<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp; boost::multiprecision::number&lt;boost::multiprecision::cpp_int=
_backend&lt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; N, N, boost::multiprecision::unsigned_m=
agnitude,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; boost::multiprecision::unchecked, void&=
gt;&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Is decl=
ared with an unsigned parameter, when partially specializing for fixed_uint=
_t<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">you nee=
d to use the actual type of the template parameter in the underlying templa=
te, not the type used in the template alias! :(<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"color:#1F497D">Solu=
tion:<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">In boos=
t v1.78.0 that use unsigned type for all bit counts, and v1.79.0 use std::s=
ize_t type instead it.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Thus, i=
pmid need to change all usage of unsigned for bitcounts to a new typedef bi=
tcount_t which is size_t for Boost-1.79 and later,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">and uns=
igned for Boost-1.78 and earlier.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"color:#1F497D">Veri=
fied:<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">With th=
is patch then ipmid compile error at aarch64 platform was resolved and ipmi=
tool sdr command also pass.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Best re=
gards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Tim<o:p=
></o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt">F=
rom:</span></b><span lang=3D"EN-US" style=3D"font-size:11.0pt"> CS20 CHLi30=
 &lt;CHLI30@nuvoton.com&gt;
<br>
<b>Sent:</b> Wednesday, June 8, 2022 4:41 PM<br>
<b>To:</b> openbmc@lists.ozlabs.org; Tim Lee &lt;timlee660101@gmail.com&gt;=
; CS20 CHLi30 &lt;CHLI30@nuvoton.com&gt;<br>
<b>Subject:</b> RE: [phosphor-ipmi-host] static assertion be raised in aarc=
h64 build<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Dear Al=
l,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">We have=
 fixed this compile error of ipmid after we change boost version from v1.79=
.0 to v1.78.0.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">(Using =
openbmc/poky/meta/recipes-support/boost/boost_1.78.0.bb instead of boost_1.=
79.0.bb)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Previou=
s boost v1.78.0 without this compile error in ipmid no matter arm or aarch6=
4 platform.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">But, th=
e latest boost v1.79.0 meet this compile error in ipmid only aarch64 platfo=
rm when we upgrade newer openbmc.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Current=
ly, we try to diff between v1.78.0 and v1.79.0 of boost. If there is any fi=
nding, we will update it.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">If you =
have some suggestions or opinions, welcome provide it. Thanks in advance.<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Best re=
gards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Tim<o:p=
></o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt">F=
rom:</span></b><span lang=3D"EN-US" style=3D"font-size:11.0pt"> CS20 CHLi30=
 &lt;<a href=3D"mailto:CHLI30@nuvoton.com">CHLI30@nuvoton.com</a>&gt;
<br>
<b>Sent:</b> Thursday, June 2, 2022 6:11 PM<br>
<b>To:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs=
.org</a>; CS20 CHLi30 &lt;<a href=3D"mailto:CHLI30@nuvoton.com">CHLI30@nuvo=
ton.com</a>&gt;; Tim Lee &lt;<a href=3D"mailto:timlee660101@gmail.com">timl=
ee660101@gmail.com</a>&gt;<br>
<b>Subject:</b> [phosphor-ipmi-host] static assertion be raised in aarch64 =
build<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi All,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is anyone meet this kind of sta=
tic_assert() be raised in &quot;pack.hpp&quot; and &quot;unpack.hpp&quot;?<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We meet one compile error in &q=
uot;aarch64&quot; platform with the newer commit (5d38067).<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">However, the same commit withou=
t this compile error in &quot;arm&quot; platform.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I try to diff &quot;arm&quot; a=
nd &quot;aarch64&quot; compile options,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Unfortunately, didn't find any =
clues to fix this build error in aarch64 platform.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">Error message of log.do_comp=
ile:<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">error: static assertion failed:=
 Attempt to pack a type that has no IPMI unpack operation<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">error: static assertion failed:=
 Attempt to unpack a type that has no IPMI unpack operation<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">....<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">cc1plus: all warnings being tre=
ated as errors<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Makefile:1344: recipe for targe=
t 'libipmi20_la-sensorhandler.lo' failed<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">make[2]: Leaving directory '/ho=
me/tim/npcm-master/openbmc/build/evb-npcm845/tmp/work/cortexa35-openbmc-lin=
ux/phosphor-ipmi-host/1.0+gitAUTOINC+5d38067181-r1/build'<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Makefile:1599: recipe for targe=
t 'all-recursive' failed<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">make[2]: *** [libipmi20_la-sens=
orhandler.lo] Error 1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">make[1]: *** [all-recursive] Er=
ror 1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">make[1]: Leaving directory '/ho=
me/tim/npcm-master/openbmc/build/evb-npcm845/tmp/work/cortexa35-openbmc-lin=
ux/phosphor-ipmi-host/1.0+gitAUTOINC+5d38067181-r1/build'<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ERROR: oe_runmake failed<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">More messages in log.do_compile=
:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">/home/tim/npcm-master/openbmc/b=
uild/evb-npcm845/tmp/work/cortexa35-openbmc-linux/phosphor-ipmi-host/1.0+gi=
tAUTOINC+5d38067181-r1/build/../git/include/ipmid/message/unpack.hpp: In in=
stantiation of 'static int ipmi::message::details::UnpackSingle&lt;A&gt;::o=
p(ipmi::message::Payload&amp;,
 T&amp;) [with T =3D boost::multiprecision::number&lt;boost::multiprecision=
::backends::cpp_int_backend&lt;24, 24, boost::multiprecision::unsigned_magn=
itude, boost::multiprecision::unchecked, void&gt;, boost::multiprecision::e=
t_off&gt;]':<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">/home/tim/npcm-master/openbmc/b=
uild/evb-npcm845/tmp/work/cortexa35-openbmc-linux/phosphor-ipmi-host/1.0+gi=
tAUTOINC+5d38067181-r1/build/../git/include/ipmid/message.hpp:440:45:&nbsp;=
&nbsp; required from 'int ipmi::message::Payload::unpack(Arg&amp;&amp;,
 Args&amp;&amp; ...) [with Arg =3D boost::multiprecision::number&lt;boost::=
multiprecision::backends::cpp_int_backend&lt;24, 24, boost::multiprecision:=
:unsigned_magnitude, boost::multiprecision::unchecked, void&gt;, boost::mul=
tiprecision::et_off&gt;&amp;; Args =3D {}]'<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">../git/ipmid-new.cpp:300:37:&nb=
sp;&nbsp; required from here<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">/home/tim/npcm-master/openbmc/b=
uild/evb-npcm845/tmp/work/cortexa35-openbmc-linux/phosphor-ipmi-host/1.0+gi=
tAUTOINC+5d38067181-r1/build/..<b>/git/include/ipmid/message/unpack.hpp:123=
:46: error: static assertion failed:
 Attempt to unpack a type that has no IPMI unpack operation</b><o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp; 123 |&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; utility::dependent_false&lt;T&gt;::value,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">/home/tim/npcm-master/openbmc/b=
uild/evb-npcm845/tmp/work/cortexa35-openbmc-linux/phosphor-ipmi-host/1.0+gi=
tAUTOINC+5d38067181-r1/build/../git/include/ipmid/message/unpack.hpp:123:46=
: note: 'std::integral_constant&lt;bool,
 false&gt;::value' evaluates to false<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">/home/tim/npcm-master/openbmc/b=
uild/evb-npcm845/tmp/work/cortexa35-openbmc-linux/phosphor-ipmi-host/1.0+gi=
tAUTOINC+5d38067181-r1/build/../git/include/ipmid/message/unpack.hpp:126:5:=
 error: no return statement in function
 returning non-void [-Werror=3Dreturn-type]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp; 126 |&nbsp;&nbsp;&nbsp;&=
nbsp; }<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp; ^<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">......<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">/home/tim/npcm-master/openbmc/b=
uild/evb-npcm845/tmp/work/cortexa35-openbmc-linux/phosphor-ipmi-host/1.0+gi=
tAUTOINC+5d38067181-r1/build/../git/include/ipmid/message/pack.hpp: In inst=
antiation of 'static int ipmi::message::details::PackSingle&lt;A&gt;::op(ip=
mi::message::Payload&amp;,
 const T&amp;) [with T =3D boost::multiprecision::number&lt;boost::multipre=
cision::backends::cpp_int_backend&lt;24, 24, boost::multiprecision::unsigne=
d_magnitude, boost::multiprecision::unchecked, void&gt;, boost::multiprecis=
ion::et_off&gt;]':<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">/home/tim/npcm-master/openbmc/b=
uild/evb-npcm845/tmp/work/cortexa35-openbmc-linux/phosphor-ipmi-host/1.0+gi=
tAUTOINC+5d38067181-r1/build/../git/include/ipmid/message.hpp:262:43:&nbsp;=
&nbsp; required from 'int ipmi::message::Payload::pack(Arg&amp;&amp;,
 Args&amp;&amp; ...) [with Arg =3D boost::multiprecision::number&lt;boost::=
multiprecision::backends::cpp_int_backend&lt;24, 24, boost::multiprecision:=
:unsigned_magnitude, boost::multiprecision::unchecked, void&gt;, boost::mul=
tiprecision::et_off&gt;&amp;; Args =3D {}]'<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">../git/ipmid-new.cpp:308:16:&nb=
sp;&nbsp; required from here<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">/home/tim/npcm-master/openbmc/b=
uild/evb-npcm845/tmp/work/cortexa35-openbmc-linux/phosphor-ipmi-host/1.0+gi=
tAUTOINC+5d38067181-r1/build/..<b>/git/include/ipmid/message/pack.hpp:80:28=
: error: static assertion failed: Attempt
 to pack a type that has no IPMI pack operation</b><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; 80 |&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static_assert(std::is_integral_v&lt;T&gt=
;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ~~~~~^~~~~~~~~~~=
~~~~~<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">static_assert() in unpack.hp=
p:<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">template &lt;typename T&gt;<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">struct UnpackSingle<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">{<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; static int o=
p(Payload&amp; p, T&amp; t)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; {<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static_assert(<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; utility::depend=
ent_false&lt;T&gt;::value,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Attempt t=
o unpack a type that has no IPMI unpack operation&quot;);<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">static_assert() in pack.hpp:=
<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">template &lt;typename T&gt;<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">struct PackSingle<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">{<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; static int o=
p(Payload&amp; p, const T&amp; t)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; {<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; static_assert(std::is_integral_v&lt;T&gt;,<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &quot;Attempt to pack a type that has no IPMI pack ope=
ration&quot;);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best regards,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Tim<o:p></o:p></span></p>
</div>
<hr align=3D"center" width=3D"100%">
<span style=3D"font-size:12pt;line-height:0.7;font-family: 'Arial'; color:#=
808080">The privileged confidential information contained in this email is =
intended for use only by the addressees as indicated by the original sender=
 of this email. If you are not the
 addressee indicated in this email or are not responsible for delivery of t=
he email to such a person, please kindly reply to the sender indicating thi=
s fact and delete all copies of it from your computer and network server im=
mediately. Your cooperation is highly
 appreciated. It is advised that any unauthorized use of confidential infor=
mation of Nuvoton is strictly prohibited; and any information in this email=
 irrelevant to the official business of Nuvoton shall be deemed as neither =
given nor endorsed by Nuvoton.
</span>
</body>
</html>

--_000_HK0PR03MB5090F2D83AD05E5774A65910CFAF9HK0PR03MB5090apcp_--
