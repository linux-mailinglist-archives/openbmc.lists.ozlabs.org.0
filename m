Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA8535A709
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 21:26:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FH7RM6qD9z3bs2
	for <lists+openbmc@lfdr.de>; Sat, 10 Apr 2021 05:26:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=UUmO82L7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=5733813a0f=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=UUmO82L7; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FH7R22LxXz2xYx;
 Sat, 10 Apr 2021 05:26:21 +1000 (AEST)
Received: from pps.filterd (m0165120.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 139JNblo024976; Fri, 9 Apr 2021 19:26:03 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by mx0b-00268f01.pphosted.com with ESMTP id 37ts5s0sf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 19:26:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mvh2kHm9dfD2f0+F84z1F1R0UlzsPYfgTWIRtSErbBVVCS/WAaEItJC2csYoTPNGh/phdWumVt8gu4CEl3HeFz3xX/pDLppO6Gg/nte1MYK2URdGGT+Ta1POiaZ9NzEeGfqdDgNNUkg/wRm8+2/HdvFG7dEjw/BxvCT5kby8bhv8WYz4XAHeLSIDQplfD8rRCXBHNqxch8mUqlv8MdzNbBZ/6COSW/hT8aqJLZR+ITuvCSWcVjBusWs1b4/yTqILiBdlSaZAhVUjcQ43OcbeM5rG0F3fci+Bfu33+XYVtSx1EEu01Cm9doi/XUghJ3VqAtEgC+CeU5mtC9yCP+0vZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlFjWLWuaOHHLlNDGjsF/7tB+tGX9FBHdsuALYMZIlE=;
 b=jM99EX9oybkWwL5P8Jep9bVfICZIB44oAqGaCv+ZncZQemA5vp5l0/FnEc7Yub1ESRO3Tmr4YC35yLoukNtuRId13OGQeFK0W0slK+agfq6+gpkMThPO3bgGOa8TwxMK6DdxL45diwZ6Evty3EdNcZkD9fGZvN+AgambykFxckbF0F+bge1jtNMeYM6meVvJKsUrbbnFbeA9YApQZk85YKNDtwAM9JzHh4TAjyFF9FJm5UNqtmBT/2LNyJV2faJT/2NMW+QrRht56zbdY8SMFOLBEOYxKEWj+54gB+3pPjkFjbH+BVbf9IRFm+aWO8PusKLWTUCVRxRRe0vVfsFYGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlFjWLWuaOHHLlNDGjsF/7tB+tGX9FBHdsuALYMZIlE=;
 b=UUmO82L7CHhT3OJtSFRzZ1/3arQUL9+ZJBUgLn9JwF21k0Flp9mdjJPMPfuL/l4mhSbgavFASGl9iL1wUP01chVAoQzb8INkLMJlMPbc7FNSU7CLqSnTDIgF2Yjbc5/XxviD33DzsSsyDdRMDP6K4ubA5nqCZ4TmVWU7wPYPEqY=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM5PR04MB0363.namprd04.prod.outlook.com (2603:10b6:3:aa::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17; Fri, 9 Apr 2021 19:26:00 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad%5]) with mapi id 15.20.4020.017; Fri, 9 Apr 2021
 19:26:00 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 10/21] ipmi: kcs_bmc: Turn the driver data-structures
 inside-out
Thread-Topic: [PATCH v2 10/21] ipmi: kcs_bmc: Turn the driver data-structures
 inside-out
Thread-Index: AQHXLQkhK5HJQiDBlUq3BrfCbbMJraqskkSA
Date: Fri, 9 Apr 2021 19:26:00 +0000
Message-ID: <YHCqR8/nZFB1HRgX@packtop>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-10-andrew@aj.id.au> <YG/Ql9z9X/mtOSvl@packtop>
 <ea34ee69-a266-4737-8450-4695d2d0fbd4@www.fastmail.com>
 <YG/zVv4XOo1HoLd1@packtop>
