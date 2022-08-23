Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1313459D266
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 09:40:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBh3b06VZz3bmP
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 17:40:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=cYh7t7Ph;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex.com (client-ip=185.183.28.62; helo=mx08-002d6701.pphosted.com; envelope-from=prvs=4234756f6c=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=cYh7t7Ph;
	dkim-atps=neutral
Received: from mx08-002d6701.pphosted.com (mx08-002d6701.pphosted.com [185.183.28.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBh300sRyz2xrD
	for <openbmc@lists.ozlabs.org>; Tue, 23 Aug 2022 17:40:10 +1000 (AEST)
Received: from pps.filterd (m0211473.ppops.net [127.0.0.1])
	by mx08-002d6701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27N6pud5030576;
	Tue, 23 Aug 2022 07:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=dkim; bh=6zIIFTfJ8+jDu+DyXTj2EZuUYzq8HXq6XJBQzFOMaFo=;
 b=cYh7t7PhXGBVynpR0HiTYuezGMi8yB8pmXLRfeQB1JDd3dI2ezerWgh0avjIMy9F+ITM
 stgHMe2wRAzgzRtDTYemK7tsSrWpzsILVH2sOA22HjaQEbAuPpuBrsAzSbmYQqy9+zY8
 sf20Cnz8k+iGLvoGHNrO4EbEnOktEjlvtiHLG5khCTirs3NKuFqPMlCus8f+pYsTbXJc
 HvuFp6d45OLnLdxBEM/d5TlAsMe69Se5eevhBmzNMVSFAH72BVohG9Pq4qXC/x5ehHym
 OmZPKCpDve1q6kRUkz3x5Ml+29ubBkMYFWw+JVrI4aiCdxs54MnXMELDze1R821ZGr0/ Hw== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx08-002d6701.pphosted.com (PPS) with ESMTPS id 3j4t0689jj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Aug 2022 07:40:02 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gzgtCl9F5qEW4EcC94UHSDwtORzsb5IT2dfwHV9Fb36Pfan2YCByxJu3mZsBF63vjCDvNzQ0AqjDRgHQXOI1lBGRk2SZw1llPQtn+UixtoHK/v9qyxS7AHYWlA1OjtpXdomlthVF20hQdyeoRE5R3tIAiTcLdqR2TdgcILCWv2aXLFsYbVXzEtMM/uzWeE56Z/e/j8nwEWkaBFSrYMYqAzdvmWXjvpornlI/DSaPTkYftgQoPu9y6gJfcOvE3AddQihYuVpUy+v01cyPQEK7cYT/TLeYRxruywQo/aiqNpgQXLZgUWpWDDdQHS6Djw4RNjjTdiuh3fcw8oxHPcyjfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpk87BuR+YZY5e+KOzcujLieVDe6nbaPvcj4JVSdwT0=;
 b=R7MrpW1vWMb6GjyWdojTl5eq+Sk6xI24SmBJmW/PXfmXlRF0swXXfL9RbbrgrAqruOBYnLEOkhBo1Vr3LNctMmCQMAvXtWWz6+qBX80sMZ+f/C+NbNh5xU1FF9lPMrF43dHzK2vQjQbK7Bru/QR1WV5CuM71tn5uI7Bl3H28nVWXJfFj+X0slpmHRS7O/4bTvNZ89DeOSQ9KNDtNbtMcR3YlJ9/HoZ70wgGOIhzRbsbhULITR05eZ0uCGfGHpBKHdGxTDG8qTZb1xw6FZYRG6P4j8pkE04vNAsETfXWQJ9khfNA4nBBxNG2zLEMopXWfBJXl2bmGs6eFbxKswbSqXA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 144.49.247.29) smtp.rcpttodomain=google.com smtp.mailfrom=flex.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject header.from=flex.com;
 dkim=none (message not signed); arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=flex.com] dkim=[1,1,header.d=flex.com]
 dmarc=[1,1,header.from=flex.com])
Received: from BN9PR03CA0082.namprd03.prod.outlook.com (2603:10b6:408:fc::27)
 by BYAPR08MB5557.namprd08.prod.outlook.com (2603:10b6:a03:c7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.19; Tue, 23 Aug
 2022 07:39:56 +0000
Received: from BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::31) by BN9PR03CA0082.outlook.office365.com
 (2603:10b6:408:fc::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.20 via Frontend
 Transport; Tue, 23 Aug 2022 07:39:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.29)
 smtp.mailfrom=flex.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.29 as permitted sender) receiver=protection.outlook.com;
 client-ip=144.49.247.29; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.29) by
 BN8NAM11FT020.mail.protection.outlook.com (10.13.176.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Tue, 23 Aug 2022 07:39:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VtdP5h8lGBSEJ0QRMzBK/DyPi7tCa/JkYw8HO+iQzX4xQqMGfmA5A7nr5c9AN1rt97xqWDqp6U8f/K4HvZNuNXzlXShTPNUe67MYDIwLSJjTnCp3n1NcnNS1u33ig7C4J02/oGrvSCXRr546V0uTQViiuo2U8XFS/e5CjXD4oHAu5qJZHkggVLirDPYnYiHguKs9ZVGEfdfqi+WGSCFki2KvaWcHL1bv5M4qTGATtS+TKkFJD/CKV+v5K6uDlA8yr9MwmNLPAY0b/DtccJPJ1AvJmS9KIWAiarHXh26DyelkM6OaGJMlNUheHa9OZd0iQyhUgLJXuuq8cYVPacRZaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpk87BuR+YZY5e+KOzcujLieVDe6nbaPvcj4JVSdwT0=;
 b=QiTYfxM43D3Gu1tZayWFe5xeZ7Pn6Z6vG24bIEdWazUMkKVV4/7ZbHODB4iaXPj7gSmTqKChfQW0KKObJEl7xHp98HQE4W2B/eol1/6PaJunZG5qLUtVdnKlqIaNqgiAiW9YgMfReEU1ZCerkExlLWBuZ3CqC0yHbjp/9gGA+rl6Z817+58lzFxyzGiPmib4kt0xhFZ+R0mPGtidoLUAWm6Pa/obgABZ9gkEXwt+5lSZWyALvwjfeXj3awpdW5g9KZHqNQe19pdp27TPnfYI4FJuFEWTPiVFR2pXPIq6GCGA1hLkpyQ9FJpMSdeOzadDzf4SN6x3lqLLzlH0zw3dbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by BN6PR08MB3364.namprd08.prod.outlook.com (2603:10b6:405:66::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Tue, 23 Aug
 2022 07:38:52 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::35ea:61fc:592:8a13]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::35ea:61fc:592:8a13%5]) with mapi id 15.20.5546.021; Tue, 23 Aug 2022
 07:38:52 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: Brandon Kim <brandonkim@google.com>, Jie Yang <jjy@google.com>
