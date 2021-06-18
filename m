Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFFF3AD5CE
	for <lists+openbmc@lfdr.de>; Sat, 19 Jun 2021 01:24:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G6FQ15xwbz3c0T
	for <lists+openbmc@lfdr.de>; Sat, 19 Jun 2021 09:24:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=PfkWLOnr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=7803e3c1e9=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=PfkWLOnr; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G6FPh2wp2z2yWs;
 Sat, 19 Jun 2021 09:24:39 +1000 (AEST)
Received: from pps.filterd (m0165119.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15IN87gI016989; Fri, 18 Jun 2021 23:24:20 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by mx0a-00268f01.pphosted.com with ESMTP id 398r42af68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 23:24:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ksLUWlJYSLxcFpouzBzsWsaW2IKWGd9Y5uE5AjYxZ1ogao6OA+L3Bf1Ioh97+Yyb8x7jG1lnwax04h4aggSicyQJY9GwH+RpcCTtiLMF+fR48U81Dgnuh0axwMAusma/1/XY9ut+x0XqWLIwvKLoqi8Ox4kUzt0E+yNn9NhYAsL+S0zhtA/56XHXEz0j2Adgu8+QsVzdzfpJ40YFA36lCd2r+sPAe1cr+WBJ3fi32tqwGUNfqnIIcGs5EGvhnCcqFGWUjspcF5kJJZhdAF2oFPKMs/SKHToFW7cOuN752LoB6I5w48KdGfnTX9jZaEoY5xue0JPEzQ5u4Uba78DWWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VV+PmouUqzp09Sv/QB6lC59PjSHXTWRZ1YIq04kutJM=;
 b=Xb/kQZTGm8aKb+LDR9P9z9dSURSO715GbfweEdAiCcHSb/ihI9quYoV2MgWmTV0uvhZN1Nh2xQG3IWQ0vl1EekBGyspqC7SVN0vBs6Acy2VGBbKM6LOPbbcZ+vuBP60LajLspJUm6ZEQZ75gV2xSj/mQiuH7g9AmXNt4X9jOT3XLJtH+fPtaOK4mLY9mQ/l2GEzhzygtFVFP1qtW40P6mJtMn6GYQKnX70qRexhOjqxoXgnpcpVn7quAQ5Yftxuag41/4A35IAssmizIiOjh9OEkL3980ov5sJU/3qIsn8POt72v8spUxkq4t909UVMi7oj5kquT5Py9MK30H97Wfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VV+PmouUqzp09Sv/QB6lC59PjSHXTWRZ1YIq04kutJM=;
 b=PfkWLOnrqdJn7dbJjLJwA53jz9WVbdkf6T9BUTsQJMQB9dTlTkYEpPAHRuhBmCiB07UzuPtRJuU7kTr2RD40jt5s9cpfbYWGE58Ly6dXGggje4m0L9FFWb9Np3CKUN3POK4UhdDdQqHiPwZgUv/KW6xeSjK4NRd8YwyX4uPkZl4=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM5PR04MB1212.namprd04.prod.outlook.com (2603:10b6:3:a2::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.24; Fri, 18 Jun 2021 23:24:18 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::d9ba:6e7f:b51e:6cab]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::d9ba:6e7f:b51e:6cab%2]) with mapi id 15.20.4219.027; Fri, 18 Jun 2021
 23:24:18 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v4 06/16] ipmi: kcs_bmc: Split headers into device and
 client
Thread-Topic: [PATCH v4 06/16] ipmi: kcs_bmc: Split headers into device and
 client
Thread-Index: AQHXZJkPf4dJkq3NYkm0gW8CBK/BRA==
Date: Fri, 18 Jun 2021 23:24:17 +0000
Message-ID: <20210618232417.GB9658@hatter>
References: <20210608104757.582199-1-andrew@aj.id.au>
 <20210608104757.582199-7-andrew@aj.id.au>
