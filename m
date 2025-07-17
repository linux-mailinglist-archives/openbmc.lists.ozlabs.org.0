Return-Path: <openbmc+bounces-378-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A03EFB09875
	for <lists+openbmc@lfdr.de>; Fri, 18 Jul 2025 01:45:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjqLC4lLKz30RK;
	Fri, 18 Jul 2025 09:45:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=67.231.145.42 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752786676;
	cv=pass; b=Gzrvk7MYdQAfl/+i9agshtM+kFxJYvKTnvgvcDfBIorl/sPPjHjG3YCe+ZFJWbziDPKoIPSdNL8HtW4kwQTEYInApGTT8xixKSXGl1h4CLWtKbJUxbAjKRXLXL8h2Nf9Er7sYS9EvgnCe3nZ1wI0MapDP+Oodoged2T0XZ+pZBiavKnwKfjPO7aimPnBstVBsYOW1PItf0/x0NjQvm2soZ9Jg2wwFvghaPi/0f9T7af5YJwthNZyeAlmNYDTe6q+lwx6RsiK8DK7LJr45BnHZtdJ7ZcZEnkJYSSCm/xjVWaMUys1CUBb64HXxgX6/O8GRDDEGUxZIf7cuK7u3bVr/w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752786676; c=relaxed/relaxed;
	bh=dpxyc6subHfgHCDhbl3NJz2l9kxTFjqnRDKEhy7aqbs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HLzK9iGSybMERSkVjx/HiXvVrtD93Nyx2WfQ4yQQTzl533nhdHLRRyl8PV3KnNpt5YSLfy7yUt/oLfQPPq1cB9ciRS/pC5viVXAahjSVzIbTLEVY7ikcHdDWvwIYRX8C+ygMy+AuB/xJbOmw1re7yJY9Ypi30pIspEcTWNZzEjxzu8kaIISkidGc2pL49dA1tnjyPuy5zJ67DJ24xZa7Ky2Oju9xYy0cNY2z3IC2eQeSpeGVJtntJPesO9d8uplizo6Ay2t2vYhH2hQqXn1i7bFFLLK7tAt5P7abD0/JxipyfqjteG+YqI6xLHgaPzPuFiCOH/2nWHXttDCl5ljQhQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=meta.com; dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=s2048-2025-q2 header.b=I9gtoPyQ; dkim-atps=neutral; spf=pass (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com; envelope-from=prvs=32939e8aa3=amithash@meta.com; receiver=lists.ozlabs.org) smtp.mailfrom=meta.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=s2048-2025-q2 header.b=I9gtoPyQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=meta.com (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com; envelope-from=prvs=32939e8aa3=amithash@meta.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 612 seconds by postgrey-1.37 at boromir; Fri, 18 Jul 2025 07:11:14 AEST
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjlw21qDpz2yPd
	for <openbmc@lists.ozlabs.org>; Fri, 18 Jul 2025 07:11:13 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HKTBrh023033;
	Thu, 17 Jul 2025 14:00:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=s2048-2025-q2; bh=dpxyc6subHfgHCDhbl3N
	Jz2l9kxTFjqnRDKEhy7aqbs=; b=I9gtoPyQWlQgKdoCyMybClZcSlob/TiJgJ/5
	RiHBHR3Lwjwfv0czSUXsAQyqT6Vn2BAEzYI9dSCn5yD5m0Y2YoOySUlVBQJ2t/7w
	hJUxaNeSY2IYELJHSWeWnZDHCkueuXettFNyKe8FSCoB4lyZ3pkqrlRtX2gguveD
	vnIUYZyNGv3t2LLSW5BeloWC5upo5+jRgji0gEd0zL93d0CGlVZG6caEWm3wY/pK
	4w6xUam+/WFZSRgUetZNadtwcuCfJLLHNDhT45rphKtqOb/oXQEmS5o9zzwimSwA
	OC1fTrvUAc3mEBLnUrjvqsQiPVKhhxacgKm2ylPgeKP/HbtzRA==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2066.outbound.protection.outlook.com [40.107.102.66])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 47y2tpua6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 14:00:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSJ0LFn4Fx0KtHfmKejH8pRO1faZSLM4A1bPv3D7nhWBm5Q2wd9aec0XX4P4b5qc/9WiDcmx36tquYKnyHSdor0GaDmvIAoT+DSWbQtDzjw+tYJX7uvlUq8PMv5b8rVY5bAp3AhlTiWSU1sSf0H2tYzW6POwRcmgEkYn6Fk/FKbzQV1eSuAhb4CA8Yz87ZdjwbuFQ8+yi1xYBZZ7gSL6QXbyidBOaX2eG6d5nkcVmiGEv+PTJ/Uk+7UqFYPLg6rpW5fis9MQX55g2VRUbqLJogl61/1ogFxL1PlS/63UxDH7Pt/hwzeo1s87L1HzLlrN41PqqqaiEwonVytoRy3VQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpxyc6subHfgHCDhbl3NJz2l9kxTFjqnRDKEhy7aqbs=;
 b=KuqLckm6jbmOpMMIbzhF5tkBBdkz3SR+aDYfBAAGJ+K/qg8e5wCvQ4qIjKUsRY0xseX9agfJFRkik+1PpkeAyFl1Sq+NJdeRA/J7/aOk+7O9sauvtgxaj5XVzR1ZpFsZDul75mjuLHXLc/YCB9hjmd3Utv425WvOyEeeH6AIp3YZJQE95T7vIqsUXlUP8x2CvLpilwUsvYKqa47Vi4fMpDSg8Jr/YwuzDP7k4TL6UXsfXa6ZuGXUMJNMrewOyxlXzCBKL8Z/aUlvljXk3LNCxc1x/JmTQUuWO3Xo9s3Yui08w1THLeVC1MMrm74/tEmKWExPAA82vpp30rwFVkiZ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from SJ2PR15MB5801.namprd15.prod.outlook.com (2603:10b6:a03:4f7::19)
 by PH0PR15MB4368.namprd15.prod.outlook.com (2603:10b6:510:9e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 21:00:51 +0000
Received: from SJ2PR15MB5801.namprd15.prod.outlook.com
 ([fe80::349c:882f:cf5d:277]) by SJ2PR15MB5801.namprd15.prod.outlook.com
 ([fe80::349c:882f:cf5d:277%4]) with mapi id 15.20.8922.028; Thu, 17 Jul 2025
 21:00:51 +0000
From: Amithash Prasad <amithash@meta.com>
To: Patrick Williams <patrick@stwcx.xyz>
CC: LF/OpenBMC Mailing List <openbmc@lists.ozlabs.org>,
        "wangkuiying.wky@alibaba-inc.com" <wangkuiying.wky@alibaba-inc.com>,
        "zhikui.ren@intel.com" <zhikui.ren@intel.com>
Subject: Re: [RFC] Special handlers for post-codes
Thread-Topic: [RFC] Special handlers for post-codes
Thread-Index: AQHb0QSfVVHXBd5MHUOspWVkytX9s7PrKGsAgEvrE8Q=
Date: Thu, 17 Jul 2025 21:00:51 +0000
Message-ID:
 <SJ2PR15MB58012F2971D9B6F441A4A3E4AB51A@SJ2PR15MB5801.namprd15.prod.outlook.com>
References:
 <SJ2PR15MB5801C8B07E960251A53DDF98AB61A@SJ2PR15MB5801.namprd15.prod.outlook.com>
 <aDmv-MAXX2QFsLlp@heinlein>
In-Reply-To: <aDmv-MAXX2QFsLlp@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR15MB5801:EE_|PH0PR15MB4368:EE_
x-ms-office365-filtering-correlation-id: 5ad7221e-259e-47e8-e6fa-08ddc5750379
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|8096899003|38070700018|13003099007;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?TsUJsiKAaTvZpUhnNfq5BAhXE+cohU3uiN8+39g7vK5NoMvce2Wox1DO?=
 =?Windows-1252?Q?kyRMhgA4f3NylVh/nzQrd4P3Gq9utdXTHtBRlm6wWk+wVHq6o5s1ikvI?=
 =?Windows-1252?Q?GDlIU7zL/t84vjL/eyYB6Uj2UYGP1BHQd0fycmgxhnYfio8eA7c6/DSi?=
 =?Windows-1252?Q?4P50XQLAaQaKkapMB9+mUR+Cr5tV3EIcgH004NUWHqIxED+sxRGnPIBB?=
 =?Windows-1252?Q?jOT4+sMB4GYCnSX3fckXYN3w1Qrrb9oeU9CxNuZUoyENyk4rXeTnhbe0?=
 =?Windows-1252?Q?xG+okMPM/GelOMhmfHrrbzsQo+fPF9GLcAYY5B0We2V6mbGhJxcQQzSI?=
 =?Windows-1252?Q?Jml7BFmhZE4U7pcqL8LOm8OoL/8aGjs6XQwzRC+fvncHyrgOjfNx7+vo?=
 =?Windows-1252?Q?WWcFLWTGI3NnYik5p7Q/e/8adsvbVbhGzfqDKz+lhHiq7VhwTZq5Hdhe?=
 =?Windows-1252?Q?i27Ky2iBm3kDxwJrH+y4GggashGDslyPr7QUrW4Hy2aJ6OrH2IRjj45i?=
 =?Windows-1252?Q?YXrJUGXGTpCwVZzhjemY543LP+WhFQEOfT6a7bP5t225f9NXKelSpSMw?=
 =?Windows-1252?Q?zd6SgClPSJmFu60PFpmM8p1n+su+LWF7khuc3wVkIqHXRlQWQR+eIWCo?=
 =?Windows-1252?Q?xDkPwm7I8IX3n2pJJko9OPHIRzk4kTbvrnh+2JdxX1qX7WabQNguEbar?=
 =?Windows-1252?Q?WF5Wu+RivohNKUM18GRxv+Bor3URr4L9EqPhPV/pWyLKCByShiApKpAN?=
 =?Windows-1252?Q?8LHEH6fgVn8s0NkOlwUxF4OXV/7iIzCmi8ee9WxaZJeROtdjuGwUhEKk?=
 =?Windows-1252?Q?+RGq9DQgl9//6CkWgKGD1C2Cm4lbNi4TqcxgnC/ExHeU0Al47aGd6ok3?=
 =?Windows-1252?Q?NnWr83YsNKbiTCF1A82VL3upBjIBcVmzcDI59oKacbpVM+VoflcjTkRM?=
 =?Windows-1252?Q?APuipeD0smmxDfrhnX7TSiV+JRRRrRYW9PSCmKr637mTWfhd8pVZKG9h?=
 =?Windows-1252?Q?XjRI+WMqPVzekZmxdcRTERjI9P0y4FRDMSmPEaVN/Z+yOtySMrjOihs+?=
 =?Windows-1252?Q?YKFhW6nJq7d3Fbxk6GUcqRFaAhFCm8v4zmUigZlceH2ycaQjw1TNR8L6?=
 =?Windows-1252?Q?R0IHoLtz4oAkPuXIM/hSb+VwRF+NuedCxKeu8EuvjOa6pdzVRQqy7F+v?=
 =?Windows-1252?Q?sz+RLuKe4q1gALxdpT8BeHBJRrFq9WskQcesbJJmKLltITK6h+EefnjT?=
 =?Windows-1252?Q?fV85TajVb3swiNac3aMmchVUDTSgjo1t/CEwIIX1pAUlFj7Y2qra6I6l?=
 =?Windows-1252?Q?jwsOwd9cBaYwXKY9F1O3Sj9Sq04UCoyJN7HQrGUheWzoKVLUBrGHzHnO?=
 =?Windows-1252?Q?fdUYuHPJkPCUQjYCS41tcrRTG89KjD8EFLXXlEuVSmryPNauSrT4nosn?=
 =?Windows-1252?Q?AJgT4cmjS90fOwqUqKMJKvv6sj5w/H8S9RoCnMRoNgQhW+O+GjU0rzmy?=
 =?Windows-1252?Q?HpKyIt/+2HLY60KHD1rgJXsUVA4vRxS2Oq3BBE43bO+pPI6eano=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR15MB5801.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?82AuQxt8GM1NTMx2H2qe/w0ow9RM30w2w6Lwb2diiWoXBZW90+GbnMyB?=
 =?Windows-1252?Q?LDsRlPOfds48P6zjPSG92uouqTEH7s8kuWM5YW61QyKlEm3izy3T5lMS?=
 =?Windows-1252?Q?o1kGqQs/W8+XmxD9Bw6qMh1s/HHyFdLrJ1FOwtgTyKChQFr67lJ0IozA?=
 =?Windows-1252?Q?FIsUYKI+l5Q3xG4z5Uk8jpqZtqwW4mYxQEO2y5xQrNkOcw1pBESYnSTq?=
 =?Windows-1252?Q?8I16lONskRxDsmm3LDcR+NMIQrWGn4PS1RsaZqya0Lmb1FJ6aWbOKqBf?=
 =?Windows-1252?Q?KzUdgDttwC4skvdm2k3FS+AP3HOv5gk7l8qyfkT4zaBJymFOujS040k/?=
 =?Windows-1252?Q?45P7xYROoSQavJQnBrUhOFqJ2xTfmiceg2w9CHy052IrsucLcIP9vEYY?=
 =?Windows-1252?Q?/48b388TzTrU2x3D6h0OPK987OWDtL1QnSdsNu/VfxGdVDZpPo1gHloi?=
 =?Windows-1252?Q?/4QIgsMyiZjTeHJxUecsDpTL/6FU3dkllZ+G+up47udOkcnrYhkXnfkT?=
 =?Windows-1252?Q?Vor8PQDMZhRJL+eNm9khi9QYFFvEStwPm6ConZn6p5bD9lVB0z7rifWX?=
 =?Windows-1252?Q?Thi0sHs4dJq3f93Df4t09mrnyISXBBUDHKr111IlbDiRJ3Q0jl7P+HkN?=
 =?Windows-1252?Q?RbWFtQgDhVe7Hfi3fmBep0k/2TtBG7+BXTjbJDPVO4Fwgsa70bHJTa7j?=
 =?Windows-1252?Q?qd4LwFbLsR2YcBuldYZY3wuxF60eLgIAZ5+Dvw4qrR8703Y8grUSNEIU?=
 =?Windows-1252?Q?CeTzHgacxjRdqbSpmkFu7U2IJ61n1F8RLWwsbjVv8agtE2sQOCrSsNb+?=
 =?Windows-1252?Q?TPhjRTDLScB2U73CWkoTlRGJaiee1Aeu0688nW8MZ7rGxTMTp96CSTE+?=
 =?Windows-1252?Q?5Y8fK3CoHBlHTDPrWfmZKEMQgChHS3af9+jm1eVnOrdqmul1+BxUs/8N?=
 =?Windows-1252?Q?ydsQ4P44EXAOGDjQq6QiC4xzjE7UtZzVjmN0V30mEVRG0lzqx+ElqjFc?=
 =?Windows-1252?Q?/2fUbFKQHPlZ7Q5iv+AE0IPyTjQirm4kwttiSxHc5PPE0VUyM9MFjSOp?=
 =?Windows-1252?Q?EGbrIdlrTVs55clmSRlbFRgRtxfIZsPRTKGbmddToP1gJRgrsptFy160?=
 =?Windows-1252?Q?qo5GtdtdnPsGk23oG7j76/Kb6PdsmvRaDIFNeeP7i6F3hNFGYFOBOUGW?=
 =?Windows-1252?Q?gunhfTl6MbRR0LMv+JTvbKXkJIjC+d70+uIKn4x8BAkM38ViRiieqzub?=
 =?Windows-1252?Q?0Vq7sqbhjlIw0evSDwZFpsgIpwm8gQqTBSV6n15tCCYNV2NS8/693mxN?=
 =?Windows-1252?Q?ymE2MnIR+SwqN8RF1fcTRTOonYoo6mtU0mVb85Dm1lIDtXzE/wOQWbTG?=
 =?Windows-1252?Q?0/PQslRiEySFaLe3rH/Znlk6fu2Aoo09HnQav0a7pzhMG/kS5aTrqrbB?=
 =?Windows-1252?Q?NGjdGYmFLfAwASCr2nuxaZehHcsWS8SJpUmJiKsKpjAfF2rAh87NqcJq?=
 =?Windows-1252?Q?mYrpT9soK4grWaSUjQsQ0BOKOFmN26QSObzQV1cZhL6YtXlYBBUyuhhK?=
 =?Windows-1252?Q?2Vy3WP+83tK6pEl1YZe1OdCYCEj/sttZxrBnc/zZQN5kI4LQrRqockEn?=
 =?Windows-1252?Q?skSjFXe1fwwpE5H0PuXq1CWTX5J1j+s32efdyhlzQsaE/NEkEoDBbLua?=
 =?Windows-1252?Q?hT/bTpOzhe4=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SJ2PR15MB58012F2971D9B6F441A4A3E4AB51ASJ2PR15MB5801namp_"
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR15MB5801.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad7221e-259e-47e8-e6fa-08ddc5750379
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 21:00:51.6432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t6HzdQE5WIOsaUD2e1in6vVVj/Vs4dXI84i2eiVCOwf7SzdCZgowNUYUiL9ddQF6KMto553SLHKfVj0mM5RaKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR15MB4368
X-Authority-Analysis: v=2.4 cv=fu/cZE4f c=1 sm=1 tr=0 ts=68796486 cx=c_pps a=spteiRe5ZLpjmnuUvY+Cag==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=8pif782wAAAA:8 a=V4zo2IF0AAAA:8 a=QyXUC8HyAAAA:8 a=1T2raVcwGC9rh38Ztj8A:9 a=pILNOxqGKmIA:10 a=DUQptC5jfCLC3cuk:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
X-Proofpoint-GUID: WlpZwpmUZQURQ9h1zvA8b76EbYRvhAL6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE4NSBTYWx0ZWRfX73FPuY+3/zm8 MKocW1uHNX2VcXDv06iyskuWcSwH2RanDxYWwWxoUcmk694vEdCIaO8oe/o4QhAeMrANYHCDNqQ 2KjQSj9hOaqXiRwZgHuXro0+sVRopNjtvIuMo7XQTWAVWzhaty4VrGzjaLWwYyu8SMTy+9GldV/
 KYu/tLnNMENNB7uZYDPGbLVZgLkJgty4IYmTkM3Yu/6Xpo/QG1lqHt/f6dO9AiYrnhyXmT+CbvN jxbZnmmS5IdwFHnDFeelp6/aLThy15vgBtvX6LYRR41T3+DjQeXProiuaddCJrjTNisUAoLRfQw ScqyWB/qcV0BeHq+yQb66pXWpYA4BmNbbxvEKYthhNzFC/cQm/kcbNnYQjgaRTBZZkkRqlTR/SV
 w9WPqQXDTxcxalTyB9OuJXQa/j6mAXYbXYXPulrE8Fi6mMPhrSF7+WOJtDFSo8UHpjJyCIA9
X-Proofpoint-ORIG-GUID: WlpZwpmUZQURQ9h1zvA8b76EbYRvhAL6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_04,2025-07-17_02,2025-03-28_01
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--_000_SJ2PR15MB58012F2971D9B6F441A4A3E4AB51ASJ2PR15MB5801namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>> I don't think this needs to be solved immediately but "which processor
>> type is installed in a socket" is not necessarily fixed.  For example,
>> AMD socket SP5[1] supports both "Genoa" and "Bergamo" processor variants=
,
>> which could require different post code handling.  There is little
>> reason why a system with an SP5 socket couldn't have a BMC that should
>> be able to handle both Genoa and Bergamo chips.

Agree with the general direction. We would need to accomplish a couple thin=
gs before we get here.

  1.
We would need EM or other runtime detection of CPU types.
  2.
Also to extend your example, I would not be surprised if Genoa and Bergamo =
are more similar than different. So, having different handler JSONs would m=
ean they might be more alike than different. But, we can do that optimizati=
on when we cross that bridge.
  3.
I believe there are post codes defined by system software (BIOS) vendors in=
 addition to CPU vendors. I would not be surprised if there are additional =
codes which are then OEM defined. This might need platform layer extensions=
 because I would be surprised if there are universally consistent.

At the moment, I think we can go with machine owners packaging the configur=
ation in their meta-layer while the nuances are developed for CPU type dete=
ction along with handling of SW/OEM bits.

>> Please add a name and/or description field.
>> I don't think we should do conversion to decimal just to make it JSON-na=
tive; optimize for humans and (especially) reviewers.

Ah yes, this will make it easy to review and the configuration more human r=
eadable. I will go ahead and push updates to change this (Add name, descrip=
tion fields and convert the primary/secondary to hex strings).

>> I'd like to see a jsonschema validation of whatever the config ends up b=
eing

Yes. This will really help catch a lot of things at compile time.

>> You should also consider how multi-host systems, like yosemite4, might b=
e handled here.

+1. I was thinking of extending the code to use magic fields in the configu=
ration for the service to insert the "host" index.
Is there a general common approach taken for this by other services? I see =
EM uses $ to indicate variables.
Example:
```
"arguments": {
"POWER_RAIL": "/path/to/host$HOST",
```

>> Why do we need to be able to trigger custom systemd services?

I was considering cases certain platforms could do some platform specific d=
ebug collection when they receive certain post-code.


Thanks,

Amithash

________________________________
From: Patrick Williams
Sent: Friday, May 30, 2025 6:17 AM
To: Amithash Prasad
Cc: LF/OpenBMC Mailing List; wangkuiying.wky@alibaba-inc.com; zhikui.ren@in=
tel.com
Subject: Re: [RFC] Special handlers for post-codes

On Fri, May 30, 2025 at 02:02:20AM +0000, Amithash Prasad wrote:
> Hello,
>
> There are many occasions when a post code from a server actually means so=
mething is wrong =97 especially crucial if a boot failure occurs before the=
 part of the system firmware capable of sending a SEL to the BMC is loaded.=
 To support this, I am proposing enhancing phosphor-post-code-mfg to suppor=
t configurable special handling of post codes.

Thanks, this looks like interesting work.  I know some processors that
have magic postcodes that mean things like memory training has failed.

How do you anticipate these configurations are managed?  I see 3
options:

    1. People add them to their meta-layer for a particular machine
       and/or processor.

    2. The configuration files are part of phosphor-post-code-manager
       (and enabled via CompatibleHardware matching from entity-manager?).

    3. The configuration is part of the entity-manager config instead.

My initial impression is that we have two different kinds of configs:

    - Configuration that is entirely processor dependent; any system
      using a particular processor version will have the same postcode
      handling.

    - Configuration that is vendor / BIOS / machine specific.

For configuration that is processor dependent, install option (1) does
not seem like a good direction, since it means we're going to be
duplicating this work.  I would lean towards option (2) here, but you
probably need a method to load multiple configs: "processor.json" and
"system.json".

I don't think this needs to be solved immediately but "which processor
type is installed in a socket" is not necessarily fixed.  For example,
AMD socket SP5[1] supports both "Genoa" and "Bergamo" processor variants,
which could require different post code handling.  There is little
reason why a system with an SP5 socket couldn't have a BMC that should
be able to handle both Genoa and Bergamo chips.

>
> Example configuration:
> [
>   {

Please add a name and/or description field.

>     "primary": [123],
>     "secondary": [234, 123],

This is a bit awkward to me; you should probably look at what
entity-manager does.  People tend to think of postcodes as hex and not
decimal.  I don't think we should do conversion to decimal just to make
it JSON-native; optimize for humans and (especially) reviewers.

>     "targets": ["my_special.service"]

Why do we need to be able to trigger custom systemd services?  This
isn't clear.  To me, this starts to cause the configs to be system
specific, which is far less ideal.

I'd rather see some well-defined "actions" like "catastrophic failure
that requires a server reboot".

You should also consider how multi-host systems, like yosemite4, might
be handled here.  We will have multiple instances of phosphor-post-code-man=
ager
running, one for each host.  If you do have systemd targets, they have
to be templated.

>   },
>   {
>     "primary": [999],
>     "targets": ["power_failure.service"],
>     "event": {
>       "name": "xyz.openbmc_project.State.Power.PowerRailFault",
>       "arguments": {
>           "POWER_RAIL": "MyDevice",
>           "FAILURE_DATA": ""
>       }
>     }
>   }
> ]
>

I'd like to see a jsonschema validation of whatever the config ends up
being.  We do that in at least entity-manager and sdbusplus if you need
examples (EM uses JSON for the schema, sdbusplus uses YAML).

> I would love to get feedback before I continue down this path.
>
>
> Thanks,
>
> Amithash

[1]: https://en.wikipedia.org/wiki/Socket_SP5

--
Patrick Williams

--_000_SJ2PR15MB58012F2971D9B6F441A4A3E4AB51ASJ2PR15MB5801namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&gt;&gt; I don't think this needs to be solved immediately but &quot;which =
processor</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&gt;&gt; type is installed in a socket&quot; is not necessarily fixed. &nbs=
p;For example,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&gt;&gt; AMD socket SP5[1] supports both &quot;Genoa&quot; and &quot;Bergam=
o&quot; processor variants,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&gt;&gt; which could require different post code handling. &nbsp;There is l=
ittle</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&gt;&gt; reason why a system with an SP5 socket couldn't have a BMC that sh=
ould</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&gt;&gt; be able to handle both Genoa and Bergamo chips.</div>
<div class=3D"elementToProof" id=3D"Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Agree with the general direction. We would need to accomplish a couple thin=
gs before we get here.</div>
<ol style=3D"margin-top: 0px; margin-bottom: 0px;" data-editing-info=3D"{&q=
uot;applyListStyleFromLevel&quot;:false,&quot;orderedStyleType&quot;:4}" st=
art=3D"1">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); list-s=
tyle-type: &quot;(1) &quot;;">
<div role=3D"presentation" class=3D"elementToProof">We would need EM or oth=
er runtime detection of CPU types.</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); l=
ist-style-type: &quot;(2) &quot;;">
<div role=3D"presentation" class=3D"elementToProof">Also to extend your exa=
mple, I would not be surprised if Genoa and Bergamo are more similar than d=
ifferent. So, having different handler JSONs would mean they might be more =
alike than different. But, we can do
 that optimization when we cross that bridge.</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); l=
