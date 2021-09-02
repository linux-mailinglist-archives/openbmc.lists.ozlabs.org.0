Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7710C3FEC34
	for <lists+openbmc@lfdr.de>; Thu,  2 Sep 2021 12:35:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0clB201mz2yPd
	for <lists+openbmc@lfdr.de>; Thu,  2 Sep 2021 20:35:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=VNyY0AP1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.132.180.100;
 helo=mx07-002d6701.pphosted.com;
 envelope-from=prvs=38791185db=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=VNyY0AP1; dkim-atps=neutral
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com
 [185.132.180.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0ckc6lLjz2y0C
 for <openbmc@lists.ozlabs.org>; Thu,  2 Sep 2021 20:35:01 +1000 (AEST)
Received: from pps.filterd (m0132505.ppops.net [127.0.0.1])
 by mx07-002d6701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 182ASXxR024632
 for <openbmc@lists.ozlabs.org>; Thu, 2 Sep 2021 10:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=dkim;
 bh=S58FCg2/Zkt0aBduL/z+AmzglyP3Sta17mQJrs8lWtk=;
 b=VNyY0AP1vREh0RwdHT7hWqa9LkeYbJZZaDMJ3IoTE2VaNBXs9Eb+wnX+1sQe9C4Uyms0
 qE0Pdq8+x+JLoKY6D+rpIW+3yPnRJmvwDHfphu++OIFuSoE7nTrGcb8mBc+6XpBiR3pb
 c4L1aCuPw8UYsjkyVF9nvk+pIefBi81Rh6fB3f3KEnqNLcvY7ZBiFcBYDUXMWR2EO7OC
 f/oS4nfDHlwnZojbF+574NVknFZmDR0dGFkoIhhANxv5oXQsqFcswsXzETGuU3rjRanz
 rt93QPCScNwPupi/Ug+yeINCQS5Tfuwpgg/tNabjsX4m6iserz26QzZy3ILzxjMxtEkS tw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
 by mx07-002d6701.pphosted.com with ESMTP id 3atff13wdj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 02 Sep 2021 10:34:57 +0000
Received: from BN8PR15CA0005.namprd15.prod.outlook.com (2603:10b6:408:c0::18)
 by BYAPR08MB5192.namprd08.prod.outlook.com (2603:10b6:a03:68::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Thu, 2 Sep
 2021 10:34:54 +0000
Received: from BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:c0:cafe::9a) by BN8PR15CA0005.outlook.office365.com
 (2603:10b6:408:c0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Thu, 2 Sep 2021 10:34:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.19)
 smtp.mailfrom=flex.com; lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=fail action=oreject
 header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.19 as permitted sender) receiver=protection.outlook.com; 
 client-ip=144.49.247.19; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.19) by
 BN8NAM11FT029.mail.protection.outlook.com (10.13.177.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 10:34:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X76T12gGAh9HSihmU57Le8mgEJp4V5P3E6E1erFhA37ZfYNMsbANKgZvmEfsJ/X/XJcgCMSe0eZKCWahgJtrKcfMVQR0X3ocdfgFnh+y4w79jphLRFn0IiUb0C2AMcIZx55omuKp0diGKQ8XOh/HGHQZLTHbW+mPsElyVvt4DrjSd1a+2gA9ay4uOBvY6NIUd2JZSZ6e/1UyQ+CcAmz2NiDDWqtWYxHfoh2WboPyFzvBs5LAnUHyjqppZZqE6h9nSo0A6Ix3h3Z0D78HxbTwXXV3jXAjIzXeAeJzu0qb9e8gk2lJYNJeQA071hCmPC3v6etzAWH4BxInCBgQ/pvPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=eRAxF9uLJNPULQFV5OOAJK16vY4ywHaEeEZgq0MrsvY=;
 b=aZQhVyTVkVZLgQUJXVrfFC4IAFrU2UBkirtwe0rxI9XmLfIL82a6L+WKyfhSvybkUdzAZuKSC+WVlTckkFLoU4bNtBi0k9N6/cEpHpQ79TzoDlaon6SOj4onP1fwnHxFkxo0wgBQVxpGdrcuZtzhNQSXzvfL/XaGeU4ll66/TPvIl84N95fGy9IsEqcYaQPdQBmkW/7Lif2HrCkkK/Tn+kx7a8GgbPdt6dLvsQ4Yr98dhB09+xRE47RZWVZCF02U7DuvO45CNxZ9bycplx834t1CxFVIaPeytwFEQXKCoVaKD3HXup9cCYbQdGVcErvOlhZF4ObMHvKI6GTgT+tezQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by DM6PR08MB4266.namprd08.prod.outlook.com (2603:10b6:5:9e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 10:34:50 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac%3]) with mapi id 15.20.4457.024; Thu, 2 Sep 2021
 10:34:50 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [phosphor-host-ipmid] Questions about IPMI (OEM) command development
