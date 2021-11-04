Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 476C9444F09
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 07:43:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlDcC1GSvz2yHS
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 17:43:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=PMUbU7+z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.132.180.100;
 helo=mx07-002d6701.pphosted.com;
 envelope-from=prvs=59421181fc=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=PMUbU7+z; dkim-atps=neutral
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com
 [185.132.180.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlDbd39p9z2x9H
 for <openbmc@lists.ozlabs.org>; Thu,  4 Nov 2021 17:42:51 +1100 (AEDT)
Received: from pps.filterd (m0132503.ppops.net [127.0.0.1])
 by mx07-002d6701.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A41qYQg001027; 
 Thu, 4 Nov 2021 06:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=dkim; bh=btmkcvM3KOH6CJFGJw0iWtaNhfSK9j5woEuBJ1vuP64=;
 b=PMUbU7+zrJktatJkdkuqcjuoDl2QRjPTrIoaDyKwOcxBmKMhREVmceo/Rzp1UJ2MrXeH
 +Ratj0KQePCH+BpemGH6VkAdpmTPbg5UKINL8Vxq5XkUtgKVV9fbwKB1e7isphJLphMs
 45M2RsFbTBdSULUKuRyxHpvQNzjeFgcxi+d8VR0hCY43j2vBNxF5SWRXwYQ4MQtt9ICo
 L8HGgHtP9aDSaJJ1pTB8jo9ypzBQEDn/owmf7YGO22cz5/vP5gC/SOvurMF0WsLcbqrE
 PybMkCRNMEys5jXXdmlDt1hdZYWr4fMncvf/+0npxCpYfqmWJXXETFVvyZaVHBEPkZjc Nw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 by mx07-002d6701.pphosted.com with ESMTP id 3c468212f5-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Nov 2021 06:42:47 +0000
Received: from MWHPR12CA0036.namprd12.prod.outlook.com (2603:10b6:301:2::22)
 by BN7PR08MB5043.namprd08.prod.outlook.com (2603:10b6:408:27::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Thu, 4 Nov
 2021 06:42:43 +0000
Received: from CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:2:cafe::cd) by MWHPR12CA0036.outlook.office365.com
 (2603:10b6:301:2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Thu, 4 Nov 2021 06:42:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.95)
 smtp.mailfrom=flex.com; yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=fail action=oreject header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.95 as permitted sender) receiver=protection.outlook.com; 
 client-ip=144.49.247.95; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.95) by
 CO1NAM11FT008.mail.protection.outlook.com (10.13.175.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Thu, 4 Nov 2021 06:42:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OooGDGUlg/kRe45EG4KNDxl8SUdiKvSF4e3jVRUAgyeJ9ilyucu9HqK3r+EPUfWOHvoR9ECLuqal4uFC6W6k61CZ9p38xt6ns1TLbkE+x/43jlri82tXoovujBSoOh32ogeQ40hDMHaT3R4wzKiHCZZBeiaJwqWI7lCpCxWDFCBnqhkwr1+wWZFycawWeKzwxeoVXa7ieLtpJJ1fHNOgEPKkARLlEgOk3IVXXcoFnQOyx3CkgziaXtIrBhy4+Uvn1b/5IsgzIezHOhSbXc9s2FzZCNHnVSrkEWKY3/+25+zpnGD4PU4CuTK2rBiQvee60CWJO0Lk/+VVeUOefzbJ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btmkcvM3KOH6CJFGJw0iWtaNhfSK9j5woEuBJ1vuP64=;
 b=I+1h2m98hu8W1M7Ox/wnRKFV875c73IeS5jEgz5qBm5to97sqrkOQvyZGzmZW1nU8XS8/Z21lrbzye38OyKBJTw+4zk71gprTr4sj7vmXspQMi21ik5crEWNe5UhR06PBrPepP9VJlhjfEQpbkiXWPZMb7Kf8DFu43+yl7rcXbK20ymug09vV1waUd6AiJcxcFo5HoFj3UR50By9SvVTJYvnCOEvLNftgdZe5eoWokD74POBb8yt0RrjsJY6HJut1RjdOlc6tlwSMDkDBzAOFxp+DKOi/2ioftJjd9wfjd5uosY89mipWKweXc0CAH49uEF1TeYXBOxQA0kZw8yNuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by DM6PR08MB6188.namprd08.prod.outlook.com (2603:10b6:5:1f0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Thu, 4 Nov
 2021 06:42:40 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::b084:d3b3:942c:d1e9]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::b084:d3b3:942c:d1e9%3]) with mapi id 15.20.4649.020; Thu, 4 Nov 2021
 06:42:40 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: Andrei Kartashev <a.kartashev@yadro.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: =?big5?B?pl7C0DogW3Bob3NwaG9yLWhvc3QtaXBtaWRdIFF1ZXN0aW9ucyBhYm91dCBJUE1J?=
 =?big5?Q?_event_message?=