In-Reply-To: <20210608104757.582199-7-andrew@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d74ba7f-035f-4754-c821-08d932b031c4
x-ms-traffictypediagnostic: DM5PR04MB1212:
x-microsoft-antispam-prvs: <DM5PR04MB1212731E730762661D44A056C30D9@DM5PR04MB1212.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:639;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fupX+pqWi+oo1vwQ5DLo5CBSSDCDSfZ2+6vaBysEHqXRKByu12QItVol1GptrPpr0J+xTZphhr4WXt9BhKmFlaovs4j7DAzsMNivqs1Wbpo/Y33O3eWl9gLzmNCtQRqkIXaT0clnLO7nrjmfhDbH+9k86jLOQToXbqNoYqOZdubfSTdYyb0BYKEitsDft81VTYqIvPN175olFN3eGzLTJtXg8jEPitlHk+mXJ37raSIqEuUH5DaS4yPoI79Z/OQzbknKTJMODq6F3oQxYROBfFcWQSB6swmtJ4Gid/2+pU88iaVmy3zHjVBH56zchpmfqFlXyIupgHj3PxUMhqqrqs3C2qdArCt3StgRDslhoiYev+5mQOM0Pdhr/1YsiZiJxAAlt7Nnhhf+CWx+9mZvtrdlmX47D+qMsLeu4XhNZXQNRi0mPR6nvLemRobOeOC4lR2/jaP3aTgkd4slILlaZnG0W3k8AuGa42SzcIrAoLYtnMVMHqpMbVpuThnqOThPpYtoOOjPtpmBneqyFKnqYXeGZbWsgHv/IUzD797qbO0T3QpO+E+yH02TLrolhcj4cnNkn4QpIWMY7+NFFebtml0nJW0u8WMPmCc92k5SGCo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(136003)(366004)(396003)(346002)(39860400002)(376002)(4744005)(91956017)(86362001)(6506007)(83380400001)(186003)(76116006)(2906002)(316002)(33656002)(478600001)(4326008)(5660300002)(33716001)(54906003)(122000001)(38100700002)(8676002)(26005)(7416002)(6916009)(1076003)(6512007)(66946007)(66556008)(8936002)(66446008)(64756008)(71200400001)(66476007)(6486002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1jlczRx3Nr6X/cDZszekOD4elulbwWfABv8XKNW1/gFcYOqCiVh8bdPlljzp?=
 =?us-ascii?Q?f7bQAE4OLZI0gwjGkbhN+HULa/L59SGmrD/l2ifxZ1vhOtxmtFfkMG70SZ4K?=
 =?us-ascii?Q?EDFP+htuikJfFbf0i4D3DZGTCBYVxOUWHZqlPgtQVGimPbogU7sfx8rmf8Ue?=
 =?us-ascii?Q?MtsM2GS3sax+VWQf6b28OH6nWo0v7nt1TfNC47BbCht4BFoF1TEwqWuWdiK5?=
 =?us-ascii?Q?+sYvXQrPETKcQej4cidWLwcHzUcUsHgO6oH3cOlLQlUJmMuHkzVmxIlQbQ7c?=
 =?us-ascii?Q?MjDB9zGPkt5W5ID+AJ+YWm5BTPQ7cteW/dudhD2d8Qi+edlcOOjclO94nM4y?=
 =?us-ascii?Q?9X7EbZYubbv+ahXvJKFVEtP502mQb3xg1VHdhZWg71UgHf6Rh5l8gFrHkQq4?=
 =?us-ascii?Q?PFXOnpuJxQD9QObNEGMCQsvPcCbKima3xWZoG+raD24Dm4n2rGooFqCfa3Fw?=
 =?us-ascii?Q?gSkT5tMbiWiOB0VNfQi8yeKXOYkSGZoeQhX8KFQL2CFL6/ydh7lVIAg1+AQU?=
 =?us-ascii?Q?IEPcWeANlyjJqwz8676bnyP9iXDu6pUeFhczLUc4WOtFv6JArVKxAm2fxh6V?=
 =?us-ascii?Q?/CDGfXrx3wJjTe/3OTpJpcG+QslrylZDyOAG0jACNpNVfK6IyNXoxqZL4P7Y?=
 =?us-ascii?Q?m9Oc87HiJufZJSfiFmswTd0Wtwts9/u0C1fDRfJBXeN+/FxVkRc/VTfBaZ59?=
 =?us-ascii?Q?njOtygzGqAPSTexbi4Sif4UXb76uxsaAeUx/3UWxEPDDXQqbYF3BvrPQ0sH1?=
 =?us-ascii?Q?DSMK/izHgCWw7CpcDhRxdgzxD661ZHphvlqT2D535i5A3yj3Zjl0KlyfVnCW?=
 =?us-ascii?Q?kH5EIIWDCmHdJnPUtekBMSqV0no6kZyrokuPm/EYbYb6X0Mrv7XhjKcdlKdy?=
 =?us-ascii?Q?gTRxu/BVqsc7PhH8D4Rn2+xWM5GGAWLpmyiE6vfgrqw7AQb7UemGahd4gjd5?=
 =?us-ascii?Q?k81AZasTyx37vnMyDKK/DLLXVJzHpKIJMTscLLgYywPo8WXbVWnrbtEou50i?=
 =?us-ascii?Q?GTmgMU4sbq62kE6KVbpSSGeTzV1eH6EnXPk//LCDnRl12Ub/XsNAYp3m00zi?=
 =?us-ascii?Q?Qdxx5ysCGi3qj0v23NzFZUlbyFpJvZmKWCR9yfWror7fxMO1fLJBjR+t9FhX?=
 =?us-ascii?Q?soCjyoWoRryVRzTPnUVODFUwWFSDsaPeu/rfUm/ehZgDzD65TfO0rOYvCUc5?=
 =?us-ascii?Q?MO0epdde5ito/inlFw8ldQQ3PuTpQcb7LRxAT1jCGu7IImH5V8PbSZvF4Ofu?=
 =?us-ascii?Q?Ej8iBZNgEqFkvvRMdSUKe8VaCk4Io7YChQwP1Y4Dl5MD3Oxwxg1luhNXLRDx?=
 =?us-ascii?Q?z1WjGI594Uyd4r/wycw1nJT4?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7C46CDA014F727418116BC7CE0ECD04A@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d74ba7f-035f-4754-c821-08d932b031c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 23:24:17.9239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VcCNgAfPJ+4M6N/ALziakWNoZ6HGm9x4W43kbGakJN27+P58SIH7GF6J8hNch/CwKOoBHS0adkRe/6hRc/cFXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB1212
X-Proofpoint-ORIG-GUID: SPvOQKaS_FmkLyFadmht4Kh-83xxzEMF
X-Proofpoint-GUID: SPvOQKaS_FmkLyFadmht4Kh-83xxzEMF
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-18_12:2021-06-18,
 2021-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 spamscore=0 mlxlogscore=997 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106180136
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
 "minyard@acm.org" <minyard@acm.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "KWLIU@nuvoton.com" <KWLIU@nuvoton.com>,
 "avifishman70@gmail.com" <avifishman70@gmail.com>,
 "venture@google.com" <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "benjaminfair@google.com" <benjaminfair@google.com>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 "chiawei_wang@aspeedtech.com" <chiawei_wang@aspeedtech.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "tmaimon77@gmail.com" <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jun 08, 2021 at 05:47:47AM CDT, Andrew Jeffery wrote:
>Strengthen the distinction between code that abstracts the
>implementation of the KCS behaviours (device drivers) and code that
>exploits KCS behaviours (clients). Neither needs to know about the APIs
>required by the other, so provide separate headers.
>
>Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>---
> drivers/char/ipmi/kcs_bmc.c           | 23 ++++++++++------
> drivers/char/ipmi/kcs_bmc.h           | 27 +++++++++----------
> drivers/char/ipmi/kcs_bmc_aspeed.c    | 17 ++++++------
> drivers/char/ipmi/kcs_bmc_cdev_ipmi.c | 39 ++++++++++++++++++---------
> drivers/char/ipmi/kcs_bmc_client.h    | 27 +++++++++++++++++++
> drivers/char/ipmi/kcs_bmc_device.h    | 19 +++++++++++++
> drivers/char/ipmi/kcs_bmc_npcm7xx.c   | 17 ++++++------
> 7 files changed, 117 insertions(+), 52 deletions(-)
> create mode 100644 drivers/char/ipmi/kcs_bmc_client.h
> create mode 100644 drivers/char/ipmi/kcs_bmc_device.h
>

Reviewed-by: Zev Weiss <zweiss@equinix.com>
