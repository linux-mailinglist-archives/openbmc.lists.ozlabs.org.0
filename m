Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8B8A3574E
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2025 07:41:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvMsC0FS1z3cW5
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2025 17:41:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739515292;
	cv=pass; b=Dep5wzJNJF+q48ZpyB4nyn86qUKgrpQlgaUay4LMt24bjSwqUI1YtYo29UdOqauUZr/q5eSAeZHxZvWTkXpUFapW+rJODQq+V/EIXQedfCcSfWSGv6dM+FCP1DcTXDToCav34p8UL3h/bY1Kt79sPhKawZhV1lOUzKdU5P8ToeUlOzMFd5dLzFbN7O6gEthHYC1rifOwPmTN5qmt4QcKmkImXT7p7HO6SIC0uaMvxn1gOXJ+hIdP/T/lEhlTNDe2HmO2ZiwddmASH1vgVwnoj0qU5eU2t4QjFw3JNRBPM6ixDzC9jsiLIu1q9xDRTBznsH1UNfV1jbSBbPw9Hk/xrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739515292; c=relaxed/relaxed;
	bh=SacLeXQIFUO8ejyuQ8SWf7GdGAr3T2epfyHPKI5v0Eo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a2eARDG+SvV9DLMQdc3biWz40ghZs0sVRZRZpGfV1GQ92sZ23mq9IxDga0/Ly+erIRU6Z91WvK9JcWjjRDuoT9FVTeq8qgspcC9uVlApHuwFDnxKMlkXU8Cl2Nnw3r/QSNDky4XZL5RovtSs5PnIUB2vRgk5WyYYHmOv9On17CTc9OwSkmq1iZA/QxK/JjsCJh4Ku97iySwuWlznX60Gim7klulePiasfSp5aEuCH+RJyTlgYXMT+kRGiB4XNK1DuMrr8ueZCJFIMwcg67UpXUb1phtmceWv8kvJ4S3TTIisA6BVpFR1VewPrM2F6i1rmjrVb/3SidwjUOUvVtRTsw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com; dkim=fail header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=MI5hkqSF reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::3; helo=cy4pr02cu008.outbound.protection.outlook.com; envelope-from=thang@amperemail.onmicrosoft.com; receiver=lists.ozlabs.org) smtp.mailfrom=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=MI5hkqSF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amperemail.onmicrosoft.com (client-ip=2a01:111:f403:c112::3; helo=cy4pr02cu008.outbound.protection.outlook.com; envelope-from=thang@amperemail.onmicrosoft.com; receiver=lists.ozlabs.org)
