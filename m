Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 918373D8383
	for <lists+openbmc@lfdr.de>; Wed, 28 Jul 2021 00:59:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZC0R3gC6z2yNJ
	for <lists+openbmc@lfdr.de>; Wed, 28 Jul 2021 08:59:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=AHDI+OYH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=8842907869=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=AHDI+OYH; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZC044kQ3z2yX6;
 Wed, 28 Jul 2021 08:58:59 +1000 (AEST)
Received: from pps.filterd (m0165121.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16RMsFHf028496; Tue, 27 Jul 2021 22:58:11 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by mx0b-00268f01.pphosted.com with ESMTP id 3a2nwus7gj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 22:58:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DU2XufI/do1/ZKC32cCSA5nOp6kKXkIRUeicjjklil1ScQT4t/w5rXm0E8rszCYTlHkytekgPU49LfX3Kj4cJ9zq8KicUN3pemx70MvMAYb1UmjKiPPw5qYxNtgMIVJc6IZ9t2Kz8s+Q8QA0V+6ps/wcv17jD5nuIniBysIID6UsHGbtex3v9b9GmpPANmkkCkd4pEikdq+Ljs201v/Dcc46F2McjwIS6V8mXf6rdWS5Msme95qmVTKatm//GnUn1jRB9tBVr3+b2QvH6QuVQBlSnCofhFYUSCjqNcBkcmZqqlOPuUhlg7ui9ohavzeV70sdGqFuSpAPLazkOk0KQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aC0phhDDegkSrWPEI7SGs2TirsIHR0Rto/d7m+MIlSk=;
 b=HdpPevVnXD7ripg4cZcZ3PM/eQnNxVZfWtd72/Y+K0fdz4B0JbPKnEZmUaYlq/K/znDkDB7gJ4njvEMu44q0HRiuv7FRJS2xHLpHrAmIp5V7qnxLq4yo9N5PznfjL6CH/QlpKMEigu/Y4VCLqUhXb3GGnVa3JUOn5D+8dDGk9O7yV344b5CrVLYyYHTWt7dR4CFd2s7SUhMTe6Izg5v+EqnhyMC3WAySu8e8YylcLIRcA0BEOZbQYPvk6Sn6w9byrWdPZdpZ2tPeR1HyyFVOHlVlWzIRD8oIQfWecImOWCTFgcS2AardunlwhALpKvHIoQ4N+O/9MEolHlzmbO7HaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aC0phhDDegkSrWPEI7SGs2TirsIHR0Rto/d7m+MIlSk=;
 b=AHDI+OYH2SYhyq9+Fpyr92khm50DsZ3Pt9DE5qkaMdz30kXXcOVmXr0FSRrL6ctbyBDucY6VaV1MV+JPcW8aHyW1uWMZZrPFIu9yWzAIuXbtW0lvx5+SvPFzoLFirp96RLhwlJpck8T5uSY4GgTzCG9bi6AtSyXs1OuwiTcKxf4=
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB7781.namprd04.prod.outlook.com (2603:10b6:8:33::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Tue, 27 Jul
 2021 22:58:09 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::953d:f9ec:b2cc:ca2b]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::953d:f9ec:b2cc:ca2b%5]) with mapi id 15.20.4373.018; Tue, 27 Jul 2021
 22:58:09 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Subject: Re: [PATCH 13/14] docs: hwmon: Document PECI drivers
