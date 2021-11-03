Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DD4443BBF
	for <lists+openbmc@lfdr.de>; Wed,  3 Nov 2021 04:10:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkWxS5J9Bz2yJL
	for <lists+openbmc@lfdr.de>; Wed,  3 Nov 2021 14:10:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=Mtgdb2ix;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.132.180.100;
 helo=mx07-002d6701.pphosted.com;
 envelope-from=prvs=59416ae996=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=Mtgdb2ix; dkim-atps=neutral
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com
 [185.132.180.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkWww2DbGz2xD8
 for <openbmc@lists.ozlabs.org>; Wed,  3 Nov 2021 14:10:21 +1100 (AEDT)
Received: from pps.filterd (m0211474.ppops.net [127.0.0.1])
 by mx08-002d6701.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A31ZwIi030913
 for <openbmc@lists.ozlabs.org>; Wed, 3 Nov 2021 03:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=dkim;
 bh=3/DftshiLeqcXdEk8UoBmYQm1tlHFz3/ejncpy2VTW4=;
 b=Mtgdb2ixBFuFixJAgAXsmnEf5zd8AzAGJQ4EO2/I0LywwOFA80Ceutij9cUCxCy0rAuF
 qobZOHmggoeknnGciO8JGrD1xtM8RiomA2aoLuIXdfRsDQw9r589MXtBbcQ9tUzOVm9B
 TI9pI5HPyec73XFe7dScjAAA8+/sL5jEhZksvYBQfwBtMYGuu4j7NvnNzK5nSBKIjfeD
 9M2h8aRvO9KFhQedEbtiALntdpZnSawzgVg3cM3vaeQVVAOE17PVphQvqnhFbzBOpJiJ
 4sYbnBR5clxemojTwcQm2MTAHQfPj+57k6M4PEHzfnahYLFCzk81cLyu+SToInW+ug1h cw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by mx08-002d6701.pphosted.com with ESMTP id 3c3dyhs4mg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 03 Nov 2021 03:10:17 +0000
Received: from MWHPR10CA0051.namprd10.prod.outlook.com (2603:10b6:300:2c::13)
 by BY3PR08MB7060.namprd08.prod.outlook.com (2603:10b6:a03:36d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Wed, 3 Nov
 2021 03:10:15 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:2c:cafe::d9) by MWHPR10CA0051.outlook.office365.com
 (2603:10b6:300:2c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Wed, 3 Nov 2021 03:10:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.17)
 smtp.mailfrom=flex.com; lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=fail action=oreject
 header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.17 as permitted sender) receiver=protection.outlook.com; 
 client-ip=144.49.247.17; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.17) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 03:10:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1RefQkU49dWUJlXIdA9iZTgvZ9ENYmp1COydHmlBbropPNgdt5ZlJkHEgAz5W45jrNFkBNF2pzai5o6hpcXpRtTPN1jNbkTkFeiJraIrfv9fF2IAB+p3YHQOuSHvR6rRz+UbL/Is214TMtfPRc7enBnfFsM/ntFfcohaz29JXI3umpU0mnoGkWJ24W+wdJKjZqcnQ0DINcr4iV0fVFcejJLwVYMrWhF/VHp2Qza94J7KdTJbH1KdCpgsxe1Q0NYejz81im7F2QlcjJmLVyQWg5d8nkaP5PX9KgyP61XxZXa/47jo//pmoJAVTsxCUZyL5zdUEqar1KNvTmJpXWoCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3duhr+glflV2SqE9D0X+HA1p0QgBADYRFuPuAmNK6EM=;
 b=jIkWWFTMqYdu1Mou+P/r5pZmQlxSL4r3M2yiaemUvw5QCJEBtat8sFLxwITs1WaF/M0HdEhMZ/IzYWwHqNjt4PmRSqozucnVZL6yGFsdFM5S9N85IHQ8rjqYB8fy9wAICjE1UGK34rDXudtuQCT+vGFrkEeyCJvUP1yKEQs1FesQgp7bk4YMFi9bvG6RV2oeHppSAaS1HgW+AF244zTa7EBqvR1O+9UjOPKCfBt+Eni82YNWKbsW9aarfVmJjPzgEE59xmIMhPwQk+nh3iZWFvK+RWSntvURe0ZV7+nRkg5oM3bvoP58H8WRJ/dFo+tl91YTtIpGXAW4IKBiqJ3w7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by DM5PR08MB3595.namprd08.prod.outlook.com (2603:10b6:4:6b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.19; Wed, 3 Nov
 2021 03:10:12 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::b084:d3b3:942c:d1e9]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::b084:d3b3:942c:d1e9%3]) with mapi id 15.20.4649.019; Wed, 3 Nov 2021
 03:10:12 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [phosphor-host-ipmid] Questions about IPMI event message