ist-style-type: &quot;(3) &quot;;">
<div role=3D"presentation" class=3D"elementToProof">I believe there are pos=
t codes defined by system software (BIOS) vendors in addition to CPU vendor=
s. I would not be surprised if there are additional codes which are then OE=
M defined. This might need platform
 layer extensions because I would be surprised if there are universally con=
sistent.</div>
</li></ol>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
At the moment, I think we can go with machine owners packaging the configur=
ation in their meta-layer while the nuances are developed for CPU type dete=
ction along with handling of SW/OEM bits.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&gt;&gt; Please add a name and/or description field.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&gt;&gt; I don't think we should do conversion to decimal just to make it J=
SON-native; optimize for humans and (especially) reviewers.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Ah yes, this will make it easy to review and the configuration more human r=
eadable. I will go ahead and push updates to change this (Add name, descrip=
tion fields and convert the primary/secondary to hex strings).</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&gt;&gt; I'd like to see a jsonschema validation of whatever the config end=
s up being</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Yes. This will really help catch a lot of things at compile time.&nbsp;</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&gt;&gt; You should also consider how multi-host systems, like yosemite4, m=
ight be handled here.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
+1. I was thinking of extending the code to use magic fields in the configu=
ration for the service to insert the &quot;host&quot; index.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Is there a general common approach taken for this by other services? I see =
EM uses $ to indicate variables.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Example:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
```</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&quot;arguments&quot;: {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&quot;POWER_RAIL&quot;: &quot;/path/to/host$HOST&quot;,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
```</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&gt;&gt; Why do we need to be able to trigger custom systemd services?</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I was considering cases certain platforms could do some platform specific d=
ebug collection when they receive certain post-code.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div class=3D"elementToProof" id=3D"divtagdefaultwrapper">
<p style=3D"direction: ltr; margin-top: 0px; margin-bottom: 0px;" class=3D"=
elementToProof">
<span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">Thanks,</span></p>
<p style=3D"direction: ltr; margin-top: 0px; margin-bottom: 0px;" class=3D"=
elementToProof">
<span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">Amithash</span></p>
</div>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Patrick Williams<br>
<b>Sent:</b>&nbsp;Friday, May 30, 2025 6:17 AM<br>
<b>To:</b>&nbsp;Amithash Prasad<br>
<b>Cc:</b>&nbsp;LF/OpenBMC Mailing List; wangkuiying.wky@alibaba-inc.com; z=
hikui.ren@intel.com<br>
<b>Subject:</b>&nbsp;Re: [RFC] Special handlers for post-codes </div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">On Fri, May 30, 20=
25 at 02:02:20AM +0000, Amithash Prasad wrote:<br>
&gt; Hello,<br>
&gt;<br>
&gt; There are many occasions when a post code from a server actually means=
 something is wrong =97 especially crucial if a boot failure occurs before =
