Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D32A53DF30
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 03:00:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGZsc1gXDz3bkd
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 11:00:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-nuvoton-onmicrosoft-com header.b=tZCxzFXs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nuvoton.com (client-ip=2a01:111:f400:feab::630; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=chli30@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-nuvoton-onmicrosoft-com header.b=tZCxzFXs;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGZs63j1xz2yw1
	for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2022 10:59:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dr2q44evEwJ6vDiGu/5OYOwQ71j+io74LOLhQsUT8IDWwdAXVbyelv5fJugVvti8GndJDD33nHv+CEz0deHZoF56HTw7XUEHLFj/yxZ8RULpo5eHB8rwLaQTc5FOS5RN6uyp1jSOzrdS4U6WyX6reRi7FB6coofa0S2jcETcZu5zB+xl3hKqK+uXERDlc5S7VAw8HReqimnxDJzXgclPBKE4PsX4JBs+Ej/ui17OhNJFFWMXZIpbEgnBCsQ9aYN1Wi65MnPQd5hTPxkFiZeUddiWPvb6xPvHLN0Zbz64CB6wWx15QcgXVCNIZKUSjy4I9MZU1VCExD0x8yjo9K9VpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cmb3eMwFeFcakkyoC/HPnI1EIy27k/Z/oHESrwLb1K8=;
 b=aog0glavftndxDdnuQoryqPxg0SGID/9eDKEvqtuYxwGMh1HalFZ8Aju90X/dK85IeyADD24/XW6GktbYz8wSTTzBG5/34dkDjKSGD9F+tI22BMgAVxrS3TEUetpWZAj8mxeQbblZHj3LQDg+Y3/2a4w65tPQgCRBTSlRslBkTvdYFO3jkAXex/ToQXm1QOVw9vESr3JVj2/B9gNhN4iUrO6dv6Qyi3cX5NLHKjcjSc8z7oVGgpxsUYRKcdXwiV9Nyv2bYc6twRlqPruSkSfvJPI7u/h8PWE28ZCQCQqz3EoHsZrulYserg3obq7k3QCVv1lKqfpZ5co1t3QiyY3dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cmb3eMwFeFcakkyoC/HPnI1EIy27k/Z/oHESrwLb1K8=;
 b=tZCxzFXsiIGXsLt4i/bBxZWRItinUqGetGlMZBLTzc9IRDCLK3AIkZO7ulek+U9PK1UoraIljiZWZqOH6zTihoOIISjsbGndtsz2FJB7rBrSa/u3owRKxlQVnjKikx1gB91tUj7uXhHUJmqzpHKo1HUszDNZoXsMYMo8xp+xEqg=
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com (2603:1096:203:bf::11)
 by PS1PR03MB3254.apcprd03.prod.outlook.com (2603:1096:803:48::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.9; Mon, 6 Jun
 2022 00:59:31 +0000
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::154b:d390:51c5:ace6]) by HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::154b:d390:51c5:ace6%6]) with mapi id 15.20.5332.009; Mon, 6 Jun 2022
 00:59:31 +0000
From: "CHLI30@nuvoton.com" <CHLI30@nuvoton.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Tim Lee
	<timlee660101@gmail.com>
