Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5329557C0BF
	for <lists+openbmc@lfdr.de>; Thu, 21 Jul 2022 01:17:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpBSJ1NxTz3c2g
	for <lists+openbmc@lfdr.de>; Thu, 21 Jul 2022 09:17:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=mvY5D9vK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.159.192; helo=mx0b-00268f01.pphosted.com; envelope-from=prvs=020080160e=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=mvY5D9vK;
	dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com [148.163.159.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpBRl5vmCz2xkS
	for <openbmc@lists.ozlabs.org>; Thu, 21 Jul 2022 09:17:06 +1000 (AEST)
Received: from pps.filterd (m0165121.ppops.net [127.0.0.1])
	by mx0b-00268f01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26KN0E7I002687;
	Wed, 20 Jul 2022 23:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=pQQcu4Ck6drl0VpE5lb16AiJ8yqFwhEXVcpo6olWCQ4=;
 b=mvY5D9vKWSlt3nGRYsvmvTpvktAzUEmOyZ7XDtj7DPRIDmvd3WiBW+5ecxVQnAzVh+YA
 cbbutP34ipxTIsA3j8t+gcBQPnocvDqtlhUc0WhUbd8Qkbr4XSoub81mN2aa92N8zJOL
 Jk0qmlW0ayPetgPXcR6hSfT7FaYjHY/8+U0TOMdJE/pwxEvxKFCa0DVxIsED37ZxbePv
 OaHDnj2fi0UBJwCP+K2lUuetF3UbDcTPXJoFMyg2YNOVTAwfwum4jgecqOXKfE77Uoqy
 YQs/9WIWfFeyIK+qrbs4AVxpPcAP96QjBEUhqFsHFi7d11Gkgmx6l+Zm0U7KgilLQ5Fq sg== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0b-00268f01.pphosted.com (PPS) with ESMTPS id 3hemx69869-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Jul 2022 23:16:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZImg3/kjSsgqWnyEv+8+mqkClZOqt0icbr+IomUhmp71Cqtx/AV6U2lGIpl5Lrbk1nN0MXcgobFZi+kdTKkkM6i/M/aYJxR+kpqOMFxboTVP/kYtlVDaO/bLRPiDVUQJdySS5VdhRHJAsrlrWRntbfQdYnpMu1ZU9dRLc7tCD6JBZXuZ7cMuYfwlBBNSxWgfFmC23ljZOjOI2jxLT/TYhrcaGotiGsjr21ll1JyFVlClzKvfEBD8Ms43QHxACzlADOYLrT0egPBBUHOegJKnu/7dwOAF2yE7+LSMC3Z/pACxJtwVZEr3aQlNUhOqwIwurswgFGph7iYst4SrD6xe0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQQcu4Ck6drl0VpE5lb16AiJ8yqFwhEXVcpo6olWCQ4=;
 b=P6ZVlEMmwuDFdNVpM4rLAkidBwAp4T87JgDQk6Gz4xp4mHh55XTdb1m8JJ8vDqj3CLJzAUXZQtG88gztL7C6KasKKj65Cv0pqihWB7+W6iAgjfRlv6QDd6zyjELI+tgpZuLNkrqiPakz66PMW/ksDsYSJCiuLsgIn2W2cH+4fhx6VvLVqvnO9G/ey7tTmnGi2vgJGOiHyQwGJCx+TCOqrSR536Q5KELiHp/zkCfgcnODlFM73UQCEOEhVHVYVWED7Rck6T1hZ6y4bfjPQuVRi88884wYpyMhaf6p1fBOhAhQjbhgqGBvvhk/OYf3aBNAUcsTugqck/dt0sy1Y6I4Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by SN6PR04MB5230.namprd04.prod.outlook.com (2603:10b6:805:f9::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.22; Wed, 20 Jul
 2022 23:16:31 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::9890:b657:c8a:cffe]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::9890:b657:c8a:cffe%7]) with mapi id 15.20.5438.024; Wed, 20 Jul 2022
 23:16:31 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Logananth Sundararaj <logananth13.hcl@gmail.com>
