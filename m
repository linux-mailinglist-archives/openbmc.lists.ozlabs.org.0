Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF0B9C3E5A
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2024 13:18:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xn7qr67bCz3bcX
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2024 23:18:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=148.163.156.1
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731327509;
	cv=fail; b=Rvf1soyUOE/DBa3KIMVhgN8S04JLmtqO+793NXenmPQYAPFCJKTpv4g17cDCOWZb6WKZAbEGdEITHxSr7p4qn8moOFnpWmUdGl5aszQprlPcREAccyTnW7HxBGCfnN2hXE1S69XuOz6mYIpycvDgsXiUqrl/QtHhZNRl588mDo2EoIvD62aFAnvKrRhduXJUcqTZqH27nXGwb+iMRpJKUnImRCrwqe0xcESQb5Gu2niQDuKJnuDK2EnuP+1HCVg1/xorXU/X3vf9cLb3fT7DSt7AIrUzAAv+WLtzNMQZsxVYizhMj0L085uV6AzCjJlgmwLmjwLfq+eqhTgsG0rgcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731327509; c=relaxed/relaxed;
	bh=PoAxTKO9D+jPSmQoNj0zVbuxPttyOu2A9GRjGhPrPck=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LUQPSp0R6LMHtFjOADiO/PNjdeYwTlPXFFOWOSNZ0cxY1MBHyUkQz2zHefcNuppiJ/KmuiS2BrAcNYI71anuFer0IJC8lxnH1Bb8VXqZa3q0p/SKf6yfvgR9pXj4rkUvZbMfomd3bpJz937kl0PdJZsu4E2HZZi5+3sqIbKG9Ouc8KJOHCbZvWt+lgLliYmeAUWYTsrO6c/Y/V8zBwcuv2+KcHBumzYeo+l2pe0cHq6SE7/YE/7ipANnLIgR1caKTqo8t69SJiXr5irZ6QRiTW9ICLEmqhRhIrfJ/EvtaBM81e2v6+GhT0Heqjh0YP871GLU9nElT5At63pU80UC5g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DWRqusbK; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=abhilash.raju@ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DWRqusbK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=abhilash.raju@ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xn7qm0FpRz2xGQ
	for <openbmc@lists.ozlabs.org>; Mon, 11 Nov 2024 23:18:26 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AB8AmKa001210
	for <openbmc@lists.ozlabs.org>; Mon, 11 Nov 2024 12:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	pp1; bh=PoAxTKO9D+jPSmQoNj0zVbuxPttyOu2A9GRjGhPrPck=; b=DWRqusbK
	8vUy5rceeRuMc55QA+uv2KdlBDMiSH8JkcxUoJGNt0EbPkMB6lPRJ0EbQGCUpyku
	HSz5sHCYi6e3tbc2kF6A0/oMacZLxlG0IFyi74uDQKr51uPLawwLsVBK2zQhGqum
	Aat6G19LAnvVVWV5G5vOnLtVPVOI+dKueChd7E8ZC/dJKOv90bYZ/NB8M2D4j3YN
	pz7q+Or6H4SOz+F8vot2RKEllZ+J3IfQqzAwXUe4CwXZ3GssirgEUthAIPAsWaKz
	7iww9Rs7JKUIoBSHRPbLzDMsig5HsQW/5zsSrgNRuBdt0XJP46sQ5fF9a8I/9Ja9
	kzGVCAL107rJUw==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42ue5y0w1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Mon, 11 Nov 2024 12:18:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCgx0EiSoVftj6Z86j+MFrqUY4//WXYTYi/Xr7h4vOEvCJ1Z+qQfjYdhkD0Uwhm2+IN2k9WikIfqirLzv8TRAJ0HxmEsnD6nbLbbr/tryyLI51wZmdrfgVqx+TYdJE/mHKJsnKrOh8FC+mt8Y+ufLdE3xrhe2U2YGMncSCpksk6WlNyycG4zHwe6kXKKU9jYvLhxW6GACxREY/0sOjJE0hZl+mcmOdWL44GMk0LlySMqCKROaP6WnMM4MF4mmtxx2uCEbd5koxIz3rGhTtqHrTpAbL8mNCFhTXt1yPt9ii/0CQ6MxiN2V1gUk2U+6Cv3taWQAiGOr0pbhQ/q10gunQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0h7ffR9gvgCEj2ukLGSrHeQ6rdIOexULmrI4bPlPhI=;
 b=f/X2eVh4X6bG+TtnF3QBA8WZciS9I9HT8cJ7P6RWLE4xg13LtUIfRCcbEXagHegzGp5JpGPwX6n74jETUi9YfEDrixW5htIbIuo38ue2Fux0wcaDPnHfjPerovsqUizYk6HhMHX9MolWpKv1qxha5iTHGDkFC29bIZAf2BQUKIYNCwdu3XK3r1vuVHn8tlZwe1bF+8ZUEqTPvMpS+hcOkv5BGiUfD1XTUuoPRDXwyKm8YYyn8uTGOwJKQh4l0XXJIyOPe62eqskKxaPVPp6CA0OcGX6I36Ms47xXMNq/5/Sq/s8EKtKRzeNbkPpeRK6Kg/rF5poEh06M7a0LuAvJ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ibm.com; dmarc=pass action=none header.from=ibm.com; dkim=pass
 header.d=ibm.com; arc=none