the part of the system firmware capable of sending a SEL to the BMC is load=
ed. To support this, I am proposing enhancing
 phosphor-post-code-mfg to support configurable special handling of post co=
des.<br>
<br>
Thanks, this looks like interesting work.&nbsp; I know some processors that=
<br>
have magic postcodes that mean things like memory training has failed.<br>
<br>
How do you anticipate these configurations are managed?&nbsp; I see 3<br>
options:<br>
<br>
&nbsp;&nbsp;&nbsp; 1. People add them to their meta-layer for a particular =
machine<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and/or processor.<br>
<br>
&nbsp;&nbsp;&nbsp; 2. The configuration files are part of phosphor-post-cod=
e-manager<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (and enabled via CompatibleHardware ma=
tching from entity-manager?).<br>
<br>
&nbsp;&nbsp;&nbsp; 3. The configuration is part of the entity-manager confi=
g instead.<br>
<br>
My initial impression is that we have two different kinds of configs:<br>
<br>
&nbsp;&nbsp;&nbsp; - Configuration that is entirely processor dependent; an=
y system<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; using a particular processor version will ha=
ve the same postcode<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handling.<br>
<br>
&nbsp;&nbsp;&nbsp; - Configuration that is vendor / BIOS / machine specific=
.<br>
<br>
For configuration that is processor dependent, install option (1) does<br>
not seem like a good direction, since it means we're going to be<br>
duplicating this work.&nbsp; I would lean towards option (2) here, but you<=
br>
probably need a method to load multiple configs: &quot;processor.json&quot;=
 and<br>
