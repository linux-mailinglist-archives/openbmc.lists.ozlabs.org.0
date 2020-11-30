Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0602C8978
	for <lists+openbmc@lfdr.de>; Mon, 30 Nov 2020 17:28:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cl9dh5VnmzDqkg
	for <lists+openbmc@lfdr.de>; Tue,  1 Dec 2020 03:28:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.237.77; helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-amdcloud-onmicrosoft-com header.b=tM8Unp2k; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cl9cm1GB6zDqVN
 for <openbmc@lists.ozlabs.org>; Tue,  1 Dec 2020 03:27:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UU3/A+B0PP/y/GTeI2KRx9PQhkqwt4NBcvdBAuKtWv5r1D6P/VA5m7MRsKVkQ87ILCCQK0weRycqkNBSlgDg7TUPBn2zNnNxgH/hb6MUMRwUga7iHu68i3TwoaEoFP+NBufUmWtGxJsBHZxdx+VhbSgTj/uzmCzeGMREUFrEP1VHAy221SB9nCx5cIL4lTme9YVuk1Dqqlqgl5ulOycXzlRdv2x78PzzTJamkL6rDPTJUUXZBWvbIIuF7xKSDMO31Fn0qHdiq5wmgWeYMhIzd7sR+fzTZigk3U9k0gYe/lrKBhDCXzi0R1zRkZt7aZZNv0jCJl1evQDx8EWD3qZdOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/ROYQOKMh6b+cst6b1TlaIWY89GfUuoK7zALul5HiI=;
 b=HZFu1jD3feJ2Z4u6JGYi9fajOeLA1emFP/H62B74tbbwuaGVk6+aNSl3FURK15zc+qwS+eI3qFWPTqcGNUc4u+n+PW3Dk/XZ3yIXmtyL86LJeguYugzppWxv5Y29CCvYI+jtf5ZV4C22TQqD0X8TXrLh1KeDXhkI0vTVYVdIWJXgGoMnHVjkFJ7xTIi6Bz183m/QVltYCDfv+yUjr0caJw+LHbj9oiWPHPS5Mzp63n2Ghhx0vdVfZVdX4yrtp30mpYiD2izQ5EOrRpUaDE+3GIOwNaCeCsKAT0ClRusL9rRw9iVhudyIKvPJ9LlUkT+17b/ls8x5K8BEL2mOHMB5yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/ROYQOKMh6b+cst6b1TlaIWY89GfUuoK7zALul5HiI=;
 b=tM8Unp2kp+OqqoRUHzmi04QLOM862utsCVEQB4fymHpyzykmq4aOeAvzTGHsDg19/mhI/60PKhdns2PIFSaQJegDot/uHbzkWBgeIUXhsFbrA4sILEC255gD/c3dWmWYTtCLUznLYRh5jGG8CiaGoJGgwWseYa9qJTOh+LwZRww=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:26::28)
 by SA0PR12MB4432.namprd12.prod.outlook.com (2603:10b6:806:98::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 16:27:26 +0000
Received: from SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::71ef:be22:6a7d:b4b7]) by SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::71ef:be22:6a7d:b4b7%5]) with mapi id 15.20.3589.030; Mon, 30 Nov 2020
 16:27:25 +0000