In-Reply-To: <YG/zVv4XOo1HoLd1@packtop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8355b03a-498a-4895-2615-08d8fb8d4ebd
x-ms-traffictypediagnostic: DM5PR04MB0363:
x-microsoft-antispam-prvs: <DM5PR04MB036343EC5C2911E575F0CFA4C3739@DM5PR04MB0363.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ECSpl9/JuYTqN0wmtt+5pxwHqur+SHEpZCVDXtEkG9NmZYelMdHWSPrG7G61aqIIEfMLQvaVVuytffWtZN0mFvdHveDCRjOxaM3ArL+AtCtShL/hPc6ZFtuEXQ45XkSnGepO2/MzRaP/r+L1mRTJW7ddew4BOcpQbNg0i7akpaOvrRf/hfW566DfInzdKRNMm3GWoJ2to/BwTMjS3VN2fmZVDVEkpWCos1kFzEFbrPOoVoxgvhnoGLyyLSEo5H/cAgK58x9jjCpj3DQtBbFgq5lZIH4HBad7dhcXH3n1kyuz1wyWQ3+Hk3xaA8k2Wns2obLYN47SLQmXkYXrSeBJkm45ij97+mmjsgETFIwyaHtrHIerMIOCdxFEpakVp+tsnWywLT8KegLdflTzVz8C2sPYssu6XkF0bR7lYQmFFoRxRtqKjZ1ZdmoHrXFs3YVYwzJgaxAr7V/0ybIhx3xModP+xT2+9hag9ksGj35bPVIMcTQ469ghv8L2UUaNF9fX5ZhHdbIr9dTlV4yEN0N4VeTJk2JYINQ9wGyG/tV3LafavgaXQQ7woNveqS7VwVAIhoHGh3561fTVZ/RkFSpiaLnjFz7GCXWc/MAt3NdfnNFZs4mGk++v0SkJpT9di2yRbe+/UDgx5ViFRg5uPvp98rMc7d6pdInJ87JAqhLKfKs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(39850400004)(396003)(366004)(376002)(136003)(346002)(2906002)(9686003)(4326008)(8676002)(6916009)(76116006)(6512007)(6486002)(26005)(478600001)(6506007)(54906003)(316002)(66556008)(64756008)(66446008)(66476007)(86362001)(7416002)(38100700001)(30864003)(5660300002)(8936002)(71200400001)(83380400001)(33716001)(66946007)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?J9A66rbGTbNFTIVno8xBA1sTvBeLAZvBC72CCYXHlUpZh2Ob/UyRWlgtTvcC?=
 =?us-ascii?Q?rospge672n1vP3+RMU9fdg3s/muH48hU7bU8XB1BtC6fvjS3qWEpBXqN8YTX?=
 =?us-ascii?Q?zznsdsBoB9WMnlx1IbJ/w2398DTQU2A4lbQP1FmqchrNEXDkEHeMnvuxYE9R?=
 =?us-ascii?Q?KjOUgt5zY8kkcxkM56nQcTGgaLf0DT3ePWoLvGIjbvhYO/inD6N/wlNhrAe0?=
 =?us-ascii?Q?6I9uU1Pl/vMV4MnMII1VtFCUjZyATpcgfSUSXF5ar/0Qf0llCmwmmRaNmEGH?=
 =?us-ascii?Q?4Fw8hk0LY0kqshDGGYd4Fz01NEOY2tOIoMaW079nYoDObOYNT/8OOocJlwAE?=
 =?us-ascii?Q?TTRIydHReF+0/kdOCAmFH/0BPm+lebZ1gjKU6LWEJaZv/zSonqIySI86sSgC?=
 =?us-ascii?Q?Cib+uMopzfMLmYI3bhnCioaGZTUJWVFAeGY3TKJN0TY+b6wcXL4ovGLUpwNN?=
 =?us-ascii?Q?XH5yMoRvz/yeQVgdkfQYM3HPAzhCqGr7d9CqGXqUkKPwWNkfyvUudgw7jNB8?=
 =?us-ascii?Q?61Dd7c5KiOp6FL6bUfljpgAWbtxhFEpmfX/HXYcCDv19OPJAez00Xf54886W?=
 =?us-ascii?Q?GQPYyZ1fozGp111CvEkPtakEAwLM09BxuJ3bywfYcKal1zvxd5DvzLV7w/sP?=
 =?us-ascii?Q?5T3RTLsU/zKMqui9JLyc4RKM+oMDA1VFC4w6sKYzAsuAS/1JQ7vyASmA2kqY?=
 =?us-ascii?Q?4JkiS3fTQ71HDpd3XgaFIsJhvUgwDX3aztClq4zoEXQvp3ztuwbGNR+RJAG+?=
 =?us-ascii?Q?G8kMxPtxbWbxQSZQjo2MxMEGqlUpM64MMlrebAgx2WM/kgFVKWRvHIENFqD6?=
 =?us-ascii?Q?xwjEKcwfOa8dOaKQvO+Q/mpdXRcfgaHt3SJbo7xh2bbzivBlcn/gtzsRpm9K?=
 =?us-ascii?Q?k8MZk1OHnD2LxKDpBGh9DOpM+dY+eR0asxMKauUnC/zXtQ0nABmh0vr4hp6W?=
 =?us-ascii?Q?9WqlJNPWmmvWDLNAZqqTIDFmQYqHJg9SuCrGUa3J8eXetVfHhKIdQiEbxE/t?=
 =?us-ascii?Q?Fe4FMvU+Fdl51IXmpRBGzB8UlgS6e4dv/Yi9ThN5cSzQZYBmRNIMkaOZvpSl?=
 =?us-ascii?Q?HxsYX15hTvHBEan8mfDfNHWxPeGHf2RefHMewUfjsb5/nNCXl7jwYKj7+dCM?=
 =?us-ascii?Q?4P+5fwNcud8vYWXAArJdOFZzMptPo/YUSjPMYAeJ94jGlXPqAfTAuhA1l95E?=
 =?us-ascii?Q?jPjAxjcWZTV8KIxVKZ5TiCCYNIGEhdv09kHCDSBMktyEc0srms1hpZ5OSxMg?=
 =?us-ascii?Q?z/NrehCT3NfQFypDz6qJw67SLn2BpYhsHkxPFOVvoyj0R1UNc2qtX4q25aeA?=
 =?us-ascii?Q?qsKJXYF95V22LMTk7nJm1l+WvI8BDr6fmooR5CZPjHwvoQ=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0DAB7C08AE0DF741847CE60B21A5D795@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8355b03a-498a-4895-2615-08d8fb8d4ebd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 19:26:00.2124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iiZLdwP9cqFxPAfMLUoeyePf5d3s37lHYReZhFTgCF8zDJhbBVZHcA32tm+bdOjdhQtPyMQNkzPHJv3D7BwKJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0363