Thread-Topic: [phosphor-host-ipmid] Questions about IPMI (OEM) command
 development
Thread-Index: AQHXn55HfvXlhYxihUiF8XEtvcIIKw==
Date: Thu, 2 Sep 2021 10:34:50 +0000
Message-ID: <DM6PR08MB5514D818A3029FA77BFB523BDCCE9@DM6PR08MB5514.namprd08.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=flex.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 7a3ca31f-d3e7-476e-add1-08d96dfd4cfa
x-ms-traffictypediagnostic: DM6PR08MB4266:|BYAPR08MB5192:
X-Microsoft-Antispam-PRVS: <BYAPR08MB5192B96DFDA12C499071A8E8DCCE9@BYAPR08MB5192.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 0QuJSWz7lNV5h1Ez2pBLkfPzqYF+U3BMrPXM5EHCmYej9opldnUsHt0Gqbm8WzN7sq/XMXhdt1/xNfGO7FlMWcBPGNMYYFT1MPhJMB34TSl/HD+h25vf4Hww142PqxTFdzOSvOsNG+QnEYm2L9UF1QBIf92wGUS0s7GOTE3HHQSsWObL4nkXiJBvYvhhgODPkjynvv2zgOdCW/HewN4QCZBj6jczV2TqkvUlZnJSGuWafBAJIlWOxtUf7/17HRxPZtw61i4Zenr8MZzZbX+NawBvBcgULY+7C5yG7i+DG8AwrQnrAZO67TPd/1LKj/Y7WldgOno0oxQ8QqCwJfiBFLe/Bjh515PJu5jsz6fgIfucXF60jX/toqvQ4CVnzeNczZ/m4BuRHkbvC8Mfcz43PkdWOP1Rn2JV5Z6dazkkX9FxUQqdIutjvJDuphgTAwfYYSDoX23iRs+5oaaeUBMh6TClb9TJ8DU4VBpACrsaZ6oNOpK8Z0NzWD3WPAbBrumhVeaO9XBQMchr5R2WbI2kr+nuCaA+E0wFG4LAAM8/cjYJwh9qnovReHBrulWNiRrRjPNZLLsiwjrv37LjkqD9GY0WSu3ClyhEKHp9dWqHykuakNAvVriy2Tk7lRUNOtNOhHR5cXNBpr3+E9td0L2yNXxygHJDA6j5P7Qa/EfaN+iqWGi+Kp9owMoQeFBE5TaSZ6PN1s5D+U5eqj6WLyJU2KhuGJvQglyZZ8xDP0k5A2c=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5514.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(366004)(316002)(6916009)(64756008)(66446008)(66556008)(66476007)(38100700002)(8936002)(71200400001)(186003)(33656002)(9686003)(6506007)(86362001)(55016002)(19627405001)(2906002)(508600001)(5660300002)(8676002)(52536014)(91956017)(76116006)(122000001)(66946007)(38070700005)(7696005)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?d0NQYjduUWxGMTNyK014VFQ1Zk40WFVjb3I1eHlVWm9mNDFpMlJ2KzVOamVTbGJi?=
 =?big5?B?YmFocFkvZU0rdDhIOElxVEE0VGMxU2pVZ0NVS3FXZXFOcE5PWCtUTDN2eWJ5dDA5?=
 =?big5?B?bnp0R295SzNGa2xQZy9FNWpySVVKQ0xsZThjODhUYmZFZmFnL3JoaTZNWU5WbW42?=
 =?big5?B?cmc5UlMxRlE1UWRxWUhnTmM1UHNEL2Y1eWdRNUpWR0l1Y2cwT2EyY2ZMeHRYd2NL?=
 =?big5?B?UDZCM3lZOFlYSkNPS3U0OXJmSVNtYWpDU1kycEgrUjJ0c1ZCdmhDa1c0R2hXZVpQ?=
 =?big5?B?WFZzcnF2ek8xdmp2eXovS2VPSTJRV2VPbzhHak9jUFU0WmlST28rTmdwOEJQTlhQ?=
 =?big5?B?T2VPQitWMUVldWo4dXkrcU9OSkdweHNjYkVzZzhCaGhHaTBpL1NqR09YOTh5bm0y?=
 =?big5?B?c2djMjRvR3RZMXBhUytqOTFwK21hbHN2NTcwWXNLRkNxZ3V1K3B1UDVFVjNHQ2VK?=
 =?big5?B?ZEhQNzZ0OGRIRmw5ekM5bmdjd1NaSFdNcThNMG1FeHU1dHZ3b29SZFVEMHBrQUJw?=
 =?big5?B?NmRRaU5PUEdMa3k1clZycDJETmJjVDBySDdTbUVzendFQ3pWSWdlNlYrSU9Qam5s?=
 =?big5?B?L3JkRElQNEgrUTZOTVBvMm8xeXVVWHQwQ2tseUJIWWJKRW9aRXVaOU1SazJ1cGQ5?=
 =?big5?B?czNFK0hmRjJTd2YxSHlFb2k1NW14Y1FSbXR1ZVBJYktWSEtybFZrZ2FHRkhYZmZn?=
 =?big5?B?ZkdDTmd6b0Q4Zi9zRFVKazZONU45RWF5WEJPYmVCeDN6UUJua2grMmlOT29DR2FH?=
 =?big5?B?VHA0QzFWNm9Ud0x0UVA3ZUpVOVg5ZWR0WlZ4L2hoM2ZTam0zVEM3VEZUTlNETlRr?=
 =?big5?B?WmFYUmsvTUp1d0RodTJNU055ZnljYTZOSjh2QXNldlB6YWZSc0ZrdE84TDdScVBI?=
 =?big5?B?SU5vNXprT0FtYysvT20zbTl4WnUxYWlKWUs0b0J5d1BwQjk4QlMrMGdvYngrcXd0?=
 =?big5?B?ekczSjhiU1lYc3I4M3o2SS9Lb2dLeHRIYXBFS3ZyWFpULzZxd0FFVnduc0ZWNDZo?=
 =?big5?B?Y3oxaDVMbExLbm9aZ2VvMFpBVHpQeFBsclFxOFh5WG9rR21MWjRpbnFvRS9pQWNk?=
 =?big5?B?N0p5VVV3SVlYd3F5UWxyVmxCcktJUFVRU0VObFBjbTd3Q01HWmVYdk95WGpFNUVt?=
 =?big5?B?REtIN0lzVW1mZ1d5S0ZVMnRlWDFCYm1wS0Z3ZUtkQjVCMHJUS2YxNlZRalN1WVFh?=
 =?big5?B?YThmSEZUcjkza3JkL3ZtcEl0S2g2WWpsZURxMDJIb2c0V1ZDSmJHTjhaUVF1L2pO?=
 =?big5?B?dFFYRkJzazcxNS9VVERZMVAwSmtwc0MvemwxU0FLUCtjbUhBU3d6NTNiUU9JU1BC?=
 =?big5?B?N2w1WEJOaEtGU2VwdXpmb2dxemZvRThOZlZNTjdjWmI5ZnM0b0hwSVFDYXJxR1la?=
 =?big5?B?MnNpcFRzakVIM3k3UklVbytHdENmTFE5MlVNTVYxbUVMdnllU3NsUktJbnppMzRq?=
 =?big5?B?TVVPWlFOKzFXR2tzSkw5YmhDNmR6K05QaHBFRTY2cVRuWEVmUDI4MTc5WmdYTFRV?=
 =?big5?B?bXdLUkNuVy9xQVV6azN5STNkM3VBNm9kUTQ1Qkl0U3FVa3YvdloxR3l0UjhxT0dW?=
 =?big5?B?QnVNVlBBYmRneXB1UHVOVlNaUGl2T1dMVnMraisrdmFjd2VJck4wVkdZaUJxS0tH?=
 =?big5?B?VlRxQVMyOTE0K3pDWWhCQWdoUmVLWVZKMkhlWmlLZ3V4cE1Qb3dWNmxEdVpLMUUw?=
 =?big5?B?bDhPRVRjcnRpL3V1b1FSb2pnaWkyMVZtK2lGMlo5Z2xsSnB4N0pBSXY2cGRIaUt4?=
 =?big5?Q?XRtXJre2U3TtbP/8?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB5514D818A3029FA77BFB523BDCCE9DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB4266
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: fe5cf3e8-b400-4e55-d66d-08d96dfd4b05
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HrY8q3n62hcLlC0PPczGhvXD4motCXIYM0UBF6u4QwpTaEjqOf9p5SxY1CuyQqfJGGGfNR+eLpifXoSRpvrFa7ZcKZPsDwpBx1NyMhOBSdMYyyWf/lQEY7lXwYJn38n/t3O9OxOGhq8RsZpi7IbBZ9QlV04JidZ+uPfsM89tYkSyqK3AkZhhS1QyXJInaGUMfMVFKoBYHqEGa1w5v+j1cPMuSk58gOktRWrl09oyiWiJ9uXVX6FtVXWeNIJaynPIJvD2j6Qr+XOwjL9KAj18tIp9fKPIUpZzumGUxLN26pkipQL2+sL6107SwWTilN9pWQIWGRjAsLw2RkigS2CWdIe56i/j+jZLBJDqqBKiDlB+SGx4mqDjGNUKuOR20iKtJJCziOfQteM/wHOpMyCnXROtvqfxbxiOxB9F8ASFSTHpGFHtfW+YNJ9B0hHxEdm3ECqSy/QkQad60RVXp5zpDbrDL4LDmMgWOYEDcKBPzUQSAvWrvQDOszCRIikEet3uE4sIRPzOTT4iGeO1cfFaQZupwshamxtVUn3EC9gs3WEmnDDc/dBLLIJHrta1wLX6GAsAeywo7RwfCiZTWpCN1VGYEYVhNYYv1TTYf1j6bV/RyLVFHOlU9ulD3iswIjTxqMJq6+hSC027NAgsuMXi7DqxUKLldEetOSSqwvwVBPo8nqOTSbUmAL4LFPbkTPVPxwGXpLiBF3oHFSU9zNGI/JEao+AAJqhPNLNKDZyeMek1srx9EYMvTXUBukx1d/m+ZUlCMH7JXu6IXmahRv8mLg==
X-Forefront-Antispam-Report: CIP:144.49.247.19; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(396003)(376002)(39860400002)(136003)(346002)(46966006)(36840700001)(52536014)(6916009)(478600001)(70206006)(8936002)(6506007)(36860700001)(55016002)(8676002)(9686003)(5660300002)(70586007)(82740400003)(19627405001)(47076005)(81166007)(2906002)(336012)(86362001)(186003)(26005)(4186021)(82310400003)(316002)(7696005)(356005)(33656002)(21314003)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 10:34:53.2850 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a3ca31f-d3e7-476e-add1-08d96dfd4cfa
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.19];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB5192
X-Proofpoint-ORIG-GUID: EV0FlV_XDanAW7zRNspk--iGFgUTOG-Z
X-Proofpoint-GUID: EV0FlV_XDanAW7zRNspk--iGFgUTOG-Z
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-02_03:2021-09-01,
 2021-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109020065
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

