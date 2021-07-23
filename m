Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC13B3D38FC
	for <lists+openbmc@lfdr.de>; Fri, 23 Jul 2021 13:01:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWRFY45q8z30Hl
	for <lists+openbmc@lfdr.de>; Fri, 23 Jul 2021 21:01:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=oSqruLMn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.132.180.100;
 helo=mx07-002d6701.pphosted.com;
 envelope-from=prvs=1838c9b1e2=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=oSqruLMn; dkim-atps=neutral
X-Greylist: delayed 1912 seconds by postgrey-1.36 at boromir;
 Fri, 23 Jul 2021 21:00:42 AEST
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com
 [185.132.180.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWRF64BH6z302X
 for <openbmc@lists.ozlabs.org>; Fri, 23 Jul 2021 21:00:40 +1000 (AEST)
Received: from pps.filterd (m0132504.ppops.net [127.0.0.1])
 by mx07-002d6701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16NACUM1031271
 for <openbmc@lists.ozlabs.org>; Fri, 23 Jul 2021 10:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=dkim;
 bh=PZp4IZa1qtYapeYqPxchiO2QoEIXrNuGWIY25mHOGS8=;
 b=oSqruLMnjClGky9giJlMJMmWBhclUUt/TW9KNTNVzB8fXRePK/bAm9gIFVDD51On8tCf
 ExEhbFuwD7AWBKGzpUvuIkC+VZ/2evDnAcf/cw9v/QQo3lp/p9S0wpTQJfkoRz3jhYMD
 t9/qRSCG7g6/G8Ag96lMVRNOuXmdCLSBWcI3U//zbbRJCEv97zruglGnP5oINM4NXqvV
 mHa1Vi987D92fpZ779zlmA045wCGQ6nZ/VoX6geAfkPO9wpsIo0l4ChRHhXwIM6c6cuR
 0kUJnKolLEr4uyBXCITGUN602MoMMtJLukfiVkENLYw+up5x1wFRZwj5l2DIdO62vROQ Yw== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by mx07-002d6701.pphosted.com with ESMTP id 39xw4hrqe6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 23 Jul 2021 10:28:44 +0000
Received: from DM5PR18CA0079.namprd18.prod.outlook.com (2603:10b6:3:3::17) by
 DM5PR0801MB3718.namprd08.prod.outlook.com (2603:10b6:4:77::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.26; Fri, 23 Jul 2021 10:28:41 +0000
Received: from DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:3:cafe::2f) by DM5PR18CA0079.outlook.office365.com
 (2603:10b6:3:3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend
 Transport; Fri, 23 Jul 2021 10:28:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.23)
 smtp.mailfrom=flex.com; lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=fail action=oreject
 header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.23 as permitted sender) receiver=protection.outlook.com; 
 client-ip=144.49.247.23; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.23) by
 DM6NAM11FT046.mail.protection.outlook.com (10.13.172.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Fri, 23 Jul 2021 10:28:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SfLAP9ZK4k004PG1RnHyhR2Iy5tSSjHJMmaBEVMVubNc3yNa1qWqGOE7UDS+SqBTAlJFxbXEMxf5z/PJQV394TefANbkxzqfPIHrS0bqKg3/cjXZIxO5iQQ3GDW0lfNI5z2A50DuPW6ooNnqDb5buYjkMF6ffpNj8Djj1m1h4KtZpVdhrQ0WxCa+gLGLUG2KmTg0+EzjDB4VGgD/ZOABh9auxpylzcrPY2kFE44Jy/TFn5E0I5V0WMpRml1FSuLIPxnENjiyhfZznJruOxV6wLwtKbC1sn8p7Bn6RfXIpdNRn4Q4r1x4Ayq9tYeXquJ6ncnRpG2StCJLXkwQvvpRKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oMN3E85++J56tBVYM6PQUGQN+ppEBYVo6qDnK6IECRI=;
 b=eiyvAOxakrEe60SacHl9132khFOECoCcG6a1Ds1jIUCFR1tOU4d4d9nFy3U8U0WVEhk5mtnpOTP35u3kg24vAtwP8gezBVD76AdOr7kmAV1nfXSdy4yvJvFcBal5dCvbmjOsLWIhB8GTOAcEMNou+LDDrG32tl2n4aVzPkv6rbar2v9fqkY/V/Y6lc2VZtqfB30OC/zCrBoaU6XCTAfTsBCXUbLLKeFxcnoXMK8GkVgmNdaMWrqz4V7PwC68mhWYgv6/B6HgUwg4YHarQj+LvccMRdYVT1OguWfmR0rzlL3lFX4/TCF9rMdeJr1nxDWLDHrfgqUnamVn7C+gukH4MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by DM6PR08MB6041.namprd08.prod.outlook.com (2603:10b6:5:110::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Fri, 23 Jul
 2021 10:28:39 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::8167:8105:865f:8efe]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::8167:8105:865f:8efe%3]) with mapi id 15.20.4331.034; Fri, 23 Jul 2021
 10:28:39 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [x86-power-control]: press the power button for a long time that
 can't force turn off system power