To: kunyi@google.com, Joel Stanley <joel@jms.id.au>
From: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Subject: SB-TSI virtual hwmon driver
Message-ID: <3f94f822-0df2-e8ae-71db-2ecb512f93a9@amd.com>
Date: Mon, 30 Nov 2020 10:27:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: DM5PR06CA0041.namprd06.prod.outlook.com
 (2603:10b6:3:5d::27) To SN1PR12MB2542.namprd12.prod.outlook.com
 (2603:10b6:802:26::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.136.123] (165.204.77.1) by
 DM5PR06CA0041.namprd06.prod.outlook.com (2603:10b6:3:5d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Mon, 30 Nov 2020 16:27:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d129eb30-eac0-492e-ecc9-08d8954cd288
X-MS-TrafficTypeDiagnostic: SA0PR12MB4432:
X-Microsoft-Antispam-PRVS: <SA0PR12MB443296914F65F440E94FDAB396F50@SA0PR12MB4432.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jKZMoL/tlG4qe+wI22n5nJGoQ+ouMM4n1RiUC1rmR3t3yF2I5P85N+N7t2kzwVEmY0EV2zuzNfQO/XbSHYPn2rzKwNpHVBQX5o/x01m7OKRv1XilyNG4/0uZmql3bZMtuDoS30GdcwvncBvdWcfB237SYPevmmR8ZrhG8mB4i1CzA+3c9v7CyNSb7Kn1T2VOmg/ihTllLjmlD4Qf+zJU63iwYeRVUf6hFW2sNtwqW5MZ7uU7AY1YOsAGvNAQvdz9atwjJGv27yrds0NlKEal0m/WsAh9iPgIhCFDRvRbRHbG6R6dcn51Y1CDnPf09fSjPgySbPUDPOEW+TX+xcYAztAZLZXqOqIdYc1QBj2yzO88z24sm3yhWu2UJqXPoUePiy4WvRCdYz2XO32UcCB45bi+yT6nEhqR+TrHLMHQsPlbbUWfgxUHteVpY08fDN19m8t43tsa07OwTdaHDK3kpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2542.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(5660300002)(3480700007)(6486002)(8676002)(8936002)(66946007)(6916009)(66476007)(26005)(4744005)(36756003)(4326008)(316002)(2906002)(16576012)(52116002)(478600001)(31696002)(186003)(31686004)(956004)(66556008)(16526019)(86362001)(966005)(2616005)(44832011)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TWk5bEJiT1E3U2ZWd3F6RWMzQ1E5a0pZMHRndTd5Y3B4ekRPMWY2ZExrTW5s?=
 =?utf-8?B?RXhKTWNOdVI3dEVrUzMxMGVRTmlkWk5IbUJ3YXZYaEpsaWZCM1F6aDN4M1FQ?=
 =?utf-8?B?UUdza2tuZCsva0ZZOXovM21JNEZvbVdMUG01UnhGUnIwNHliUjRDMGJtWk9h?=
 =?utf-8?B?NC85TUNvYmZhaUM0VzFqRGI0RXdkRUNpZFJ6czN2RDlRQTNwYXJoUjFEODYy?=
 =?utf-8?B?Ky9VSnBZQjE5S25EanZLeW9RQUdHc213K1NWU1Rsb1UwTk05MnJiekY1VDR6?=
 =?utf-8?B?amV5a0p4UGR2UnVxR1NlNi81c3VxeTZVYXljVk8rRytxeGg2clNUb2lnR253?=
 =?utf-8?B?a2lDM0Q1RUdkejBlTkhKdUhibTcraTZHakNsb3plY1JYSXBXNmh4UVJSN0pL?=
 =?utf-8?B?T3dtdnFXWFA2UkhpamZLYnUwbzcvQjdnQ0FMd28zaGJRL0JSUm5PcnJmTE5w?=
 =?utf-8?B?ZXpsY3hITnpJWkcrUGhGUmNZR2Z4cHRjOWxhRGxFZ2hQanhrTVA4ZWpZUVdD?=
 =?utf-8?B?QnVMdWI2S3JjL01pczdxRUJVTjZCeFRwbzhzeFlwMkpTSTd3RWU1L0VtbFF1?=
 =?utf-8?B?MFBqTnRHVTByb3NZVzIyUkNzRnZtQjNGWHk5d28raU5YTEdUb2k1T2R2SjN6?=
 =?utf-8?B?ODdEM0Q4L0xZRG9IWVJzbk5yVkxEMm5WYnFhSTZUNHROS3pSb3FodGtLZXpI?=
 =?utf-8?B?L3FFZERmcXVXdFRuYmkwbmpMbXloVW9vSUtjYWgxNFhnbUFpUnJPQmlZM1h3?=
 =?utf-8?B?cnp1bjJ1K3ZLOGRqa1RwS2tlM0xEU2hqZ2xlNUNMaERjMzBjL0svZEV0L2NQ?=
 =?utf-8?B?eHI4ZnhyVzg3c1pKb0xmdExMeHVkZGZCMnBITEFScW9JM1U0QWFudlZBQTNl?=
 =?utf-8?B?QUFUT0wxSFdRSC9yT1Y0NXJPN2hqL3V6cUpEYWxCWGNWTGF1ZnMrTWJOWldk?=
 =?utf-8?B?cTVsODFNTXluRnloZnFtVHVEYmRWM1Zkck9XcWkvZHVrZGpyOC9RSW5pZU4r?=
 =?utf-8?B?Szk1S0RsL1J0Tm1OOHpTcENUbHZQZzJva3JuaU1tZk1RcXJnWUhpZTJSMG43?=
 =?utf-8?B?d2tSWlpaUSthYTVpUHlLLzlLTE1NbFBMczBnbCtvRjg5dmJXVHBTc1pCcVZB?=
 =?utf-8?B?WFpKQ0lHcG8wa1diV2lYUW0razJ5elh0UHVReVpuWXBVTzVLUGVnS0prQVBM?=
 =?utf-8?B?MVV1aFFObG02bEh6djJZUlVrWFNYY0lUNUdsUlBoVE8zS0Y4L0szQS9YRjI0?=
 =?utf-8?B?Nkc0RWNLUlgzR09adGlPMDhJYm9lZktXOGhqSXF5ZWo1MytKVDFWMzJQeWRU?=
 =?utf-8?Q?die54wtElcznRgSiR0y1hm4ZAGeSK4t8kO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d129eb30-eac0-492e-ecc9-08d8954cd288
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2542.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 16:27:25.7675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cEXYiaZxXJc5VL1f5e2eBKcPdRUF0ewL/+0R7gU/TVPaDROvxcZD7hqF+nfUrel2xr30g0ymw1RtIclPR2Y8SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4432
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Kun/Joel,

I am little late to SB-TSI virtual hwmon driver patch series:
https://patchwork.ozlabs.org/project/openbmc/cover/20200405030118.191950-1-kunyi@google.com/

I could not find this patch series included in OpenBMC Linux kernel fork.
What is the status on this? Any plans to include this driver in dev-5.8 branch?

Thanks,
Supreeth 
