Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0C859F9F2
	for <lists+openbmc@lfdr.de>; Wed, 24 Aug 2022 14:28:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCQP74Qs8z3bmC
	for <lists+openbmc@lfdr.de>; Wed, 24 Aug 2022 22:28:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=K9oXyJYX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex.com (client-ip=185.132.180.100; helo=mx07-002d6701.pphosted.com; envelope-from=prvs=4235fd209f=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=K9oXyJYX;
	dkim-atps=neutral
X-Greylist: delayed 10919 seconds by postgrey-1.36 at boromir; Wed, 24 Aug 2022 22:27:58 AEST
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com [185.132.180.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCQNZ1X2Tz2yp5
	for <openbmc@lists.ozlabs.org>; Wed, 24 Aug 2022 22:27:55 +1000 (AEST)
Received: from pps.filterd (m0132503.ppops.net [127.0.0.1])
	by mx07-002d6701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27O7PmOS017729;
	Wed, 24 Aug 2022 09:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=dkim; bh=GEuTu3JVgAmPiAuq8ieoWNFK35p4nYKsjsniP0vVIoU=;
 b=K9oXyJYXsgnFmQzMtjshUPsx1YkhSgtEKVDFIrSyPqYJ2OqgId2pQhZSv2hkTZMifbM1
 8MlwdXnTrzsJ5pnoc+RI6PDbF6eG4q8LZsJvaR6UPFmBw6IaK7jv2NlQZV614Q5MCzU9
 b35A1nKxoWIf7hFn3URBDqHkvdSA3mkG2wgmE6JnStcdMjSe1/KGPt1LmHD5kMXPn0sf
 V+b4LETTqm5b2oIoIQv5p24AzpKblNJvPAzelHBgnDnEFPmYf07L/SwI+4mZn6Ym92Mt
 OPeh+sYdj+kt9nPvNHJ9Hbp0ZEgASahQoizBgVQSmc9Wh+NxLnqIxpbHVcJYqy+2XMSV aw== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2049.outbound.protection.outlook.com [104.47.57.49])
	by mx07-002d6701.pphosted.com (PPS) with ESMTPS id 3j4wteehnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Aug 2022 09:25:45 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NG/dfbmisGyxYKG05itSqhqXMX6eIAijxAxuCHC1b3KUAGWSijmDCYoUiIjIBP20u72O2P01/9CI12d++OWi7BY/62PgECkuMHeLTOf0gipLqehqayKqlacg0k0ehf15KDVDwS4DdDaIhHh/MXxeZzY6XyftHZ8Ai55Xv/ohEVX6HK1AI01HuTb/TUjJNV1/b++nvQg6pYy9ODRa+sW8R4qMOK5ViI4qMR4JzTXpfxyo1WUiNGhIBiajkgvDEQjW5Q6mbcI6I8RKeuJ4YI61lfxOJL+VKVU/b7aRycqD9S/NY/H+xLZ8SODekofbeNaLDwCBQ70HsHa8kaRTfaVZmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEuTu3JVgAmPiAuq8ieoWNFK35p4nYKsjsniP0vVIoU=;
 b=Ugq5tQs8gILjTWKqywMfUXea5XwiKTlUo5neFVIraGutZnChMdzk5kTbuuPGsoqw6nbPhQ/AXOLpKZb+mIYXFYHjQrxFyWj+WNRSjxgnWFPUa3FvB10q+7YnvHYzzLUcf/qYqzbCt/swHRSTTVGPZd7H1OsB7BKEyn//s4xbUI66/L+8Bz+YRsRXy1NqYOusZAUMnN4xP2xtSKqIIRd/JIJ+eN+YzOZDu2wD00Mwj4otwqwRKzU0p/0Yadug/ZcS9InDpLiV/T6/51C5HRfolaArWXwmKJxBRlk/EqYBkt51ot1q1dXEdndwp//v5d4gwLXaGjLyzA+nQwYIg0oyhw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 144.49.247.102) smtp.rcpttodomain=google.com smtp.mailfrom=flex.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject header.from=flex.com;
 dkim=none (message not signed); arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=flex.com] dkim=[1,1,header.d=flex.com]
 dmarc=[1,1,header.from=flex.com])
Received: from BN9PR03CA0771.namprd03.prod.outlook.com (2603:10b6:408:13a::26)
 by MWHPR08MB3439.namprd08.prod.outlook.com (2603:10b6:301:6c::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 24 Aug
 2022 09:25:40 +0000
Received: from BN8NAM11FT081.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13a:cafe::2d) by BN9PR03CA0771.outlook.office365.com
 (2603:10b6:408:13a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.23 via Frontend
 Transport; Wed, 24 Aug 2022 09:25:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.102)
 smtp.mailfrom=flex.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.102 as permitted sender)
 receiver=protection.outlook.com; client-ip=144.49.247.102;
 helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.102) by
 BN8NAM11FT081.mail.protection.outlook.com (10.13.177.233) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Wed, 24 Aug 2022 09:25:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMARYbjY3BoCloB6ftDp501p79V/0WSAQ+Y4SMcWoju0k6xg3AL+q2vEeuQv90KFKIJwpLzM3ulvI7mu0MQ6eRwBhK7XUJMlpFyYC0zwv4dftGP8e/96KxAA1L7zX1PfAgID9f7VmGTkZqJ1KSsf0Ou4d3G1jXZ3V1YcaL7RL4hCQ0d1KpwwMy49oUK+3VnZ7kzh7B9y3Yy6p3OPjvLrZ7efgoPSxvhalVsjs4r7Irl17kp1aY3j3lj0LR4FNjBvnyqWeTieyE8gUON8LQnOPM8lfn1pBHUHz7Mw6daIvHDS94uR8EHLgxmgJLuxUrLXhqe9eRhg8gXhGIKH5Bd5zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEuTu3JVgAmPiAuq8ieoWNFK35p4nYKsjsniP0vVIoU=;
 b=HcC4T7vFVqv2kP7w2ZENP/B2URjVyZn+iskyp9veB1MQhDE0EkljRwv5I3eHWjRTC1Zf7pr6uVWjz6dr71VEl9iGChCTSwJYaVaY1dYEkow2o6keDLPI1Yl9VvTxq4NXhSaF8E63JiDKhB0ITvntwF8Y1zu5mTBkTDOUYJ51vFbGUuSJQiq3I+mCTP69iciXQwrMC3R217srTpPe4q8R0OoEy8wcFgNoDbQkERznSVaDsnzCRZQaUA7889l2GmZXhe97JOvutjLPW4UOhlSx+PJpwUWTDgM0ISD7NwqrtT+/b3vPAyhy46UvLk+i625ERQF4S7OJ+pq0l0jaEvmPZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by BYAPR08MB4120.namprd08.prod.outlook.com (2603:10b6:a02:83::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Wed, 24 Aug
 2022 09:25:37 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::35ea:61fc:592:8a13]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::35ea:61fc:592:8a13%5]) with mapi id 15.20.5546.021; Wed, 24 Aug 2022
 09:25:37 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: Brandon Kim <brandonkim@google.com>, Jie Yang <jjy@google.com>
Subject: =?iso-2022-jp?B?GyRCMnNKJBsoQjogUmVhZCBzbWJpb3MyIGZpbGUgZmFpbGVk?=
Thread-Topic: Read smbios2 file failed
Thread-Index:  AQHXqK1mdf9fy4T4VE+gDRFV0Y9YP6uiLzQAgADn6wCAACLvAIABXVwAgAArQ4CAAFRygIAA3/6AgACQuoCAAboeN4IPxzk8gAYgB5uAAKRRgIABC9Bo
Date: Wed, 24 Aug 2022 09:25:37 +0000
Message-ID:  <DM6PR08MB5514CF4C8AEE58D295B37DA6DC739@DM6PR08MB5514.namprd08.prod.outlook.com>
References:  <CAMqwjCAaHrv0SgA_1hDEjjnX1fur6ijmCJCrn1gTPbr5Z2-ONw@mail.gmail.com>
 <d190054863c8112a66baad2f50dda7c6bdc45717.camel@yadro.com>
 <5f94cf85-6ded-3520-8ad2-592fade91e81@amperemail.onmicrosoft.com>
 <9ab79bcd06ad6b6cf574a8455247a767df8731ac.camel@yadro.com>
 <d93fc722-2a24-0921-56ee-b9968edbd6a6@amperemail.onmicrosoft.com>
 <4bda1bb5f09395003c95c645518f34828105b160.camel@yadro.com>
 <DF4PR8401MB06341BDD6521896375C0CF498FDB9@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
 <HK0PR03MB5090C26890DAF0FBB36D883CCFDC9@HK0PR03MB5090.apcprd03.prod.outlook.com>
 <9f4b694e-bfc8-59d7-dec4-5ee8f762c4f5@amperemail.onmicrosoft.com>
 <CAAcJOwv4ieTTcYm60M043iXiWiC9=KNK31Pb7jheedqhr84VLg@mail.gmail.com>
 <7528c7d5-0669-1bc8-5b82-39fad3c9f5a8@amperemail.onmicrosoft.com>
 <DM6PR08MB551466928283CBC3B3D6D68DDC6C9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <DM6PR08MB55145B920E9C7A1509BE9BE2DC709@DM6PR08MB5514.namprd08.prod.outlook.com>
 <CALGRKGPX8ehsNHGLkL=N3A=ZmqVf8tD4i1u8niRnHsnGrwgQYg@mail.gmail.com>
