Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6573E53B6AA
	for <lists+openbmc@lfdr.de>; Thu,  2 Jun 2022 12:11:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDMHG42GGz3bm3
	for <lists+openbmc@lfdr.de>; Thu,  2 Jun 2022 20:11:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-nuvoton-onmicrosoft-com header.b=VwD7SB3S;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nuvoton.com (client-ip=2a01:111:f400:feae::60a; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=chli30@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-nuvoton-onmicrosoft-com header.b=VwD7SB3S;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LDMGk4Tkdz3bbj
	for <openbmc@lists.ozlabs.org>; Thu,  2 Jun 2022 20:10:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aa4ZZpLUeudKGrRCm8wB07MaWQz4AK/KePEflvqoaOeCj4sUBIAa4w/pq4bd9aMUbyOp+axIkeMqFbl/jnaZSblhXx3XzkBtMM5S52hSsDQXLZ3LgSEUIhT99O0OXAkIxUM1HuXwJI5Sz4C8e68gyYeGrk7viZpPtPXm1KlXQwoLOlfU/yPzXoqySr69UCWUGByXSEnWB8ar5xNNODhnN1sAWYfRFz3RlPiyAvnCpAF+dLgqW7tw9D3iq0RBwkzVyxdbf/w73Nck72ceau+9e0weB69FzRJV7Y8Vmj7u/KOrbeSx3X5RvAMPg4tx+K2/CrLkaf263eW7XO0u+ioNAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUSqUHGipcpJH4w4kG7Or2+tbQPx4H0UCVqtZwVBoBQ=;
 b=MUvFHHZkLgkzj8Jx4uzN/duGw4cW7sKsZfLFHz3Jw/OPpejfvl4/tF88b5VILjAuEgJNOUOU/6N3G1g13NKbJrWzCZdYycfpQGgVdTl3WDr8qbQdbXbKgC9ds+ROw8VzsyNfeRxPWLiXGk0y/fz56RlhshVadh6ZH4pF6JPGsl0OmmyNStHm2ohebCJsbtStJI/Ya/owBOXDkbkHvBbzcSIPwlQ6bSx7JjQT/e5tXJQb5tjAZfk+TBleI6Oe2CvZOXA4UeiJpnEtlXGYBl///yeUKGeTBg4OIl/bZUpcAEwUYY4zM+5amgJRs15hI/ChSZX79PJRl2uyvqQWOE4rPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUSqUHGipcpJH4w4kG7Or2+tbQPx4H0UCVqtZwVBoBQ=;
 b=VwD7SB3SnmKvYQSxiEkodU2XEJKc/up3XVt2VjL8HPu5bZ2Ue3z6OVyse6S9pS3J6U05od1HFp+ZJoX7DkptjsKBEin6Gv3bnyMyNcHWzRYvk4H89/CLrd15jIyVWQrqyBhuUeh7vkir6Uyh3c2zT7dFDFMkmKP/fVWlDYO5Tnc=
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com (2603:1096:203:bf::11)
 by KL1PR03MB4792.apcprd03.prod.outlook.com (2603:1096:820:15::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 10:10:31 +0000
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::154b:d390:51c5:ace6]) by HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::154b:d390:51c5:ace6%6]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 10:10:31 +0000
From: "CHLI30@nuvoton.com" <CHLI30@nuvoton.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"CHLI30@nuvoton.com" <CHLI30@nuvoton.com>, Tim Lee <timlee660101@gmail.com>
Subject: [phosphor-ipmi-host] static assertion be raised in aarch64 build
Thread-Topic: [phosphor-ipmi-host] static assertion be raised in aarch64 build
Thread-Index: Adh2Z9G2+bnxl2VkQTWfN7liTNyEBg==
Date: Thu, 2 Jun 2022 10:10:31 +0000
Message-ID:  <HK0PR03MB5090871797C500E962FC9550CFDE9@HK0PR03MB5090.apcprd03.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a224f30-a665-454d-f83b-08da44802082
x-ms-traffictypediagnostic: KL1PR03MB4792:EE_
x-microsoft-antispam-prvs:  <KL1PR03MB4792F298E7C68AB1187F86A1CFDE9@KL1PR03MB4792.apcprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  94Bgg4C9i1y9Gmh7Wpc0ro6t2a6yCYcYp1Fs21BN85Dq52DSDcZAeLFp02Z/jX3tzuFtcD7SizF8u83At2tAUYNWld1DImpGuauJEushDjFqyCPnAoXRKp6xFcCoaBxCk8ubtcEPmYroouz20tB0vfwa/MTYD4ob1pPQRh8mxVOSxf/dbSWTEOxLhuaoy8aD1Hs5kQzXfhCJ55C0vYVofVb1Ndp+ENN6KrsniwR6m+f20Y7IG4+0LIxsPyp0WxBJ1JbuOBQJDuhckMFcZNNuS9nP78QsTXnilmYSkZuSn1ISMVljdCQFJ6tEqWscmKPixaBT0YJCWWFFTbSbrHpLK6/2l01P8F1S+BqcP9b3oMb+hMy9PnD4uMg6VVRfqtB7M+uCdwtconRrRBI301jc9HRxtehb0m2y5HAgadXJ6/mO6sCLxKNV3qX/h7lHZxvD624Kg4BR4ndbY3jiIIDm/mLC4Y1GGXLG6DXvzs6ASQhPT59S1F8WXD3/DvsQ+e90UXQwlyOaWDR+Jf8WC6D6X6BJTH51uUpQtWnFwr0fOS5tJ71mxK9NUdaYAzGqWp5qMIkNov7cskgEOVLhlAmrUDDflCzMLDXJhMrDJzv88wftWl0G2uFBrZZsi9YUX3NiSsy+iqUgJA1Lq43f/iPVATDsf9nbc+B2W5d8rS5MJYlitzI7pf8bNWWx1GVjstiAkZgl8e5E653itcanNa3JXtWu4onF+tQVyX564IoDjdqXdJcQceCThncM8vPjev2iXLKDBKH9BI4I1HaDpzo/X26Il7I1BOImanr629ztLJWZjgACmJo3Tz7nh0y324Pp
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR03MB5090.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(316002)(38100700002)(83380400001)(8936002)(52536014)(9686003)(5660300002)(186003)(110136005)(8676002)(66556008)(64756008)(66476007)(66446008)(55016003)(71200400001)(76116006)(66946007)(508600001)(38070700005)(6506007)(7696005)(122000001)(33656002)(86362001)(414714003)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?w/eV+GfXeK8onn1ni4QjhzQnYkTKY8JRt5p0PIXSru38RcyFoPIxmNVnG4OX?=
 =?us-ascii?Q?dgLYSL9UL429MRaHLDm6z/4bZ8izRbJVuS+S5sXq5Aoj8b+Qi7gqexqyl9aw?=
 =?us-ascii?Q?A+jmzzzyawm1I2otpQpRgIe86oourZefvXFKV/Fon3NUpFPjH96Ik+U8r/YZ?=
 =?us-ascii?Q?MPmHO8iohRuEpVopWanGcioZdwT2gQM+mheJ5rEW5yefbopNrLO/uefrYLq6?=
 =?us-ascii?Q?1//UZaVUfw3yIlcrThkEJlvb58/VdTcS74/MbRGvl4Nkv3GTslE3E9yaJGLm?=
 =?us-ascii?Q?tfS41dQFGYl6I4e0y+QucFIdmYo1EGty0UHr7pVWaedY7nziq/bD/3LXs78R?=
 =?us-ascii?Q?GUCqZOWNsQj4IH9cdDiPqd5dFx1lKukww9452+RZ6sBLhyZ4CNh0R5RxqLnW?=
 =?us-ascii?Q?JsrCJKczObC/fcfWL92lWLz+8IcoBo3B8B18xbViEgStIDrFE0zmcT4zF7Mw?=
 =?us-ascii?Q?Wygah5lnQ9oUZSOe3SRtaNXsX3A9j7Cz2AHczWfAJpJx+ohTKLflw/9knKKl?=
 =?us-ascii?Q?YWp63l8OOobhgBuOBs/TyxXd006Jxzth2ExnFA1KlekXbJxPAfMuHs450yGt?=
 =?us-ascii?Q?DA/VedGn0N0tUQfqJE8/E+oRykn+hiZb5hW6YoCRufdQG8SAOefuPleuBIbU?=
 =?us-ascii?Q?9qapU2eAbiWVG5D/k2uQd1IdwYNfyPi7NohHlPQ0sV4xUX4KMmCZD5AWVqn2?=
 =?us-ascii?Q?cHIl1bq8Yt1tuDS4dKOEthTxLffF9mcm8nYD5GNgGrxbb0d5T41UIfMZfENT?=
 =?us-ascii?Q?zoZGJqvnJiWdbtM47UhRVBHpcNpQ1HdIeiQ2tTFevFuAVlNaA3J1VecTImgd?=
 =?us-ascii?Q?dGAsEDO0HVB/mioJcvCdjxLB14zBF2mDWQfBSaDMvHLsWgxgmo7erwwKaOBH?=
 =?us-ascii?Q?1hqBnYp0IPqgjF84ZR8IJbacvzgzGBIziKWM5zAsMxvBgZ8Nvb++vWpXMDeB?=
 =?us-ascii?Q?VIKmg6PpMyWH7gnXkIyiY4fmgQjCLCvgQn32gVY8Lx97heYjXi73vnLkCkR+?=
 =?us-ascii?Q?5WroCUMLqM0UWm8qW6qXcW60chTTNZFnTzAKpjfkoDClHlv6BNOqiSDqsu2H?=
 =?us-ascii?Q?uPQDaHThfsN5cP9/eUCJ23ZJD8ibyxAcUapd4uGrnSN+G1AREp3Kyyj45vJL?=
 =?us-ascii?Q?qUtEHWRPhwGwI8LnzCxxae0dqgIq7euvPpM898hPdZXxEb70evxL8c/1y3Xp?=
 =?us-ascii?Q?ndLwMNOHwCXT/lL4CDijmO4zmxzewPpN6vPLeM4NESkmycFeU2fy8hHQ31gl?=
 =?us-ascii?Q?TNdTkpOiGZunh0XW00A9IfGtDZWBMC/iIqGD1KG1x1oZm8grauWu5TGMA22H?=
 =?us-ascii?Q?8YsWJlkxpVXwDAk4IcNLm5cPJ6ygajnF41JAJN/BGo4VAihMaQ8QhgT0ZLnH?=
 =?us-ascii?Q?k6g0Z/PIcLMdFpgDltVlFDBWgVPlSXpEMbk3/UOieFHzLaRfudmdeRJv/fNs?=
 =?us-ascii?Q?9yVMHD+KYGzMj3m0tT3lh1KROPVxvHHGpk/xi7hKPoI+R3rglEKqAdTvFGIa?=
 =?us-ascii?Q?jB9V9qO+1FVHRerCniFYdhRgVsdxoR5ucwkThgJIcDZANZRhr8xAsmCnBP4C?=
 =?us-ascii?Q?9f4y1RZ2nuIQWK1ARO34WUH2j9qs67LuwubszEdKNZGGuJB+AEpRIUFDFy94?=
 =?us-ascii?Q?xRlrQq0JQmq4mFWsP8rjIaNRYmJSjgEzoN0vY9S1uvrs7vnAOUhRjIoy3aiv?=
 =?us-ascii?Q?BB4JJqaYjdnBG+KCgyE8zbTPa5aHy0RIWAiXX2rX0EV2EAuMvd0HUR8Aml2Q?=
 =?us-ascii?Q?Bq/2y7XqtK+KeCuUmKhTqKvVPq9AqS81Ys3WRv1r34+hvu5hHNvoKqd4iNo8?=
x-ms-exchange-antispam-messagedata-1: IeM1jVsPHu27WA==
Content-Type: multipart/alternative;
	boundary="_000_HK0PR03MB5090871797C500E962FC9550CFDE9HK0PR03MB5090apcp_"
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB5090.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a224f30-a665-454d-f83b-08da44802082
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2022 10:10:31.7990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HfPGwihHCFjEbQJ/LKHWvyFX9mcZ6yzROOOPf5uRDfBekBCg3DiFB4R+Gx+eK1M2VBlQzyD6FBhsrkbkVR6hqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB4792
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

--_000_HK0PR03MB5090871797C500E962FC9550CFDE9HK0PR03MB5090apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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

--_000_HK0PR03MB5090871797C500E962FC9550CFDE9HK0PR03MB5090apcp_
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
/* Page Definitions */
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

--_000_HK0PR03MB5090871797C500E962FC9550CFDE9HK0PR03MB5090apcp_--