Thread-Topic: [phosphor-host-ipmid] Questions about IPMI event message
Thread-Index: AQHX0FzdH8Cp8KRP+U+lOT6FZDTGF6vx10MAgAEICmg=
Date: Thu, 4 Nov 2021 06:42:39 +0000
Message-ID: <DM6PR08MB5514A718D900C61B7CCFBD7CDC8D9@DM6PR08MB5514.namprd08.prod.outlook.com>
References: <DM6PR08MB55142C3AE9871FB3700BD577DC8C9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <fa95f2df7c92e64d099bbcf8f2781638c088b042.camel@yadro.com>
In-Reply-To: <fa95f2df7c92e64d099bbcf8f2781638c088b042.camel@yadro.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: a770c043-548f-de82-18b3-c8510056b37c
Authentication-Results-Original: yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=none action=none header.from=flex.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 0c0c2c19-9d19-49dc-76f5-08d99f5e4dcf
x-ms-traffictypediagnostic: DM6PR08MB6188:|BN7PR08MB5043:
X-Microsoft-Antispam-PRVS: <BN7PR08MB5043152730C639F7335CEF84DC8D9@BN7PR08MB5043.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: yqkyNKtb5QKUdryHZTafP/wbIlY7UtatBNQTdS83s/9JAQ4mSCU//LG5xbUZq09imSOnS2/FRDoQY5XNt/XQ4d9eJBUmSkimIxNKSz/Ni6uR+2BLNxihGqXPCogNIyZGFeCFN0ZWlBgnl2XDWQEM1+dW5cB9Dof9KA+oWCMPXev0Wk1D9G4/X0p0luI94+wSKNF22E3jnchUV0hkOzY2d+eitpIVKC1Vry1LePp6dvMnNIw87JnPx6EE/WXG3kM0m8x/BP4YwcY1QrmnwYpjD8AZW/smU3F1iAFQKQNltFYhec3W5PndxHCvdZCwA4Uq/YjI1GXBzU7lJCZlCgVOCAhzoxA6BjY7aLyC2Ie4EynIuIf07mYL9oycA8CbqQl8pDJxxiVSZBCC5uhNr8nyrNwARv+V/pxo7w1aoDavAETvwR4GgFef+SMlYwkal2JUI3+gI/sDf5Dy3T6Tl2v2ZUALUPWppYv6O35GcDx8g/vqMFaot3OCVqT21szzaMF1RMQn1C8vuPWUEmHcPCw0JAHdOhok6gu8CmTPKcaJqzuis08/gjA1Gx6H6GTLpmU8JlJYpsX69+UIyjdKXGxIuVlZrmggbXFbvrAzsQOxfZlYeTIw4yEPeOZkYfkxdWr6gvbwevL09nDEoMoVojlMNxnVRxpK+uHU9AEzPishKHwa/9PIS1P5lbkR/e1O3zeJQ7+/Nh9+tGXara/HnGlbwxg1tiXYoQ8fWXQHlXl4cD8=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5514.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(366004)(71200400001)(316002)(110136005)(122000001)(508600001)(55016002)(19627405001)(2906002)(83380400001)(91956017)(6506007)(224303003)(66556008)(76116006)(66446008)(33656002)(7696005)(66946007)(9686003)(5660300002)(86362001)(186003)(64756008)(38070700005)(15650500001)(38100700002)(52536014)(66476007)(8936002)(21314003);
 DIR:OUT; SFP:1102; 
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB5514A718D900C61B7CCFBD7CDC8D9DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB6188
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8c0c6e03-b8e1-4df8-70de-08d99f5e4c09
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dqbB0TuGPCAAiFLwu6IPK3d8n84Bl8AJBsB850PPLoit2cmDEXyTx886pXt2JR/TbNCWtHCy/UcwdNaRZI7KgkuQ4pkk2FTaZROu/KcISiM5AfAu94IoQ9PUpYY0oWN20xT3mkfpbwmox0S/JN/C7QHxfpRRBPYaUGSJRpEsk8v4Lh1ItiGKtzMQNNq59Pci1EZGPzYojpD2S2Kc5lcgs3QHi05oFMJLTFsf57p6PKeD7K+hr0KYcgQJQ4P7tX2AnqNMAsfShs9JvpaeVMZH4qGO0RlIbqqS03Oe4JE6a8xvKTVUK2NyNW5z4QMuPvozv0evwCFgxYKHiEVJa843W1qvcthEkb0nx9WlM6ow+EB9Uqdl3BYkh1ruUB6N96esC6DwR8sdL6HHfxLW5XDImtbw8+1v3D1uuYYJ5LWudYYWmxplsSf1Z+dne6RjyQfcGtTpgTC8SCIuJfQm0VITOchfUfrYInm+gcW0QIuj3MDpDLZAQJyNu53d1MZqjFp8kmvUx43h9zGV1K+644XAwIONGalW29IHzfThunZ/VljIpe9dlC6dPZ4VEaQ0AqM8lubDTiq2u8FTtzIxOE7NExsu2aLNR5UsrxZpcCLtMbM9+Xy0trPfCD89lLM0zNLLCUghBA61KiC/MaT2UeGCzJetpgECF/pm1gTnjKYaQoqnhAb6E1nD1Gt8SerAY5FRKcu5EZ6ooTqXlkTEHvp+NxI1PJ67RUThNG1jD0rovvou9cJmoxuG9R1wtCBZNXAeTn+oxRZvg47zUXmFVvt3bw==
X-Forefront-Antispam-Report: CIP:144.49.247.95; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(36840700001)(46966006)(26005)(8936002)(356005)(224303003)(81166007)(336012)(19627405001)(6506007)(4186021)(508600001)(33656002)(15650500001)(70586007)(82310400003)(86362001)(9686003)(52536014)(36860700001)(110136005)(5660300002)(7696005)(316002)(2906002)(70206006)(83380400001)(55016002)(186003)(47076005)(21314003)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 06:42:42.6742 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0c2c19-9d19-49dc-76f5-08d99f5e4dcf
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.95];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB5043
X-Proofpoint-ORIG-GUID: Bu7fSHDH2p3IucvhINofFPnQbhV6si8z
X-Proofpoint-GUID: Bu7fSHDH2p3IucvhINofFPnQbhV6si8z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-04_01,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111040033
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