Thread-Topic: [x86-power-control]: press the power button for a long time that
 can't force turn off system power
Thread-Index: AQHXf6gYYJZb/HtYO0+mc2S9Lrz5zA==
Date: Fri, 23 Jul 2021 10:28:39 +0000
Message-ID: <DM6PR08MB55145CD3DC0AD96D30B70771DCE59@DM6PR08MB5514.namprd08.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=flex.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 58857333-f6fd-4a79-b762-08d94dc4a411
x-ms-traffictypediagnostic: DM6PR08MB6041:|DM5PR0801MB3718:
X-Microsoft-Antispam-PRVS: <DM5PR0801MB37183D5682D3E68BE0F96F99DCE59@DM5PR0801MB3718.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: xkJAAgEAXhMGnXQQBS4tHRQCT7MXKTmlZN5gKdMpgjb6wvAYEmviaYCdGc+GPFYv5hf+BdIuCmMSqUPCW48CzVaiaLNmX+U/K81FhpkWtmLRo0aQRjzH6TnYB0207NJTgqyYiqzVNbgiySgyUvlImaimvFkSmuKZHu/SzTSuzbsOlkcDmoBeaJMO2+7tmc+k69QoTuNyCdaVuDnmuRp1t7kZmwvM6H5Ieq+IdK5IU4eWTQxwQR9p/1m7ZsltlIZgGF0iamMbmI2pB3B+y+hONyRRkqweYtrZXH9QgzPhbQ+9mAKgRae27EIXfphWn9Cn5jwEHTv/uaPbslagxd/FwWgnAdKHi1SlBhSJHkRIW38P/METaHMreyCvhiZT0bIA+oHJgi2GDVq5jzOcjy1dTXOsTDenYyl5iGcJyRmwZb4uVG9LwHDTdPbdtaiflLtzg99CUw0Ab2W2Y/y7TAPdRu7gQ7CiFa3O+oZdwtKYg9Lab0FrfusjZgXPYZfZHwketxViBRnWg+W1MhVxOEVS7BqhSGRNjV5K45tF/S2NxVkofdW+HewMY33Dq+HtW876CD8zJRfWPAK/5S1vco/Ir57T9t5Lx8TgP2lZNilHhrdMEvn9SgGdesP8087qTqxepDUql7gjp/qIDDhav1fniZiJU7uCWlQ5nxo90FsEAJDv2A2Er5HJJkgFtkUsJGJRIRaQJWYFKrX6bZdnDxbdfQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5514.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(366004)(71200400001)(186003)(508600001)(91956017)(76116006)(8936002)(52536014)(5660300002)(66556008)(66476007)(66446008)(66946007)(8676002)(9686003)(55016002)(26005)(64756008)(33656002)(6916009)(122000001)(316002)(6506007)(86362001)(2906002)(38100700002)(7696005)(19627405001)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?bUwrWVNobWN6Q3dhdWFuNkN4ajEwa0ZQbzJyWEhXTHpmY3BtU2VEMUpVRTdHNUVy?=
 =?big5?B?OHV3akVSZFJuRHhsT2JHNnIzREEzV2xiQkViYmlmTjl0TFJxWGFVK0dHbVkySTVw?=
 =?big5?B?STBPbm5CNkcyV0kyakxxSStia3hHOUJIVlhCcmlOWWFwY3NUNHprWXB0TW1ySjF2?=
 =?big5?B?VjZXck5udXEwL1VjSXZ1cHFCUHNpdllGSElFV2JJelFJaEk3OC9mdmxXdTAyRDkv?=
 =?big5?B?TlQ3Q004c0N5R1RvbkppYTJ5VXlDV2RhNUVaYUhHSTdRQnJJRnlVVXVaSFU4cmlp?=
 =?big5?B?Ris4NitNUkh5K1Q2MTFsbkZPZm1TUVBpSWpKbld6TUNkVFltYVMzTWI5SkNGTjQx?=
 =?big5?B?SmsxaFYxRmFNa1YyRmZVbXBrbnRhRTJ1VXAvYkJyRlhXd0piUXFYS2dFckF6cjVS?=
 =?big5?B?NEhkUWJaVTFUbkZTbUxTdzlLWWtvTmlHUnFTNWljek5reldHZkRYYkRZMTdWaHVS?=
 =?big5?B?QXFXcS94RkJmYXBWeWwwY1V4bzRpNTlkS3VRemNCbG90T0FyVUhPSkUxeldEbDJQ?=
 =?big5?B?UFlMY0ZoS2pVYVVvdVBJSEd0WUoxbk0wdnJpNnhIeHZKUnY4V01JQXVoWXRtWnFX?=
 =?big5?B?TnFoU2VCcUJXakVPZnVnVEV0Rzd5d3hNZ3Y2d05RVDc3Z3lERFU4UzR5dStnWnpn?=
 =?big5?B?US9hRVR6WEhTYVExZjlGR1hEVC9RTk9PeDZLeHMyZkRrWm5YaWtPdjN1RGRONFdo?=
 =?big5?B?ZE1xUVozdkdCc21zd1ZpYU9tSkxLRUhsWTR2Wk1sV3llY2hPdXZHSFRCaWVhTDM2?=
 =?big5?B?bjdyM0pKQSt0TVNNSnZTUk9SWiswaWNvK1B6a2hzQkpTZWc3bkF6dExVNGQyTHY2?=
 =?big5?B?QW90VmpDdlZKZ3ZnbnVNNlpwdDFCcnRiUVZabEVzRE9ucHZrVlVsQ1NRY003WGl6?=
 =?big5?B?aVF4RTVXSzIxR21QZmx5c3JmMTB4UWdxemJJLzRRdGJvTDlIR3hEUGpsWDFWbFNG?=
 =?big5?B?Uk9zL1NCR1I5VjlJNHRrdnZlMkFUbTlWdGZ0VTBGNkxqZGI3UjVLazF4MldkOE01?=
 =?big5?B?eEk2alcvKytoOW04UktFN05ZUjErdlAzYUlsc21xL1hKVFlwUU1jNTNvK2lNRkd0?=
 =?big5?B?WW1PR2drV1dBR1QwckpTNkNCd1djWDZldnRPSC9INVlnYm1DckVIdERkY3k4V25T?=
 =?big5?B?ZXJmTmovYWJGVWdWdDhBcjFXRjNLN2hGb1dITG1lQnhvS1JQUm82WHRpb1pER0Nh?=
 =?big5?B?VVI0anh4ajNZT0tiQTdjYkp2NUMxb0h5SUZVcmQ1ekN5ajJ3NlVPUXFlckRBaUVz?=
 =?big5?B?bDFtMFcreEp0MnYrU1NTZW5aR1NPeVAvc1JKMVhhclV3dVBxLzh4R3JlUXdZaVpQ?=
 =?big5?B?V3JFYVhwVTV6cEhtTXYrMXlzODhxaVdSL1ZKdmNuZytxS2VqVWtzMmtWTTZOMFBS?=
 =?big5?B?RlYzTVdQY1JFQVhNcCt2VTRvVHM3ZmRHaUg4N0VjNll2eFNaWCtWNTVSK0lKWG9Q?=
 =?big5?B?WVZzRThXNEdFV01FdHBiR2hCWnI2Z3VUS3NjM1FwSTF4MDJzQ3pYV3ViQmdQNEcz?=
 =?big5?B?N1cyaWp3d0VSSUY1bFpyZ0lVdlhzOVc3c3UwZW92OWFjMHhNb0V3UElXdG9oU3pR?=
 =?big5?B?aVBtV25jK1Y0Qjh3Nlk4empuZ3d1ZVBCVzcxcHBUOGw3MDBySVNUWlg0L0prNFZw?=
 =?big5?Q?Bad5YaFq3/jBDsTv7n4bFT+cgD0=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB55145CD3DC0AD96D30B70771DCE59DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB6041
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: f76488f3-0076-43bf-e9d9-08d94dc4a31a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zjh/CsdjOdgR3WSpDLm9n47ekcBNXHdumDnyKMnolcX0G/V6CWMRzSYZku5jGRO/MCmYk8k7W1k5IM2N631S5V/q7ffZkpLvn0FqnOTyx8OHLfUo+fB/c+uJIbVztvMNxL9LwL64i9zWkny2oDLoFAPhyjL8oKkNT8MNAAAro0G57h5RL2Rh3duNAQEwnUT8cEsFj7mIQ5M3ahzuDvyUPBQO8wUpmWSsH/YkDGoaFpNBml//thugyoDTcYW4bnBYy1WPhw79N5wivgRRoL+yUyTkn7IbNPSyDUoUHJMaw3HdTZkfWq3qapxGNvKPMAfPkvEbBiZj5pGkR8e5YuRc4wDXNUApSk23hA6iAlF6fkHeuBdjvv3RkojR5tpwyLOu26XSMSfgh4i3t18bTp7nosXPGPwoJ7F9eGByKFVPu9hYVN6peVxfw3e2ThnkiEaUVlDpH9S+9yqdakjTInnCzH+zVA/CgsB67efw8xTkK9mA/50zirqL49aWZuqtQRSOMnYXX/11W5Rq1m5Y9maTsAwGtd2uXdph691+00RPLoJfRaYBOHKUM7+u8eo+k704E4JTvYW8QqOp3aHNXFLbdh99Vz08sVgoOuOselU6oOdvTlPUGUYzWoInOJMc+SlHjeSdMVcdj2i2VG2n3Cg7qmXrhbOQLrR3YZKSq1iHUHnuqHfgvFi+R/Js0aB53Sabw+wVlWWgaoL9rnDkoLhL+s+IK1bPeyAvHe+HUFmbirA=
X-Forefront-Antispam-Report: CIP:144.49.247.23; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(376002)(39860400002)(346002)(396003)(136003)(36840700001)(46966006)(316002)(82310400003)(47076005)(82740400003)(478600001)(8676002)(70586007)(52536014)(186003)(336012)(81166007)(86362001)(26005)(6916009)(55016002)(7696005)(9686003)(6506007)(70206006)(19627405001)(4186021)(356005)(8936002)(33656002)(5660300002)(36860700001)(2906002)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 10:28:40.9530 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58857333-f6fd-4a79-b762-08d94dc4a411
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.23];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0801MB3718
X-Proofpoint-GUID: K6oVM5t1O2B3VbBbjgaiux-hdqsZGmPQ
X-Proofpoint-ORIG-GUID: K6oVM5t1O2B3VbBbjgaiux-hdqsZGmPQ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-23_04:2021-07-23,
 2021-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=763 suspectscore=0 adultscore=0 lowpriorityscore=0
 mlxscore=0 priorityscore=1501 clxscore=1011 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107230059
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

