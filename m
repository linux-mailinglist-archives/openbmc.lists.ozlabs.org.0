Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA63E9D1AF4
	for <lists+openbmc@lfdr.de>; Mon, 18 Nov 2024 23:13:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XshjD47KFz3cVd
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2024 09:13:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=67.231.153.30 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731968012;
	cv=pass; b=QsaiDBWxi/4KWFq6AX5IxIzzOgw01TDprnGluHWCxTv94ga4ifg69BdSrT0Y54EZy5Z9ppOfuqWCejKhGATdA+kmG/1vOrh3OJ5IRDjlM1rZ4LZC3OHUT+yzCUYonG3w2xSPpB/GZLj8TZS1GI4PRlI4tubHrQkkmX3w9QODSvo367z49oGV7QlZxrawNwlIUwNo9HxVdU7rcwZPfHJ5+iKHy5s1Id9xZHsPMfNRny2rfQJaCMLz+a6jCVes9NsRFEKnXRG55enVSvswN5vk5L+gTeddbwxaQpBDBfc2SQ5kG0SOBaKLyFeJiHUmGwPos4okj6WPlI0mDrByWalWRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731968012; c=relaxed/relaxed;
	bh=VFTVM2v8Vk8TezWzXeVV9b0ZS/aRh2S2/F5jjpHxq2U=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Y+nHW2ClbXBBp0uIS+GbfSYIWKL2AKB6/31da64WV5DeOgYdOTuDND+Sx5MVJCC+yCxpztTgmG5XQwxgxNEj5rLO3IwcsssOi8KURStqqw0XsF8gtVybPmeyJxPdhjMXjxPEqf5ufTN/lwU0hcoG4Lids+z/yDkfCj/Qxz3ZMHvMD0EvlYUh+3jF5B2DqcHs0JLeWP11B8kI45YjjPQ9rR6A7BQT8Oe015KQgk5lje3E/prVTaj36dKq7DgJe2U8myG2oDYadivru5kbbAAN//MQK2J6chOfJ9Ska+FKn5FC8fE2LTc7s+WMBmzD4UQNFTiorgiDIfSCnI0DeRxxZw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=meta.com; dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=s2048-2021-q4 header.b=bv8YSBz0; dkim-atps=neutral; spf=pass (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com; envelope-from=prvs=6052bfac03=jagpalgill@meta.com; receiver=lists.ozlabs.org) smtp.mailfrom=meta.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=s2048-2021-q4 header.b=bv8YSBz0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=meta.com (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com; envelope-from=prvs=6052bfac03=jagpalgill@meta.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 636 seconds by postgrey-1.37 at boromir; Tue, 19 Nov 2024 09:13:30 AEDT
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xshj630drz2yGf
	for <openbmc@lists.ozlabs.org>; Tue, 19 Nov 2024 09:13:29 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIJaEso007072
	for <openbmc@lists.ozlabs.org>; Mon, 18 Nov 2024 14:02:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	s2048-2021-q4; bh=VFTVM2v8Vk8TezWzXeVV9b0ZS/aRh2S2/F5jjpHxq2U=; b=
	bv8YSBz0LsHTYSjs17cpdTqSImvNkgDFetRPQiYYeYaxufOyiqXn815gLoSU9KfD
	A/fAmXTlmHkvi8w5CULONVWwbdc2fqVSYdxXnfGG/jXAxbXNChblXdngKDUVg7+P
	558aSsqML2TB29OmGZeINtW04eKCWvpElv/uJc8RBsRzYDUvnSRWAG8p6KR1KJV1
	NGwUZ52SZRLzF99bWUmSPgclmhwp+0+YRU87Wr9Y9HhcDYZ/WPEyOAifxIv0nvhA
	E8K38ANMRgevH6mqVnJJD7nj6n112schtntSQVdy/peybkW3yEeecmpIytDfW4AG
	Zw5RI1s+BtFsolhUqaqY9A==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 430btts01x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Mon, 18 Nov 2024 14:02:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmX1b6dURs82RgOVFB8sAYDPYa4CEkuGETcrO0FvhDMn7Kt0elrng+yXScrcn/4GuGjUUiJrbPKTN3LaON/dPTOq7haAfOuZoKFY0aeiVRHhygYs5fNZZz2I9/dqSzzT308LnCq+LV5hQPAeuVXBLqjqubcNSYkQQeG3ugjlbbphSOs78GZZOIPRo3R+eN+WzUdDYT7LB75cAv9PUmgesnWmGMFWkqbE/cCh4iRSW3QY7tstfS7wqzONz0D2gF5ACpZaH7Mpvely2S3bUrzKbIzZCJjSTiE+NRfuIxrFhmvAktmui90XtkC1R4PyreCnoF8AQawGq+yngd/dzwqI9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFTVM2v8Vk8TezWzXeVV9b0ZS/aRh2S2/F5jjpHxq2U=;
 b=W82XqZlLPRVmP4UrSQMYS/o5U45AqkJR3rRHSCxWsmcajqjWFJ0xvTcio/Pdn/JdKopksz3SY99Y47U/Py5GmEtR5G8xzQ0gKqCsOAXEb5nIO40cTdm6vzKGah9x0gonBlWYuW6EdlIjryyjyH56CjtB22vLCwDePeYCjtD8zedjI51Ky4JgFOFqFzZuqGVMDk1t1nvBs6T86wo1XfmtTfvh/faeYpYifJKGEByQiOEuQj6ypaEJGm2jUypCm0gyzQCpKtnxNP7fwpPZvNaRD+I3AZ+5sczpD6franvsvOrqqN4BuT2l7WLBQyvm8OIrDlPMQE9B4f5KLeCsOtcLmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from PH7PR15MB5342.namprd15.prod.outlook.com (2603:10b6:510:1e1::11)
 by CH0PR15MB6211.namprd15.prod.outlook.com (2603:10b6:610:181::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 18 Nov
 2024 22:02:44 +0000
Received: from PH7PR15MB5342.namprd15.prod.outlook.com
 ([fe80::859a:3263:f65f:5743]) by PH7PR15MB5342.namprd15.prod.outlook.com
 ([fe80::859a:3263:f65f:5743%4]) with mapi id 15.20.8158.021; Mon, 18 Nov 2024
 22:02:44 +0000
From: Jagpal Singh Gill <jagpalgill@meta.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        openbmc_compute
	<openbmc_compute@meta.com>
Subject: Enabling StartUpdate D-Bus interface for FirmwareUpdate
Thread-Topic: Enabling StartUpdate D-Bus interface for FirmwareUpdate
Thread-Index: AQHbOgWY3DoRtB518kKLvTZqkF6lag==
Date: Mon, 18 Nov 2024 22:02:44 +0000
Message-ID: <6A6A014A-8568-45CF-B8F0-199B82738B12@meta.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR15MB5342:EE_|CH0PR15MB6211:EE_
x-ms-office365-filtering-correlation-id: 9a0d4f21-f534-4a40-f6a3-08dd081cbac6
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|8096899003|38070700018;
x-microsoft-antispam-message-info:  =?us-ascii?Q?YOoRMdg37CMFae986TPlV0exXfu9uGUgP7W8Ilb5sQw9jdjMiojxy2kdQuac?=
 =?us-ascii?Q?jVHIjLFgYZ//f82/x5GUrb54m8+6v8oC69jQGzugjtD8MYraSMb1WUZEJp44?=
 =?us-ascii?Q?M5XlFWaA7s3ypEueUsVMxSlP+5qjqqrIcU9hLPWZ0QabKyzEzfLFsUYUvBoK?=
 =?us-ascii?Q?mzBiNFMT7pYHyXgHLJ3ZrpnDEg7k4SkDWPVwZbe1LkB7gFGkcaRGeSxXqeEY?=
 =?us-ascii?Q?fh92IQ4sd7c1lBnwV81cXVItX6dmAJIYbpPWstodlN8harOo489QpOKRsFZ4?=
 =?us-ascii?Q?XIa+DKheoXcP576sIfLnp2cCNn8DQr78ey9oMRTf8pq8K0WJcTYfbh7Ij61K?=
 =?us-ascii?Q?bIjZarBU8gONzB3TGtAgYkbU7GnKmFdwWdoXBcdKefaGw4HMRIdUR4ohchRj?=
 =?us-ascii?Q?WpLpnYOFh4NU0A/KGgbk1hm0q1cuHiI5VHLDSXRy62CAmKG9AKXRwn/+ao0I?=
 =?us-ascii?Q?pPmUbZ/+y9I2CdjBYNIiYJcveGj0p0bnGCZqhi16RuMVs1ECzcwe4ibEhoFB?=
 =?us-ascii?Q?lVvaZCwrhksHrU4hhQpx8bHgTQh/cVJOefqceS0oUvWVP0jjaUYf7Ry0oDyt?=
 =?us-ascii?Q?UhCI/gXULrsNOaHPMhJOxiHy8XC58iEfLDq0qsMn5QiDelhVHYItomY6uRlF?=
 =?us-ascii?Q?UjLrWF0mI07l+8txeCntpIcKar6gyIeZ6x6QWlK/4PxKOXQKQcUjq5cnsdGz?=
 =?us-ascii?Q?i4XWWZHnlcojjGhgM+L+ceHxmgWNT3OktUGg33OsFBTDeABgdOoE5hyAiKW8?=
 =?us-ascii?Q?wR4T04QyeLHwYpRi5P6LZOWrUPP8t+ysuhWb5o8gHLcUp6DYykROzy8N1D8a?=
 =?us-ascii?Q?IbTAafiaXvfxVumT7puAeqcONY5ZVOVdV8cTikWeS0PAu2MSLsAFTe0npyEb?=
 =?us-ascii?Q?ZuOIG2yLbZAE6D0YdCEnuFENNKKzUxifdrwk6NJqs47N01/bF6u7GgvNwOab?=
 =?us-ascii?Q?B/QEeFdHB4UGJEMI/fRf0eAY6JVgsIDsDWh0+7h4Wdtv98BRT/4zS7K0i5k0?=
 =?us-ascii?Q?5FJJAH24OXMo25APteVhML8wlVk72Dkz792MFBPmPWnYHTCVhyq4rDqwB+CO?=
 =?us-ascii?Q?Z9Hf+J23H2iHik1wvFKONyVuD/XvfohRMqKMedIJc1OXgxN39RWPm3VuUmAF?=
 =?us-ascii?Q?HgqCfEiGklQUMLrkMQNchgx4EMhwmnI2PWVO3Xa7DjWb5x92SgV7mro683Qf?=
 =?us-ascii?Q?HFqTAvvLS78dqhxHhe4Oelee//Xe8f+MzJteCCKRX9A9IY7pabFHjIOxky/N?=
 =?us-ascii?Q?X+trczx0bG/bCCstDgQdLvgUcC/cRTMflOmIgC6E9Xa+X5WvG/5ADMC5vNDF?=
 =?us-ascii?Q?+VTh/HG1UrJ6SM+arg5XRWVg?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR15MB5342.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?RIEJDUZpEq6OufQIowJl6lSlb6kpDH2WvymYe2KJSH21NZvA3kqNk2EgNnZi?=
 =?us-ascii?Q?kRmgV1ycp9ICwQhpmp8UtmE+L+IQ3+gZezU+tO24ep6zhCUhtUAuFWrd271+?=
 =?us-ascii?Q?sGQDQOMxE+9Er0zKrx0KfDC6MvYqonsuRF0p63LYPcgmmD016+TjFYbwF5ce?=
 =?us-ascii?Q?yaQFGDe85IR2QrHSxg+MuH8uAhKQlhycLma2ddQTI6M/1Z6oBLHAObDvjtU0?=
 =?us-ascii?Q?PORy0t4tdIsla2YsXLNDqAcoDWPJZAQYCk3AH9q0hCoxG13hR1J/CkzfxEpj?=
 =?us-ascii?Q?ss0rF0m2JYIL8dFkpddc/bqo7eCGJdjLwesB4jG3Yr4lA6U0GKs+0++8zGbt?=
 =?us-ascii?Q?JOb6dLTx9bviFl8hhtt1MyJ4WusLSaRGDnaS6UN+zQQFZuJysPiHe4DN/Tti?=
 =?us-ascii?Q?sJwgtku3iDrzTqtRgYIWp6BpjNe6oDFf5SUg1IUMOUtil/5IA5SXVOGpWALn?=
 =?us-ascii?Q?CXmf9ZfE3MCSLA1j/PY1j7dZ4KFbH7Bx7pT6Nx01doahGrLvasoY/sxIp259?=
 =?us-ascii?Q?GjrbKuf9QqjxFlXA4rXT66r1Hd/hGspuQvM3iS9v6d81KzSY9k1gmdzkKvSe?=
 =?us-ascii?Q?sHd1Ms+PDujhzArOoh8KAd7F9GE61kPI9uNtTReCwr7EI7kQuS6qAAnepwGe?=
 =?us-ascii?Q?FZyAL5a1F8BVQkOWIF7HG5n05rrI4BGOGxOtqrODjQTKsC8+cKsL1pZxK55N?=
 =?us-ascii?Q?dAO72t17m201SI1GecMggo/VVsfmgtYZ/u7+6UiYg3atyrLttOEHy0HMuOdB?=
 =?us-ascii?Q?V/9rKdmCQFLwKbZjqSAANQ8MATF3lA8MY4rlhGtiEBzE3wtsd7+7SiqSnhwX?=
 =?us-ascii?Q?J/e/N4EqMwVsupKlpC1sysJEhlQNWNHPjlStSjUXCDgu2iwAu1dLbK5se7GQ?=
 =?us-ascii?Q?oqZaV/LZhyL3qBA2onc0Fbw1cnigUV2djQ3+wauEBmZz01zVQBz1UyAoy+YP?=
 =?us-ascii?Q?c6xzr4fBM1CWQW+gWj46JuRrWywghF20TmR0CdOYsA91b/qmUIJ5XOtn/Szt?=
 =?us-ascii?Q?iY7HZ8DhbPbqsGYWOS++VPq+g5Itvi/rxjhcDL4JHOtce/105I2Dx1U73Exb?=
 =?us-ascii?Q?x9uzfZGFy44BLwFeWmjjFh4TNCPv6ByetgP/i0jA9v2kgdDHfSterpzm+Jdf?=
 =?us-ascii?Q?L7umpbim3JIhxQf0cA3KerW47wqAlm91hfeplqxotWDw0DTYPNic62Samr/j?=
 =?us-ascii?Q?YdZddqliE3UAUKhNbOODLQSpxz8UnigqU8C+8eNNBRbfCxg6XSk1lG5OCKOt?=
 =?us-ascii?Q?ZrjgeJ7igAoMCedit5JVqtBqRIENvEJTjzTcjJw3vDWpEY5HYedUKsQJc3gu?=
 =?us-ascii?Q?GYFJfvz52n3fzlUF/YExAl4FQblVXrcJpAClzpFMuXJA7DoaUNhe46XZ9OMU?=
 =?us-ascii?Q?461BCfUsjcUg4lo79oVsEJNmGVCF9EEvQXnviUnUubTcdZk+cNNr5jMnnaUs?=
 =?us-ascii?Q?MeJ0u+Y5Qoj/ubsBJ4MUXjUodUE9A3EqqRh7SNcw0FmAvFWeY730wH3EpCrp?=
 =?us-ascii?Q?F2NRkeX6JL6N2XPrNCyGXc8FFm4KFNQZQ80zLlH8i2lkmMyDBdmtpuyFzCaa?=
 =?us-ascii?Q?GOac+XqCnsQ4mPZ8pY6H/PagwCpQT3ZKxlR4RGhCawS1vN/1Ssp7ekq4oiX8?=
 =?us-ascii?Q?srFZ9UVYTs6YmnRwNpq+hek=3D?=
Content-Type: multipart/alternative;
	boundary="_000_6A6A014A856845CFB8F0199B82738B12metacom_"
MIME-Version: 1.0
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR15MB5342.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0d4f21-f534-4a40-f6a3-08dd081cbac6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 22:02:44.1816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hJvZ2hJH7HLeszmeDdUrUDmxd/cDoWwrGvmxl1a/m40V7Dbi+QMFaJdxt4o7TenzBLY9SQn5CClu2pIDn8rwKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR15MB6211
X-Proofpoint-GUID: thnbAfhMY-wPoa4GHDkC-L8htOEXPWeB
X-Proofpoint-ORIG-GUID: thnbAfhMY-wPoa4GHDkC-L8htOEXPWeB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-05_03,2024-10-04_01,2024-09-30_01
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

--_000_6A6A014A856845CFB8F0199B82738B12metacom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi


This email serves as a formal notification that the StartUpdate D-Bus inter=
face flow will be enabled in BMCWeb and phosphor-bmc-code-mgmt by changing =
the defaults through patches  #1<https://gerrit.openbmc.org/c/openbmc/openb=
mc/+/75803> and #2<https://gerrit.openbmc.org/c/openbmc/bmcweb/+/75800>. Th=
is change is based on the design<https://github.com/openbmc/docs/blob/maste=
r/designs/code-update.md>.


The flow has been tested on romulus Qemu and IBM's p10bmc hardware, thanks =
to @Adriana for her help. In the meantime, if anyone is interested in testi=
ng the flow, they can use the above-mentioned patches (and related dependen=
cies<https://gerrit.openbmc.org/q/topic:EnableUpdateInterface>) to test it =
locally.


Please let me know if you have any questions.

Regards
Jagpal S Gill


--_000_6A6A014A856845CFB8F0199B82738B12metacom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <2A2C7D12634D9848BB7F0CCC98E86441@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; line-br=
eak: after-white-space;">
<div>Hi</div>
<div><br>
</div>
<div>
<p style=3D"margin: 0px; font-style: normal; font-variant-caps: normal; fon=
t-stretch: normal; line-height: normal; font-size-adjust: none; font-kernin=
g: auto; font-variant-alternates: normal; font-variant-ligatures: normal; f=
ont-variant-numeric: normal; font-variant-east-asian: normal; font-variant-=
position: normal; font-feature-settings: normal; font-optical-sizing: auto;=
 font-variation-settings: normal;">
This email serves as a formal notification that the StartUpdate D-Bus inter=
face flow will be enabled in BMCWeb and phosphor-bmc-code-mgmt by changing =
the defaults through patches &nbsp;<a href=3D"https://gerrit.openbmc.org/c/=
openbmc/openbmc/+/75803">#1</a>&nbsp;and&nbsp;<a href=3D"https://gerrit.ope=
nbmc.org/c/openbmc/bmcweb/+/75800">#2</a>.
 This change is based on the&nbsp;<a href=3D"https://github.com/openbmc/doc=
s/blob/master/designs/code-update.md">design</a>.</p>
<p style=3D"margin: 0px; font-style: normal; font-variant-caps: normal; fon=
t-stretch: normal; line-height: normal; font-size-adjust: none; font-kernin=
g: auto; font-variant-alternates: normal; font-variant-ligatures: normal; f=
ont-variant-numeric: normal; font-variant-east-asian: normal; font-variant-=
position: normal; font-feature-settings: normal; font-optical-sizing: auto;=
 font-variation-settings: normal; min-height: 17px;">
<br>
</p>
<p style=3D"margin: 0px; font-style: normal; font-variant-caps: normal; fon=
t-stretch: normal; line-height: normal; font-size-adjust: none; font-kernin=
g: auto; font-variant-alternates: normal; font-variant-ligatures: normal; f=
ont-variant-numeric: normal; font-variant-east-asian: normal; font-variant-=
position: normal; font-feature-settings: normal; font-optical-sizing: auto;=
 font-variation-settings: normal;">
The flow has been tested on romulus Qemu and IBM's p10bmc hardware, thanks =
to @Adriana for her help. In the meantime, if anyone is interested in testi=
ng the flow, they can use the above-mentioned patches (and&nbsp;<a href=3D"=
https://gerrit.openbmc.org/q/topic:EnableUpdateInterface">related
 dependencies</a>) to test it locally.</p>
<p style=3D"margin: 0px; font-style: normal; font-variant-caps: normal; fon=
t-stretch: normal; line-height: normal; font-size-adjust: none; font-kernin=
g: auto; font-variant-alternates: normal; font-variant-ligatures: normal; f=
ont-variant-numeric: normal; font-variant-east-asian: normal; font-variant-=
position: normal; font-feature-settings: normal; font-optical-sizing: auto;=
 font-variation-settings: normal;">
<br>
</p>
<p style=3D"margin: 0px; font-style: normal; font-variant-caps: normal; fon=
t-stretch: normal; line-height: normal; font-size-adjust: none; font-kernin=
g: auto; font-variant-alternates: normal; font-variant-ligatures: normal; f=
ont-variant-numeric: normal; font-variant-east-asian: normal; font-variant-=
position: normal; font-feature-settings: normal; font-optical-sizing: auto;=
 font-variation-settings: normal;">
Please let me know if you have any questions.</p>
</div>
<div><br>
</div>
<div>Regards</div>
<div>Jagpal S Gill</div>
<div><br>
</div>
</body>
</html>

--_000_6A6A014A856845CFB8F0199B82738B12metacom_--
