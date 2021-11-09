Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6CF44A6F6
	for <lists+openbmc@lfdr.de>; Tue,  9 Nov 2021 07:41:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpJK74lYhz2yNW
	for <lists+openbmc@lfdr.de>; Tue,  9 Nov 2021 17:40:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=UsXLqgEM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.183.28.62;
 helo=mx08-002d6701.pphosted.com;
 envelope-from=prvs=5947e73325=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=UsXLqgEM; dkim-atps=neutral
X-Greylist: delayed 3605 seconds by postgrey-1.36 at boromir;
 Tue, 09 Nov 2021 17:40:30 AEDT
Received: from mx08-002d6701.pphosted.com (mx08-002d6701.pphosted.com
 [185.183.28.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpJJZ4byzz2xC3
 for <openbmc@lists.ozlabs.org>; Tue,  9 Nov 2021 17:40:29 +1100 (AEDT)
Received: from pps.filterd (m0132501.ppops.net [127.0.0.1])
 by mx08-002d6701.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A920nBd024164; 
 Tue, 9 Nov 2021 05:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=dkim; bh=lGAYFyYVpXxt6QabKua2N+6YHdMomtcC0gK2NywTJew=;
 b=UsXLqgEMAiPy3+m7itjd1O/+n+Zg2X9u6eezdyXGFrqkcMDdfVlSHJ32zPo2xSDgpRYy
 7df8nLzHuiJwMHOzy4VyrDMD9hnYgT0b9sKUjOB7tkCP6jykgmMop407VKniwwtbQ59N
 zk91MdqvXyaqggCGCr3nvmAT6eD0+MNrOw6IG3wJr99RKyEyTAH8md9UG9ytKx1P6E18
 bEDQwj/h08jkNzmzQdLs4Luc7+CDnHpA7YfbEaKnEgnYAg/BLaJzuF9GLUOZ8hSmtjQQ
 hVkMKaqUY7oEmnIww7hCfGgtFCUKYCVhcuc8dnWEQ77IMK/SiP9INHFEtdBF0Mqt4hqv 4Q== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by mx08-002d6701.pphosted.com with ESMTP id 3c6xce6ygk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 05:40:15 +0000
Received: from MW4PR03CA0310.namprd03.prod.outlook.com (2603:10b6:303:dd::15)
 by BN7PR08MB5105.namprd08.prod.outlook.com (2603:10b6:408:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.23; Tue, 9 Nov
 2021 05:40:13 +0000
Received: from CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::46) by MW4PR03CA0310.outlook.office365.com
 (2603:10b6:303:dd::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 05:40:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.78)
 smtp.mailfrom=flex.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=fail action=oreject header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.78 as permitted sender) receiver=protection.outlook.com; 
 client-ip=144.49.247.78; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.78) by
 CO1NAM11FT060.mail.protection.outlook.com (10.13.175.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Tue, 9 Nov 2021 05:40:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFHdA1syMZicySUnCxatNtATspSQle2jeRsmId6jFw6OsDocHRZO92wVP5OPsn1oqsVn1SV0TqBBOQZyKRZBZIy5SP9ER7uowvTF941vfenAbmKGsuHorNRCo9qzrn0WNm0tfaDmxAeB4GlroyVK3WT6iFA2YM82e4cacKbqwe4fZqiwCQ/exlg2kYPjfEEf6+8QiKE5cxLsv75wsWgqHjiBkwiDgL6oGpBrTgDvuHBOi+qiuRAtW0XN2b3mhzkCwhq9ECWd/G55EYQ3NvYCGu1KcOiuTmg2lRCVF5/7OjDOueJr2nw7BxTo6vgITxx8n/q7yflei8tO1z4YY5rEGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29M7PPF6+RHvc5jzBQCZViG+E0Cc9+CmmwONLCCAeB0=;
 b=InqO07oNIL0m4/c93cRSMiT/6/ZZM8NdztO9kvdYgRavlaNy1YCZ6B6iw2R0TAk7snyU5fYOsyany8Hzf72Ij8oi8m4gFRi7IEsSdvkzKHxJBxRv32jv2q+BFRrL/kXmd7ONZlkMfZdrhTXftQau12mcBYYvs8ARGr9He0EmZO58APMO+DFNs8NI5anC/dRReTZyMSW0yBwsjQ8RySp9jtc6ncb04chUe+FYU8ylF5VrCjbaynvZ9dRttXC0c+TogQ3m+nYEveDP7RfUiM5d+4G4srdrgqK2b41hW2QTJFuj4chFP+ODbMNqnUac8iGgSQk7uehHYmdEubwtIj7NAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by DM5PR08MB2970.namprd08.prod.outlook.com (2603:10b6:3:143::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Tue, 9 Nov
 2021 05:40:07 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::b084:d3b3:942c:d1e9]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::b084:d3b3:942c:d1e9%3]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 05:40:07 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: Sui Chen <suichen@google.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: =?big5?B?pl7C0Dogpl7C0DogW3Bob3NwaG9yLWhvc3QtaXBtaWRdIFF1ZXN0aW9uIGFib3V0?=
 =?big5?Q?_IPMI_SDR?=