--_000_DM6PR08MB55145CD3DC0AD96D30B70771DCE59DM6PR08MB5514namp_
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="big5"

SGkgYWxsLA0KDQpJIGFtIHdvcmtpbmcgb24gYW4gYXN0MjYwMCB3aXRoIEludGVsIENQVS4NClRo
ZSBzeXN0ZW0gcG93ZXIgY3VycmVudGx5IGlzIGFibGUgdG8gdHVybiBvbiBkdXJpbmcgUGhvc3Bo
b3IgT3BlbkJNQyBib290IHVwIGFmdGVyIEkgY29tcGxldGVkIHdvcmtzIGZvbGxvd2luZzoNCg0K
ICAxLiAgZW5hYmxlIEFDUEkgaW4gdS1ib290DQogIDIuICBzZXQgR1BJT1AwIH4gUDMgcGFzcy10
aHJvdWdoIGluIHUtYm9vdA0KICAzLiAgcG9ydGluZyBFU1BJIGRyaXZlciBmcm9tIEFTVCBTREsg
djYuMDEgdG8gbGludXgtYXNwZWVkIHJlcG9zaXRvcnkNCiAgNC4gIGFkZCAiJmdwaW8wIiB3aXRo
IGdwaW8tbGluZS1uYW1lcyB3aGljaCBoYXMgUE9XRVJfQlVUVE9OLCBQT1dFUl9PVVQsIFNJT19T
MywgU0lPX1M1LCBldGMuIGRlZmludGlvbiBpbiB0aGUgZHRzLCBJIHRoaW5rIHRoZSAieDg2LXBv
d2VyLWNvbnRyb2wiIHJlcG9zaXRvcnkgcmVxdWlyZWQgdGhlc2UuDQogIDUuICBhcHBlbmQgIng4
Ni1wb3dlci1jb250cm9sIiBhbmQgImludGVsLWlwbWktb2VtIiByZXBvc2l0b3JpZXMgdG8gaW1h
Z2UNCg0KSG93ZXZlciwgSSBhbHdheXMgb25seSBnb3QgdGhlIGZvbGxvd2luZyBsb2dzIHdoZW4g
SSBwcmVzc2VkIHRoZSBwb3dlciBidXR0b24gZm9yIGEgbG9uZyB0aW1lICg+IDRzKS4NCj09PT09
DQpwb3dlci1jb250cm9sWzI2M106IFBvd2VyQ29udHJvbDogcG93ZXIgYnV0dG9uIHByZXNzZWQN
CnBvd2VyLWNvbnRyb2xbMjYzXTogcG93ZXJTdGF0ZU9uOiBwb3dlciBidXR0b24gcHJlc3NlZCBl
dmVudCByZWNlaXZlZA0KcG93ZXItY29udHJvbFsyNjNdOiBIb3N0MDogTW92aW5nIHRvICJHcmFj
ZWZ1bCBUcmFuc2l0aW9uIHRvIE9mZiIgc3RhdGUNCnBvd2VyLWNvbnRyb2xbMjYzXTogR3JhY2Vm
dWwgcG93ZXItb2ZmIHRpbWVyIHN0YXJ0ZWQNCj09PT09DQoNCkl0IGRvZXNuJ3Qgb2NjdXIgIlNJ
T19PTkNPTlRST0wgdmFsdWUgY2hhbmdlZDogMSAtPiBTSU8gcG93ZXIgZ29vZCBkZS1hc3NlcnQg
ZXZlbnQgcmVjZWl2ZWQiLCBldGMuIG9wZXJhdGlvbnMgYW5kIHRoZW4gdG8gdHVybiBvZmYgdGhl
IHBvd2VyLg0KDQpDYW4gYW55b25lIGRvIG1lIGEgZmF2b3IgdG8gZ2l2ZSBtZSBzb21lIGNsdWVz
IGZvciB3aGF0IEkgd2FzIHdyb25nPw0KDQoNClRoYW5rIHlvdSBpbiBhZHZhbmNlIGZvciB5b3Vy
IGhlbHAuDQoNClJlZ2FyZHMsDQpDaHJpcyBDaGVuDQoNCgpMZWdhbCBEaXNjbGFpbWVyIDoKVGhl
IGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIG1lc3NhZ2UgbWF5IGJlIHByaXZpbGVnZWQg
YW5kIGNvbmZpZGVudGlhbC4gCkl0IGlzIGludGVuZGVkIHRvIGJlIHJlYWQgb25seSBieSB0aGUg
aW5kaXZpZHVhbCBvciBlbnRpdHkgdG8gd2hvbSBpdCBpcyBhZGRyZXNzZWQgCm9yIGJ5IHRoZWly
IGRlc2lnbmVlLiBJZiB0aGUgcmVhZGVyIG9mIHRoaXMgbWVzc2FnZSBpcyBub3QgdGhlIGludGVu
ZGVkIHJlY2lwaWVudCwgCnlvdSBhcmUgb24gbm90aWNlIHRoYXQgYW55IGRpc3RyaWJ1dGlvbiBv
ZiB0aGlzIG1lc3NhZ2UsIGluIGFueSBmb3JtLCAKaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4gSWYg
eW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGluIGVycm9yLCAKcGxlYXNlIGltbWVkaWF0
ZWx5IG5vdGlmeSB0aGUgc2VuZGVyIGFuZCBkZWxldGUgb3IgZGVzdHJveSBhbnkgY29weSBvZiB0
aGlzIG1lc3NhZ2UhCg==

