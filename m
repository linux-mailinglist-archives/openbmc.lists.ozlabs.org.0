Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 807C4A64E7B
	for <lists+openbmc@lfdr.de>; Mon, 17 Mar 2025 13:19:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGYv42B0wz3bwf
	for <lists+openbmc@lfdr.de>; Mon, 17 Mar 2025 23:19:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=148.163.156.1 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742213981;
	cv=pass; b=FQu1bJO3lbW0SR2xSfyqjE3ZBQ7Uldv7VuYAqjTjyml/DGxCrWIuSaYCSlYKU/uaDr4Lz9Kcdo2ebnr5MP3T+7eAWeWsYSXAbQEWwGvpDnLvq0B2/h4Dn76DeX8bNpl23N3QWpdr+ISel8UXkmqPknzCRdqgp6W+8LoUG4qj5/UOixX4VXzFDjEfdDqYEV7GbIjxNx2ogkBUAdac+nqH5s1MwdP3jW1SI00X+TTKOlJo5wJ6pA6z66P8A/6J6FkvcTFvHaESAR2eEMnUrf8FtIHb/miqN3PxB2L3DCWbCyQI96H14t/tKM1IF0PDG0tJjvSvkVNjKWVqSQmTJ0RUKw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742213981; c=relaxed/relaxed;
	bh=A/Ta425PZH38wYlZIz8aepTxKicR8iGqYdqPq9MnVtI=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=P36FNlu3gwKQYZqvMidatnVe5pJ42EWb97XddPUPg4NxxamRxvkgIZRg/png50rEbhX2SNsRSVEw1TaDIWpQBUEJxxPquVamkrRM76Aw5IcA141FB3kwukcsgLk1lZcH7XquiCjb5uGPsSRznqtY0cmMBrN/n2AR5rEzpsN41cAZjGG60WYIQuQfWRJW45Ttr6XfE6MlkoaZ6t8EC6JE9t2B29ZzLCspApojqnnf2J7Lr55+SMb+m1r8EjT1MJKz5zO/cD8FX4SCcslPn5tbY3cwxpp/6B0D/ykHvgwEqPicYX8ZH58tFidTXzuHi8EJGB3H7cV8i7KTohp9Ro4KPg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=in.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h5lAAK92; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gkeishin@in.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=in.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=in.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h5lAAK92;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gkeishin@in.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGYv01N7zz2ym2
	for <openbmc@lists.ozlabs.org>; Mon, 17 Mar 2025 23:19:39 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52H5j40u001322
	for <openbmc@lists.ozlabs.org>; Mon, 17 Mar 2025 12:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	pp1; bh=A/Ta425PZH38wYlZIz8aepTxKicR8iGqYdqPq9MnVtI=; b=h5lAAK92
	0XT3Gfk3NvYqUm1fKV2NZc2kBT183ausok1CQzed+t/d/Zu5h69MSQ8S9Sn/RBwZ
	e9+wGS6O0S+8koNwIl+POnVnWLVRYeeod1geM1N2Iv993nLFg3CsEeyLzTSwFYuU
	DGmj1L6FOGDv4vuHA93f1O/adMSm91hgswCJIecxyc4h2uwCYCmhWp9lVf3xEwds
	R564WWtOadMxEp/zoj23IXbGvj9f4tqi50HtOLw/l/H7NbEDX5vRKU3Y6eqRfviJ
	b30/YVlBPmI0yfc3FDxwDHFmedIT7sSrNYpsyCXbImVOkiFWbox/e6wpYlYpy0lD
	ebE1T0EASAFYNQ==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45e02nv9kx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Mon, 17 Mar 2025 12:19:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+usngmGevqmnajeegs2juZGn3KsGQBN0j8yHf3WMoOXrq91GAsSXZjV+HtxAgHSj+5u/g3nChbw07zZZa8K2ieWZDJI6lQr1izYGBmszVzkv6inQzpIOhdGZxgeMQPHiyEWpVjIGuTDw+j92iYBhYIsQswpBwirvOn96XIhP8IzEedsGmhVR47ZaXz6mRpWiaD6wBgONI5IDsY4WbeW3n62Fch/lrb0HAlb8A2XOkZfrqZfGDEzf9t/diC1+bsWOCmfbZ9U4+T9GTl0dDLSr0ZaAUHu9hCMDJDRlV4W6pgso9TU/2b4LOAiW04PqAHVsUM+RSzJtGHMBFnTUT78JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/Ta425PZH38wYlZIz8aepTxKicR8iGqYdqPq9MnVtI=;
 b=edDfVbbigYibuI5BEoh85TLEqx9cwjoHTS21LL7DnKOpzktWWzv/WtGcS4cVNeUgyivoYt5/olTQyREFgQS4KaydyX0xsloqgIoahl3xa1aXpsLWLMgViDUQ0TAd46OxvEuc/KXwqaosuyL7iAFK8ikUMOzvPpfFumlfkqLLfhUbng236x8M2AU2e3Wh+IKSro7kA3MGyb6nAy/v2gfnjJqXd7JelNehSSKiI+5kEMRIk0Z61cp0APBLQTyRp9AGLIBksuYq3a9VD+6t1tHm/y3CEW1m5CnajtY5ywEC4Tht6ZPRMlE7fRqHNAY1/AponJNqkBNFiR5YKlGs0AO9JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in.ibm.com; dmarc=pass action=none header.from=in.ibm.com;
 dkim=pass header.d=in.ibm.com; arc=none
