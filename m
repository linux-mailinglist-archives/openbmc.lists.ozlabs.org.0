Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1861359571
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 08:27:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGp8H4jtsz30Dn
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 16:27:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=fsbs+gu9;
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
 header.s=selector2-equinixinc-onmicrosoft-com header.b=fsbs+gu9; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGp7w4k3Qz2xYq;
 Fri,  9 Apr 2021 16:27:07 +1000 (AEST)
Received: from pps.filterd (m0165121.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1396CmuZ007460; Fri, 9 Apr 2021 06:25:30 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by mx0b-00268f01.pphosted.com with ESMTP id 37te8n8eax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 06:25:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SaNJg9wyMA7mD6IaMu1/0LkRoKob98rmzq/a2u+xeIlbJMDBGqWb3Vz6z3lzkbz2wO5HnVLz17Y+M8T/X14hTyQwSSsljvd3NFM3FnKgSvv5sLi7ZqbUKxQMXFzNnrnPhge5U32SX52XQqesDiml7FOlwFVoQTTolSSmfgxB+WYxNKb/DAR5fDmQw2HVvX5yt457m5MPodDX94D/scvXBob0xje2DHRL7FpAP4YQvJrec66Pctdjnoqe4QOMnzZVZC/EuB3tc2mvT8Z77mufcAd+Kyf4pYq+ckSjiY1CX62RVS5VE/wZJj+ImR9iskvGnxIb5UT5dxGUwL0B6VEelQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rt50fPbELDGX0MGqaD59bmYi6IWn2Ar4PF5tXEScW4c=;
 b=n4JW0hcTI+KWB/jnqXdqkLs1On9Fd6QJl7ukugCbYg30jeTXG/3jbJsH6sGccSyFXGkE5lkEHvjQvWFza64kWUnTg9oV1osIll2y5ujjU3HcY9e+lUrCUtV+4iTePhT32LxOHs16IoH1qpvoc67rI4KGK7PDg0gfX1UTTs9AOjhIiOZ7CsjHvSmVV7glZ/i0NxmTuwSC2YUan8PxAIzPRZg7QWmKhgPKYuPVtyP/ySVKK60zn8HUuv8RbMEey4CPbJ5IrVvhSzhwOH6KInzAjJhhh+UG6KMrDCjfa2aI4xZ0Q+dpTqcjoeQgaZvPgl1rdkvVFyID1VLWtG87eL43kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rt50fPbELDGX0MGqaD59bmYi6IWn2Ar4PF5tXEScW4c=;
 b=fsbs+gu9wrhd9OPKkK7kS/12iMSeI0muhMvUVr+utUOh3ulndTa9HBpQaONTATDRYNhC3DB3q3OuWDFf2E4aNEwGKHgCdcS4aidN9KNaFyXpV2Z6oWuZLFfK+IOxnWeNwx+MkixnMy27A0gukP8MDVtQJai34DuWG3vHVc2coY0=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM5PR04MB0364.namprd04.prod.outlook.com (2603:10b6:3:a8::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.18; Fri, 9 Apr 2021 06:25:27 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad%5]) with mapi id 15.20.4020.017; Fri, 9 Apr 2021
 06:25:27 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 10/21] ipmi: kcs_bmc: Turn the driver data-structures
 inside-out
Thread-Topic: [PATCH v2 10/21] ipmi: kcs_bmc: Turn the driver data-structures
 inside-out
Thread-Index: AQHXLQkhK5HJQiDBlUq3BrfCbbMJrQ==
Date: Fri, 9 Apr 2021 06:25:27 +0000
Message-ID: <YG/zVv4XOo1HoLd1@packtop>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-10-andrew@aj.id.au> <YG/Ql9z9X/mtOSvl@packtop>
 <ea34ee69-a266-4737-8450-4695d2d0fbd4@www.fastmail.com>
