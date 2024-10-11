Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1654E9996F3
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2024 02:17:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPnHl4Vflz3cVY
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2024 11:17:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::72e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728605824;
	cv=pass; b=TJ/moghaB1L1HqZ9H7Oj+phd5GQldlAqsIWlTS/5P3gkPRlCAHpgH3Dq6XnRVqW8wtsFWq5E7LHGr62+paRx5Nf01Q2M/ozBHCjdwByoVWifN+KltmzHgPBijZwoa2uHzx4FEAN4BimmbyhknzYLN3qrasCNLQJ1Gn8YBwI3n1ehxgBbCOKafXFnozKe9+UDEAOHTvidlJkeHKjs5e01dswTf5hAe5bCipFmoDuGW+3dm0PPQnIexnSBx8hAtQXIETWCT3CIig4ZSmbJhYW/aouVbKfOWewP9xBoN7ST1Ou+2DWLmx4PLeaDA2lvx76Oa+WbK/yblHe0TfUShGqPtg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728605824; c=relaxed/relaxed;
	bh=g5imh3T1d2xxKLDQ+pGi55lB+8yM3eFDgx9UGLUl4vA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KNklednXTgCmq2Hs5/swMKShroW7aKiCvwO6XAaTAiFYbZ8Er4k4GypVqx/B00+idpD695ZwIXW5aQlVe30wxKMy/Il1lwoAaomkEuohiWQDZQgepJ6mNp4fTSvzqsuEci2san0xOJNW0tXJITr1ZC23/51DOixedarO9/nipr7TMOchT+9xx1kkfrcTHOT2voLbeiGb7x8j04D0Ynp3+QnifjklkosxU9o+eCwBinDPIlVQRI9h/735JQoYF2TIg9sOZYJbc0XlgNYOTTfHPYC1xNgOCndnT/mUhAx4x1Rp94ewi4144pjMM1TnOI8xilNHiARn6WPGnoUQjd3LnA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=2a01:111:f403:2011::72e; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:2011::72e; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2072e.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::72e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPnHX1Zbwz3bn0;
	Fri, 11 Oct 2024 11:16:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhUiE96iz6F0gJR7tzYpC5v4TPOThaDbzoyQoXLMIx9IhBX1ZMe8jCZ+vcjqqg6jCbkdxo6MsUQ1WL00IRTmWJ+FGeGo2PSNuVTheE0EtNl/c9FoXafprsAUERQLAzJg1rDjLURcLmBRZEHFL876MR9I/Igyu7obea35BRVzZSirOEoR+OLq+sMs+olynlDxgM7RSWPwt3W6xKS9YmWQKojLJLl2qDOv7VsaXW99/+uFud9DkSdV4iTZqLtO0LYsT9GkRSdqay+CZj/K6CfgLuzrTlW7aBw9gPWHeRLH274c40OQxKIv7qbAB79s0HTv3wv7rpl62PMAANqIPW+cpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5imh3T1d2xxKLDQ+pGi55lB+8yM3eFDgx9UGLUl4vA=;
 b=pW4RfJj4+QKdwKTVuGP1ZWpeFCDvnSOxSPlLJn4N1MjQJWpfOofZ3A23gNZ06gba/QhlaAuobVQkp2f4TSdH11olsknmv/T1ThzRMUZw3v0YP6GaL2zVOliK/780PAnyO4Gnqg41VaWClZXIXKez77btVebBeN+ylxCG4SerFzSA85T1zOKHmCTzWVwfm/wnJatwc/yAlVI2H3ttswHfpIyeK8ChIq8e0/mQGNa5WUrLNJH3pN0Wod26jDfq/TCmjlL5oGiEghGDOB3vC4l/hvRzZNxh1KMIcLwUjFH5aoAS4hVpvAG668G9xqSqWlBeKu/LenqbFB75KQp+soQBrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5imh3T1d2xxKLDQ+pGi55lB+8yM3eFDgx9UGLUl4vA=;
 b=DF7blf89hG8G4cmICPU2ta2AnfH+ZPeVxwYbu9OefXWgv2DbH0aydH4n5LUZNYPSJIahCsP20mn91Lyhh2qSn3hmrwy+ph0puLbchmJpWRslwBFIdr7/+CYqTCGo5b3FCTr8B5PfoFEhMUJVwDur5Jq6iMTaqEy7AyeLmoCtYKUbZJCtoJMlmD73jhWSoV+l86Ymd3WF8h9TA35mrRDJerVSlZgSRw0e/n3vOKQ5KX9FwXki/68bAVF6wqfYDeaT5ffeJhMMHeeJ4tAXjvUM8zPv5PLCBxz33C/Ed/iCUgU8AvBDhpXm+Wlvuq6qf2w/6dyQTlAh+Y8cfiNNmngKZg==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by JH0PR06MB6583.apcprd06.prod.outlook.com (2603:1096:990:32::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 00:16:32 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%4]) with mapi id 15.20.8048.013; Fri, 11 Oct 2024
 00:16:31 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, kernel test robot
	<lkp@intel.com>
