Return-Path: <openbmc+bounces-764-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EADBBEC344
	for <lists+openbmc@lfdr.de>; Sat, 18 Oct 2025 03:05:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cpNmK4s8nz2xpn;
	Sat, 18 Oct 2025 12:05:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=148.163.152.46 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760749553;
	cv=pass; b=hs07PVmUMEfL2b4wgcxVR78t/jnU2LXdxKVMrfl4Ro+7N10jQ99pxMznd2t2lhaDrskTt1UmyEG0MdkR+NQnkSP7pBHeRPExYMsWAsJ6men/zofHEzX7bzvbmc4NaX9NBJ9jIIII+JQ1CRvGNGBisx2e0LMznNlE0PjhIV/tSQpkPsCCrZeSPHivnuCzxYdSh8ELGU5jl/8LR3EVD5N4ATsbK9uIdBe6zxScA8S9Dxmn/xgdeymuefoHV2E534dXAXTcQeqGH+kt74zrH2h96YNbJbxNIcAg25Jqg+2H80XBj7KMrYUoi7StjvsXu3MaGS8EebTKCHImCB0zxhd8XQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760749553; c=relaxed/relaxed;
	bh=AkMgTGERAiDaSA3u48mFSfFJQrh4reoCD1HkDyjPS/o=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TcE+mVYY5UwWaJd8VChHEPaDlQQwf9ES/3oTdPMUbUKMoMRtv4fQpc3F0BtPbsZrM98M3WQZ2ye1LX1r4lByB7hqFBgmLi1VptyH4axztl010usfrqIVYSSf4qm/yHppHLD9Et3LK3sI2mqTR6OEQR2IPn6KxORN3xnTG9GxOMIyqXFj5sr3IxbW3q3bBcnCqB2scTKGTyKyT35kZmr/IGHGeCjMMOgdu2uBNAiiV76Fs9W0RFnQfjOPwCn71uBcgzVxb7q9TOxT7icubhYrNTPe+gBaWOMdRQm+Faxm1eAjxaHn+5ngMoeLhcFrTXqWZevHWSiMW14DS9NllhBoKQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; dkim=pass (2048-bit key; unprotected) header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=DKIM202306 header.b=YBWIG1C8; dkim-atps=neutral; spf=pass (client-ip=148.163.152.46; helo=mx0b-00823401.pphosted.com; envelope-from=cwood2@lenovo.com; receiver=lists.ozlabs.org) smtp.mailfrom=lenovo.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=DKIM202306 header.b=YBWIG1C8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lenovo.com (client-ip=148.163.152.46; helo=mx0b-00823401.pphosted.com; envelope-from=cwood2@lenovo.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 33617 seconds by postgrey-1.37 at boromir; Sat, 18 Oct 2025 12:05:51 AEDT
Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cpNmH4zsbz2xS9
	for <openbmc@lists.ozlabs.org>; Sat, 18 Oct 2025 12:05:50 +1100 (AEDT)
Received: from pps.filterd (m0355089.ppops.net [127.0.0.1])
	by mx0b-00823401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HEmdVt016527
	for <openbmc@lists.ozlabs.org>; Fri, 17 Oct 2025 15:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	DKIM202306; bh=AkMgTGERAiDaSA3u48mFSfFJQrh4reoCD1HkDyjPS/o=; b=Y
	BWIG1C8zj1CwcThNsMQ8EkpoX9w09Dla7CPo11Ib8vEbDR7mGQLDkMcoRaqUEUW8
	bHX/0PF2rTGlwYx053w1hKWyJsoX3hxFM3BSszsp/7qZj5pBNdiiw/wP3/Jqb0qd
	8/2B9arWo4WRZkS+2uGbFB4kLVslirm+Zxss0vYmtVaupsUm795Px6B0p1kr8aj7
	aM5ARO32BLYx+jh4cDRurCg3Ny9hzpDOYDsfqYts/hZbjTHUHsUytE2GLo75syQM
	u2uUAFq6nbA7Z36Ny7A4ETsMh7YM46WdzAWhRG9cviLjfBWx1q5gjPhLSkSwNxdb
	nesxUVqA+gTTpQHFJOZCg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012066.outbound.protection.outlook.com [40.107.200.66])
	by mx0b-00823401.pphosted.com (PPS) with ESMTPS id 49r3skmq26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 17 Oct 2025 15:45:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VBhv9HwcW0MIvaHqxXUPjbOrUkIa5XOdfHr62x4vFJAQo3j2xrVLCuh1cyUEJn8NE6eor2H4KdW9YE8g32nHI2BV8ivSNBsD0a21XS4maN9HjeXAQw7beLuOrFvUlhuSLQ3uGrVeyhYf0MJeiAChE/ZZqcZltSbjICaqLpsxpg1vCC6/LkOM3M4i9/SqPiTZS6YBkesHwNcxkI89gXqvJTj0s1Et5pgZ5p838l9WiSr16sO5pgmBRE4+ftD023QCvaf4aselLzSC1XP31e40SnrLil+90FYRCqmWy1mqbOds6ZnW53NspWqXS37FihEpGiI9brvcYZ1BCXPunan9aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkMgTGERAiDaSA3u48mFSfFJQrh4reoCD1HkDyjPS/o=;
 b=y8wIlFSmXvu1i/k+BQgf4mZNW/emg7vL4TY2xFfBoKqf64j9MhFIBwEK9fzJp3YJCMiDrlhyURSHE5/NhsDEx7i+9bL4NtUHTIaoCAMs4F3N34y56h7hnKoK4haW2zLN2PQt7Yua8rjeA/fmHQaj6Z9QOemiFlXyV4LVVVei0qk9JA35yZ4pPGcPNZjCodyZrrvtudhGtRn6GYf3bgdtwq4wn/sGvaoE4RDx0vQwP3ZKTVCIHhwKWKUm2ycG3NE4gPk3XBXsuQMxTjB8rEy2Fa2ceYPwI6G1n3QOJoWPOP7NBlyKmMDjNyizoaKJ7GIvnzanW19s/YobrdN3QAUUyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from CH0PR14MB4820.namprd14.prod.outlook.com (2603:10b6:610:e3::12)
 by DM4PR14MB5597.namprd14.prod.outlook.com (2603:10b6:8:b6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 15:45:25 +0000
Received: from CH0PR14MB4820.namprd14.prod.outlook.com
 ([fe80::2967:fd6d:adeb:a211]) by CH0PR14MB4820.namprd14.prod.outlook.com
 ([fe80::2967:fd6d:adeb:a211%7]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 15:45:25 +0000
From: Chris Wood <cwood2@lenovo.com>
To: openbmc <openbmc@lists.ozlabs.org>
CC: James Mihm <jmihm@lenovo.com>
Subject: [tsc] Security Response Team - Member add request
Thread-Topic: [tsc] Security Response Team - Member add request
Thread-Index: AQHcP3zukJ5YxHna+kSdHZik0jnU/w==
Date: Fri, 17 Oct 2025 15:45:24 +0000
Message-ID:
 <CH0PR14MB4820921DC66FCF4F3249D3D8E6F6A@CH0PR14MB4820.namprd14.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR14MB4820:EE_|DM4PR14MB5597:EE_
x-ms-office365-filtering-correlation-id: f2f9055e-4b4b-4d7d-ddfa-08de0d943038
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|13003099007|38070700021|8096899003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?VwxQ3wGzl3d9V7jcYd0Nr1Uo4R38iJ7lHpJ+JTilW0a1xVVd/g/SeNuV4z?=
 =?iso-8859-1?Q?hrXUXIioO1YUiCexyQYdf2IkK5t9ASCbiCyz0jU7owwVHQlkXilbwrGh1v?=
 =?iso-8859-1?Q?a+zG9K4RwVf1s6X6uC2NlXSp7BPMs0D+N10Q5cvihnOvzVC/uJ271kglhQ?=
 =?iso-8859-1?Q?zZghZKsG/uNWVL48A6pmUPcDx3pTfxaGSEj1Kaj/mMxuevnBz8j0aERhkq?=
 =?iso-8859-1?Q?SQHmdRKOITTUkERessjIWPXftL4vs6ObPmbkfr89nwM+0mB/7e8T7EHE8Q?=
 =?iso-8859-1?Q?wfN/ZwEpAp5AIg8H40P0M/j48hhtisz6gyX9FT57513PNAc87wcmNvove2?=
 =?iso-8859-1?Q?d4Jp4WAG3u3oxkuBDSI0Sab/AUiabD3KycdEAIdWFUd+LXZruS1dhrBECk?=
 =?iso-8859-1?Q?/ZvKX8IV1WF0FtL2zPiWi3wILE5QStkpl4vsdicRTJUq9PpENFP0PxcW7Z?=
 =?iso-8859-1?Q?GeWJQ0DMwX8WM0PBIUhQ2V7mpApYRKau9A6A5EKM5s6KR9ZYRtNmWvpE8e?=
 =?iso-8859-1?Q?1VcjnwFdEYWwzIB8VOQuIv8SWtcP5NmAkq52gOW/0M3tcvNxj62+WYpKG4?=
 =?iso-8859-1?Q?+g0MNZA46U1iVeDB2mYBVQF0cA9s5G1SZFieIISkcqsuqs3RRdH3PwkYx4?=
 =?iso-8859-1?Q?UDGE6KnWok8rM0a5YAU9VUqolmDnlJdS23V2a3vUNjpM9bxzsUEnA0g4pJ?=
 =?iso-8859-1?Q?8FXC4lSBvKba8voUOJObFIWQKUr7stOItzmfk/Xo8kDqpaXqyrYq2MhSHx?=
 =?iso-8859-1?Q?Owhu4qPXwDUhOcgMdddKzfjZg2lZAQ87Dmrtsa06BLC4Is4TAgwZQbTh0j?=
 =?iso-8859-1?Q?8QTzTbTjs6TPluHOX0lpwN1NJzVbyO3naddEhw4O3lJaXQKn5/Cixj2mAY?=
 =?iso-8859-1?Q?GLNQ4foQeqUo7G/yuHRelbaz3wlt33geOnldRjUSukKbM7fEpXU2pL2S1A?=
 =?iso-8859-1?Q?v7a5pQ78u0qPfrT+4Zsa6XN9jghDuRWchr3VizuZFdnIWcyqnqY7WHYx5x?=
 =?iso-8859-1?Q?sIIf+vwOPn+ph+mI35/WYYzB5K26dsASvDtD/1BP2OlwSjte3oPHEOPuD2?=
 =?iso-8859-1?Q?85riRQ9MxDUlhA/QoIhUfoBBKN5w8M8T0a0BH4gvA6rvDvHdqznWom4nd+?=
 =?iso-8859-1?Q?mhK/r66k6nXhttVc8j9fIb2EroHuqOSLhuu2h9TLiuuoTExIvM+7LT9u75?=
 =?iso-8859-1?Q?HFNq2DyMF/vxlU9Hek8UDmeUc/tlaMBFhXVYwsgt2HZEfMBT4fAYAJFAqL?=
 =?iso-8859-1?Q?b5Vuk3YjgIod29mlo/Z3sYW4X/x19TUr2FyVtyBSvRiCLN7lEP2UUjgEIU?=
 =?iso-8859-1?Q?K6C48hyFzwDaxC9xiJ7a8X7Yaey9CazK9aMkuGW7WGPYXWQcwUFVJM42L9?=
 =?iso-8859-1?Q?I+yscmVqEQZErl/mzSJEeiDmm56mDty7GNUnqoNU6AfAwDVe1x5LEbkaGy?=
 =?iso-8859-1?Q?YDpVEWrWF+EXs4OtI3g7l9qjarbmBv4a3ouue7+ZWHCfOA+6YlJa2Ro+Pn?=
 =?iso-8859-1?Q?Uw0UTHI95mVYYenf2JL38VvbqLuA0Ap9D1SafLu9cudQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR14MB4820.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(38070700021)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?okwxV1ipx8J6Z4WXFlImhy98X/f/ZIzB413k+XR1EVJ8rG9ZD2pTExz64N?=
 =?iso-8859-1?Q?ktmS3SgeIY39CjweFoiLxmZqYROUZSsfdlxPiuguerFhIfTniJDIiGaqTH?=
 =?iso-8859-1?Q?2BnZd9Rv6hFnzhTDPtIypygUWS/DrKi4XScL3xd9OICch3fKDsrp/7lDHw?=
 =?iso-8859-1?Q?1SRxojC3+2RxR+r/a62kEXZyveNbqlp/Q5fC6U4kPuj6fBUsqP/0B2QbX8?=
 =?iso-8859-1?Q?QCZO7qWGVbOtsEC3gXt15fUzmP9AZ1IaRs68tBOWSku36BXwzyzdMdDLYr?=
 =?iso-8859-1?Q?YZb773781eqnU/gTMTF8BvQ4YRm2zlX+Bt8Nj/E3bwxNqwYvtz5s73/Rsq?=
 =?iso-8859-1?Q?JIdCqAxURcBVMsgcu3dVs5IRu4GtmQ42trXqAvADBjaxEyT7ts+F4+A65W?=
 =?iso-8859-1?Q?rMyU7bhgWjMkj2Sk0SV9dYL6AeKO5lbh+QGTjH8dWQa94FipNvDs6psNWG?=
 =?iso-8859-1?Q?2BfJYrgchH5mRwixVkGb/WlN1XaTTRM//QwkDi7SCJ/c3jxoKAmh4+Msg+?=
 =?iso-8859-1?Q?Twmq7eDvWQetAZsl5Jvsj25N2PHY6sPhuvN/Ce4051E2wYa1wESib04Qv8?=
 =?iso-8859-1?Q?+jHvyRG1OOxcZTNTTgTRoCMDW5JVPkuGvnSBCu9XtHQBQQfBPbX+eIx4iK?=
 =?iso-8859-1?Q?TusPEtt9aYDjLXELo9kU9irM+iCQgdbfFIm/TXYlb9kPM/Uqhcz4/XtA9F?=
 =?iso-8859-1?Q?qGq2GIQJgkcZPcIASvsirS+oH94iyFe4pfphVYL9t1SPjCqjLn7L7u/GEe?=
 =?iso-8859-1?Q?oPMKx4JkEuJJXlipWW+Q1xf5THsnii1yjZvlOdygstecYOEV3A3KIn0v9a?=
 =?iso-8859-1?Q?zB7Z+ngSwY/SFXgrWi8GjBYkcyyN37yYRLpAmzAnoHl29TMdUoPh350KTI?=
 =?iso-8859-1?Q?6cN/R4XA3OJV2GxYDpOjz/9jDhvFPkOhd3z01WcDMhoKqKJ/My+i/g0K46?=
 =?iso-8859-1?Q?bREQtO7YZFFlyPpez6JwVpYnxIhmTrNb2qZim/dkPZn067VtJ5yWKwgZuX?=
 =?iso-8859-1?Q?7jsJRUkjJaitnLlZUTLZTqK+uFUeupPvRLvFIvNvXhylWdzWSj+4KSkCjc?=
 =?iso-8859-1?Q?Ab5htJ/c8Yzbso6Zh4QQRj+UO2894RndmqyugQndtKWrAiaKWOkzo8vrQn?=
 =?iso-8859-1?Q?MwSNqrf49xIQEXDhH0WPpIGA0m2V3w+eJwcyp5SNjGbZ+qMS6qhkxZJ663?=
 =?iso-8859-1?Q?9/TXKDkA8qhlKhLNAGj3Nq/VoNmwNdFjn+fO6Zqb8M4hHVLWOOChxPUh+7?=
 =?iso-8859-1?Q?rDtvaAErDm8TEGllWOSG0/eZWOxhFxCh/F/ZSpNx/BftSrKa95EaFg+wVN?=
 =?iso-8859-1?Q?T/x4XhFi5uYLmpC34Ya7iSB0szzb6t8ONjWhimnLxt/Mt07ygp+JaovWqo?=
 =?iso-8859-1?Q?3Ax1JT6hhODhNK7Hr5JgfEVs/qUvS4jTB5EpRRwBuJJmJKHN9nwEw60qWA?=
 =?iso-8859-1?Q?HdD8C/kKM2se+ywhpdHu1o3YiDkGAelk3AJJreocETmzmc6okpkcLki0Gl?=
 =?iso-8859-1?Q?NhaZuE0y5sMaevqQjJxnABPCJ1PlFf2gezTvrKGdOsVeUki+M/EmcMuF0Q?=
 =?iso-8859-1?Q?ceNhjo9ZRSxza9Hhx0R2RUbhrMNjYU0nghocrVPkRtdZ9gxc8qB4cgPkHJ?=
 =?iso-8859-1?Q?HKPFs/xzt1kM4=3D?=
Content-Type: multipart/alternative;
	boundary="_000_CH0PR14MB4820921DC66FCF4F3249D3D8E6F6ACH0PR14MB4820namp_"
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
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR14MB4820.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f9055e-4b4b-4d7d-ddfa-08de0d943038
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2025 15:45:24.8356
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O/sTzrotDzDRbGzRctvvkAoi8C3i0TUxHOw/o8tbEk6aTlBN62Jnm8C1qs1uhzgCQkle2qGmFjpvwmCHvhj80g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR14MB5597
X-Proofpoint-GUID: lQ9e08v7_C_bAQ1ripUJaLrEP7WOfMnD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEyMDAxMiBTYWx0ZWRfX3FgmfrOIvzTo
 inClyuq3nvsWhJXu16VgnBxd2fqt9GICvujl7dra8w3YJkzh7XJBGBfhd3BbTUOKoOfSsrfiCKG
 gRPmPzJ1wpXnWqZjsL7X2ArDZX2XSWUbO3QfJFrBtDb0atIFZQbdXRV6RdUAkasMjAw1038SFel
 2zr7hNN2Vp+cAWXfhANBbHke228C2qnrZiXXaog/oDjAQfwBcxUMJnz8v86ehZTeAVIn2RMj0Sw
 T6RJb24m+SingyEwEAoUCJpKI7NKVZiE/gtnxh9xqsQuAug9V5gppF26mejSlxcQnE356g4OgOf
 iNkgt5rf8N52CW8sXnYs6we29c97TUk2lMkBp7ObCuXdCQo2uKO3rmHJLtDlrDCdAGj6BxWmLTI
 2zzchSRL3kjAZn14FkDCQfW8AcGEmA==
X-Authority-Analysis: v=2.4 cv=ZvTg6t7G c=1 sm=1 tr=0 ts=68f2649a cx=c_pps
 a=u7VgDZIRhFIHkGP5DPkLlQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=MnNnaBpmAAAA:20 a=8k6WQxmsAAAA:8
 a=WrQtLyRj-yO-WUj70bYA:9 a=wPNLvfGTeEIA:10 a=ZXulRonScM0A:10
 a=WMp_VWcVF8EeMJzbg5oA:9 a=i9ddFjAymLgpPCXl:21 a=frz4AuCg-hUA:10
 a=_W_S_7VecoQA:10 a=CTwFTDRtctY-zZ8oRDn3:22 a=yULaImgL6KKpOYXvFmjq:22
 a=pHzHmUro8NiASowvMSCR:22 a=6VlIyEUom7LUIeUMNQJH:22
X-Proofpoint-ORIG-GUID: lQ9e08v7_C_bAQ1ripUJaLrEP7WOfMnD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=-20 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510120012
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HTML_MESSAGE,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--_000_CH0PR14MB4820921DC66FCF4F3249D3D8E6F6ACH0PR14MB4820namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Please consider adding James Mihm (on CC, and on Lenovo's CCLA) to the Open=
BMC Security Response Team.

Lenovo's v4 ThinkSystem servers are available for public sale and OpenBMC i=
s integrated in our BMC controller, "XCC3".  Lenovo has a long standing his=
tory of disclosing security vulnerabilities across all generations of produ=
cts.

As Lenovo CCLA manager I am submitting this request on James' behalf.

Lenovo CCLA - https://drive.google.com/file/d/1uAHeMmMFZD6ysUI-OYsgW4G9-_rJ=
HbAE/view?usp=3Ddrive_link
Lenovo Incident Report - https://support.lenovo.com/us/en/product_security/=
ps500001-lenovo-product-security-advisories

Thank you,
Chris Wood
Lenovo ISG, Principal Engineer (BMC Firmware)


--_000_CH0PR14MB4820921DC66FCF4F3249D3D8E6F6ACH0PR14MB4820namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
Please consider adding James Mihm (on CC, and on Lenovo's CCLA) to the Open=
BMC Security Response Team.</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
Lenovo's v4 ThinkSystem servers are available for public sale and OpenBMC i=
s integrated in our BMC controller, &quot;XCC3&quot;.&nbsp; Lenovo has a lo=
ng standing history of disclosing security vulnerabilities across all gener=
ations of products.</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
As Lenovo CCLA manager I am submitting this request on James' behalf.</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
Lenovo CCLA -&nbsp;<a style=3D"margin: 0px;" data-linkindex=3D"0" title=3D"=
https://drive.google.com/file/d/1uAHeMmMFZD6ysUI-OYsgW4G9-_rJHbAE/view?usp=
=3Ddrive_link" class=3D"OWAAutoLink" id=3D"OWAfb8e1cf5-23d9-842f-9017-75fdb=
bfad0b8" href=3D"https://drive.google.com/file/d/1uAHeMmMFZD6ysUI-OYsgW4G9-=
_rJHbAE/view?usp=3Ddrive_link">https://drive.google.com/file/d/1uAHeMmMFZD6=
ysUI-OYsgW4G9-_rJHbAE/view?usp=3Ddrive_link</a></div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
Lenovo Incident Report -&nbsp;<a style=3D"margin: 0px;" data-linkindex=3D"1=
" title=3D"https://support.lenovo.com/us/en/product_security/ps500001-lenov=
o-product-security-advisories" class=3D"OWAAutoLink" id=3D"OWAa64b2e57-afd8=
-a7a6-7366-d16dc350f8a3" href=3D"https://support.lenovo.com/us/en/product_s=
ecurity/ps500001-lenovo-product-security-advisories">https://support.lenovo=
.com/us/en/product_security/ps500001-lenovo-product-security-advisories</a>=
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
Thank you,</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
Chris Wood</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
Lenovo ISG, Principal Engineer (BMC Firmware)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
</body>
</html>

--_000_CH0PR14MB4820921DC66FCF4F3249D3D8E6F6ACH0PR14MB4820namp_--

