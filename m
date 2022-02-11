Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A394B1D9A
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 06:14:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jw1xY0v30z3bY3
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 16:14:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=nbUEl5Qo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::731;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=troy_lee@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=nbUEl5Qo; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20731.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::731])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jw1x26bNgz30QR
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 16:13:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bk71LyVxBQDmogYJsnaEmxgdVVKnedVbXo/p6tlZmgTDRvTMfay+e5iLyswIvX7Hy7f7JyYUTJJog2TWsemNjeaOOtK9WJ3JypSYWpPEQy/micIw+y0KQhBx4FGK+BmCw0jbgucCRmBytUSmimoDEAxW9z5r3O66PnFbA1GzJRwoi+/gVMmGsGLlKWfv3VpMvgvYguElDHDxL/5VTJpIElPoZDd3cOKbNlkzgsxLHrDlKiW0+Sl6X/NNx3XvpxHEPoF9PTONiXt5Aaa/JmsyJ1KV/m9E66x3Drjb5mm/ptGb8Y/ZcP5B0ZP0QVS7RIxAOvlYkAgKqTGAcZow9dNb4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Gy3spTNu7ySkqwGzWY64SonrKMYhaRb0/n73Iq8kqU=;
 b=YmzzSVyGaQzxMnZHqyGwIsEBfDi3Om3mY/rjyjcuDcYXCVvymXd2LLv9nmzK6vCkwzRGywvbTJPjVVsKCEQlpxjvIzvvG7UVcVGXyMRNmmD3Olwwgax5s2plgmgqG8+iAQBgMqZpvE7SsxtNN70BSR26pE8vu5HzjGbduSzbUL8eikp8MJUil4ZG2uGaDxx5SON1kArGSRCzzeLLBEG2zPkxc1f0B/HnfsEgRiJv/N7cH/0pUrzJCKOPLrdb6kPknvLZDaLnUIdSU87wm6HVztXvIOW2mXEgRvh7+MrnW9SBBzoh7r6JB86R+kg1vgzMuktJJJ+SB8nLyPl97X8SUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Gy3spTNu7ySkqwGzWY64SonrKMYhaRb0/n73Iq8kqU=;
 b=nbUEl5QosOnl5phK1sog/GmgDUInbL8WMqlQXji9qamRBJYjg7FlUSSrRgd6pIShiOrU7oPGw6/tlrSDPM+pEiNU6a0cagp5KliljsXj4SnMLXNhcvZw5xtpr7CIfEIcERnjxUfnvvxVHQWnOblkBYhfHslImdsVxvzL3eZLRqTq4pMw2H62kfCvD7BQu5Y2223PEjHGlpD6oDG0eE8qm9fGqEiw8O2lKVJSbBDLxsp14mJcsMzhDusQ1Qc2eAcKiKVBEtlunDUBqv+IGoX8j/aKIsgcQD8Zu82qFAfgrK6UtQduZuv8N6AdL1No1fFKKSJ20Dhvs7GLlbMFqA4V+g==