--_000_DM6PR08MB5514A718D900C61B7CCFBD7CDC8D9DM6PR08MB5514namp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgQW5kcmVpLA0KDQo+PkRpc2NsYWltZXI6IGhlcmUgYW5kIGJlbG93IEkgdGFsayBvbmx5IGFi
b3V0IGZpbGUtYmFzZWQgaW1wbGVtZW50YXRpb24NCj4+Zm9yIGxvZ3MuDQoNCj4+SXQgaXMga25v
d24gbGltaXRhdGlvbi4gRmlyc3Qgb2YgYWxsLCB5b3Ugc2hvdWxkIGF3YXJlIHRoYXQgdGhlcmUg
YXJlDQo+PnR3byBjb21wbGV0ZWx5IGRpZmZlcmVudCBsb2dzOiBSZWRmaXNoIExvZyBhbmQgU0VM
IGxvZy4gV2hlbiBhbg0KPj5pbnRlcm5hbCBzZW5zb3IgdHJpZ2dlcnMgdGhyZXNob2xkIGV2ZW50
LCB0d28gZGlmZmVyZW50IG1lc3NhZ2VzIGFyZQ0KPj5zZW50OiBvbmUgZm9yIHJlZGZpc2ggbG9n
IGFuZCBhbm90aGVyIHRvIFNFTC4NCg0KPj5UaGUgc2VsLWxvZ2dlciBjdXJyZW50bHkgZGVzaWdu
ZWQgdG8gb25seSBoYW5kbGUgdGhyZXNob2xkIGV2ZW50cyBmcm9tDQo+PmludGVybmFsIHNlbnNv
cnMsIHRodXMgaXQgcmVxdWlyZXMgZGJ1cyBwYXRoIHRvIHRoZSBzZW5zb3IgYXMgYW4NCj4+YXJn
dW1lbnQgZm9yIElwbWlTZWxBZGQuDQo+PldoZW4geW91IHNlbmQgZXh0ZXJuYWwgSVBNSSBldmVu
dC9TRUwgYWRkIG1lc3NhZ2UsIGlwbWkgZGFlbW9uIGRvZXNuJ3QNCj4+a25vdyBob3cgdG8gaGFu
ZGxlIGl0LiBJbnN0ZWFkLCBpbnRlbC1pcG1pLW9lbSwgdHJpZXMgdG8gcGFyc2UgdGhlDQo+PmV2
ZW50IGFjY29yZGluZyB0byBzb21lIHJ1bGVzIGFuZCBpZiBpdCBmYWlscyBqdXN0IGFkZHMgdGhp
cyB3ZWlyZA0KPj4iT3BlbkJNQy4wLjEuU0VMRW50cnlBZGRlZCwyQzA0MDEzMDAxMDlGRkZGIiB0
byB0aGUgcmVkZmlzaCBsb2csIHNheWluZw0KPj4id2UgZ290IHNvbWUgaXBtaSBldmVudCwgYnV0
IHdlIGRvbid0IGtub3cgd2hhdCBpcyBpdCIuDQpOb3cgSSBnZXQgaXQuIEkgaGF2ZSB0byBzYXkg
dGhpcyBleHBsYW5hdGlvbiBoZWxwIG1lIHRvIHVuZGVyc3RhbmQgbW9yZSBkZXRhaWxzLiBUaGFu
a3MgYSBsb3QuDQpBbm90aGVyLCBtYXkgSSBjb25zdWx0IHlvdSBvdGhlciByZWxhdGVkIHF1ZXN0
aW9ucz8gVGhhdCBpcw0KDQogICogICBJIGhhZCBhIHF1ZXN0aW9uIGFib3V0ICJzZWwtbG9nZ2Vy
IiBiZWZvcmUsIGFuZCBMZWkgc3VnZ2VzdGVkIEkgdG8gZW5hYmxlICJzZW5kLXRvLWxvZ2dlciIg
b3B0aW9uLCBkb2VzIHRoaXMgaGF2ZSBhbnkgcmVsZXZhbmNlIHlvdSBtZW50aW9uZWQgYWJvdmU/
DQogICogICBJIHNhdyBzb21lIGNvbXBhbmllcyBoYXZlIHRoZSB4eHgteWFtbC1jb25maWcgZm9s
ZGVyIHdpdGggInh4eC1pcG1pLXNlbnNvcnMueWFtbCIgZXRjLiBhbmQgYWxzbyBoYXZlIHRoZSAi
ZW50aXR5LW1hbmFnZXIiIGZvbGRlciB3aXRoICJ4eHguanNvbiIuIEJ1dCBzb21lIGNvbXBhbmll
cyBvbmx5IGhhdmUgImVudGl0eS1tYW5hZ2VyIiBmb2xkZXIuIFNvIEkgd291bGQgbGlrZSB0byB1
bmRlcnN0YW5kIHdoYXQgZGlmZmVyZW5jZXMgdGhleSBhcmU/IFNob3VsZCBJIG5lZWQgdGhlbSBi
b3RoPyBJIGZvciBub3cgdXNlICJlbnRpdHktbWFuYWdlciIgb25seS4NCg0KPj5JIGV4dGVuZGVk
IHNlbC1sb2dnZXIgd2l0aCBBZGRFeHQgbWV0aG9kLCB0byBzdG9yZSBhbnkgcmFuZG9tIFNFTCBl
bnRyeQ0KPj50byAvdmFyL2xvZy9pcG1pX3NlbCwgYnV0IHRoaXMgcGF0Y2hlcyBhcmUgZm9yIG91
ciBpbnRlcm5hbCBJbnRlbC1CTUMNCj4+Zm9yayBhbmQgbm90IGFwcGxpZWQgZm9yIHVwc3RyZWFt
IHZlcnNpb24uDQo+Pkl0IGlzIG9uIG15IHJvYWRtYXAgdG8gdXBkYXRlIHBhdGNoZXMgYW5kIHN1
Ym1pdCB0aGVtLiBJZiB0aGVyZSBpcw0KPj5kZW1hbmQgZm9yIHRoaXMgd29yaywgSSBjYW4gdHJ5
IHRvIHByaW9yaXRpemUgaXQuDQpJdCBkZWZpbml0ZWx5IHdpbGwgYmUgaGVscGZ1bCBmb3IgbWUg
aWYgeW91IGFyZSBhYmxlIHRvIHByaW9yaXRpemUgdGhpcyBmZWF0dXJlLjopDQoNClJlZ2FyZHMs
DQpDaHJpcyBDaGVuDQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCrFIpfOq
zDogQW5kcmVpIEthcnRhc2hldiA8YS5rYXJ0YXNoZXZAeWFkcm8uY29tPg0KsUil86TptME6IDIw
MjGmfjExpOszpOkgpFWkyCAxMDowNg0Kpqyl86rMOiBDaHJpcyBDaGVuIChUUEkpIDxDaHJpcy5D
aGVuM0BmbGV4LmNvbT47IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyA8b3BlbmJtY0BsaXN0cy5v
emxhYnMub3JnPg0KpUSmrjogUmU6IFtwaG9zcGhvci1ob3N0LWlwbWlkXSBRdWVzdGlvbnMgYWJv
dXQgSVBNSSBldmVudCBtZXNzYWdlDQoNCg0KSGkgQ2hyaXMsDQoNCj4gU28sIEkgaGF2ZSAyIHF1
ZXN0aW9ucyBmb3IgdGhpcyBhbmQgaG9wZSBzb21lb25lIHdobyBoYWQgZXhwZXJpZW5jZQ0KPiB3
aXRoIHRoaXMgY291bGQgc2hhcmUgaWRlYXMgd2l0aCBtZSwgSSdsbCBhcHByZWNpYXRlIGl0Og0K
PiAgICAxLiBXaHkgdGhlIGV2ZW50IGRvZXNuJ3QgYXBwZWFyIGluIHRoZSAidmFyL2xvZy9pcG1p
X3NlbCIgb3IgY2FuJ3QNCj4gYmUgc2VlbiBieSB1c2luZyAiaXBtaXRvb2wgc2VsIGVsaXN0Ij8g
SSBleHBlY3RlZCBpdCBzaG91bGQgYXBwZWFyLg0KDQpEaXNjbGFpbWVyOiBoZXJlIGFuZCBiZWxv
dyBJIHRhbGsgb25seSBhYm91dCBmaWxlLWJhc2VkIGltcGxlbWVudGF0aW9uDQpmb3IgbG9ncy4N
Cg0KSXQgaXMga25vd24gbGltaXRhdGlvbi4gRmlyc3Qgb2YgYWxsLCB5b3Ugc2hvdWxkIGF3YXJl
IHRoYXQgdGhlcmUgYXJlDQp0d28gY29tcGxldGVseSBkaWZmZXJlbnQgbG9nczogUmVkZmlzaCBM
b2cgYW5kIFNFTCBsb2cuIFdoZW4gYW4NCmludGVybmFsIHNlbnNvciB0cmlnZ2VycyB0aHJlc2hv
bGQgZXZlbnQsIHR3byBkaWZmZXJlbnQgbWVzc2FnZXMgYXJlDQpzZW50OiBvbmUgZm9yIHJlZGZp
c2ggbG9nIGFuZCBhbm90aGVyIHRvIFNFTC4NCg0KVGhlIHNlbC1sb2dnZXIgY3VycmVudGx5IGRl
c2lnbmVkIHRvIG9ubHkgaGFuZGxlIHRocmVzaG9sZCBldmVudHMgZnJvbQ0KaW50ZXJuYWwgc2Vu
c29ycywgdGh1cyBpdCByZXF1aXJlcyBkYnVzIHBhdGggdG8gdGhlIHNlbnNvciBhcyBhbg0KYXJn
dW1lbnQgZm9yIElwbWlTZWxBZGQuDQpXaGVuIHlvdSBzZW5kIGV4dGVybmFsIElQTUkgZXZlbnQv
U0VMIGFkZCBtZXNzYWdlLCBpcG1pIGRhZW1vbiBkb2Vzbid0DQprbm93IGhvdyB0byBoYW5kbGUg
aXQuIEluc3RlYWQsIGludGVsLWlwbWktb2VtLCB0cmllcyB0byBwYXJzZSB0aGUNCmV2ZW50IGFj
Y29yZGluZyB0byBzb21lIHJ1bGVzIGFuZCBpZiBpdCBmYWlscyBqdXN0IGFkZHMgdGhpcyB3ZWly
ZA0KIk9wZW5CTUMuMC4xLlNFTEVudHJ5QWRkZWQsMkMwNDAxMzAwMTA5RkZGRiIgdG8gdGhlIHJl
ZGZpc2ggbG9nLCBzYXlpbmcNCiJ3ZSBnb3Qgc29tZSBpcG1pIGV2ZW50LCBidXQgd2UgZG9uJ3Qg
a25vdyB3aGF0IGlzIGl0Ii4NCg0KSSBleHRlbmRlZCBzZWwtbG9nZ2VyIHdpdGggQWRkRXh0IG1l
dGhvZCwgdG8gc3RvcmUgYW55IHJhbmRvbSBTRUwgZW50cnkNCnRvIC92YXIvbG9nL2lwbWlfc2Vs
LCBidXQgdGhpcyBwYXRjaGVzIGFyZSBmb3Igb3VyIGludGVybmFsIEludGVsLUJNQw0KZm9yayBh
bmQgbm90IGFwcGxpZWQgZm9yIHVwc3RyZWFtIHZlcnNpb24uDQpJdCBpcyBvbiBteSByb2FkbWFw
IHRvIHVwZGF0ZSBwYXRjaGVzIGFuZCBzdWJtaXQgdGhlbS4gSWYgdGhlcmUgaXMNCmRlbWFuZCBm
b3IgdGhpcyB3b3JrLCBJIGNhbiB0cnkgdG8gcHJpb3JpdGl6ZSBpdC4NCg0KPiAgICAyLiBXaGF0
IGRvZXMgIkdldCBTRFIgMDAwNCBjb21tYW5kIGZhaWxlZDogSW52YWxpZCBkYXRhIGZpZWxkIGlu
DQo+IHJlcXVlc3QiIG1lYW4/DQo+DQo+IFRoaW5ncyB0byBOb3RlOg0KPiAgICAxLiBUaGUgdmVy
c2lvbiBvZiBPcHJuQk1DIGNvZGViYXNlIEkgdXNlZCBpcyAyLjEwLXJjMS4NCj4gICAgMi4gVGhl
IGltYWdlIEkgYnVpbHQgaW5jbHVkZWQgImludGVsLWlwbWktb2VtIiwgInBob3NwaG9yLWxvZ2dp
bmciLA0KPiAicGhvc3Bob3Itc2VsLWxvZ2dlciIsICJyc3lzbG9nIiBhbmQgImVudGl0eS1tYW5h
Z2VyIi4NCj4NCj4gVGhhbmsgeW91Lg0KPg0KPiBSZWdhcmRzLA0KPiBDaHJpcyBDaGVuDQo+IExl
Z2FsIERpc2NsYWltZXIgOg0KPiBUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgbWVz
c2FnZSBtYXkgYmUgcHJpdmlsZWdlZCBhbmQNCj4gY29uZmlkZW50aWFsLg0KPiBJdCBpcyBpbnRl
bmRlZCB0byBiZSByZWFkIG9ubHkgYnkgdGhlIGluZGl2aWR1YWwgb3IgZW50aXR5IHRvIHdob20g
aXQNCj4gaXMgYWRkcmVzc2VkDQo+IG9yIGJ5IHRoZWlyIGRlc2lnbmVlLiBJZiB0aGUgcmVhZGVy
IG9mIHRoaXMgbWVzc2FnZSBpcyBub3QgdGhlIGludGVuZGVkDQo+IHJlY2lwaWVudCwNCj4gaXMg
c3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGlu
IGVycm9yLA0KPiBwbGVhc2UgaW1tZWRpYXRlbHkgbm90aWZ5IHRoZSBzZW5kZXIgYW5kIGRlbGV0
ZSBvciBkZXN0cm95IGFueSBjb3B5IG9mDQo+IHRoaXMgbWVzc2FnZSENCg0KLS0NCkJlc3QgcmVn
YXJkcywNCkFuZHJlaSBLYXJ0YXNoZXYNCg0KDQo=