Subject: =?big5?B?pl7C0DogUmVhZCBzbWJpb3MyIGZpbGUgZmFpbGVk?=
Thread-Topic: Read smbios2 file failed
Thread-Index:  AQHXqK1mdf9fy4T4VE+gDRFV0Y9YP6uiLzQAgADn6wCAACLvAIABXVwAgAArQ4CAAFRygIAA3/6AgACQuoCAAboeN4IPxzk8gAYgB5s=
Date: Tue, 23 Aug 2022 07:38:52 +0000
Message-ID:  <DM6PR08MB55145B920E9C7A1509BE9BE2DC709@DM6PR08MB5514.namprd08.prod.outlook.com>
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
In-Reply-To:  <DM6PR08MB551466928283CBC3B3D6D68DDC6C9@DM6PR08MB5514.namprd08.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=flex.com;
X-MS-Office365-Filtering-Correlation-Id: 45b8803b-2322-44ac-5d4c-08da84daacd2
x-ms-traffictypediagnostic: 	BN6PR08MB3364:EE_|BN8NAM11FT020:EE_|BYAPR08MB5557:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  t3+POvUl7Mq1o6zXPkPqgdu4wfKibmBHL0aEJJwsGTh58Tl+XgPbR80IZ99+jW2Y67MHxf9vVWAlICqgPrtoz/GiaX8SoF6KYewZUNnM4n9D4JeSqBSm4+wNpvYwKwOJVGcOC9M7gxLXUrsjVmGA2ZzENkbZdYtsoL4g+a9LmIpBbFHiGWx+AyQx412fQBYneLwB/OtnlxdN5s9puYc9UtvFA/vgOFdK3hRVInB3moQEPzZNat0GOvtuInSbMcdhzFksQu/zfd5gkGe2RcJz9ATeZBiaj/aLupkz97RLTrUdyy2EqCrfmCRMPPGP3x1PhIQaWQuGLJdJqfNr6Eh5oFU2Bd1famtHoW3EFsgbHDUzu0Kb5hAjLl32TnWvBCmqUEPE6YeCTAx5qU9Hzfax0oP4iV/6/YDWqAG13IW6L8ke+cu9PI64fbAYUXt+S5UzaIxsxXwmXmc14gCwSOB0RcKOKDM7by10SuaEttJEWZkz1DsaLO7VdwQfGNGXSs/oQru31opLA58qWojwn8jszB/wJY2uiOK0yzkxPCHyLGVg3ZaC/d5Mh40aoui9iz6stjQC9I71XmIxNSO51Ddy4opvRfA6GyDL7gq1HyTPXOYb5HqVwQ9Apbgq8E5YHny2t2DlIimNExbK4nUi/d69j8LyEINyMh7mXJbf2pJdlBJuxJ5HHtfR2wqLkIBIlBLlZiAeeKUOooUTVWrpMuVIZNnrIgBao9WDvmsb2YwZMAUOBaubG8GGLeHuXVlU94C8Nkt1mFKuQtChpSleb+N+d5iBxo6Z26TAKqnG4PRtyEv8Jn5l5A94xRwir436rrlnHFdrR+NfzArCm/kIoc426Q==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR08MB5514.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(166002)(966005)(41300700001)(52536014)(122000001)(478600001)(7696005)(9686003)(6506007)(53546011)(186003)(38100700002)(33656002)(5660300002)(4326008)(66476007)(224303003)(66574015)(66446008)(2906002)(64756008)(8936002)(19627405001)(45080400002)(76116006)(55016003)(86362001)(66556008)(66946007)(91956017)(83380400001)(316002)(38070700005)(71200400001)(110136005);DIR:OUT;SFP:1102;
Content-Type: multipart/alternative;
	boundary="_000_DM6PR08MB55145B920E9C7A1509BE9BE2DC709DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR08MB3364
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	f7a47d3c-99e3-4768-6cc9-08da84da86d5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	LyPHByIQMRno4mcDHZqPgIo30zXCC5uAn4bA9RHyGyNAmCunkeU2lAulo6LA0vjm9iUyJSra67ujSLaZijVskMdbUcdVd/vPvg4C3diQhjaTEUaP3T7xq5IH8eAFo9/7WKqdnFX+XChCxbf/3aMoMqPt0tcLKS1AM+vNTKl4VifTq0txV3fkcJtXQPeMKadlk4r5awl9CKBN2npVEcd78G/VxbUKdK9ypSsSVFzL5kCVE6im8Qw53lb/Qes0k2X1bW2142NZctQOYY0GyIh4qV1ETqsBA2nl7usjUg/fUFi/PQ5joPyONxAAIS8N4yZZyK0t5owxTFaMJMUDOUSEdJb4RsG6vMvzyGNCFOGDEk4fzYx6PSfPH8zNhGxZKZ8MP3bnTr1HbgJ6YWUE5eLfWVVW8PTr3NcFQJwcrgtrCzFSlJkuhPAwLbvam7VDam/Z6paF+8wooD52aOZ26W4OOUzsuuL3oLw999wHneOQsXAeSwaK/gciTjg9apv61LZm0m+UNsYymWlqB8Hl912Q0pk7NdcSnysg1a/bKNXjGaAyZeGzRFBqQsoUmBF0nS6owu1jsfVUn+lo2m+aSL1Z1+548hlHIG6naqrIk59fFohjSopQmTVJmrg1w2krZsRx0PCOpvY89xEi64ME8TyJ6XMxZvmOu8sPoB+fTgcbCEXpa+sDfZsVBEFElhcOtP/znaF6ExcNX2fFBAaFq8UIiEdZ9znKVb+tzsQzE+8yeNk16P1HM+K0AmoOJuImS53HyTgncBCrdFSixu2+g/RYk+akZVR1ImO78d+xDeltsgkoiIXQw57f/DZ8pjpk40+ZibPaOcWguUXJhUTmzuG2QafFWITueLgfj7TBXeBMwIoe1Rg8gaQ49huP5SnVVIbO
X-Forefront-Antispam-Report: 	CIP:144.49.247.29;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.ds.dlp.protect.symantec.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(346002)(136003)(46966006)(40470700004)(36840700001)(478600001)(4326008)(316002)(86362001)(33656002)(70586007)(40460700003)(45080400002)(966005)(110136005)(66574015)(47076005)(336012)(70206006)(36860700001)(186003)(356005)(83380400001)(53546011)(55016003)(81166007)(40480700001)(41300700001)(166002)(7696005)(82310400005)(6506007)(82740400003)(9686003)(26005)(224303003)(2906002)(8936002)(30864003)(52536014)(5660300002)(19627405001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 07:39:55.8551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b8803b-2322-44ac-5d4c-08da84daacd2
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e;Ip=[144.49.247.29];Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB5557
X-Proofpoint-ORIG-GUID: LCxcSSmuQxJqkLVLUHwCIBI8qyoINks_
X-Proofpoint-GUID: LCxcSSmuQxJqkLVLUHwCIBI8qyoINks_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_03,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1011 priorityscore=1501 mlxscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208230029
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

--_000_DM6PR08MB55145B920E9C7A1509BE9BE2DC709DM6PR08MB5514namp_
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="big5"

SGkgQnJhbmRvbiBhbmQgSmllLA0KDQpJIHdvdWxkIGxpa2UgdG8gc2VuZCB0aGUgU01CSU9TIHRh
YmxlIGZyb20gSG9zdCB0byBCTUMgYnkgdXNpbmcgInNtYmlvcy1pcG1pLWJsb2JzIiBpbnRlcmZh
Y2UuIEFuZCBhY2NvcmRpbmcgdG8gSmllJ3MgY2x1ZSAoY2FuIHNlbmQgdGhlIHNtYmlvcyB0YWJs
ZXMgdG8gQk1DIGVpdGhlciB0aHJvdWdoIExpbnV4Qm9vdCBvciBob3N0KSwgYW5kIHRoZW4gSSBz
YXcgYm90aCBvZiB5b3Ugd2VyZSBjb250cmlidXRpbmcgdG8gdGhlICJodHRwczovL2dpdGh1Yi5j
b20vdS1yb290L3Utcm9vdC9ibG9iL21haW4vY21kcy9leHAvc21iaW9zX3RyYW5zZmVyL3NtYmlv
c190cmFuc2Zlci5nbyIuIFRoZXJlZm9yZSwgSSBoYXZlIHNvbWUgcXVlc3Rpb25zIGFib3V0IHRo
aXMsIGNvdWxkIHlvdSBoZWxwIHRvIGFuc3dlciB0aGVtPw0KDQogIDEuDQpJJ20gYXNzdW1pbmcg
dGhhdCBJIGNhbiBidWlsZCAic21iaW9zX3RyYW5zZmVyIiBjb21tYW5kIGFuZCBleGVjdXRlIGl0
IG9uIHRoZSBIb3N0LXNpZGUgKHdpdGggaW5zdGFsbGVkIFVidW50dSAyMC4wNCksIGFtIGkgY29y
cmVjdD8NCg0KSW4gZmFjdCwgSSdtIG5vdCBmYW1pbGlhciB3aXRoIHUtcm9vdCBhbmQgR08gbGFu
Z3VhZ2UuIEhvd2V2ZXIsIGFmdGVyIHJlZmVycmluZyB0byBzb21lIHdlYnNpdGVzIHRvIGluc3Rh
bGwgR08gYW5kIGRvd25sb2FkIHUtcm9vdCwgSSBmb3Igbm93IGhhdmUgYnVpbHQgdGhlIGNtZCBv
dXQgYW5kIHJ1biBpdCBvbiBteSBIb3N0LiBVbmZvcnR1bmF0ZWx5LCB0aGUgcmVzdWx0IGxvb2tz
IGxpa2UgZmFpbGVkLg0KPT09DQokIHN1ZG8gLi9zbWJpb3NfdHJhbnNmZXINCjIwMjIvMDgvMjMg
MTQ6NDc6MTQgVHJhbnNmZXJyaW5nIFNNQklPUyB0YWJsZXMsIGF0dGVtcHQgMS8yDQoyMDIyLzA4
LzIzIDE0OjQ3OjM0IEVycm9yIHRyYW5mZXJyaW5nIFNNQklPUyB0YWJsZXMgb3ZlciBJUE1JOiBm
YWlsZWQgdG8gd3JpdGUgYW5kIGNvbW1pdCBibG9iIC9zbWJpb3M6IElQTUkgQmxvYldyaXRlIC9z
bWJpb3MgZmFpbGVkOiBmYWlsZWQgdG8gcmVhZCByYXdjb25uOiBpL28gdGltZW91dDsgSVBNSSBC
bG9iQ2xvc2UgL3NtYmlvcyBmYWlsZWQ6IGZhaWxlZCB0byByZWFkIHJhd2Nvbm46IGkvbyB0aW1l
b3V0DQoyMDIyLzA4LzIzIDE0OjQ3OjM0IFRyYW5zZmVycmluZyBTTUJJT1MgdGFibGVzLCBhdHRl
bXB0IDIvMg0KMjAyMi8wOC8yMyAxNDo0Nzo1NCBFcnJvciB0cmFuZmVycmluZyBTTUJJT1MgdGFi
bGVzIG92ZXIgSVBNSTogZmFpbGVkIHRvIHdyaXRlIGFuZCBjb21taXQgYmxvYiAvc21iaW9zOiBJ
UE1JIEJsb2JXcml0ZSAvc21iaW9zIGZhaWxlZDogZmFpbGVkIHRvIHJlYWQgcmF3Y29ubjogaS9v
IHRpbWVvdXQ7IElQTUkgQmxvYkNsb3NlIC9zbWJpb3MgZmFpbGVkOiBmYWlsZWQgdG8gcmVhZCBy
YXdjb25uOiBpL28gdGltZW91dA0KPT09DQoNCkRvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9ucyBv
biB0aGlzIGVycm9yPw0KDQpwcy4gSSdtIHN1cmUgdGhlIElQTUkgQlQgaW50ZXJmYWNlIGlzIHdv
cmthYmxlLg0KDQogIDEuICBPbiB0aGUgQk1DLXNpZGUsIEkganVzdCBuZWVkIHRvIGVuYWJsZSBz
bWJpb3MtbWRyIHBhY2thZ2UsIGNvcnJlY3Q/IG9yIGFueXRoaW5nIGVsc2U/DQoNClRoYW5rcy4N
Cg0KUmVnYXJkcywNCkNocmlzIENoZW4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCrFIpfOqzDogQ2hyaXMgQ2hlbiAoVFBJKSA8Q2hyaXMuQ2hlbjNAZmxleC5jb20+DQqxSKXz
pOm0wTogMjAyMqZ+OKTrMTmk6SCkVaTIIDA1OjUwDQqmrKXzqsw6IFRoYW5nIE5ndXllbiA8dGhh
bmdAYW1wZXJlbWFpbC5vbm1pY3Jvc29mdC5jb20+OyBKaWUgWWFuZyA8amp5QGdvb2dsZS5jb20+
DQqwxqW7OiBHYXJyZXR0LCBNaWtlIChIUEUgU2VydmVyIEZpcm13YXJlKSA8bWlrZS5nYXJyZXR0
QGhwZS5jb20+OyBBbmRyZWkgS2FydGFzaGV2IDxhLmthcnRhc2hldkB5YWRyby5jb20+OyBDUzIw
IENITGkzMCA8Y2hsaTMwQG51dm90b24uY29tPjsgb3BlbmJtYyA8b3BlbmJtY0BsaXN0cy5vemxh
YnMub3JnPg0KpUSmrjogpl7C0DogUmVhZCBzbWJpb3MyIGZpbGUgZmFpbGVkDQoNCkhlbGxvIGV2
ZXJ5b25lLA0KDQpJIHdvdWxkIGxpa2UgdG8gc2VuZCB0aGUgU01CSU9TIHRhYmxlIGZyb20gSG9z
dCB0byBCTUMgYnkgdXNpbmcgInNtYmlvcy1pcG1pLWJsb2JzIiBpbnRlcmZhY2UuIEJ1dCwgYWZ0
ZXIgcmV2aWV3aW5nIGFsbCB5b3VyIGRpc2N1c3Npb25zLCBJIHN0aWxsIGhhdmUgbm8gaWRlYSBo
b3cgdG8gZW5hYmxlIHRoZSBmZWF0dXJlLiBDb3VsZCB5b3UgaGVscCB0byBzaGFyZSBtb3JlIGRl
dGFpbHMgd2l0aCBtZT8gZm9yIGV4YW1wbGUsDQoNCiAgMS4gIEhvdyB0byBnZW5lcmF0ZSBhIHJh
dyBTTUJJT1MgdGFibGUgd2l0aCBNRFJ2MiBoZWFkZXI/IChsaWtlIHVzaW5nICJkbWlkZWNvZGUg
LS1kdW1wLWJpbiIgYW5kIHdoYXQgZWxzZT8pDQogIDIuICBIb3cgZG8gc3RhcnQgc2VuZGluZyBT
TUJJT1MgYmluYXJ5IGZpbGUgYXQgSG9zdC1zaWRlPyAoQXMgSSBrbm93LCB0aGUgRlcgdXBkYXRl
IG1lY2hhbmlzbSB0aHJvdWdoIElQTUkgYmxvYiB3b3VsZCBuZWVkIHRvIGJ1aWxkIGEgaG9zdC10
b29sLCBuYW1lZCBidXJuLW15LWJtYywgb24gdGhlIEhvc3QgYW5kIHRoZW4gcnVuIHRoZSB0b29s
IHRvIHN0YXJ0IGltYWdlIGRhdGEgdHJhbnNmb3JtYXRpb24uIERvZXMgdGhlICJzbWJpb3MtaXBt
aS1ibG9icyIgd2l0aCB0aGUgc2FtZSBtZXRob2Q/KQ0KDQpwLnMuIFRoZSBPUyBydW5uaW5nIG9u
IHRoZSBIb3N0IGlzIFVidW50dSAyMC4wNC4NCg0KVGhhbmtzLg0KDQpSZWdhcmRzLA0KQ2hyaXMg
Q2hlbg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KsUil86rMOiBvcGVuYm1j
IDxvcGVuYm1jLWJvdW5jZXMrY2hyaXMuY2hlbjM9ZmxleC5jb21AbGlzdHMub3psYWJzLm9yZz4g
pU6q7SBUaGFuZyBOZ3V5ZW4gPHRoYW5nQGFtcGVyZW1haWwub25taWNyb3NvZnQuY29tPg0KsUil
86TptME6IDIwMjGmfjmk6zE3pOkgpFWkyCAwOTo0MA0Kpqyl86rMOiBKaWUgWWFuZyA8amp5QGdv
b2dsZS5jb20+DQqwxqW7OiBHYXJyZXR0LCBNaWtlIChIUEUgU2VydmVyIEZpcm13YXJlKSA8bWlr
ZS5nYXJyZXR0QGhwZS5jb20+OyBBbmRyZWkgS2FydGFzaGV2IDxhLmthcnRhc2hldkB5YWRyby5j
b20+OyBDUzIwIENITGkzMCA8Y2hsaTMwQG51dm90b24uY29tPjsgb3BlbmJtYyA8b3BlbmJtY0Bs
aXN0cy5vemxhYnMub3JnPg0KpUSmrjogUmU6IFJlYWQgc21iaW9zMiBmaWxlIGZhaWxlZA0KDQoN
ClRoYW5rcyBKaWEgZm9yIHlvdXIgaW5mb3JtYXRpb24NCg0KT24gMTcvMDkvMjAyMSAwNTozNiwg
SmllIFlhbmcgd3JvdGU6DQpIaSwNCg0KQWN0dWFsbHkgSSBhZGRlZCBhbiBpcG1pIGJsb2IgaW50
ZXJmYWNlIHRvIHNtYmlvcy1tZHIgaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvc21iaW9zLW1k
ci90cmVlL21hc3Rlci9zcmMvc21iaW9zLWlwbWktYmxvYnM8aHR0cHM6Ly91cmxkZWZlbnNlLmNv
bS92My9fX2h0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3NtYmlvcy1tZHIvdHJlZS9tYXN0ZXIv
c3JjL3NtYmlvcy1pcG1pLWJsb2JzX187ISFIU250bENnIUV0d2hWMThpNUdkSi1PY1VGSVAwdUky
ZXpuOGxiQnRURUFjV1JnUGFkN0VVdU9Pek9mVFZ1VzR4dHZwWWpDV1UkPi4gV2l0aCB0aGlzIGlu
dGVyZmFjZSB5b3UgY2FuIHNlbmQgdGhlIHNtYmlvcyB0YWJsZXMgdG8gQk1DIGVpdGhlciB0aHJv
dWdoIExpbnV4Qm9vdCBvciBob3N0LiBUaGUgTGludXhCb290IGNvZGUgaHR0cHM6Ly9naXRodWIu
Y29tL3Utcm9vdC91LXJvb3QvdHJlZS9tYXN0ZXIvY21kcy9leHAvc21iaW9zX3RyYW5zZmVyPGh0
dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2dpdGh1Yi5jb20vdS1yb290L3Utcm9v
dC90cmVlL21hc3Rlci9jbWRzL2V4cC9zbWJpb3NfdHJhbnNmZXJfXzshIUhTbnRsQ2chRXR3aFYx
OGk1R2RKLU9jVUZJUDB1STJlem44bGJCdFRFQWNXUmdQYWQ3RVV1T096T2ZUVnVXNHh0aVdtb0wy
WCQ+LiBXcml0aW5nIGFuZCBjb21taXR0aW5nIHRvIHRoaXMgYmxvYiB3aWxsIGdlbmVyYXRlIHRo
ZSBNRFIgaGVhZGVyLg0KDQotSmllDQoNCk9uIFRodSwgU2VwIDE2LCAyMDIxIGF0IDQ6MTkgQU0g
VGhhbmcgTmd1eWVuIDx0aGFuZ0BhbXBlcmVtYWlsLm9ubWljcm9zb2Z0LmNvbTxtYWlsdG86dGhh
bmdAYW1wZXJlbWFpbC5vbm1pY3Jvc29mdC5jb20+PiB3cm90ZToNClRoYW5rcyBUaW0sIE1pa2Ug
YW5kIEFuZHJlaSBmb3IgdmVyeSB1c2VmdWwgaW5mb3JtYXRpb24uIFdlIGNhbiBtYWtlIGl0DQp3
b3JrIGJ5IGFkZGluZyBNRFJ2MiBoZWFkZXIuDQoNCkkgYW0gZmluZGluZyBzb21lIGluZm9ybWF0
aW9uIGFib3V0IHRoZSBJUE1JIGJsb2JzIGNvbW1hbmRzLiBJIGNhbiBzZWUNCnNvbWUgbm90ZXMg
YXQNCg0KaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvZG9jcy9ibG9iL21hc3Rlci9kZXNpZ25z
L2JpbmFyeXN0b3JlLXZpYS1ibG9icy5tZDxodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0
cHM6Ly9naXRodWIuY29tL29wZW5ibWMvZG9jcy9ibG9iL21hc3Rlci9kZXNpZ25zL2JpbmFyeXN0
b3JlLXZpYS1ibG9icy5tZF9fOyEhSFNudGxDZyFFdHdoVjE4aTVHZEotT2NVRklQMHVJMmV6bjhs
YkJ0VEVBY1dSZ1BhZDdFVXVPT3pPZlRWdVc0eHRvYUVWS1V2JD4NCg0KaHR0cHM6Ly9naXRodWIu
Y29tL29wZW5ibWMvcGhvc3Bob3ItaXBtaS1ibG9icy9ibG9iL21hc3Rlci9SRUFETUUubWQ8aHR0
cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3Nw
aG9yLWlwbWktYmxvYnMvYmxvYi9tYXN0ZXIvUkVBRE1FLm1kX187ISFIU250bENnIUV0d2hWMThp
NUdkSi1PY1VGSVAwdUkyZXpuOGxiQnRURUFjV1JnUGFkN0VVdU9Pek9mVFZ1VzR4dHJmLUljeEQk
Pg0KDQpCdXQgSSBoYXZlIG5vdCBmb3VuZCBtb3JlIGRlc2NyaXB0aW9uIGFib3V0IHRoZSBJUE1J
IGJsb2IgY29tbWFuZHMgbGlrZQ0KTmV0Rm4sIEZ1bmMsIC4uLiB0aGF0IEkgY2FuIHNlbmQgYSBm
aWxlIGZyb20gSG9zdCB0byBCTUMuIERvIHlvdSBoYXZlDQphbnkgaW5mb3JtYXRpb24gYWJvdXQg
dGhlbT8NCg0KDQpUaGFua3MsDQoNClRoYW5nIFEuIE5ndXllbg0KDQpPbiAxNi8wOS8yMDIxIDA5
OjQwLCBDUzIwIENITGkzMCB3cm90ZToNCj4gSGkgVGhhbmcsDQo+IERpZCB5b3UgdHJ5IHRvIHVz
ZSBzbWJpb3NfZW50cnlfcG9pbnQgb3IgRE1JIGZyb20gaG9zdCB0byBCTUMgL3Zhci9saWIvc21i
aW9zL3NtYmlvczIgZm9yIHBhcnNpbmc/DQo+DQo+IFlvdSBjYW4gcmVmZXIgdGhpcyBzeXNmcy1m
aXJtd2FyZS1kbWktdGFibGVzIGFzIGJlbG93Og0KPg0KPiBUaGUgZmlybXdhcmUgcHJvdmlkZXMg
RE1JIHN0cnVjdHVyZXMgYXMgYSBwYWNrZWQgbGlzdCBvZiBkYXRhIHJlZmVyZW5jZWQgYnkgYSBT
TUJJT1MgdGFibGUgZW50cnkgcG9pbnQuDQo+IFRoZSBTTUJJT1MgZW50cnkgcG9pbnQgY29udGFp
bnMgZ2VuZXJhbCBpbmZvcm1hdGlvbiwgbGlrZSBTTUJJT1MgdmVyc2lvbiwgRE1JIHRhYmxlIHNp
emUsIGV0Yy4NCj4gVGhlIHN0cnVjdHVyZSwgY29udGVudCBhbmQgc2l6ZSBvZiBTTUJJT1MgZW50
cnkgcG9pbnQgaXMgZGVwZW5kZW50IG9uIFNNQklPUyB2ZXJzaW9uLg0KPg0KPiBUaGUgZm9ybWF0
IG9mIFNNQklPUyBlbnRyeSBwb2ludCBhbmQgRE1JIHN0cnVjdHVyZXMgY2FuIGJlIHJlYWQgaW4g
U01CSU9TIHNwZWNpZmljYXRpb24uDQo+IFRoZSBkbWkvdGFibGVzIHByb3ZpZGVzIHJhdyBTTUJJ
T1MgZW50cnkgcG9pbnQgYW5kIERNSSB0YWJsZXMgdGhyb3VnaCBzeXNmcyBhcyBhbiBhbHRlcm5h
dGl2ZSB0byB1dGlsaXRpZXMgcmVhZGluZyB0aGVtIGZyb20gL2Rldi9tZW0uDQo+DQo+IFRoZSBy
YXcgU01CSU9TIGVudHJ5IHBvaW50IGFuZCBETUkgdGFibGUgYXJlIHByZXNlbnRlZCBhcyBiaW5h
cnkgYXR0cmlidXRlcyBhbmQgYXJlIGFjY2Vzc2libGUgdmlhOg0KPiAvc3lzL2Zpcm13YXJlL2Rt
aS90YWJsZXMvc21iaW9zX2VudHJ5X3BvaW50DQo+IC9zeXMvZmlybXdhcmUvZG1pL3RhYmxlcy9E
TUkNCj4NCj4gQmVzdCByZWdhcmRzLA0KPiBUaW0NCj4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gRnJvbTogb3BlbmJtYyBbbWFpbHRvOm9wZW5ibWMtYm91bmNlcytjaGxpMzA8bWFp
bHRvOm9wZW5ibWMtYm91bmNlcyUyQmNobGkzMD49bnV2b3Rvbi5jb21AbGlzdHMub3psYWJzLm9y
ZzxtYWlsdG86bnV2b3Rvbi5jb21AbGlzdHMub3psYWJzLm9yZz5dIE9uIEJlaGFsZiBPZiBHYXJy
ZXR0LCBNaWtlIChIUEUgU2VydmVyIEZpcm13YXJlKQ0KPiBTZW50OiBXZWRuZXNkYXksIFNlcHRl
bWJlciAxNSwgMjAyMSA5OjE5IFBNDQo+IFRvOiBBbmRyZWkgS2FydGFzaGV2IDxhLmthcnRhc2hl
dkB5YWRyby5jb208bWFpbHRvOmEua2FydGFzaGV2QHlhZHJvLmNvbT4+OyBUaGFuZyBOZ3V5ZW4g
PHRoYW5nQGFtcGVyZW1haWwub25taWNyb3NvZnQuY29tPG1haWx0bzp0aGFuZ0BhbXBlcmVtYWls
Lm9ubWljcm9zb2Z0LmNvbT4+OyBvcGVuYm1jIDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc8bWFp
bHRvOm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4+DQo+IFN1YmplY3Q6IFJFOiBSZWFkIHNtYmlv
czIgZmlsZSBmYWlsZWQNCj4NCj4gV2UgcmVjZW50bHkgZGlkIHRoZSBzYW1lIHRoaW5nIGFuZCBn
b3QgaXQgd29ya2luZy4gIEFsbCB5b3UgaGF2ZSB0byBkbyBpcyB0YWtlIHRoZSBSQVcgc21iaW9z
IHJlY29yZHMgYmxvYiBpbiBiaW5hcnkgZm9ybSAoZGVsaXZlcmVkIGFzIG5vdGVkIGJlbG93IGlu
IHdoYXRldmVyIHdheSB5b3UgY2hvb3NlKSBhbmQgcHJlcGVuZCBhIHNwZWNpZmljIGhlYWRlcjog
IGh0dHBzOi8vYXBjMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRw
cyUzQSUyRiUyRmdpdGh1Yi5jb20lMkZvcGVuYm1jJTJGc21iaW9zLW1kciUyRmJsb2IlMkYzM2M5
NDhhNDczYmQyNzNmZWEwY2ZmODJkNGM5OWI3MGI3Nzg0YmU2JTJGaW5jbHVkZSUyRnNtYmlvc19t
ZHJ2Mi5ocHAlMjNMMTE0JmFtcDtkYXRhPTA0JTdDMDElN0NjaGxpMzAlNDBudXZvdG9uLmNvbSU3
QzgxYTRiZDI5ZTQ5MDRiZjRkODQ2MDhkOTc4NTEwYjkyJTdDYTNmMjQ5MzFkNDAzNGI0YTk0ZjE3
ZDgzYWM2MzhlMDclN0MwJTdDMCU3QzYzNzY3MzUyNjk1NDU1Mjc0MiU3Q1Vua25vd24lN0NUV0Zw
Ykdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam8gaVYybHVNeklpTENKQlRpSTZJazFo
YVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9b1F3Y296c1NvR2xnU0Z3enRQRlYz
RkFvUHBSWkdZb1o3cGMwJTJCeERpMU1BJTNEJmFtcDtyZXNlcnZlZD0wPGh0dHBzOi8vdXJsZGVm
ZW5zZS5jb20vdjMvX19odHRwczovL2FwYzAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2su
Y29tLz91cmw9aHR0cHMqM0EqMkYqMkZnaXRodWIuY29tKjJGb3BlbmJtYyoyRnNtYmlvcy1tZHIq
MkZibG9iKjJGMzNjOTQ4YTQ3M2JkMjczZmVhMGNmZjgyZDRjOTliNzBiNzc4NGJlNioyRmluY2x1
ZGUqMkZzbWJpb3NfbWRydjIuaHBwKjIzTDExNCZhbXA7ZGF0YT0wNCo3QzAxKjdDY2hsaTMwKjQw
bnV2b3Rvbi5jb20qN0M4MWE0YmQyOWU0OTA0YmY0ZDg0NjA4ZDk3ODUxMGI5Mio3Q2EzZjI0OTMx
ZDQwMzRiNGE5NGYxN2Q4M2FjNjM4ZTA3KjdDMCo3QzAqN0M2Mzc2NzM1MjY5NTQ1NTI3NDIqN0NV
bmtub3duKjdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklp
TENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wKjNEKjdDMTAwMCZhbXA7c2RhdGE9b1F3Y296c1Nv
R2xnU0Z3enRQRlYzRkFvUHBSWkdZb1o3cGMwKjJCeERpMU1BKjNEJmFtcDtyZXNlcnZlZD0wX187
SlNVbEpTVWxKU1VsSlNVbEpTVWxKU1VsSlNVbEpTVWwhIUhTbnRsQ2chRXR3aFYxOGk1R2RKLU9j
VUZJUDB1STJlem44bGJCdFRFQWNXUmdQYWQ3RVV1T096T2ZUVnVXNHh0c2c4R3hfeSQ+DQo+DQo+
IEl0IGlzIGEgbGl0dGxlIGJpdCBmcmFnaWxlIGFzIGl0IGludHJvZHVjZXMgYSBkZXBlbmRlbmN5
IG9uIHRoZSBmaWxlIGRvd25sb2FkIGxvZ2ljIHRvIHdyaXRlIGEgbm9uLXN0YW5kYXJkIGhlYWRl
ciBkZWZpbmVkIGluIGFub3RoZXIgc2VydmljZSB0aGF0IGNvdWxkIHBvdGVudGlhbGx5IGNoYW5n
ZS4NCj4NCj4gTWlrZQ0KPg0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+IEZyb206
IG9wZW5ibWMgPG9wZW5ibWMtDQo+PiBib3VuY2VzK21pa2UuZ2FycmV0dD1ocGUuY29tQGxpc3Rz
Lm96bGFicy5vcmc8bWFpbHRvOmhwZS5jb21AbGlzdHMub3psYWJzLm9yZz4+IE9uIEJlaGFsZiBP
ZiBBbmRyZWkNCj4+IEthcnRhc2hldg0KPj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMTUs
IDIwMjEgMzoxNyBBTQ0KPj4gVG86IFRoYW5nIE5ndXllbiA8dGhhbmdAYW1wZXJlbWFpbC5vbm1p
Y3Jvc29mdC5jb208bWFpbHRvOnRoYW5nQGFtcGVyZW1haWwub25taWNyb3NvZnQuY29tPj47IG9w
ZW5ibWMNCj4+IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc8bWFpbHRvOm9wZW5ibWNAbGlzdHMu
b3psYWJzLm9yZz4+DQo+PiBTdWJqZWN0OiBSZTogUmVhZCBzbWJpb3MyIGZpbGUgZmFpbGVkDQo+
Pg0KPj4gSSBkb24ndCBrbm93IHdoYXQgaXMgZm9ybWF0IG9mICJkbWlkZWNvZGUgLS1kdW1wLWJp
biIsIGJ1dCBpZiBpdCBqdXN0DQo+PiByYXcgZHVtcCBvZiBzbWJpb3MgdGhlbiB5b3Ugb25seSBu
ZWVkIHRvIGFkZCBtZHIgaGVhZGVyLg0KPj4NCj4+IFNlZSBhbnN3ZXIgZm9yIHRoZSBzYW1lIHF1
ZXN0aW9uIGhlcmU6DQo+PiBJTlZBTElEIFVSSSBSRU1PVkVEDQo+PiAwMjEtSnVseS8wMjY4ODIu
aHRtbF9fOyEhTnB4UiEydzBGa1BzMkt5YUI2WE92QjhldDUyYldLcUFNTEltbUwtDQo+PiBpVWs5
QV96WmJKOFdMaE1lWGR2UkFwLXBjeHQ4USQNCj4+DQo+PiBPbiBXZWQsIDIwMjEtMDktMTUgYXQg
MTI6NDEgKzA3MDAsIFRoYW5nIE5ndXllbiB3cm90ZToNCj4+PiBIaSBBbmRyZWksDQo+Pj4NCj4+
PiBJIHNlZSBvdXRwdXQgb2YgImRtaWRlY29kZSAtLWR1bXAtYmluIiBmb2xsb3dzIFNNQklPUyBz
cGVjaWZpY2F0aW9uLg0KPj4+IEFzDQo+Pj4gdGhlIGRhdGEgZm9yIHNtYmlvcy1tZHIgZG9lcyBu
b3QgZm9sbG93IHRoaXMsIGRvIHlvdSBrbm93IGFib3V0IHRoZQ0KPj4+IGRvY3VtZW50IG9yIGFu
eSBpbmZvcm1hdGlvbiBJIGNhbiByZWZlcmVuY2UgdG8gcHJlcGFyZSBkYXRhIHRvIHNlbmQNCj4+
PiB0byBCTUM/Pw0KPj4+DQo+Pj4NCj4+PiBCZXN0IFJlZ2FyZHMsDQo+Pj4NCj4+PiBUaGFuZyBR
LiBOZ3V5ZW4NCj4+Pg0KPj4+IE9uIDE0LzA5LzIwMjEgMTU6NTEsIEFuZHJlaSBLYXJ0YXNoZXYg
d3JvdGU6DQo+Pj4+IE5vLCBpdCBpcyBub3Qgc2FtZSBhcyAiZG1pZGVjb2RlIC0tZHVtcC1iaW4i
Lg0KPj4+Pg0KPj4+PiBPbiBUdWUsIDIwMjEtMDktMTQgYXQgMTM6NDYgKzA3MDAsIFRoYW5nIE5n
dXllbiB3cm90ZToNCj4+Pj4+IE9uIDEzLzA5LzIwMjEgMjM6NTYsIEFuZHJlaSBLYXJ0YXNoZXYg
d3JvdGU6DQo+Pj4+Pj4gWW91IG5lZWQgdG8gc29tZWhvdyBkZWxpdmVyIHNtYmlvcyBkYXRhIGlt
YWdlIHRvIEJNQy4gVGhpcw0KPj4+Pj4+IG1lYW5zLCB5b3VyIEJJT1Mgc2hvdWxkIGltcGxlbWVu
dGF0IHNvbWUgbG9naWMgdG8gdHJhbnNmZXINCj4+Pj4+PiB0aGlzIGRhdGEuDQo+Pj4+Pj4gRm9y
IEJNQyBzaWRlIHNlZSBleGFtcGxlIGhlcmU6DQo+Pj4+Pj4gaHR0cHM6Ly9hcGMwMS5zYWZlbGlu
a3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTI8aHR0cHM6Ly91cmxkZWZl
bnNlLmNvbS92My9fX2h0dHBzOi8vYXBjMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5j
b20vP3VybD1odHRwcyozQSoyX187SlNVISFIU250bENnIUV0d2hWMThpNUdkSi1PY1VGSVAwdUky
ZXpuOGxiQnRURUFjV1JnUGFkN0VVdU9Pek9mVFZ1VzR4dGdHRGxScWkkPg0KPj4+Pj4+IEYlMkZn
aXRodWIuY29tJTJGb3BlbmJtYyUyRmludGVsLWlwbWktJmFtcDtkYXRhPTA0JTdDMDElN0NjaGxp
DQo+Pj4+Pj4gMzAlNDBudXZvdG9uLmNvbTxodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0
cDovLzQwbnV2b3Rvbi5jb21fXzshIUhTbnRsQ2chRXR3aFYxOGk1R2RKLU9jVUZJUDB1STJlem44
bGJCdFRFQWNXUmdQYWQ3RVV1T096T2ZUVnVXNHh0aFdzZW1IciQ+JTdDODFhNGJkMjllNDkwNGJm
NGQ4NDYwOGQ5Nzg1MTBiOTIlN0NhM2YyNDkzMQ0KPj4+Pj4+IGQ0MDM0YjRhOTRmMTdkODNhYzYz
OGUwNyU3QzAlN0MwJTdDNjM3NjczNTI2OTU0NTUyNzQyJTdDVW5rbm93DQo+Pj4+Pj4gbiU3Q1RX
RnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsN
Cj4+Pj4+PiAxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRhPWNHNlpaek9TWGt1
VXRjUXV1b3ltc1JkUA0KPj4+Pj4+IHAyNG1JTmElMkZoQ3klMkJZaGUlMkZObWslM0QmYW1wO3Jl
c2VydmVkPTANCj4+IG9lbS9ibG9iL21hc3Rlci9zcmMvc21iaW9zDQo+Pj4+Pj4gbWRydjJoYW5k
bGVyLmNwcA0KPj4+Pj4gSGkgQW5kcmVpLA0KPj4+Pj4NCj4+Pj4+IFdoYXQgaXMgdGhlIGZvcm1h
dCBvZiBzbWJpb3MgZGF0YSB0byB0cmFuc2ZlciB0byBCTUM/IElzIGl0IHRoZQ0KPj4+Pj4gc2Ft
ZSBjb250ZW50IG9mICJkbWlkZWNvZGUgLS1kdW1wLWJpbiIgY29tbWFuZCBmcm9tIEhvc3QgTGlu
dXg/DQo+PiBvcg0KPj4+Pj4gYW55dGhpbmcgc3BlY2lhbCBpbiBmb3JtYXR0aW5nIHRoZSBjb250
ZW50IHRvIHNlbmQ/DQo+Pj4+Pg0KPj4+Pj4+IE9uIE1vbiwgMjAyMS0wOS0xMyBhdCAxNzo0MCAr
MDMwMCwgQWxleGFuZGVyIFJhaWggd3JvdGU6DQo+Pj4+Pj4+IEhpIGd1eXMsIEkgYW0gYmVnaW5u
ZXIgaW4gb3BlbmJtYyBJIGJ1aWxkIG9wZW5ibWMgd2l0aA0KPj4+Pj4+PiBzbWJpb3MtbWRyIHJl
cG9zaXRvcnkgYW5kIEkgaGF2ZSBlcnJvcjoNCj4+Pj4+Pj4NCj4+Pj4+Pj4gUmVhZCBkYXRhIGZy
b20gZmxhc2ggZXJyb3IgLSBPcGVuIE1EUlYyIHRhYmxlIGZpbGUgZmFpbHVyZQ0KPj4+Pj4+Pg0K
Pj4+Pj4+PiBUaGVyZSBpc250IGZpbGUgaW4gL3Zhci9saWIvc21iaW9zL3NtYmlvczINCj4+Pj4+
Pj4NCj4+Pj4+Pj4gSG93IEkgY2FuIHJlc29sdmUgdGhpcyBwcm9ibGVtPw0KPj4+Pj4+PiBIZWxw
IG1lIHBsZWFzZSEhIQ0KPj4NCj4+IC0tDQo+PiBCZXN0IHJlZ2FyZHMsDQo+PiBBbmRyZWkgS2Fy
dGFzaGV2DQo+Pg0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KPiAgIFRoZSBwcml2aWxlZ2VkIGNvbmZpZGVudGlh
bCBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlbWFpbCBpcyBpbnRlbmRlZCBmb3IgdXNl
IG9ubHkgYnkgdGhlIGFkZHJlc3NlZXMgYXMgaW5kaWNhdGVkIGJ5IHRoZSBvcmlnaW5hbCBzZW5k
ZXIgb2YgdGhpcyBlbWFpbC4gSWYgeW91IGFyZSBub3QgdGhlIGFkZHJlc3NlZSBpbmRpY2F0ZWQg
aW4gdGhpcyBlbWFpbCBvciBhcmUgbm90IHJlc3BvbnNpYmxlIGZvciBkZWxpdmVyeSBvZiB0aGUg
ZW1haWwgdG8gc3VjaCBhIHBlcnNvbiwgcGxlYXNlIGtpbmRseSByZXBseSB0byB0aGUgc2VuZGVy
IGluZGljYXRpbmcgdGhpcyBmYWN0IGFuZCBkZWxldGUgYWxsIGNvcGllcyBvZiBpdCBmcm9tIHlv
dXIgY29tcHV0ZXIgYW5kIG5ldHdvcmsgc2VydmVyIGltbWVkaWF0ZWx5LiBZb3VyIGNvb3BlcmF0
aW9uIGlzIGhpZ2hseSBhcHByZWNpYXRlZC4gSXQgaXMgYWR2aXNlZCB0aGF0IGFueSB1bmF1dGhv
cml6ZWQgdXNlIG9mIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiBvZiBOdXZvdG9uIGlzIHN0cmlj
dGx5IHByb2hpYml0ZWQ7IGFuZCBhbnkgaW5mb3JtYXRpb24gaW4gdGhpcyBlbWFpbCBpcnJlbGV2
YW50IHRvIHRoZSBvZmZpY2lhbCBidXNpbmVzcyBvZiBOdXZvdG9uIHNoYWxsIGJlIGRlZW1lZCBh
cyBuZWl0aGVyIGdpdmVuIG5vciBlbmRvcnNlZCBieSBOdXZvdG9uLg0KCkxlZ2FsIERpc2NsYWlt
ZXIgOgpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgbWVzc2FnZSBtYXkgYmUgcHJp
dmlsZWdlZCBhbmQgY29uZmlkZW50aWFsLiAKSXQgaXMgaW50ZW5kZWQgdG8gYmUgcmVhZCBvbmx5
IGJ5IHRoZSBpbmRpdmlkdWFsIG9yIGVudGl0eSB0byB3aG9tIGl0IGlzIGFkZHJlc3NlZCAKb3Ig
YnkgdGhlaXIgZGVzaWduZWUuIElmIHRoZSByZWFkZXIgb2YgdGhpcyBtZXNzYWdlIGlzIG5vdCB0
aGUgaW50ZW5kZWQgcmVjaXBpZW50LCAKeW91IGFyZSBvbiBub3RpY2UgdGhhdCBhbnkgZGlzdHJp
YnV0aW9uIG9mIHRoaXMgbWVzc2FnZSwgaW4gYW55IGZvcm0sIAppcyBzdHJpY3RseSBwcm9oaWJp
dGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgaW4gZXJyb3IsIApwbGVhc2Ug
aW1tZWRpYXRlbHkgbm90aWZ5IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBvciBkZXN0cm95IGFueSBj
b3B5IG9mIHRoaXMgbWVzc2FnZSEK

--_000_DM6PR08MB55145B920E9C7A1509BE9BE2DC709DM6PR08MB5514namp_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="big5"

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family:Calibri,Arial,Helvetica,=
sans-serif; font-size:12pt; color:rgb(0,0,0)">
Hi Brandon and Jie,</div>
<div class=3D"elementToProof" style=3D"font-family:Calibri,Arial,Helvetica,=
sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family:Calibri,Arial,Helvetica,=
sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"background-color:rgb(255, 255, 255);display:inline !importan=
t"></span>I would like to send the SMBIOS table from Host to BMC by using &=
quot;smbios-ipmi-blobs&quot; interface. And according to Jie's clue (can se=
nd the smbios tables to BMC either through LinuxBoot
 or host), and then I saw both of you were contributing to the &quot;https:=