Received: from CY4PR02CU008.outbound.protection.outlook.com (mail-westcentralusazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvMs73qsjz30Vk
	for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2025 17:41:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJRECsISIePgI2Wfv5cRsPo8woapTzX/7pjfX1Ep9C0MVMJpFVTvd+DSrwtXSmvcjBlxnd7tgXMaXSCYFJ2+bQUxDY2MdfYIlK7SYFGlUnUCu7CKoXoDtg1YhcZfek+MbaluLKlHeaKgLoP4QTjo4pYM0CDltICaIaNhiir5tq4QdRlo6d685UqqGK/YWi4kO1BCFc8s8KXeoAVJwY9xKNTZXApTCrU8wqgZFbwxMIfMS0D6/qKec6efQnRxlB1L3nIshIjg2J0THEsotLZ8E+ouk9g1fo6dW5HdKQiQ85/vfExu844R2Bu9nPZBs1Cghy+46BjhgNPeE06SjHfsbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SacLeXQIFUO8ejyuQ8SWf7GdGAr3T2epfyHPKI5v0Eo=;
 b=jqE3a4rov2lqcohc8piNEpc//ky5tAcN9abfUyaJ22sIuWuItgtr19S31oiQodKqQjL6+iDH+Gko8b29LVD8Vo9/rSLpjBhbCI1cnDR9Foa8wzFU6+a0BaGd+T2FE/cuipLFMb1jZXaf8a0qFQJ8FutLt/YlOQrTvFdomPGxMa8KzFkYsHIyz682qjGp2wCeNJHrAdUqYOWWYbMBiahACcijMKPWPX4KADPm2BmXo0sD0kt3IHLKo2dj3IRphN3osZ9x423hDulx8t4zZqienv1keTW7rVwMBaPJAFDv0kJ6Wuelz5754Fc26IYIm3ZMFbU478jMIy/1ywLiJ8wwdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amperemail.onmicrosoft.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SacLeXQIFUO8ejyuQ8SWf7GdGAr3T2epfyHPKI5v0Eo=;
 b=MI5hkqSFkfhQfbp9a74d968hUMNZs9gnYlrcYrMeKBOf0YkC9IYi/fc4WrgF9xhieuIk1kumo5t4ulW62Bp3pe58htGNzntXG48LQz/zlI+LtN/mmSy/kS2I4QwzciiCQckhwDfShB/rZ92IY4wXxUwQvS1hH/7DeA6X9XwxPEY=
Received: from SA3PR01MB7906.prod.exchangelabs.com (2603:10b6:806:311::12) by
 MN0PR01MB7658.prod.exchangelabs.com (2603:10b6:208:379::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.10; Fri, 14 Feb 2025 06:41:06 +0000
Received: from SA3PR01MB7906.prod.exchangelabs.com
 ([fe80::3524:4d65:8610:45ef]) by SA3PR01MB7906.prod.exchangelabs.com
 ([fe80::3524:4d65:8610:45ef%6]) with mapi id 15.20.8466.007; Fri, 14 Feb 2025
 06:41:03 +0000
From: Thang Nguyen OS <thang@amperemail.onmicrosoft.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: Ampere's CCLA Schedule A update 2025-02-10
Thread-Topic: Ampere's CCLA Schedule A update 2025-02-10
Thread-Index: AQHbfc4/hP/I+Zb3SkeiOJIyPqL33bNGRYQAgAAVqIA=
Date: Fri, 14 Feb 2025 06:41:03 +0000
Message-ID: <D5524156-6A3D-4AC2-85F2-6BE5719937FF@amperemail.onmicrosoft.com>
References: <077812E1-6D53-4F66-86D5-57DD5B8A8779@amperemail.onmicrosoft.com>
 <99a6795fac93ed52f2b2546026dd2cb4032dd8e0.camel@codeconstruct.com.au>
In-Reply-To:  <99a6795fac93ed52f2b2546026dd2cb4032dd8e0.camel@codeconstruct.com.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR01MB7906:EE_|MN0PR01MB7658:EE_
x-ms-office365-filtering-correlation-id: eb221466-7a6b-492c-291f-08dd4cc28d86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|38070700018;
x-microsoft-antispam-message-info:  =?us-ascii?Q?9mk5DV+jeteCEl3aJouTdWsQoZcsaOlvNy99t0Rgg20PQ4k9HpdcB0eoh2xA?=
 =?us-ascii?Q?YJjU2U6F96SSfsSOb8rPoR3zm8wkmp/8U1d6szXSl7IvxLQZBJPK5uQ8ZoA5?=
 =?us-ascii?Q?oAIpQarXM3Aruseicx+sgv/zt2x2TwRO3oVf/acb4gs9nRXGOb1fCAIuaaPo?=
 =?us-ascii?Q?yJb/cr86rOKpb8mKujQMbM7vjWXFsj1AVCWjoHqX8NcNR/4vqIZHUr9HN7nM?=
 =?us-ascii?Q?N4ZYc2wkJdTPa98EoiXZf533y5RWUTWqg3R9EmHO5ohq9VewFBUGhZ2d0Lm8?=
 =?us-ascii?Q?Qm1OFl6id4H8spCpuJ2Nq/onG+1UCsu/Icfddi6s+v8HwtAT7JdMzmUHneJI?=
 =?us-ascii?Q?zKhiNnQKXnT6LpfbzXKfj01EErZ73HxcNIMSvDyHKQpPtoALkO10i8qMxanc?=
 =?us-ascii?Q?uGPa9W7Rn/mwQ6G3FFjmiP1HBaITNpcpczAqdw/7S/2ccyKVxLWQP1+eBf8B?=
 =?us-ascii?Q?ffMlZcF5NER/w4e6vBOw6d6IkjaDIWlGDgWLB68xrEcfLmBajgsNZw/hyvqe?=
 =?us-ascii?Q?zKvl1kbV6DxoWLw9S0J4Ry+P9RLICcBbvk+aeIZ0OJo80dkgjfJOJPqOYtZp?=
 =?us-ascii?Q?AExUvpGMC7laZchOoDPXI9MjPrUatNW+mpMI3KsDwR1DmuefeFY2ep+txP4H?=
 =?us-ascii?Q?15tFN2jHi+AHisjjgcRpnQ+/p4zRUWZINeMWsbLMg3Nid8fVn109V9mEY0kb?=
 =?us-ascii?Q?JHjmmEa71g0/pNv1ugUYPuCE4WVLb4POlOvw9FyCEY/nekVfgxHImSoJTz81?=
 =?us-ascii?Q?r0R7Hgowik9hgLpY7YxEji0OH3FOtp4RMhVA0D4wuedJSRiKh6lTkKpKVH71?=
 =?us-ascii?Q?Lnya+gr0rdft+xfnihCV0nXTr7ExfpiWmTxQzPgCSHuQmoR7FmXhWQQiLBCy?=
 =?us-ascii?Q?oI/76BhEVw75Rxcyi6OgHomf07M7QX9pAmCp2Zy3AXBzFRn9U5kYBxeQVHhj?=
 =?us-ascii?Q?zkUw+zlbubMiJwgiY6fIIkDkWw+wEdmidjDRmkib6UKeTHRpsT5ZGRG+5uCB?=
 =?us-ascii?Q?/5S555mdUj2jG8mxDH/zOQlPKz2eSIv6G8lQzaBkOs38KePAdCQ6X7fVDdqj?=
 =?us-ascii?Q?YFCT6nvyDLgYp90ufbNtfkkzoMg5OFLru/jTlItwYoS+DqBMEOT/W+43GRz/?=
 =?us-ascii?Q?uE1Kicb3AkFbFbCNAqiIQ0QV7vEJQNC4/N7Ec5TCAW7UBO2/7FudmndkCwdY?=
 =?us-ascii?Q?xe+/+h27lJjPgyEJJp+nvXo7xteizJa62BwZFC50dHshb+rwbbbqhlavYM9D?=
 =?us-ascii?Q?Hg8ZZOWCPCUBwc2ekyYgYvu+y3ltBMia0dULsHhNgo3zHd47LC+dVwBRLHTT?=
 =?us-ascii?Q?WoRFq/DW7rvb/dUuNf8wbrLPCPVUmcIjjyM6U2vXslvVg4Yarp8zwfCO/3IP?=
 =?us-ascii?Q?m0skeo9fY2inocgnUN2YEocQSxBdLufPW/qHKgo7aqgBLbjAIFYG9HJdso4X?=
 =?us-ascii?Q?sjWZE7MgIVB9xeyyqo+It7GhKf2Pje3KzEyCx/uAeO5hF7fuRacJZw=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR01MB7906.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?qnLnIxq3+Mbi2+EETqp/tfWuwu7763mKuz9fg3VOKr801qvyAOjcNNcuLZp7?=
 =?us-ascii?Q?wEx7L+azFDH90s5nAvnT75nXfRiG1L4vbEjRn3ccYJ1KMLaZKTYf+hkwa3Pj?=
 =?us-ascii?Q?Rc01b+e5Hu/rZCRQMAuBDye88buuK/jxnEn/6OxDr71/RKpz3Qp2s3kmywVD?=
 =?us-ascii?Q?M2ZNIRuSYekS07t3xPr4K5NStMfIpLPi2lH96+uEj+sB/IBcv21015vVwskr?=
 =?us-ascii?Q?GUY74vw0l6MpNdN5K9Qs8a+r3QfKsNjvdq7qme7HhsFIaf1clLnlyJvhLFlv?=
 =?us-ascii?Q?es+iER4bt0OoIcYtOVKK7Ilm4TRkl6BhCE7QXy2ruwj+ROEcvXvYn9Q8YGxA?=
 =?us-ascii?Q?8fsZgkh6bfpHgGxOWVMuAsw3qAFUx3TGdBXpjxJotzJsxb45hoF8CTymkIpV?=
 =?us-ascii?Q?1ReLb/oFpjJraqLCPaX+q6+hu+VF+KHvyn8+mvUsghXBlJ47ZRE/rE20AHoS?=
 =?us-ascii?Q?FaDi0t/SQhBGsffpz1mYy+V4A+2LD2bNlYPpKK0Kk2OzVFM1v5+mSpa6WhLe?=
 =?us-ascii?Q?4Q7ti4eFuhhs1b3UtKFjiap2Lrv55xqbYrlzSQU8rf9FXmKMptQWPk3frKLs?=
 =?us-ascii?Q?MOwpbHnzcQErQzNbDB1cNFqW2EFIQjvEE94Kq6ap4wgUo9M0cOLn2dEEZ4Aq?=
 =?us-ascii?Q?ucUITetRgRUo2dtwxcQkmYk4Z8niH8Edmn7riv1BQxM2T1oFnPVFE0Z9X1Kx?=
 =?us-ascii?Q?to39oow+/29wPBgjkBHg7HRwGfGKpIf1tvTj4LZp06jfqxUAWFkiQ6NeiPsi?=
 =?us-ascii?Q?FI3SGPpb87/RqzKYPp6ZSVQVlNx4ukTFW6zXpagChW5rHT08JbjXwcdR4SLz?=
 =?us-ascii?Q?5KGkHuHIXCLILhCg99gwE+ZsdsaSbSBP1gIZIqSmr9AS5kErMTCEjiEfDEuP?=
 =?us-ascii?Q?7ulCotgLSD54BqjYfeVmkOwXbyyGCCF0xdUqEF6S2eGBBrbMYVL6B5aeb4+k?=
 =?us-ascii?Q?6rNcHAuXE3RYrGxrU8s8H58IRtjyY8a+sXZ6C16iKBsJb8qQRZK7JFmcDjsp?=
 =?us-ascii?Q?xiwnbMUos1qtdSY0bdHOemeb9f5Ra/zvdL8Bv09rbzR5h0VmTGudNR/UBrUq?=
 =?us-ascii?Q?Im1UXm7NsMc3gDl3Rx0O7F4mdcvaYeDqbsI3eVYrHXird6wf5yjaKPtWSI4l?=
 =?us-ascii?Q?i66XDdwDCwZQbGeXVnyEWBMd4yMp9cctWRtHmfv4vqpDsBGhByPJPixQc0Wx?=
 =?us-ascii?Q?/ZKIS7htKFHN+GBX98jSPiWWnC8ku5l3vUBDD4AynqxuuhttHrW9pqXyXLJA?=
 =?us-ascii?Q?dnFyGi8huHHNMuayI6Xi0CmjAEiVGMKFQcwW7astNpZXrK/GX6huMntRTHQs?=
 =?us-ascii?Q?2OtnApwO2KNCgsHyRrwCUg83YJGq1ImAVVheFNGIoArp/gotA8xLxlCwtF9y?=
 =?us-ascii?Q?j0V3742QjVfWgjF2R36+OSG63teJwbZJtbMHAb2rGwHVVsQLzC/IiHqjKhfr?=
 =?us-ascii?Q?bzSPtO2Y6e8f0q26QUjJmof/bPdvG2OOx7LWaQC17gjpBLrXD3JYafDXn3lb?=
 =?us-ascii?Q?qIzTf3Oto1Ro5eN/GIgxWPHTMwGTP4WL6lMm0ql7/XIPPK3ozPHpgCsuvriE?=
 =?us-ascii?Q?WptwLxWrRamdJVEGv2XVn1JNNWZC6uTp8qZvMeldmsssMkaa0TiFfFNgKIuI?=
 =?us-ascii?Q?Jl5al6nhB5Ti+baMtOCpfJk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E169A8AC52D69548873AF603C3E46124@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR01MB7906.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb221466-7a6b-492c-291f-08dd4cc28d86
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 06:41:03.8182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xPzqzHENqucgB0cIJRLbRfcp4HnSzCRKZVE37aYJ/OKmTkW0XB+1ndQEFTGxBGNEIYU1QYneS5o8dENw9G9tsbrYVd94y+11XDVQ0st01Txiyh7Ov1TAD8U8oEqL3VKc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR01MB7658
X-Spam-Status: No, score=0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FROM,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Hieu Le OS <lhieu@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks Andrew for your feedback. Please see my comment inline

> On 14 Feb 2025, at 12:23, Andrew Jeffery <andrew@codeconstruct.com.au> wr=
ote:
>=20
> On Thu, 2025-02-13 at 04:17 +0000, Thang Nguyen OS wrote:
>> Hi Andrew Geissler,
>> Attachment is the updated schedule A of CCLA from Ampere.
>>=20
>> Please help review.
>>=20
>> Note that Hieu Le will replace me as Ampere CLA Manager. I will check
>> with you in Discord to change maintainer access from me to Hieu for
>> what I am handling (openbmc/meta-ampere and ampere-ipmi-oem,
>> ssifbridge).
>=20
> I don't have concerns with Hieu replacing you as CLA manager, however
> the expectations are different for maintenance roles. Background here:
>=20
> https://github.com/openbmc/docs/blob/master/community-membership.md
>=20
> Specifically:
>=20
> * https://github.com/openbmc/docs/blob/master/community-
>   membership.md#platform-maintainer
> * https://github.com/openbmc/docs/blob/master/community-
>   membership.md#subproject-owner
>=20
> openbmc/meta-ampere still has Thu as maintainer, ampere-ipmi-oem has
> Dung, and ssifbridge still has Chuong. These won't become unmaintained.
Actually, Chuong changed to another role in Ampere before so I am the one w=
ho reviewed and merged changes in ssifbridge so far.
Dung is inactive in ampere-ipmi-oem also.
>=20
> Hieu should be subject to the expectations outlined in the community
> membership document, as everyone else is. Currently Hieu has few
> changes pushed to Gerrit.
Do you think I should update the Ampere CCLA to add me as member again so t=
hat I will continue to maintain these repos until Hieu satisfies requiremen=
ts?
> Working through the process is an important demonstration of alignment
> with community norms and values. It takes time. It protects the project
> and community. It is what provides social and technical stability.
>=20
> Andrew
>=20