Received: from HK0PR06MB2145.apcprd06.prod.outlook.com (2603:1096:203:4b::20)
 by TY2PR06MB2861.apcprd06.prod.outlook.com (2603:1096:404:38::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.14; Fri, 11 Feb
 2022 05:13:18 +0000
Received: from HK0PR06MB2145.apcprd06.prod.outlook.com
 ([fe80::1d71:2917:2d9:701b]) by HK0PR06MB2145.apcprd06.prod.outlook.com
 ([fe80::1d71:2917:2d9:701b%6]) with mapi id 15.20.4975.011; Fri, 11 Feb 2022
 05:13:18 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: Tung Nguyen OS <tungnguyen@os.amperecomputing.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [AST2600] PWM/TACH driver and dbus-sensor issue 
Thread-Topic: [AST2600] PWM/TACH driver and dbus-sensor issue 
Thread-Index: AQHYHb9Z9fVcffI98EScCXqS70CDbayN0A+A
Date: Fri, 11 Feb 2022 05:13:18 +0000
Message-ID: <HK0PR06MB2145535BDA1526108377B8478A309@HK0PR06MB2145.apcprd06.prod.outlook.com>
References: <CO1PR01MB6759E0EC69109784C4B3C282FF2E9@CO1PR01MB6759.prod.exchangelabs.com>
In-Reply-To: <CO1PR01MB6759E0EC69109784C4B3C282FF2E9@CO1PR01MB6759.prod.exchangelabs.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa35c0ed-06c5-4b45-ce1e-08d9ed1d3707
x-ms-traffictypediagnostic: TY2PR06MB2861:EE_
x-microsoft-antispam-prvs: <TY2PR06MB2861611C32CFC0F56184A02E8A309@TY2PR06MB2861.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qQNPddhX+xjEbWbyT/IEcMBPZpMNDTHLgUam4PPsD+pbgF0cDzXXrbFvlxA1Vhg0N3fL64xQcrWJv6XZ2x2i/bOHITA7paLuBDoWyZUxRF6Jla5zKCwTbASmXw0GvbenYevsjjEpkGR+jpTO414R2JqrFgrbY438ah/uvDFemGlcDMgvdQensuA0YBm2vqvArGnCLMBg16OuY/8P4k33K4132SxrfW/IHwJV47TrUHFoS200MzYlU80Oce/i0C9qPYerW168kdsvAxyUBkRIcGGn/o97yk99UrVcU4EnzMTGEmK9CW9vxwjtBma8208FofGkMsvaLT3bmCFBLpPuIjDSSDbgk4WvitWN2wCU6JmbaF+c669lidZep670XadpqkfiYrk/m60FF5Z/DGvYHjnGHmMFDN9evFzsN6IC0/+4rXRTopKhFqKDwlHSw44HNIpa3ebJt8Qb5Z3EZtnNMOSqwCfEpP/ULeyiGaxpQ2/hTJR6OX5XDbXeSwJoXotEXB8N0QnzlKapcoHsfQLzua1vB7cpIYLp6Cp6VgVpdVQHjYWYnRdvw0X/xkq3Fc4/mSGWNGjbskyqzgbhuF1SwhkY1UM+Q6d7lXS9NLxLrxex6aChDBQFYZUe9EO0fUzTz1JGRqzD2IzXe44SeQNGaqaks+CWFZbFVq1KTuw0oKH0G3oHHyMJIDQtnbtFVWYHAvr4779L3nD/yk/KjDPcxtk3b6F2+b2XE7nlLnCUh8YtwZ0qTZcqPIp5WY/EFC3oQQA1JCXGiCqMWxSvZ0SEwp9u4l1JMZEnRjQYxJHQzhO/xAdzVtg4+VM4LRrPkDsJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2145.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(376002)(396003)(136003)(366004)(346002)(39840400004)(4326008)(8936002)(8676002)(7696005)(9686003)(6506007)(316002)(54906003)(5660300002)(66446008)(110136005)(122000001)(71200400001)(83380400001)(52536014)(64756008)(76116006)(186003)(26005)(66946007)(86362001)(4743002)(55016003)(38070700005)(2906002)(508600001)(66556008)(66476007)(38100700002)(33656002)(53546011)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nc1fI5M0k5n46hTXFlb2FJFcHpVkb7oqy7vL5iHZW/TCevhyeVwaAXg0daL9?=
 =?us-ascii?Q?zYnrUzfgoha9VER8+6w49hMDtthSj5xBw3Pbr2bNb83mGXBqoECWAFfGYOJI?=
 =?us-ascii?Q?safz2wU6M8fmYzR7ERHH1kmMhj4YFCvIHHlhfreAMF/mRajjXetlcT8HgvnE?=
 =?us-ascii?Q?P0NrSJoAjwXOKiZs390jyk0JnUKvAl/E0huU/hTh9imZhxP+XPP+ru5kFg1V?=
 =?us-ascii?Q?QGEabT6OEPTQ5TOfMlHeHdrvzmwUPwI1UPNetZhsCmH1AOMcnBighyBzC2ue?=
 =?us-ascii?Q?C1UmOgCG6E/sF1neY4VHjmfwvElM0RTOovHEyGkZLkcp2oTFlVeoS8uAdrQO?=
 =?us-ascii?Q?CUQ9QlyfFv1pr2PV1tcT/PZFZN82M8FDXHJzokZBpKzOuikCchEXx+WE3LLq?=
 =?us-ascii?Q?TJ883+1iLfuDZH52DB9w3KVR/UWNHQYcYPoe2FnKv90PYl0IFKkgM1+0PcIj?=
 =?us-ascii?Q?ECbIlbf6ley2jQsnL2+8r8aICTEQBiq3xzodX9Ra4WXdOISa1Kto3UXi5fmv?=
 =?us-ascii?Q?OFNInv07bpDsSl18LSkP4p7YRvh+ZTlGoLKdgFkEp31RnxgHwIxvNMPS9qkU?=
 =?us-ascii?Q?RAYXrv7NNt0te/H2k2EEPxu7tpwQcRQgv2eAVkyQ3RtfoWn284QBzt6RFpM3?=
 =?us-ascii?Q?bI4vbnJ4NHqGMPEiPpK/m1DcCJwlDCBPC34pbrYgY2ZCpr02lWRWOVmVDx/L?=
 =?us-ascii?Q?8FVh+LmbX4zsjAqL4X5LshkH1IoubW/nKtMaY4u5AqU+qaa+gzoRGDr+lqgO?=
 =?us-ascii?Q?mEPMTgNsSY5VNBBBJ8qU4aoskPruhC+8ropveqLCYzmHddDB6zpl+z3tdZ4h?=
 =?us-ascii?Q?ZZY6YUyo4S/OLakasAUvx+AGk69H9aaIJAOyV3uZUhLCMpHKQ50x8TUylKx5?=
 =?us-ascii?Q?VCESncMTw0dhfBbw18J/NdOfBofa8Db0Gu16bcz1/rBX4tHkO8fZOz/ZjZtj?=
 =?us-ascii?Q?Q8tfZuFBkH/xRpYuDPEq3IHhupMZH5oum0Tb5PZAGDfZxNEjzNC/acUMPuWq?=
 =?us-ascii?Q?8njaLZwq2YdQ/KtSo+pLg2/R9gD0CoE9mCrcfzoWZnkekq7f8mJFUKHxy2Y/?=
 =?us-ascii?Q?x8YJcqFm4fMMkyQQ3kZ0jI6qLLLTgAAOr++komu5OY0Bddh8GsCUQdefalcr?=
 =?us-ascii?Q?GHLmOIKCzSRlxSMOLm4YAWTFlBxZtwXniXMtrKMv4Pz8Oi7MJpyewnMRPdGY?=
 =?us-ascii?Q?yrnnC0ZMWb3ZvJ6mqj7USy/KfQv5p/juifFcsmtQs8h4xG5wL0nxbt9T/VRM?=
 =?us-ascii?Q?HhP/SvTXqd5WYytRWzVooHn7F6RcSwPhSYKhX6C++iziuIVg0UpLdpOPjJvY?=
 =?us-ascii?Q?+5xDaO+765ZfZKjjjf4vQYBKvrhz5YO3z2enmKt6xIvmVLMmzqR/pHsmIfSi?=
 =?us-ascii?Q?vRYqoliNXOsuQPQlcbOPaZvuB5rOpsbO3qBax2IPqQSMG8vMqpuMpktIYq4i?=
 =?us-ascii?Q?cRR6GFHxInjJ9hs9XpPUEekfTIBpaxs3J8clKGDpPqeLhSYdWVMi8t2dsB9f?=
 =?us-ascii?Q?q6peybY0gA1TkhZOMzI8YZCylK+urIYEcgnK5EFL7ef+rjakSS3llcDWzDcY?=
 =?us-ascii?Q?wxNoBxENO1EejGoiIIy6D+Uatu1iv3Tg/koOsc+tgxpT7u2JzQ3va0XvLUiE?=
 =?us-ascii?Q?j6d2nKRfaRIPOOtm0VL1B70=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2145.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa35c0ed-06c5-4b45-ce1e-08d9ed1d3707
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 05:13:18.0853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Trlm9/rsQUFqcPZZlQz8JuJFjoHJYuZFFD/lsg9LfJVOUibJ6du8gTeol1GvXpWkiBf86MO1VCsaGATVuHbj4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR06MB2861
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
Cc: Thu Nguyen OS <thu@os.amperecomputing.com>,
 Thang Nguyen OS <thang@os.amperecomputing.com>,
 Phong Vo OS <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tung,

> -----Original Message-----
> From: openbmc <openbmc-
> bounces+troy_lee=3Daspeedtech.com@lists.ozlabs.org> On Behalf Of Tung
> Nguyen OS
> Sent: Wednesday, February 9, 2022 10:40 PM
> To: openbmc@lists.ozlabs.org
> Cc: Thu Nguyen OS <thu@os.amperecomputing.com>; Thang Nguyen OS
> <thang@os.amperecomputing.com>; Phong Vo OS
> <phong@os.amperecomputing.com>
> Subject: [AST2600] PWM/TACH driver and dbus-sensor issue
>=20
> Dear community,
> We have ported the PWM/TACH hwmon driver for AST2600 from ASPEED's
> repository https://github.com/AspeedTech-BMC/linux/tree/aspeed-master-
> v5.4/drivers/hwmon to support Ampere Computing's systems. Verify with
> AST2600 EVB, i can see the driver works. However there is a concern like:
> 1. The change of hwmon fan pwm/tach in sysfs (as below), this is differen=
t
> from the ast2500 as the separated of the fan*_input and pwm1 in various
> hwmon directories. At this time, the driver doesn't exist in the OpenBMC
> linux at https://github.com/openbmc/linux. Is OpenBMC going to merge and
> keep this driver ?

Please have a look on this patch.
https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/49253

Thanks,
Troy Lee

> root@mtmitchell:~# ls -la /sys/class/hwmon/hwmon hwmon0/ hwmon1/
> hwmon2/ hwmon3/ hwmon4/ hwmon5/ hwmon6/ hwmon7/ hwmon8/
> hwmon9/ root@mtmitchell:~# ls -la /sys/class/hwmon/hwmon0/
> drwxr-xr-x    3 root     root             0 Jan  1  1970 .
> drwxr-xr-x    3 root     root             0 Jan  1  1970 ..
> lrwxrwxrwx    1 root     root             0 Feb  9 08:38 device -
> > ../../../1e610000.pwm_tach:tach
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan10_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan11_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan12_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan13_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan14_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan15_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan16_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan1_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan2_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan3_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan4_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan5_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan6_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan7_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan8_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan9_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 name
> lrwxrwxrwx    1 root     root             0 Feb  9 08:38 of_node -
> > ../../../../../../../../firmware/devicetree/base/ahb/apb/pwm_tach@1e610
> 000/tach
> drwxr-xr-x    2 root     root             0 Feb  9 08:38 power
> lrwxrwxrwx    1 root     root             0 Jan  1  1970 subsystem -
> > ../../../../../../../../class/hwmon
> -rw-r--r--    1 root     root          4096 Jan  1  1970 uevent
> root@mtmitchell:~# ls -la /sys/class/hwmon/hwmon*/pwm*
> -rw-r--r--    1 root     root          4096 Feb  9 09:13
> /sys/class/hwmon/hwmon1/pwm1
> -rw-r--r--    1 root     root          4096 Feb  9 09:20
> /sys/class/hwmon/hwmon2/pwm1
> -rw-r--r--    1 root     root          4096 Feb  9 08:38
> /sys/class/hwmon/hwmon3/pwm1
> -rw-r--r--    1 root     root          4096 Feb  9 08:38
> /sys/class/hwmon/hwmon4/pwm1
> -rw-r--r--    1 root     root          4096 Feb  9 08:38
> /sys/class/hwmon/hwmon5/pwm1
> -rw-r--r--    1 root     root          4096 Feb  9 08:38
> /sys/class/hwmon/hwmon6/pwm1
> -rw-r--r--    1 root     root          4096 Feb  9 08:38
> /sys/class/hwmon/hwmon7/pwm1
> -rw-r--r--    1 root     root          4096 Feb  9 08:38
> /sys/class/hwmon/hwmon8/pwm1
>=20
> 2. With above changes, the dbus-sensor for FAN/PWM shall not work
> because of the compatibility. So if OpenBMC want to keep above
> PWM/TACH driver, does any sides have the plan to support the fan sensor, =
if
> not, we can join and do it.
>=20
> Thank you and best regards,
> Tung