//github.com/u-root/u-root/blob/main/cmds/exp/smbios_transfer/smbios_transf=
er.go&quot;. Therefore, I have some questions about this, could you help to=
 answer them?</div>
<div class=3D"elementToProof" style=3D"font-family:Calibri,Arial,Helvetica,=
sans-serif; font-size:12pt; color:rgb(0,0,0)">
<ol>
<li>
<div><span style=3D"background-color:rgb(255,255,255); display:inline!impor=
tant">I'm assuming that&nbsp;</span>I can build &quot;smbios_transfer&quot;=
 command and execute it on the Host-side (with installed Ubuntu 20.04), am =
i correct?&nbsp;<br>
</div>
<br>
<div>In fact, I'm not familiar with u-root and GO language. However, after =
referring to some websites to install GO and download u-root, I for now hav=
e built the cmd out and run it on my Host. Unfortunately, the result looks =
like failed.<br>
=3D=3D=3D<br>
$ sudo ./smbios_transfer
<div>2022/08/23 14:47:14 Transferring SMBIOS tables, attempt 1/2</div>
<div>2022/08/23 14:47:34 Error tranferring SMBIOS tables over IPMI: failed =
to write and commit blob /smbios: IPMI BlobWrite /smbios failed: failed to =
read rawconn: i/o timeout; IPMI BlobClose /smbios failed: failed to read ra=
wconn: i/o timeout</div>
<div>2022/08/23 14:47:34 Transferring SMBIOS tables, attempt 2/2</div>
2022/08/23 14:47:54 Error tranferring SMBIOS tables over IPMI: failed to wr=
ite and commit blob /smbios: IPMI BlobWrite /smbios failed: failed to read =
rawconn: i/o timeout; IPMI BlobClose /smbios failed: failed to read rawconn=
: i/o timeout<br>
=3D=3D=3D<br>
<br>
Do you have any suggestions on this error? <br>
<br>
ps. I'm sure the IPMI BT interface is workable.</div>
</li></ol>
<ol start=3D"2">
<li>On the BMC-side, I just need to enable smbios-mdr package, correct? or =
anything else?</li></ol>
<div><br>
</div>
<div>Thanks.</div>
<div><br>
</div>
<div>Regards,</div>
<div>Chris Chen</div>
<div><br>
</div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B1H=A5=F3=AA=CC:</b> Chris Che=
n (TPI) &lt;Chris.Chen3@flex.com&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b> 2022=A6~8=A4=EB19=A4=E9 =A4U=A4=C8 05:50<br>
<b>=A6=AC=A5=F3=AA=CC:</b> Thang Nguyen &lt;thang@amperemail.onmicrosoft.co=
m&gt;; Jie Yang &lt;jjy@google.com&gt;<br>
<b>=B0=C6=A5=BB:</b> Garrett, Mike (HPE Server Firmware) &lt;mike.garrett@h=
pe.com&gt;; Andrei Kartashev &lt;a.kartashev@yadro.com&gt;; CS20 CHLi30 &lt=
;chli30@nuvoton.com&gt;; openbmc &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>=A5D=A6=AE:</b> =A6^=C2=D0: Read smbios2 file failed</font>
<div>&nbsp;</div>
</div>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
Hello everyone,</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof elementToProof" style=3D"font-family:Calibri=
,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
I would like to send the SMBIOS table from Host to BMC by using &quot;smbio=
s-ipmi-blobs&quot; interface. But, after reviewing all your discussions, I =
still have no idea how to enable the feature. Could you help to share more =
details with me? for example,</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<ol>
<li><span>How to generate a raw SMBIOS table with MDRv2 header? (like using=
 &quot;dmidecode --dump-bin&quot; and what else?)</span></li><li>How do sta=