Thread-Topic: =?big5?B?pl7C0DogW3Bob3NwaG9yLWhvc3QtaXBtaWRdIFF1ZXN0aW9uIGFib3V0IElQTUkg?=
 =?big5?Q?SDR?=
Thread-Index: AQHX1FMVcHHdqMI4+UCvhvFgn3/gJqv5es8PgAEFLYCAAC9xhA==
Date: Tue, 9 Nov 2021 05:40:07 +0000
Message-ID: <DM6PR08MB55142E2A8D0C926DFDF0BA36DC929@DM6PR08MB5514.namprd08.prod.outlook.com>
References: <DM6PR08MB551412A7CBCEDFAA6D76C495DC919@DM6PR08MB5514.namprd08.prod.outlook.com>
 <DM6PR08MB5514160535BE1676DBC179E0DC919@DM6PR08MB5514.namprd08.prod.outlook.com>
 <91c35372-7329-a80c-8be0-3e9d79251fdc@google.com>
In-Reply-To: <91c35372-7329-a80c-8be0-3e9d79251fdc@google.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: c32c690a-a737-3303-166f-c6cef84e2ac4
Authentication-Results-Original: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=flex.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 0c953f82-616e-41f0-b731-08d9a343660d
x-ms-traffictypediagnostic: DM5PR08MB2970:|BN7PR08MB5105:
X-Microsoft-Antispam-PRVS: <BN7PR08MB5105335A4412D0F23C52A93FDC929@BN7PR08MB5105.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Mnfwq4MDUjiqc0oJS2LnyeFRsHxdZKbd0W1AbdtIU+CEw3eG5cuAPkGhB2LATELY/cVi7Ce8faHV6ktQ5GyoNayXeawEsk0RP/I59kzwiNCjfR+n8IGYfs6CPD/u/RbukcSBFvkh5B8AHAh0Fe1UeLUf6YwtaUq5llfqcMBHMy3wocvtFJkOazgwtJ6vQIx9l5LlsQnPySXUGQRZMUl1yRoaClxlsoGepbTejsAITlqD/RJWxuXS2ZjH+SNGUE/kiX3NdUBRORGXBbX41Cto/T+0oFrEBIdA5dl+bF8yd/1c3EWGxTdZ+gRrbisXpX1QO8E1AbAMehCDmJ6YEwcj3T0ZUD/v0ySmUfQglkUqpcRU5C/A3GE4bXXDIVGSEbBWlzwQFrXFzWaRI1dV1WT7kXnU5quO0jpb9CwOxPjJ2hUn2j7nGDmakISYA2TmJUsQW6jLxEi/2c1jArp1fFO8MceS/+m1jUfHqB1kWpdAUVdb1/t5PcsCMNe1AmuqDPt/YQz31h655IPEl0OCfQHH754KsiuxFzkYhF6OJcSpvhSm9jG9hlz4821cqt9+dxusdeL2ggfpfZf6Q1ng0IaKW9CBUBMWV5ivTetF5U3rWfh2cL/9E2xpBa25xzevh34ps1wSwiKCJF5yPkM4STk1ILBVSmo6CCEZiV4AL5b3YMrGxLaGGQMOBanY7VsJ4rzaE9dO28fX9uG1iUEkXXxen/pcGniilmQDijk/lU7W1CPKASI4DjefGaUgCvSsflBuhJdV/n6xE/Qaa+/7+2pF2wuTWXZatwvuvUj1+7oeL5s=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5514.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(366004)(316002)(224303003)(19627405001)(110136005)(166002)(26005)(91956017)(76116006)(64756008)(66476007)(5660300002)(66446008)(66556008)(33656002)(66946007)(508600001)(38070700005)(966005)(8936002)(2906002)(7696005)(86362001)(53546011)(186003)(122000001)(6506007)(38100700002)(71200400001)(55016002)(9686003)(83380400001)(52536014);
 DIR:OUT; SFP:1102; 
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB55142E2A8D0C926DFDF0BA36DC929DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR08MB2970
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5c7c196e-c8dd-4e5a-191f-08d9a3436341
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +bSTAuZjqIeeuCZjib7mr4ITeaavYT9WHAD7Znl/7dv9KXreA1d71/DnHAPCXy2253ugEo/Nkmg8PKTjwz46iCX3rKQ4rrfgxZsivd2PS0LNXNQJe1SujVHeYMc07ZupFLweWKhotALnrvh5tacqmaVi5dUGQ5fQOeBA1EprHoyVanXYu9Q+uxtOuDjLJPlDHokgDvnjQjx4BwLPFH6BC3GA/BVXVgfISMJY7dYQ3iObl7LwP1oGVJhtLbY8pP3uPKSNiyyAz5QHSHJUF/mc6EJ4JwTzCID9I1946vL684+gPBMg/Oj701Yhn8P+bo4WgPM3UxCDHm/1DVIxc/WUxb3TBKJmCpu0fchviExyDxhudDYyvQQbAFvRwQu5Oxfp6s/RwZSWfwe0m8yLURlTii4swi7WlxeQ0K30u7EFEqBYEZYJdHmPPIXczS1/jwR+VS2xOo+rpRu33BWSn/tFWDGCvx4ULt0zbgkDHO1UNUikQrTMqHg4AVNoBiG/zAZfJt4KuakAD+V2yMFicNk69A5JqVEeCT7UFp9KQmwnX79K51cU2M6pQ6IIZvYoJTk2QQ+mOcyBRr+cU+eAuCo5ULDoC+1Nj7EutQe/rkI6TS6saxb0etlt7rWrNtuoFwwm8wjfeZ2IJqXxVCwybW0ABtqxM4+OyhlkZhKieZozCDHfI1XWWZeAuIHKSRtU3uX5dnQ/nIHB5u6Vzyt9pkH+HS4fTWy+CJc+iFqLUGQbSTBhd1vYhdspuSbmECiFpSo715b8xzQNeZdKpr4Yw1Xk1i7MaKjfp2zMch7QTTpgUUbLvmirziZATA9+3t0gFAZt
X-Forefront-Antispam-Report: CIP:144.49.247.78; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(36840700001)(46966006)(166002)(9686003)(47076005)(55016002)(33656002)(19627405001)(83380400001)(4186021)(36860700001)(224303003)(81166007)(356005)(336012)(86362001)(26005)(82310400003)(7696005)(966005)(2906002)(508600001)(5660300002)(70586007)(70206006)(6506007)(110136005)(53546011)(316002)(186003)(8936002)(52536014)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 05:40:11.7918 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c953f82-616e-41f0-b731-08d9a343660d
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.78];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB5105
X-Proofpoint-GUID: L1A8V9r6OZ1k7SMvCyS4jIyOSPYMsm4u
X-Proofpoint-ORIG-GUID: L1A8V9r6OZ1k7SMvCyS4jIyOSPYMsm4u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_07,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 clxscore=1011 bulkscore=0 adultscore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090032
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