--_000_DM6PR08MB55145CD3DC0AD96D30B70771DCE59DM6PR08MB5514namp_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="big5"

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi all,&nbsp;</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
I am working on an ast2600 with Intel CPU.&nbsp;</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">The system power currently is able to turn o=
n during Phosphor OpenBMC boot up after I completed works following:</span>=
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<ol>
<li>enable ACPI in u-boot</li><li>set GPIOP0 ~ P3 pass-through in u-boot</l=
i><li>porting ESPI driver from AST SDK v6.01 to linux-aspeed repository</li=
><li>add &quot;&amp;gpio0&quot; with gpio-line-names which has POWER_BUTTON=
, POWER_OUT, SIO_S3, SIO_S5, etc. defintion in the dts, I think the &quot;x=
86-power-control&quot; repository required these.</li><li>append &quot;x86-=
power-control&quot; and &quot;intel-ipmi-oem&quot; repositories to image</l=
i></ol>
<div>However, I always only got the following logs when I pressed the power=
 button for a long time (&gt; 4s).</div>
<div>=3D=3D=3D=3D=3D</div>
<div>power-control[263]: PowerControl: power button pressed
<div>power-control[263]: powerStateOn: power button pressed event received<=
/div>
<div>power-control[263]: Host0: Moving to &quot;Graceful Transition to Off&=
quot; state</div>
power-control[263]: Graceful power-off timer started<br>
</div>
<div>=3D=3D=3D=3D=3D</div>
<div><br>
</div>
<div>It doesn't occur &quot;SIO_ONCONTROL value changed: 1 -&gt; SIO power =
good de-assert event received&quot;, etc. operations and then to turn off t=
he power.</div>
<div><br>
</div>
<div>Can anyone do me a favor to give me some clues for what I was wrong?</=
div>
<div><br>
</div>
<div><br>
</div>
<div>Thank you in advance for your help.</div>
<div><br>
<div>Regards,</div>
Chris Chen<br>
</div>
<div><br>
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

--_000_DM6PR08MB55145CD3DC0AD96D30B70771DCE59DM6PR08MB5514namp_--