rt sending SMBIOS binary file at Host-side? (As I know, the FW update mecha=
nism through IPMI blob would need to build a host-tool, named burn-my-bmc, =
on the Host and then run the tool to start image data transformation. Does =
the &quot;smbios-ipmi-blobs&quot;
 with the same method?)<span style=3D"text-align:start; background-color:rg=
b(255,255,255); display:inline!important"><span style=3D"background-color:r=
gb(255,255,255); display:inline!important"></span></span></li></ol>
<div><br>
</div>
<div>p.s. The OS running on the Host is Ubuntu 20.04.</div>
<div><br>
</div>
<div>Thanks.</div>
<div><br>
</div>
<div>Regards,</div>
<div>Chris Chen</div>
</div>
<div id=3D"x_signature_bookmark"></div>
<div id=3D"x_appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr" class=3D"x_elementToProof"><font fa=
ce=3D"Calibri, sans-serif" color=3D"#000000" style=3D"font-size:11pt"><b>=
=B1H=A5=F3=AA=CC:</b> openbmc &lt;openbmc-bounces+chris.chen3=3Dflex.com@li=
sts.ozlabs.org&gt; =A5N=AA=ED Thang Nguyen &lt;thang@amperemail.onmicrosoft=
.com&gt;<br>
</font></div>
<div dir=3D"ltr"><font face=3D"Calibri, sans-serif" color=3D"#000000" style=
=3D"font-size:11pt"><b>=B1H=A5=F3=A4=E9=B4=C1:</b> 2021=A6~9=A4=EB17=A4=E9 =
=A4U=A4=C8 09:40<br>
<b>=A6=AC=A5=F3=AA=CC:</b> Jie Yang &lt;jjy@google.com&gt;<br>
<b>=B0=C6=A5=BB:</b> Garrett, Mike (HPE Server Firmware) &lt;mike.garrett@h=
pe.com&gt;; Andrei Kartashev &lt;a.kartashev@yadro.com&gt;; CS20 CHLi30 &lt=
;chli30@nuvoton.com&gt;; openbmc &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>=A5D=A6=AE:</b> Re: Read smbios2 file failed</font>
<div>&nbsp;</div>
</div>
<div>
<p style=3D"margin-top: 0px; margin-bottom: 0px;margin-top:0px; margin-bott=
om:0px">
Thanks Jia for your information<br>
</p>
<div class=3D"x_x_moz-cite-prefix">On 17/09/2021 05:36, Jie Yang wrote:<br>
</div>
<blockquote type=3D"cite">
<div dir=3D"ltr">Hi,
<div><br>
</div>
<div class=3D"elementToProof">Actually I added an ipmi blob interface to sm=
bios-mdr<a href=3D"https://urldefense.com/v3/__https://github.com/openbmc/s=
mbios-mdr/tree/master/src/smbios-ipmi-blobs__;!!HSntlCg!EtwhV18i5GdJ-OcUFIP=
0uI2ezn8lbBtTEAcWRgPad7EUuOOzOfTVuW4xtvpYjCWU$" data-auth=3D"NotApplicable"=
>&nbsp;https://github.com/openbmc/smbios-mdr/tree/master/src/smbios-ipmi-bl=
obs</a>.
 With this interface you can send the smbios tables to BMC either through L=
