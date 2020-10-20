Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A79FF29348F
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 08:04:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFjkv1QShzDqWx
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 17:04:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.131.139;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310139.outbound.protection.outlook.com [40.107.131.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFjjq1q3RzDqRR;
 Tue, 20 Oct 2020 17:03:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llND5SA+M2+blDZ2PYZjFsgptg8COjLomvZcso8LcVZfNG2Lli6jh0qpIcyEvv63Ou+JDqFr5bpj1/GzJcV3Uqj7zrgKluQ51lpWnN69U2yZo5D1o7mWaPHFQkIaB3p2Of28LqVfg7+r9qmEhm2acsyGTh2vGil1TgzxBa8ACAMLP62rIcRKogKi3zzJC/PPY8B2w2/6AI6YmYmQB6rX81avEKB153UHvFW3TYS6ffycwL3Y6ERBVLo1xKyVbxx5t/qtzspVczobjTi2WhKnUSG3cuQwsQgZQ7caBEJ3zGWw7VPWE/iiq+uX0abDJVKSxzOz5v9irrS7mzFS4Elu1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0bTPMqcgE2KaH8G3FFvxogSw8XrUYKdWoj3VnCzUow=;
 b=DyIcm5Z1WrqhjrNPIJFfo838UEr6DCOim+AGUhBnpcq3Gp3wA1g8g/oCIS4NmtgfEXCIzf4bTqJo/wTdJlPZ6qiirwHAXbSnndYu9lVFBZ0gUIu5ofbbAZ5tVRm+TXqSGzCqnwSu+k/L8cz1J2upNt6cDh4Vj9Y2pLejcvQ8gzVAUF7UFc4Q2f59a7Ksx+6EstpDypJn6x6QyAHrJBIAbU0NfFao5Up96uxrr3pIjcmZ87Strcy9Tz5nUpMByYNq5DWn1lfL6i0xsCdQHLNmPUIFRIlxxnpEeJRnxI5IshIQ2S/eJQ9M4q/k4L70YXXS32jYM2u3fEmSlQorcDALpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK2PR06MB3250.apcprd06.prod.outlook.com (2603:1096:202:31::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Tue, 20 Oct
 2020 06:03:32 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::a1a1:8859:d07a:2473]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::a1a1:8859:d07a:2473%3]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 06:03:32 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: "lee.jones@linaro.org" <lee.jones@linaro.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au"
 <andrew@aj.id.au>, "minyard@acm.org" <minyard@acm.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "haiyue.wang@linux.intel.com" <haiyue.wang@linux.intel.com>,
 "cyrilbur@gmail.com" <cyrilbur@gmail.com>, "rlippert@google.com"
 <rlippert@google.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH v2 0/5] Remove LPC register partitioning
