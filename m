Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D992A7060D
	for <lists+openbmc@lfdr.de>; Tue, 25 Mar 2025 17:08:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZMZbF0Xw3z3c5N
	for <lists+openbmc@lfdr.de>; Wed, 26 Mar 2025 03:08:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=148.163.156.1 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742918900;
	cv=pass; b=lkQMTfm6KaeZT/9vc/ZsafVTDG6vAgDNvCgB3X78eJDjES/RegErQ2yq/BqTF0eTq1p3UkgItPX2TwkiFc0OUB98mr8UvBc3NSIqo5cawMhfdFPxhyCA+14ziXQZqT3HJjrp9WH17ctYxuVtpcAmDjyVPw+JrHoOChj5OXUdnqnID6lWRm/95bvJcJGnFFLjVchOnjLw6ClrnH9xH4K0ExlwFWtPK8hX/o8w4q2HelHU2NMmZLKC61BfwB70HnaCZBuSEdTCrJ7qIKJfl0ykfAX7FST3LyyLU0D4Q/+LTiyjAZTKCrgslawKeCao2osdj9FjmxJkXu8ML0gIJCJMYw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742918900; c=relaxed/relaxed;
	bh=tW7s2df+5GZvG4H5E9AMMzsYFQ89P67NoG2DDe8QV3g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KSZfUi968TkiOlaIBJDnW7iowz2fIm9Y7xbtAKrw0ot4l3BhS3D5bfNHcY28GPd6URi0gqugchjKxuHy8trY7ExX0mxAGBwmpCvyqjpfjCkUsUGrUATzxXLV+VwzOyoYdbBcbUN4IsWDVRqySuxDaRRpu/86IzwB+pixqkqB46j6bHcna3fPUYu34lcOiUF0HSK4QmnTd+iTJby7/njCLIlUyaD9Mq++NTQFnmCWQ8R4PedBsfbr6gEkgIe1Hq7Zw6n+9cc8iqRi8Dfee8ZtDgIOYWE+LDQOy5//GtZfijGso+1Ffyh915gd1Qx7ZK/tnjh0HbOz0tkNXUNMwnExIA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=in.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JI1g7irr; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gkeishin@in.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=in.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=in.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JI1g7irr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gkeishin@in.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZMZb80J4Cz2yFP
	for <openbmc@lists.ozlabs.org>; Wed, 26 Mar 2025 03:08:19 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PE3Ujn026930
	for <openbmc@lists.ozlabs.org>; Tue, 25 Mar 2025 16:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=tW7s2df+5GZvG4H5E9AMMzsYFQ89P6
	7NoG2DDe8QV3g=; b=JI1g7irrCvOq9Nph03+WEhfwpNtPBx0ufVspFmXsNsR2/4
	RH6qxXfPHfXJc6+oV2P1etX27L+0YVhL7R1sCcShgp6pHsu/7+SdUquRNqFAcsf+
	UxRtFDjxxa3Ra6Sn3r5lxk3/cwWflR3u0EooMYX3H4ggtidOAh/uUzhgDYLOSLB2
	wGFJNcOc7kbMBRwwDRVXYgIQOlnLC9szVjSrBrCmkHNa8KrOThMx6WyVrffV7yZk
	D3UKufQng14oEG0OA846k0NYWqvRYMJwPtWmrBVnC9ntIYmHASdiEW8zdt2/O0ca
	bR+WYe36K+B+tDkbWJYtm9M+3AaB5e9KER2wP6hg==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45kwwq8pse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 25 Mar 2025 16:08:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ots4uKW6i92orQy7QIX8HmcMDiiA7Lc6WoODspwYhIR+90EKNLEGsea8c0irFRps9yqZDlKu/NjyuNfZKXpWTppRjNVXtqY2UV+k5egFV0hKqrN/TA/eq0vl6HxLepi+1B+C20bFfWodX4z4AgEfeeXnp025o7A+Ix8G8tkC4h2iPkEzz4LUNKqzi6GLalyPWcEDWiszvfss8XX/Q9tM87YCHXrBLSXeQDVioYzux82yzlKplnwjEQ9r50EtVKvAc6qm8aGqis6vRqAFrS0sgccbkNS1ngf4MqS9sq6s0cuigRb9NXksgMHTd51jcR+g5wvd7pLSJJuLR6Q9EUFq4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tW7s2df+5GZvG4H5E9AMMzsYFQ89P67NoG2DDe8QV3g=;
 b=L5P7eAzIU/wgW2qp0mdCx/EZW1/AF/iqTMn5DgqlQ7s0rRjjO5ZUWKSuv+GS3VQRHO8ehbhGlDzdbs8qxO3d2i7u3koVF9XysFw5xr+43ucTWpDKqQfKtq8JQUVTKAfSIlC0q1cUEmoJ4wH1MiV9KLG4Z7ue0Qn0kHl5jcdNa/MNWIB8oTxM2aygdk7PgyBl2jIfSV7DNt017Pb453gtMOUy2I901AzpBRuZ79V/Uepn0SNE4nx24Xi97GUGtC9+GlF6JfVLdg7lP1lcV273AV+w5iQ9gtWQE/GEgQ3AEl/oe2w9CVHY8LzSU6mraCNbFHF3oRLOIdBMl3HrJ4DU6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in.ibm.com; dmarc=pass action=none header.from=in.ibm.com;
 dkim=pass header.d=in.ibm.com; arc=none