Thread-Topic: [PATCH 13/14] docs: hwmon: Document PECI drivers
Thread-Index: AQHXgzrekgBvAebmGEm7GzBex72boQ==
Date: Tue, 27 Jul 2021 22:58:08 +0000
Message-ID: <20210727225808.GU8018@packtop>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-14-iwona.winiarska@intel.com>
In-Reply-To: <20210712220447.957418-14-iwona.winiarska@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=equinix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bba6f10-afe4-4ab8-75e8-08d9515200bb
x-ms-traffictypediagnostic: DM8PR04MB7781:
x-microsoft-antispam-prvs: <DM8PR04MB778175FB39490C7A30F4AB4CC3E99@DM8PR04MB7781.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l7/94EGyOHMo0Sbsj4Qqf/RkoGWiN7Lcro/G2+kdMMVPsBqUIM7P9sxRN22CKqP3UaYPp/d7mgzEmPTqt80FS/KpAp5gCPT3WvfZ7VE1N7QYO5RKcl2qNJbhlEYIWD5CHDUZK/Z5OBaPKq6TfVxsivJCZJENQQTLXT82L36kcYNSyWfY4IsJRNDLNMcGPThqBQIOmMkrlnU0psMSs6BPc2mR+C3cGbFtrOTi8tOjgoxnklSIxHF+S/C39T6dPUFcC9AiG+W+N+HGAzfgPU4Y6Dd3vYOmqKxCrVEaxq/lqquNGs/udBpExNB7hAdDyR6hoKw4Se7MqwZb+Ui3/f/ZUrF3FBQ9S/nhh/MGDfORkhdQ9g5N9P3jpLJi2OfSP/GhBvUeQAioW+iCmXU+Le4KxFvXIKUz11NGON69tcIT9TijdNfRPv7x/ufDVyigSM8HmR1GCysS3m9jfC7VSaxLe7I8Vqes6+zb5aRmBrzaSkAY2J+aHKytF9LUCReg6igqgCFAtmW2e1TwMh3uvf6lrB28I0R8Ru/sVmxvG+1Bk2pzzboxTWhej2msneWCPcP5U5CTOsB4+a045tty6tozxYunwaGxSZh92emmA1UNxXxJgFkyus81dmrCKrDLXurVqTsYeBbc1G93705AaaRx/uYzlCMVgOPUuXA6cyZSvw115KD3VB1jXJDaixfE+y3NWke1azOJU4XCnrPj7prn9UTMWTFzzuk5u2y0liq+IVVbdRHfmXedfEvJLkJK2JX4FN26u1s7G5KdPEn128lU8pAFbBQ6hNt4/e2eijYIaqedcC9YK/pL0rYEHNCF5Va8ORVmyjcGgVGncoLR8ASLCg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(346002)(376002)(366004)(136003)(396003)(39860400002)(83380400001)(86362001)(7416002)(71200400001)(478600001)(966005)(33716001)(38100700002)(64756008)(6916009)(76116006)(8676002)(5660300002)(54906003)(38070700005)(19273905006)(2906002)(91956017)(66476007)(4326008)(316002)(1076003)(186003)(66946007)(8936002)(6512007)(6486002)(6506007)(9686003)(26005)(122000001)(66556008)(66446008)(33656002)(562404015)(563064011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?U1YfAFhb52Ge7HW1Xo78LDQVWimqYO8c0Ojq8PJlHWvhdhT7WcBpolvs1YeD?=
 =?us-ascii?Q?AXOh6+ujcIOfvJUSxvZAIFHREvcpegkBozeZiez3Y0bI21HrPR1oxZ1UvaIz?=
 =?us-ascii?Q?C4zJJpIMIUJIgMSsIquS6HVrk2lwXNqyuKjbsWohbkXcTDWuIlftRMzD7Wme?=
 =?us-ascii?Q?C9AMnZl3zWfwe2SNVEGJ/IRkjHozsbfBerY7sq9D3oeYCbYOOeZl64M7dgVW?=
 =?us-ascii?Q?OnLp4FCn0CvanyY0R06A81JtAx2+72R9B7VlBb8OadwNiB0RqlmRjeKCMejC?=
 =?us-ascii?Q?54t6iM6g/zrGfE82VDwWAqH62MO4LzjA+1uMqlk5XuqkiN6Nmo/wtqPB6IFK?=
 =?us-ascii?Q?XdxN8ZoFGPWGV6b7QJKpTKFRpCjXqr0Ic9KkjxZqW3F+ndCEY7I/rQAjwxO5?=
 =?us-ascii?Q?iQOAPXH0fsHy7Wxm6bdg8YqBliH4PCYE/pQZAcUpf5GqygNnsmXbiYmnxVVk?=
 =?us-ascii?Q?BPDDPzMDHHDnn29wQo69GrGc7EdPCVV5YVW+GZuTSL4ZPlhX7mGarJ4mWOiC?=
 =?us-ascii?Q?whpue+OlUUHaB1KUaETIGaUsZ9P3FL+oD32rJVL/R1WO7uk/+Zk6lI8l4bh2?=
 =?us-ascii?Q?MVGYSR1eUx8t3MEZw3NbqejWpdmdPIAVoZUoanToTSZPdL9J1KY+IpgzVEN8?=
 =?us-ascii?Q?u2gJWvOWkVkmXobwPNupYXoTMCxgcUe1zwVkPIaxcrvQwk3+Oq5yBWXlca2S?=
 =?us-ascii?Q?8pNzUN8GhX98w7gZ7xzlAN3rCkFEX/vNqIOVKNtrUouDI8mBttG9r1CYSjrs?=
 =?us-ascii?Q?HYMOeyInTwZkXJnHb2w3zl99P/Kd7LxaHQVGf2m2xYZbhHW3QzmhzIGhTVQn?=
 =?us-ascii?Q?C+tGj4smGBZ4Pv6h7GUda36WErFDOYmlNqek693aQ1JQvmpQu7+zqF+ZBk+P?=
 =?us-ascii?Q?lCjbUUFhLqWnOSYB5Eobq4jjNw0kIfRPNxzEBFP37G5uXHNZzxfqmvEuN8w1?=
 =?us-ascii?Q?o1ghlqYUEHzZ3c8oy/WaSwO1zXXND2UJv1k/CD2rVYS25vNZVBWndrob5e+j?=
 =?us-ascii?Q?rXVD+K4DEbkS5h2x8s6Jxm9BHlDZ8X/07YGVh4fwOHtUR1JP+ccxzicCSOd2?=
 =?us-ascii?Q?8vlMLsLS811G3qpzuSgEu++Wu9RDmKr7EfQ3FXrOnWaBXl1ABKbCgNGIAwIZ?=
 =?us-ascii?Q?rw9oZaBDP58BQVZRSXkrrD7Fstb3bhrUwwcsiiJ1of1mT4fMkldJVywemu55?=
 =?us-ascii?Q?lAGGyDGB1a9+lksX4TOSeluhJGRLEh6G6AQ8627CGs7wCFFGFzTMQac8NC5F?=
 =?us-ascii?Q?/UC/mYSWMb1MqXdd5Pe6kMDTtoQ2o08vOmhDbUK0o6+WsWgUiAMQ5Om2adzr?=
 =?us-ascii?Q?1RUwANFa7h1a5vM4+5D6vomI?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <90875CD98B22454EAF3ADDC38406D3ED@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bba6f10-afe4-4ab8-75e8-08d9515200bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2021 22:58:09.0034 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z6crMN5QNyu2R3rCXzdfZhA5Dov98p9Nysq5JP2i2N6av8cP42nY2xwBl+azLuJ6PfLNxUMa5tSdUevjJsdmNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB7781
X-Proofpoint-GUID: c073w2vP-sLS6ZjpMDN2HWids-UCRkWz
X-Proofpoint-ORIG-GUID: c073w2vP-sLS6ZjpMDN2HWids-UCRkWz
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-27_14:2021-07-27,
 2021-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107270132
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "x86@kernel.org" <x86@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yazen Ghannam <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jul 12, 2021 at 05:04:46PM CDT, Iwona Winiarska wrote:
>From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>
>Add documentation for peci-cputemp driver that provides DTS thermal
>readings for CPU packages and CPU cores and peci-dimmtemp driver that
>provides DTS thermal readings for DIMMs.
>
>Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>Co-developed-by: Iwona Winiarska <iwona.winiarska@intel.com>
>Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
>Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>---
> Documentation/hwmon/index.rst         |  2 +
> Documentation/hwmon/peci-cputemp.rst  | 93 +++++++++++++++++++++++++++
> Documentation/hwmon/peci-dimmtemp.rst | 58 +++++++++++++++++
> MAINTAINERS                           |  2 +
> 4 files changed, 155 insertions(+)
> create mode 100644 Documentation/hwmon/peci-cputemp.rst
> create mode 100644 Documentation/hwmon/peci-dimmtemp.rst
>
>diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
>index bc01601ea81a..cc76b5b3f791 100644
>--- a/Documentation/hwmon/index.rst
>+++ b/Documentation/hwmon/index.rst
>@@ -154,6 +154,8 @@ Hardware Monitoring Kernel Drivers
>    pcf8591
>    pim4328
>    pm6764tr
>+   peci-cputemp
>+   peci-dimmtemp
>    pmbus
>    powr1220
>    pxe1610
>diff --git a/Documentation/hwmon/peci-cputemp.rst b/Documentation/hwmon/pe=
ci-cputemp.rst
>new file mode 100644
>index 000000000000..d3a218ba810a
>--- /dev/null
>+++ b/Documentation/hwmon/peci-cputemp.rst
>@@ -0,0 +1,93 @@
>+.. SPDX-License-Identifier: GPL-2.0-only
>+
>+Kernel driver peci-cputemp
>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>+
>+Supported chips:
>+	One of Intel server CPUs listed below which is connected to a PECI bus.
>+		* Intel Xeon E5/E7 v3 server processors
>+			Intel Xeon E5-14xx v3 family
>+			Intel Xeon E5-24xx v3 family
>+			Intel Xeon E5-16xx v3 family
>+			Intel Xeon E5-26xx v3 family
>+			Intel Xeon E5-46xx v3 family
>+			Intel Xeon E7-48xx v3 family
>+			Intel Xeon E7-88xx v3 family
>+		* Intel Xeon E5/E7 v4 server processors
>+			Intel Xeon E5-16xx v4 family
>+			Intel Xeon E5-26xx v4 family
>+			Intel Xeon E5-46xx v4 family
>+			Intel Xeon E7-48xx v4 family
>+			Intel Xeon E7-88xx v4 family
>+		* Intel Xeon Scalable server processors
>+			Intel Xeon D family
>+			Intel Xeon Bronze family
>+			Intel Xeon Silver family
>+			Intel Xeon Gold family
>+			Intel Xeon Platinum family
>+
>+	Datasheet: Available from http://www.intel.com/design/literature.htm
>+
>+Author: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>+
>+Description
>+-----------
>+
>+This driver implements a generic PECI hwmon feature which provides Digita=
l
>+Thermal Sensor (DTS) thermal readings of the CPU package and CPU cores th=
at are
>+accessible via the processor PECI interface.
>+
>+All temperature values are given in millidegree Celsius and will be measu=
rable
>+only when the target CPU is powered on.
>+
>+Sysfs interface
>+-------------------
>+
>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>+temp1_label		"Die"
>+temp1_input		Provides current die temperature of the CPU package.
>+temp1_max		Provides thermal control temperature of the CPU package
>+			which is also known as Tcontrol.
>+temp1_crit		Provides shutdown temperature of the CPU package which
>+			is also known as the maximum processor junction
>+			temperature, Tjmax or Tprochot.
>+temp1_crit_hyst		Provides the hysteresis value from Tcontrol to Tjmax of
>+			the CPU package.
>+
>+temp2_label		"DTS"
>+temp2_input		Provides current DTS temperature of the CPU package.

Would this be a good place to note the slightly counter-intuitive nature
of DTS readings?  i.e. add something along the lines of "The DTS sensor
produces a delta relative to Tjmax, so negative values are normal and
values approaching zero are hot."  (In my experience people who aren't
already familiar with it tend to think something's wrong when a CPU
temperature reading shows -50C.)