In-Reply-To:  <CALGRKGPX8ehsNHGLkL=N3A=ZmqVf8tD4i1u8niRnHsnGrwgQYg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=flex.com;
X-MS-Office365-Filtering-Correlation-Id: a7c297b5-89c0-4aff-5a8e-08da85b29cbe
x-ms-traffictypediagnostic: 	BYAPR08MB4120:EE_|BN8NAM11FT081:EE_|MWHPR08MB3439:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  GtH93drC7Qaco/JJefLC2Wl+H1eIcl5KTIBxzUvOrXwiYSXTzv81rshRIaPNpHdTk56Wu03yL2AkFpJC9RbTnC2SWifdL6CGkFZkSj0G2CInT832cuwOozwg8SOxMQgBFPFTRAwZI0lpnYkkGhlsC8RhiPbmCi7+MMdaTz/DZsSg+iHp5LMRin5lHMbgm/di1O5OvSs/d7uQ6I5OtRIc4zirSMrA77DcqEAi5H1tei8XxeN+tuQfHqYKg0IO9lb+ZULElASpi5sftdtPwwihf/Iblqp9+77v45S4zLo2kmloCmNGQwCOl5IMEN2/LPHQMtFqmqpldFZYbJq2jfrM9UaxVrsc09HecLQPlUFjZnX4ZWNDiKRCIu3XhZZOe8I8HfPIMw4zSCNjdwMUcXLkVwDUGjTNRBfWdgEHTcV29T1m0niQZqCSwHX4FMYWLyQ46qqXNq24lPkXi3CBaK+o1p1ki/W59e9AektrXyG7X5njGBc7WYaqdqIuVCJPPhEbNOPNr4KhIOs+SaHchAQVnXt2CWxTQCxaNcfKvbaGoKoN3zw/xCp2mMKqevqrnhgRQ3GzCnZX2VyIRI5XkKiR6gJZ5sUvi74v1bri1iZXobDb6b4tEBYHI5P/cHPHdGesVgp2cpvoDcpwcsydhyIzkhq+/czhtjyPRZHRgnsX3Y0Wa6tCY1YxKe58V9FxYa10U6VMdSkIQGBayD14uqfBcuONDFDUwblclWQzqzScncADjygnS984eSaWMistPXoV9VH72yTtrgYPG7s4EcqRgIxPZEcVILR/YsDUEW0citFxeLws0ReQtAWeWjM9p37zI4akwkmndG6gXMRQg80vmw==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR08MB5514.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(83380400001)(122000001)(86362001)(38070700005)(166002)(38100700002)(316002)(110136005)(45080400002)(5660300002)(8936002)(52536014)(76116006)(66946007)(66556008)(66446008)(66476007)(30864003)(64756008)(4326008)(41300700001)(186003)(2906002)(26005)(478600001)(71200400001)(55016003)(66574015)(6506007)(224303003)(966005)(33656002)(9686003)(7696005)(53546011);DIR:OUT;SFP:1102;
Content-Type: multipart/alternative;
	boundary="_000_DM6PR08MB5514CF4C8AEE58D295B37DA6DC739DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB4120
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  BN8NAM11FT081.eop-nam11.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	55423ee2-f63b-43fa-f027-08da85b29aca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	6akTQaoMmIfZARy8FjmQGBR8kx5uwXi7iKGz1GsVD/01qJGaAmZ/Zu8ev8DUE7TX9MzvIZAlEijDvnL1ZPZPbLK3O+UX+A+zsd/z2051UrJzI1EMkJsRNW2TJ0vVI4QwgVGOAMIaffZWmzYGCBAZzZUO/Fn4oHxtMmpLziTDla7/mSIcPRULL0WfzUqn8Rqo7iwN5Hdj/lwniGVUD4siqNz5eXfaBgduQ/2kQwzLJN9k99AgFv0xS2lToaFiSEi33+2CjbgLArwrNhwYLhRG20R4LKRJOghpHW3zYksCPhIPab/ajZrOSKBb0twcyQ0boU0uBm1QxxOOBMyn+1wjPEKjhzy4DOE115Yd2eUd3QwG/qJ2Td18zBUjSDfZ28KrR/zeN13YMYXL1Gfu+Ch7HsaUg+n8htC+pCVAKrMDOEzlA4MHABbAT6hCrpQKA+v+xI4NfZF2QLjCdF+6NDeajwghbq4iDP2XqlgW5Sbwojx8/4JGMrt/hN/wFyORaRrVJhjkkHsPP5LWTYe4j9hMoB89VpPXSuNdR9fFnEvfqJQeUlyxFzkPpvEqRZteQsVr2Qb0mQyRGj8kIbaQ8al85LdKvaY2cM2iXJA3tRuf1Qje1WL5FW+x8RfUoa8GFl25jDAhstR7ESJnhUgEZIruoBcN1v0msRR22TNdM2FYNCe0Fa7UMjjzYP1sh6lMgPQ8hP+EGErZwyIdRDa2soL6mqdkkcb2uRjSchLO80B555ejUPVW2TlvtGHysdY5thcj+Jh66nFNLEecrYkA3y5Jl3RcdPbrpX8JND0f/rDWtJWZwEA2k0ePZ3NAn2LuHrQnIU7kpqS3+4NpyXFmKAdfFm6lx9JfoSqZYuICrVILhb0pOgRFuI/MoyT7UsAsPeOx
X-Forefront-Antispam-Report: 	CIP:144.49.247.102;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.ds.dlp.protect.symantec.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(346002)(396003)(36840700001)(46966006)(40470700004)(2906002)(83380400001)(33656002)(5660300002)(224303003)(40480700001)(70586007)(70206006)(186003)(336012)(66574015)(47076005)(81166007)(52536014)(30864003)(8936002)(4326008)(316002)(55016003)(110136005)(41300700001)(53546011)(6506007)(7696005)(9686003)(26005)(40460700003)(36860700001)(45080400002)(82310400005)(966005)(478600001)(86362001)(356005)(166002)(82740400003)(36900700001)(559001)(579004);DIR:OUT;SFP:1102;
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 09:25:40.4396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c297b5-89c0-4aff-5a8e-08da85b29cbe
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e;Ip=[144.49.247.102];Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BN8NAM11FT081.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR08MB3439
X-Proofpoint-GUID: KjnJr3TGOXqmGmT3LThkd6dI77bDOpV_
X-Proofpoint-ORIG-GUID: KjnJr3TGOXqmGmT3LThkd6dI77bDOpV_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-24_04,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 adultscore=0 clxscore=1011 suspectscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208240035
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_DM6PR08MB5514CF4C8AEE58D295B37DA6DC739DM6PR08MB5514namp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi Brandon and Jie,

I think I have added "smbios-ipmi-blob" library and also updated the SRCREV=
 to the latest in the smbios-mdr_git.bbappend file.

So, I added some debug messages in the "phosphor-ipmi-blobs" and the "u-roo=
t" repos respectively. I figured out one weird thing that is the BMC-side d=
oesn't receive the "bmcBlobWrite" command, and then Host-side gets failed d=
ue to no response. Following are the messages I captured, could you help to=
 have a look at it and give some clues? Thank you.

=3D=3D=3D Host-side =3D=3D=3D
$ sudo ./smbios_transfer -num_retries 1
2022/08/24 16:40:53 Transferring SMBIOS tables, attempt 1/1
2022/08/24 16:40:53 BlobGetCount
2022/08/24 16:40:53 ctransferSmbiosData - total blobCount=3D4
2022/08/24 16:40:53 BlobEnumerate
2022/08/24 16:40:53 ctransferSmbiosData id=3D/flash/hash
2022/08/24 16:40:53 BlobEnumerate
2022/08/24 16:40:53 ctransferSmbiosData id=3D/flash/image
2022/08/24 16:40:53 BlobEnumerate
2022/08/24 16:40:53 ctransferSmbiosData id=3D/smbios
2022/08/24 16:40:53 BlobOpen
2022/08/24 16:40:53 BlobWrite
2022/08/24 16:41:03 ReceiveResponse - failed to read rawconn: i/o timeout
2022/08/24 16:41:03 BlobClose
2022/08/24 16:41:13 ReceiveResponse - failed to read rawconn: i/o timeout
2022/08/24 16:41:13 Error tranferring SMBIOS tables over IPMI: failed to wr=
ite and commit blob /smbios: IPMI BlobWrite /smbios failed: failed to read =
rawconn: i/o timeout; IPMI BlobClose /smbios failed: failed to read rawconn=
: i/o timeout
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