In-Reply-To: <ea34ee69-a266-4737-8450-4695d2d0fbd4@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bcca733d-df5e-4693-1f6d-08d8fb204433
x-ms-traffictypediagnostic: DM5PR04MB0364:
x-microsoft-antispam-prvs: <DM5PR04MB036449117E42D2C5F348EE8FC3739@DM5PR04MB0364.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fptcgFRuhf9D6OcVHzsMTsk1GG8jOCSJqabBruRdlanJ2rfHz9ModcS3slXVTlFKx3tPxx2vi6r0JgTUbrhjx8RJnjwmbZxlpNFInU7UrkUGRXfZ9zpdhovIoD8tJ2y883WW44QKYpnSPiuIqZkUh5lu/5WC6TNQigWVCur2o+yWwLtFmg6JyQDPzEo+eU6Or/O4mPJXnFMcMj2/y75w0mo2YpANR0rhmb8sSWTdqRjm0dZvCYmoHDF3ViABOYQj6CYLoGA51+aDyWeEqcthkKQfa1VfICajvCyP1rYT+SEm7WDTrh2yJlRq+ncp/bfaYTtYut2pgEC/yZ+tEroBeWNctedDVxDTy/BJlBWkFa8STmbnM54OVESJ41rLDVK4sHy9yyG6svfkP1hjkE9Z9KoAS4NBRUjKK1TXJDJqtxkLtiKgU6TzogSLh4MAMgYsKNEX1EfOX3ks65wyxApRq6shv43rQ7BLenwBvr5HMGjBA22fm3+9X9hzHJKkEpF/odeHADbLBB5WwjI5SADO45jztbOEgDdF8+L278/le0R67nZg9YOLkQzC1rNowAUHMTKqwrwxaDNFYMTYk3xOHs2CUcMOTZTAD13hxwfV+jHxL9up6Zp9OPDf1Fm96c3rDagEA0HXyD9szk57YiJE6rcW6LJQRdiChjQu1qAVgpY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(83380400001)(71200400001)(186003)(6916009)(2906002)(38100700001)(6486002)(26005)(316002)(7416002)(30864003)(4326008)(66476007)(54906003)(76116006)(5660300002)(33716001)(9686003)(66446008)(8936002)(8676002)(6506007)(66556008)(86362001)(64756008)(478600001)(6512007)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?BnkMHU3RPKX9O9NcWlgymUgY4N56WRFjA1I+dwk/3m6t79oq/t/pGX+fHOWi?=
 =?us-ascii?Q?sbrmiDbLqluzZdSIkyHm3LfF/tWp9f9IfA2EYMaxQhP1xiDT6wmpI7Ad1T8V?=
 =?us-ascii?Q?UgdpyAbAT7V2V8fgZCkd3k7Jes1ru9qfoB19dZRLWo0DcoQUoOOEILLQQhkP?=
 =?us-ascii?Q?sa9nJokLKhoUA+bJ88sGtCZMwkfyZ2j24AnGm9CLKOsijZ2P09L5BlNgFH1n?=
 =?us-ascii?Q?zywEAp33aTZUNUuRARtIUKedlrb3cXfyXRG37LsV6MJmY7iR7yn9RQDwB9Gm?=
 =?us-ascii?Q?cM1uqyER/+gDFUZZnd2C0z56+hUym10LmqqQXrmbZNPx9qIF5pDwyaVDmoiy?=
 =?us-ascii?Q?DNrVuNGqCQEB3bDRkPBlF4BPFMMYdOr6cBUcSabxvKJgvqUPimCb512HOAhb?=
 =?us-ascii?Q?oSxdna9eE+s6zTZPhBBJ8q+w1ZPUtFnA+uFR0/DW8Gl9I3ibpa10QXikS2of?=
 =?us-ascii?Q?fl9M3bh2AoY8u35zbIbshirDY9Qgl0QwKIQzVoV4Ju+1XzEbe4AxVg1onhhw?=
 =?us-ascii?Q?IG8f86w9Drd6+chO0MMl+IRAdQZqD9DMgO3vi9+K99xGnvYEk8fyiZ67R36Z?=
 =?us-ascii?Q?bLNhlJGA3QqDfYdnXY6wEUquR41c9znewLnjeCyFCaokmCRD4jHM1G7/K/Gf?=
 =?us-ascii?Q?m81s8rTa3qcZXXowtSMIuvvpExRJd+8bDoeoyDt/6dh65qAW9JdlZ0RWj58w?=
 =?us-ascii?Q?IUsokj8pcbgk8bysBtAPNtzs8AL89YginiYf4VWiTrm79uD4bcpTw7xLGKiW?=
 =?us-ascii?Q?jxLwNotoAJsiiai21LmTIPQ6Hj7RX+uDfoiF6dWYvIY+v8+cx4B3Cv49FkNg?=
 =?us-ascii?Q?6ueBKr6pqXa3nZVr5+WsFYkCVViXVXKZU9rSxBjOwjDQzLKNRYTXEqXnXRIc?=
 =?us-ascii?Q?SmV+fk+0x7247au2S9XI0QTDTajdjgixPM4oM6p4KhH4jPcS++jO+N+lakcy?=
 =?us-ascii?Q?5feJXu9D5ht7D40VJ6vy9EKGzpUl9/d9qLj3XWdHHAQFGsKdm/IwGxuN/hz2?=
 =?us-ascii?Q?m2yaofD7+HDpIDGtqIXPuTz9w1DoYEZSclaLtTcBUm2TKNAYMFumHKbxBmlE?=
 =?us-ascii?Q?kIW+UJGXsyHTRVLl9jp27vnDARn5n5UQdPobWWCazTxXVJEFvzkhjmEobnnv?=
 =?us-ascii?Q?St20u4YKdZix98XH33z0l+C8+hyxbBnAV0qzfsWroIM7SVaZ2RhcwwE7VgyD?=
 =?us-ascii?Q?c15E+KTQMXBIGAHqigKyQU1AS5+yd4Wn0WDEzHOxgYTro0Ybh/WG0S1t8Xrf?=
 =?us-ascii?Q?LBRgHPh2UZjk6s4YEgjQ4Q3Y5rzN0nCQavejZu4XC2bHm2wUClocam50+8M6?=
 =?us-ascii?Q?buG5hRbLrbDwPCgX7v1lOmxNb4s322EqNms3wtPWu78I7A=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E2F1C9DC06A6DB4682D708DC0FDB84D4@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcca733d-df5e-4693-1f6d-08d8fb204433
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 06:25:27.3322 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UZ1NTm5qjeXOjm0+mLHtWYBZC1uaQof854C75JzpdN+cjRg/xTX4pmn4Gp2yqc4FUxwKCmj0vJGreDR0BrT9eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0364
X-Proofpoint-GUID: OimRGbBNjPABCF6G6wvLOW2s6yrHzzOy
X-Proofpoint-ORIG-GUID: OimRGbBNjPABCF6G6wvLOW2s6yrHzzOy
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_03:2021-04-08,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090047
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