--_000_DM6PR08MB5514A718D900C61B7CCFBD7CDC8D9DM6PR08MB5514namp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Andrei,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &qu=
ot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helveti=
ca Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255=
, 255);display:inline !important">&gt;<span style=3D"background-color:rgb(2=
55, 255, 255);display:inline !important">&gt;</span>Disclaimer:
 here and below I talk only about file-based implementation</span><br>
<span style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &qu=
ot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helveti=
ca Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255=
, 255);display:inline !important">&gt;<span style=3D"background-color:rgb(2=
55, 255, 255);display:inline !important">&gt;</span>for
 logs.</span><br style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pm=
ingliu, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &q=
uot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color:r=
gb(255, 255, 255)">
<br style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &quot=
;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica=
 Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255, =
255)">
<span style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &qu=
ot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helveti=
ca Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255=
, 255);display:inline !important">&gt;<span style=3D"background-color:rgb(2=
55, 255, 255);display:inline !important">&gt;</span>It
 is known limitation. First of all, you should aware that there are</span><=
br style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &quot;=
Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica =
Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255, 2=
55)">
<span style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &qu=
ot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helveti=
ca Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255=
, 255);display:inline !important">&gt;<span style=3D"background-color:rgb(2=
55, 255, 255);display:inline !important">&gt;</span>two
 completely different logs: Redfish Log and SEL log. When an</span><br styl=