>+temp2_max		Provides thermal control temperature of the CPU package
>+			which is also known as Tcontrol.
>+temp2_crit		Provides shutdown temperature of the CPU package which
>+			is also known as the maximum processor junction
>+			temperature, Tjmax or Tprochot.
>+temp2_crit_hyst		Provides the hysteresis value from Tcontrol to Tjmax of
>+			the CPU package.
>+
>+temp3_label		"Tcontrol"
>+temp3_input		Provides current Tcontrol temperature of the CPU
>+			package which is also known as Fan Temperature target.
>+			Indicates the relative value from thermal monitor trip
>+			temperature at which fans should be engaged.
>+temp3_crit		Provides Tcontrol critical value of the CPU package
>+			which is same to Tjmax.
>+
>+temp4_label		"Tthrottle"
>+temp4_input		Provides current Tthrottle temperature of the CPU
>+			package. Used for throttling temperature. If this value
>+			is allowed and lower than Tjmax - the throttle will
>+			occur and reported at lower than Tjmax.
>+
>+temp5_label		"Tjmax"
>+temp5_input		Provides the maximum junction temperature, Tjmax of the
>+			CPU package.
>+
>+temp[6-N]_label		Provides string "Core X", where X is resolved core
>+			number.
>+temp[6-N]_input		Provides current temperature of each core.
>+temp[6-N]_max		Provides thermal control temperature of the core.
>+temp[6-N]_crit		Provides shutdown temperature of the core.
>+temp[6-N]_crit_hyst	Provides the hysteresis value from Tcontrol to Tjmax =
of
>+			the core.