--_000_DM6PR08MB55142E2A8D0C926DFDF0BA36DC929DM6PR08MB5514namp_
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="big5"

SGkgU3VpLA0KDQpVbmRlcnN0b29kLiBUaGFua3MgZm9yIHlvdXIgc2hhcmluZyBhbmQgZXhwbGFu
YXRpb24uOikNCg0KUmVnYXJkcywNCkNocmlzIENoZW4NCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCrFIpfOqzDogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK2NocmlzLmNoZW4z
PWZsZXguY29tQGxpc3RzLm96bGFicy5vcmc+IKVOqu0gU3VpIENoZW4gPHN1aWNoZW5AZ29vZ2xl
LmNvbT4NCrFIpfOk6bTBOiAyMDIxpn4xMaTrOaTpIKRXpMggMTA6NDgNCqaspfOqzDogb3BlbmJt
Y0BsaXN0cy5vemxhYnMub3JnIDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQqlRKauOiBSZTog
pl7C0DogW3Bob3NwaG9yLWhvc3QtaXBtaWRdIFF1ZXN0aW9uIGFib3V0IElQTUkgU0RSDQoNCk9u
IDExLzgvMjEgMzozNyBBTSwgQ2hyaXMgQ2hlbiAoVFBJKSB3cm90ZToNCj4gSGkgYWxsLA0KPg0K
PiBJIHRoaW5rIEkgZmlndXJlZCBvdXQgdGhlIGVycm9yIG1lc3NhZ2UgaXMgZHVlIHRvIHRoZQ0K
PiBwaG9zcGhvci1oZWFsdGgtbW9uaXRvciBwYWNrYWdlLiBUaGUgcGhvc3Bob3ItaGVhbHRoLW1v
bml0b3IgZG9lc24ndA0KPiBoYXZlIHRoZSBpbnRlcmZhY2Ugb2Ygb3JnLmZyZWVkZXNrdG9wLkRC
dXMuT2JqZWN0TWFuYWdlciBhbmQgd2l0aCB0aGUNCj4gR2V0TWFuYWdlZE9iamVjdHMgbWV0aG9k
IGNhbGwsIHNvIHRoZSBnZXRTZW5zb3JNYXAoKSBpbiB0aGUNCj4gaW50ZWwtaXBtaS1vZW0gd291
bGQgYmUgZmFpbGVkLg0KDQpUaGFua3MgZm9yIGNhdGNoaW5nIHRoaXMsIGl0IHNlZW1zIHRoZXJl
IGV4aXN0cyBhIGNoYW5nZSB0byBtYWtlDQpwaG9zcGhvci1oZWFsdGgtbW9uaXRvciBjb21wYXRp
YmxlIHdpdGggYGlwbWl0b29sIHNkcmA6DQpodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0
cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9jL29wZW5ibWMvcGhvc3Bob3ItaGVhbHRo
LW1vbml0b3IvKi80MTIyOF9fO0t3ISFIU250bENnIUR6TjJCbmF5cmlZcFFDZFN4NFRvZ3JVNWcx
VkV4QUJKR3JKbEozbDFfVWJHUE5DWW9aUW1yT1hieHlHRy1ua2kkDQoNCj4gIDEuDQo+ICAgICBp
cyBpdCBvbmx5IGZvciBtb25pdG9yaW5nIENQVSBhbmQgbWVtb3J5IHNlbnNvciB2YWx1ZXM/ICBp
dCBsb29rcw0KPiAgICAgbGlrZSB0aGVyZSBpcyBubyBleHBsYW5hdGlvbiBvZiBpdCBpcyBpbiB0
aGUgcGhvc3Bob3ItaGVhbHRoLW1vbml0b3INCj4gICAgIHJlcG8uDQoNClllcyBpdCBpcyBmb3Ig
bW9uaXRvcmluZyB0aGUgQk1DJ3MgQ1BVLCBtZW1vcnkgYW5kIHN0b3JhZ2UgdXNhZ2UsIGFuZA0K
b3RoZXIgbWV0cmljcy4NCg0KPiAgMi4NCj4gICAgIGNhbiBJIHJlbW92ZSBpdD8gSWYgeWVzLCB3
aWxsIEkgbWlzcyBhbnkgZmVhdHVyZXM/DQoNClllcyBpdCBpcyBzYWZlIHRvIHJlbW92ZSwgdGhl
cmUgYXJlIHBsYW5zIHRvIHVzZSBwaG9zcGhvci1oZWFsdGgtbW9uaXRvcg0Kc2Vuc29ycyBpbiBS
ZWRmaXNoIGJ1dCB0aGUgU2NoZW1hcyBhbmQgYm1jd2ViLXNpZGUgY2hhbmdlcyBhcmUgc3RpbGwg
aW4NCnByb2dyZXNzLCBzbyB5b3Ugd29uJ3QgbWlzcyB0b28gbWFueSBmZWF0dXJlcyBmb3Igbm93
Lg0KCkxlZ2FsIERpc2NsYWltZXIgOgpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMg
bWVzc2FnZSBtYXkgYmUgcHJpdmlsZWdlZCBhbmQgY29uZmlkZW50aWFsLiAKSXQgaXMgaW50ZW5k
ZWQgdG8gYmUgcmVhZCBvbmx5IGJ5IHRoZSBpbmRpdmlkdWFsIG9yIGVudGl0eSB0byB3aG9tIGl0
IGlzIGFkZHJlc3NlZCAKb3IgYnkgdGhlaXIgZGVzaWduZWUuIElmIHRoZSByZWFkZXIgb2YgdGhp
cyBtZXNzYWdlIGlzIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCAKeW91IGFyZSBvbiBub3Rp
Y2UgdGhhdCBhbnkgZGlzdHJpYnV0aW9uIG9mIHRoaXMgbWVzc2FnZSwgaW4gYW55IGZvcm0sIApp
cyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIG1lc3NhZ2Ug
aW4gZXJyb3IsIApwbGVhc2UgaW1tZWRpYXRlbHkgbm90aWZ5IHRoZSBzZW5kZXIgYW5kIGRlbGV0
ZSBvciBkZXN0cm95IGFueSBjb3B5IG9mIHRoaXMgbWVzc2FnZSEK