--_000_DM6PR08MB5514D818A3029FA77BFB523BDCCE9DM6PR08MB5514namp_
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="big5"

SGkgYWxsLA0KDQpJIGhhdmUgc3R1ZGllZCAicGhvc3Bob3ItaG9zdC1pcG1pZCIgcGFja2FnZSBm
b3IgYSBjb3VwbGUgb2Ygd2Vla3MgYW5kIGdvdCB1bmRlcnN0YW5kaW5nIHRoYXQgaXQgaGFzIGlt
cGxlbWVudGVkIHNvbWUgbWFuZGF0b3J5IGFuZCBvcHRpb25hbCBjb21tYW5kcyBhbHJlYWR5LiBB
bmQgSSBhbHNvIGtuZXcgdGhhdCBJJ20gYWJsZSB0byBsZXZlcmFnZSAiaW50ZWwtaXBtaS1vZW0i
IHBhY2thZ2UgdG8gZ2V0IG1vcmUgY29tbWFuZCBoYW5kbGVycy4gQnV0IHRoZXJlJ3JlIHNvbWUg
cXVlc3Rpb25zIHJhaXNlZCBpbiBteSBtaW5kLCBJIGhvcGUgc29tZW9uZSBjb3VsZCBnaXZlIG1l
IHNvbWUgc3VnZ2VzdGlvbnMuDQoNCiAgMS4gIFdoYXQncyB0aGUgbm9ybWFsIGRldmVsb3BtZW50
IHByb2NlZHVyZSBpbiBjYXNlIEkgd2FudCB0byBtYWtlIG91ciBvd24gT0VNIGNvbW1hbmRzPyBJ
IG1lYW4gZG8geW91IGd1eXMgZW5jb3VyYWdlIG1lIHRvIGNyZWF0ZSBhIG5ldyAieHh4LWlwbWkt
b2VtIiBwYWNrYWdlIG9yIHRvIGxldmVyYWdlICJpbnRlbC1pcG1pLW9lbSIgYW5kIHRoZW4gYWRk
IG91ciBvd24gY29tbWFuZHMgaW4gaXQ/DQogIDIuICBJIGZvciBub3cgYWRkZWQgImludGVsLWlw
bWktb2VtIiBwYWNrYWdlIG9ubHkgZm9yIHVzaW5nIGl0cyAiPENoYXNzaXM+OjxTZXQgRnJvbnQg
UGFuZWwgRW5hYmxlcz4iIGNvbW1hbmQgYmVjYXVzZSBJIGZpZ3VyZWQgb3V0IHRoZSBzYW1lIGNv
bW1hbmQgaW4gdGhlICJwaG9zcGhvci1ob3N0LWlwbWlkIiBpcyBub3QgYWJsZSB0byBtYXRjaCB0
aGUgZC1idXMgaW50ZXJmYWNlIGluIHRoZSAieDg2LXBvd2VyLWNvbnRyb2wiLiBJJ20gbm90IHN1
cmUgaWYgSSB3aWxsIG5lZWQgb3RoZXIgY29tbWFuZHMgaW4gdGhlICJpbnRlbC1pcG1pLW9lbSIs
IGJ1dCB3aGF0IGlmIEkgZG9uJ3QgbmVlZCBvdGhlciBjb21tYW5kcywgaG93IHRvIHJlbW92ZSB0
aGVtPyB0byB1c2UgdGhlIHdoaXRlbGlzdCBtZWNoYW5pc20/DQogIDMuICBJcyBpdCBva2F5IHRv
IGFkZCBtb3JlIHRoYW4gMSB4eHgtaXBtaS1vbWUgcGFja2FnZXM/IElmIHllcywgaG93IHRvIG1h
bmFnZSB0aGUgd2hpdGVsaXN0IGJldHdlZW4gdGhlc2UgMiBPRU0gcGFja2FnZXM/DQogIDQuICBB
bSBJIGFibGUgdG8gdXNlICJpbnRlbC1pcG1pLW9lbSIgb24gYSBwbGF0Zm9ybSB0aGF0IGlzIHVz
aW5nIEFNRCBDUFU/DQoNClRoYW5rIHlvdS4NCg0KUmVnYXJkcywNCkNocmlzIENoZW4NCgpMZWdh
bCBEaXNjbGFpbWVyIDoKVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIG1lc3NhZ2Ug
bWF5IGJlIHByaXZpbGVnZWQgYW5kIGNvbmZpZGVudGlhbC4gCkl0IGlzIGludGVuZGVkIHRvIGJl
IHJlYWQgb25seSBieSB0aGUgaW5kaXZpZHVhbCBvciBlbnRpdHkgdG8gd2hvbSBpdCBpcyBhZGRy
ZXNzZWQgCm9yIGJ5IHRoZWlyIGRlc2lnbmVlLiBJZiB0aGUgcmVhZGVyIG9mIHRoaXMgbWVzc2Fn
ZSBpcyBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgCnlvdSBhcmUgb24gbm90aWNlIHRoYXQg
YW55IGRpc3RyaWJ1dGlvbiBvZiB0aGlzIG1lc3NhZ2UsIGluIGFueSBmb3JtLCAKaXMgc3RyaWN0
bHkgcHJvaGliaXRlZC4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGluIGVycm9y
LCAKcGxlYXNlIGltbWVkaWF0ZWx5IG5vdGlmeSB0aGUgc2VuZGVyIGFuZCBkZWxldGUgb3IgZGVz
dHJveSBhbnkgY29weSBvZiB0aGlzIG1lc3NhZ2UhCg==