Received: from CO1PR15MB4970.namprd15.prod.outlook.com (2603:10b6:303:e5::10)
 by PH0PR15MB5734.namprd15.prod.outlook.com (2603:10b6:510:288::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 16:08:14 +0000
Received: from CO1PR15MB4970.namprd15.prod.outlook.com
 ([fe80::87bc:869b:7c0f:2e75]) by CO1PR15MB4970.namprd15.prod.outlook.com
 ([fe80::87bc:869b:7c0f:2e75%7]) with mapi id 15.20.8534.042; Tue, 25 Mar 2025
 16:08:13 +0000
From: GEORGE KEISHING <gkeishin@in.ibm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: OpenBMC Test Repository: Pre-work for Python 3.12 changes and
 packages update
Thread-Topic: OpenBMC Test Repository: Pre-work for Python 3.12 changes and
 packages update
Thread-Index: AduU3mYPGJCtyewpQUaiVbzWiZWfrgIvz5OQ
Date: Tue, 25 Mar 2025 16:08:13 +0000
Message-ID:  <CO1PR15MB4970E5EAC73E79186DC552E4E6A72@CO1PR15MB4970.namprd15.prod.outlook.com>
References:  <BY3PR15MB49621C07BEFD1BC4E0EB63AEE6DF2@BY3PR15MB4962.namprd15.prod.outlook.com>
In-Reply-To:  <BY3PR15MB49621C07BEFD1BC4E0EB63AEE6DF2@BY3PR15MB4962.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR15MB4970:EE_|PH0PR15MB5734:EE_
x-ms-office365-filtering-correlation-id: 3263073a-5dad-42ca-4b8a-08dd6bb73ef6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|38070700018|8096899003|7053199007;
x-microsoft-antispam-message-info:  =?us-ascii?Q?bkmus5zWdC+4Ti5Z9yMaDnrYMSIadUuw4xEszYJme+OeoQA1zrVMlvW2OJvN?=
 =?us-ascii?Q?3vG2IeMngRMdHJhWUiejqWKrbXho/EOTvJRAdF1rhKjfv5jvFtGpuoRU1C8W?=
 =?us-ascii?Q?ihnikGrKHVDcfxh1uM0LC+KMhLpGtkDzxkLbd9APAetbbNJRGwzOrYZrcGS+?=
 =?us-ascii?Q?GIQz8cc/1Xl2SyoboPX9yioDYMACc4x/QsnO9vEpYJjPjf1Z1zo/ojvdwZ4D?=
 =?us-ascii?Q?2mZO/NU+YC9YnVlxCoK2sqqFDFA3nkwqbf5wkYBgmpvYw/TWcoLFVKqBGstu?=
 =?us-ascii?Q?jcV3CETtvig5jZKQbnZ/8eRLB5hiB1aOW4U4KB0Ut0boRTHQFgJIC7bcLw7X?=
 =?us-ascii?Q?1NN0DQ0Ma/n75rfX9AjwlpqZOSEB4evNtX0QX7ga94fur7AIKBHEGOLDEcUb?=
 =?us-ascii?Q?VcrFQVARf7YK+isbuYLY3c8YRWP/lXRNyP9FFsiHbkF7HfRq83H7IPpG/ZQ4?=
 =?us-ascii?Q?sFYG48gPj0dRE9Z5BXyUjgq9x3q+ZhJEdh/tYT6x1SrLP2hLmcKzoGBGfCxg?=
 =?us-ascii?Q?xfGOWP7l3VZgz6JSjxEenYrYy4DTQ7TZznYNpN6MhKIAUs2j+GJKDA67eVQZ?=
 =?us-ascii?Q?WrHKeeHauI3ckAD3NhQNTBBXejJ5Rw5bHJ9nzcmZFZTNsuPgkex9RXfeRrxX?=
 =?us-ascii?Q?SFF9AdWSpcmEBU2nwJniRDWjoLRuu3oZHuAdPSheqyub5qnhqhXd6cBPQdzs?=
 =?us-ascii?Q?vLJMUyy2TmGbbMsg35qAaq3Dqil/1P6vo0JJg0eIH5uszl5i8hw9NXIM/PVy?=
 =?us-ascii?Q?iLdrxdIgzlpEOFmGtQhTiy5jBy0ZzxgdFDj9YusOgplJNBcL698FiKIZ2upV?=
 =?us-ascii?Q?1HTap+xN8V/1rqhAI88sipWcmixMjvH7SKju4OgzcacWQH60oGWsc7ge2Uq5?=
 =?us-ascii?Q?h0TStZ2mPyXn5z07xK4qwbnZKox1VirwMBRMOIPLDTcTv2MW3c54MvMQn9UJ?=
 =?us-ascii?Q?jiUEVwsPYxF7PGY7x6sQDi1rHMH75OXNR3+q5sMwLhpurVbwETNw3bXIviqA?=
 =?us-ascii?Q?OVQFmGXxw9Q7SlGa1pf3VY4cqSQJfxdAd9yziBLVqq8Hf9cqE6uoMNB8+PCZ?=
 =?us-ascii?Q?ablHYb4pzETx5L83NxUyLpGc9CFmW/zvP24KkKDRdg2ZHv5vGwqjQZVcReVM?=
 =?us-ascii?Q?6/G6jKq6UpptE2jSW/ghK+CRwT6/N7lb2tRjfEv1wZDFa8WX24YJNkIKn/40?=
 =?us-ascii?Q?VAzM2UovRMdjKwYJw8TQqZZ+jStCPN8F9Ul5vsyFi/zeWeY5uZH9uGm4QhFs?=
 =?us-ascii?Q?QMCZ+Ebau3tBWTRijzI9fn2GogmLHZNUCRCFcXriacyXcH3SL8hEzXZK+cVK?=
 =?us-ascii?Q?b5ghY9Mvmkc+U984kd0gmBhD7DWNU76DgiwaHcG1LoadCpT3UThxB/kEaxzV?=
 =?us-ascii?Q?40vF2hpSKxnEH/4z38n/55U6Nrn6DP/Q/rKdbd/QtXT4t17bMg=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR15MB4970.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(38070700018)(8096899003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?4pQGk453w16n5zBHIorormQlmgwlbnwPYxRGokTwhosgWZPMGkqfkGGw9eqL?=
 =?us-ascii?Q?YtYIsCv8xFdlEwDR/U1ts5IX9HruXkvGqwPHEmlHJ+HzjHWMjQu1VBP5a1XA?=
 =?us-ascii?Q?it1qIuqHW/GZdmRBEyKaz6dOcH5oAQvcGgkweQEBrA14UPeZhX/MVbUo4/co?=
 =?us-ascii?Q?7u5KSV/LD32TUqo9biH4WgQRnnFk1o/t7QqWcu2nmeYYkcw5sZFgubfvbkOU?=
 =?us-ascii?Q?cqMgnBzsxYQ+v4Dr4LE8/N0V7SPmqrEeKVmZHMCFvdrYIotqe6LU340dqeRd?=
 =?us-ascii?Q?+Qy0OfZ2H4YbjSqfAM6KA5BXLYaBNU14bq90Pd4hrFpULgMP83KUvGDwCNc9?=
 =?us-ascii?Q?0XBKZ/beH1eBKEhm2XPTIiP84JU/uy2bWAWeZn6F1pGnobSNE09o5cVGACHg?=
 =?us-ascii?Q?Mzb3hcTOTE0ZvYPYjqItt1MCaL6k80HRUM9JaFkdNAb3JcwMd9nxKQ8jwulD?=
 =?us-ascii?Q?WEQxBgP4zPCVotjXMSZiy9ZzS4sLxR0vcX5qzo872e1hrg6bVzrOPYeR/UvZ?=
 =?us-ascii?Q?rCCYhjqk5FvjHcmpx0xJNNLONQ/RAi3ojjzsUM5OXug1gqzfBdro4oq+YZiG?=
 =?us-ascii?Q?yW+OqctUdqkiIIS2moY2jbPrL+N71rLcJMvjErpz+vatpIiARUkI/mDKdpCJ?=
 =?us-ascii?Q?JXRs1uXxNIq13KTbk1rTcgfNPZ/Ek76KfdU4XDVvdcUxd1fme3a5/f2fzoZv?=
 =?us-ascii?Q?YKhXXwWPnG9R/g9J/G3Gth/8E7vV6/1UMR7cQ/pvNGwtRE3uBh3LE0q9Qt69?=
 =?us-ascii?Q?eAd8+eiK7LWarJr4ydp4RgYKAlS7IE9+a5jh3BVerBudELymOjhzpdL+9NCJ?=
 =?us-ascii?Q?kThVGcOuX4rtYR4zpwuYtzMjcG272NtUyybwUBvORxHVAJdv3peFLhlzWI6C?=
 =?us-ascii?Q?a0VCJYwaJeJ8x+8Vx9ZtycPR1mn4/U9kapLKoGJzK9D4e4RzxDgN//LTEUt6?=
 =?us-ascii?Q?griuY21fKNrFSBYs/HMLW+jwgsjV2Ldx+j7BrTSfjCe4tm16x6zTKLapTa4q?=
 =?us-ascii?Q?pYToFYdCYWKmQgz+7knCyl7Y9KvDP5nA/A79eq7/esvc/hQxDmDzD2Y+v+cs?=
 =?us-ascii?Q?vQoIezWWY6vGzcVAzp/FPXqCyyfP4gmRMFJNlg9+CYbrAL+MMrmAvdaty0NJ?=
 =?us-ascii?Q?/5XwDokEgeM0K938Z+4/P0nFeE8tVtfbaS/i4PhGSmbWOI/KoZUuMAcBH5Pd?=
 =?us-ascii?Q?3M3X77gHMQowZ1Oye1MO5ylvap5zn/ZTElJnZK5lY0bhBk0O3qejjSNXoSIz?=
 =?us-ascii?Q?p5pcOVqVvLfV0zUm//XAzSaXb8YhMkx0XNoIEQJdMXVoB9nfWPOkiXPyo+K6?=
 =?us-ascii?Q?U4fx9qN/jMVYm2xINAWhzcTgggJccBZSfgokf2uepAArymq1p8/BRxoPWZot?=
 =?us-ascii?Q?rw344f6t0z6IfV5NQ9xjGnJHWBWbEudLpHIaH7WTDFUNYaMVQ2iCIf49GFO+?=
 =?us-ascii?Q?03ZBc/bM1z+E14wgISN6jiVIZcteucLLgjyngxfZy5AyIlNj2AYDCPKyTdyV?=
 =?us-ascii?Q?31HerJOtzVRzemNuhjlxahBSbocXGTrUjiniQeh/N/aodQFiYoojCdWWDwZ+?=
 =?us-ascii?Q?40JfooxkRZGyNK3ZMWA=3D?=
Content-Type: multipart/alternative;
	boundary="_000_CO1PR15MB4970E5EAC73E79186DC552E4E6A72CO1PR15MB4970namp_"
MIME-Version: 1.0
X-OriginatorOrg: in.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR15MB4970.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3263073a-5dad-42ca-4b8a-08dd6bb73ef6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 16:08:13.5622
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N6fe6RYtlK/6ogcdIgdCNSWuGOwf2fDveRNPqgN9q+QRZkFkGkydo3cl3c7YZbe5p54r0LkB89iYcM8VtvKekQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR15MB5734
X-Proofpoint-GUID: tx9Jgg7zf9jBL6fM1LOvnCe2lyVuIR6i
X-Proofpoint-ORIG-GUID: tx9Jgg7zf9jBL6fM1LOvnCe2lyVuIR6i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_06,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503250112
X-Spam-Status: No, score=-1.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: Dan Larklan <dlarson@us.ibm.com>, David Shaw <dlshaw@us.ibm.com>, Stephanie Swanson <swanman@us.ibm.com>, Sridevi Ramesh <sridevra@in.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_CO1PR15MB4970E5EAC73E79186DC552E4E6A72CO1PR15MB4970namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Greeting,

                This is to notify that; the latest code supports Python 3.1=
2 for the OpenBMC test repository.

               We went ahead and updated the robot framework version as wel=
l for testing and other dependent packages, and it is currently stable.
               Robot Framework 7.2.2 (Python 3.12.9 on linux)

               Expect changes around documentation, deprecating older code,=
 newer syntax for robot framework and python related changes for 3.12.

               Refer previous notification if there are outages in your set=
up for production with the latest OpenBMC test code.

               Please reach us out on discord for any further queries: http=
s://discord.gg/Uw9vhsJJ  or mailing list https://lists.ozlabs.org/listinfo/=
openbmc/      openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org>

Regards
George Keishing


From: GEORGE KEISHING
Sent: Monday, 17 March, 2025 05:50 PM
To: openbmc@lists.ozlabs.org
Cc: David Shaw <dlshaw@us.ibm.com>; Dan Larklan <dlarson@us.ibm.com>; Steph=
anie Swanson <swanman@us.ibm.com>; Sridevi Ramesh <sridevra@in.ibm.com>
Subject: OpenBMC Test Repository: Pre-work for Python 3.12 changes and pack=
ages update

Greeting,

                This is to notify that, due to Python 3.12 pre-work effort =
coming up, we are testing changes which are ready to apply for the OpenBMC =
test repository.

                Release Notification:
Branch: v6.0-stable   ( https://github.com/openbmc/openbmc-test-automation/=
tree/v6.0-stable )
Release note: https://github.com/openbmc/openbmc-test-automation/releases/t=
ag/v6.0-stable
Please point to this branch if you still want to continue using the older v=
ersions of Python level < 3.12 and robot packages in your setup.

Last tested version:
Robot Framework 7.1.1 (Python 3.10.12 on linux)

As part of major update changes which impacts the repository test infrastru=
cture around Python and UI packages needed.
Pre-work couple commit patch ( testing in progress & will be merging soon )
Current testing Level:
Robot Framework 7.2.2 (Python 3.12.9 on linux)
https://gerrit.openbmc.org/q/topic:%22python3.12%22

               Please reach us out on discord for any further queries: http=
s://discord.gg/v4XJwnx2  or mailing list https://lists.ozlabs.org/listinfo/=
openbmc/      openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org>

Regards
George Keishing



--_000_CO1PR15MB4970E5EAC73E79186DC552E4E6A72CO1PR15MB4970namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-IN" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Greeting,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This is to notify that; the latest code s=
upports Python 3.12 for the OpenBMC test repository.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; We went ahead and updated the robot framew=
ork version as well for testing and other dependent packages, and it is cur=
rently stable.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Robot Framework 7.2.2 (Python 3.12.9 on li=
nux)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Expect changes around documentation, depre=
cating older code, newer syntax for robot framework and python related chan=
ges for 3.12.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Refer previous notification if there are o=
utages in your setup for production with the latest OpenBMC test code.<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Please reach us out on discord for any fur=
ther queries:
<a href=3D"https://discord.gg/Uw9vhsJJ">https://discord.gg/Uw9vhsJJ</a>&nbs=
p; or mailing list
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc/">https://lists.ozlabs=
.org/listinfo/openbmc/</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards<o:p></o:p></p>
<p class=3D"MsoNormal">George Keishing<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-family:&quot;C=
alibri&quot;,sans-serif;mso-ligatures:none;mso-fareast-language:EN-IN">From=
:</span></b><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,s=
ans-serif;mso-ligatures:none;mso-fareast-language:EN-IN"> GEORGE
 KEISHING <br>
<b>Sent:</b> Monday, 17 March, 2025 05:50 PM<br>
<b>To:</b> openbmc@lists.ozlabs.org<br>
<b>Cc:</b> David Shaw &lt;dlshaw@us.ibm.com&gt;; Dan Larklan &lt;dlarson@us=
.ibm.com&gt;; Stephanie Swanson &lt;swanman@us.ibm.com&gt;; Sridevi Ramesh =
&lt;sridevra@in.ibm.com&gt;<br>
<b>Subject:</b> OpenBMC Test Repository: Pre-work for Python 3.12 changes a=
nd packages update<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Greeting,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This is to notify that, due to Pytho=
n 3.12 pre-work effort coming up, we are testing changes which are ready to=
 apply for the OpenBMC test repository.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<b>&nbsp;</b><b><span style=3D"font-family=
:&quot;Segoe UI&quot;,sans-serif;color:#1F2328;background:white">Release No=
tification:
</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; <o:p></o:p></b></p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt">Branch: v6.0-stable&nbs=
p;&nbsp; ( <a href=3D"https://github.com/openbmc/openbmc-test-automation/tr=
ee/v6.0-stable">
https://github.com/openbmc/openbmc-test-automation/tree/v6.0-stable</a> )<o=
:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt">Release note: <a href=
=3D"https://github.com/openbmc/openbmc-test-automation/releases/tag/v6.0-st=
able">
https://github.com/openbmc/openbmc-test-automation/releases/tag/v6.0-stable=
</a><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt">Please point to this br=
anch if you still want to continue using the older versions of Python level=
 &lt; 3.12 and robot packages in your setup.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt"><b>Last tested version:=
<o:p></o:p></b></p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt">Robot Framework 7.1.1 (=
Python 3.10.12 on linux)<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt;text-indent:36.0pt">As=
 part of major update changes which impacts the repository test infrastruct=
ure around Python and UI packages needed.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt">Pre-work couple commit =
patch ( testing in progress &amp; will be merging soon )<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt"><b>Current testing Leve=
l:<o:p></o:p></b></p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt">Robot Framework 7.2.2 (=
Python 3.12.9 on linux)<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt"><a href=3D"https://gerr=
it.openbmc.org/q/topic:%22python3.12%22">https://gerrit.openbmc.org/q/topic=
:%22python3.12%22</a><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Please reach us out on discord for any fur=
ther queries:
<a href=3D"https://discord.gg/v4XJwnx2">https://discord.gg/v4XJwnx2</a>&nbs=
p; or mailing list
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc/">https://lists.ozlabs=
.org/listinfo/openbmc/</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a> <o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards<o:p></o:p></p>
<p class=3D"MsoNormal">George Keishing<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_CO1PR15MB4970E5EAC73E79186DC552E4E6A72CO1PR15MB4970namp_--