Thread-Topic: [phosphor-host-ipmid] Questions about IPMI event message
Thread-Index: AQHX0FzdH8Cp8KRP+U+lOT6FZDTGFw==
Date: Wed, 3 Nov 2021 03:10:12 +0000
Message-ID: <DM6PR08MB55142C3AE9871FB3700BD577DC8C9@DM6PR08MB5514.namprd08.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 6474594b-79af-e7eb-370f-5cc5e64f005f
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=flex.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: eeee85a6-d6b7-4786-91b1-08d99e777488
x-ms-traffictypediagnostic: DM5PR08MB3595:|BY3PR08MB7060:
X-Microsoft-Antispam-PRVS: <BY3PR08MB706091A17E801FF17E021F46DC8C9@BY3PR08MB7060.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: bhu6/KPx0+1u6eFZuxsYmkVUKx30+VuFvbzMSgES4N/NyPRY58CvnXJKmgqk/+BMeJGR6hEHbi0O0ZnIi9T96CF3xZJUhwc6O5ERexb58mZc7fK0rwfPRK5lY/YJDZNpxCWaPhwgAuDtJRNKMI+d20EWG7aNpNs3INJF7Cb+4c9NpVipc+2KLRSSrwLjk8CxbOk/4ClkDOStoS91Ow27ZirdB5yVjppROHoeDpov86vZmbwWKfuMg+hN7Mfytev5AfBRwvUIsODzq/RLWKVc5Tk7xT7BuE0yrERuxoFZ3fqVoxveuX18nsSdlAam7Pdo4a+ZT58XJtkuJv7mULs1KoPRWwMBbsIpMGlvfV2nW0kgXTlEC5NxNZUFPEZZFlYREmwLAvCw41caWNuYvZ3D5SU/471EwrYp1du60noCb16cccawvistYMVXkbxta6PyZfkENGgc2vbOewgGbN+AgAHBKdLI2nBxoF1IPveWZFnN8qWhSoZUyecgmgOQRCVSF1biT4hzXJIF5WKQ4eEeENo1uOvvpHS/dBQNKAvWiGXfehCPM9iOVQSHvngnSRnbD8kVigtCYfx+WjgablDanIjOUdxxm/wYG0+qd3iUK2PU6GF5ZcNRVhxzKTd1EItbE3NX4uHqpeBdrdH8NO8QmUkkhXt8s3NbV16svNlRARaInxtqAr4e9Rmqx2xGmgPG6Yw6VsFzOC1BzZrOfADj1A==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5514.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(366004)(15650500001)(9686003)(66446008)(66556008)(66476007)(64756008)(66946007)(6506007)(91956017)(19627405001)(8676002)(8936002)(38070700005)(5660300002)(2906002)(76116006)(7696005)(6916009)(86362001)(55016002)(186003)(122000001)(38100700002)(52536014)(316002)(33656002)(508600001)(83380400001)(71200400001);
 DIR:OUT; SFP:1102; 
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB55142C3AE9871FB3700BD577DC8C9DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR08MB3595
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6baeb34a-15dd-426c-9be0-08d99e777383
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5vhPDYiRQK7DBMZI6e+LFUZqgiCcVhHQjmPtrCyxuPuJs6/vYTGRwRQ91ljmQjr4YNCh10IJ1QWdcCfBlSuF/bLCSjoff2heUqpOivZG1pXRlbckzq8AqtcG04ZoFHfeJ9xRZVzLGWkIXVVpRdNluGROw4n89Fc4Fj8PaduReQisx6mXfXjxU/6tREboh/g9IN3TgQxzbqy2PDGovoPXzcaqOMuBCBKuuyFxzKTxsXXhs/T6RShKW3l/PWLShkybyS0q/IOJdYy5NZKlDSpQNo8sPtkX+VxqS52BeoNGXySWSYjzP1cZzaU1gayHE/honhSt3M5I7yf2i8KG7hBzQgcEqIUX5RibrebmrS9DYOJyQKGZK4uAqqC624XqcleUNdP48PMVaz1oymOI0xqq8hfJCRx4Xf8+dTUydDbtZS1JnQF2QTJxqNotZYFH20uTCq9SkrC+9ZGy2KY163DDi+foqQB9vQRiSnISSTtA4//bsmnYBqdV3DP2MAnrGNzZrb9ISHHJ4PW47yqLTeg5mM2Z1+99q+LlKBj9PvHmESTHB7q3NT1UsYwGhBHpxANzaRNNpNWIJzPdIx/aHfp9R46NMAJBCUztyZ2Fuw2cBPUXHfZS0pdJaKD/Agz/bKfKw6Tg09Ih/hE/Krb344ieeB6kIZlA43XWi2sxBTi5J1vMYn13Sa2beuEKpX8EbHNNFR2po9WP7KCtiVoJQkXjUbA0bpgHEJm3AOCiLt06t7c=
X-Forefront-Antispam-Report: CIP:144.49.247.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(46966006)(36840700001)(6506007)(83380400001)(81166007)(70206006)(7696005)(2906002)(86362001)(508600001)(4186021)(5660300002)(8676002)(356005)(70586007)(82310400003)(47076005)(6916009)(36860700001)(19627405001)(186003)(55016002)(26005)(8936002)(316002)(336012)(9686003)(52536014)(15650500001)(33656002)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 03:10:14.1021 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eeee85a6-d6b7-4786-91b1-08d99e777488
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.17];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR08MB7060
X-Proofpoint-ORIG-GUID: JKbGbZaPKAR9HI4ujVcNSsCBNNLBNFdl
X-Proofpoint-GUID: JKbGbZaPKAR9HI4ujVcNSsCBNNLBNFdl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-03_01,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 mlxlogscore=988
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111030016
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