X-Proofpoint-GUID: vh-OeKhVXl2akBm7y0TxbfBSl3kKteAe
X-Proofpoint-ORIG-GUID: vh-OeKhVXl2akBm7y0TxbfBSl3kKteAe
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_07:2021-04-09,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104090139
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Corey Minyard <minyard@acm.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>, Lee Jones <lee.jones@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 09, 2021 at 01:25:26AM CDT, Zev Weiss wrote:
>On Fri, Apr 09, 2021 at 12:59:09AM CDT, Andrew Jeffery wrote:
>>
>>
>>On Fri, 9 Apr 2021, at 13:27, Zev Weiss wrote:
>>>On Fri, Mar 19, 2021 at 01:27:41AM CDT, Andrew Jeffery wrote:
>>>>Make the KCS device drivers responsible for allocating their own memory=
.
>>>>
>>>>Until now the private data for the device driver was allocated internal
>>>>to the private data for the chardev interface. This coupling required
>>>>the slightly awkward API of passing through the struct size for the
>>>>driver private data to the chardev constructor, and then retrieving a
>>>>pointer to the driver private data from the allocated chardev memory.
>>>>
>>>>In addition to being awkward, the arrangement prevents the
>>>>implementation of alternative userspace interfaces as the device driver
>>>>private data is not independent.
>>>>
>>>>Peel a layer off the onion and turn the data-structures inside out by
>>>>exploiting container_of() and embedding `struct kcs_device` in the
>>>>driver private data.
>>>>
>>>>Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>>>>---
>>>> drivers/char/ipmi/kcs_bmc.c           | 15 +++++--
>>>> drivers/char/ipmi/kcs_bmc.h           | 12 ++----
>>>> drivers/char/ipmi/kcs_bmc_aspeed.c    | 60 ++++++++++++++++-----------
>>>> drivers/char/ipmi/kcs_bmc_cdev_ipmi.c | 60 ++++++++++++++++++---------
>>>> drivers/char/ipmi/kcs_bmc_npcm7xx.c   | 37 ++++++++++-------
>>>> 5 files changed, 113 insertions(+), 71 deletions(-)
>>>>
>>>>diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
>>>>index ef5c48ffe74a..709b6bdec165 100644
>>>>--- a/drivers/char/ipmi/kcs_bmc.c
>>>>+++ b/drivers/char/ipmi/kcs_bmc.c
>>>>@@ -44,12 +44,19 @@ int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc)
>>>> }
>>>> EXPORT_SYMBOL(kcs_bmc_handle_event);
>>>>
>>>>-struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv=
, u32 channel);
>>>>-struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv, u32=
 channel)
