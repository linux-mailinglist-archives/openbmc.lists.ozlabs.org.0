Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A23B0451D6E
	for <lists+openbmc@lfdr.de>; Tue, 16 Nov 2021 01:26:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtRgq4Mcwz2yPd
	for <lists+openbmc@lfdr.de>; Tue, 16 Nov 2021 11:26:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=M9vNWYZk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=2954290366=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=M9vNWYZk; 
 dkim-atps=neutral
X-Greylist: delayed 1318 seconds by postgrey-1.36 at boromir;
 Tue, 16 Nov 2021 11:26:04 AEDT
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtRgJ4cWKz2xYD
 for <openbmc@lists.ozlabs.org>; Tue, 16 Nov 2021 11:26:02 +1100 (AEDT)
Received: from pps.filterd (m0165121.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AFMPOTq004501;
 Tue, 16 Nov 2021 00:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=pps202002;
 bh=3IKfVoT8hC7wgyubwN8UU0T0j8/vqWFmZD+UZFbopvE=;
 b=M9vNWYZkGdsm0TNbzBepYnVUTaz+Bt+z1LynopPRRs6S0JPqpfr7ADfbS/p3qdPcpVGy
 1Kzuu5a6/Y78Rsdv2av45ZbiJbFfFNTmXkZl78L1L7to3xhax25iVSpC/bnVxl8w5kTU
 QNn+bUZb5jWRrM2JOzaqLEeFQQaekVV2JOV09u3KLtX64DHQERfHyIGC7gsSyx7r1ksP
 C0Hy4ueoqgug1Y06nr+c0hcH9RmHl+Zku66hKIwZukxL6YCLvBDXB3Q3Arh4/+BnRRWe
 mwURV/EimjNOxJ2RNerAdvVc3IPifDO9iRnpqNuYRq1ZCffocS45pLfFayZ1nSOiomus aQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
 by mx0b-00268f01.pphosted.com (PPS) with ESMTPS id 3cbtmu1j8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 00:04:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/k2DKlwCj04K0Bvw2flt4PWfkHGT39r8gDn1vsducL1kXEV6W23vXan7LhbkeItj2zCPJUuVh2v5f/r7w8btgQxRrYsg+YYOwANWD7K5xRnIovmlqsjAj2gW0oQZ8EbBLCDjwLLJ3u3dBQ5nlMHpPqd2UUaMnyhjoaEW0/7U6yZO4VPG9dp3W7puTNhWDOOhgupbSseMwqr3aXsRMzARvdzws8RtmxTxgLoudUwwOtWI7KyMjBwnBv4P5V4KagPq5hqtfEYly4gsozCw9cn8IcrxLPxYriTFuHYB7RfNVUEiL+Ge5kTQj/896AA4DyxwzOEnj+tkUeIM0YJQids2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3IKfVoT8hC7wgyubwN8UU0T0j8/vqWFmZD+UZFbopvE=;
 b=XeBnVGRCYv2IVS+0Y/32pQTJ0wPimKehmxAA/K1BsXSizb27gQPrnB5bwXJ8bdqfp7EwHwHzp9fVG7mUv+9S1Na4sP6RI/6nr0eYARJ31AVz6WQx8ibDjGAUNEJDXEQ3+NP4ljXnI8or+YvciHUvrxBLDDqKPcTjndZKM1bUFCJi8HW8Ck/j7sq2jy4G4gBSoX4Ilr38f6W7zE9gszlHTQN9CyHuT//i04WlL0038YwK7uBdi0rUOmiJV8ckrN/A9GHP4R7Igt+6/5yrW8g5goAwih/vDmQc4Q1AxDnsuwG0UhFLNzwI/GmbzxePJKoIX7hoSGXTwZGQKBhrH7BYGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB7750.namprd04.prod.outlook.com (2603:10b6:8:3e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10; Tue, 16 Nov 2021 00:03:59 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::61fc:37a:892f:c6b9]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::61fc:37a:892f:c6b9%8]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 00:03:59 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Geissler <geissonator@yahoo.com>
Subject: New server added to OpenBMC CI pool
Thread-Topic: New server added to OpenBMC CI pool
Thread-Index: AQHX2n10F9fNFS0m8kyPox1Y76OqgQ==
Date: Tue, 16 Nov 2021 00:03:58 +0000
Message-ID: <20211116000358.GF14774@packtop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: yahoo.com; dkim=none (message not signed)
 header.d=none;yahoo.com; dmarc=none action=none header.from=equinix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7546bbf1-76e6-4776-ffe9-08d9a89496f8
x-ms-traffictypediagnostic: DM8PR04MB7750:
x-microsoft-antispam-prvs: <DM8PR04MB7750A036EE425E397CB7D6ACC3999@DM8PR04MB7750.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GWgu9UD8QiVQviPpzkTMudup6KVKMF/FTYywerAPOqFWCaIbqPnj/EWgR2zdaZ9gALlTG37cc2d3jfQmpJ+R4p43SmDGR6uYwF77l7ue5aQuBnW8YLBam/q2R5c+F8DHRSRnpAMSsuq0ha5cm0MdKE6NdcOrgsDjZ0ZiwIcrJ3+0Sh2FmAiTWRsvwRWGOgzElPqoM2lmm5It+wcX4lDf85Wng5ca+8+qg38ERSq1FdeLdhHWMIacdedVf0RTjdWa1YIADXn3JWPIW1eKl49TVvJ9ad0Ev3qoNW3GMiOPRpCIh6qaPI+BP2n6CTlTJ0P3jj+ghn18v6L0PJVIy401AgIT5px/qubRTeQa0itLgjZ5NHrNsE9s7/80/Q3LfCHYYDuU0+MD4Wp0XiBvTnwmWfx/ygG1fClfrVsErS+vRQWlnG2n5XHnFepCZG7fV3ZZeck7AmWQTszwGsLz9oAVHxhE+ECpwk5OOtMjegDeLiL5ZlUfSFe0CSFUTSvJqGyeYfRuag/pxIK1IhlDxHhKCeV2+zapQz9DcBhHO5yGPTNZCI23sgJgfrqjE37K2jnsJb6qJg/nS+f9hHA3XhlPKjX/30CbNybhMWB8HRqGGp3/XkWEIKb6b0PGpBzC0RxmfBNt53kWKSudwTYewafimKAkc5YGyk/aQ7+XExL+fiMWtUGhdtlh2JKxNl5k8gKXx7qC0jOWsHFgvRedbDfVwQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(366004)(107886003)(122000001)(26005)(33716001)(71200400001)(91956017)(4326008)(2906002)(316002)(8676002)(83380400001)(66946007)(6506007)(5660300002)(6916009)(1076003)(54906003)(6486002)(33656002)(8936002)(38070700005)(186003)(86362001)(6512007)(66446008)(66556008)(66476007)(64756008)(38100700002)(9686003)(76116006)(4744005)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YLNMReAWCc4CaVfL3mLXjuWimUKhNPDcWf7qCTOJn5FAidNqTiIF0i+LK7DN?=
 =?us-ascii?Q?P0Mj5h3fX+QwidfqX2Npu3OJFjm97a5qxM9vmtTKcVwUmTnj7Znl7orG3tpD?=
 =?us-ascii?Q?BeW7e3rqVBr7s908YLrhURL1oZkKGfn37sfZEERBKyCWdKBfAIEMF5UYLmNY?=
 =?us-ascii?Q?ZGEPwLbCR5fqwNPnaFXZsMM/7k2Tizi7kWhdxK7jWYeViMn4NaI2YYWQ+SV1?=
 =?us-ascii?Q?HHXogHxZ0uKXjyW/wbeKbzhlX/BrAySoDfK5umWaN2NK3dJHHucep1OG7Kbw?=
 =?us-ascii?Q?0zdwTIhzINee4cP/p0/zbZL7GL5XMnQ+qbDluO5x2BBb3PVyJJWBuz7531nq?=
 =?us-ascii?Q?soBEOWhqhFvDDVaMSDawLIPXZ7eNYTnBbjBW6C6u4f9BhVzAdGifIErNeDyc?=
 =?us-ascii?Q?XFobkV2wculqvNR2NL4gnWxM1IAs9rPEJeWXiMj/m6kaDkl/N8lTAQVli6Up?=
 =?us-ascii?Q?QGX2rk0iuPnHAqinBa4hcH90P3/q4IDfgFpkHc8naM7aTKbcXFVcvWGRUyy5?=
 =?us-ascii?Q?ENmEkgIWW7seMexiN1povr7IOIy/8p26ZTObs6/+XqpU8l1woqEQ7AZqw6AC?=
 =?us-ascii?Q?7PV03ESDyglWK0ijFVgAQSD4l7TTEzus4edJNvNKhn0wwE56XS6lOEz/z33P?=
 =?us-ascii?Q?fbqrNLhtqTlZiTZ8/PjT69MgwpbtWcCIzYGsSIIVttA2LdFw5XnQjSsJsnpt?=
 =?us-ascii?Q?ml4Y2174Hd9xka4/FfQGZVo2SgsXboJh+6n0uMYm7G6XNSWW45gR8dgtz2sd?=
 =?us-ascii?Q?mSks7qK1229ZUsL1UqXkiaa3CgCJGDTNa1RcssnsLGfUutuxdLT99O42HRpp?=
 =?us-ascii?Q?GqRArqeeK1w4hXXbVQG2ugtUO3C5so+PrByoRVBfBxKgPOHCKGbWOb4LmL5o?=
 =?us-ascii?Q?lujb/d8Ebcoe4Ufs4Y+Y1nyX8d8O+ct94gSJwJNMaKwRun7NsWRRChy95KSj?=
 =?us-ascii?Q?a845CccebTTBO3/0qjZpHwo9u8eF6RDG3Cq71IsaPJPblzfTY6+wML/RcTnk?=
 =?us-ascii?Q?59/N9C9tFAGym1jeXKoo1F1IBUppvor2TtjdqMVH9aWp3djm4S37qcbyUJqQ?=
 =?us-ascii?Q?qE0IT/6aB1GkpY+wPueHBD5asfarhkX/lqQxDgiEmZsY+ko8lHA6ImReK3Eq?=
 =?us-ascii?Q?vZ7bLWOpVbC/tsmfreOCdkHMC3mVWU7RxILSiPxOh0wmrWPS1OJ3b7OVNqYz?=
 =?us-ascii?Q?R/XDJ9Ncf0aMmMrjBM0TqiYQS2wlXu3t8PdgsDx4bHeDIAJATZMxT6SI8Y7Z?=
 =?us-ascii?Q?M4E3/OkxPY6P/Ad1Y7oCaN75/BwcVDnfqgRhfWcnLenXTAg9Q9tvaJtorO7c?=
 =?us-ascii?Q?yfGANQxCAWa1/4FvQHRP47yyT7tWhg1saGDBjYoI5dvRrdMz7xrr4b/Xflrz?=
 =?us-ascii?Q?XVnt9cVtYsUx0ypbGLeHTCqvSspPcOrWcA0Nq08Xh+dClcreqkwDyYfI/N7F?=
 =?us-ascii?Q?usrKI+qljgkkfNCyRMZTEZf8TxsTHYQG0WYs9spySz+S1Zi5QC2N5u8qSU8Y?=
 =?us-ascii?Q?lyQkR5Q6RHMuImXr42yAkazzMtoLKafYD7pJlNG3/HWyZis6zFs+D8K9Dm3A?=
 =?us-ascii?Q?Pc4daiULmx8K+A0HdzWqORlyMzdX/BcyFUahhe+wRHfHYWQK5I0kcfuxII8+?=
 =?us-ascii?Q?w4DoOj6royxkzaPb41Sl5VI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5612D81D58D3174CA61C16FE0E2D7135@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7546bbf1-76e6-4776-ffe9-08d9a89496f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2021 00:03:58.9589 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k6WR2kgSYO1euYwfMbAv7oZZE+ZtXBtizNWbbLoMa3GV8aIoUozANWpUSd+LmIDTwTbmxkHQZQW+vSLNvFWtzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB7750
X-Proofpoint-ORIG-GUID: YCd74Nxv7hAiA92JT1TBgN12BmUwWipl
X-Proofpoint-GUID: YCd74Nxv7hAiA92JT1TBgN12BmUwWipl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_16,2021-11-15_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=828 adultscore=0
 malwarescore=0 clxscore=1011 impostorscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111150123
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Edward Vielmetti <evielmetti@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

A donated server from Equinix Metal is now online and has been added as
a Jenkins node (builder_equinix_c0) in the OpenBMC CI pool.  This adds a
decent chunk of capacity to the pool (it's a 24c/48t Epyc 7402P with
64GB of RAM and ~1.2TB of SSD) that should help increase our overall
throughput on CI jobs.  We'll be providing any required support as
needed to keep it running smoothly and usefully.

With the additional hardware now available, it would be great if we
could get e3c246d4i added to the list of platforms targeted by CI runs.


Thanks!

Zev