--_000_DM6PR08MB55142C3AE9871FB3700BD577DC8C9DM6PR08MB5514namp_
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="big5"

SGkgYWxsLA0KDQpJIHNlbnQgYW4gSVBNSSBjb21tYW5kIGZvciB0ZXN0aW5nIHRoZSBldmVudCBt
ZXNzYWdlIGZlYXR1cmUsIHRoZSBjb21tYW5kIGFuZCByZXNwb25zZSBhcyBiZWxvdywgbG9va3Mg
dGhlIGV2ZW50IGhhcyBiZWVuIHNlbnQuDQoNCj09PT09PQ0KJCBpcG1pdG9vbCAtSSBsYW5wbHVz
IC1IIDE5Mi4xNjguMS4yMCAtQyAxNyAtVSByb290IC1QIDBwZW5CbWMgZXZlbnQgMQ0KU2VuZGlu
ZyBTQU1QTEUgZXZlbnQ6IFRlbXBlcmF0dXJlIC0gVXBwZXIgQ3JpdGljYWwgLSBHb2luZyBIaWdo
DQpHZXQgU0RSIDAwMDQgY29tbWFuZCBmYWlsZWQ6IEludmFsaWQgZGF0YSBmaWVsZCBpbiByZXF1
ZXN0DQpHZXQgU0RSIDAwMDQgY29tbWFuZCBmYWlsZWQ6IEludmFsaWQgZGF0YSBmaWVsZCBpbiBy
ZXF1ZXN0DQpHZXQgU0RSIDAwMDQgY29tbWFuZCBmYWlsZWQ6IEludmFsaWQgZGF0YSBmaWVsZCBp
biByZXF1ZXN0DQpHZXQgU0RSIDAwMDQgY29tbWFuZCBmYWlsZWQ6IEludmFsaWQgZGF0YSBmaWVs
ZCBpbiByZXF1ZXN0DQpHZXQgU0RSIDAwMDQgY29tbWFuZCBmYWlsZWQ6IEludmFsaWQgZGF0YSBm
aWVsZCBpbiByZXF1ZXN0DQogICAwIHwgIFByZS1Jbml0ICB8MDAwMDAwMDAwMHwgVGVtcGVyYXR1
cmUgIzB4MzAgfCBVcHBlciBDcml0aWNhbCBnb2luZyBoaWdoIHwgQXNzZXJ0ZWQNCj09PT09PQ0K
DQpUaGVuLCBJIGNoZWNrZWQgdGhlIHJlc3VsdCBvbiB0aGUgcGxhdGZvcm0sIEkgYW0gYWJsZSB0
byBzZWUgdGhlIGVuZXZ0IGhhcyBiZWVuIGFkZGVkIGluIHRoZSAiL3Zhci9sb2cvcmVkZmlzaCIg
KG9mIGNvdXJzZSBJIGFsc28gY2FuIHNlZSBpdCBvbiBXZWJVSSksIGhvd2V2ZXIsIGl0IGRvZXNu
J3QgYXBwZWFyIGluIHRoZSAidmFyL2xvZy9pcG1pX3NlbCIgb3IgdGhlIHJlc3VsdCBvZiB1c2lu
ZyAiaXBtaXRvb2wgc2VsIGVsaXN0Ii4NCg0KPT09PT09DQpyb290QGh1ZHNvbmJheS1vYm1jOn4j
IGNhdCAvdmFyL2xvZy9yZWRmaXNoDQoxOTcwLTAxLTAxVDAwOjAwOjEzLjA1MjIwNyswMDowMCBP
cGVuQk1DLjAuMS5EQ1Bvd2VyT24sDQoxOTcwLTAxLTAxVDAwOjAwOjE1LjM4MDU5MSswMDowMCBP
cGVuQk1DLjAuMS5TRUxFbnRyeUFkZGVkLDJDMDQwODY2NkYwMEZGRkYNCjE5NzAtMDEtMDFUMDA6
MDA6MjMuNDgxNTY0KzAwOjAwIE9wZW5CTUMuMC4xLkludmVudG9yeUFkZGVkLGh1ZHNvbmJheSxC
b2FyZCxzc3Nubm4tMTIzMTIzMTINCjE5NzAtMDEtMDFUMDA6MDA6MzIuMjgxNDY3KzAwOjAwIE9w
ZW5CTUMuMC4xLlNFTEVudHJ5QWRkZWQsMkMwNDIxODAwOEYxMEMwQQ0KMTk3MC0wMS0wMVQwMDow
MTo0Ny41NzIwNzkrMDA6MDAgT3BlbkJNQy4wLjEuU0VMRW50cnlBZGRlZCwyQzA0MjE4MDA4RjAw
QzBBDQoxOTcwLTAxLTAxVDAwOjAzOjQyLjA4OTg4NSswMDowMCBPcGVuQk1DLjAuMS5TRUxFbnRy
eUFkZGVkLDJDMDQwMTMwMDEwOUZGRkYNCnJvb3RAaHVkc29uYmF5LW9ibWM6fiMNCnJvb3RAaHVk
c29uYmF5LW9ibWM6fiMNCnJvb3RAaHVkc29uYmF5LW9ibWM6fiMgaXBtaXRvb2wgc2VsIGVsaXN0
DQpTRUwgaGFzIG5vIGVudHJpZXMNCnJvb3RAaHVkc29uYmF5LW9ibWM6fiMNCj09PT09PQ0KDQpT
bywgSSBoYXZlIDIgcXVlc3Rpb25zIGZvciB0aGlzIGFuZCBob3BlIHNvbWVvbmUgd2hvIGhhZCBl
eHBlcmllbmNlIHdpdGggdGhpcyBjb3VsZCBzaGFyZSBpZGVhcyB3aXRoIG1lLCBJJ2xsIGFwcHJl
Y2lhdGUgaXQ6DQoNCiAgMS4gIFdoeSB0aGUgZXZlbnQgZG9lc24ndCBhcHBlYXIgaW4gdGhlICJ2
YXIvbG9nL2lwbWlfc2VsIiBvciBjYW4ndCBiZSBzZWVuIGJ5IHVzaW5nICJpcG1pdG9vbCBzZWwg
ZWxpc3QiPyBJIGV4cGVjdGVkIGl0IHNob3VsZCBhcHBlYXIuDQogIDIuICBXaGF0IGRvZXMgIkdl
dCBTRFIgMDAwNCBjb21tYW5kIGZhaWxlZDogSW52YWxpZCBkYXRhIGZpZWxkIGluIHJlcXVlc3Qi
IG1lYW4/DQoNClRoaW5ncyB0byBOb3RlOg0KDQogIDEuICBUaGUgdmVyc2lvbiBvZiBPcHJuQk1D
IGNvZGViYXNlIEkgdXNlZCBpcyAyLjEwLXJjMS4NCiAgMi4gIFRoZSBpbWFnZSBJIGJ1aWx0IGlu
Y2x1ZGVkICJpbnRlbC1pcG1pLW9lbSIsICJwaG9zcGhvci1sb2dnaW5nIiwgInBob3NwaG9yLXNl
bC1sb2dnZXIiLCAicnN5c2xvZyIgYW5kICJlbnRpdHktbWFuYWdlciIuDQoNClRoYW5rIHlvdS4N
Cg0KUmVnYXJkcywNCkNocmlzIENoZW4NCgpMZWdhbCBEaXNjbGFpbWVyIDoKVGhlIGluZm9ybWF0
aW9uIGNvbnRhaW5lZCBpbiB0aGlzIG1lc3NhZ2UgbWF5IGJlIHByaXZpbGVnZWQgYW5kIGNvbmZp
ZGVudGlhbC4gCkl0IGlzIGludGVuZGVkIHRvIGJlIHJlYWQgb25seSBieSB0aGUgaW5kaXZpZHVh
bCBvciBlbnRpdHkgdG8gd2hvbSBpdCBpcyBhZGRyZXNzZWQgCm9yIGJ5IHRoZWlyIGRlc2lnbmVl
LiBJZiB0aGUgcmVhZGVyIG9mIHRoaXMgbWVzc2FnZSBpcyBub3QgdGhlIGludGVuZGVkIHJlY2lw
aWVudCwgCnlvdSBhcmUgb24gbm90aWNlIHRoYXQgYW55IGRpc3RyaWJ1dGlvbiBvZiB0aGlzIG1l
c3NhZ2UsIGluIGFueSBmb3JtLCAKaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGhhdmUg
cmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGluIGVycm9yLCAKcGxlYXNlIGltbWVkaWF0ZWx5IG5vdGlm
eSB0aGUgc2VuZGVyIGFuZCBkZWxldGUgb3IgZGVzdHJveSBhbnkgY29weSBvZiB0aGlzIG1lc3Nh
Z2UhCg==