e=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &quot;Segoe U=
I&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&qu=
ot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &qu=
ot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helveti=
ca Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255=
, 255);display:inline !important">&gt;<span style=3D"background-color:rgb(2=
55, 255, 255);display:inline !important">&gt;</span>internal
 sensor triggers threshold event, two different messages are</span><br styl=
e=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &quot;Segoe U=
I&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&qu=
ot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &qu=
ot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helveti=
ca Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255=
, 255);display:inline !important">&gt;<span style=3D"background-color:rgb(2=
55, 255, 255);display:inline !important">&gt;</span>sent:
 one for redfish log and another to SEL.</span><br style=3D"font-family:&qu=
ot;Microsoft Jhenghei UI&quot;, Pmingliu, &quot;Segoe UI&quot;, -apple-syst=
em, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font=
-size:14.6667px;background-color:rgb(255, 255, 255)">
<br style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &quot=
;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica=
 Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255, =
255)">
<span style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &qu=
ot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helveti=
ca Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255=
, 255);display:inline !important"><span style=3D"background-color:rgb(255, =
255, 255);display:inline !important">&gt;<span style=3D"background-color:rg=
b(255, 255, 255);display:inline !important">&gt;</span></span>The
 sel-logger currently designed to only handle threshold events from</span><=
br style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &quot;=
Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica =
Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255, 2=
55)">
<span style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &qu=
ot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helveti=
ca Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255=
, 255);display:inline !important"><span style=3D"background-color:rgb(255, =
255, 255);display:inline !important">&gt;<span style=3D"background-color:rg=
b(255, 255, 255);display:inline !important">&gt;</span></span>internal
 sensors, thus it requires dbus path to the sensor as an</span><br style=3D=