On Fri, Apr 09, 2021 at 12:59:09AM CDT, Andrew Jeffery wrote:
>
>
>On Fri, 9 Apr 2021, at 13:27, Zev Weiss wrote:
>> On Fri, Mar 19, 2021 at 01:27:41AM CDT, Andrew Jeffery wrote:
>> >Make the KCS device drivers responsible for allocating their own memory=
.
>> >
>> >Until now the private data for the device driver was allocated internal
>> >to the private data for the chardev interface. This coupling required
>> >the slightly awkward API of passing through the struct size for the
>> >driver private data to the chardev constructor, and then retrieving a
>> >pointer to the driver private data from the allocated chardev memory.
>> >
>> >In addition to being awkward, the arrangement prevents the
>> >implementation of alternative userspace interfaces as the device driver
>> >private data is not independent.
>> >
>> >Peel a layer off the onion and turn the data-structures inside out by
>> >exploiting container_of() and embedding `struct kcs_device` in the
>> >driver private data.
>> >
>> >Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> >---
>> > drivers/char/ipmi/kcs_bmc.c           | 15 +++++--
>> > drivers/char/ipmi/kcs_bmc.h           | 12 ++----
>> > drivers/char/ipmi/kcs_bmc_aspeed.c    | 60 ++++++++++++++++-----------
>> > drivers/char/ipmi/kcs_bmc_cdev_ipmi.c | 60 ++++++++++++++++++---------
>> > drivers/char/ipmi/kcs_bmc_npcm7xx.c   | 37 ++++++++++-------
>> > 5 files changed, 113 insertions(+), 71 deletions(-)
>> >
>> >diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
>> >index ef5c48ffe74a..709b6bdec165 100644
>> >--- a/drivers/char/ipmi/kcs_bmc.c
>> >+++ b/drivers/char/ipmi/kcs_bmc.c
>> >@@ -44,12 +44,19 @@ int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc)
>> > }
>> > EXPORT_SYMBOL(kcs_bmc_handle_event);
>> >
>> >-struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv=
, u32 channel);
>> >-struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv, u32=
 channel)
>> >+int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc *kcs_bmc);
>>
>> Another declaration perhaps intended for kcs_bmc.h?
>
>These are temporary while the code gets shuffled around. The symbol
>name is an implementation detail, not a "public" part of the API; after
>some further shuffling these are eventually assigned as callbacks in an
>ops struct.
>

Okay, that makes sense.

