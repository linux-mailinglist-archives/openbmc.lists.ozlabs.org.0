Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F53935100E
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 09:24:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9vpJ4WBfz30GR
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 18:24:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=gGqTbsYX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=57252e1af0=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=gGqTbsYX; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9vp15fclz302Z
 for <openbmc@lists.ozlabs.org>; Thu,  1 Apr 2021 18:24:40 +1100 (AEDT)
Received: from pps.filterd (m0165120.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1317MgjM010986; Thu, 1 Apr 2021 07:24:09 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by mx0b-00268f01.pphosted.com with ESMTP id 37n297h6t8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Apr 2021 07:24:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jfl601ljt1cyS4QxaLVzSk1HGp4Mn5h9fgWqYzkczgDN6/TPZCepZSJTyDscL35Nab+Yk3hwZL6chabZsv5S/9QlUTYYn+DAqetD2a4C7BeLgQOcHWBxpAtoWr3pMy+gRWv7bgPdRU9wtleqze8EuEespqjuAup3iE1CGHsMTt4gr/x5ePv9Cv2wLG32AE4i+SMNDvfbV2JhiRr6BwPTG999Kh+latT1rC21nJBYdENKYSJEwfuxybBd7sGnTAJkBVwDa5eWKoh5M2c9uFmkmQ5Y7ZfMmU59loELo78MLx3vUkZtEZwhyxZGaXeZrozeIu653JU1Gb6x2qGWNEvylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oisYPEgtTq+dOix/7U9jZLGo4mUSoZZipp3LR3qJ70M=;
 b=H6+3PdAhm1ksbmW5nMUGtFDOuobYuA2gwbzJyl/Rv/0dxps4dZV6Oqed7p9zSuspRmD/KDAJFyRTQ3BN2X1TQKjqC0LLgBxlyRNn5bgctwctemgwkx6S8v3neBM2eiPpZM5aqd2iL1M0iKcG7dasFalWTajmJ361gAhSo63o8S6NWTDxGU+QRXu0h3ztCFOdCvUganqyT1WSCfdarlTQzDE914gvfn0ONiwCdWf+Gv0Ub2BmwAhj/m+zG7g3Xluh1sXo57sV6gEuqbgqArfaDhTfl8WD1mN7Q1ORPDP9uRuQN2hmZl6caaPytb2IdVSyrtkxvE90ca1fUqRJvTW6ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oisYPEgtTq+dOix/7U9jZLGo4mUSoZZipp3LR3qJ70M=;
 b=gGqTbsYXWqa5nkB39bnS6PM6+QFb/XNl21QvOgdXeNe+6JzlyELGQWW9o4INCbBDINELNmUTaFDkJU9U7Ip3O7GKyVQVsknkjFAjF8w6KDp0JAZorOiyvTEWac2qwMIv6KakHh8ZfeVGq9yPT0HAVCDS96DANOmBSCYHc+Ys60w=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM6PR04MB6185.namprd04.prod.outlook.com (2603:10b6:5:12e::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.28; Thu, 1 Apr 2021 07:24:06 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad%5]) with mapi id 15.20.3977.033; Thu, 1 Apr 2021
 07:24:05 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 00/21] ipmi: Allow raw access to KCS devices