--_000_DM6PR08MB5514D818A3029FA77BFB523BDCCE9DM6PR08MB5514namp_
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
<span style=3D"font-size: 12pt; font-family: Calibri, Helvetica, sans-serif=
;">Hi all,</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"font-size: 12pt; font-family: Calibri, Helvetica, sans-serif=
;">I have studied &quot;phosphor-host-ipmid&quot; package for a couple of w=
eeks and got understanding that it has implemented some mandatory and optio=
nal commands already. And I also knew that I'm
 able to leverage &quot;intel-ipmi-oem&quot; package to get more command ha=
ndlers. But there're some questions raised in my mind, I hope someone could=
 give me some suggestions.</span><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<ol>
<li><span style=3D"font-size: 12pt; font-family: Calibri, Helvetica, sans-s=
erif;">What's the normal development procedure in case I want to make our o=
wn OEM commands? I mean do you guys encourage me to create a new &quot;xxx-=
ipmi-oem&quot; package or to leverage &quot;intel-ipmi-oem&quot;
 and then add our own commands in it?</span></li><li><span style=3D"font-si=
ze: 12pt; font-family: Calibri, Helvetica, sans-serif;">I for now added &qu=
ot;</span><span style=3D"background-color: rgb(255, 255, 255); display: inl=
ine !important; font-size: 12pt; font-family: Calibri, Helvetica, sans-seri=
f;">intel-ipmi-oem&quot;
 package only for using its &quot;&lt;Chassis&gt;:&lt;Set Front Panel Enabl=