>>
>> >+int kcs_bmc_add_device(struct kcs_bmc *kcs_bmc)
>> > {
>> >-	return kcs_bmc_ipmi_alloc(dev, sizeof_priv, channel);
>> >+	return kcs_bmc_ipmi_attach_cdev(kcs_bmc);
>> > }
>> >-EXPORT_SYMBOL(kcs_bmc_alloc);
>> >+EXPORT_SYMBOL(kcs_bmc_add_device);
>> >+
>> >+int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc *kcs_bmc);
>>
>> Here too.
>>
>> >+int kcs_bmc_remove_device(struct kcs_bmc *kcs_bmc)
>> >+{
>> >+	return kcs_bmc_ipmi_detach_cdev(kcs_bmc);
>> >+}
>> >+EXPORT_SYMBOL(kcs_bmc_remove_device);
>> >
>> > MODULE_LICENSE("GPL v2");
>> > MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
>> >diff --git a/drivers/char/ipmi/kcs_bmc.h b/drivers/char/ipmi/kcs_bmc.h
>> >index febea0c8deb4..bf0ae327997f 100644
>> >--- a/drivers/char/ipmi/kcs_bmc.h
>> >+++ b/drivers/char/ipmi/kcs_bmc.h
>> >@@ -67,6 +67,8 @@ struct kcs_ioreg {
>> > };
>> >
>> > struct kcs_bmc {
>> >+	struct device *dev;
>> >+
>> > 	spinlock_t lock;
>> >
>> > 	u32 channel;
>> >@@ -94,17 +96,11 @@ struct kcs_bmc {
>> > 	u8 *kbuffer;
>> >
>> > 	struct miscdevice miscdev;
>> >-
>> >-	unsigned long priv[];
>> > };
>> >
>> >-static inline void *kcs_bmc_priv(struct kcs_bmc *kcs_bmc)
>> >-{
>> >-	return kcs_bmc->priv;
>> >-}
>> >-
>> > int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc);
>> >-struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv, u32=
 channel);