"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &quot;Segoe UI&qu=
ot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;,=
 sans-serif;font-size:14.6667px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &qu=
ot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helveti=
ca Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255=
, 255);display:inline !important"><span style=3D"background-color:rgb(255, =
255, 255);display:inline !important">&gt;<span style=3D"background-color:rg=
b(255, 255, 255);display:inline !important">&gt;</span></span>argument
 for IpmiSelAdd.</span><br style=3D"font-family:&quot;Microsoft Jhenghei UI=
&quot;, Pmingliu, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, =
Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;backgrou=
nd-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &qu=
ot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helveti=
ca Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255=
, 255);display:inline !important"><span style=3D"background-color:rgb(255, =
255, 255);display:inline !important">&gt;<span style=3D"background-color:rg=
b(255, 255, 255);display:inline !important">&gt;</span></span>When
 you send external IPMI event/SEL add message, ipmi daemon doesn't</span><b=
r style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &quot;S=
egoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica N=
eue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255, 25=
5)">
<span style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &qu=
ot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helveti=
ca Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255=
, 255);display:inline !important"><span style=3D"background-color:rgb(255, =
255, 255);display:inline !important">&gt;<span style=3D"background-color:rg=
b(255, 255, 255);display:inline !important">&gt;</span></span>know
 how to handle it. Instead, intel-ipmi-oem, tries to parse the</span><br st=
yle=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &quot;Segoe=
 UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&=
quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &qu=
ot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helveti=
ca Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255=
, 255);display:inline !important"><span style=3D"background-color:rgb(255, =
255, 255);display:inline !important">&gt;<span style=3D"background-color:rg=
b(255, 255, 255);display:inline !important">&gt;</span></span>event
 according to some rules and if it fails just adds this weird</span><br sty=
le=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &quot;Segoe =
UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&q=
uot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &qu=
ot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helveti=
ca Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255=
, 255);display:inline !important"><span style=3D"background-color:rgb(255, =
255, 255);display:inline !important">&gt;<span style=3D"background-color:rg=
b(255, 255, 255);display:inline !important">&gt;</span></span>&quot;OpenBMC=
.0.1.SELEntryAdded,2C0401300109FFFF&quot;
 to the redfish log, saying</span><br style=3D"font-family:&quot;Microsoft =
Jhenghei UI&quot;, Pmingliu, &quot;Segoe UI&quot;, -apple-system, BlinkMacS=
ystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667=
px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &qu=
ot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helveti=
ca Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255=
, 255);display:inline !important"><span style=3D"background-color:rgb(255, =
255, 255);display:inline !important">&gt;<span style=3D"background-color:rg=
b(255, 255, 255);display:inline !important">&gt;</span></span>&quot;we
 got some ipmi event, but we don't know what is it&quot;.</span></div>
<div style=3D"color: rgb(0, 0, 0);"><span style=3D"font-size: 12pt; font-fa=
mily: Calibri, Helvetica, sans-serif;">Now I get it. I have to say this exp=
lanation help me to understand more details. Thanks a lot.</span></div>
<div style=3D"color: rgb(0, 0, 0);"><span style=3D"font-size: 12pt; font-fa=
mily: Calibri, Helvetica, sans-serif;">Another, may I consult you other rel=
ated questions? That is</span></div>
<div style=3D"color: rgb(0, 0, 0);">
<ul>
<li style=3D"font-size:12pt;font-family:Calibri, Helvetica, sans-serif">I h=
ad a question about &quot;sel-logger&quot; before, and Lei suggested I to e=
nable &quot;send-to-logger&quot; option, does this have any relevance you m=
entioned above?</li><li style=3D"font-size:12pt;font-family:Calibri, Helvet=
ica, sans-serif"><span style=3D"font-size: 12pt; font-family: Calibri, Helv=
etica, sans-serif;">I saw some companies have the xxx-yaml-config folder wi=
th &quot;xxx-ipmi-sensors.yaml&quot; etc. and also have the &quot;entity-ma=
nager&quot;
 folder with &quot;xxx.json&quot;. But some companies only have &quot;entit=
y-manager&quot; folder. So I would like to understand what differences they=
 are? Should I need them both? I for now use &quot;entity-manager&quot;
<span style=3D"background-color:rgb(255, 255, 255);display:inline !importan=
t">only</span>.</span></li></ul>
</div>
<div style=3D"color: rgb(0, 0, 0);"><span style=3D"font-size: 12pt; font-fa=
mily: Calibri, Helvetica, sans-serif;"><span style=3D"font-family:&quot;Mic=
rosoft Jhenghei UI&quot;, Pmingliu, &quot;Segoe UI&quot;, -apple-system, Bl=
inkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:=
14.6667px;background-color:rgb(255, 255, 255);display:inline !important"><s=
pan style=3D"background-color:rgb(255, 255, 255);display:inline !important"=
>&gt;<span style=3D"background-color:rgb(255, 255, 255);display:inline !imp=
ortant">&gt;</span></span>I
 extended sel-logger with AddExt method, to store any random SEL entry</spa=
n><br>
<span style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &qu=
ot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helveti=
ca Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255=
, 255);display:inline !important"><span style=3D"background-color:rgb(255, =
255, 255);display:inline !important">&gt;<span style=3D"background-color:rg=
b(255, 255, 255);display:inline !important">&gt;</span></span>to
 /var/log/ipmi_sel, but this patches are for our internal Intel-BMC</span><=
br style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &quot;=
Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica =
Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255, 2=
55)">
<span style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &qu=
ot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helveti=
ca Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255=
, 255);display:inline !important"><span style=3D"background-color:rgb(255, =
255, 255);display:inline !important">&gt;<span style=3D"background-color:rg=
b(255, 255, 255);display:inline !important">&gt;</span></span>fork
 and not applied for upstream version.</span><br style=3D"font-family:&quot=
;Microsoft Jhenghei UI&quot;, Pmingliu, &quot;Segoe UI&quot;, -apple-system=
, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-s=
ize:14.6667px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &qu=
ot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helveti=
ca Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255=
, 255);display:inline !important"><span style=3D"background-color:rgb(255, =
255, 255);display:inline !important">&gt;<span style=3D"background-color:rg=
b(255, 255, 255);display:inline !important">&gt;</span></span>It
 is on my roadmap to update patches and submit them. If there is</span><br =
