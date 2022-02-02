Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A98F4A7B8F
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 00:15:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpyLs6cJmz3bbv
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 10:15:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=Z2XWV7pF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=5032da2c70=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=Z2XWV7pF; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpyLM260Wz2xb1
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 10:14:29 +1100 (AEDT)
Received: from pps.filterd (m0165121.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 212IPiBG007203;
 Wed, 2 Feb 2022 23:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=J1kDUQhcwQJDQPpVQ3O5GzL0zEA+xuElw+m9NPowKAQ=;
 b=Z2XWV7pF4ulp0YYGLlssWG/Z5315kEocWwg4jYDUIDHlhAkO22WlIaScnVh4Z3eJ7Z/8
 zKdVWpnMTGHYmiUUQKo2hEzQxqhzHpiSYA2LgOzF8re9v3vINGpJx9r5XDiW0CJSNb2M
 4DyABB+gz1x72doiPbl6YjS+V+2F8y/WWchjRVnXApDKOrOI5k+R9Nrjgj3yRG1Fy0Xy
 WJ7VRgdYTrR2NqaSjymbMCd76Gtou/HapCyuIhXmD7tkmDGOfbfVsOOSJJo75Pf+NDUy
 tMKRc8qwbWntCqJ7AaGigw7YiwQ5z0lCEaGScIBhiOnefUtmkkSy2cHc2b6JAa03mjHP LA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by mx0b-00268f01.pphosted.com (PPS) with ESMTPS id 3dyy7rgr5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 23:14:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HyVJlYWB5l01nnjBno8vh9uE8qi2I4G+07VJDxsKVa9sOsVtB6n9sL7wnqPibBHbAKdOcnL2qc2ptdT0iga4QXjtX3os2iOVI4xJce512TMyn9rLWyGMTAkobpWfVFSRjbTbSXhQao4FHY6JjJYEgQoLeEfnhLfWE9q1jQGDRKSR6s90NvdIBOOzWIq2KG0SXdGCYDM+yZp0L6ZhZpdWvKCot7OPaySP7cuDTtw/K6R5RmnNnrvO0ri6hylQdQCoWUO1Visk4fofRIyLb/uMji6pmHeTUgWLTZ1tqshGykbA2ngwAldyUNgexqW47quW72JowWrPFrh5OVko8oxiGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1kDUQhcwQJDQPpVQ3O5GzL0zEA+xuElw+m9NPowKAQ=;
 b=OrMyp5/1JK3i/ksboK03TTQ3pot/T8Joh+GpoBE3fohjQxG9R4BIPrxDvJWio0WFfvTv+IXF+Rx6sa23TEbc26P1/5UXXJsshEoezrhxjCeCja9y2yRomMhWHEtoaCU11g/bHlxuLxQykALAjXSr7v9xgFNko4zCajseuh8jDwTgoNmee6IX9IfuYbQo4VS51QQQIXQviLp360z2xuToGEy3OYSsXanpBSxUHyjYjk7T8x/hsU7IAjrD3du/hmaZixtATmZBIy6Xw0Hgc8ryS+bLxVcmXOv1KMBB6ae0SPNoW9YFGGE8sFujmra8DYleSageKVgjFZpEylP1YFkqxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM6PR04MB4875.namprd04.prod.outlook.com (2603:10b6:5:11::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 23:14:18 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::1541:1248:d298:24d5]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::1541:1248:d298:24d5%6]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 23:14:17 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 1/2] pinctrl: aspeed: Enable pass-through on GPIOE1 and
 GPIOE3 free
Thread-Topic: [PATCH 1/2] pinctrl: aspeed: Enable pass-through on GPIOE1 and
 GPIOE3 free
Thread-Index: AQHYGIqazAZznVxGlkqVy6BAnAyCww==
Date: Wed, 2 Feb 2022 23:14:17 +0000
Message-ID: <20220202231417.GM5754@packtop>
References: <5c24d89c-4e58-4d1c-ffe2-d1586c6eceeb@linux.intel.com>
 <70fda031-ea0a-4155-81d4-74f398134bf8@www.fastmail.com>