inuxBoot or host. The LinuxBoot code&nbsp;<a href=3D"https://urldefense.com=
/v3/__https://github.com/u-root/u-root/tree/master/cmds/exp/smbios_transfer=
__;!!HSntlCg!EtwhV18i5GdJ-OcUFIP0uI2ezn8lbBtTEAcWRgPad7EUuOOzOfTVuW4xtiWmoL=
2X$" data-auth=3D"NotApplicable">https://github.com/u-root/u-root/tree/mast=
er/cmds/exp/smbios_transfer</a>.
 Writing and committing to this blob will generate the MDR header.</div>
<div><br>
</div>
<div>-Jie</div>
</div>
<br>
<div class=3D"x_x_gmail_quote">
<div dir=3D"ltr" class=3D"x_x_gmail_attr">On Thu, Sep 16, 2021 at 4:19 AM T=
hang Nguyen &lt;<a href=3D"mailto:thang@amperemail.onmicrosoft.com" data-au=
th=3D"NotApplicable">thang@amperemail.onmicrosoft.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_x_gmail_quote" style=3D"margin:0px 0px 0px
          0.8ex; border-left:1px solid rgb(204,204,204); padding-left:1ex">
Thanks Tim, Mike and Andrei for very useful information. We can make it <br>
work by adding MDRv2 header.<br>
<br>
I am finding some information about the IPMI blobs commands. I can see <br>
some notes at<br>
<br>
<a href=3D"https://urldefense.com/v3/__https://github.com/openbmc/docs/blob=
/master/designs/binarystore-via-blobs.md__;!!HSntlCg!EtwhV18i5GdJ-OcUFIP0uI=
2ezn8lbBtTEAcWRgPad7EUuOOzOfTVuW4xtoaEVKUv$" data-auth=3D"NotApplicable">ht=
tps://github.com/openbmc/docs/blob/master/designs/binarystore-via-blobs.md<=
/a><br>
<br>
<a href=3D"https://urldefense.com/v3/__https://github.com/openbmc/phosphor-=
ipmi-blobs/blob/master/README.md__;!!HSntlCg!EtwhV18i5GdJ-OcUFIP0uI2ezn8lbB=
tTEAcWRgPad7EUuOOzOfTVuW4xtrf-IcxD$" data-auth=3D"NotApplicable">https://gi=
thub.com/openbmc/phosphor-ipmi-blobs/blob/master/README.md</a><br>
<br>
But I have not found more description about the IPMI blob commands like <br>
NetFn, Func, ... that I can send a file from Host to BMC. Do you have <br>
any information about them?<br>
<br>
<br>
Thanks,<br>
<br>
Thang Q. Nguyen<br>
<br>
On 16/09/2021 09:40, CS20 CHLi30 wrote:<br>
&gt; Hi Thang,<br>
&gt; Did you try to use smbios_entry_point or DMI from host to BMC /var/lib=
/smbios/smbios2 for parsing?<br>
&gt;<br>
&gt; You can refer this sysfs-firmware-dmi-tables as below:<br>
&gt;<br>
&gt; The firmware provides DMI structures as a packed list of data referenc=
ed by a SMBIOS table entry point.<br>
&gt; The SMBIOS entry point contains general information, like SMBIOS versi=
on, DMI table size, etc.<br>
&gt; The structure, content and size of SMBIOS entry point is dependent on =
SMBIOS version.<br>
&gt;<br>
&gt; The format of SMBIOS entry point and DMI structures can be read in SMB=
IOS specification.<br>
&gt; The dmi/tables provides raw SMBIOS entry point and DMI tables through =
sysfs as an alternative to utilities reading them from /dev/mem.<br>
&gt;<br>
&gt; The raw SMBIOS entry point and DMI table are presented as binary attri=
butes and are accessible via:<br>
&gt; /sys/firmware/dmi/tables/smbios_entry_point<br>
&gt; /sys/firmware/dmi/tables/DMI<br>
&gt;<br>
&gt; Best regards,<br>
&gt; Tim<br>
&gt;<br>
&gt; -----Original Message-----<br>
&gt; From: openbmc [mailto:<a href=3D"mailto:openbmc-bounces%2Bchli30" data=
-auth=3D"NotApplicable">openbmc-bounces+chli30</a>=3D<a href=3D"mailto:nuvo=
ton.com@lists.ozlabs.org" data-auth=3D"NotApplicable">nuvoton.com@lists.ozl=
abs.org</a>] On Behalf Of Garrett, Mike (HPE
 Server Firmware)<br>