Subject: RE: [phosphor-ipmi-host] static assertion be raised in aarch64 build
Thread-Topic: [phosphor-ipmi-host] static assertion be raised in aarch64 build
Thread-Index: Adh2Z9G2+bnxl2VkQTWfN7liTNyEBgC176Aw
Date: Mon, 6 Jun 2022 00:59:31 +0000
Message-ID:  <HK0PR03MB50902D3AB7CDA4D8073174C7CFA29@HK0PR03MB5090.apcprd03.prod.outlook.com>
References:  <HK0PR03MB5090871797C500E962FC9550CFDE9@HK0PR03MB5090.apcprd03.prod.outlook.com>
In-Reply-To:  <HK0PR03MB5090871797C500E962FC9550CFDE9@HK0PR03MB5090.apcprd03.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a80c2b7c-bd05-4aae-b6db-08da4757d0d0
x-ms-traffictypediagnostic: PS1PR03MB3254:EE_
x-microsoft-antispam-prvs:  <PS1PR03MB3254E881DDC4AD77CE82CAC0CFA29@PS1PR03MB3254.apcprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  NwDqxFq2ARP9dkdtLcSTHk3xXgCwurqMolTxJCcVAZrJISoAxFxnrWnVI2d5HqVIW+buURVlUxOalRLdCS6b5LjsN5FQAw5scvZYX1TOVWp7eINaf2Xfd2P0gqxZXBBq2D+z3BQfR0q4DfJpfPbbxWe/ha3AiTxiqENpzhb5Li4IUCpCMnZx2Euqhdr91Lsc33mJwN+kQ6ilS8wWpb33ARJ+2gQ8+6ndyKi3D2jvC5iJk9hquTZR8Qq8MneA3Tw6IeMAVYjzGN1ohxcnNyqicvz2JPdhxmK4cOBNvNQGgBbFqc1SqU8T9BnBswZEC2hAec5WZ6xXFOsO/yfEMXRUh0gmQxGo1U3IIWAgimtxvXI4hBwD7yjU4Lz5NqiRcG2tAF8ybU266LuBykTBvawU1SFJ3iXsNQLU387cOFV/IUs+xzO0wwsRalBjoafKNCfFZlGCt/io73PjqXJJ7KfvhI0iZ1gdsUizKpc6LUhUqBxK59EnNrL7BSgnecaFCJELPNfDHLpGYlooss/jrATu8vFP2z2FmJjEaoVM6sKXUg2sLNovK0t71Sq1KiZk3yAu/bLJcyj9Jkh7yrWTyAVvMCJ5S5ngX07Eq71ln+R3QD679dUsmdI6YvWKg4Em98rmZYCcDu2N9gXlh+y3sjr5JEz83mdGO3gpmeVmcseNVp2XdYclHaen5CzLCTBXS56sA1Eff91Crg2tHGTi4yRGihl9/48SxrvL4lV0ctqU5w0KhDWRaoG+BEKYku/cDsFm
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR03MB5090.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(186003)(9686003)(26005)(38070700005)(55016003)(5660300002)(316002)(71200400001)(107886003)(38100700002)(33656002)(53546011)(66446008)(64756008)(66476007)(7696005)(8936002)(86362001)(6506007)(66556008)(110136005)(66946007)(508600001)(4326008)(8676002)(83380400001)(76116006)(52536014)(2906002)(414714003)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?AXNlpNZV7kOID36zuHpL/p57wN1Rx9FvwFeQsc6G+weHglAyW7kAJcbKDuqk?=
 =?us-ascii?Q?1DQfpY2I/kaQi4P0SlYODXOCD7qFLym2WJiEUVyNPbqbHmFa/Z/ZBPlmqJ6T?=
 =?us-ascii?Q?xg6Lne9IL9ill7/zITHHoB6tZuy6ZF+aKpYV+zivG0XP3An1+iGeaTMjOc/o?=
 =?us-ascii?Q?kHN1GmWV4ggT0jrGMuSo09pOX9LR4XgWW8OIG/baCaip9wqiXliPNWnJBo5z?=
 =?us-ascii?Q?uBKdJhZDquDacvyZGJ4xxrU0HyR0PvxV/QwuBqqf16P9JsXDiLKf3ohe11el?=
 =?us-ascii?Q?oTaqu9demtg6VOWJFR/Jb4yxkBD/Q+J/w4DGMqzfSdAFnCdnR9E2kiKXCO3I?=
 =?us-ascii?Q?GP38GrhUoH7Jk9ZmsLcQxWAWsePhF4IfX32QOsrJa/EKqK7qhfuClBOaia5X?=
 =?us-ascii?Q?XerEDulnSdnGE2dzVxzC7AJrauTWbJvGDTrfKzdL1uKagFQb4E1eZ5iALkYq?=
 =?us-ascii?Q?Sn8GeEYdgPWBiRs3UsHiEqsOBpoUnWksJjqW8FIMwFrEYlEHaKKcBNFuLZvX?=
 =?us-ascii?Q?LLdPY690SMn5nTEY63HwHtdYPHrtlvvi1vLPsASoUhHJrayKRdwWwCAP4IFe?=
 =?us-ascii?Q?5p9mGxrvRR2G9NBGPb9de6NcaSjAOtOOmAdtlcPpKbDon9ghSrYTRslHM6A2?=
 =?us-ascii?Q?sC3v8rYFyG5J9QpS+XJtuSfIVTDKYZI3S4eKFExNQTXH/gsZoB3lbB8aqmrr?=
 =?us-ascii?Q?TTAamG9wzwaGwJDS8RkmADLGtBFPZpeZbi4T9LRHwLjjwOFd53KBCUUfdFYB?=
 =?us-ascii?Q?nec44fiaZnVC5xiKBMCoQ2U6OVMUzUzlCJs8zeIT9cpnXYTkxhffvXMarPam?=
 =?us-ascii?Q?Ueud08ogZMpV3WXftCUqyu6vPDVM6oCUVorOIYmbR2XSEls6ck4jil2ClhX1?=
 =?us-ascii?Q?61ogUKn41FwZCNcYRzO+I3A13q/NdF8zM4kuZsIQLu7KTxJ8aP+rFuHfiO48?=
 =?us-ascii?Q?0Eik7JxzAk9B5VzJMcp9ob5K8xjcLyOi78gibl1mf3I/494woWAzrDAPIaCb?=
 =?us-ascii?Q?qWTNYKXhh5tGvssN5cBrnitXnDinZqhERd0PF1Ei/7ECx+JgbEL6VmPN0m+t?=
 =?us-ascii?Q?QcPmODz9tD5fgVZ7Fu5vSDbbj5MvNyjtv0yF4AJwKQ/7ELb5mmM8UU6yDY46?=
 =?us-ascii?Q?FZZyODzuk3GAOTiAt44v4+vtBKIo2DF2DkJ00UYE+Rt4TpbU/bl1Np45YFQ2?=
 =?us-ascii?Q?jvhyr7uLpmRktzS79KSvxMkaQdw50mC2xOiGpWR60oJQw+2pR+RucSLbtDGD?=
 =?us-ascii?Q?iNnSg+7oYtXCoPtJ+MTXW9bIMuYiI8RV5eqJgXrC37w1As03iEyxi4EEpkmw?=
 =?us-ascii?Q?bSnMVHWq2OA2RNy0qK9ldahaa69U84oyvOqErls/97bTe26f7D3TtcJdhUx0?=
 =?us-ascii?Q?5O8WasJLGD/YxwojmubGCMr9eX2+1VS05NwKkUGsPc7MKCJGmJt1IvE2QqVu?=
 =?us-ascii?Q?W8t9jTqI2uemMkQ2XBlq9Wqo1fICopG0qa0R7RoHpmYiX1O672ji7kTCRNNt?=
 =?us-ascii?Q?Pk1Ld39IN2orH3KcnGzT+pz79YO7LqSKChuHWPK8aJ5qecSbAWMgKLgxj8uA?=
 =?us-ascii?Q?C9a6wg+rTWUtI0rJQX8Mk+Q5kNG5Vz9hXWZfhChH32LnHqn9twP44IIQfs9B?=
 =?us-ascii?Q?fLVgowElxaY1rbfTPADW5aqVaSyB113gQ3cIWnFckZa+TRsCXdHPtZI5b5Fq?=
 =?us-ascii?Q?iuhdGZx0BSyF/gbhsCrY2sVwZe8aT3eh3yQ8iET9RoXaETXAfYwFEQdAgQK4?=
 =?us-ascii?Q?L208buDapA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_HK0PR03MB50902D3AB7CDA4D8073174C7CFA29HK0PR03MB5090apcp_"
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB5090.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a80c2b7c-bd05-4aae-b6db-08da4757d0d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2022 00:59:31.7100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t5nZfBLyjDFD7JOTflno3UTiPnFS63TCnKzHja3/sB+sX2K0AhsnYqGZksHvBH7PJ2B9RL7C5xZZK6vAasNwfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR03MB3254
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
Cc: "CHLI30@nuvoton.com" <CHLI30@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR03MB50902D3AB7CDA4D8073174C7CFA29HK0PR03MB5090apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,
Here is the compile option different between arm and aarch64 platform.
The major difference is 'bit-64' vs. 'bit-32' and 'arm-64' vs. 'arm-32'.
Could someone know how to trace this kind of compile error only in aarch64 =
platform? Thanks in advance.