--_000_DM6PR08MB55142E2A8D0C926DFDF0BA36DC929DM6PR08MB5514namp_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="big5"

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Sui,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Understood. Thanks for your sharing and explanation.:)</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Regards,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Chris Chen</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B1H=A5=F3=AA=CC:</b> openbmc &=
lt;openbmc-bounces+chris.chen3=3Dflex.com@lists.ozlabs.org&gt; =A5N=AA=ED S=
ui Chen &lt;suichen@google.com&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b> 2021=A6~11=A4=EB9=A4=E9 =A4W=A4=C8 10:48<br>
<b>=A6=AC=A5=F3=AA=CC:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlab=
s.org&gt;<br>
<b>=A5D=A6=AE:</b> Re: =A6^=C2=D0: [phosphor-host-ipmid] Question about IPM=
I SDR</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt">
<div class=3D"PlainText">On 11/8/21 3:37 AM, Chris Chen (TPI) wrote:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; I think I figured out the error message is due to the <br>
&gt; phosphor-health-monitor package. The phosphor-health-monitor doesn't <=
br>
&gt; have the interface of org.freedesktop.DBus.ObjectManager and with the =
<br>
&gt; GetManagedObjects method call, so the getSensorMap() in the <br>
&gt; intel-ipmi-oem would be failed.<br>
<br>
Thanks for catching this, it seems there exists a change to make <br>
phosphor-health-monitor compatible with `ipmitool sdr`: <br>
<a href=3D"https://urldefense.com/v3/__https://gerrit.openbmc-project.xyz/c=
/openbmc/phosphor-health-monitor/*/41228__;Kw!!HSntlCg!DzN2BnayriYpQCdSx4To=
grU5g1VExABJGrJlJ3l1_UbGPNCYoZQmrOXbxyGG-nki$">https://urldefense.com/v3/__=
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-health-monitor/*/4122=
8__;Kw!!HSntlCg!DzN2BnayriYpQCdSx4TogrU5g1VExABJGrJlJ3l1_UbGPNCYoZQmrOXbxyG=
G-nki$</a>
<br>
<br>
&gt;&nbsp; 1.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; is it only for monitoring CPU and memory senso=
r values? &nbsp;it looks<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; like there is no explanation of it is in the p=
hosphor-health-monitor<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; repo.<br>
<br>
Yes it is for monitoring the BMC's CPU, memory and storage usage, and <br>
other metrics.<br>
<br>
&gt;&nbsp; 2.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; can I remove it? If yes, will I miss any featu=
res?<br>
<br>
Yes it is safe to remove, there are plans to use phosphor-health-monitor <b=
r>
sensors in Redfish but the Schemas and bmcweb-side changes are still in <br>
progress, so you won't miss too many features for now.<br>
</div>
</span></font></div>
</div>

<DIV>
Legal Disclaimer :<BR>
The information contained in this message may be privileged and confidentia=
l. <BR>
It is intended to be read only by the individual or entity to whom it is ad=
dressed <BR>
or by their designee. If the reader of this message is not the intended rec=
ipient, <BR>
you are on notice that any distribution of this message, in any form, <BR>
is strictly prohibited. If you have received this message in error, <BR>
please immediately notify the sender and delete or destroy any copy of this=
 message!<BR>
</DIV></body>
</html>

--_000_DM6PR08MB55142E2A8D0C926DFDF0BA36DC929DM6PR08MB5514namp_--