I only see *_label and *_input for the per-core temperature sensors, no
*_max, *_crit, or *_crit_hyst.

>+
>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>diff --git a/Documentation/hwmon/peci-dimmtemp.rst b/Documentation/hwmon/p=
eci-dimmtemp.rst
>new file mode 100644
>index 000000000000..1778d9317e43
>--- /dev/null
>+++ b/Documentation/hwmon/peci-dimmtemp.rst
>@@ -0,0 +1,58 @@
>+.. SPDX-License-Identifier: GPL-2.0
>+
>+Kernel driver peci-dimmtemp
>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>+
>+Supported chips:
>+	One of Intel server CPUs listed below which is connected to a PECI bus.
>+		* Intel Xeon E5/E7 v3 server processors
>+			Intel Xeon E5-14xx v3 family
>+			Intel Xeon E5-24xx v3 family
>+			Intel Xeon E5-16xx v3 family
>+			Intel Xeon E5-26xx v3 family
>+			Intel Xeon E5-46xx v3 family
>+			Intel Xeon E7-48xx v3 family
>+			Intel Xeon E7-88xx v3 family
>+		* Intel Xeon E5/E7 v4 server processors
>+			Intel Xeon E5-16xx v4 family
>+			Intel Xeon E5-26xx v4 family
>+			Intel Xeon E5-46xx v4 family
>+			Intel Xeon E7-48xx v4 family
>+			Intel Xeon E7-88xx v4 family
>+		* Intel Xeon Scalable server processors
>+			Intel Xeon D family
>+			Intel Xeon Bronze family
>+			Intel Xeon Silver family
>+			Intel Xeon Gold family
>+			Intel Xeon Platinum family
>+
>+	Datasheet: Available from http://www.intel.com/design/literature.htm
>+
>+Author: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>+
>+Description
>+-----------
>+
>+This driver implements a generic PECI hwmon feature which provides Digita=
l
>+Thermal Sensor (DTS) thermal readings of DIMM components that are accessi=
ble
>+via the processor PECI interface.