&gt; Sent: Wednesday, September 15, 2021 9:19 PM<br>
&gt; To: Andrei Kartashev &lt;<a href=3D"mailto:a.kartashev@yadro.com" data=
-auth=3D"NotApplicable">a.kartashev@yadro.com</a>&gt;; Thang Nguyen &lt;<a =
href=3D"mailto:thang@amperemail.onmicrosoft.com" data-auth=3D"NotApplicable=
">thang@amperemail.onmicrosoft.com</a>&gt;; openbmc &lt;<a href=3D"mailto:o=
penbmc@lists.ozlabs.org" data-auth=3D"NotApplicable">openbmc@lists.ozlabs.o=
rg</a>&gt;<br>
&gt; Subject: RE: Read smbios2 file failed<br>
&gt;<br>
&gt; We recently did the same thing and got it working.&nbsp; All you have =
to do is take the RAW smbios records blob in binary form (delivered as note=
d below in whatever way you choose) and prepend a specific header:&nbsp;
<a href=3D"https://urldefense.com/v3/__https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttps*3A*2F*2Fgithub.com*2Fopenbmc*2Fsmbios-mdr*2Fblob*2F=
33c948a473bd273fea0cff82d4c99b70b7784be6*2Finclude*2Fsmbios_mdrv2.hpp*23L11=
4&amp;amp;data=3D04*7C01*7Cchli30*40nuvoton.com*7C81a4bd29e4904bf4d84608d97=
8510b92*7Ca3f24931d4034b4a94f17d83ac638e07*7C0*7C0*7C637673526954552742*7CU=
nknown*7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0*3D*7C1000&amp;amp;sdata=3DoQwcozsSoGlgSFwztPFV3FAoPpRZGYoZ7pc0*2B=
xDi1MA*3D&amp;amp;reserved=3D0__;JSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUl!!HSntlCg!=
EtwhV18i5GdJ-OcUFIP0uI2ezn8lbBtTEAcWRgPad7EUuOOzOfTVuW4xtsg8Gx_y$" data-aut=
h=3D"NotApplicable">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fopenbmc%2Fsmbios-mdr%2Fblob%2F33c948a473bd273fea0cff82d4c99b70b7784be=
6%2Finclude%2Fsmbios_mdrv2.hpp%23L114&amp;amp;data=3D04%7C01%7Cchli30%40nuv=
oton.com%7C81a4bd29e4904bf4d84608d978510b92%7Ca3f24931d4034b4a94f17d83ac638=
e07%7C0%7C0%7C637673526954552742%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
AiLCJQIjo
 iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DoQwcozsSoGl=