>>>>+int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc *kcs_bmc);
>>>
>>>Another declaration perhaps intended for kcs_bmc.h?
>>
>>These are temporary while the code gets shuffled around. The symbol
>>name is an implementation detail, not a "public" part of the API; after
>>some further shuffling these are eventually assigned as callbacks in an
>>ops struct.
>>
>
>Okay, that makes sense.
>
>>>
>>>>+int kcs_bmc_add_device(struct kcs_bmc *kcs_bmc)
>>>> {
>>>>-	return kcs_bmc_ipmi_alloc(dev, sizeof_priv, channel);
>>>>+	return kcs_bmc_ipmi_attach_cdev(kcs_bmc);
>>>> }
>>>>-EXPORT_SYMBOL(kcs_bmc_alloc);
>>>>+EXPORT_SYMBOL(kcs_bmc_add_device);
>>>>+
>>>>+int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc *kcs_bmc);
>>>
>>>Here too.
>>>
>>>>+int kcs_bmc_remove_device(struct kcs_bmc *kcs_bmc)
>>>>+{
>>>>+	return kcs_bmc_ipmi_detach_cdev(kcs_bmc);
>>>>+}
>>>>+EXPORT_SYMBOL(kcs_bmc_remove_device);
>>>>
>>>> MODULE_LICENSE("GPL v2");
>>>> MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
>>>>diff --git a/drivers/char/ipmi/kcs_bmc.h b/drivers/char/ipmi/kcs_bmc.h
>>>>index febea0c8deb4..bf0ae327997f 100644
>>>>--- a/drivers/char/ipmi/kcs_bmc.h
>>>>+++ b/drivers/char/ipmi/kcs_bmc.h
>>>>@@ -67,6 +67,8 @@ struct kcs_ioreg {
>>>> };
>>>>
>>>> struct kcs_bmc {
>>>>+	struct device *dev;
>>>>+
>>>> 	spinlock_t lock;
>>>>
>>>> 	u32 channel;
>>>>@@ -94,17 +96,11 @@ struct kcs_bmc {
>>>> 	u8 *kbuffer;
>>>>
>>>> 	struct miscdevice miscdev;
>>>>-
>>>>-	unsigned long priv[];
>>>> };
>>>>
>>>>-static inline void *kcs_bmc_priv(struct kcs_bmc *kcs_bmc)
>>>>-{
>>>>-	return kcs_bmc->priv;
>>>>-}
>>>>-
>>>> int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc);
>>>>-struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv, u32=
 channel);
