Return-Path: <openbmc+bounces-1023-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F03B9CBC3B6
	for <lists+openbmc@lfdr.de>; Mon, 15 Dec 2025 03:11:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dV3St2VmBz2yDk;
	Mon, 15 Dec 2025 13:11:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=67.231.145.42 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765577699;
	cv=pass; b=iksiwucom7AVEKZ4ifhdiPwA2bDwlrE2i6a9KWY8d/ZbWRVBsF4QWqZcRbuCq+NOMll7x4dPuuKrLX73/pneg2D3sIr/bboRezrQ3t1kQ7NOv9mpDNGVSg9LL9NuM6wFOHL1+4j2z5fvsC8tqcxOQRGrM/XKtcG1ZKCszhxtGErkC267h7ofrC+uDAVraFImTt4CeDgcL/etyyLjfu2CiJ85Lj1u9eKfMv/B8S7Dv5VgY9nW8EBS0upT7+vW6Tq7jFBagXhFFmqmNWBWtXi0UurVshf7ytz4nQHjHOay5EANsGHNZoQcgOhyvjvZw2qoslwUwEGeIFHlI9MOr8rSww==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765577699; c=relaxed/relaxed;
	bh=VGvfXAmTd68xEWJ7rk2mL/B57jr1Mo8jmFaLC/OdNrY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=giM6koo0zkiL0HBV9BALWhVlIYsU8Jg8vIZ/au1GIp3dHyoh420eat/HIxLjSG5yaA2J9NzO+nObVQkpjZN8I6dJB9MgJt4lD7KLBCb+BfBWB9p82MtIQp21mfASunPkRL5Sbv1R+B8awDZuPQ2IcK9FE2xqycNTpJm52xFuA5ZT8ih3ZRuitBe/WQGsRgfWwOQu/M1/jHeuEiVyKc9DLEc34YF8FkeeX6Yxs+eDe1RyVRFvuQDS/2/xsu5AsAwBDUd1+FrkZhZmJyeAipyokvo5ryi8symBJk9n1Bm8pbPx1OQhFmekbWZ2xw1MJzwhzkt/cMf5QlBnjAYzudqCHw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=meta.com; dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=s2048-2025-q2 header.b=IuHknUNu; dkim-atps=neutral; spf=pass (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com; envelope-from=prvs=8441df4c41=amithash@meta.com; receiver=lists.ozlabs.org) smtp.mailfrom=meta.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=s2048-2025-q2 header.b=IuHknUNu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=meta.com (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com; envelope-from=prvs=8441df4c41=amithash@meta.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 618 seconds by postgrey-1.37 at boromir; Sat, 13 Dec 2025 09:14:57 AEDT
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dSkKF4nL5z2xpk
	for <openbmc@lists.ozlabs.org>; Sat, 13 Dec 2025 09:14:56 +1100 (AEDT)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BCGJLXY3996816
	for <openbmc@lists.ozlabs.org>; Fri, 12 Dec 2025 14:04:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=s2048-2025-q2; bh=VGvfXAmTd68xEWJ7rk
	2mL/B57jr1Mo8jmFaLC/OdNrY=; b=IuHknUNu1ZagtiRMugoVddi213pvvFl/yB
	dWxpZxzAczmlWUC6NyDJi8Isrp/DZ++1lcWugG4Ni4WtZMlQdwaAKNW2/pCSDMnu
	QvIOZJaknfa1etKC4SlaPlHjQtQP4pnPoBEJmY0mpKAdZGaGiKi7v7lGGrg9Rp89
	HaEaOwMGhB7Afq2jKWRtkpuYzdazdCfiKhxOQLJ3oI03SOe7AS4JxIgoPMvOKfzd
	q34R/MEChYEJHUxKkBZqlToxBAKkdSAAiQDOwpRPGacwGscmrYCuBGO2M9XueFc5
	gd7OqlQTcf3TAsDK4G1oABiHCkKETdXSmA2vo9egt3CFlC1o/irg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013062.outbound.protection.outlook.com [40.93.196.62])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4b0pfe2p1m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 12 Dec 2025 14:04:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1p3/ua6GQBzs5Xdo/Uh6Vfp3pcKAagX/dKc+B2pzeOhEDO17/ozuPoy4ek0NOSE0SulE7TAWgVYJZ9Q2eLf5hbI36f1wJ8cjOUC9I8HoWKA7Y+UiazupKRSAJVQyrjDlEtLiqyTOcXUxg/gVdc1V93Ln9hIkz49JwS3ryHU2YqCLGZQEMl5nIaZFrgqQVAoGgRHLdEzJmZjS3gWsGKEgqkIaEbmQZvwr2C0EL6MxOsh+vfVsuTyCgSuibH/55rKh9GDbgiJ6bvEc4Vq6ZdQ+myvGFFuJcnoCPorySLWbQZNuYzJXYF56gQ+xNnwAGz5RtloR7nfkOzi5XdtJ+dsKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGvfXAmTd68xEWJ7rk2mL/B57jr1Mo8jmFaLC/OdNrY=;
 b=wTLA/rNppga1cP1k3nabxgEXPsA7HI1YGFrdeq/doOVYodknh/yrmsNvVfsXPLKmRN+WLmS16t7nWdjNLVJtC2I4fkccKsM/AqZEsHMWEqkjNVqavo2AJBF/Yip3N5rUft/HFfPJMr5KUJPMknaxa7l+CMAGgbq/rdzsMbhVD+k0RsM8Ij/Au2XrjVjNrfBvP5VImkK9v2Q7Mx/M1bxHvW9uvIXBpbJ6qQ1deBljv6rLy++y8g7XqgIMaor4EjpoYNZtYtumS5KpMVTAMpQe5JsutCB5QjogKtuLwvAHwtiTbPP/WHuun5a2/zbDKozQfoexdLpGjbD1HCxcxc302g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from SJ2PR15MB5801.namprd15.prod.outlook.com (2603:10b6:a03:4f7::19)
 by SA0PR15MB4029.namprd15.prod.outlook.com (2603:10b6:806:83::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 22:04:32 +0000
Received: from SJ2PR15MB5801.namprd15.prod.outlook.com
 ([fe80::349c:882f:cf5d:277]) by SJ2PR15MB5801.namprd15.prod.outlook.com
 ([fe80::349c:882f:cf5d:277%7]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 22:04:31 +0000
From: Amithash Prasad <amithash@meta.com>
To: LF/OpenBMC Mailing List <openbmc@lists.ozlabs.org>
Subject: [RFC] Sensor Value Updated Time
Thread-Topic: [RFC] Sensor Value Updated Time
Thread-Index: AQHca7JqwQfuIGSL+UaCUt+W4yXbaA==
Date: Fri, 12 Dec 2025 22:04:31 +0000
Message-ID:
 <SJ2PR15MB5801CC17FD588B1708D046E9ABAEA@SJ2PR15MB5801.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR15MB5801:EE_|SA0PR15MB4029:EE_
x-ms-office365-filtering-correlation-id: a7247936-a03c-42d2-a017-08de39ca6da9
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?zGAwpbRXpjhEap1irSyOCjWHGCNu5gLjeoeiy/YHSK6InWcwUTzPv3zKoa?=
 =?iso-8859-1?Q?lPgkgEdOLYTVlktMBj3DOV5aEu5XO3nIyDwDTz4dTcY45GvyXTsmKpeUqq?=
 =?iso-8859-1?Q?+qCF70rMS4a9w35gcePbloYxWREqu+Xf5ZLkuoF6AGLdq1h4YwxrhnyNfG?=
 =?iso-8859-1?Q?O58j9486yvByFxrk5J+u1qcTSfm3DeYaamHpjTOGsuTKE/0YKpCgX9qeXr?=
 =?iso-8859-1?Q?iWQT/rs9d7EMTZWcN0mAErQ2wuxML/FD0+WV2bNNlta6316DxK8/kGH1S2?=
 =?iso-8859-1?Q?s4/hgWjmG7Et7G77MCTmZt7vY0gqTKze+DAeOMkHK6+XEYmu6BZ7XG3xbS?=
 =?iso-8859-1?Q?oiD2ef+kd84XTkqUXZGvnM4z1JeVk9fBnVWe9gxgB8GIgoeSsjdTmPJVON?=
 =?iso-8859-1?Q?2Vij2xVuVJ7soXqYk00HaWegvROPQgGhDsHK4vxWceQDaH8N6c/03Dt46P?=
 =?iso-8859-1?Q?LWSU2P6eTtZQYS8TSrvUXznNYi+TGVESuclJxZ7kIo9PrG0ghpDzfJM2p1?=
 =?iso-8859-1?Q?QrM3wpvJc0krshHpa8eIVbKSVaRNmXgIjBNLRueeUUm0WiL+VYHkZOocbV?=
 =?iso-8859-1?Q?yfDDyuzBmMRcmxwt1NzqkAn61P4Tvztm364nraSByy0YbHkSRgKyes1Pcg?=
 =?iso-8859-1?Q?wy5vgbZgOaT5gfefeXncq+SvaT2c/i3E7Uq9uUyPIxvcLMofLrxOGEMAbs?=
 =?iso-8859-1?Q?0MkUIg7QQG4kTiROI6GfS2PHZivVxjsUmYooFm7NQOCwXDdLpmgl7Ny4nR?=
 =?iso-8859-1?Q?1MoBa+ZFogoryfWZhZe9+EooJxMLxApOY8wU+80Eau+GFyIqglhoC+wdkh?=
 =?iso-8859-1?Q?yfSml4l9ZdL1y7EMZLWbnpz5KLoWr8R6G8f1ZNfBD88PH+Yq1IKJii/maa?=
 =?iso-8859-1?Q?3X839ejzetv2bF5WI2SCahnJMrXpwe8a4srZElf1KaQT9NHpb4E6xRd4i6?=
 =?iso-8859-1?Q?ykvESBxNfWskaqJuRqOt4p2zOPPOm8PHq/iCx8ScM0YZ5kvqpnxNtupbGA?=
 =?iso-8859-1?Q?xx1cvBTCYL4yW8+DIU9UvIeza/kQBy7t0YeFRrjPd3yo9ZTvfGtrHyYn2f?=
 =?iso-8859-1?Q?efHd6LNDMhRqHgQaciyy23KiDz0CZ593sMagYuXGV0oxjntrukSroCLS4v?=
 =?iso-8859-1?Q?HHFqpZ6LxnNFNDZo1hQJW4SDMuUlFeL5lHml4BUu8RX8V2FXMwd4Scea+2?=
 =?iso-8859-1?Q?UpAxWO07fp6Oq7vXm5g5tId22tlqMpmFTrkqqbFz0xzrtZ74Dz/eKXq0el?=
 =?iso-8859-1?Q?s56NeS6wNpRk5cRekfoLsB1M4nvvPbTsNk/8eLxeGzxcRx5r3Ho9yQrGzp?=
 =?iso-8859-1?Q?9aGM6b3TrX9NgEAHaghY10MHtYhN+BeUtHpny6X65onmYqnsYoysgkmpD4?=
 =?iso-8859-1?Q?spTdJBvjo92sbi4cjspqv8ui6PrSw3GoLdjuovKkn8WW/fdlOEvcU+6X3H?=
 =?iso-8859-1?Q?4hwfL+yKy8/Tz0SiQa243Z/OxI+6ib4Gqx4V/Qn/6r0NvMiuanf3/CYocQ?=
 =?iso-8859-1?Q?I7ILq4UYfv8iSq3vruwPrVrAHzciexjT+VaVCBkIu+xgPO4JrtOdM3pH9A?=
 =?iso-8859-1?Q?gJ1S//KDDUXuSimJaA2dpVi2WvhG?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR15MB5801.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2Mgt/xetY39DrFevf3nI9Qf6IMaqu57S/1GHlS8x8A4fzWYvsniKZIcGMS?=
 =?iso-8859-1?Q?dsxDwJbPPMXYvo2otilJBNGd0YUmt7ScD3LlDj1GiJKntsSXoBRb3Sbpkx?=
 =?iso-8859-1?Q?Mx2jb+5grAAuIipn8NBbOeeUvMNi+K8UufdLltpLZT+XelKyPcjLxwJxl/?=
 =?iso-8859-1?Q?EVWN7S8+e3uw8+2v5gRuLAl49+PyDeOK9pUXWC3OxjhBGaaEFr3Hx0vslv?=
 =?iso-8859-1?Q?rQOwZF+b9m07XroNd/N4IAR0MlKbh8NivXLc3R1maFk41Uxu85w3isXqcu?=
 =?iso-8859-1?Q?aG43u+1kHW1/ZedvH+ao5CXXvzCMYPi8JSmzh5CvdscsgfMWzLZLFKaN4l?=
 =?iso-8859-1?Q?MneLN8l9W+IQkRZCTp+3SxkV9LUuOR32lxHTo2ew5qDKzNlxKLghCEGhvV?=
 =?iso-8859-1?Q?G0UhMDqqq3Aj+ZZhLyR/SxYhqeRB+oCkBs9kDBagGCz+ZpGk8gAl2qwVd2?=
 =?iso-8859-1?Q?jZ2KE5dYpn7kb+g3qHLIdAXP5Z9uUHr9HWM9y2zSFCRd5KfdYIllw9n+FS?=
 =?iso-8859-1?Q?6cLyzjl9vOvj4tc5f98CdJ3NBy++6AsbvH7e+/YFNCHfSWp6aQwl/PSb+d?=
 =?iso-8859-1?Q?yRf+OG4hC1StysTkHXSXWhFVVOQ3yd5e8nlF6j8Za2TWdJQhc+a5BC3EjZ?=
 =?iso-8859-1?Q?EXO/xPcKuG0ixwsUH06s2hYGrXR0NxJfR/DHOr0lIXePlUA8r4Qiu68UUg?=
 =?iso-8859-1?Q?EFQ//fajS6i6EMbkqo/avsavskRZwfsYdlFxQna2wvU/MXdHU3Ii2DBCSA?=
 =?iso-8859-1?Q?KfkP/wch11tALa6WhySpkKNPS5n91a5XdDEH2X6siVtCtsR8tjy2g99oCa?=
 =?iso-8859-1?Q?kkDdpNOYY+eQ0o2V0tOfLbMHPnBsy+rFrbgxY7ifSH3lhefaCDa9T4PXvd?=
 =?iso-8859-1?Q?EYHU+9vuWFR6078R9fbYZYfgFnfAlvs/Qa1J0/lKvWwwh4ZVO2sj2KUux2?=
 =?iso-8859-1?Q?XMZJnZBKtnWXYUsGNcOk/fED0UXLk2DjPsOJ/BCb+DCNY7AtL91oRZbHkW?=
 =?iso-8859-1?Q?Bqo2U99VXMyVZtufKM+fTQgxHi9Wwa+3CSoU3JQmEniWLGeycB3kClncrU?=
 =?iso-8859-1?Q?RP2psFQTOKrz47oxEArq3CNDIvWGIrBbMSkv5RMuBwkNU5CCUFh2TB3CF+?=
 =?iso-8859-1?Q?ZMi5LJhHCshd4SnYffcepVmKeCskdB9KkiwH+yTpDFYcb+1qINffABnxK6?=
 =?iso-8859-1?Q?b+qctF0lkQ+hFxv11oeYY2qpC/eFAznMlnrsP5et73IKA1GCCiyGIFc8Rz?=
 =?iso-8859-1?Q?+XYZuONgl4a5O8ti6yf6uAhlLtPXnHEl9BJRdebW6Gkn3+mDbzvl4eD6AB?=
 =?iso-8859-1?Q?0FmYMHsg12Wh3K0dmPbcf0cTs8GwKuG0EqLJcA6ENutcVuh1if1qWbC+YJ?=
 =?iso-8859-1?Q?4jemjzNFXtLjF0n+ifw5G0KOSYoKcC8vpp59EjC8VEIoU/cm1+VCWIeh7L?=
 =?iso-8859-1?Q?MKnJNqcif2aLjSjDrfVjksGPf0IvYW4WgcTV3gKAK4BzsnWnybovqraY60?=
 =?iso-8859-1?Q?H0bzNzuo4rGP+hdPhE5ZFrRDjE5WWWbIfxZSltpbF7Se8gCI8zIuBx0t8j?=
 =?iso-8859-1?Q?HvTfCpxp1lW7eZynOC5+gSgua64qxCNVXkWhKCRt3VBNboLgvbVukpN4Uv?=
 =?iso-8859-1?Q?lhFphAP7itT2Q=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a7247936-a03c-42d2-a017-08de39ca6da9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 22:04:31.9104
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ggn1z6AIIcTSJBs99nP3t05y+xx1cPyjENBw029vnjzLmG1BbzTPjAb9ovAL5O/itqCt4lLDilXImSRGFhm0lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR15MB4029
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDE3OCBTYWx0ZWRfX/hxj7nc5SqVA
 OIpIDwvwH2aDB7J6DfjmDd89beHMcLaAI169VdIyAbS1qONJ4JdHSuoDQ4GSN4Uc+K0t0jrA72e
 EL0Vin3DtHWw2aImx12uMJ7aNozU1hiXdVAkDGooh8ALRxzSYw4F7JQfFEZTmerupfYDbNWS1rO
 B4e8AopLjDBEy6axRI//e0zWiP3wX/koIbUdvcMfNRDj2MCw9zGYXuTeShRclf4AnL0WBhb8sQ5
 /cD8Bnzd55olthGSCKR9OkxCRPDA62yPnCTY/ywGLYMCnQyBjd55pVg3GluJMYtJwxFz4bDvQq1
 xbpRG0qr+HuH/xboOhq3py27kJP6Oy5Z/Trnc92cDdad0+kLmmCrGsT36GMtAyURSTudMaLgnqN
 0M8q2REfVGEHeFlhzZcdQGf2hjPCag==
X-Authority-Analysis: v=2.4 cv=f9lFxeyM c=1 sm=1 tr=0 ts=693c9172 cx=c_pps
 a=NNTlVNVDZfSUkWkRvmJkNA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGbCS3zQAAAA:8 a=e-GSelqVAAAA:8
 a=We3eBNfGN2fxj8vn1lkA:9 a=PRpDppDLrCsA:10 a=wPNLvfGTeEIA:10
 a=oRZS8w7TM5j8Y1SnqK-S:22 a=VTQqQez33RekakbJVocy:22
X-Proofpoint-ORIG-GUID: 1u_J7X2tyAxKa1zfTht69hlDaBB_iGbe
X-Proofpoint-GUID: 1u_J7X2tyAxKa1zfTht69hlDaBB_iGbe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_06,2025-12-11_01,2025-10-01_01
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Folks,=0A=
=0A=
Redfish recent schema for https://redfish.dmtf.org/schemas/v1/Sensor.v1_11_=
1.json=A0now allows for ReadingTime to be reported:=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "ReadingTime": {=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "description": "The date and time t=
hat the reading was acquired from the sensor.",=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "format": "date-time",=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "longDescription": "This property s=
hall contain the date and time that the reading data was acquired from the =
sensor. =A0This value is used to synchronize readings from multiple sensors=
 and does not represent the time at which the resource was accessed.",=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "readonly": true,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "type": [=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "string",=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "null"=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ],=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "versionAdded": "v1_1_0"=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 },=0A=
=0A=
In order to support this, I am intending to add a new property, ValueUpdate=
dTime to the Sensor Value DBus interface:=0A=
https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/84171=0A=
=0A=
This will be another pervasive change affecting all sensor services to stor=
e the timestamp of the last time value was updated and potentially bmcweb t=
o translate this to the date-time format as specified in Redfish.=0A=
=0A=
I would appreciate feedback on this, or if there are other avenues I could =
explore which could accomplish the same thing with a lesser pervasive chang=
e (Not sure if dbus-properties have a changed timestamp like files do).=0A=
=0A=
Thanks,=0A=
Amithash=