gSFwztPFV3FAoPpRZGYoZ7pc0%2BxDi1MA%3D&amp;amp;reserved=3D0</a><br>
&gt;<br>
&gt; It is a little bit fragile as it introduces a dependency on the file d=
ownload logic to write a non-standard header defined in another service tha=
t could potentially change.<br>
&gt;<br>
&gt; Mike<br>
&gt;<br>
&gt;&gt; -----Original Message-----<br>
&gt;&gt; From: openbmc &lt;openbmc-<br>
&gt;&gt; bounces+mike.garrett=3D<a href=3D"mailto:hpe.com@lists.ozlabs.org"=
 data-auth=3D"NotApplicable">hpe.com@lists.ozlabs.org</a>&gt; On Behalf Of =
Andrei<br>
&gt;&gt; Kartashev<br>
&gt;&gt; Sent: Wednesday, September 15, 2021 3:17 AM<br>
&gt;&gt; To: Thang Nguyen &lt;<a href=3D"mailto:thang@amperemail.onmicrosof=
t.com" data-auth=3D"NotApplicable">thang@amperemail.onmicrosoft.com</a>&gt;=
; openbmc<br>
&gt;&gt; &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" data-auth=3D"NotAp=
plicable">openbmc@lists.ozlabs.org</a>&gt;<br>
&gt;&gt; Subject: Re: Read smbios2 file failed<br>
&gt;&gt;<br>
&gt;&gt; I don't know what is format of &quot;dmidecode --dump-bin&quot;, b=
ut if it just<br>
&gt;&gt; raw dump of smbios then you only need to add mdr header.<br>
&gt;&gt;<br>
&gt;&gt; See answer for the same question here:<br>
&gt;&gt; INVALID URI REMOVED<br>
&gt;&gt; 021-July/026882.html__;!!NpxR!2w0FkPs2KyaB6XOvB8et52bWKqAMLImmL-<b=
r>
&gt;&gt; iUk9A_zZbJ8WLhMeXdvRAp-pcxt8Q$<br>
&gt;&gt;<br>
&gt;&gt; On Wed, 2021-09-15 at 12:41 +0700, Thang Nguyen wrote:<br>
&gt;&gt;&gt; Hi Andrei,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I see output of &quot;dmidecode --dump-bin&quot; follows SMBIO=
S specification.<br>
&gt;&gt;&gt; As<br>
&gt;&gt;&gt; the data for smbios-mdr does not follow this, do you know abou=
t the<br>
&gt;&gt;&gt; document or any information I can reference to prepare data to=
 send<br>