In-Reply-To: <70fda031-ea0a-4155-81d4-74f398134bf8@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72ae517b-2fad-4487-822a-08d9e6a1bcac
x-ms-traffictypediagnostic: DM6PR04MB4875:EE_
x-microsoft-antispam-prvs: <DM6PR04MB4875DAB3BF57EC1ADC24AFEDC3279@DM6PR04MB4875.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NCUVD3gFnTDyc0C3MjZb0nmT2QPBBojI65lIkQ3RayAfUAqfe+ZIEzKNdSWin560fAxwtfIRPncjiilBZD5cbi4eQj9tWLzP2Q9hGCHkevEnv5A76SsXQ8A2X0IbchMeNEo2JwVvucTHhNaCVugS56m9D+EXqKJ2g13SLJQNNDu9dIIUxIh4a/MzRVS82/WYoEQK5wWMii9OLdJkih+nuIN1wcYH4IcD7184FCchmrBR59in0cmcmLPqwFHVZDwh0jiqBpvlZn3keO2CRAv4hQ3CuzQqVsXbQjnxpGnQdV/Pu/roEGjz6JsJ6XRYW9ZZUOJDOm1txbLQg49b7umD+nA6pTH7Kp3XJHwY/4za0X1w0uA+qKZJfU+QXhanIkwv3HqSniYi9R/3y8ANz/YaH/bytVmCttQ3yhQ6//Js5jIdYIe5CuIf6umWR0jYCv8ttQS2fsv+6U4B018mmiCUCq1k02Lz0MRVO6KYlc8o/S3BoIVb2IfmjvIvRiM5ybnpeaFBp3aXksaS6l3xTdpgZ9ATMWVmS4pvX0Py0l1/Ls5883iMAMi9v99IA55/8UfSSriBxn+AFUvnfncQiZ/JLdVtLJNCmyLWdo75ADBeyqjVmc77PYhbIOxmgnSHMX7g21KYnE9D+PwjeKpNxSapVCQGHsS7AmoOyVMemz99eO0kIJSnqFvz6/COr5gXCNRFp2xGIat21AbkTr3YPPaLfQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(7916004)(366004)(71200400001)(6512007)(9686003)(316002)(508600001)(8936002)(8676002)(4326008)(6506007)(6486002)(6916009)(54906003)(33656002)(64756008)(66446008)(91956017)(66556008)(76116006)(66946007)(66476007)(86362001)(2906002)(33716001)(38100700002)(26005)(186003)(1076003)(5660300002)(38070700005)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kcmCqZ+a/wqANREgvmLZX8EenkMH/NBVrvyCJM1u8W8BW10CGptJOb13d0jD?=
 =?us-ascii?Q?9f7RbAL9Uh++sQDF6oQTwJ3wjAi/NJfbfNk3yXJ/DtL+gXkqFQ4QqMRfCCdR?=
 =?us-ascii?Q?5rQO3HzgTmB7mVk4vc37YjWQ1vzhrALFzXuWFYv4mqQGyvU0BGBfv9F74GEI?=
 =?us-ascii?Q?9C7Bn9VBqJzHF46PgXTzzI8xRqcu93sxkLhZ96D3wOYrvhE+Pn3Sd555V/sI?=
 =?us-ascii?Q?TjkXtac9g7gR8rex8GNy0EOpng6eDQRp3DDUsdzZfRTnogq+byMOiUo0KU+j?=
 =?us-ascii?Q?pp/MMaQ5pg6T8Fz0gzWD8z4RXz0XCFil71nTm1PdKnloDj3VXG3A6XCewO9O?=
 =?us-ascii?Q?gZb/GTd7tZpELLmE3lsxcFPJ2c4xi5mRCLDgh52X4dvWwmsG6LV6SOmiHhar?=
 =?us-ascii?Q?bLxDf/iL/AHuyD1JW3G4/oGZQtF5+jvRznVAb4m63dXV98ru6+YxRsm1Qmrq?=
 =?us-ascii?Q?B8bUBQ5bk/m5Dzn1vmGHUMQ7HqbEWfVnXtNlWKNk5nApndALAybCBlyIDgwj?=
 =?us-ascii?Q?zC6WPoZwW47VdABLCDVcf6sC+ZSuNgYtR4olkkd2ti0kZIUpLm/xPPac1Wqa?=
 =?us-ascii?Q?/mjfYgzFgT6SdX2zsANE9/EBC6+B5Wjx63tqpfW/kUtaDX9iH/EsOsFpOMSj?=
 =?us-ascii?Q?vqALE1S27hcQEVJ501tbjeAnNDrsuGbG2F16eFsVraf3VvmTSJm8BNfbZRyL?=
 =?us-ascii?Q?1uu4SIsbyj0hUbl76InpJh4x9/jyI1mmMLF0sWHGMWy0vdHPkCthCDXL1/vt?=
 =?us-ascii?Q?nYIDIgWAGfyU/CtfGaRd1VVzG03y0si+/k01RH7NP+rmojf22fRpCO50vIHP?=
 =?us-ascii?Q?lh0dYtREYrxpodPbXtudh4mWE4pImripc1yA9mv4ViT4cPFSf2X9XvhTEAZ4?=
 =?us-ascii?Q?2f7LBnlB6mljek0AxvrUlrqOLRs+ewB/CxuevOdgcIWuz+4r4EXDYOPEPCdu?=
 =?us-ascii?Q?VsKC1u+JgMF9vpv91XW9eMZZW72MAJ07wHTnn1lYce5d+2hp4597qnPuT3Z9?=
 =?us-ascii?Q?GpBsY8rDvNVI28beIIEEygJW7LaTLP/LagEAFPPsalyFQ6UmeiFoYnwjopGA?=
 =?us-ascii?Q?4Cas9Z8uOwzkGGEEbUSaLmIOKF/9e2jErzzjAVBmlXrJ+1jMYf5S1+GbtIL8?=
 =?us-ascii?Q?DMf6RxLI78iKZsgeZejP3Qr1Lo3AqpPhVnnYnNublx5XT0FpuW+AQ0aX2lKp?=
 =?us-ascii?Q?XAHWoKWyJlgXurCtWqsuXNpN0+3xHqzwV59OPZ7kWNomc2AwaQiemDyfhdsR?=
 =?us-ascii?Q?z4IRMHkc4T4i8KhNGlwEJcZHgclNA3UrAXxbxtdAKe2F5nkgSRdKkvI6Qy0s?=
 =?us-ascii?Q?KoA//5CpM7jXpNg1F8rCxT9fAb8OvnI0s4J12rjbUQIn+OPVV6sEgaprBvkz?=
 =?us-ascii?Q?eRSmNRnyOVKnjcQFO9q9K838yRrCwIZ2lMis7Oc4BVpkOKjjd4SzdMMD7Qaq?=
 =?us-ascii?Q?x3yG0rzVyy3nrczI4OkyRVH4KONpmFSrKFKfeeg9a+9mEfWO4wfEfu3gu/5Y?=
 =?us-ascii?Q?9lS7ppOzL5Y8ERjHdkuOKObS2nIjFHAyWNAAozw/nTcDT/ojhc8R3mHG+jmJ?=
 =?us-ascii?Q?kN+yBiA1zr5BDgNSd8cpS92YXHziMvpHK3H4TyeQPOjC8QU1KJrrYV561ogf?=
 =?us-ascii?Q?TUDD0oVLd4UPmgkppo4z1+Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0DE6A757400D5B4285E078B666DCD9F7@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ae517b-2fad-4487-822a-08d9e6a1bcac
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 23:14:17.7931 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oz140l/w9FRdlbWc66fFEn7/LCSyycVMDZ4TeMPZ5CiRunVfYd0HJyyc6MDUILACCLtRxdBz52zAdxFVF/CrTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4875
X-Proofpoint-ORIG-GUID: dxT73Y4xica-o8kV-WdpBIwcUX43I5dr
X-Proofpoint-GUID: dxT73Y4xica-o8kV-WdpBIwcUX43I5dr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_11,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 mlxlogscore=916 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202020126
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Feb 02, 2022 at 02:49:13PM PST, Andrew Jeffery wrote:
>
>
>On Thu, 3 Feb 2022, at 06:29, Bills, Jason M wrote:
>> This change adds a gpio_disable_free() implementation that checks
>> if the GPIO being freed is GPIOE1 (33) or GPIOE3 (35) and will
>> re-enable the pass-through mux.
>
>Okay. So trying to pull back from the implementation for a moment:
>
>Perhaps we can view pass-through as a property on a pair of GPIOs, rather =
than a mux state? I think it would be better if we could, for instance, ann=
otate this in the devicetree?
>
>If we did that I don't think we're require this awkward and pin-specific i=
mplementation of the free callback for GPIOs.
>

Agreed, a way to specify this in DT would be nice -- e3c246d4i, for
example, also wants GPIO passthrough, but on GPIOD rather than GPIOE.
Hopefully whatever mechanism we arrive at for this could support either.

I don't have much expertise in the pinctrl subsystem to offer for code
review, but I'm happy to help with testing for this.


Zev