Thread-Topic: [PATCH v2 0/5] Remove LPC register partitioning
Thread-Index: AQHWmvF39eweRWKA/USnDpx5+4lpz6mgFZog
Date: Tue, 20 Oct 2020 06:03:32 +0000
Message-ID: <HK0PR06MB377943740366AB328247C452911F0@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20201005082806.28899-1-chiawei_wang@aspeedtech.com>
In-Reply-To: <20201005082806.28899-1-chiawei_wang@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce2d624f-ffe7-4ef2-3814-08d874bddff4
x-ms-traffictypediagnostic: HK2PR06MB3250:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR06MB325090ED26B77B4D9008A370911F0@HK2PR06MB3250.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eUXeoETsxR4ED6pzWvaJnbfU54S2oq8ySSV3qhVIIW2xvmCqebrbM/eb6QetNMpazyZktjlwwGvSFF3Bs1O6raGZYCGHjOTEbcHJTSiWscRyPNcT+GibyiQtGJxsj90bSyQebKRlb54aX+eL9fTWwD+hi8muH7HT464HGp7vF4GWiJylSZjWUpMjk7hFeG0tRrd+LXKeZNJNAXFEvS4GcVT+yIDy6k7fR3nh0+5SGDIzA2/rT3AHX6lLadSSIhYhP/3a4/2JDk4LgVHwJAVZCK/gjE8lodLM/8aa7IvL6nWA2glmLwALzt1dz/4ARAOdTLo+2tfosoThU5TZbUYDbdLWKhq5KKJg8WhFIEaapPpqqqWSiKwEBE/14KhZAZjs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(136003)(396003)(376002)(39840400004)(8936002)(86362001)(53546011)(76116006)(110136005)(66946007)(7696005)(6506007)(52536014)(66476007)(64756008)(66556008)(71200400001)(186003)(66446008)(316002)(55016002)(26005)(33656002)(5660300002)(9686003)(2906002)(7416002)(8676002)(4326008)(83380400001)(107886003)(478600001)(55236004)(921003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: d+p5SeuC17wgu8f3kodMTtWE4OMiIL6yaX6z735Fre029WaNGzVO/4Qn5Gk99LRzqxI1prujAo4GKvTkx4F8/s7xKgrB808PZ3SkyRBL0uVBQ90FuAnVMtbQXP7AbMx3YzlFbg9L92JHxCUYzaPn/Kd1qzKRCPt/JwlUSHIEszeq1TiGgIv4AoE4rlYFjt2rs7zpOGGyMN6bF7WjRHXGURglqEuwgMNVpGQliCi30uGKMIrcWupmEz7bJ9Q6MJ/6jdQmhcyJKJ2daYdT7i9Ax6wmTuXEZFaM09bPe1HL9arpnRspGzEM1aMGkJQNH/5wrbLthlr0N7GVGwxvLGeduVqPuScwbPbMQCrT7ZwpbDKL6Ggm+FXi+ifFgdmQLbF/jfExoLo91A9tlmepD1n7XnB9JsFtCmWHiCCyRhs2jcwtnEbK7cLMrm4MgXerC2tp8LBRompQH9FJROscEpSpcbsUc/Hlv1Sm6mD4NvGti3FfAy7LdpTLKCRR49s2jcsqdzwyrSUNwI7eVrKUJSYasJERRKK8F9fMpx3O0Ka8NWv4eGg6cy/TES3Ww2VGeJfcLZ6frBfd3lHOZHKsDr+m3lCprWd2SbD1Cov/YbmUU00rJsg4+R1WuxMzOFY+lSNgb1K/BmmjjbFkmQcl2OyT9g==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2d624f-ffe7-4ef2-3814-08d874bddff4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2020 06:03:32.6471 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hys5pANDjOTgREanvnOJouvgNSVKMxBHieRDhC0RMix4KHUDgkAaymLmwKFfbBXASZo1eyOM/n7hjbH/a7yhx1A81yIpNDpxpWm4AVm14Js=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3250
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi All,

Do you have any comment on the v2 changes?
Thanks.

Chiawei

> -----Original Message-----
> From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
> Sent: Monday, October 5, 2020 4:28 PM
> To: lee.jones@linaro.org; robh+dt@kernel.org; joel@jms.id.au;
> andrew@aj.id.au; minyard@acm.org; arnd@arndb.de;
> gregkh@linuxfoundation.org; linus.walleij@linaro.org;
> haiyue.wang@linux.intel.com; cyrilbur@gmail.com; rlippert@google.com;
> linux-arm-kernel@lists.infradead.org; linux-aspeed@lists.ozlabs.org;
> linux-kernel@vger.kernel.org; openbmc@lists.ozlabs.org;
> linux-gpio@vger.kernel.org
> Subject: [PATCH v2 0/5] Remove LPC register partitioning
>=20
> The LPC controller has no concept of the BMC and the Host partitions.
> The incorrect partitioning can impose unnecessary range restrictions on
> register access through the syscon regmap interface.
>=20
> For instance, HICRB contains the I/O port address configuration of KCS ch=
annel
> 1/2. However, the KCS#1/#2 drivers cannot access HICRB as it is located a=
t the
> other LPC partition.
>=20
> In addition, to be backward compatible, the newly added HW control bits c=
ould
> be located at any reserved bits over the LPC addressing space.
>=20
> Thereby, this patch series aims to remove the LPC partitioning for better=
 driver
> development and maintenance.
>=20
>=20
> Changes since v1:
> 	- Add the fix to the aspeed-lpc binding documentation.
>=20
> Chia-Wei, Wang (5):
>   ARM: dts: Remove LPC BMC and Host partitions
>   soc: aspeed: Fix LPC register offsets
>   ipmi: kcs: aspeed: Fix LPC register offsets
>   pinctrl: aspeed-g5: Fix LPC register offsets
>   dt-bindings: aspeed-lpc: Remove LPC partitioning
>=20
>  .../devicetree/bindings/mfd/aspeed-lpc.txt    |  85 ++---------
>  arch/arm/boot/dts/aspeed-g4.dtsi              |  74 ++++------
>  arch/arm/boot/dts/aspeed-g5.dtsi              | 135 ++++++++----------
>  arch/arm/boot/dts/aspeed-g6.dtsi              | 135 ++++++++----------
>  drivers/char/ipmi/kcs_bmc_aspeed.c            |  13 +-
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c    |   2 +-
>  drivers/soc/aspeed/aspeed-lpc-ctrl.c          |   6 +-
>  drivers/soc/aspeed/aspeed-lpc-snoop.c         |  11 +-
>  8 files changed, 176 insertions(+), 285 deletions(-)
>=20
> --
> 2.17.1