I had thought "DTS" referred to a fairly specific sensor in the CPU; is
the same term also used for DIMM temp sensors or is the mention of it
here a copy/paste error?

>+
>+All temperature values are given in millidegree Celsius and will be measu=
rable
>+only when the target CPU is powered on.
>+
>+Sysfs interface
>+-------------------
>+
>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>+
>+temp[N]_label		Provides string "DIMM CI", where C is DIMM channel and
>+			I is DIMM index of the populated DIMM.
>+temp[N]_input		Provides current temperature of the populated DIMM.
>+temp[N]_max		Provides thermal control temperature of the DIMM.
>+temp[N]_crit		Provides shutdown temperature of the DIMM.
>+
>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>+
>+Note:
>+	DIMM temperature attributes will appear when the client CPU's BIOS
>+	completes memory training and testing.
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 35ba9e3646bd..d16da127bbdc 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -14509,6 +14509,8 @@ M:	Iwona Winiarska <iwona.winiarska@intel.com>
> R:	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> L:	linux-hwmon@vger.kernel.org
> S:	Supported
>+F:	Documentation/hwmon/peci-cputemp.rst
>+F:	Documentation/hwmon/peci-dimmtemp.rst
> F:	drivers/hwmon/peci/
>
> PECI SUBSYSTEM
>--=20
>2.31.1
>=