style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &quot;Seg=
oe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neu=
e&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255, 255)=
">
<span style=3D"font-family:&quot;Microsoft Jhenghei UI&quot;, Pmingliu, &qu=
ot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helveti=
ca Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255=
, 255);display:inline !important"><span style=3D"background-color:rgb(255, =
255, 255);display:inline !important">&gt;<span style=3D"background-color:rg=
b(255, 255, 255);display:inline !important">&gt;</span></span>demand
 for this work, I can try to prioritize it.</span></span></div>
<div style=3D"color: rgb(0, 0, 0);"><span style=3D"font-size: 12pt; font-fa=
mily: Calibri, Helvetica, sans-serif;"><span style=3D"margin:0px"><span sty=
le=3D"margin:0px;font-size:12pt">It definitely will be helpful for me if yo=
u are able to prioritize this feature.:)</span></span></span></div>
<div style=3D"color: rgb(0, 0, 0);"><span style=3D"font-size: 12pt; font-fa=
mily: Calibri, Helvetica, sans-serif;"><br>
</span></div>
<div style=3D"color: rgb(0, 0, 0);"><span style=3D"font-size: 12pt; font-fa=
mily: Calibri, Helvetica, sans-serif;">Regards,</span></div>
<div style=3D"color: rgb(0, 0, 0);"><span style=3D"font-size: 12pt; font-fa=
mily: Calibri, Helvetica, sans-serif;">Chris Chen<br>
<span style=3D"margin:0px"></span><br>
</span></div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B1H=A5=F3=AA=CC:</b> Andrei Ka=
rtashev &lt;a.kartashev@yadro.com&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b> 2021=A6~11=A4=EB3=A4=E9 =A4U=A4=C8 10:06<br>
<b>=A6=AC=A5=F3=AA=CC:</b> Chris Chen (TPI) &lt;Chris.Chen3@flex.com&gt;; o=
penbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>=A5D=A6=AE:</b> Re: [phosphor-host-ipmid] Questions about IPMI event mes=
sage</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText"><br>
Hi Chris,<br>
<br>
&gt; So, I have 2 questions for this and hope someone who had experience<br=
>
&gt; with this could share ideas with me, I'll appreciate it:<br>
&gt; &nbsp;&nbsp;&nbsp;1. Why the event doesn't appear in the &quot;var/log=
/ipmi_sel&quot; or can't<br>
&gt; be seen by using &quot;ipmitool sel elist&quot;? I expected it should =
appear.<br>
<br>
Disclaimer: here and below I talk only about file-based implementation<br>
for logs.<br>
<br>
It is known limitation. First of all, you should aware that there are<br>
two completely different logs: Redfish Log and SEL log. When an<br>
internal sensor triggers threshold event, two different messages are<br>
sent: one for redfish log and another to SEL.<br>
<br>
The sel-logger currently designed to only handle threshold events from<br>
internal sensors, thus it requires dbus path to the sensor as an<br>
argument for IpmiSelAdd. <br>
When you send external IPMI event/SEL add message, ipmi daemon doesn't<br>
know how to handle it. Instead, intel-ipmi-oem, tries to parse the<br>
event according to some rules and if it fails just adds this weird<br>
&quot;OpenBMC.0.1.SELEntryAdded,2C0401300109FFFF&quot; to the redfish log, =
saying<br>
&quot;we got some ipmi event, but we don't know what is it&quot;.<br>
<br>
I extended sel-logger with AddExt method, to store any random SEL entry<br>
to /var/log/ipmi_sel, but this patches are for our internal Intel-BMC<br>
fork and not applied for upstream version.<br>
It is on my roadmap to update patches and submit them. If there is<br>
demand for this work, I can try to prioritize it.<br>
<br>
&gt; &nbsp;&nbsp;&nbsp;2. What does &quot;Get SDR 0004 command failed: Inva=
lid data field in<br>
&gt; request&quot; mean?<br>
&gt; <br>
&gt; Things to Note:&nbsp;<br>
&gt; &nbsp;&nbsp;&nbsp;1. The version of OprnBMC codebase I used is 2.10-rc=
1.<br>
&gt; &nbsp;&nbsp;&nbsp;2. The image I built included &quot;intel-ipmi-oem&q=
uot;, &quot;phosphor-logging&quot;,<br>
&gt; &quot;phosphor-sel-logger&quot;, &quot;rsyslog&quot; and &quot;entity-=
manager&quot;.<br>
&gt; <br>
&gt; Thank you.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Chris Chen&nbsp;<br>
&gt; Legal Disclaimer :<br>
&gt; The information contained in this message may be privileged and<br>
&gt; confidential. <br>
&gt; It is intended to be read only by the individual or entity to whom it<=
br>
&gt; is addressed <br>
&gt; or by their designee. If the reader of this message is not the intende=
d<br>
&gt; recipient, <br>
&gt; is strictly prohibited. If you have received this message in error, <b=
r>
&gt; please immediately notify the sender and delete or destroy any copy of=
<br>
&gt; this message!<br>
<br>
-- <br>
Best regards,<br>
Andrei Kartashev<br>
<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM6PR08MB5514A718D900C61B7CCFBD7CDC8D9DM6PR08MB5514namp_--