=3D=3D=3D BMC-side =3D=3D=3D
Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: Registering OEM:[0X00C2CF], Cmd:=
[0X80] for Blob Commands
Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries - Enter
Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/lib/bl=
ob-ipmid/libfirmwareblob.so
Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: config loaded: /flash/image
Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/lib/bl=
ob-ipmid/libsmbiosstore.so.0
Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler - createHandle=
r
Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/lib/bl=
ob-ipmid/liblogblob.so
Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/lib/bl=
ob-ipmid/libversionblob.so
Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/lib/bl=
ob-ipmid/libfirmwarecleanupblob.so
Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries - Exit
=1B$B!D=1B(B
Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=3D0
Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: Blob::getBlobCount - Enter
Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::getBlobIds - =
blobId=3D/smbios
Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: Blob::getBlobCount - Exit
Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=3D1
Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: BlobManager::getBlobId - ids=3D/=
flash/hash
Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=3D1
Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: BlobManager::getBlobId - ids=3D/=
flash/image
Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=3D1
Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: BlobManager::getBlobId - ids=3D/=
smbios
Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=3D2
Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: Blob::openBlob - Enter
Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: openBlob path=3D/smbios
Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::open - Enter
Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::open - Exit
Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: Blob::openBlob - Exit
Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=3D6
Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: Blob::closeBlob - Enter
Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::close - Enter
Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::close - Exit
Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: Blob::closeBlob - Exit
Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand (replyLength=
=3D=3D0) - Exit
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Regards,
Chris Chen
________________________________
=1B$B4s7o<T=1B(B: Brandon Kim <brandonkim@google.com>
=1B$B4s7oF|4|=1B(B: 2022=1B$BG/=1B(B8=1B$B7n=1B(B24=1B$BF|=1B(B =1B$B>e8a=
=1B(B 12:43
=1B$BZ@7o<T=1B(B: Chris Chen (TPI) <Chris.Chen3@flex.com>
=1B$BI{K\=1B(B: Jie Yang <jjy@google.com>; openbmc <openbmc@lists.ozlabs.or=
g>
=1B$B<g;]=1B(B: Re: Read smbios2 file failed

!-------------------------------------------------------------------|

  This email was sent from someone outside of Flex. Do not
  click on any links, reply or open attachments unless you
  recognize the sender and know the content is safe. If
  suspicious, report it to spamsample@flex.com.
|-------------------------------------------------------------------!

Hi Chris,

Yes, running the go program you compile and running smbios_transfer
binary as you did, should do what you expect. However, there is a
PACKAGE_CONFIG you will have to append for the ipmi-blob side of
things to work:

Please try building with the following line in your meta layer's
recipes-phosphor/smbios/smbios-mdr_%.bbappend

```
PACKAGECONFIG:append =3D " smbios-ipmi-blob"
```

Cheers,
Brandon


On Tue, Aug 23, 2022 at 12:40 AM Chris Chen (TPI) <Chris.Chen3@flex.com> wr=
ote:
>
> Hi Brandon and Jie,
>
> I would like to send the SMBIOS table from Host to BMC by using "smbios-i=
pmi-blobs" interface. And according to Jie's clue (can send the smbios tabl=
es to BMC either through LinuxBoot or host), and then I saw both of you wer=
e contributing to the "https://urldefense.com/v3/__https://github.com/u-roo=
t/u-root/blob/main/cmds/exp/smbios_transfer/smbios_transfer.go__;!!HSntlCg!=
TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcR=
TS55JUTxghw$  ". Therefore, I have some questions about this, could you hel=
p to answer them?
>
> I'm assuming that I can build "smbios_transfer" command and execute it on=
 the Host-side (with installed Ubuntu 20.04), am i correct?
>
> In fact, I'm not familiar with u-root and GO language. However, after ref=
erring to some websites to install GO and download u-root, I for now have b=
uilt the cmd out and run it on my Host. Unfortunately, the result looks lik=
e failed.
> =3D=3D=3D
> $ sudo ./smbios_transfer
> 2022/08/23 14:47:14 Transferring SMBIOS tables, attempt 1/2
> 2022/08/23 14:47:34 Error tranferring SMBIOS tables over IPMI: failed to =
write and commit blob /smbios: IPMI BlobWrite /smbios failed: failed to rea=
d rawconn: i/o timeout; IPMI BlobClose /smbios failed: failed to read rawco=
nn: i/o timeout
> 2022/08/23 14:47:34 Transferring SMBIOS tables, attempt 2/2
> 2022/08/23 14:47:54 Error tranferring SMBIOS tables over IPMI: failed to =
write and commit blob /smbios: IPMI BlobWrite /smbios failed: failed to rea=
d rawconn: i/o timeout; IPMI BlobClose /smbios failed: failed to read rawco=
nn: i/o timeout
> =3D=3D=3D
>
> Do you have any suggestions on this error?
>
> ps. I'm sure the IPMI BT interface is workable.
>
> On the BMC-side, I just need to enable smbios-mdr package, correct? or an=
ything else?
>
>
> Thanks.
>
> Regards,
> Chris Chen
>
> ________________________________
> =1B$B4s7o<T=1B(B: Chris Chen (TPI) <Chris.Chen3@flex.com>
> =1B$B4s7oF|4|=1B(B: 2022=1B$BG/=1B(B8=1B$B7n=1B(B19=1B$BF|=1B(B =1B$B2<8a=
=1B(B 05:50
> =1B$BZ@7o<T=1B(B: Thang Nguyen <thang@amperemail.onmicrosoft.com>; Jie Ya=
ng <jjy@google.com>
> =1B$BI{K\=1B(B: Garrett, Mike (HPE Server Firmware) <mike.garrett@hpe.com=
>; Andrei Kartashev <a.kartashev@yadro.com>; CS20 CHLi30 <chli30@nuvoton.co=
m>; openbmc <openbmc@lists.ozlabs.org>
> =1B$B<g;]=1B(B: =1B$B2sJ$=1B(B: Read smbios2 file failed
>
> Hello everyone,
>
> I would like to send the SMBIOS table from Host to BMC by using "smbios-i=
pmi-blobs" interface. But, after reviewing all your discussions, I still ha=
ve no idea how to enable the feature. Could you help to share more details =
with me? for example,
>
> How to generate a raw SMBIOS table with MDRv2 header? (like using "dmidec=
ode --dump-bin" and what else?)
> How do start sending SMBIOS binary file at Host-side? (As I know, the FW =
update mechanism through IPMI blob would need to build a host-tool, named b=
urn-my-bmc, on the Host and then run the tool to start image data transform=
ation. Does the "smbios-ipmi-blobs" with the same method?)
>
>
> p.s. The OS running on the Host is Ubuntu 20.04.
>
> Thanks.
>
> Regards,
> Chris Chen
>
> ________________________________
> =1B$B4s7o<T=1B(B: openbmc <openbmc-bounces+chris.chen3=3Dflex.com@lists.o=
zlabs.org> =1B$BBeI=3D=1B(B Thang Nguyen <thang@amperemail.onmicrosoft.com>
> =1B$B4s7oF|4|=1B(B: 2021=1B$BG/=1B(B9=1B$B7n=1B(B17=1B$BF|=1B(B =1B$B2<8a=
=1B(B 09:40
> =1B$BZ@7o<T=1B(B: Jie Yang <jjy@google.com>
> =1B$BI{K\=1B(B: Garrett, Mike (HPE Server Firmware) <mike.garrett@hpe.com=
>; Andrei Kartashev <a.kartashev@yadro.com>; CS20 CHLi30 <chli30@nuvoton.co=
m>; openbmc <openbmc@lists.ozlabs.org>
> =1B$B<g;]=1B(B: Re: Read smbios2 file failed
>
>
> Thanks Jia for your information
>
> On 17/09/2021 05:36, Jie Yang wrote:
>
> Hi,
>
> Actually I added an ipmi blob interface to smbios-mdr https://urldefense.=
com/v3/__https://github.com/openbmc/smbios-mdr/tree/master/src/smbios-ipmi-=
blobs__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxR=
rh5vW0XmDcRgtYvjcRTS54qpIAumA$<https://urldefense.com/v3/__https:/github.co=
m/openbmc/smbios-mdr/tree/master/src/smbios-ipmi-blobs__;!!HSntlCg!TV2b4jza=
d6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS54qpIA=
umA$>  . With this interface you can send the smbios tables to BMC either t=
hrough LinuxBoot or host. The LinuxBoot code https://urldefense.com/v3/__ht=
tps://github.com/u-root/u-root/tree/master/cmds/exp/smbios_transfer__;!!HSn=
tlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgt=
YvjcRTS54GUWKtiw$<https://urldefense.com/v3/__https:/github.com/u-root/u-ro=
ot/tree/master/cmds/exp/smbios_transfer__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTd=
Rw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS54GUWKtiw$>  . Writin=
g and committing to this blob will generate the MDR header.
>
> -Jie
>
> On Thu, Sep 16, 2021 at 4:19 AM Thang Nguyen <thang@amperemail.onmicrosof=
t.com> wrote:
>
> Thanks Tim, Mike and Andrei for very useful information. We can make it
> work by adding MDRv2 header.
>
> I am finding some information about the IPMI blobs commands. I can see
> some notes at
>
> https://urldefense.com/v3/__https://github.com/openbmc/docs/blob/master/d=
esigns/binarystore-via-blobs.md__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITI=
WTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS57DJil0FA$<https://urldefense=
.com/v3/__https:/github.com/openbmc/docs/blob/master/designs/binarystore-vi=
a-blobs.md__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xC=
sFKxRrh5vW0XmDcRgtYvjcRTS57DJil0FA$>
>
> https://urldefense.com/v3/__https://github.com/openbmc/phosphor-ipmi-blob=
s/blob/master/README.md__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5=
GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS56DlU_SCA$<https://urldefense.com/v3/=
__https:/github.com/openbmc/phosphor-ipmi-blobs/blob/master/README.md__;!!H=
SntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcR=
gtYvjcRTS56DlU_SCA$>
>
> But I have not found more description about the IPMI blob commands like
> NetFn, Func, ... that I can send a file from Host to BMC. Do you have
> any information about them?
>
>
> Thanks,
>
> Thang Q. Nguyen
>
> On 16/09/2021 09:40, CS20 CHLi30 wrote:
> > Hi Thang,
> > Did you try to use smbios_entry_point or DMI from host to BMC /var/lib/=
smbios/smbios2 for parsing?
> >
> > You can refer this sysfs-firmware-dmi-tables as below:
> >
> > The firmware provides DMI structures as a packed list of data reference=
d by a SMBIOS table entry point.
> > The SMBIOS entry point contains general information, like SMBIOS versio=
n, DMI table size, etc.
> > The structure, content and size of SMBIOS entry point is dependent on S=
MBIOS version.
> >
> > The format of SMBIOS entry point and DMI structures can be read in SMBI=
OS specification.
> > The dmi/tables provides raw SMBIOS entry point and DMI tables through s=
ysfs as an alternative to utilities reading them from /dev/mem.
> >
> > The raw SMBIOS entry point and DMI table are presented as binary attrib=
utes and are accessible via:
> > /sys/firmware/dmi/tables/smbios_entry_point
> > /sys/firmware/dmi/tables/DMI
> >
> > Best regards,
> > Tim
> >
> > -----Original Message-----
> > From: openbmc [mailto:openbmc-bounces+chli30=3Dnuvoton.com@lists.ozlabs=
.org] On Behalf Of Garrett, Mike (HPE Server Firmware)
> > Sent: Wednesday, September 15, 2021 9:19 PM
> > To: Andrei Kartashev <a.kartashev@yadro.com>; Thang Nguyen <thang@amper=
email.onmicrosoft.com>; openbmc <openbmc@lists.ozlabs.org>
> > Subject: RE: Read smbios2 file failed
> >
> > We recently did the same thing and got it working.  All you have to do =
is take the RAW smbios records blob in binary form (delivered as noted belo=
w in whatever way you choose) and prepend a specific header:  https://urlde=
fense.com/v3/__https://apc01.safelinks.protection.outlook.com/?url=3Dhttps*=
3A*2F*2Fgithub.com*2Fopenbmc*2Fsmbios-mdr*2Fblob*2F33c948a473bd273fea0cff82=
d4c99b70b7784be6*2Finclude*2Fsmbios_mdrv2.hpp*23L114&amp;data=3D04*7C01*7Cc=
hli30*40nuvoton.com*7C81a4bd29e4904bf4d84608d978510b92*7Ca3f24931d4034b4a94=
f17d83ac638e07*7C0*7C0*7C637673526954552742*7CUnknown*7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjo__;JSUlJSUlJSUlJSUlJSUlJSUlJSU!!HSntlCg!TV2b4jzad6O_WAZ=
AI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS56BTyjjfg$<ht=
tps://urldefense.com/v3/__https:/apc01.safelinks.protection.outlook.com/?ur=
l=3Dhttps*3A*2F*2Fgithub.com*2Fopenbmc*2Fsmbios-mdr*2Fblob*2F33c948a473bd27=
3fea0cff82d4c99b70b7784be6*2Finclude*2Fsmbios_mdrv2.hpp*23L114&amp;data=3D0=
4*7C01*7Cchli30*40nuvoton.com*7C81a4bd29e4904bf4d84608d978510b92*7Ca3f24931=
d4034b4a94f17d83ac638e07*7C0*7C0*7C637673526954552742*7CUnknown*7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo__;JSUlJSUlJSUlJSUlJSUlJSUlJSU!!HSntlCg!TV2b4=
jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS56B=
Tyjjfg$>   iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DoQwco=
zsSoGlgSFwztPFV3FAoPpRZGYoZ7pc0%2BxDi1MA%3D&amp;reserved=3D0
> >
> > It is a little bit fragile as it introduces a dependency on the file do=
wnload logic to write a non-standard header defined in another service that=
 could potentially change.
> >
> > Mike
> >
> >> -----Original Message-----
> >> From: openbmc <openbmc-
> >> bounces+mike.garrett=3Dhpe.com@lists.ozlabs.org> On Behalf Of Andrei
> >> Kartashev
> >> Sent: Wednesday, September 15, 2021 3:17 AM
> >> To: Thang Nguyen <thang@amperemail.onmicrosoft.com>; openbmc
> >> <openbmc@lists.ozlabs.org>
> >> Subject: Re: Read smbios2 file failed
> >>
> >> I don't know what is format of "dmidecode --dump-bin", but if it just
> >> raw dump of smbios then you only need to add mdr header.
> >>
> >> See answer for the same question here:
> >> INVALID URI REMOVED
> >> 021-July/026882.html__;!!NpxR!2w0FkPs2KyaB6XOvB8et52bWKqAMLImmL-
> >> iUk9A_zZbJ8WLhMeXdvRAp-pcxt8Q$
> >>
> >> On Wed, 2021-09-15 at 12:41 +0700, Thang Nguyen wrote:
> >>> Hi Andrei,
> >>>
> >>> I see output of "dmidecode --dump-bin" follows SMBIOS specification.
> >>> As
> >>> the data for smbios-mdr does not follow this, do you know about the
> >>> document or any information I can reference to prepare data to send
> >>> to BMC??
> >>>
> >>>
> >>> Best Regards,
> >>>
> >>> Thang Q. Nguyen
> >>>
> >>> On 14/09/2021 15:51, Andrei Kartashev wrote:
> >>>> No, it is not same as "dmidecode --dump-bin".
> >>>>
> >>>> On Tue, 2021-09-14 at 13:46 +0700, Thang Nguyen wrote:
> >>>>> On 13/09/2021 23:56, Andrei Kartashev wrote:
> >>>>>> You need to somehow deliver smbios data image to BMC. This
> >>>>>> means, your BIOS should implementat some logic to transfer
> >>>>>> this data.
> >>>>>> For BMC side see example here:
> >>>>>> https://urldefense.com/v3/__https://apc01.safelinks.protection.out=
look.com/?url=3Dhttps*3A*2__;JSU!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWT=
zC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS57ySTDXQQ$<https://urldefense.c=
om/v3/__https:/apc01.safelinks.protection.outlook.com/?url=3Dhttps*3A*2__;J=
SU!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0=
XmDcRgtYvjcRTS57ySTDXQQ$>
> >>>>>> F%2Fgithub.com%2Fopenbmc%2Fintel-ipmi-&amp;data=3D04%7C01%7Cchli
> >>>>>> 30%40nuvoton.com%7C81a4bd29e4904bf4d84608d978510b92%7Ca3f24931
> >>>>>> d4034b4a94f17d83ac638e07%7C0%7C0%7C637673526954552742%7CUnknow
> >>>>>> n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik
> >>>>>> 1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DcG6ZZzOSXkuUtcQuuoymsRdP
> >>>>>> p24mINa%2FhCy%2BYhe%2FNmk%3D&amp;reserved=3D0
> >> oem/blob/master/src/smbios
> >>>>>> mdrv2handler.cpp
> >>>>> Hi Andrei,
> >>>>>
> >>>>> What is the format of smbios data to transfer to BMC? Is it the
> >>>>> same content of "dmidecode --dump-bin" command from Host Linux?
> >> or
> >>>>> anything special in formatting the content to send?
> >>>>>
> >>>>>> On Mon, 2021-09-13 at 17:40 +0300, Alexander Raih wrote:
> >>>>>>> Hi guys, I am beginner in openbmc I build openbmc with
> >>>>>>> smbios-mdr repository and I have error:
> >>>>>>>
> >>>>>>> Read data from flash error - Open MDRV2 table file failure
> >>>>>>>
> >>>>>>> There isnt file in /var/lib/smbios/smbios2
> >>>>>>>
> >>>>>>> How I can resolve this problem?
> >>>>>>> Help me please!!!
> >>
> >> --
> >> Best regards,
> >> Andrei Kartashev
> >>
> > ________________________________
> > ________________________________
> >   The privileged confidential information contained in this email is in=
tended for use only by the addressees as indicated by the original sender o=
f this email. If you are not the addressee indicated in this email or are n=
ot responsible for delivery of the email to such a person, please kindly re=
ply to the sender indicating this fact and delete all copies of it from you=
r computer and network server immediately. Your cooperation is highly appre=
ciated. It is advised that any unauthorized use of confidential information=
 of Nuvoton is strictly prohibited; and any information in this email irrel=
evant to the official business of Nuvoton shall be deemed as neither given =
nor endorsed by Nuvoton.
>
> Legal Disclaimer :
> The information contained in this message may be privileged and confident=
ial.
> It is intended to be read only by the individual or entity to whom it is =
addressed
> or by their designee. If the reader of this message is not the intended r=
ecipient,
> you are on notice that any distribution of this message, in any form,
> is strictly prohibited. If you have received this message in error,
> please immediately notify the sender and delete or destroy any copy of th=
is message!

--_000_DM6PR08MB5514CF4C8AEE58D295B37DA6DC739DM6PR08MB5514namp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"PMingLiU",serif;
	mso-fareast-language:JA;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.elementtoproof
	{mso-style-name:elementtoproof;}
span.EmailStyle19
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:black;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">Hi Brandon and Jie,</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp;</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">I think I have added &quot;smbios-ipmi-blob&quot; librar=
y and also updated the SRCREV to the latest in the smbios-mdr_git.bbappend =
file.</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp;</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">So, I added some debug messages in the &quot;phosphor-ip=
mi-blobs&quot; and the &quot;u-root&quot; repos respectively. I figured out=
 one weird thing that is the BMC-side doesn't receive the &quot;bmcBlobWrit=
e&quot;
 command, and then Host-side gets failed due to no response. Following are =
the messages I captured, could you help to have a look at it and give some =
clues? Thank you.</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp;</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">=3D=3D=3D Host-side =3D=3D=3D</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">$ sudo ./smbios_transfer -num_retries 1
</span><o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">2022/08/24 16:40:53 Transferring SMBIOS tables, attempt =
1/1</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">2022/08/24 16:40:53
<b>BlobGetCount</b></span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">2022/08/24 16:40:53 ctransferSmbiosData - total blobCoun=
t=3D4</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">2022/08/24 16:40:53
<b>BlobEnumerate</b></span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">2022/08/24 16:40:53 ctransferSmbiosData id=3D/flash/hash=
</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">2022/08/24 16:40:53
<b>BlobEnumerate</b></span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">2022/08/24 16:40:53 ctransferSmbiosData id=3D/flash/imag=
e</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">2022/08/24 16:40:53
<b>BlobEnumerate</b></span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">2022/08/24 16:40:53 ctransferSmbiosData id=3D/smbios</sp=
an><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">2022/08/24 16:40:53
<b>BlobOpen</b></span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">2022/08/24 16:40:53
</span><b><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:#=
ED5C57">BlobWrite</span></b><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">2022/08/24 16:41:03 ReceiveResponse - failed to read raw=
conn: i/o timeout</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">2022/08/24 16:41:03
<b>BlobClose</b></span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">2022/08/24 16:41:13 ReceiveResponse - failed to read raw=
conn: i/o timeout</span><o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">2022/08/24 16:41:13 Error tranferring SMBIOS tables over=
 IPMI: failed to write and commit blob /smbios: IPMI BlobWrite /smbios fail=
ed: failed to read rawconn: i/o timeout; IPMI
 BlobClose /smbios failed: failed to read rawconn: i/o timeout</span><o:p><=
/o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span><o:p></=
o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp;</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">=3D=3D=3D BMC-side =3D=3D=3D</span><o:p=
></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:00:16 hudsonbay-obmc ipmid[19=
0]: Registering OEM:[0X00C2CF], Cmd:[0X80] for Blob Commands
</span><o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:00:16 hudsonbay-obmc ipmid[19=
0]: loadLibraries - Enter</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:00:16 hudsonbay-obmc ipmid[19=
0]: loadLibraries dlopen:/usr/lib/blob-ipmid/libfirmwareblob.so</span><o:p>=
</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:00:16 hudsonbay-obmc ipmid[19=
0]: config loaded: /flash/image</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:00:16 hudsonbay-obmc ipmid[19=
0]:
<b>loadLibraries dlopen:/usr/lib/blob-ipmid/libsmbiosstore.so.0</b></span><=
o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:00:16 hudsonbay-obmc ipmid[19=
0]: SmbiosBlobHandler - createHandler</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:00:16 hudsonbay-obmc ipmid[19=
0]: loadLibraries dlopen:/usr/lib/blob-ipmid/liblogblob.so</span><o:p></o:p=
></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:00:16 hudsonbay-obmc ipmid[19=
0]: loadLibraries dlopen:/usr/lib/blob-ipmid/libversionblob.so</span><o:p><=
/o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:00:16 hudsonbay-obmc ipmid[19=
0]: loadLibraries dlopen:/usr/lib/blob-ipmid/libfirmwarecleanupblob.so</spa=
n><o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:00:16 hudsonbay-obmc ipmid[19=
0]: loadLibraries &#8211; Exit</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">=1B$B!D=1B(B</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:25 hudsonbay-obmc ipmid[19=
0]: handleBlobCommand - Enter
</span><o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:25 hudsonbay-obmc ipmid[19=
0]: handleBlobCommand -
<b>cmd num=3D0</b></span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:25 hudsonbay-obmc ipmid[19=
0]: Blob::getBlobCount - Enter</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:25 hudsonbay-obmc ipmid[19=
0]: SmbiosBlobHandler::getBlobIds - blobId=3D/smbios</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:25 hudsonbay-obmc ipmid[19=
0]: Blob::getBlobCount - Exit</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:25 hudsonbay-obmc ipmid[19=
0]: handleBlobCommand - Exit</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white"><br>
<span class=3D"elementtoproof">Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: h=
andleBlobCommand - Enter</span></span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:25 hudsonbay-obmc ipmid[19=
0]: handleBlobCommand -
<b>cmd&nbsp;num=3D1</b></span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:25 hudsonbay-obmc ipmid[19=
0]: BlobManager::getBlobId - ids=3D/flash/hash</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:25 hudsonbay-obmc ipmid[19=
0]: handleBlobCommand - Exit</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white"><br>
<span class=3D"elementtoproof">Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: h=
andleBlobCommand - Enter</span></span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCom=
mand -
<b>cmd</b></span><b><span style=3D"font-family:&quot;Calibri&quot;,sans-ser=
if"> num=3D1</span></b><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:25 hudsonbay-obmc ipmid[19=
0]: BlobManager::getBlobId - ids=3D/flash/image</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:25 hudsonbay-obmc ipmid[19=
0]: handleBlobCommand - Exit</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white"><br>
<span class=3D"elementtoproof">Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: h=
andleBlobCommand - Enter</span></span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:25 hudsonbay-obmc ipmid[19=
0]: handleBlobCommand -
<b>cmd num=3D1</b></span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:25 hudsonbay-obmc ipmid[19=
0]: BlobManager::getBlobId - ids=3D/smbios</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:25 hudsonbay-obmc ipmid[19=
0]: handleBlobCommand - Exit</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white"><br>
<span class=3D"elementtoproof">Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: h=
andleBlobCommand - Enter</span></span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:25 hudsonbay-obmc ipmid[19=
0]: handleBlobCommand -
<b>cmd num=3D2</b></span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:25 hudsonbay-obmc ipmid[19=
0]: Blob::openBlob - Enter</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:25 hudsonbay-obmc ipmid[19=
0]: openBlob path=3D/smbios</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:25 hudsonbay-obmc ipmid[19=
0]: SmbiosBlobHandler::open - Enter</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:25 hudsonbay-obmc ipmid[19=
0]: SmbiosBlobHandler::open - Exit</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:25 hudsonbay-obmc ipmid[19=
0]: Blob::openBlob - Exit</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:25 hudsonbay-obmc ipmid[19=
0]: handleBlobCommand - Exit</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white"><br>
<span class=3D"elementtoproof">Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: h=
andleBlobCommand - Enter</span></span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:35 hudsonbay-obmc ipmid[19=
0]: handleBlobCommand -
<b>cmd num=3D6</b></span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:35 hudsonbay-obmc ipmid[19=
0]: Blob::closeBlob - Enter</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:35 hudsonbay-obmc ipmid[19=
0]: SmbiosBlobHandler::close - Enter</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:35 hudsonbay-obmc ipmid[19=
0]: SmbiosBlobHandler::close - Exit</span><o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:35 hudsonbay-obmc ipmid[19=
0]: Blob::closeBlob - Exit</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black;background:white">Jan 01 00:08:25 hudsonbay-obmc ipmid[19=
0]: handleBlobCommand (replyLength=3D=3D0) - Exit</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span><o:p></=
o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp;</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">Regards,</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">Chris Chen</span><o:p></o:p></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span lang=3D"ZH-TW" style=3D"font-size:11.0pt;co=
lor:black;mso-fareast-language:ZH-TW">=1B$B4s7o<T=1B(B</span></b><b><span s=
tyle=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:b=
lack">:</span></b><span style=3D"font-size:11.0pt;font-family:&quot;Calibri=
&quot;,sans-serif;color:black">
 Brandon Kim &lt;brandonkim@google.com&gt;<br>
</span><b><span lang=3D"ZH-TW" style=3D"font-size:11.0pt;color:black;mso-fa=
reast-language:ZH-TW">=1B$B4s7oF|4|=1B(B</span></b><b><span style=3D"font-s=
ize:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:black">:</span>=
</b><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-se=
rif;color:black">
 2022</span><span lang=3D"ZH-TW" style=3D"font-size:11.0pt;color:black;mso-=
fareast-language:ZH-TW">=1B$BG/=1B(B</span><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif;color:black">8</span><span lang=
=3D"ZH-TW" style=3D"font-size:11.0pt;color:black;mso-fareast-language:ZH-TW=
">=1B$B7n=1B(B</span><span style=3D"font-size:11.0pt;font-family:&quot;Cali=
bri&quot;,sans-serif;color:black">24</span><span lang=3D"ZH-TW" style=3D"fo=
nt-size:11.0pt;color:black;mso-fareast-language:ZH-TW">=1B$BF|=1B(B</span><=
span lang=3D"ZH-TW" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quo=
t;,sans-serif;color:black;mso-fareast-language:ZH-TW">
</span><span lang=3D"ZH-TW" style=3D"font-size:11.0pt;color:black;mso-farea=
st-language:ZH-TW">=1B$B>e8a=1B(B</span><span style=3D"font-size:11.0pt;fon=
t-family:&quot;Calibri&quot;,sans-serif;color:black"> 12:43<br>
</span><b><span lang=3D"ZH-TW" style=3D"font-size:11.0pt;color:black;mso-fa=
reast-language:ZH-TW">=1B$BZ@7o<T=1B(B</span></b><b><span style=3D"font-siz=
e:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:black">:</span></=
b><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-seri=
f;color:black">
 Chris Chen (TPI) &lt;Chris.Chen3@flex.com&gt;<br>
</span><b><span lang=3D"ZH-TW" style=3D"font-size:11.0pt;color:black;mso-fa=
reast-language:ZH-TW">=1B$BI{K\=1B(B</span></b><b><span style=3D"font-size:=
11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:black">:</span></b>=
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;=
color:black">
 Jie Yang &lt;jjy@google.com&gt;; openbmc &lt;openbmc@lists.ozlabs.org&gt;<=
br>
</span><b><span lang=3D"ZH-TW" style=3D"font-size:11.0pt;color:black;mso-fa=
reast-language:ZH-TW">=1B$B<g;]=1B(B</span></b><b><span style=3D"font-size:=
11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:black">:</span></b>=
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;=
color:black">
 Re: Read smbios2 file failed</span> <o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">!------------------=
-------------------------------------------------|<br>
<br>
&nbsp; This email was sent from someone outside of Flex. Do not<br>
&nbsp; click on any links, reply or open attachments unless you<br>
&nbsp; recognize the sender and know the content is safe. If<br>
&nbsp; suspicious, report it to spamsample@flex.com.<br>
|-------------------------------------------------------------------!<br>
<br>
Hi Chris,<br>
<br>
Yes, running the go program you compile and running smbios_transfer<br>
binary as you did, should do what you expect. However, there is a<br>
PACKAGE_CONFIG you will have to append for the ipmi-blob side of<br>
things to work:<br>
<br>
Please try building with the following line in your meta layer's<br>
recipes-phosphor/smbios/smbios-mdr_%.bbappend<br>
<br>
```<br>
PACKAGECONFIG:append =3D &quot; smbios-ipmi-blob&quot;<br>
```<br>
<br>
Cheers,<br>
Brandon<br>
<br>
<br>
On Tue, Aug 23, 2022 at 12:40 AM Chris Chen (TPI) &lt;Chris.Chen3@flex.com&=
gt; wrote:<br>
&gt;<br>
&gt; Hi Brandon and Jie,<br>
&gt;<br>
&gt; I would like to send the SMBIOS table from Host to BMC by using &quot;=
smbios-ipmi-blobs&quot; interface. And according to Jie's clue (can send th=
e smbios tables to BMC either through LinuxBoot or host), and then I saw bo=
th of you were contributing to the &quot;https://urldefense.com/v3/__https:=
//github.com/u-root/u-root/blob/main/cmds/exp/smbios_transfer/smbios_transf=
er.go__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxR=
rh5vW0XmDcRgtYvjcRTS55JUTxghw$&nbsp;
 &quot;. Therefore, I have some questions about this, could you help to ans=
wer them?<br>
&gt;<br>
&gt; I'm assuming that I can build &quot;smbios_transfer&quot; command and =
execute it on the Host-side (with installed Ubuntu 20.04), am i correct?<br=
>
&gt;<br>
&gt; In fact, I'm not familiar with u-root and GO language. However, after =
referring to some websites to install GO and download u-root, I for now hav=
e built the cmd out and run it on my Host. Unfortunately, the result looks =
like failed.<br>
&gt; =3D=3D=3D<br>
&gt; $ sudo ./smbios_transfer<br>
&gt; 2022/08/23 14:47:14 Transferring SMBIOS tables, attempt 1/2<br>
&gt; 2022/08/23 14:47:34 Error tranferring SMBIOS tables over IPMI: failed =
to write and commit blob /smbios: IPMI BlobWrite /smbios failed: failed to =
read rawconn: i/o timeout; IPMI BlobClose /smbios failed: failed to read ra=
wconn: i/o timeout<br>
&gt; 2022/08/23 14:47:34 Transferring SMBIOS tables, attempt 2/2<br>
&gt; 2022/08/23 14:47:54 Error tranferring SMBIOS tables over IPMI: failed =
to write and commit blob /smbios: IPMI BlobWrite /smbios failed: failed to =
read rawconn: i/o timeout; IPMI BlobClose /smbios failed: failed to read ra=
wconn: i/o timeout<br>
&gt; =3D=3D=3D<br>
&gt;<br>
&gt; Do you have any suggestions on this error?<br>
&gt;<br>
&gt; ps. I'm sure the IPMI BT interface is workable.<br>
&gt;<br>
&gt; On the BMC-side, I just need to enable smbios-mdr package, correct? or=
 anything else?<br>
&gt;<br>
&gt;<br>
&gt; Thanks.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Chris Chen<br>
&gt;<br>
&gt; ________________________________<br>
&gt; </span><span lang=3D"ZH-TW" style=3D"font-size:11.0pt;mso-fareast-lang=
uage:ZH-TW">=1B$B4s7o<T=1B(B</span><span style=3D"font-size:11.0pt">: Chris=
 Chen (TPI) &lt;Chris.Chen3@flex.com&gt;<br>
&gt; </span><span lang=3D"ZH-TW" style=3D"font-size:11.0pt;mso-fareast-lang=
uage:ZH-TW">=1B$B4s7oF|4|=1B(B</span><span style=3D"font-size:11.0pt">: 202=
2</span><span lang=3D"ZH-TW" style=3D"font-size:11.0pt;mso-fareast-language=
:ZH-TW">=1B$BG/=1B(B</span><span style=3D"font-size:11.0pt">8</span><span l=
ang=3D"ZH-TW" style=3D"font-size:11.0pt;mso-fareast-language:ZH-TW">=1B$B7n=
=1B(B</span><span style=3D"font-size:11.0pt">19</span><span lang=3D"ZH-TW" =
style=3D"font-size:11.0pt;mso-fareast-language:ZH-TW">=1B$BF|=1B(B
 =1B$B2<8a=1B(B</span><span style=3D"font-size:11.0pt"> 05:50<br>
&gt; </span><span lang=3D"ZH-TW" style=3D"font-size:11.0pt;mso-fareast-lang=
uage:ZH-TW">=1B$BZ@7o<T=1B(B</span><span style=3D"font-size:11.0pt">: Thang=
 Nguyen &lt;thang@amperemail.onmicrosoft.com&gt;; Jie Yang &lt;jjy@google.c=
om&gt;<br>
&gt; </span><span lang=3D"ZH-TW" style=3D"font-size:11.0pt;mso-fareast-lang=
uage:ZH-TW">=1B$BI{K\=1B(B</span><span style=3D"font-size:11.0pt">: Garrett=
, Mike (HPE Server Firmware) &lt;mike.garrett@hpe.com&gt;; Andrei Kartashev=
 &lt;a.kartashev@yadro.com&gt;; CS20 CHLi30 &lt;chli30@nuvoton.com&gt;;
 openbmc &lt;openbmc@lists.ozlabs.org&gt;<br>
&gt; </span><span lang=3D"ZH-TW" style=3D"font-size:11.0pt;mso-fareast-lang=
uage:ZH-TW">=1B$B<g;]=1B(B</span><span style=3D"font-size:11.0pt">:
</span><span lang=3D"ZH-TW" style=3D"font-size:11.0pt;mso-fareast-language:=
ZH-TW">=1B$B2sJ$=1B(B</span><span style=3D"font-size:11.0pt">: Read smbios2=
 file failed<br>
&gt;<br>
&gt; Hello everyone,<br>
&gt;<br>
&gt; I would like to send the SMBIOS table from Host to BMC by using &quot;=
smbios-ipmi-blobs&quot; interface. But, after reviewing all your discussion=
s, I still have no idea how to enable the feature. Could you help to share =
more details with me? for example,<br>
&gt;<br>
&gt; How to generate a raw SMBIOS table with MDRv2 header? (like using &quo=
t;dmidecode --dump-bin&quot; and what else?)<br>
&gt; How do start sending SMBIOS binary file at Host-side? (As I know, the =
FW update mechanism through IPMI blob would need to build a host-tool, name=
d burn-my-bmc, on the Host and then run the tool to start image data transf=
ormation. Does the &quot;smbios-ipmi-blobs&quot;
 with the same method?)<br>
&gt;<br>
&gt;<br>
&gt; p.s. The OS running on the Host is Ubuntu 20.04.<br>
&gt;<br>
&gt; Thanks.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Chris Chen<br>
&gt;<br>
&gt; ________________________________<br>
&gt; </span><span lang=3D"ZH-TW" style=3D"font-size:11.0pt;mso-fareast-lang=
uage:ZH-TW">=1B$B4s7o<T=1B(B</span><span style=3D"font-size:11.0pt">: openb=
mc &lt;openbmc-bounces+chris.chen3=3Dflex.com@lists.ozlabs.org&gt;
</span><span lang=3D"ZH-TW" style=3D"font-size:11.0pt;mso-fareast-language:=
ZH-TW">=1B$BBeI=3D=1B(B</span><span style=3D"font-size:11.0pt"> Thang Nguye=
n &lt;thang@amperemail.onmicrosoft.com&gt;<br>
&gt; </span><span lang=3D"ZH-TW" style=3D"font-size:11.0pt;mso-fareast-lang=
uage:ZH-TW">=1B$B4s7oF|4|=1B(B</span><span style=3D"font-size:11.0pt">: 202=
1</span><span lang=3D"ZH-TW" style=3D"font-size:11.0pt;mso-fareast-language=
:ZH-TW">=1B$BG/=1B(B</span><span style=3D"font-size:11.0pt">9</span><span l=
ang=3D"ZH-TW" style=3D"font-size:11.0pt;mso-fareast-language:ZH-TW">=1B$B7n=
=1B(B</span><span style=3D"font-size:11.0pt">17</span><span lang=3D"ZH-TW" =
style=3D"font-size:11.0pt;mso-fareast-language:ZH-TW">=1B$BF|=1B(B
 =1B$B2<8a=1B(B</span><span style=3D"font-size:11.0pt"> 09:40<br>
&gt; </span><span lang=3D"ZH-TW" style=3D"font-size:11.0pt;mso-fareast-lang=
uage:ZH-TW">=1B$BZ@7o<T=1B(B</span><span style=3D"font-size:11.0pt">: Jie Y=
ang &lt;jjy@google.com&gt;<br>
&gt; </span><span lang=3D"ZH-TW" style=3D"font-size:11.0pt;mso-fareast-lang=
uage:ZH-TW">=1B$BI{K\=1B(B</span><span style=3D"font-size:11.0pt">: Garrett=
, Mike (HPE Server Firmware) &lt;mike.garrett@hpe.com&gt;; Andrei Kartashev=
 &lt;a.kartashev@yadro.com&gt;; CS20 CHLi30 &lt;chli30@nuvoton.com&gt;;
 openbmc &lt;openbmc@lists.ozlabs.org&gt;<br>
&gt; </span><span lang=3D"ZH-TW" style=3D"font-size:11.0pt;mso-fareast-lang=
uage:ZH-TW">=1B$B<g;]=1B(B</span><span style=3D"font-size:11.0pt">: Re: Rea=
d smbios2 file failed<br>
&gt;<br>
&gt;<br>
&gt; Thanks Jia for your information<br>
&gt;<br>
&gt; On 17/09/2021 05:36, Jie Yang wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; Actually I added an ipmi blob interface to smbios-mdr <a href=3D"https=
://urldefense.com/v3/__https:/github.com/openbmc/smbios-mdr/tree/master/src=
/smbios-ipmi-blobs__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7=
DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS54qpIAumA$">
https://urldefense.com/v3/__https://github.com/openbmc/smbios-mdr/tree/mast=
er/src/smbios-ipmi-blobs__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn=
5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS54qpIAumA$</a>&nbsp; . With this int=
erface you can send the smbios tables
 to BMC either through LinuxBoot or host. The LinuxBoot code <a href=3D"htt=
ps://urldefense.com/v3/__https:/github.com/u-root/u-root/tree/master/cmds/e=
xp/smbios_transfer__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7=
DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS54GUWKtiw$">
https://urldefense.com/v3/__https://github.com/u-root/u-root/tree/master/cm=
ds/exp/smbios_transfer__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5G=
NRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS54GUWKtiw$</a>&nbsp; . Writing and com=
mitting to this blob will generate the
 MDR header.<br>
&gt;<br>
&gt; -Jie<br>
&gt;<br>
&gt; On Thu, Sep 16, 2021 at 4:19 AM Thang Nguyen &lt;thang@amperemail.onmi=
crosoft.com&gt; wrote:<br>
&gt;<br>
&gt; Thanks Tim, Mike and Andrei for very useful information. We can make i=
t<br>
&gt; work by adding MDRv2 header.<br>
&gt;<br>
&gt; I am finding some information about the IPMI blobs commands. I can see=
<br>
&gt; some notes at<br>
&gt;<br>
&gt; <a href=3D"https://urldefense.com/v3/__https:/github.com/openbmc/docs/=
blob/master/designs/binarystore-via-blobs.md__;!!HSntlCg!TV2b4jzad6O_WAZAI1=
wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS57DJil0FA$">
https://urldefense.com/v3/__https://github.com/openbmc/docs/blob/master/des=
igns/binarystore-via-blobs.md__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWT=
zC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS57DJil0FA$</a>&nbsp;
<br>
&gt;<br>
&gt; <a href=3D"https://urldefense.com/v3/__https:/github.com/openbmc/phosp=
hor-ipmi-blobs/blob/master/README.md__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8=
KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS56DlU_SCA$">
https://urldefense.com/v3/__https://github.com/openbmc/phosphor-ipmi-blobs/=
blob/master/README.md__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GN=
RJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS56DlU_SCA$</a>&nbsp;
<br>
&gt;<br>
&gt; But I have not found more description about the IPMI blob commands lik=
e<br>
&gt; NetFn, Func, ... that I can send a file from Host to BMC. Do you have<=
br>
&gt; any information about them?<br>
&gt;<br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt; Thang Q. Nguyen<br>
&gt;<br>
&gt; On 16/09/2021 09:40, CS20 CHLi30 wrote:<br>
&gt; &gt; Hi Thang,<br>
&gt; &gt; Did you try to use smbios_entry_point or DMI from host to BMC /va=
r/lib/smbios/smbios2 for parsing?<br>
&gt; &gt;<br>
&gt; &gt; You can refer this sysfs-firmware-dmi-tables as below:<br>
&gt; &gt;<br>
&gt; &gt; The firmware provides DMI structures as a packed list of data ref=
erenced by a SMBIOS table entry point.<br>
&gt; &gt; The SMBIOS entry point contains general information, like SMBIOS =
version, DMI table size, etc.<br>
&gt; &gt; The structure, content and size of SMBIOS entry point is dependen=
t on SMBIOS version.<br>
&gt; &gt;<br>
&gt; &gt; The format of SMBIOS entry point and DMI structures can be read i=
n SMBIOS specification.<br>
&gt; &gt; The dmi/tables provides raw SMBIOS entry point and DMI tables thr=
ough sysfs as an alternative to utilities reading them from /dev/mem.<br>
&gt; &gt;<br>
&gt; &gt; The raw SMBIOS entry point and DMI table are presented as binary =
attributes and are accessible via:<br>
&gt; &gt; /sys/firmware/dmi/tables/smbios_entry_point<br>
&gt; &gt; /sys/firmware/dmi/tables/DMI<br>
&gt; &gt;<br>
&gt; &gt; Best regards,<br>
&gt; &gt; Tim<br>
&gt; &gt;<br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: openbmc [<a href=3D"mailto:openbmc-bounces+chli30=3Dnuvoton=
.com@lists.ozlabs.org">mailto:openbmc-bounces+chli30=3Dnuvoton.com@lists.oz=
labs.org</a>] On Behalf Of Garrett, Mike (HPE Server Firmware)<br>
&gt; &gt; Sent: Wednesday, September 15, 2021 9:19 PM<br>
&gt; &gt; To: Andrei Kartashev &lt;a.kartashev@yadro.com&gt;; Thang Nguyen =
&lt;thang@amperemail.onmicrosoft.com&gt;; openbmc &lt;openbmc@lists.ozlabs.=
org&gt;<br>
&gt; &gt; Subject: RE: Read smbios2 file failed<br>
&gt; &gt;<br>
&gt; &gt; We recently did the same thing and got it working.&nbsp; All you =
have to do is take the RAW smbios records blob in binary form (delivered as=
 noted below in whatever way you choose) and prepend a specific header:&nbs=
p;
<a href=3D"https://urldefense.com/v3/__https:/apc01.safelinks.protection.ou=
tlook.com/?url=3Dhttps*3A*2F*2Fgithub.com*2Fopenbmc*2Fsmbios-mdr*2Fblob*2F3=
3c948a473bd273fea0cff82d4c99b70b7784be6*2Finclude*2Fsmbios_mdrv2.hpp*23L114=
&amp;amp;data=3D04*7C01*7Cchli30*40nuvoton.com*7C81a4bd29e4904bf4d84608d978=
510b92*7Ca3f24931d4034b4a94f17d83ac638e07*7C0*7C0*7C637673526954552742*7CUn=
known*7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo__;JSUlJSUlJSUlJSUlJSUlJSUlJ=
SU!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0=
XmDcRgtYvjcRTS56BTyjjfg$">
https://urldefense.com/v3/__https://apc01.safelinks.protection.outlook.com/=
?url=3Dhttps*3A*2F*2Fgithub.com*2Fopenbmc*2Fsmbios-mdr*2Fblob*2F33c948a473b=
d273fea0cff82d4c99b70b7784be6*2Finclude*2Fsmbios_mdrv2.hpp*23L114&amp;amp;d=
ata=3D04*7C01*7Cchli30*40nuvoton.com*7C81a4bd29e4904bf4d84608d978510b92*7Ca=
3f24931d4034b4a94f17d83ac638e07*7C0*7C0*7C637673526954552742*7CUnknown*7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo__;JSUlJSUlJSUlJSUlJSUlJSUlJSU!!HSntlC=
g!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvj=
cRTS56BTyjjfg$</a>&nbsp;&nbsp;
 iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DoQwcozsSoGl=
gSFwztPFV3FAoPpRZGYoZ7pc0%2BxDi1MA%3D&amp;amp;reserved=3D0<br>
&gt; &gt;<br>
&gt; &gt; It is a little bit fragile as it introduces a dependency on the f=
ile download logic to write a non-standard header defined in another servic=
e that could potentially change.<br>
&gt; &gt;<br>
&gt; &gt; Mike<br>
&gt; &gt;<br>
&gt; &gt;&gt; -----Original Message-----<br>
&gt; &gt;&gt; From: openbmc &lt;openbmc-<br>
&gt; &gt;&gt; bounces+mike.garrett=3Dhpe.com@lists.ozlabs.org&gt; On Behalf=
 Of Andrei<br>
&gt; &gt;&gt; Kartashev<br>
&gt; &gt;&gt; Sent: Wednesday, September 15, 2021 3:17 AM<br>
&gt; &gt;&gt; To: Thang Nguyen &lt;thang@amperemail.onmicrosoft.com&gt;; op=
enbmc<br>
&gt; &gt;&gt; &lt;openbmc@lists.ozlabs.org&gt;<br>
&gt; &gt;&gt; Subject: Re: Read smbios2 file failed<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I don't know what is format of &quot;dmidecode --dump-bin&quo=
t;, but if it just<br>
&gt; &gt;&gt; raw dump of smbios then you only need to add mdr header.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; See answer for the same question here:<br>
&gt; &gt;&gt; INVALID URI REMOVED<br>
&gt; &gt;&gt; 021-July/026882.html__;!!NpxR!2w0FkPs2KyaB6XOvB8et52bWKqAMLIm=
mL-<br>
&gt; &gt;&gt; iUk9A_zZbJ8WLhMeXdvRAp-pcxt8Q$<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Wed, 2021-09-15 at 12:41 +0700, Thang Nguyen wrote:<br>
&gt; &gt;&gt;&gt; Hi Andrei,<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; I see output of &quot;dmidecode --dump-bin&quot; follows =
SMBIOS specification.<br>
&gt; &gt;&gt;&gt; As<br>
&gt; &gt;&gt;&gt; the data for smbios-mdr does not follow this, do you know=
 about the<br>
&gt; &gt;&gt;&gt; document or any information I can reference to prepare da=
ta to send<br>
&gt; &gt;&gt;&gt; to BMC??<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Best Regards,<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Thang Q. Nguyen<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; On 14/09/2021 15:51, Andrei Kartashev wrote:<br>
&gt; &gt;&gt;&gt;&gt; No, it is not same as &quot;dmidecode --dump-bin&quot=
;.<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; On Tue, 2021-09-14 at 13:46 +0700, Thang Nguyen wrote=
:<br>
&gt; &gt;&gt;&gt;&gt;&gt; On 13/09/2021 23:56, Andrei Kartashev wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; You need to somehow deliver smbios data image=
 to BMC. This<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; means, your BIOS should implementat some logi=
c to transfer<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; this data.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; For BMC side see example here:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://urldefense.com/v3/__https:=
/apc01.safelinks.protection.outlook.com/?url=3Dhttps*3A*2__;JSU!!HSntlCg!TV=
2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS=
57ySTDXQQ$">
https://urldefense.com/v3/__https://apc01.safelinks.protection.outlook.com/=
?url=3Dhttps*3A*2__;JSU!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNR=
J7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS57ySTDXQQ$</a>&nbsp;
<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; F%2Fgithub.com%2Fopenbmc%2Fintel-ipmi-&amp;am=
p;data=3D04%7C01%7Cchli<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; 30%40nuvoton.com%7C81a4bd29e4904bf4d84608d978=
510b92%7Ca3f24931<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; d4034b4a94f17d83ac638e07%7C0%7C0%7C6376735269=
54552742%7CUnknow<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV=
2luMzIiLCJBTiI6Ik<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; 1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3Dc=
G6ZZzOSXkuUtcQuuoymsRdP<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; p24mINa%2FhCy%2BYhe%2FNmk%3D&amp;amp;reserved=
=3D0<br>
&gt; &gt;&gt; oem/blob/master/src/smbios<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; mdrv2handler.cpp<br>
&gt; &gt;&gt;&gt;&gt;&gt; Hi Andrei,<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; What is the format of smbios data to transfer to =
BMC? Is it the<br>
&gt; &gt;&gt;&gt;&gt;&gt; same content of &quot;dmidecode --dump-bin&quot; =
command from Host Linux?<br>
&gt; &gt;&gt; or<br>
&gt; &gt;&gt;&gt;&gt;&gt; anything special in formatting the content to sen=
d?<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; On Mon, 2021-09-13 at 17:40 +0300, Alexander =
Raih wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; Hi guys, I am beginner in openbmc I build=
 openbmc with<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; smbios-mdr repository and I have error:<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; Read data from flash error - Open MDRV2 t=
able file failure<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; There isnt file in /var/lib/smbios/smbios=
2<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; How I can resolve this problem?<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; Help me please!!!<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; Best regards,<br>
&gt; &gt;&gt; Andrei Kartashev<br>
&gt; &gt;&gt;<br>
&gt; &gt; ________________________________<br>
&gt; &gt; ________________________________<br>
&gt; &gt;&nbsp;&nbsp; The privileged confidential information contained in =
this email is intended for use only by the addressees as indicated by the o=
riginal sender of this email. If you are not the addressee indicated in thi=
s email or are not responsible for delivery of the
 email to such a person, please kindly reply to the sender indicating this =
fact and delete all copies of it from your computer and network server imme=
diately. Your cooperation is highly appreciated. It is advised that any una=
uthorized use of confidential information
 of Nuvoton is strictly prohibited; and any information in this email irrel=
evant to the official business of Nuvoton shall be deemed as neither given =
nor endorsed by Nuvoton.<br>
&gt;<br>
&gt; Legal Disclaimer :<br>
&gt; The information contained in this message may be privileged and confid=
ential.<br>
&gt; It is intended to be read only by the individual or entity to whom it =
is addressed<br>
&gt; or by their designee. If the reader of this message is not the intende=
d recipient,<br>
&gt; you are on notice that any distribution of this message, in any form,<=
br>
&gt; is strictly prohibited. If you have received this message in error,<br=
>
&gt; please immediately notify the sender and delete or destroy any copy of=
 this message!</span><o:p></o:p></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_DM6PR08MB5514CF4C8AEE58D295B37DA6DC739DM6PR08MB5514namp_--