>> >+int kcs_bmc_add_device(struct kcs_bmc *kcs_bmc);
>> >+int kcs_bmc_remove_device(struct kcs_bmc *kcs_bmc);
>> >
>> > u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc);
>> > void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data);
>> >diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs=
_bmc_aspeed.c
>> >index 630cf095560e..0416ac78ce68 100644
>> >--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
>> >+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
>> >@@ -61,6 +61,8 @@
>> > #define LPC_STR4             0x11C
>> >
>> > struct aspeed_kcs_bmc {
>> >+	struct kcs_bmc kcs_bmc;
>> >+
>> > 	struct regmap *map;
>> > };
>> >
>> >@@ -69,9 +71,14 @@ struct aspeed_kcs_of_ops {
>> > 	int (*get_io_address)(struct platform_device *pdev);
>> > };
>> >
>> >+static inline struct aspeed_kcs_bmc *to_aspeed_kcs_bmc(struct kcs_bmc =
*kcs_bmc)
>> >+{
>> >+	return container_of(kcs_bmc, struct aspeed_kcs_bmc, kcs_bmc);
>> >+}
>> >+
>> > static u8 aspeed_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
>> > {
>> >-	struct aspeed_kcs_bmc *priv =3D kcs_bmc_priv(kcs_bmc);
>> >+	struct aspeed_kcs_bmc *priv =3D to_aspeed_kcs_bmc(kcs_bmc);
>> > 	u32 val =3D 0;
>> > 	int rc;
>> >
>> >@@ -83,7 +90,7 @@ static u8 aspeed_kcs_inb(struct kcs_bmc *kcs_bmc, u32=
 reg)
>> >
>> > static void aspeed_kcs_outb(struct kcs_bmc *kcs_bmc, u32 reg, u8 data)
>> > {
>> >-	struct aspeed_kcs_bmc *priv =3D kcs_bmc_priv(kcs_bmc);
>> >+	struct aspeed_kcs_bmc *priv =3D to_aspeed_kcs_bmc(kcs_bmc);
>> > 	int rc;
>> >
>> > 	rc =3D regmap_write(priv->map, reg, data);
>> >@@ -92,7 +99,7 @@ static void aspeed_kcs_outb(struct kcs_bmc *kcs_bmc, =
u32 reg, u8 data)
>> >
>> > static void aspeed_kcs_updateb(struct kcs_bmc *kcs_bmc, u32 reg, u8 ma=
sk, u8 val)
>> > {
>> >-	struct aspeed_kcs_bmc *priv =3D kcs_bmc_priv(kcs_bmc);
>> >+	struct aspeed_kcs_bmc *priv =3D to_aspeed_kcs_bmc(kcs_bmc);
>> > 	int rc;
>> >
>> > 	rc =3D regmap_update_bits(priv->map, reg, mask, val);
>> >@@ -114,7 +121,7 @@ static void aspeed_kcs_updateb(struct kcs_bmc *kcs_=
bmc, u32 reg, u8 mask, u8 val
>> >  */
>> > static void aspeed_kcs_set_address(struct kcs_bmc *kcs_bmc, u16 addr)
>> > {
>> >-	struct aspeed_kcs_bmc *priv =3D kcs_bmc_priv(kcs_bmc);
>> >+	struct aspeed_kcs_bmc *priv =3D to_aspeed_kcs_bmc(kcs_bmc);
>> >
>> > 	switch (kcs_bmc->channel) {
>> > 	case 1:
>> >@@ -148,7 +155,7 @@ static void aspeed_kcs_set_address(struct kcs_bmc *=
kcs_bmc, u16 addr)
>> >
>> > static void aspeed_kcs_enable_channel(struct kcs_bmc *kcs_bmc, bool en=
able)
>> > {
>> >-	struct aspeed_kcs_bmc *priv =3D kcs_bmc_priv(kcs_bmc);
>> >+	struct aspeed_kcs_bmc *priv =3D to_aspeed_kcs_bmc(kcs_bmc);
>> >
>> > 	switch (kcs_bmc->channel) {
>> > 	case 1:
>> >@@ -323,16 +330,16 @@ static int aspeed_kcs_of_v2_get_io_address(struct=
 platform_device *pdev)
>> > static int aspeed_kcs_probe(struct platform_device *pdev)
>> > {
>> > 	const struct aspeed_kcs_of_ops *ops;
>> >-	struct device *dev =3D &pdev->dev;
>> >+	struct aspeed_kcs_bmc *priv;
>> > 	struct kcs_bmc *kcs_bmc;
>> > 	struct device_node *np;
>> > 	int rc, channel, addr;
>> >
>> >-	np =3D dev->of_node->parent;
>> >+	np =3D pdev->dev.of_node->parent;
>> > 	if (!of_device_is_compatible(np, "aspeed,ast2400-lpc-v2") &&
>> > 	    !of_device_is_compatible(np, "aspeed,ast2500-lpc-v2") &&
>> > 	    !of_device_is_compatible(np, "aspeed,ast2600-lpc-v2")) {
>> >-		dev_err(dev, "unsupported LPC device binding\n");
>> >+		dev_err(&pdev->dev, "unsupported LPC device binding\n");
>> > 		return -ENODEV;
>> > 	}
>> > 	ops =3D of_device_get_match_data(&pdev->dev);
>> >@@ -343,18 +350,27 @@ static int aspeed_kcs_probe(struct platform_devic=
e *pdev)
>> > 	if (channel < 0)
>> > 		return channel;
>> >
>> >-	kcs_bmc =3D kcs_bmc_alloc(&pdev->dev, sizeof(struct aspeed_kcs_bmc), =
channel);
>> >-	if (!kcs_bmc)
>> >+	addr =3D ops->get_io_address(pdev);
>> >+	if (addr < 0)
>> >+		return addr;
>> >+
>> >+	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>> >+	if (!priv)
>> > 		return -ENOMEM;
>> >
>> >+	kcs_bmc =3D &priv->kcs_bmc;
>> >+	kcs_bmc->dev =3D &pdev->dev;
>> >+	kcs_bmc->channel =3D channel;
>> > 	kcs_bmc->ioreg =3D ast_kcs_bmc_ioregs[channel - 1];
>> > 	kcs_bmc->io_inputb =3D aspeed_kcs_inb;
>> > 	kcs_bmc->io_outputb =3D aspeed_kcs_outb;
>> > 	kcs_bmc->io_updateb =3D aspeed_kcs_updateb;
>> >
>> >-	addr =3D ops->get_io_address(pdev);
>> >-	if (addr < 0)
>> >-		return addr;
>> >+	priv->map =3D syscon_node_to_regmap(pdev->dev.parent->of_node);
>> >+	if (IS_ERR(priv->map)) {
>> >+		dev_err(&pdev->dev, "Couldn't get regmap\n");
>> >+		return -ENODEV;
>> >+	}
>>
>> The reanimated priv->map initialization I suspect wasn't meant to
>> have been removed in the first place...
>
>Yeah, I'll have to go back and figure out what went wrong there!
>
>Thanks for catching that.
>
>>
>> >
>> > 	aspeed_kcs_set_address(kcs_bmc, addr);
>> >
>> >@@ -362,29 +378,25 @@ static int aspeed_kcs_probe(struct platform_devic=
e *pdev)
>> > 	if (rc)
>> > 		return rc;
>> >
>> >-	dev_set_drvdata(dev, kcs_bmc);
>> >+	platform_set_drvdata(pdev, priv);
>> >
>> > 	aspeed_kcs_enable_channel(kcs_bmc, true);
>> >
>> >-	rc =3D misc_register(&kcs_bmc->miscdev);
>> >-	if (rc) {
>> >-		dev_err(dev, "Unable to register device\n");
>> >+	rc =3D kcs_bmc_add_device(&priv->kcs_bmc);
>> >+	if (rc < 0)
>> > 		return rc;
>> >-	}
>> >
>> >-	dev_dbg(&pdev->dev,
>> >-		"Probed KCS device %d (IDR=3D0x%x, ODR=3D0x%x, STR=3D0x%x)\n",
>> >-		kcs_bmc->channel, kcs_bmc->ioreg.idr, kcs_bmc->ioreg.odr,
>> >-		kcs_bmc->ioreg.str);
>> >+	dev_info(&pdev->dev, "Initialised channel %d at 0x%x\n", kcs_bmc->cha=
nnel, addr);
>>
>> Is the dbg->info change here intentional?  (I have no particular
>> objection if so, but it's often a change I make myself during
>> testing/debugging and then forget to revert...)
>
>Yeah, it was possibly something I forgot to revert. If others have
>issues with it staying at dev_info() I'll switch it back.
>
>>
>> >
>> > 	return 0;
>> > }
>> >
>> > static int aspeed_kcs_remove(struct platform_device *pdev)
>> > {
>> >-	struct kcs_bmc *kcs_bmc =3D dev_get_drvdata(&pdev->dev);
>> >+	struct aspeed_kcs_bmc *priv =3D platform_get_drvdata(pdev);
>> >+	struct kcs_bmc *kcs_bmc =3D &priv->kcs_bmc;
>> >
>> >-	misc_deregister(&kcs_bmc->miscdev);
>> >+	kcs_bmc_remove_device(kcs_bmc);
>>
>> Should we propagate the return value outward here?
>
>Probably!
>
>>
>> >
>> > 	return 0;
>> > }
>> >diff --git a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c b/drivers/char/ipmi/=
kcs_bmc_cdev_ipmi.c
>> >index 82c77994e481..0ca71c135a1a 100644
>> >--- a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
>> >+++ b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
>> >@@ -382,7 +382,7 @@ static int kcs_bmc_ipmi_release(struct inode *inode=
, struct file *filp)
>> > 	return 0;
>> > }
>> >
>> >-static const struct file_operations kcs_bmc_fops =3D {
>> >+static const struct file_operations kcs_bmc_ipmi_fops =3D {
>> > 	.owner          =3D THIS_MODULE,
>> > 	.open           =3D kcs_bmc_ipmi_open,
>> > 	.read           =3D kcs_bmc_ipmi_read,
>> >@@ -392,36 +392,58 @@ static const struct file_operations kcs_bmc_fops =
=3D {
>> > 	.unlocked_ioctl =3D kcs_bmc_ipmi_ioctl,
>> > };
>> >
>> >-struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv=
, u32 channel);
>> >-struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv=
, u32 channel)
>> >+int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc *kcs_bmc);
>>
>> Errant declaration again?
>
>As previously explained.
>

This one seems like a slightly different category, because...

>>
>> >+int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc *kcs_bmc)

...it's immediately followed by the definition of the very same function
that it just declared, so I can't see how its presence or absence could
make any functional difference to anything.  (So perhaps I should have
said "redundant" instead of "errant...again".)

It's fairly trivial of course given that it's gone by the end of the
series, but as long as there's going to be another iteration anyway it
seems like we might as well tidy it up?

>> > {
>> >-	struct kcs_bmc *kcs_bmc;
>> >-
>> >-	kcs_bmc =3D devm_kzalloc(dev, sizeof(*kcs_bmc) + sizeof_priv, GFP_KER=
NEL);
>> >-	if (!kcs_bmc)
>> >-		return NULL;
>> >+	int rc;
>> >
>> > 	spin_lock_init(&kcs_bmc->lock);
>> >-	kcs_bmc->channel =3D channel;
>> >-
>> > 	mutex_init(&kcs_bmc->mutex);
>> > 	init_waitqueue_head(&kcs_bmc->queue);
>> >
>> >-	kcs_bmc->data_in =3D devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
>> >-	kcs_bmc->data_out =3D devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
>> >-	kcs_bmc->kbuffer =3D devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
>> >+	kcs_bmc->data_in =3D devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_K=
ERNEL);
>> >+	kcs_bmc->data_out =3D devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_=
KERNEL);
>> >+	kcs_bmc->kbuffer =3D devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_K=
ERNEL);
>> >
>> > 	kcs_bmc->miscdev.minor =3D MISC_DYNAMIC_MINOR;
>> >-	kcs_bmc->miscdev.name =3D devm_kasprintf(dev, GFP_KERNEL, "%s%u",
>> >-					       DEVICE_NAME, channel);
>> >+	kcs_bmc->miscdev.name =3D devm_kasprintf(kcs_bmc->dev, GFP_KERNEL, "%=
s%u",
>> >+					       DEVICE_NAME, kcs_bmc->channel);
>> > 	if (!kcs_bmc->data_in || !kcs_bmc->data_out || !kcs_bmc->kbuffer ||
>> > 	    !kcs_bmc->miscdev.name)
>> >-		return NULL;
>> >-	kcs_bmc->miscdev.fops =3D &kcs_bmc_fops;
>> >+		return -ENOMEM;
>> >
>> >-	return kcs_bmc;
>> >+	kcs_bmc->miscdev.fops =3D &kcs_bmc_ipmi_fops;
>> >+
>> >+	rc =3D misc_register(&kcs_bmc->miscdev);
>> >+	if (rc) {
>> >+		dev_err(kcs_bmc->dev, "Unable to register device: %d\n", rc);
>> >+		return rc;
>> >+	}
>> >+
>> >+	dev_info(kcs_bmc->dev, "Initialised IPMI client for channel %d", kcs_=
bmc->channel);
>> >+
>> >+	return 0;
>> >+}
>> >+EXPORT_SYMBOL(kcs_bmc_ipmi_attach_cdev);
>> >+
>> >+int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc *kcs_bmc);
>>
>> Same here.
>
>Same explanation.
>

Also a "category 2" I think.

>>
>> >+int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc *kcs_bmc)
>> >+{
>> >+	misc_deregister(&kcs_bmc->miscdev);
>> >+
>> >+	spin_lock_irq(&kcs_bmc->lock);
>> >+	kcs_bmc->running =3D 0;
>> >+	kcs_bmc_ipmi_force_abort(kcs_bmc);
>> >+	spin_unlock_irq(&kcs_bmc->lock);
>> >+
>> >+	devm_kfree(kcs_bmc->dev, kcs_bmc->kbuffer);
>> >+	devm_kfree(kcs_bmc->dev, kcs_bmc->data_out);
>> >+	devm_kfree(kcs_bmc->dev, kcs_bmc->data_in);
>> >+	devm_kfree(kcs_bmc->dev, kcs_bmc);
>> >+
>> >+	return 0;
>> > }
>> >-EXPORT_SYMBOL(kcs_bmc_ipmi_alloc);
>> >+EXPORT_SYMBOL(kcs_bmc_ipmi_detach_cdev);
>> >
>> > MODULE_LICENSE("GPL v2");
>> > MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
>> >diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c b/drivers/char/ipmi/kc=
s_bmc_npcm7xx.c
>> >index 1f44aadec9e8..5d017498dc69 100644
>> >--- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>> >+++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>> >@@ -65,6 +65,8 @@ struct npcm7xx_kcs_reg {
>> > };
>> >
>> > struct npcm7xx_kcs_bmc {
>> >+	struct kcs_bmc kcs_bmc;
>> >+
>> > 	struct regmap *map;
>> >
>> > 	const struct npcm7xx_kcs_reg *reg;
>> >@@ -76,9 +78,14 @@ static const struct npcm7xx_kcs_reg npcm7xx_kcs_reg_=
tbl[KCS_CHANNEL_MAX] =3D {
>> > 	{ .sts =3D KCS3ST, .dob =3D KCS3DO, .dib =3D KCS3DI, .ctl =3D KCS3CTL=
, .ie =3D KCS3IE },
>> > };
>> >
>> >+static inline struct npcm7xx_kcs_bmc *to_npcm7xx_kcs_bmc(struct kcs_bm=
c *kcs_bmc)
>> >+{
>> >+	return container_of(kcs_bmc, struct npcm7xx_kcs_bmc, kcs_bmc);
>> >+}
>> >+
>> > static u8 npcm7xx_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
>> > {
>> >-	struct npcm7xx_kcs_bmc *priv =3D kcs_bmc_priv(kcs_bmc);
>> >+	struct npcm7xx_kcs_bmc *priv =3D to_npcm7xx_kcs_bmc(kcs_bmc);
>> > 	u32 val =3D 0;
>> > 	int rc;
>> >
>> >@@ -90,7 +97,7 @@ static u8 npcm7xx_kcs_inb(struct kcs_bmc *kcs_bmc, u3=
2 reg)
>> >
>> > static void npcm7xx_kcs_outb(struct kcs_bmc *kcs_bmc, u32 reg, u8 data=
)
>> > {
>> >-	struct npcm7xx_kcs_bmc *priv =3D kcs_bmc_priv(kcs_bmc);
>> >+	struct npcm7xx_kcs_bmc *priv =3D to_npcm7xx_kcs_bmc(kcs_bmc);
>> > 	int rc;
>> >
>> > 	rc =3D regmap_write(priv->map, reg, data);
>> >@@ -99,7 +106,7 @@ static void npcm7xx_kcs_outb(struct kcs_bmc *kcs_bmc=
, u32 reg, u8 data)
>> >
>> > static void npcm7xx_kcs_updateb(struct kcs_bmc *kcs_bmc, u32 reg, u8 m=
ask, u8 data)
>> > {
>> >-	struct npcm7xx_kcs_bmc *priv =3D kcs_bmc_priv(kcs_bmc);
>> >+	struct npcm7xx_kcs_bmc *priv =3D to_npcm7xx_kcs_bmc(kcs_bmc);
>> > 	int rc;
>> >
>> > 	rc =3D regmap_update_bits(priv->map, reg, mask, data);
>> >@@ -108,7 +115,7 @@ static void npcm7xx_kcs_updateb(struct kcs_bmc *kcs=
_bmc, u32 reg, u8 mask, u8 da
>> >
>> > static void npcm7xx_kcs_enable_channel(struct kcs_bmc *kcs_bmc, bool e=
nable)
>> > {
>> >-	struct npcm7xx_kcs_bmc *priv =3D kcs_bmc_priv(kcs_bmc);
>> >+	struct npcm7xx_kcs_bmc *priv =3D to_npcm7xx_kcs_bmc(kcs_bmc);
>> >
>> > 	regmap_update_bits(priv->map, priv->reg->ctl, KCS_CTL_IBFIE,
>> > 			   enable ? KCS_CTL_IBFIE : 0);
>> >@@ -155,11 +162,10 @@ static int npcm7xx_kcs_probe(struct platform_devi=
ce *pdev)
>> > 		return -ENODEV;
>> > 	}
>> >
>> >-	kcs_bmc =3D kcs_bmc_alloc(dev, sizeof(*priv), chan);
>> >-	if (!kcs_bmc)
>> >+	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>> >+	if (!priv)
>> > 		return -ENOMEM;
>> >
>> >-	priv =3D kcs_bmc_priv(kcs_bmc);
>> > 	priv->map =3D syscon_node_to_regmap(dev->parent->of_node);
>> > 	if (IS_ERR(priv->map)) {
>> > 		dev_err(dev, "Couldn't get regmap\n");
>> >@@ -167,6 +173,9 @@ static int npcm7xx_kcs_probe(struct platform_device=
 *pdev)
>> > 	}
>> > 	priv->reg =3D &npcm7xx_kcs_reg_tbl[chan - 1];
>> >
>> >+	kcs_bmc =3D &priv->kcs_bmc;
>> >+	kcs_bmc->dev =3D &pdev->dev;
>> >+	kcs_bmc->channel =3D chan;
>> > 	kcs_bmc->ioreg.idr =3D priv->reg->dib;
>> > 	kcs_bmc->ioreg.odr =3D priv->reg->dob;
>> > 	kcs_bmc->ioreg.str =3D priv->reg->sts;
>> >@@ -174,31 +183,27 @@ static int npcm7xx_kcs_probe(struct platform_devi=
ce *pdev)
>> > 	kcs_bmc->io_outputb =3D npcm7xx_kcs_outb;
>> > 	kcs_bmc->io_updateb =3D npcm7xx_kcs_updateb;
>> >
>> >-	dev_set_drvdata(dev, kcs_bmc);
>> >+	platform_set_drvdata(pdev, priv);
>> >
>> > 	npcm7xx_kcs_enable_channel(kcs_bmc, true);
>> > 	rc =3D npcm7xx_kcs_config_irq(kcs_bmc, pdev);
>> > 	if (rc)
>> > 		return rc;
>> >
>> >-	rc =3D misc_register(&kcs_bmc->miscdev);
>> >-	if (rc) {
>> >-		dev_err(dev, "Unable to register device\n");
>> >-		return rc;
>> >-	}
>> >
>> > 	pr_info("channel=3D%u idr=3D0x%x odr=3D0x%x str=3D0x%x\n",
>> > 		chan,
>> > 		kcs_bmc->ioreg.idr, kcs_bmc->ioreg.odr, kcs_bmc->ioreg.str);
>> >
>> >-	return 0;
>> >+	return kcs_bmc_add_device(kcs_bmc);
>> > }
>> >
>> > static int npcm7xx_kcs_remove(struct platform_device *pdev)
>> > {
>> >-	struct kcs_bmc *kcs_bmc =3D dev_get_drvdata(&pdev->dev);
>> >+	struct npcm7xx_kcs_bmc *priv =3D platform_get_drvdata(pdev);
>> >+	struct kcs_bmc *kcs_bmc =3D &priv->kcs_bmc;
>> >
>> >-	misc_deregister(&kcs_bmc->miscdev);
>> >+	kcs_bmc_remove_device(kcs_bmc);
>>
>> As with the corresponding aspeed code, should we propagate the return
>> value here?
>
>I'll address this.
>
>Thanks for the review!
>
>Andrew=