Subject: Re: [PATCH v4] ARM: dts: aspeed: Adding Facebook Yosemite V3.5 BMC
Thread-Topic: [PATCH v4] ARM: dts: aspeed: Adding Facebook Yosemite V3.5 BMC
Thread-Index: AQHYnI6+U8uG9DI9MU63PhVdLCGfIg==
Date: Wed, 20 Jul 2022 23:16:31 +0000
Message-ID: <20220720231605.GA30806@packtop>
References: <20220720105331.GA23472@logan-ThinkPad-T14-Gen-1>
In-Reply-To: <20220720105331.GA23472@logan-ThinkPad-T14-Gen-1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bee171b3-19d0-44f9-0bd4-08da6aa5e1a4
x-ms-traffictypediagnostic: SN6PR04MB5230:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  wmH6UKLWUZ5H+iMkPGvdFP8I6PZBaDp8ydaCCwNqV/ziSSqkTnSk45Ttt7xoctgX7z25pbRsHhTkHgrCYvrnwjnXNwnx+Clb9vZlCdwhyLGsDjeYRE4JOIrI1tJs1BYcWk3LmACNqXMElPlW/xA0QQgPPKcH61r0XkpgFfoEA4+OG4ypD3lU1gdI/sDLpDF9+Oad2XcIMasf7ToPkZ0nFtyBUbQ5JEvLiRVkL8qnCf5jfWZ0EElTF/jxG8qoOVebdcoJELGOuPVx3/Clxwi56cC83VuQk6KjJkdN2NVo5RqEFpJmfYXi8NvBZiQJrHTPTaz5qi0tLZkOIFJ/wEZN3thFLtcNre4dfbSlE9xDbFLvIY6DMnQABV1dR9RsPzuYhTHHl6sr39+INbKP1Zt480E0vfUc1d8vCd0NYyaxeZ+ThbvsccdR2U5MphaOaxvxXJQyxM91AgNxYSQhXbeTXFYDWT5vPv+WhctAfXGb66S8U6IbcVswoTDCZKtcCogVMPtGMr3nEI+ROqWbE3Hbi2cAOCRlNowFKqBELLlKRtc4XQZ/8wo18aAuv4gHr19uNw/VsJ5mUpOvXdYI2OPWXgcypJhAF/nUm9iSTLHhbQ1umC946eq27dqx+w5rbAmGu8aqSeyhu09+2rdkZU0vbe3nlHtpuZffFv9th99b2jCq6kjGS62hDcmRN9HMW2JapEjHl+K4pVs2oCDE1pferZ2FDc4DaZW18fr6pnPjHucnwpH3oQYKIygf2dgnQ6/SadJ3plZL25tA6xdVTg4xupCsRlnA6OEPwYgZZXuUv7QQ++3gdNrIIJWm+wxacMXf
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8007.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(7916004)(39860400002)(346002)(136003)(366004)(376002)(396003)(47680400002)(8936002)(122000001)(7416002)(5660300002)(38070700005)(38100700002)(6506007)(6512007)(478600001)(26005)(1076003)(6916009)(316002)(54906003)(9686003)(8676002)(66556008)(71200400001)(6486002)(2906002)(66446008)(64756008)(76116006)(4326008)(66946007)(66476007)(91956017)(186003)(33656002)(41300700001)(86362001)(33716001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?ZURFkXNLFZp/RCW72qJbcBKMipP/bNmKRBebNQ7cjobCV+BjcGiYiXZ3jSfS?=
 =?us-ascii?Q?VMkbR8kJ14bmdvE7sDy+ebIsT51RouGA8ZikQ0qD2PymQ9VYVcHuvznk6BJQ?=
 =?us-ascii?Q?4A6KMNgBNzx6GBS6wiosxQBofbd5jv/vEEPzMIuGvFxwfCKKK2xtfrxGQ4sS?=
 =?us-ascii?Q?LxqLezNlJTquqJy8rYxxqqufdq8mtwRm7Z3yIGT3ni4z1YOO68KQ3eESYRww?=
 =?us-ascii?Q?M+agFArJjRdgGPQTI78FQqQ4/+ZrDhX5Cgz2kf48M+LIl5sn6at/K9MNaVoa?=
 =?us-ascii?Q?JZb2caQjqHkPTQ+Ckxvm7kC2rVlQeuStp1+/QPSk0Tzgm9moJkvfzeNAmW6H?=
 =?us-ascii?Q?lwkl5bHetvPxl7F7k+atHBivl7d/nEbItmwxnnu1j7HjHmR9BiY/u0KxfbFh?=
 =?us-ascii?Q?IaHnYtD5shTWAfhldCoDEXuEzATduD6P4mUN8znkB7e/GB3xNWQmtPzwlvd0?=
 =?us-ascii?Q?yRqWcHn5Lw5xH/aGxN4KEjx/mYWZAw3xauoUkPcAT2KlmkGLaHNw6EQwX514?=
 =?us-ascii?Q?3zZgz9KtwZudMvweYjnCoosIJdWlnYxXjrAgE1kXjxFkorBkSHbxWS7li2CI?=
 =?us-ascii?Q?CWQTTR9e33l+7p/bmEeetQ9ns1tjKgY4L5tt+mLsCVGSRRGYdDhXwMym8Kia?=
 =?us-ascii?Q?bdGSf7kkXD9+IsASiDeZ+87MznX1UMjEc0zlcA/1zJch3Gv5ZBGLkVyOkbEh?=
 =?us-ascii?Q?1Z4P1xCingz52jsO89BS4TgFfKQJT3tu+R3BeOtGXBO1URIrmNT6C2iOVclS?=
 =?us-ascii?Q?DaZlYvp9ZLEePtIQN9O6fjNrToIMoLcH3cw6cjR3xG14smZn2ykNF2k1mj5s?=
 =?us-ascii?Q?MEAuxlajrPMWMdnQiTECMNJwT8D/jbRuu3HO9ctBdlIMw2C4hChC5Mt0OAyJ?=
 =?us-ascii?Q?5HhKuuslnOHEomS54MXwthpydIl02F+pC1UHBZIN6UFxmHhjPTihcdKkJha4?=
 =?us-ascii?Q?1lfp+wKcAZ/yTDNcwJ8zXqsYrH8i2YRBuFgmAHpH/7OEvwgz1b9AK15BF01a?=
 =?us-ascii?Q?8/+dk0hW0g6lZd+UngY3LKdQeMVTY2xl5hqiN7ZGbo6TgBqiy089rVaZiJkJ?=
 =?us-ascii?Q?eo02fiJYPI+D5Tb9Fs8gm1HdfTwt9KyqGOIaH+J7j8CtgSI3zxhJ5X1eSw/x?=
 =?us-ascii?Q?PPrpIXb6WB+AdTwg3BKlcJJqt0CvJNOHcZ0h/yp1aLHx74dsC+0Z/do5GqGi?=
 =?us-ascii?Q?sE9prrq9JEroxQCIImEdfKOfoA4dbsfbcapX6HjbdnmpJ0dJ3gUkz3mp+DB1?=
 =?us-ascii?Q?UIwl+5HraibzOS8+yP+E2WmHaunjY/W7RNM0uqVOuFSpBkO+z/pAlVojO+7x?=
 =?us-ascii?Q?v9H2Q/46+N2mFJYFpEITtzCmXlF3SXWkxeuflf8ugc5JFi67LhYBt1kFzM3X?=
 =?us-ascii?Q?UkC8fNKsTZuEYXA1s6zAOCq0FLD7cFzVeSiQJKtgDC29xZYjGX9SLPSYwrLD?=
 =?us-ascii?Q?G87Bmq2kVKwhcCad6Wnv7OVABcV5Fokf6JMTNDc+HWUOjssmzdtAArQMrkHF?=
 =?us-ascii?Q?RZEk4B219wQ2rlrRAsAba+ZypiuXlkYqWZZhwxQVmvOw3+W1MPpDWH+ToQ9O?=
 =?us-ascii?Q?6/5W7hzRlcPQCs6AKtpaWR2esEfaoz3vUzzLjG/S8tZZ20KtPizit8JAndcs?=
 =?us-ascii?Q?sQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7D972B41ABEB0844A1D1F7A458235263@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bee171b3-19d0-44f9-0bd4-08da6aa5e1a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2022 23:16:31.3962
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uttH3aYhQfGBsTpkJ2WAHYPiJdXCpc0qcpueEJVdxX1kl1+eb7txRwfiyqgPmM8qDRlqKfdJZB1yUHgGT2onJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB5230
X-Proofpoint-GUID: hSxpeyguU42IL41FAutE6R35yADKV5-c
X-Proofpoint-ORIG-GUID: hSxpeyguU42IL41FAutE6R35yADKV5-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_12,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207200094
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "naveen.mosess@hcl.com" <naveen.mosess@hcl.com>, "thangavel.k@hcl.com" <thangavel.k@hcl.com>, "soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Olof Johansson <olof@lixom.net>, "garnermic@gmail.com" <garnermic@gmail.com>, "velumanit@hcl.com" <velumanit@hcl.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jul 20, 2022 at 03:53:31AM PDT, Logananth Sundararaj wrote:
>The Yosemite V3.5 is a facebook multi-node server
>platform that host four OCP server. The BMC
>in the Yosemite V3.5 platform based on AST2600 SoC.
>
>This patch adds linux device tree entry related to
>Yosemite V3.5 specific devices connected to BMC SoC.
>
>Signed-off-by: Logananth Sundararaj <logananth_s@hcl.com>
>
>---
>--- v4 - Bootagrs and memory removed.
>--- v3 - Addressed v2 patch comments.
>--- v2 - Enabled i2c drivers.
>--- v1 - Initial draft.
>---
>---
> arch/arm/boot/dts/Makefile                    |   1 +
> .../boot/dts/aspeed-bmc-facebook-fby35.dts    | 260 ++++++++++++++++++
> 2 files changed, 261 insertions(+)
> create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts
>
>diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>index 7e0934180724..58add093e5fb 100644
>--- a/arch/arm/boot/dts/Makefile
>+++ b/arch/arm/boot/dts/Makefile
>@@ -1465,6 +1465,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> 	aspeed-bmc-facebook-cloudripper.dtb \
> 	aspeed-bmc-facebook-cmm.dtb \
> 	aspeed-bmc-facebook-elbert.dtb \
>+	aspeed-bmc-facebook-fby35.dtb \
> 	aspeed-bmc-facebook-fuji.dtb \
> 	aspeed-bmc-facebook-galaxy100.dtb \
> 	aspeed-bmc-facebook-minipack.dtb \
>diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts b/arch/arm/bo=
ot/dts/aspeed-bmc-facebook-fby35.dts
>new file mode 100644
>index 000000000000..05efba7117a8
>--- /dev/null
>+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts
>@@ -0,0 +1,260 @@
>+// SPDX-License-Identifier: GPL-2.0-or-later
>+// Copyright (c) 2020 Facebook Inc.
>+
>+/dts-v1/;
>+
>+#include "aspeed-g6.dtsi"
>+#include <dt-bindings/gpio/aspeed-gpio.h>
>+#include <dt-bindings/i2c/i2c.h>
>+
>+/ {
>+	model =3D "Facebook fby35";
>+	compatible =3D "facebook,fby35", "aspeed,ast2600";
>+
>+	aliases {
>+		serial4 =3D &uart5;
>+	};
>+
>+	chosen {
>+		stdout-path =3D &uart5;
>+	};
>+
>+	iio-hwmon {
>+		compatible =3D "iio-hwmon";
>+		io-channels =3D <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
>+			<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
>+			<&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
>+			<&adc1 4>, <&adc1 5>, <&adc1 6>;
>+	};

A blank line here would be nice for formatting consistency...

>+	spi_gpio: spi-gpio {
>+		status =3D "okay";
>+		compatible =3D "spi-gpio";
>+		#address-cells =3D <1>;
>+		#size-cells =3D <0>;
>+
>+		gpio-sck =3D <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
>+		gpio-mosi =3D <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
>+		gpio-miso =3D <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
>+		num-chipselects =3D <1>;
>+		cs-gpios =3D <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
>+
>+		tpmdev@0 {
>+			compatible =3D "tcg,tpm_tis-spi";
>+			spi-max-frequency =3D <33000000>;
>+			reg =3D <0>;
>+		};
>+	};
>+

...and this one could be removed.

>+};
>+
>+&mac3 {
>+	status =3D "okay";
>+
>+	pinctrl-names =3D "default";
>+	pinctrl-0 =3D <&pinctrl_rmii4_default>;
>+	no-hw-checksum;
>+	use-ncsi;
>+	mlx,multi-host;
>+	ncsi-ctrl,start-redo-probe;
>+	ncsi-ctrl,no-channel-monitor;
>+	ncsi-package =3D <1>;
>+	ncsi-channel =3D <1>;
>+	ncsi-rexmit =3D <1>;
>+	ncsi-timeout =3D <2>;
>+};
>+
>+&uart1 {
>+	status =3D "okay";
>+};
>+
>+&uart2 {
>+	status =3D "okay";
>+};
>+
>+&uart3 {
>+	status =3D "okay";
>+};
>+
>+&uart4 {
>+	status =3D "okay";
>+};
>+
>+&uart5 {
>+	status =3D "okay";
>+	compatible =3D "snps,dw-apb-uart";
>+};
>+
>+&wdt1 {
>+	status =3D "okay";
>+	pinctrl-names =3D "default";
>+	pinctrl-0 =3D <&pinctrl_wdtrst1_default>;
>+	aspeed,reset-type =3D "soc";
>+	aspeed,external-signal;
>+	aspeed,ext-push-pull;
>+	aspeed,ext-active-high;
>+	aspeed,ext-pulse-duration =3D <256>;
>+};
>+
>+&rtc {
>+	status =3D "okay";
>+};
>+
>+&fmc {
>+	status =3D "okay";
>+	flash@0 {
>+		status =3D "okay";
>+		m25p,fast-read;
>+		label =3D "spi0.1";
>+		spi-max-frequency =3D <50000000>;
>+		#include "openbmc-flash-layout-128.dtsi"
>+	};
>+	flash@1 {
>+		status =3D "okay";
>+		m25p,fast-read;
>+		label =3D "spi0.0";
>+		spi-max-frequency =3D <50000000>;
>+		#include "openbmc-flash-layout.dtsi"
>+	};

The labels on these look backwards from what I'd guess was probably
intended (flash@0 is spi0.1 and flash@1 is spi0.0).

>+};
>+
>+&i2c0 {
>+	//Host1 IPMB bus

While it's not currently 100% consistent, I think the generally
preferred style is to put a space after '//' (here and elsewhere).

>+	status =3D "okay";
>+	multi-master;
>+	ipmb0@10 {
>+		compatible =3D "ipmb-dev";
>+		reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
>+		i2c-protocol;
>+	};
>+};
>+
>+&i2c1 {
>+	//Host2 IPMB bus
>+	status =3D "okay";
>+	multi-master;
>+	ipmb1@10 {
>+		compatible =3D "ipmb-dev";
>+		reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
>+		i2c-protocol;
>+	};
>+};
>+
>+&i2c2 {
>+	//Host3 IPMB bus
>+	status =3D "okay";
>+	multi-master;
>+	ipmb2@10 {
>+		compatible =3D "ipmb-dev";
>+		reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
>+		i2c-protocol;
>+	};
>+};
>+
>+&i2c3 {
>+	//Host1 IPMB bus
>+	status =3D "okay";
>+	multi-master;
>+	ipmb3@10 {
>+		compatible =3D "ipmb-dev";
>+		reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
>+		i2c-protocol;
>+	};
>+};
>+
>+&i2c4 {
>+	status =3D "okay";
>+};
>+
>+&i2c5 {
>+	status =3D "okay";
>+};
>+
>+&i2c6 {
>+	status =3D "okay";
>+};
>+
>+&i2c7 {
>+	status =3D "okay";
>+};
>+
>+&i2c8 {
>+	//NIC SENSOR TEMP
>+	status =3D "okay";
>+	tmp421@1f {
>+		compatible =3D "ti,tmp421";
>+		reg =3D <0x1f>;
>+	};
>+};
>+
>+&i2c9 {
>+	// Debug-Card IPMB bus
>+	status =3D "okay";
>+	multi-master;
>+	ipmb9@30 {
>+		compatible =3D "ipmb-dev";
>+		reg =3D <(0x30 | I2C_OWN_SLAVE_ADDRESS)>;
>+		i2c-protocol;
>+	};
>+};
>+
>+&i2c10 {
>+	status =3D "okay";
>+};
>+
>+&i2c11 {
>+	status =3D "okay";
>+	//FRU EEPROM
>+	eeprom@51 {
>+		compatible =3D "atmel,24c64";
>+		reg =3D <0x51>;
>+		pagesize =3D <32>;
>+	};
>+};
>+
>+&i2c12 {
>+	status =3D "okay";
>+	//INLET TEMP
>+	tmp75@4e {
>+		compatible =3D "ti,tmp75";
>+		reg =3D <0x4e>;
>+	};
>+	//OUTLET TEMP
>+	tmp75@4f {
>+		compatible =3D "ti,tmp75";
>+		reg =3D <0x4f>;
>+	};
>+};
>+
>+&i2c13 {
>+	status =3D "okay";
>+};
>+
>+&adc0 {
>+	ref_voltage =3D <2500>;
>+	status =3D "okay";
>+
>+	pinctrl-0 =3D <&pinctrl_adc0_default &pinctrl_adc1_default
>+		&pinctrl_adc2_default &pinctrl_adc3_default
>+		&pinctrl_adc4_default &pinctrl_adc5_default
>+		&pinctrl_adc6_default &pinctrl_adc7_default>;
>+};
>+
>+&adc1 {
>+	ref_voltage =3D <2500>;
>+	status =3D "okay";
>+
>+	pinctrl-0 =3D <&pinctrl_adc8_default &pinctrl_adc9_default
>+		&pinctrl_adc10_default &pinctrl_adc11_default
>+		&pinctrl_adc12_default &pinctrl_adc13_default>;
>+};

Missing blank line.

>+&ehci0 {
>+	status =3D "okay";
>+};
>+
>+&ehci1 {
>+	status =3D "okay";
>+};
>+
>+&uhci {
>+	status =3D "okay";
>+};
>--=20
>2.17.1
>=