&gt;&gt;&gt; to BMC??<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Best Regards,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thang Q. Nguyen<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 14/09/2021 15:51, Andrei Kartashev wrote:<br>
&gt;&gt;&gt;&gt; No, it is not same as &quot;dmidecode --dump-bin&quot;.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On Tue, 2021-09-14 at 13:46 +0700, Thang Nguyen wrote:<br>
&gt;&gt;&gt;&gt;&gt; On 13/09/2021 23:56, Andrei Kartashev wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; You need to somehow deliver smbios data image to B=
MC. This<br>
&gt;&gt;&gt;&gt;&gt;&gt; means, your BIOS should implementat some logic to =
transfer<br>
&gt;&gt;&gt;&gt;&gt;&gt; this data.<br>
&gt;&gt;&gt;&gt;&gt;&gt; For BMC side see example here:<br>
&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://urldefense.com/v3/__https://apc=
01.safelinks.protection.outlook.com/?url=3Dhttps*3A*2__;JSU!!HSntlCg!EtwhV1=
8i5GdJ-OcUFIP0uI2ezn8lbBtTEAcWRgPad7EUuOOzOfTVuW4xtgGDlRqi$" data-auth=3D"N=
otApplicable">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2</a><br>
&gt;&gt;&gt;&gt;&gt;&gt; F%2Fgithub.com%2Fopenbmc%2Fintel-ipmi-&amp;amp;dat=
a=3D04%7C01%7Cchli<br>
&gt;&gt;&gt;&gt;&gt;&gt; 30%<a href=3D"https://urldefense.com/v3/__http://4=
0nuvoton.com__;!!HSntlCg!EtwhV18i5GdJ-OcUFIP0uI2ezn8lbBtTEAcWRgPad7EUuOOzOf=
TVuW4xthWsemHr$" data-auth=3D"NotApplicable">40nuvoton.com</a>%7C81a4bd29e4=
904bf4d84608d978510b92%7Ca3f24931<br>
&gt;&gt;&gt;&gt;&gt;&gt; d4034b4a94f17d83ac638e07%7C0%7C0%7C637673526954552=
742%7CUnknow<br>
&gt;&gt;&gt;&gt;&gt;&gt; n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz=
IiLCJBTiI6Ik<br>
&gt;&gt;&gt;&gt;&gt;&gt; 1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DcG6ZZz=
OSXkuUtcQuuoymsRdP<br>
&gt;&gt;&gt;&gt;&gt;&gt; p24mINa%2FhCy%2BYhe%2FNmk%3D&amp;amp;reserved=3D0<=
br>
&gt;&gt; oem/blob/master/src/smbios<br>
&gt;&gt;&gt;&gt;&gt;&gt; mdrv2handler.cpp<br>
&gt;&gt;&gt;&gt;&gt; Hi Andrei,<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; What is the format of smbios data to transfer to BMC? =
Is it the<br>
&gt;&gt;&gt;&gt;&gt; same content of &quot;dmidecode --dump-bin&quot; comma=
nd from Host Linux?<br>
&gt;&gt; or<br>
&gt;&gt;&gt;&gt;&gt; anything special in formatting the content to send?<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; On Mon, 2021-09-13 at 17:40 +0300, Alexander Raih =
wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Hi guys, I am beginner in openbmc I build open=
bmc with<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; smbios-mdr repository and I have error:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Read data from flash error - Open MDRV2 table =
file failure<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; There isnt file in /var/lib/smbios/smbios2<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; How I can resolve this problem?<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Help me please!!!<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Best regards,<br>
&gt;&gt; Andrei Kartashev<br>
&gt;&gt;<br>
&gt; ________________________________<br>
&gt; ________________________________<br>
&gt;&nbsp; &nbsp;The privileged confidential information contained in this =
email is intended for use only by the addressees as indicated by the origin=
al sender of this email. If you are not the addressee indicated in this ema=
il or are not responsible for delivery of the
 email to such a person, please kindly reply to the sender indicating this =
fact and delete all copies of it from your computer and network server imme=
diately. Your cooperation is highly appreciated. It is advised that any una=
uthorized use of confidential information
 of Nuvoton is strictly prohibited; and any information in this email irrel=
evant to the official business of Nuvoton shall be deemed as neither given =
nor endorsed by Nuvoton.<br>
</blockquote>
</div>
</blockquote>
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

--_000_DM6PR08MB55145B920E9C7A1509BE9BE2DC709DM6PR08MB5514namp_--