aarch64 compile option:
DEBUG: SITE files ['endian-little', 'bit-64', 'arm-common', 'arm-64', 'comm=
on-linux', 'common-glibc', 'aarch64-linux', 'common']

arm compile option:
DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32', 'comm=
on-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']

Best regards,
Tim
From: CS20 CHLi30 <CHLI30@nuvoton.com>
Sent: Thursday, June 2, 2022 6:11 PM
To: openbmc@lists.ozlabs.org; CS20 CHLi30 <CHLI30@nuvoton.com>; Tim Lee <ti=
mlee660101@gmail.com>
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

--_000_HK0PR03MB50902D3AB7CDA4D8073174C7CFA29HK0PR03MB5090apcp_
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
<br>
Here is the compile option different between arm and aarch64 platform.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">The maj=
or difference is 'bit-64' vs. 'bit-32' and 'arm-64' vs. 'arm-32'.<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Could s=
omeone know how to trace this kind of compile error only in aarch64 platfor=
m? Thanks in advance.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">aarch64=
 compile option:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">DEBUG: =
SITE files ['endian-little', 'bit-64', 'arm-common', 'arm-64', 'common-linu=
x', 'common-glibc', 'aarch64-linux', 'common']<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">arm com=
pile option:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">DEBUG: =
SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32', 'common-linu=
x', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']<o:p></o:p><=
/span></p>
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
<b>Sent:</b> Thursday, June 2, 2022 6:11 PM<br>
<b>To:</b> openbmc@lists.ozlabs.org; CS20 CHLi30 &lt;CHLI30@nuvoton.com&gt;=
; Tim Lee &lt;timlee660101@gmail.com&gt;<br>
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

--_000_HK0PR03MB50902D3AB7CDA4D8073174C7CFA29HK0PR03MB5090apcp_--