--_000_DM6PR08MB55142C3AE9871FB3700BD577DC8C9DM6PR08MB5514namp_
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
Hi all,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I sent an IPMI command for testing the event message feature, the command a=
nd response as below, looks the event has been sent.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
=3D=3D=3D=3D=3D=3D</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
$ ipmitool -I lanplus -H 192.168.1.20 -C 17 -U root -P 0penBmc event 1<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Sending SAMPLE event: Temperature - Upper Critical - Going High
<div>Get SDR 0004 command failed: Invalid data field in request</div>
<div>Get SDR 0004 command failed: Invalid data field in request</div>
<div>Get SDR 0004 command failed: Invalid data field in request</div>
<div>Get SDR 0004 command failed: Invalid data field in request</div>
<div>Get SDR 0004 command failed: Invalid data field in request</div>
&nbsp; &nbsp;<b>0 | &nbsp;Pre-Init &nbsp;|0000000000| Temperature #0x30 | U=
pper Critical going high | Asserted</b><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"margin:0px;font-size:12pt">=3D=3D=3D=3D=3D=3D</span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"margin:0px;font-size:12pt"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Then, I checked the result on the platform, I am able to see the enevt has =
been added in the &quot;/var/log/redfish&quot; (of course I also can see it=
 on WebUI), however, it doesn't appear in the &quot;var/log/ipmi_sel&quot; =