Received: from MW4PR15MB4732.namprd15.prod.outlook.com (2603:10b6:303:10d::15)
 by BL1PR15MB5339.namprd15.prod.outlook.com (2603:10b6:208:386::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Mon, 11 Nov
 2024 12:18:20 +0000
Received: from MW4PR15MB4732.namprd15.prod.outlook.com
 ([fe80::f3ab:533:bb24:3981]) by MW4PR15MB4732.namprd15.prod.outlook.com
 ([fe80::f3ab:533:bb24:3981%2]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 12:18:20 +0000
From: Abhilash Raju <Abhilash.Raju@ibm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Library For Http Client /Server Application Development
Thread-Topic: Library For Http Client /Server Application Development
Thread-Index: AQHbMzRLl/o3PKX1B06qx8spyZNujg==
Date: Mon, 11 Nov 2024 12:18:20 +0000
Message-ID:  <MW4PR15MB473280BD2CCB658DFA30BAA3E55F2@MW4PR15MB4732.namprd15.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR15MB4732:EE_|BL1PR15MB5339:EE_
x-ms-office365-filtering-correlation-id: 3cdfee9c-dc56-4190-0c4f-08dd024aee87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|366016|376014|1800799024|8096899003|38070700018;
x-microsoft-antispam-message-info:  =?Windows-1252?Q?Jn1rZ+cKogvoplja0NbQlqnrLFVn1d2cswCFm5jimeeu8pKFQ7JLJxsh?=
 =?Windows-1252?Q?hl6xdB1uqRr7S/AExxJAFSQWchljaZxP9wbk6/OLN/b13CxOcNVcR3Vi?=
 =?Windows-1252?Q?Gw9MSU5iz3+USPEvB/ZO5Tr8f7Xz0UZu7sZBER9Oaed7mBVHp+QDmKCy?=
 =?Windows-1252?Q?Ym3S8pYwhXrBak2R5Mudzp6gAij/cN9Ia/upOGSBJ35EZ0blcaCmnK3Q?=
 =?Windows-1252?Q?TogHVixlxGxxL7md42YaL5JI7IXP3Z1dfEVEW64MIoRqq5Cg2iYlicGG?=
 =?Windows-1252?Q?PQQzeHZKHsd2NWBkQQB6qiocN9Yde4X9mfVig9lrTh/a9Y8QU1RRKvlL?=
 =?Windows-1252?Q?I5zHmnlxI1AcMWPcLTs9o6YJk2gNJo9owBnpk2vpbopmLMBqaij5DLsU?=
 =?Windows-1252?Q?VVHcZYb3Fw3RDshmku9Pk9HuqHvt0dNZR0KCjr+eq+UmN3rfAs/QDGz3?=
 =?Windows-1252?Q?EQBaH2OuXO8ACrnkmWlgba2NvhpUBr19+O4KstISV9xl3BaoVtqthyUn?=
 =?Windows-1252?Q?VaCNC3/Hz6yP2X643USgNHK0jqVwhgSuRoNA71xk7MNWaG51FYDCx7U5?=
 =?Windows-1252?Q?89pDngu3kMtFiOE8qgBc/kxlvnPtQIEdhtag3qRTOZgk5iOz+l0Q7yOp?=
 =?Windows-1252?Q?2IdnxTBhcBNcgddoTmDjpLSBLcxO/zLgb5o+UGnz0ski10E4Q2BiIu9u?=
 =?Windows-1252?Q?6aqFVHFwdUSExbkg89r8Egw+tnnJGV3qxYp5z2AieQu9i7IZ0DroGYT8?=
 =?Windows-1252?Q?SorMNuA28xG0neCyS2XSLDga3eB9bXgWvSWWJWzIgpxKIYk0TM8bXmQL?=
 =?Windows-1252?Q?HstqgdEsK5ydD12vIuyx3eoPpZbF2O05ayGqusC0AA0lTrDEtrlMH/G3?=
 =?Windows-1252?Q?64mOLu4L/ybj1ux+xKUvCzwPOyx9XEsplGdEOWUdFwe3UN6kPy987jQD?=
 =?Windows-1252?Q?pGO5PKaaK5wBqtD2cLEXuG1lbkzyJCP4AZE1Z+MMTi8I0Q7CryMrW7Ap?=
 =?Windows-1252?Q?u3Yh7zJpQPA5c6tG/xYpn6fKdLZwFoA2Ta/2jaHV3Mc7uBYczIdGkuMg?=
 =?Windows-1252?Q?SidbjksZadubrZaoIzDu4mNCXZdtKKWCG+6kShe/dHw0lG2jnGtBdWvx?=
 =?Windows-1252?Q?0AMQpmP0N2P4gQ1gD4v2uy4Ovzo10pXG5pG7InmwtQMJcrQuqEHzrJ5C?=
 =?Windows-1252?Q?hfnHnw+txjM0Gw4eMHSidmEHvMvQ2KxB6DvXm0iTJudbTmo0xm9S8AU3?=
 =?Windows-1252?Q?FQnXGonc2TzAdPTXYfblWX0uNr23XVb7ZA8UNeeZr9nMpAHbyX9e2eOE?=
 =?Windows-1252?Q?eaTRHw2hotAMkovrgr+XUyMZHm8KKVClSTvoUFDYpSNROZhaL7w4UaDg?=
 =?Windows-1252?Q?8d1UzdGolXsMarBv+OYtHxzkEpOEwlODDp1nBprWtLFanj2HHGxKb/wi?=
 =?Windows-1252?Q?VzEWsfkdGHRCzc2gmoUj7Q=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR15MB4732.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?Windows-1252?Q?qZCk+7/Dj+kLJfNQmOQ3bSpLwuBZVFtpC7Dez3sJA9Ea0oSMty4lhwsk?=
 =?Windows-1252?Q?bM5Gi5ZQfO1FKzHBKUJIV0EQDvIQDXTPy55RCMgmx8jnxmqRO9eoxP+e?=
 =?Windows-1252?Q?6kpaWhGkfsBij3ztV0mWawqP2GjXnqMiNhRes/JRNmNu3Kf08rXtQCPW?=
 =?Windows-1252?Q?seyiFy0dcUeQlHR47YrsJBxN1E/bWDUHRMAqzhyhIMDo2BPRn2ZmG6Ep?=
 =?Windows-1252?Q?wWmwNh0VijWfTYDAe9oTQ4q+LhtZaMethAGO2+GBKtosYot9W595+L2f?=
 =?Windows-1252?Q?kWTidf//lnYTRovSmuYqfbS1dfcM4b9EsS5p9aFaHX72LUzAZ5Xbz/Jg?=
 =?Windows-1252?Q?sxww+BjPVNO7nCc22VORB72p7imic+y9+polxP2m1nvCtTRcvWNv2kj6?=
 =?Windows-1252?Q?XimgXdKkexANp7+Aco6XrBxnPONT3tJUHdSSDtyVJ9vGe96MtHRe3ITr?=
 =?Windows-1252?Q?fJyM9lztxqtg6Jq3WXhjE5TuXpGrB6+HMfLWiEZ3w4DISTC4AM2j3viR?=
 =?Windows-1252?Q?CfKD0pnXjIJcvFF8FfaaJd6fRVvJgVBjNdJbOfqmgGIB6lOhgB7l0sEg?=
 =?Windows-1252?Q?IN6iOu9eWkAX1F+rcH/VTUu6QERTRpULYiLJeofTCYYc+uwhn4K9so6e?=
 =?Windows-1252?Q?mQ4uMPqL6+cEhUnUWuk2Cc92QHt6JUnhbapPKKIRmYSVRQeGRtck4V83?=
 =?Windows-1252?Q?icA3xWjp5/tZnjlACx72CiE2PQlVA+NhrpGoRLPEYFUZMX9PMitasFOz?=
 =?Windows-1252?Q?0/lFvNVe409isZ30W4Hm8tjkFPD9hlBGP+bvHBfBKtR0kQJxwy2U9OIT?=
 =?Windows-1252?Q?wQLdWHa9aEMkSXRSXr+TkxZgpCDccR9n8UGqJ/tAhz/pkvAqmfdAIjYW?=
 =?Windows-1252?Q?nGeiAebllV4EHSdFxqkfYcxO9dud2rOB2rVhLZD83oHNoOC3QfuIwqI0?=
 =?Windows-1252?Q?BJIyBwyCt83J+3BkWNlDWVI/OqTVirwClv1b1+CDOKLDQEDovtV5NbcT?=
 =?Windows-1252?Q?6uRZmcOi/Z13jJz7lfs8gPrgIFfkI+AKizlCLs7+HAhk80euzbtQn496?=
 =?Windows-1252?Q?iDjp3AJke9a5M/zGCWRl82p38sFH4J0tw+4+ZKNjMUkwqdZVRk0wZ1eQ?=
 =?Windows-1252?Q?yP47HUzu/XHcQxTmAx3Ce6RDf3kNmaQqBwTS/2le9Hsr4U/ONWn+B3kR?=
 =?Windows-1252?Q?/u+kO14EtCdJXw+BahcXVt3vB7uCeSkXCmlzpEZRNxVfoIsL1Z10jwdC?=
 =?Windows-1252?Q?RZ8mc4XIHEsVPAMYwTuBpwZZiv7ZEM647MjIdHE1of3Es1HFyiwpPw4f?=
 =?Windows-1252?Q?/N0OMi/8X1xp9s3XY62Dk4mja/KS2w79ZD8VL1g0XZEliHaEiayJbJGZ?=
 =?Windows-1252?Q?IS7G6Je+27qGv/hQKiSU9X2tjx5J9M0aH/cO8m/r02X+RME5r9PY0RGL?=
 =?Windows-1252?Q?Y4rgtpRZQ7E7vf4yzIB0mEI+pirEDeK/p2LvCN+sUfYxzjeKlGNsN0Uh?=
 =?Windows-1252?Q?nMGoDLCLkRRZ5YUNzG0gIjHV216rnVe5q1E0uWBg8ebwnqeeA7BHeQc9?=
 =?Windows-1252?Q?mLTzgOTpFc5SR0qN0RYiZXYuI8cJecri5ZyafP/Ku3DmvK/gj79s3V+2?=
 =?Windows-1252?Q?K8o3okvg027K7Q9wejupyVSAI41ENhwi5W4Ap6PWRPkalMPDpw4ECU4f?=
 =?Windows-1252?Q?fjjYa+mp7Cl61Pna7PpacX7pljMq39/UeMeqxtvHerooEMj+w83xqw?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR15MB473280BD2CCB658DFA30BAA3E55F2MW4PR15MB4732namp_"
X-OriginatorOrg: ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR15MB4732.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cdfee9c-dc56-4190-0c4f-08dd024aee87
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2024 12:18:20.8620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O9u5kO7v4K36cneTKY9rrZ7D89wTuorBVj8SvD1JxZNrAxEAhtzBEw8YVkd/dTBZenyzsYOL77ndql/UDxzk0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR15MB5339
X-Proofpoint-GUID: 4mp3liVE9UD1hQuCe0G95NbAijpbr7Zb
X-Proofpoint-ORIG-GUID: 4mp3liVE9UD1hQuCe0G95NbAijpbr7Zb
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411110101
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_MW4PR15MB473280BD2CCB658DFA30BAA3E55F2MW4PR15MB4732namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


Hi
I would like to gather some feedback about having a library for BMC to add =
HTTPs features to BMC services.
I could see following use case that demand such a library in BMC


  1.  Auth Server
                Transfer the authentication /authorization responsibility f=
rom Bmcweb to auth server.   Currently it is spread between Bmcweb and Phos=
phor User Manager(PUM).
We can simplify the BMC web implementation by delegating the task to PUM. T=
o achieve that we need a secure encrypted communication channel between Bmc=
web and PUM
Since the communication needs to happen before the user is authenticated, g=
iving Dbus access to the user may not be a good idea. But HTTPs over Unix d=
omain socket looks like a viable alternative.


  1.  Redfish client

There may be cases where services in BMC wanted to make Redfish/ Rest reque=
st to service in other BMC (Aggregation and other communication needs betwe=
en peer BMCs)

  1.  Redfish event
       Transfer the responsibility of redfish event from Bmcweb to separate=
 dedicated service.

  1.  Offloading logs and Telemetry data

Logs can be periodically offloaded to external telemetry servers.

I developed a library with no reliance on any external libraries unsupporte=
d by OpenBMC, resulting in the creation of The Reactor Library<https://gith=
ub.com/abhilashraju/coroserver>

Features:

  *   No external dependency on any new tools.
  *   Based on Boost Asio and C++ 20 coroutines
  *   Asynchronous APIs using coroutine
  *   Easy to use and easily composable Web-Client API. See example<https:/=
/github.com/abhilashraju/coroserver?tab=3Dreadme-ov-file#example-web-crawle=
r-to-extract-links-from-a-web-page>
  *   ?when_all? implementation for fork-join pattern. See example<https://=
github.com/abhilashraju/coroserver?tab=3Dreadme-ov-file#example-concurrent-=
downloads-using-when_all>
  *   Support for HTTPs over TCP and Unix Domain sockets. See example<https=
://github.com/abhilashraju/coroserver?tab=3Dreadme-ov-file#example-web-clie=
nt-to-download-content-from-local-unix-domain-socket-server>
  *   Easy to use Sever APIs for fast development of HTTPs server services =
See example<https://github.com/abhilashraju/coroserver?tab=3Dreadme-ov-file=
#example-simple-http-server>
  *   Works well with sdbusplus coroutine APIs

You're welcome to experiment with it and share your valuable feedback.

Regards
Abhilash












--_000_MW4PR15MB473280BD2CCB658DFA30BAA3E55F2MW4PR15MB4732namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;
	panose-1:2 11 0 4 2 2 2 2 2 4;}
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;
	mso-ligatures:none;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:33233986;
	mso-list-type:hybrid;
	mso-list-template-ids:-1224196318 134807553 134807555 134807557 134807553 =
134807555 134807557 134807553 134807555 134807557;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7 ;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7 ;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7 ;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7 ;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7 ;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7 ;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l1
	{mso-list-id:1112749727;
	mso-list-template-ids:-2076794010;}
@list l2
	{mso-list-id:2011255005;
	mso-list-type:hybrid;
	mso-list-template-ids:1496462542 134807569 134807577 134807579 134807567 1=
34807577 134807579 134807567 134807577 134807579;}
@list l2:level1
	{mso-level-text:"%1\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l2:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l2:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style>
</head>
<body lang=3D"EN-IN" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I would like to gather some fee=
dback about having a library for BMC to add HTTPs features to BMC services.=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I could see following use case =
that demand such a library in BMC<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<ol style=3D"margin-top:0cm" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l2 level1 =
lfo3"><b><span lang=3D"EN-US">Auth Server<o:p></o:p></span></b></li></ol>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span lang=3D"EN-US">&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; Transfer the authentication /authorization responsibility fro=
m Bmcweb to auth server. &nbsp;&nbsp;Currently it is spread between Bmcweb =
and Phosphor User Manager(PUM).<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span lang=3D"EN-US">We=
 can simplify the BMC web implementation by delegating the task to PUM. To =
achieve that we need a secure encrypted communication channel between Bmcwe=
b and PUM<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span lang=3D"EN-US">Si=
nce the communication needs to happen before the user is authenticated, giv=
ing Dbus access to the user may not be a good idea. But HTTPs over Unix dom=
ain socket looks like a viable alternative.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span lang=3D"EN-US"><o=
:p>&nbsp;</o:p></span></p>
<ol style=3D"margin-top:0cm" start=3D"2" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l2 level1 =
lfo3"><b><span lang=3D"EN-US">Redfish client<o:p></o:p></span></b></li></ol=
>
<p class=3D"MsoListParagraph" style=3D"margin-left:72.0pt"><span lang=3D"EN=
-US">There may be cases where services in BMC wanted to make Redfish/ Rest =
request to service in other BMC (Aggregation and other communication needs =
between peer BMCs)<o:p></o:p></span></p>
<ol style=3D"margin-top:0cm" start=3D"3" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l2 level1 =
lfo3"><b><span lang=3D"EN-US">Redfish event<o:p></o:p></span></b></li></ol>
<p class=3D"MsoNormal" style=3D"margin-left:54.0pt"><span lang=3D"EN-US">&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Transfer the responsibility of redfish e=
vent from Bmcweb to separate dedicated service.
<o:p></o:p></span></p>
<ol style=3D"margin-top:0cm" start=3D"4" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l2 level1 =
lfo3"><b><span lang=3D"EN-US">Offloading logs and Telemetry data
<o:p></o:p></span></b></li></ol>
<p class=3D"MsoListParagraph" style=3D"margin-left:72.0pt"><span lang=3D"EN=
-US">Logs can be periodically offloaded to external telemetry servers.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal">I developed a library with no reliance on any extern=
al libraries unsupported by OpenBMC, resulting in the creation of
<a href=3D"https://github.com/abhilashraju/coroserver">The Reactor Library<=
/a> </p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">Features:<o:p></o:p></span><=
/b></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l0 level1 =
lfo4"><span lang=3D"EN-US">No external dependency on any new tools.<o:p></o=
:p></span></li><li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-=
list:l0 level1 lfo4"><span lang=3D"EN-US">Based on Boost Asio and C++ 20 co=
routines
<o:p></o:p></span></li><li class=3D"MsoListParagraph" style=3D"margin-left:=
0cm;mso-list:l0 level1 lfo4"><span lang=3D"EN-US">Asynchronous APIs using c=
oroutine<o:p></o:p></span></li><li class=3D"MsoListParagraph" style=3D"marg=
in-left:0cm;mso-list:l0 level1 lfo4"><span lang=3D"EN-US">Easy to use and e=
asily composable Web-Client API.
<a href=3D"https://github.com/abhilashraju/coroserver?tab=3Dreadme-ov-file#=
example-web-crawler-to-extract-links-from-a-web-page">
See example</a><o:p></o:p></span></li><li class=3D"MsoListParagraph" style=
=3D"margin-left:0cm;mso-list:l0 level1 lfo4"><span lang=3D"EN-US">=93when_a=
ll=94 implementation for fork-join pattern.
<a href=3D"https://github.com/abhilashraju/coroserver?tab=3Dreadme-ov-file#=
example-concurrent-downloads-using-when_all">
See example</a><o:p></o:p></span></li><li class=3D"MsoListParagraph" style=
=3D"margin-left:0cm;mso-list:l0 level1 lfo4"><span lang=3D"EN-US">Support f=
or HTTPs over TCP and Unix Domain sockets.
<a href=3D"https://github.com/abhilashraju/coroserver?tab=3Dreadme-ov-file#=
example-web-client-to-download-content-from-local-unix-domain-socket-server=
">
See example</a><o:p></o:p></span></li><li class=3D"MsoListParagraph" style=
=3D"margin-left:0cm;mso-list:l0 level1 lfo4"><span lang=3D"EN-US">Easy to u=
se Sever APIs for fast development of HTTPs server services
<a href=3D"https://github.com/abhilashraju/coroserver?tab=3Dreadme-ov-file#=
example-simple-http-server">
See example</a><o:p></o:p></span></li><li class=3D"MsoListParagraph" style=
=3D"margin-left:0cm;mso-list:l0 level1 lfo4"><span lang=3D"EN-US">Works wel=
l with sdbusplus coroutine APIs<o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal">You're welcome to experiment with it and share your =
valuable feedback.</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Regards<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Abhilash<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span>=
</p>
</div>
</body>
</html>

--_000_MW4PR15MB473280BD2CCB658DFA30BAA3E55F2MW4PR15MB4732namp_--