&quot;system.json&quot;.<br>
<br>
I don't think this needs to be solved immediately but &quot;which processor=
<br>
type is installed in a socket&quot; is not necessarily fixed.&nbsp; For exa=
mple,<br>
AMD socket SP5[1] supports both &quot;Genoa&quot; and &quot;Bergamo&quot; p=
rocessor variants,<br>
which could require different post code handling.&nbsp; There is little<br>
reason why a system with an SP5 socket couldn't have a BMC that should<br>
be able to handle both Genoa and Bergamo chips.<br>
<br>
&gt;<br>
&gt; Example configuration:<br>
&gt; [<br>
&gt;&nbsp;&nbsp; {<br>
<br>
Please add a name and/or description field.<br>
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;primary&quot;: [123],<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;secondary&quot;: [234, 123],<br>
<br>
This is a bit awkward to me; you should probably look at what<br>
entity-manager does.&nbsp; People tend to think of postcodes as hex and not=
<br>
decimal.&nbsp; I don't think we should do conversion to decimal just to mak=
e<br>
it JSON-native; optimize for humans and (especially) reviewers.<br>
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;targets&quot;: [&quot;my_special.service=
&quot;]<br>
<br>
Why do we need to be able to trigger custom systemd services? &nbsp;This<br=
>
isn't clear.&nbsp; To me, this starts to cause the configs to be system<br>
specific, which is far less ideal.<br>
<br>
I'd rather see some well-defined &quot;actions&quot; like &quot;catastrophi=
c failure<br>
that requires a server reboot&quot;.<br>
<br>
You should also consider how multi-host systems, like yosemite4, might<br>
be handled here.&nbsp; We will have multiple instances of phosphor-post-cod=
e-manager<br>
running, one for each host.&nbsp; If you do have systemd targets, they have=
<br>
to be templated.<br>
<br>
&gt;&nbsp;&nbsp; },<br>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;primary&quot;: [999],<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;targets&quot;: [&quot;power_failure.serv=
ice&quot;],<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;event&quot;: {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;name&quot;: &quot;xyz.openbm=
c_project.State.Power.PowerRailFault&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;arguments&quot;: {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;POWE=
R_RAIL&quot;: &quot;MyDevice&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;FAIL=
URE_DATA&quot;: &quot;&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; }<br>
&gt; ]<br>
&gt;<br>
<br>
I'd like to see a jsonschema validation of whatever the config ends up<br>
being.&nbsp; We do that in at least entity-manager and sdbusplus if you nee=
d<br>
examples (EM uses JSON for the schema, sdbusplus uses YAML).<br>
<br>
&gt; I would love to get feedback before I continue down this path.<br>
&gt;<br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt; Amithash<br>
<br>
[1]: <a data-auth=3D"NotApplicable" rel=3D"noopener noreferrer" class=3D"OW=
AAutoLink" id=3D"OWA224d2cb8-e1db-8314-2637-4dae9fbc0986" target=3D"_blank"=
 href=3D"https://en.wikipedia.org/wiki/Socket_SP5">
https://en.wikipedia.org/wiki/Socket_SP5</a><br>
<br>
--<br>
Patrick Williams<br>
</div>
</body>
</html>

--_000_SJ2PR15MB58012F2971D9B6F441A4A3E4AB51ASJ2PR15MB5801namp_--