Received: from BY3PR15MB4962.namprd15.prod.outlook.com (2603:10b6:a03:3c5::13)
 by SJ0PR15MB5823.namprd15.prod.outlook.com (2603:10b6:a03:4e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 12:19:34 +0000
Received: from BY3PR15MB4962.namprd15.prod.outlook.com
 ([fe80::23c9:4310:6491:75e9]) by BY3PR15MB4962.namprd15.prod.outlook.com
 ([fe80::23c9:4310:6491:75e9%4]) with mapi id 15.20.8511.026; Mon, 17 Mar 2025
 12:19:34 +0000
From: GEORGE KEISHING <gkeishin@in.ibm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBMC Test Repository: Pre-work for Python 3.12 changes and
 packages update
Thread-Topic: OpenBMC Test Repository: Pre-work for Python 3.12 changes and
 packages update
Thread-Index: AduU3mYPGJCtyewpQUaiVbzWiZWfrg==
Date: Mon, 17 Mar 2025 12:19:34 +0000
Message-ID:  <BY3PR15MB49621C07BEFD1BC4E0EB63AEE6DF2@BY3PR15MB4962.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR15MB4962:EE_|SJ0PR15MB5823:EE_
x-ms-office365-filtering-correlation-id: cc310926-6d6d-4268-3eb8-08dd654dfa35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|38070700018|13003099007|8096899003|7053199007;
x-microsoft-antispam-message-info:  =?us-ascii?Q?eJg0aJ3eMt0sY7SZLQxR2pkS+5cA+cjNqqissTfl4mzAk01ylvdezBDgV+u3?=
 =?us-ascii?Q?unPv89plywF1x3I8YGuXqCyti1SIKjNA0aKdgjch+NtvhmcYo009bsQXZ9NO?=
 =?us-ascii?Q?wUhG9Fp6yH0TiElXUz+fF/KJ0Ac2VellgUHJYJem9OqJhL77eHAGD2//73lb?=
 =?us-ascii?Q?KyCe/2NK2OYdqbrwFpvq0GY9hOBKWqQsbXgAprtxgq+wKEZQUrvvqJTVLi/5?=
 =?us-ascii?Q?Cy2rH8wGRVFmlF2dGFyXxEgIaeOdjlQosXzfD/Og6yv96Zc/ef+f+js9EExh?=
 =?us-ascii?Q?mAjBjlKIHpUSd2Lf9xrgzXFidU5KnwCzFTww7OreeHJOwJLbBta6mut8d3O1?=
 =?us-ascii?Q?zSp9VzPzG0FpsDI3MiFGjYtoNw/9sgOg4/W80Xb/NmDRHN/SLQJHR2Ci4Tf+?=
 =?us-ascii?Q?A5pFMmpw4/N4WBFiMecijQJIuS4kPytrqUKKiHkaoG+0uIk+WsdV0I6PwRwW?=
 =?us-ascii?Q?DheZatv7LEXD09g1WuE/us4xXJpZ16lLnZP3QZVrbBFFdxo6rurJJNNqudLx?=
 =?us-ascii?Q?GQU1d+WWWbbJNtrhOLw8w2wLshVPJdnm4ybUc6X8ur4h6P9YI4hUAzBEFzTo?=
 =?us-ascii?Q?NvS837XZ+ELv3exAt5rUpLG2JVWiLrM2yoQFHH3R9wKjHpvQjPg3i+fucgwC?=
 =?us-ascii?Q?PbBRymAY5Pvuq9GhUsFLm2pzGHZvJtSrgrAGd/ZinzD5Y7nS0mYsX1PA53k/?=
 =?us-ascii?Q?aGThfAz9CmMimT7VDV61BSnwYJOJX6M71++REhzY3cBf508p8XSUXnYbINdx?=
 =?us-ascii?Q?rsiPYt3Jo2aVwN0uBvewHwJGYwrTpPyMQsIsLF9aVC78jrkVskS7oLKM9JCW?=
 =?us-ascii?Q?qwBF7TTWGXexe9Kn60pyXwT2vNRvfvjAcOX4bCoddlM1Z9v+eEqYlAXaEmEs?=
 =?us-ascii?Q?nE9EwFhfN0jN4KI5tD0LqbLwe61BRi8MdcAQZBZD/CbcWtyVKR6dDA6ih1Fb?=
 =?us-ascii?Q?zFsRj1MpnyBnu2PtCQNIo/fqRuAoZjg005OQMa4p0ZWxtuJ/s5Pm8bykxkxy?=
 =?us-ascii?Q?CXrgqzmBma0JEiNNpo/e22emRNjxRSwsx7zj1F0VaoXhWMypfWJ8p6T6GSd0?=
 =?us-ascii?Q?g2t8uONVlZsBSCupXU5shKQtFyk64Kz6LWU1hTccAQUYN6Jk3PBDgTiCBfcg?=
 =?us-ascii?Q?iEr8XmZzaZoPvo5cm2V57/Xjr9nJLqU1oYN9KUfH98tq6oiiI+qZkwjebeJi?=
 =?us-ascii?Q?Q7nSS2wKIzInJd2RP4VXcFOIvGE03y7cx5744R6JEWhE6dYAkQTVQhynP2xG?=
 =?us-ascii?Q?7iSAn3bHNl5pkukg1HItW8KYi/CZ9O+iKh+95H3w1JdpZRpP0cxGd2nSGPUu?=
 =?us-ascii?Q?Gkab3oh9LDEAszoDLOuT+CkJdGnNyzGy6bxLNX2keaE/nTHsyh0EClT5MemJ?=
 =?us-ascii?Q?gcZ4QF71v8SnthdqD481bWInEmDzWFH+0mWIZPQ5w+OgtwyYIg=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR15MB4962.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700018)(13003099007)(8096899003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?5s3ZMPvWC8hk58ft2EUb33Vls4vcCY5ldaQwKjsFb/ay27KovZ80c2++jLcu?=
 =?us-ascii?Q?736O4+BCpsg0ql+XnHar7w2yMQjVmuizHslrGTYiKM/SI4uI1Irp9dti/6Mx?=
 =?us-ascii?Q?PHJTUb+Unho9U8bWYdNvVGc6qLqSeQ1A+8qnkKInNHdEGSffltslLiv3I2dV?=
 =?us-ascii?Q?Neup0fD7RNYnIjKRfb5nmnwDTf2ew7zKpg8FWCCd1Pq5i3t7WlOFowpPxS6W?=
 =?us-ascii?Q?lWBacJ0ydqM/qWQSNvqpzoMIbq8nX/PXX7xhzUmh9WAac0osPzmaPbHYjymv?=
 =?us-ascii?Q?dkncz4CZlUXaTYiGFiuMkA0wFVzewuT3UpMk2tR38O4z7LUhqPX9ZgmhdeRc?=
 =?us-ascii?Q?SCrjkFMurvlv5UvtaxBVf08GJOurHjAecZcHg79Mdq6CFnuBolaXaxSGpis0?=
 =?us-ascii?Q?2aJDF3aUpUqEimtdVPI6UGFbFen7t9CM6nupSHg7aq7xtLmT5/rueogevFnM?=
 =?us-ascii?Q?jGJRocl1EWNYG6/KlP4Seux/nXXy0GuFTlZd7SzBiyqCsLnhGmdOvqIJMxNw?=
 =?us-ascii?Q?EITnFBLfA1k16NQTHytfUCgPFYBFKsnDiIogOFU3ORSTwkP9a3oTkcvlYE6s?=
 =?us-ascii?Q?pu4nthdIrXFUHPGimUkxU/KavM3wio1YT/Sg1KjipCaSfrPi8MGSeD1ky2Qi?=
 =?us-ascii?Q?ODA1fqMmOGgYmRa0ZT1CTJn/E++zOuiGGLumhR9db09Gwh/S6KUfgQiqnymk?=
 =?us-ascii?Q?zxMhTjToqE2Z/WfcxAiVdwGQvg5fQP4Ejn/P6zj0oUuFn4GkX6KokspXnF6N?=
 =?us-ascii?Q?PdL+T6OkLzJdH+5qwUYpM+m8OMU8iLbHslZABlaYtdty92f1T6ulLfpJ0iAt?=
 =?us-ascii?Q?3wtQI1WedbUns/3F5Lgb4o+AFltJM8zacJ1ROgmllcwTFQUAwqZCvZU0ZIDF?=
 =?us-ascii?Q?GZR8p/WsrlS2cIFN/V7sA/nxb7AA3tRXwXL0WT7bthywOrPfVkF7gLIL9xu6?=
 =?us-ascii?Q?YgHlv5tb5enwhViKCwOkYF0xNN9EdKruynKkxj4sxkCsp+IUi+px4P/xqxE0?=
 =?us-ascii?Q?Zf2IRGvBxZqqO4EW1avFuVy5uzLUvt4hMZm4AhPu26Hzqvy4pAfKtWsmucj7?=
 =?us-ascii?Q?3TS+WuXyohnJ3C99aAtE084dUJRurqxufk312aRYsErtedEzd+QiaZcXa9Bz?=
 =?us-ascii?Q?ytzRhzeKw2l6dsRY3Th/SJvB9gC9UjFij6zj2lyk3m2rzn/bAzFd9YMlwgsU?=
 =?us-ascii?Q?dm+GJdtamPlO7nvRjPFzVh5yga3WfeNh/o4vBJdk+nCiZr6q6T0AflpCifdU?=
 =?us-ascii?Q?tHWaohigC+sowW4sn7PeyJKwYifDf3X9aRgC0GLPtGyZ2DeG+KdXglp+hXF6?=
 =?us-ascii?Q?4TPWvYNO3EMkyO4qDcT1psOnDTTpYgwJVjXlsu2zytYY3tzvTC7qRyPsEJgy?=
 =?us-ascii?Q?Vai2wg79qbwQ3ZAWOWCFe/17xHXHc2gIJKjydwIhF56k0PBx6UdhjgS095Gc?=
 =?us-ascii?Q?ccCRKKCNkjmiIpVZyJGSpDzDobRYOmNUOSGYr9luubLs+FhY/wATzuff1YNH?=
 =?us-ascii?Q?NP8E5XQ7HqKDc7RSqiBoFGr/4lZXc7rOLhEqTXuN2g1mtBkBgIIpI2gB5Yvk?=
 =?us-ascii?Q?Pb0Sr0gnrIdmn7cuRdo2fRzb1lvkBJTXL+0zrMNcvSLFXuZSd5kwIKk+NzvM?=
 =?us-ascii?Q?zivKE88hL6WeyTie5ogNppNyhAWgr/EXim7l0TnGmleJ?=
Content-Type: multipart/alternative;
	boundary="_000_BY3PR15MB49621C07BEFD1BC4E0EB63AEE6DF2BY3PR15MB4962namp_"
MIME-Version: 1.0
X-OriginatorOrg: in.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR15MB4962.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc310926-6d6d-4268-3eb8-08dd654dfa35
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 12:19:34.0821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7hEC01VqZSLv7HKzBRtKSTYfwXBCpa/hGXYsY7K/0X/EASYsftDjjc5JlbitmkspoG3sz71KIKNPcIWcecyLFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB5823
X-Proofpoint-ORIG-GUID: Q1AeZAHUpZ2b0KsUeDwRbbtWP39ccC9B
X-Proofpoint-GUID: Q1AeZAHUpZ2b0KsUeDwRbbtWP39ccC9B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_04,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1011 adultscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170088
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

--_000_BY3PR15MB49621C07BEFD1BC4E0EB63AEE6DF2BY3PR15MB4962namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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



--_000_BY3PR15MB49621C07BEFD1BC4E0EB63AEE6DF2BY3PR15MB4962namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
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
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
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
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt">As part of major update=
 changes which impacts the repository test infrastructure around Python and=
 UI packages needed.<br>
<br>
<o:p></o:p></p>
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

--_000_BY3PR15MB49621C07BEFD1BC4E0EB63AEE6DF2BY3PR15MB4962namp_--
