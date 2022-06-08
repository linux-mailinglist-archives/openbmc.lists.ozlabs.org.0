Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CE15429A4
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 10:41:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJ11H2xkwz3bgR
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 18:41:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-nuvoton-onmicrosoft-com header.b=QJsdW/EJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nuvoton.com (client-ip=2a01:111:f403:704b::62d; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=chli30@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-nuvoton-onmicrosoft-com header.b=QJsdW/EJ;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2062d.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJ10l54qxz30F8
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 18:41:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOUsOapbBn6WA8tzU3eieHbjksremOfi5X0E74Rlnx2OhsXH8sQPzA6r/ManBD6GfrGKWF3uDZTlwywynPonwMGx0E6Ew9pxawRY8OVVK5IbmYtmGYmkzpM/MevjYzGky1sZL0dM/EpfxsPN23c4gb9Xp6fDRVEUyNAMDk+A3hQuv042sqF7eGkZEQUAweiHHKOyu5QMy2FXYkXfEJctlTUTxmYbkWNA1Hp1QVJK7cxnVFe/qHl31VspJBSX2dl1FhKTgfIIa3do+OzgcFBc4NrHdK/DDwA8/atAJpCFcu5sZScpNp0bndbMm9Wx6AQWOAMRXS+4DAFGVmtTmsi9pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kz1f9PWdK3j2qvzXe7bQvgDIDVwoVBch6P3M407AgKE=;
 b=OjremiZqIUsdneyyXj7cCZuN6EmZFjzWnez8ZkXaGOrrAwabpj4jA/LQebRwSYItEn+VGHKQORxuuCK6INUv8zmNZsxo4bSkPp3hl4fhavPkS/ja4PPjXJvSGGQ4aaUyMo/CzN0cG1szLPXz4hi7fvGebhGTrCazGCXUXwTtZpQIsv5hjIHUo0k7t6SQuEqslgC9jf4OVHXPlyDeQtkaU/6ipx19m6QVP5rC+Ceobw3cgMksaV1JAHAhBJOBaq+XrO2+cODIFV11jm9VJWtUEbC7UN5muAyKwBzu9mnLScAdvcn4/sbrMisptdIOS4eGNNaFGRpLL3SAf310HLc2QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kz1f9PWdK3j2qvzXe7bQvgDIDVwoVBch6P3M407AgKE=;
 b=QJsdW/EJ9HgO+MUyL7WIrSaAbjzHohn0rQGQyk+QPyzeQJ/H+h7K7ZG6IHeNb37iQCGcdLsSOe8/wqGzOrnz0o5ZZVkFDgX5gD/MOAXyFCtXEKW6A0tm+4apeMCNjKe2/d4Lj1I4JU+E9sIphOmg8NCYqW5DuhDPKw6BO1ETdLA=
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com (2603:1096:203:bf::11)
 by SG2PR03MB4599.apcprd03.prod.outlook.com (2603:1096:4:81::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Wed, 8 Jun
 2022 08:41:01 +0000
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::154b:d390:51c5:ace6]) by HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::154b:d390:51c5:ace6%6]) with mapi id 15.20.5332.010; Wed, 8 Jun 2022
 08:41:01 +0000
From: "CHLI30@nuvoton.com" <CHLI30@nuvoton.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Tim Lee
	<timlee660101@gmail.com>, "CHLI30@nuvoton.com" <CHLI30@nuvoton.com>