or the result of using &quot;ipmitool sel elist&quot;.<span style=3D"backgr=
ound-color:rgb(255, 255, 255);display:inline !important"></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
=3D=3D=3D=3D=3D=3D</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
root@hudsonbay-obmc:~# cat /var/log/redfish
<div>1970-01-01T00:00:13.052207+00:00 OpenBMC.0.1.DCPowerOn,</div>
<div>1970-01-01T00:00:15.380591+00:00 OpenBMC.0.1.SELEntryAdded,2C0408666F0=
0FFFF</div>
<div>1970-01-01T00:00:23.481564+00:00 OpenBMC.0.1.InventoryAdded,hudsonbay,=
Board,sssnnn-12312312</div>
<div>1970-01-01T00:00:32.281467+00:00 OpenBMC.0.1.SELEntryAdded,2C04218008F=
10C0A</div>
<div>1970-01-01T00:01:47.572079+00:00 OpenBMC.0.1.SELEntryAdded,2C04218008F=
00C0A</div>
<div>1970-01-01T00:03:42.089885+00:00 <b>OpenBMC.0.1.SELEntryAdded,2C040130=
0109FFFF</b></div>
<div>root@hudsonbay-obmc:~#</div>
<div>root@hudsonbay-obmc:~#</div>
<div>root@hudsonbay-obmc:~# ipmitool sel elist</div>
<div>SEL has no entries</div>
root@hudsonbay-obmc:~#<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
=3D=3D=3D=3D=3D=3D</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
So, I have 2 questions for this and hope someone who had experience with th=
is could share ideas with me, I'll appreciate it:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<ol>
<li>Why the event doesn't appear in the &quot;<span style=3D"text-align:sta=
rt;background-color:rgb(255, 255, 255);display:inline !important">var/log/i=
pmi_sel&quot; or can't be seen by using &quot;<span style=3D"background-col=
or:rgb(255, 255, 255);display:inline !important">ipmitool
 sel elist&quot;? I expected it should appear.</span></span></li><li>What d=
oes &quot;<span style=3D"text-align:start;background-color:rgb(255, 255, 25=
5);display:inline !important">Get SDR 0004 command failed: Invalid data fie=
ld in request&quot; mean?</span></li></ol>
<div><br>
</div>
<div><u>Things to Note</u>:&nbsp;</div>
<div>
<ol>
<li><span>The version of OprnBMC codebase I used is 2.10-rc1.</span></li><l=
i>The image I built included &quot;intel-ipmi-oem&quot;, &quot;phosphor-log=
ging&quot;, &quot;phosphor-sel-logger&quot;, &quot;rsyslog&quot; and &quot;=
entity-manager&quot;.</li></ol>
</div>
<div><br>
</div>
<div>Thank you.</div>
<div><br>
</div>
<div>Regards,</div>
<div>Chris Chen&nbsp;<br>
</div>
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

--_000_DM6PR08MB55142C3AE9871FB3700BD577DC8C9DM6PR08MB5514namp_--