Thread-Topic: [PATCH v2 00/21] ipmi: Allow raw access to KCS devices
Thread-Index: AQHXJsf/9djoVAwHJ0KGcn7YGwLpdQ==
Date: Thu, 1 Apr 2021 07:24:05 +0000
Message-ID: <YGV1FIKVX/4hxt1U@packtop>
References: <20210319061952.145040-1-andrew@aj.id.au>
In-Reply-To: <20210319061952.145040-1-andrew@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b808e67-df80-4e8f-d2f2-08d8f4df2200
x-ms-traffictypediagnostic: DM6PR04MB6185:
x-microsoft-antispam-prvs: <DM6PR04MB6185090FED6348B55F9FEC4BC37B9@DM6PR04MB6185.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LPqyIoiOekByvWrnLeIFKcRzQlSPsfQQg52eZXGWadVUVu/GGhI6nFcVRXlYJcelUWSGwpM+3xBLyvNmsBad+MPoknx1AQVZ/IbOSe0wnCu16gMsmcecHAXA5VL36VBvNhxiQlUlvE9ta8VGHzxOVwqAQWNG4WqPmW54mywzCXVpmagnsYT7li41/1s/4GTXCPUQSnb700iy+DFo2GGV1/lcPn0pC4CxxmGeT955LvZc/m5nUbiBCfPL2WtUkKB4Ns42CURpTsTz8ri87CD88LzD99S0qBGTebIbkDsK6J7i6uMtNvPQzjBRuv/SWqc2NVq0chK5r7nvIAEGtcrpi0IJIlaBxQ5IT9ZIleKdzsGorngW9CJdUcMkmWMeEk+b8fpV8Y8NSsWH/aeeBIq779xILde2eP9bJoP5JcIecYwD03Bkm+3+65UzrI2oqXysDMCEBFnrEiMD9njWnMDszkUv9JFV4nN6cM1dPWzMGj6KtduVsgXdfKGIo0FGJTD6bSUk/oDEwJP/0xpBVlRuaOKWvMt29L81PkxpUNZ9xIEU2169HmIcD91A26kOkTuG2KYwGWbhXy+FcZqQbe+HeYHnFQBO2yXlYDsMiy1wGJOKYib2nTakE/xT3I6pj7hy/WHjMhnE/tr9GtIf41tgLcg5C0XUTrmL1JicICUhb8TQ1933YiLEKEJ9gGih3/3QOlE2oIqgI4ekRdV1OctlIr3KQnPznGAxLDp/2nEydMM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(39860400002)(376002)(396003)(346002)(136003)(366004)(5660300002)(6506007)(9686003)(76116006)(6512007)(71200400001)(66946007)(64756008)(66446008)(66476007)(66556008)(83380400001)(86362001)(316002)(6916009)(54906003)(8936002)(2906002)(33716001)(478600001)(186003)(6486002)(8676002)(38100700001)(4326008)(7416002)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?XdtZv861/CQ13zFN07g7DaMWyqqRV3l9TUs5/h5aVh1fX8h6ivjeSGwUErb5?=
 =?us-ascii?Q?GtUd4Jatwcr5mYelLma0z/XKh2CHrQrdn+ubPKANfTMQMOag476n1ITR2yhG?=
 =?us-ascii?Q?I9IakEi8y2If0P2CGOkJlBV02x2RFz9G1we+q0QvXjkcxVUWaShWrvgMANTT?=
 =?us-ascii?Q?hWOhB65AnV9vh+aszBKobrtRb39GEYHu8vLV5dWRzlVput8McWTGAKfR7SI8?=
 =?us-ascii?Q?op1xQxbwRMZ7mvy/LCY8gdd34TXlBmOBDTacOhvtIETZTRlfhLsC5RL9BK+I?=
 =?us-ascii?Q?yx48CYmkMDR9KFJWXgg8ysE5kXegctpHIL3Z+pbRS/qkc8Uz9YuxBCQUjz9c?=
 =?us-ascii?Q?GmG6sGdT00kh7sKL96qbuDmHDZcTVIdjekdRUiPnZEFZjLD5jXfB9wLR+1hf?=
 =?us-ascii?Q?VOiHu8I55RqAz1IRSdmNSC8sWhO6+j/41erm96B+b+j2G7jiZwcV/bWiB7T+?=
 =?us-ascii?Q?FmNJEotazpU6I5AHetbeEtfMj0C5BbvLwczBxUxgF+lOsAXSoIBecmImhG37?=
 =?us-ascii?Q?G7AD2tF1ej+4LgxbLQYGBQQXqIb362WCiSLKEhSwgsj8ZS5Drk5bWsBR4de6?=
 =?us-ascii?Q?kpwaSLzqUpZl2BKRZPiiW86uz/9tfNmcftFLPeNyiieLRcXDvn/CI7UGERdd?=
 =?us-ascii?Q?iA9LwsMntFJB2J0qVTfmcFs4b5M4s4Mrz20iGgbLAFlMAdVi54AwZTAZD2hz?=
 =?us-ascii?Q?Z6hYRxRavYp6AxTHtSpEmD6VFFriF+mmi1BPIon//hECn2UyvYUvfHSkYVpU?=
 =?us-ascii?Q?C59cx0pweowxZ2o4zxY2thgmLkI+DzN/4nr+2hIluzhtfBGJggrz3clG9BGC?=
 =?us-ascii?Q?58Xf2cnh6Whje+6qYmC5jnOjTosxbkPMnHts5rbvirtWUL3E+JKLCH1MxtCY?=
 =?us-ascii?Q?VYKEnSTSg28AojGC5rXyhNOwzt7jGZ6rHegiftAmwrBy8eoficY98/MbIi39?=
 =?us-ascii?Q?l31/yq2OvBvUaJNFPQR40eLna+5B+wz9Zq4p4GM17Uw3om5h+j28yXCYEubO?=
 =?us-ascii?Q?1kSw1n89NEkkdXyUy3AznxQdCTdD7FjrtAQG0g/pORzY/G50rv61uaQVFeuE?=
 =?us-ascii?Q?Z21XB3foL7DqIt733uD+MpE9WKPpvWrTw16FOuGzkyo37KPAUcJ3y6Z5BQSb?=
 =?us-ascii?Q?vW3uyL4d0gqsUv9KK/EwxvUUhpw/Qow+iM/ahiuCCjKEpaTxa7lWms+WXunU?=
 =?us-ascii?Q?Lg1NACYAoGEnr4iBIWECXTU1+bNbOA1U4XX2mAaza3iJQq8knOMfeDtyz7kq?=
 =?us-ascii?Q?mX024YORGVngsGvS1ao8xHrPl9wvWgGKvlOWzKrXn39xYrCgBBVcZ2v2t7wO?=
 =?us-ascii?Q?2dbbt67SXW7BIicr3V4/vt9/?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8C4B244CA87C114A8B816828171409A7@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b808e67-df80-4e8f-d2f2-08d8f4df2200
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2021 07:24:05.5849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3MFXClpAj9Hno7/QistrEVz/QrC7i+1LOoY/rF3OPDpJfCFOwJ0jEAyvqnEqJHYu2G1s3OTo8mrqZe4+JuK3BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6185
X-Proofpoint-GUID: 9e8GXM1_PWB8u9tUHb1iuWvrNnXNBdap
X-Proofpoint-ORIG-GUID: 9e8GXM1_PWB8u9tUHb1iuWvrNnXNBdap
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-01_03:2021-03-31,
 2021-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1011
 suspectscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103310000
 definitions=main-2104010050
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "chiawei_wang@aspeedtech.com" <chiawei_wang@aspeedtech.com>,
 "ryan_chen@aspeedtech.com" <ryan_chen@aspeedtech.com>,
 "tmaimon77@gmail.com" <tmaimon77@gmail.com>,
 "minyard@acm.org" <minyard@acm.org>,
 "avifishman70@gmail.com" <avifishman70@gmail.com>,
 "venture@google.com" <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "benjaminfair@google.com" <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 19, 2021 at 01:19:30AM CDT, Andrew Jeffery wrote:
>Hello,
>
>This series is a bit of a mix of things, but its primary purpose is to
>expose BMC KCS IPMI devices to userspace in a way that enables userspace
>to talk to host firmware using protocols that are not IPMI.
>
>v1 can be found here:
>
>https://lore.kernel.org/openbmc/20210219142523.3464540-1-andrew@aj.id.au/
>
>Changes in v2 include:
>
>* A rebase onto v5.12-rc2
>* Incorporation of off-list feedback on SerIRQ configuration from
>  Chiawei
>* Further validation on hardware for ASPEED KCS devices 2, 3 and 4
>* Lifting the existing single-open constraint of the IPMI chardev
>* Fixes addressing Rob's feedback on the conversion of the ASPEED KCS
>  binding to dt-schema
>* Fixes addressing Rob's feedback on the new aspeed,lpc-interrupts
>  property definition for the ASPEED KCS binding
>
>A new chardev device is added whose implementation exposes the Input
>Data Register (IDR), Output Data Register (ODR) and Status Register
>(STR) via read() and write(), and implements poll() for event
>monitoring.
>
>The existing /dev/ipmi-kcs* chardev interface exposes the KCS devices in
>a way which encoded the IPMI protocol in its behaviour. However, as
>LPC[0] KCS devices give us bi-directional interrupts between the host
>and a BMC with both a data and status byte, they are useful for purposes
>beyond IPMI.
>
>As a concrete example, libmctp[1] implements a vendor-defined MCTP[2]
>binding using a combination of LPC Firmware cycles for bulk data
>transfer and a KCS device via LPC IO cycles for out-of-band protocol
>control messages[3]. This gives a throughput improvement over the
>standard KCS binding[4] while continuing to exploit the ease of setup of
>the LPC bus for early boot firmware on the host processor.
>
>The series takes a bit of a winding path to achieve its aim:
>
>1. It begins with patches 1-5 put together by Chia-Wei, which I've
>rebased on v5.12-rc2. These fix the ASPEED LPC bindings and other
>non-KCS LPC-related ASPEED device drivers in a way that enables the
>SerIRQ patches at the end of the series. With Joel's review I'm hoping
>these 5 can go through the aspeed tree, and that the rest can go through
>the IPMI tree.
>
>2. Next, patches 6-13 fairly heavily refactor the KCS support in the
>IPMI part of the tree, re-architecting things such that it's possible to
>support multiple chardev implementations sitting on top of the ASPEED
>and Nuvoton device drivers. However, the KCS code didn't really have
>great separation of concerns as it stood, so even if we disregard the
>multiple-chardev support I think the cleanups are worthwhile.
>
>3. Patch 14 adds some interrupt management capabilities to the KCS
>device drivers in preparation for patch 16, which introduces the new
>"raw" KCS device interface. I'm not stoked about the device name/path,
>so if people are looking to bikeshed something then feel free to lay
>into that.
>
>4. The remaining patches switch the ASPEED KCS devicetree binding to
>dt-schema, add a new interrupt property to describe the SerIRQ behaviour
>of the device and finally clean up Serial IRQ support in the ASPEED KCS
>driver.
>
>Rob: The dt-binding patches still come before the relevant driver
>changes, I tried to keep the two close together in the series, hence the
>bindings changes not being patches 1 and 2.
>
>I've exercised the series under qemu with the rainier-bmc machine plus
>additional patches for KCS support[5]. I've also substituted this series i=
n
>place of a hacky out-of-tree driver that we've been using for the
>libmctp stack and successfully booted the host processor under our
>internal full-platform simulation tools for a Rainier system.
>
>Note that this work touches the Nuvoton driver as well as ASPEED's, but
>I don't have the capability to test those changes or the IPMI chardev
>path. Tested-by tags would be much appreciated if you can exercise one
>or both.
>
>Please review!
>
>Andrew
>

After rebasing the series onto the OpenBMC dev-5.10 kernel (with only a
tiny conflict for the addition of the ast2600 entry in
ast_kcs_bmc_match) and enabling CONFIG_IPMI_KCS_BMC_CDEV_IPMI, my
e3c246d4i system booted healthily and handled some basic ipmitool
operations as expected.

Tested-by: Zev Weiss <zweiss@equinix.com>


Zev