Subject: RE: [phosphor-ipmi-host] static assertion be raised in aarch64 build
Thread-Topic: [phosphor-ipmi-host] static assertion be raised in aarch64 build
Thread-Index: Adh7E1A0RBnDUQomT8akrW8kFEDvBA==
Date: Wed, 8 Jun 2022 08:41:00 +0000
Message-ID:  <HK0PR03MB5090481BE38DBC9CBC513F99CFA49@HK0PR03MB5090.apcprd03.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6388bf1-c6b9-4b35-7282-08da492a9dbd
x-ms-traffictypediagnostic: SG2PR03MB4599:EE_
x-microsoft-antispam-prvs:  <SG2PR03MB4599DBF361EE26F93E39677ACFA49@SG2PR03MB4599.apcprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  9ovltT+4K6w9AVlxYwSHjBOxUYnn1brbT3VJJCLGHNTfhRbp9IP3EA80l9BnwGeL+ms/36sSZ7d7nBbvzH3k8Fg73DbWNwqOnTnuPLousKoHf2poONOH9T0+GIzXbFmg3+VKkWUE/H2r/AWjyzPq1FGsXHPQUUgs5cJbxjXy+x67qVF82FkeVo0M4crukdV8bK2+UCNz5WQjLiGNpC+HXwkUoQbaVE/TugmbL1R7c+4PhwrfGRwv7HMW+J7phLtHrRCr6qjaL45K+5MDuwpoibbQG5HN/E8VEgKblrLk8SXuSfG7enfqqQFrdH45H9r44ZZ0S80zblgFAYzl/xcefICbwdmXNQlSh8EKHwZrPeH7FCocDlmK72N+k+gvzNBCgE2XH6WE+BhVl8FtAmkTXZaLlPV/qurNDqzYfH4roHYep0f/OsaBiIxeOGjvxLus05GlbWKBJUjcXxOnlH890HDlASUeQUS/NCzcmVGE1U4wtpCrEpSrAEZVUgRyimY8ndfOrT+xsUpP19YriCwo+UbhJuQ+35p4At2SwqM7dRygi9mnm4kBt5mer3reqpis2EDk/dAK0Sg0lQlCOhwViehDWanyVnEbQopQDfwP1wyj+0pQOvG8vInN+rqFQeFK4ZP+47+L1W8WJXB/8kMSy3Ep2e5G0MMSswlSnxfPCXktxDYzpOCABVP40dr/3UVMEQI/2/VP+y99AxsB2OOa2fV0wuwRk//n+OgpEk5ghW7tksaZu0wu3fgX9cXKAvh7MwXGyXx30YbqoON1FBwcZI4Um1E9tSZ9cyPsA+PxyZb4vv4+n7DwTdNrt/2IK9Uc
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR03MB5090.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(2906002)(64756008)(66476007)(66946007)(66446008)(66556008)(33656002)(5660300002)(38100700002)(83380400001)(508600001)(26005)(52536014)(8936002)(76116006)(71200400001)(110136005)(316002)(122000001)(55016003)(186003)(7696005)(86362001)(6506007)(53546011)(9686003)(38070700005)(414714003)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?z6oExh8zM4qq/JtTjOZnZaX9Qs7k0bbSt68ATA2YYbS006jMlDWHl8CwYkXx?=
 =?us-ascii?Q?6rDNeaQlypd3s5xnAldk8pkZLQ13hI1RukCn4eUn2XB4jPdwUcY8QRJH3Zjl?=
 =?us-ascii?Q?zE+w2krhvX5tVWNof2tn3cf6ZYUtO5WYWChrYgluu6ekPXHyGelBMTvYNNW1?=
 =?us-ascii?Q?SCpHKd65ORHHvkv5E+z8N7dEk/T1Z6RgVrsoQDTIe8R0I5fn4p2oWFr2jWdY?=
 =?us-ascii?Q?C4S+UTflFbVNZOl7p2eUjuxz6l+u+RsI73Zak2F0cYBnAhpdz52+ibp43OEa?=
 =?us-ascii?Q?oZa2/tPTaxxEs8T0N8t0x1jSXLqk/wtkE6Ze0f28G9Tn1ZT2j0ERkwGFKP06?=
 =?us-ascii?Q?02vUiKvqhxYOZ2RMLQMfHmmWo7tO5rer2hhPJ/9MaNC5jw9p8/h2o1mPIzug?=
 =?us-ascii?Q?fdxNddztHemw345k7RhwzMJDi/X0C+YCrsWK2sGpYxah4ByZuD49d2kN2uSC?=
 =?us-ascii?Q?gopqN/LoXgLe7Yybc0Wgy8J4wnu+TfrmCj5SGkxkThPCaov38pTvFNwsaUlu?=
 =?us-ascii?Q?mUgmifMVD499Yl0HehY4WNNWGQTvZ7PEuvnPQKgYoGJW+IKSggufo3Ml5bmz?=
 =?us-ascii?Q?c1VZ6jXb52UUYAHr9xNUaxzoh1leHUNzR0Hw1RLPnbizVrLXg+pnH3EDOIFi?=
 =?us-ascii?Q?fjO2JPYSv3DI+cq2LOMMlvTr6bza9behMOftaQ/BGXboAHAUxyuG+7m68AVQ?=
 =?us-ascii?Q?jmd7NrGNOLr+QdvkyYJ0QvcILXR+62KScy49hWKaueEAkAT1zrhgTeKRjX/I?=
 =?us-ascii?Q?1gIJbawsKoQvmfTFYgKsqT6ktaZiSnwbTBfexvFzTIiulv53JNXrBJQhQqHC?=
 =?us-ascii?Q?G7nQNeP3D2bulK8SeIEmn9RDuhIAGyYwBv+mnaDfmo0REDOeNmjnPXkOF7b1?=
 =?us-ascii?Q?UwXaFW7NSGLeW6TsboEUgEEiWzPaKzXqvQfNT0JDkxrfs7YJ9FnhgQHH4nkq?=
 =?us-ascii?Q?j+TKLfYeTFZMj6Zn8kmK+EKUiboAUsWjdcBWrjkTSZvoXi6qZ0HRmAzdTo53?=
 =?us-ascii?Q?+5JGuoER6WyRz2pASKll4WvBCCOp2zyu7Zo1uZyTsiZjqCeHuNcdi/IzyYcy?=
 =?us-ascii?Q?XRtIti453nV2/k5Iq1DSr7JF8r1N1Ytwe+R5cicgR9VKVtCG5tLnyy+AsKF5?=
 =?us-ascii?Q?Vno3VS31ydiizk6NIpgtXQDuGB04HuVxY4Y33G91J4ychE3wIPNHV7pU6oQk?=
 =?us-ascii?Q?RfZRRMRBWj6LPh8RyI04K6ZDl35wCmoKeTA4XLv6LMtY/AKDOTFI5wZDFrGp?=
 =?us-ascii?Q?Qsi1IdihFzUy+F63z7/UIRxfT3MOw5vUgd7+wJb4YzxORj+CkcHHzEjeveOq?=
 =?us-ascii?Q?uDR7GbA6Mcvso2SvgihhXasAvb+rdRE/pgoxxDZdvCLDCtn9nzUz2Z8nYb50?=
 =?us-ascii?Q?2P2I4g1UbnXV+RuS/dJncMAcEkGt/huXC11qIXc9NWzuRUnutGb7TjbTIqZm?=
 =?us-ascii?Q?s4SwJOY9jHyYBE9bRSUAxDzpuInJDBuDWojMmzCPM7Gc7qSb+EjOLRMG9NiT?=
 =?us-ascii?Q?Z7v78FQM+IjNtBVOSFHCzuL/81gq93cSv+Rm6OBO/CVVHDfw57WhcJZ4ksGH?=
 =?us-ascii?Q?hCm/KCa3csSPnwwGW497wNE69XaHBRSDWQvazAi6CP4CleTRerT13TlYB30m?=
 =?us-ascii?Q?qftieQKRYW7tlVD2MdwNr35h2vhZntfyYxNZdm0FyF9gDARec1q1hcaBdfFE?=
 =?us-ascii?Q?aC7sUzQ6Fhopve5YeWvfb9EUeMrVg1kbJJBep3wiQG6scXuwFwSvInbsr+ol?=
 =?us-ascii?Q?6hQXhD6awQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_HK0PR03MB5090481BE38DBC9CBC513F99CFA49HK0PR03MB5090apcp_"
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB5090.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6388bf1-c6b9-4b35-7282-08da492a9dbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2022 08:41:00.9770
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qb6e2q68Y6UJU2ezUZG3VYvMdaT4ueJ3kVQqeKa/L/Rtj7JcftPx/LsL5jEywM1Of1HN/Xjsf75RL3W8M9QPaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB4599
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

--_000_HK0PR03MB5090481BE38DBC9CBC513F99CFA49HK0PR03MB5090apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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

--_000_HK0PR03MB5090481BE38DBC9CBC513F99CFA49HK0PR03MB5090apcp_
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
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
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

--_000_HK0PR03MB5090481BE38DBC9CBC513F99CFA49HK0PR03MB5090apcp_--