es&gt;&quot; command because I figured out the same command in the&nbsp;</s=
pan><span style=3D"background-color:rgb(255,255,255); display:inline!import=
ant"><span style=3D"text-align: start; background-color: rgb(255, 255, 255)=
; display: inline !important; font-size: 12pt; font-family: Calibri, Helvet=
ica, sans-serif;">&quot;phosphor-host-ipmid&quot;
 is not able to match the d-bus interface in the &quot;x86-power-control&qu=
ot;. I'm not sure if I will need other commands in the &quot;intel-ipmi-oem=
&quot;, but what if I don't need other commands, how to remove them? to use=
 the whitelist mechanism?</span><span style=3D"text-align:start; background=
-color:rgb(255,255,255); display:inline!important"><span style=3D"text-alig=
n:left; background-color:rgb(255,255,255); display:inline!important"><span =
style=3D"margin:0px; background-color:rgb(255,255,255); display:inline!impo=
rtant"></span></span></span></span></li><li><span style=3D"background-color=
:rgb(255,255,255); display:inline!important"><span style=3D"text-align: sta=
rt; background-color: rgb(255, 255, 255); display: inline !important; font-=
size: 12pt; font-family: Calibri, Helvetica, sans-serif;">Is it okay to add
 more than 1 xxx-ipmi-ome packages? If yes, how to manage the whitelist bet=
