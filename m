Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96346862014
	for <lists+openbmc@lfdr.de>; Fri, 23 Feb 2024 23:53:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=c6XeHFmP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ThQKf44Wcz3vYc
	for <lists+openbmc@lfdr.de>; Sat, 24 Feb 2024 09:53:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=c6XeHFmP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.148.236; helo=mx0a-00268f01.pphosted.com; envelope-from=prvs=9783e0ec32=zweiss@equinix.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 3038 seconds by postgrey-1.37 at boromir; Sat, 24 Feb 2024 09:53:02 AEDT
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com [148.163.148.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ThQJt1rcBz3cV5;
	Sat, 24 Feb 2024 09:53:00 +1100 (AEDT)
Received: from pps.filterd (m0165119.ppops.net [127.0.0.1])
	by mx0a-00268f01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41NKCYWv020570;
	Fri, 23 Feb 2024 22:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=IPajrUaWvY1CfpZRJehjRW4p/FSnbAfrASe83trFF+4=;
 b=c6XeHFmPIfAaYY/nghdOAzQI47juvYy47VE8SPV240TrAV5vGPP6ABd2Hqc6tAZWAsw6
 eo5KaigktW90/ihG3TLMjAFodxHeh8CJvRRNOyxuQD0bMOkO6Xf0uA+KkV+DEpAQHyo9
 lw5qbUN06eAdsYezpzB3+uyWFfPViGZLAzUW0uw3JKuPnKgQ6hG4+SLcrhhIF8jkQ9Qx
 DoJsFXhl/0h6Rd1vdTsslphXOeJH62fwj8U10KSIdcnYo4ep0S/9rQtRw316neLFSPV2
 CXCmiUbf9Dj0RcPEqnGB0cOO3UXkjsat6XFww6i4+nsqt0nPeBcImRDQpalKuYfmYLWp CQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3wf26u8apr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 22:02:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P95IRGLqrrtPoblsvBF+TsXtdHkuzpMqflP1jp4B25sWYC/aHZvV3het+w15rUFG/JhHiGPvyoaZl2lytVAkKS/aNdcAnczSDZqUg4mVXpopmmRE5yz3ssjYvgjlPhqDb5c/CnievHsrQrUiMpMEgre463rsmRhUj815QIO/8ztinUFaPzLjYUsMPh2zc6MPvwfBwTfzoPHDjJJ/yEwRLfC1p0c4Uwt5o2hiUMsqJbYfwDxNfV2EAS/bz7NbZndEldWcwEGAEzCYln8pOmnXh6o7/TUupbx34zS6r6IahQITZhhIP25wmjdkHRdbZ3ZLncai5yYOmDbiedKvyL/Rtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPajrUaWvY1CfpZRJehjRW4p/FSnbAfrASe83trFF+4=;
 b=Ve+eMgKAHM6sm2oBPjdcMqC91lda63kOtHsKmQB6xMjsgMpQqvXjhmsKj/6PWnRrylq62icEAc/YjErpunHv3lVCgZQJv68fAQlwSvPhLGSgXN+EC2Ve7UjDEDh2+fa2Q3gDlAkVpZq5k2cHVr+S2ZUvxRwewa+OABdAnHEdGk51jcPzlRnLWYVg1IEwvhQ3U1QlPQiOePF3e2RHdVGaPAL1tLUsA3DUGSP+6Nh9fQZqvo2jbHdJBoul8qwmTcFRFpZru/6HU48J2dFAU5ZA0vczADu3M2FliIUPsbrdkPwh6+5Wn44Cos5ONX/KoyxeN8S/j5tyxxu/Y5FuxJ7tYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from CO6PR04MB7843.namprd04.prod.outlook.com (2603:10b6:5:35f::22)
 by SJ0PR04MB7470.namprd04.prod.outlook.com (2603:10b6:a03:2a1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Fri, 23 Feb
 2024 22:01:15 +0000
Received: from CO6PR04MB7843.namprd04.prod.outlook.com
 ([fe80::f16c:1fa7:9c55:c1c]) by CO6PR04MB7843.namprd04.prod.outlook.com
 ([fe80::f16c:1fa7:9c55:c1c%2]) with mapi id 15.20.7316.018; Fri, 23 Feb 2024
 22:01:15 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board
Thread-Topic: [PATCH 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board
Thread-Index: AQHaZqPSJY1nzbZtU0+m3VCAr00hKA==
Date: Fri, 23 Feb 2024 22:01:15 +0000
Message-ID: <20240223220115.GB9299@packtop>
References: <20240222085914.1218037-1-Kelly_Hung@asus.com>
 <20240222-getting-nebulizer-8f75ba8063b1@spud>
In-Reply-To: <20240222-getting-nebulizer-8f75ba8063b1@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR04MB7843:EE_|SJ0PR04MB7470:EE_
x-ms-office365-filtering-correlation-id: fd8c497e-0fd0-40f6-b5f3-08dc34baf4f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  V0udlcPH36HKPH5vyhyka73zKGaw2qy2XksJlBTZgHMeg6UaiZMMY4s4b+ssPz2hVVdfx4WRRqiOk8rj1cRz9p1cfiyYonR9c5G9HVw+fbrPM0Mu1wxR6a/C6zwZUbOlEqnnWpMUc1X40oxaetcf6ahgacEZfgRiK08COKzabVf7FVUEHBQtce1cj+uLNt65PfKnpu/p8+seNw5r74T65oEQTTawmcXFJOXW+X/wdE8LRNPp3YFS251CDZSm5QMaY9SLl8gE8sa7eL18c/ddG//frDohUq9AFUIl31/BQIreOlWbGmtMzLhS05+oTsxX7CYlibK6F4tkOJGa3S+4eCukQs7T7pFwUcnK6ygWso/qMIknHhR+OisUxwiWdnAN9Ns3drsbx7OGxFHbq4VE2dohaVC2+AuxV2K1A4IuC4bspO1WrGj4qRCbfxZNLsiaeSOqerJxCkWhGilM8BtjOorEeimr2Z/2IejCbrLF/cyVYaEEqVsoPet/oYFpDOd4NWFeDTpSNriJ1uN/5h9j9kafqZLoR3jvghU4p1//wjLmYu8Ay1GTXoH8o0sbKil3KrfSUoc0T3B/fVx2B+lcKKBnj036U8W15sBha6zFjBWCEMUTvRD+JRCvkTCKy9Uj
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR04MB7843.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?ChhJs9C9pOB1kHEs83iwJ6VOaMnNoEe/thyO0IFaxpp0rX3fbFEF9/RkhXTM?=
 =?us-ascii?Q?0/yc8inPbXUMyRrci7slJr8dfl2/3+L0MN1MuiHnS5j+/ecCg5g7Yr5nVtkO?=
 =?us-ascii?Q?sOYq+MISWFIrxvHNg5tQzfyErv668HNUJxZCNiqNhOF8VxcxJzpS3y+t2Pj6?=
 =?us-ascii?Q?bETErhsS8Ds2Vv2JTE9p72rbzQ8oJ2/GPMkuPd9tbF/hbbgDK7v7avUQtc5t?=
 =?us-ascii?Q?g0WG3PhJooXKQSOv4eVSA+SHJAzCdFmCw1UvVLZ1MNHntkhYnmm0XABU8T7U?=
 =?us-ascii?Q?IyYYBj38ZzEVqbiv2svBaDC0/e5QJS52+ZxeHz8+4ngaWYXMj8xCzAkgRpsa?=
 =?us-ascii?Q?nHJE5opq9ZL2sx4g2vzRNNW/Qv8fqwNP/Cll53YCRkFrAeEcp5lidH1DA6NT?=
 =?us-ascii?Q?EklBchkyDiE9cclTEYYUMuuGlK14/43cyR1PcnkCeGcB1guoYkq9Uv5gbW/i?=
 =?us-ascii?Q?67fKuRDtH44tIvp/d8F+nBHRgHkyG1jPIHF9m51+V1ix4ojq0kJx3xFM+tcN?=
 =?us-ascii?Q?T7JrV4XjgfNEviBK/flfBWRKqM7ZNk0fBlWz+JOZt5CDeLuFSskcrTAK/Rmu?=
 =?us-ascii?Q?5NVohh3z8ZC/F+HIQYNtRyEAefdpIsvC7bboEPWvAN6LsLCJMZn7Rq5kNRNZ?=
 =?us-ascii?Q?nVGlrmcAM/DLoDd8iWRCxVKwO46+ui8Hnj+Tj2V0Eq8Gg+MZuPQRzPU02ZUH?=
 =?us-ascii?Q?tlhJedl1epgdY7JQe1EjYLJl0YhnoyUS7pB8SO4INepbyMgfuVM+dXYxNqHJ?=
 =?us-ascii?Q?yRFZVwK9ipObsaaUQBfNoYku+gIrjJQPwe7zpdgt0CH5/+Vk8TmgHA//Vknu?=
 =?us-ascii?Q?dlZgmUeNUl2bVQ7OmL0x+RJ5oxNScUeeLk91s2VW96UGSbNSc0iuTjf1X/Ug?=
 =?us-ascii?Q?FLiQ8y+/HzdJf8ygtFFWuBJ6yQlAZW3s7qoftZfeJN0BR7Rk6UEJ9q51jyQT?=
 =?us-ascii?Q?EDnO9oQbmFHRwAE3zSVQ3whdcbLG7+YjBIXqqulvHPLMQ+tEVbfJhYfeWEno?=
 =?us-ascii?Q?B+YTAi5/jaJEtb1JbnPxJR7McQCVzuA4Ibuz7u0idKgU640bfxHbGHHn08f6?=
 =?us-ascii?Q?F2kuHwtFupEcjMxEvy9Jwi8nG5N48Fdon7bAQ4FA0oi7V6Abnc2O4eWayLrr?=
 =?us-ascii?Q?E9XzTzGBJTcfisLXbHSvBZjeMqxgIvNFmm6P/ALSXjz/FFQ5ivkRsuEdXPJu?=
 =?us-ascii?Q?FP5NjSu8cGAliOOwaw3tLtLP0w+enuHGyy4d15csQwNvxqcRgE0j4/aMWHLn?=
 =?us-ascii?Q?ItzUFV6RJYNPIknidh1qdlae69q6FVxeOuW/nlmvKOa36J+28HVurdd6h95M?=
 =?us-ascii?Q?yyK+Zm2PJLWwI2hqd8aoFmQsPnBpICvod79VP+9a5C4DlimDFEKvPoIZpHEK?=
 =?us-ascii?Q?s77Mpgg/pbWw/p2bCe3oxMbtk5NaHL5V7UcSfBh+SBQqUU7Rohr03D4RLhet?=
 =?us-ascii?Q?5kEC/17Mgme7uQnMSDyU7gSr/jRYE/83gXX2ZlYdwvOILbmybeXBEjSq/ZkZ?=
 =?us-ascii?Q?MMkvVNvVFPC9UcYEQTAE31X4BKZLr8e+BlKpTLwId3ZZ+xENUSdD1zwhXk4m?=
 =?us-ascii?Q?vmQ5OccoH+q3pCFmFbIVSp4mbIz7U6Qc5U9Ty4HH?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A03DAFD4614B4546908C779519E505B3@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	8IxqJCjPr8T1EAclsUBn7q2aJkMxSsqRmadn6NkcDUuAKpjQYqyduGlL9JQmrbwF0/VDgTBmjuOdkDjFCqLuwInds7WR7q9onqO2cNb6vqnmEq/o1nlz7t2qXhXH0L+QI9hd5X6giCANRkujRIIQOXigHwSO4JDM1ac6zgyBCbrvsZI+Z+7cHFnRcLOC6Ukgd/+cNiWLMMayo+dnVLzNcMoF86yj15vv5v4ovFjiVwYXjr8hyzsQNRaQ8TeTQVbcpCUMcaZ/lAkP2af1omjOVtY+bYII/34ugkIFLnKoYHo4x9mkvxIYAP9lHNe5bCebxDqqng60YU40MzrcmNO/Y9S/jL7QVbugy81Z0yWLi78lrWVq5Xc1xatBTAGHpL/5pOsyyo90mKVdYFr2FH28UGPyuxA2CJWh5fbipqSv3wAHkcc80h3jj1TDhg0MSzGDkpVcgKC1I73uyGgk/pnDXJ9KYHTzFfpnDV6z150a2QF+AQ4yQE8W+utWuSsvMK+Z77pOZq3hYW4I93DNup0PCrLQPdHwM11XehnrveWmGaDacPxy0eCSO574+7tYpQQJ1WNRfaaOb++7OjnvQPJFPfIotpScX/P3pJAMZwwd5LyV8W8qMM6/0QvOCoENkCH8LGkp314CZnwIUceOxS0q2W8IEKv0XO/w3g66Pdt08Q4=
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7843.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8c497e-0fd0-40f6-b5f3-08dc34baf4f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 22:01:15.7578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CT6ZYh8IvT0oTN90NRHjiUd5pLZZorPl9/hX6wxHeXxcC1jKEPPk+ptiZGmAQl+tojgmg12mB+k3BkX2y87Nfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7470
X-Proofpoint-ORIG-GUID: FGsH4ZxKLZTAhoAZF6q2gs81s5VR_ZC2
X-Proofpoint-GUID: FGsH4ZxKLZTAhoAZF6q2gs81s5VR_ZC2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-23_06,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402230158
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Kelly Hung <ppighouse@gmail.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kelly_hung@asus.com" <kelly_hung@asus.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "Allenyy_Hsu@asus.com" <Allenyy_Hsu@asus.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Feb 22, 2024 at 08:02:07AM PST, Conor Dooley wrote:
>On Thu, Feb 22, 2024 at 04:59:13PM +0800, Kelly Hung wrote:
>> Document the new compatibles used on ASUS X4TF.
>
>It would be good to mention here what the x4tf is - is it a bmc or
>an sbc etc.
>

...and if, as a quick web search indicates is likely the case, it's a
BMC for a server (or family of servers), following the existing naming
convention with something more like "asus,x4tf-bmc" might be nice.

Also, Kelly -- when sending revised versions of patches please use the
'-v' flag to git format-patch to include a version number in the subject
line so it's clearer what's going on.  (So when posting the next version
incorporating the feedback on this one use '-v3', since this appears to
be a v2.)

Zev