Subject: RE: [PATCH v14 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Thread-Topic: [PATCH v14 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Thread-Index: AQHbFJkJzKJZDwNsK0+qSVrw+hYpbbJ3yVMAgAhBWoCAALFpQA==
Date: Fri, 11 Oct 2024 00:16:31 +0000
Message-ID:  <OS8PR06MB75413D9CD40FC095B1B9FB67F2792@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20241002070213.1165263-3-ryan_chen@aspeedtech.com>
 <202410051547.vOL3qMOc-lkp@intel.com> <ZwfZP0LeqKobdbgK@smile.fi.intel.com>
In-Reply-To: <ZwfZP0LeqKobdbgK@smile.fi.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|JH0PR06MB6583:EE_
x-ms-office365-filtering-correlation-id: 35405455-33b5-4034-510e-08dce989f57d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:  =?us-ascii?Q?RIaHB6XbTtTRAdvdPD/+Ijupn37OZyZiNFe2IS38A6slb8P74d23vtpHBBDH?=
 =?us-ascii?Q?t0kMSumDO1x5atQ25UWXU6iLG4fmCxc78n43Q4H2LD+DJVyseMuWREAWZ/Xe?=
 =?us-ascii?Q?AGDVY5SIjr9o6FkcqW3kTb77v6jpaSVkxSM7EGn8MGkCUCVrS/C+cilapV0S?=
 =?us-ascii?Q?kZXpoaDz5WcHLiO3SrycsqT3bVBeCrZkJ2x09wsuIvcfk+9XGfjgVBlUTPMr?=
 =?us-ascii?Q?D8vlT++Z/E6C/yiASu1E7y/Dh3HU4qkIpwtxlMGzJXVf7M4XTE8MPskx9HyM?=
 =?us-ascii?Q?J7xKUGJsISXiAPpDwsLm8/+6xLPydjcM0jpIScGBozdnU+3EYgR3nVLiFfa+?=
 =?us-ascii?Q?GX3P4Fs1qGMrdb5k6G/HgB9rITGdTeECI1bCn3MhKyO1c9MeSef8VrvosjDE?=
 =?us-ascii?Q?zCI6BUmfKb9C56/HecBZOJJZDsBLmJKgqPanfzxukOg/qtYH76iSoH7cMxFQ?=
 =?us-ascii?Q?b3Ul94gxK7EWumvZKF5emgabASLU627cDJYpZre2dWWSrRWYvHC3Nt6xGPoK?=
 =?us-ascii?Q?HV/kat4I2EjLbWbOXgrOkK0aWVR0fUX6prEuUdRX2Zohncyz2eiInLaXvqcO?=
 =?us-ascii?Q?DhCdvVWQjHxsGHZgOeBRSy0KUaTmLzySfl4G6BtdHrddmX+CHi4TYlR10WdB?=
 =?us-ascii?Q?edRHEzhFJNfL6kEyHzbHCbYs3sGF+/Y9spfWJ4ywWL0hKbgCmZ10aetwhUEE?=
 =?us-ascii?Q?Kl6AXolYntYbDXU9vteHDHRl290MAys+I6nMuLEE5qZhnzaZmqvC6DDH//4B?=
 =?us-ascii?Q?Fjvo8lZ0N2ANIR37RvXAbV14tWZtGkWDZtKywyxcHEgR8zDFDab11B0Dk98G?=
 =?us-ascii?Q?StJZiCMScB9ZlebcuFVy+ShMLuu/SjaturgvCU2bXmtABRIHFixWQGx9sxIp?=
 =?us-ascii?Q?Z6mu2qv5YmD0u0KvBHtLgFlN+TdrXl3Ns9UZEZt8Xv6kG9SmzFJ+CsKmUhEx?=
 =?us-ascii?Q?q2lzrFNWcdT3G7w+cfJ0Qf34ibmNFCZKCFQ2V7r6gLnVX6ZjyOKHo95nlaAA?=
 =?us-ascii?Q?TPsZFCkeoopdq9f7FKJSYhx2sO/KlyEv9nsNXuCkmMX2Z69CCgnXKFyEYonp?=
 =?us-ascii?Q?1srVFftsvc84iTjlhraQXwNKmK/9t1gHzVM58BpRn2l2fzynOSoE87Eg+i7J?=
 =?us-ascii?Q?wW2728WBBt2CjuuCjiNb5+8zFbvZtaphDP6D075b08EVkfuVSzePC48TqG5y?=
 =?us-ascii?Q?olbXnAREp/OgZc7x9fY7MTS0UL7GZAhNhdU1V62UULK0pIeLGL/6aSkMchK3?=
 =?us-ascii?Q?K0gVk254bJcp8hD0jjPnwZQVWozsrTsvqRxmgG8dOA=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?kyt8/Ltr37BoWVoekmi6nxySX9I7EGUUD0ffTWHgW6g9uupeg0zmNbGxsQ/A?=
 =?us-ascii?Q?NXd1oNkdnhWJUNsHQ8UK2vFHsE273Ff07zzddnecT82wx/FEbFyqSjBQzR5y?=
 =?us-ascii?Q?7j3fidd/5DSxXeXfdi1sBFDth1fea6prsBwjXhnlOy0BmHCuzSkwvSG9DmzV?=
 =?us-ascii?Q?MdP74xkMBHDJhIHzsn5mN27hZvueiO23Kr1KKFX1CVoGVNymwoe4Fp3CtRv/?=
 =?us-ascii?Q?x9w21lkeNprlCyGi7V2M2OjeBNaQb70UdUW4qryjdeDJS0my8Kh172RcIzXk?=
 =?us-ascii?Q?CWtDEhedDsRdBrGBdotuRpMjS8mV80CTRUli3w1lnzy4b3MBnTHbcV49qeIc?=
 =?us-ascii?Q?y32/cdWjUZ5y8z3PRlnWSzQRKQBqsniMARWuoBVtkU7/p/vGY+rpqt6bsbVN?=
 =?us-ascii?Q?9MmgLK+CpRtC2/KFOChTze1tPlIpyqVTc1/snngY96Ga/bo6CKP2T9ylQ1Gj?=
 =?us-ascii?Q?WKPVTBZEH+JiONLnHjnXjEiZLIYH0oissGMf8dZsASK9qO0sGsAfB3j4xqlT?=
 =?us-ascii?Q?lFDpoySWcOl3t1rnI72vlk+BojZroBncmWbDvLpiCTHKrZNpZ1ssqWmQou8R?=
 =?us-ascii?Q?94YBP+QXXPrbFrSRR9aS4EzCLDAKHZRdjPMpONf3mtoZTK72WTqypX6LPIOt?=
 =?us-ascii?Q?Sa9gddKrJDuhYQml7el4jL5QALq4ac0Q3MRdnbZ/o0L0aBsAY7bRu0NX164E?=
 =?us-ascii?Q?pDoJBMs/Wj2GSqy9AcyiPg3OVyrpMlyAkHR36OF5yAgRUwuKJSnQyfTkalEZ?=
 =?us-ascii?Q?h6eoTEvRE77oZUKcwi34TCvalNBtFUSen+SJeZ0g2p+pBIfAJSt/QXxc2Mu3?=
 =?us-ascii?Q?Bn+lRPmb81iHa76ju2Dt33isY+2PCQmYKZ5tEtDA8zLvyWy9jhS2Bs28mSMh?=
 =?us-ascii?Q?zh3tRYutgTkUwD2QpRT7VhJ8CeiDYG56+LnNr5KiDf5oAjOr1ca3MlOAmhez?=
 =?us-ascii?Q?htlkkwCjd3xOJOUWb6bDIPp2n2Qm4/hGhUIm3YpkeThWL0J+d1rgT8sm/dXJ?=
 =?us-ascii?Q?BV28WNPcVZPmQBx8iva2UVuQG/JDEwL3PLzSIX5XFTZtf2rY02lJWmBfAqnV?=
 =?us-ascii?Q?OuDXY6/MAeSdRypPwNrhkjXsJXkRH7HFNKpT8+m68oXPuPMSM9dxORXxTrEB?=
 =?us-ascii?Q?VGhV38P2o+qLv7Kggjiu1jWAOmliTYw35aaH9Xfhnnu0Etq/z3xNrmK/sg0I?=
 =?us-ascii?Q?HWYstza3hrMjT+vyqGNn1SKFnk/vPJtu/pEux9YNxcLjhjY7IgudjPHcjR6s?=
 =?us-ascii?Q?F5yt3Uucq/idIL+zBcYFL7Jn/35WuAUG5OYbN07HfQHKmlS4rcps0S0Yjvp8?=
 =?us-ascii?Q?zkZFRa4IpEgjYaitPPPgT3kYZvU0OAd+MKbrcWwtKoR4f9mpof3OixEe22ks?=
 =?us-ascii?Q?qF1waJoqlV58gveNT6bX2TpUt/L16lCEoSXjbAUvER0qOB5o8nG8GS+0lhDv?=
 =?us-ascii?Q?/MYCTTWPrR3EcX32avhhV3oG8en4Qr3x8vLOeYILrx309eRr96gV5PWi1c51?=
 =?us-ascii?Q?n8JRItEKc9dvyzbRAiiJ38Vyy7g/Ao+5lmmLkItaj7Hrin1gRLhGMxIxh+QO?=
 =?us-ascii?Q?N/A/etaGplfepYcqTloaHxx+lLE7HtFd3MnUXw1C?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35405455-33b5-4034-510e-08dce989f57d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2024 00:16:31.7653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oavvTMlVbGg2EJzV1j5XJx+l6nq6yZPRJBDFinekplVYjqXdb7FpkEL9GwO/LFQ3W4m8aZAFV+7wC1ccGJNGre4hY5d2bjm/HQbUa8H9Bvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6583
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>, "joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> Subject: Re: [PATCH v14 2/3] i2c: aspeed: support AST2600 i2c new registe=
r
> mode driver
>=20
> On Sat, Oct 05, 2024 at 03:36:16PM +0800, kernel test robot wrote:
> > Hi Ryan,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on v6.11]
> > [cannot apply to andi-shyti/i2c/i2c-host v6.12-rc1 linus/master
> > next-20241004] [If your patch is applied to the wrong git tree, kindly =
drop us
> a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:
> https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-i2c-=
as
> peed-support-for-AST2600-i2cv2/20241002-150410
> > base:   v6.11
> > patch link:
> https://lore.kernel.org/r/20241002070213.1165263-3-ryan_chen%40aspeedt
> ech.com
> > patch subject: [PATCH v14 2/3] i2c: aspeed: support AST2600 i2c new
> > register mode driver
> > config: sh-allmodconfig
> >
> (https://download.01.org/0day-ci/archive/20241005/202410051547.vOL3qM
> O
> > c-lkp@intel.com/config)
> > compiler: sh4-linux-gcc (GCC) 14.1.0
> > reproduce (this is a W=3D1 build):
> >
> (https://download.01.org/0day-ci/archive/20241005/202410051547.vOL3qM
> O
> > c-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new
> > version of the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes:
> > | https://lore.kernel.org/oe-kbuild-all/202410051547.vOL3qMOc-lkp@inte
> > | l.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    drivers/i2c/busses/i2c-ast2600.c: In function
> 'ast2600_i2c_setup_buff_tx':
> > >> drivers/i2c/busses/i2c-ast2600.c:437:41: error: implicit
> > >> declaration of function 'get_unaligned_le16'; did you mean
> > >> 'get_unalign_ctl'? [-Wimplicit-function-declaration]
> >      437 |
> get_unaligned_le16(&msg->buf[i2c_bus->master_xfer_cnt + i]);
> >          |
> ^~~~~~~~~~~~~~~~~~
> >          |
> get_unalign_ctl
> > >> drivers/i2c/busses/i2c-ast2600.c:441:41: error: implicit
> > >> declaration of function 'get_unaligned_le24'; did you mean
> > >> 'get_unalign_ctl'? [-Wimplicit-function-declaration]
> >      441 |
> get_unaligned_le24(&msg->buf[i2c_bus->master_xfer_cnt + i]);
> >          |
> ^~~~~~~~~~~~~~~~~~
> >          |
> get_unalign_ctl
> > >> drivers/i2c/busses/i2c-ast2600.c:445:41: error: implicit
> > >> declaration of function 'get_unaligned_le32'; did you mean
> > >> 'get_unalign_ctl'? [-Wimplicit-function-declaration]
> >      445 |
> get_unaligned_le32(&msg->buf[i2c_bus->master_xfer_cnt + i]);
> >          |
> ^~~~~~~~~~~~~~~~~~
> >          |
> get_unalign_ctl
>=20
> You need to add
>=20
> #include <asm/unaligned.h>
>=20
> _after_ other #include <linux/*.h> in the code.
>=20
Thanks, I had modify update in v15 submit.
https://patchwork.ozlabs.org/project/linux-aspeed/patch/20241007035235.2254=
138-3-ryan_chen@aspeedtech.com/
> --
> With Best Regards,
> Andy Shevchenko
>=20