ween these 2 OEM packages?</span></span></li><li><span style=3D"background-=
color:rgb(255,255,255); display:inline!important"><span style=3D"text-align=
: start; background-color: rgb(255, 255, 255); display: inline !important; =
font-size: 12pt; font-family: Calibri, Helvetica, sans-serif;">Am I able to=
 use&nbsp;</span><span style=3D"text-align:start; background-color:rgb(255,=
255,255); display:inline!important"><span style=3D"text-align: left; backgr=
ound-color: rgb(255, 255, 255); display: inline !important; font-size: 12pt=
; font-family: Calibri, Helvetica, sans-serif;">&quot;intel-ipmi-oem&quot;
 on a platform that is using AMD CPU?</span></span></span></li></ol>
<div><span style=3D"background-color:rgb(255,255,255); display:inline!impor=
tant"><span style=3D"text-align:start; background-color:rgb(255,255,255); d=
isplay:inline!important"><span style=3D"text-align: left; background-color:=
 rgb(255, 255, 255); display: inline !important; font-size: 12pt; font-fami=
ly: Calibri, Helvetica, sans-serif;">Thank
 you.</span></span></span></div>
<div><span style=3D"background-color:rgb(255,255,255); display:inline!impor=
tant"><span style=3D"text-align:start; background-color:rgb(255,255,255); d=
isplay:inline!important"><span style=3D"text-align:left; background-color:r=
gb(255,255,255); display:inline!important"><br>
</span></span></span></div>
<div><span style=3D"background-color:rgb(255,255,255); display:inline!impor=
tant"><span style=3D"text-align:start; background-color:rgb(255,255,255); d=
isplay:inline!important"><span style=3D"text-align: left; background-color:=
 rgb(255, 255, 255); display: inline !important; font-size: 12pt; font-fami=
ly: Calibri, Helvetica, sans-serif;">Regards,</span></span></span></div>
<div><span style=3D"background-color:rgb(255,255,255); display:inline!impor=
tant"><span style=3D"text-align:start; background-color:rgb(255,255,255); d=
isplay:inline!important"><span style=3D"text-align: left; background-color:=
 rgb(255, 255, 255); display: inline !important; font-size: 12pt; font-fami=
ly: Calibri, Helvetica, sans-serif;">Chris
 Chen</span></span></span></div>
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

--_000_DM6PR08MB5514D818A3029FA77BFB523BDCCE9DM6PR08MB5514namp_--