>>>>+int kcs_bmc_add_device(struct kcs_bmc *kcs_bmc);
>>>>+int kcs_bmc_remove_device(struct kcs_bmc *kcs_bmc);
>>>>
>>>> u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc);
>>>> void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data);
>>>>diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs=
_bmc_aspeed.c
>>>>index 630cf095560e..0416ac78ce68 100644
>>>>--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
>>>>+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
>>>>@@ -61,6 +61,8 @@
>>>> #define LPC_STR4             0x11C
>>>>
>>>> struct aspeed_kcs_bmc {
>>>>+	struct kcs_bmc kcs_bmc;
>>>>+
>>>> 	struct regmap *map;
>>>> };
>>>>
>>>>@@ -69,9 +71,14 @@ struct aspeed_kcs_of_ops {
>>>> 	int (*get_io_address)(struct platform_device *pdev);
>>>> };
>>>>
>>>>+static inline struct aspeed_kcs_bmc *to_aspeed_kcs_bmc(struct kcs_bmc =
*kcs_bmc)
>>>>+{
>>>>+	return container_of(kcs_bmc, struct aspeed_kcs_bmc, kcs_bmc);
>>>>+}
>>>>+
>>>> static u8 aspeed_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
>>>> {
>>>>-	struct aspeed_kcs_bmc *priv =3D kcs_bmc_priv(kcs_bmc);
>>>>+	struct aspeed_kcs_bmc *priv =3D to_aspeed_kcs_bmc(kcs_bmc);
>>>> 	u32 val =3D 0;
>>>> 	int rc;
>>>>
>>>>@@ -83,7 +90,7 @@ static u8 aspeed_kcs_inb(struct kcs_bmc *kcs_bmc, u32=
 reg)
>>>>
>>>> static void aspeed_kcs_outb(struct kcs_bmc *kcs_bmc, u32 reg, u8 data)
>>>> {
>>>>-	struct aspeed_kcs_bmc *priv =3D kcs_bmc_priv(kcs_bmc);
>>>>+	struct aspeed_kcs_bmc *priv =3D to_aspeed_kcs_bmc(kcs_bmc);
>>>> 	int rc;
>>>>
>>>> 	rc =3D regmap_write(priv->map, reg, data);
>>>>@@ -92,7 +99,7 @@ static void aspeed_kcs_outb(struct kcs_bmc *kcs_bmc, =
u32 reg, u8 data)
>>>>
>>>> static void aspeed_kcs_updateb(struct kcs_bmc *kcs_bmc, u32 reg, u8 ma=
sk, u8 val)
>>>> {
>>>>-	struct aspeed_kcs_bmc *priv =3D kcs_bmc_priv(kcs_bmc);
>>>>+	struct aspeed_kcs_bmc *priv =3D to_aspeed_kcs_bmc(kcs_bmc);
>>>> 	int rc;
>>>>
>>>> 	rc =3D regmap_update_bits(priv->map, reg, mask, val);
>>>>@@ -114,7 +121,7 @@ static void aspeed_kcs_updateb(struct kcs_bmc *kcs_=
bmc, u32 reg, u8 mask, u8 val
>>>>  */
>>>> static void aspeed_kcs_set_address(struct kcs_bmc *kcs_bmc, u16 addr)
>>>> {
>>>>-	struct aspeed_kcs_bmc *priv =3D kcs_bmc_priv(kcs_bmc);
>>>>+	struct aspeed_kcs_bmc *priv =3D to_aspeed_kcs_bmc(kcs_bmc);
>>>>
>>>> 	switch (kcs_bmc->channel) {
>>>> 	case 1:
>>>>@@ -148,7 +155,7 @@ static void aspeed_kcs_set_address(struct kcs_bmc *=
kcs_bmc, u16 addr)
>>>>
>>>> static void aspeed_kcs_enable_channel(struct kcs_bmc *kcs_bmc, bool en=
able)
>>>> {
>>>>-	struct aspeed_kcs_bmc *priv =3D kcs_bmc_priv(kcs_bmc);
>>>>+	struct aspeed_kcs_bmc *priv =3D to_aspeed_kcs_bmc(kcs_bmc);
>>>>
>>>> 	switch (kcs_bmc->channel) {
>>>> 	case 1:
>>>>@@ -323,16 +330,16 @@ static int aspeed_kcs_of_v2_get_io_address(struct=
 platform_device *pdev)
>>>> static int aspeed_kcs_probe(struct platform_device *pdev)
>>>> {
>>>> 	const struct aspeed_kcs_of_ops *ops;
>>>>-	struct device *dev =3D &pdev->dev;
>>>>+	struct aspeed_kcs_bmc *priv;
>>>> 	struct kcs_bmc *kcs_bmc;
>>>> 	struct device_node *np;
>>>> 	int rc, channel, addr;
>>>>
>>>>-	np =3D dev->of_node->parent;
>>>>+	np =3D pdev->dev.of_node->parent;
>>>> 	if (!of_device_is_compatible(np, "aspeed,ast2400-lpc-v2") &&
>>>> 	    !of_device_is_compatible(np, "aspeed,ast2500-lpc-v2") &&
>>>> 	    !of_device_is_compatible(np, "aspeed,ast2600-lpc-v2")) {
>>>>-		dev_err(dev, "unsupported LPC device binding\n");
>>>>+		dev_err(&pdev->dev, "unsupported LPC device binding\n");
>>>> 		return -ENODEV;
>>>> 	}
>>>> 	ops =3D of_device_get_match_data(&pdev->dev);
>>>>@@ -343,18 +350,27 @@ static int aspeed_kcs_probe(struct platform_devic=
e *pdev)
>>>> 	if (channel < 0)
>>>> 		return channel;
>>>>
>>>>-	kcs_bmc =3D kcs_bmc_alloc(&pdev->dev, sizeof(struct aspeed_kcs_bmc), =
channel);
>>>>-	if (!kcs_bmc)
>>>>+	addr =3D ops->get_io_address(pdev);
>>>>+	if (addr < 0)
>>>>+		return addr;
>>>>+
>>>>+	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>>>>+	if (!priv)
>>>> 		return -ENOMEM;
>>>>
>>>>+	kcs_bmc =3D &priv->kcs_bmc;
>>>>+	kcs_bmc->dev =3D &pdev->dev;
>>>>+	kcs_bmc->channel =3D channel;
>>>> 	kcs_bmc->ioreg =3D ast_kcs_bmc_ioregs[channel - 1];
>>>> 	kcs_bmc->io_inputb =3D aspeed_kcs_inb;
>>>> 	kcs_bmc->io_outputb =3D aspeed_kcs_outb;
>>>> 	kcs_bmc->io_updateb =3D aspeed_kcs_updateb;
>>>>
>>>>-	addr =3D ops->get_io_address(pdev);
>>>>-	if (addr < 0)
>>>>-		return addr;
>>>>+	priv->map =3D syscon_node_to_regmap(pdev->dev.parent->of_node);
>>>>+	if (IS_ERR(priv->map)) {
>>>>+		dev_err(&pdev->dev, "Couldn't get regmap\n");
>>>>+		return -ENODEV;
>>>>+	}
>>>
>>>The reanimated priv->map initialization I suspect wasn't meant to
>>>have been removed in the first place...
>>
>>Yeah, I'll have to go back and figure out what went wrong there!
>>
>>Thanks for catching that.
>>
>>>
>>>>
>>>> 	aspeed_kcs_set_address(kcs_bmc, addr);
>>>>
>>>>@@ -362,29 +378,25 @@ static int aspeed_kcs_probe(struct platform_devic=
e *pdev)
>>>> 	if (rc)
>>>> 		return rc;
>>>>
>>>>-	dev_set_drvdata(dev, kcs_bmc);
>>>>+	platform_set_drvdata(pdev, priv);
>>>>
>>>> 	aspeed_kcs_enable_channel(kcs_bmc, true);
>>>>
>>>>-	rc =3D misc_register(&kcs_bmc->miscdev);
>>>>-	if (rc) {
>>>>-		dev_err(dev, "Unable to register device\n");
>>>>+	rc =3D kcs_bmc_add_device(&priv->kcs_bmc);
>>>>+	if (rc < 0)
>>>> 		return rc;
>>>>-	}
>>>>
>>>>-	dev_dbg(&pdev->dev,
>>>>-		"Probed KCS device %d (IDR=3D0x%x, ODR=3D0x%x, STR=3D0x%x)\n",
>>>>-		kcs_bmc->channel, kcs_bmc->ioreg.idr, kcs_bmc->ioreg.odr,
>>>>-		kcs_bmc->ioreg.str);
>>>>+	dev_info(&pdev->dev, "Initialised channel %d at 0x%x\n", kcs_bmc->cha=
nnel, addr);
>>>
>>>Is the dbg->info change here intentional?  (I have no particular
>>>objection if so, but it's often a change I make myself during
>>>testing/debugging and then forget to revert...)
>>
>>Yeah, it was possibly something I forgot to revert. If others have
>>issues with it staying at dev_info() I'll switch it back.
>>
>>>
>>>>
>>>> 	return 0;
>>>> }
>>>>
>>>> static int aspeed_kcs_remove(struct platform_device *pdev)
>>>> {
>>>>-	struct kcs_bmc *kcs_bmc =3D dev_get_drvdata(&pdev->dev);
>>>>+	struct aspeed_kcs_bmc *priv =3D platform_get_drvdata(pdev);
>>>>+	struct kcs_bmc *kcs_bmc =3D &priv->kcs_bmc;
>>>>
>>>>-	misc_deregister(&kcs_bmc->miscdev);
>>>>+	kcs_bmc_remove_device(kcs_bmc);
>>>
>>>Should we propagate the return value outward here?
>>
>>Probably!
>>
>>>
>>>>
>>>> 	return 0;
>>>> }
>>>>diff --git a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c b/drivers/char/ipmi/=
kcs_bmc_cdev_ipmi.c
>>>>index 82c77994e481..0ca71c135a1a 100644
>>>>--- a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
>>>>+++ b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
>>>>@@ -382,7 +382,7 @@ static int kcs_bmc_ipmi_release(struct inode *inode=
, struct file *filp)
>>>> 	return 0;
>>>> }
>>>>
>>>>-static const struct file_operations kcs_bmc_fops =3D {
>>>>+static const struct file_operations kcs_bmc_ipmi_fops =3D {
>>>> 	.owner          =3D THIS_MODULE,
>>>> 	.open           =3D kcs_bmc_ipmi_open,
>>>> 	.read           =3D kcs_bmc_ipmi_read,
>>>>@@ -392,36 +392,58 @@ static const struct file_operations kcs_bmc_fops =
=3D {
>>>> 	.unlocked_ioctl =3D kcs_bmc_ipmi_ioctl,
>>>> };
>>>>
>>>>-struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv=
, u32 channel);
>>>>-struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv=
, u32 channel)
>>>>+int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc *kcs_bmc);
>>>
>>>Errant declaration again?
>>
>>As previously explained.
>>
>
>This one seems like a slightly different category, because...
>
>>>
>>>>+int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc *kcs_bmc)
>
>...it's immediately followed by the definition of the very same function
>that it just declared, so I can't see how its presence or absence could
>make any functional difference to anything.  (So perhaps I should have
>said "redundant" instead of "errant...again".)
>
>It's fairly trivial of course given that it's gone by the end of the
>series, but as long as there's going to be another iteration anyway it
>seems like we might as well tidy it up?
>

Oh, and otherwise:

Reviewed-by: Zev Weiss <zweiss@equinix.com>
