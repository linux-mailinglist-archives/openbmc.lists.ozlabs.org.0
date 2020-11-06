Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D7D2A8FD0
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 08:02:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSBCs48RdzDrGw
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 18:02:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e88::731;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=Ggo/xZT7; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20731.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::731])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSB7D6fTCzDrHZ
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2020 17:58:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOj4s/nuisRJXEyZvQ2mmJbQN4MuMcx5A0H25bhmbWWvVnKrNSMishFhW6Sowwo+HnTgc6Vaj90437oQ+cnFrBFSlP9+iY5ASmEMIBcDmSCMN5RoRHtfmdXQo02bMxXjLpARFMyPpjgt6qebjy5f6XMlXXlbkutFiDabI8ToqbX7E8+siGV8GdEjXlNGhiPXJOC9kvMxLvCQMk2RGCn7kQYoTMKpu7TqmNEMTfg0ohBU6sd6S3xtICTwUEcR+J5EkKt7MhpTXiIPxUcS0B09mEdsgTQ/PrnM1JhYHiM75lYmcGF4uZ+iDx9IGiTON0qtrKUg+htCEDklvUQ0KUMyzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cd/EptfXvCyqlGxlSIXAvGW/rgMjmrJcRhoKewWEn/Q=;
 b=iOhvZs/UyL5syQA5kyBXgOQ8xaMr5CBxQG+H6f9obrhX+yWmM9H1zea+LMJ4/yYWbvxGkAw38iQioH4bjQaSaymgf4nIg74xRl8gikCVcRu0oWQ+YNtIpXgcm+Tqeu3V619xgmCZOHQMPa7K/YvO4Nkh2jCihAypI9J7Ar4cYnotQa0+wadikUB/T9hvpcFuIZKsg4aRzc22uTd/+hS8JkO/2b13iJrsAGl613mPcWTQlZAxsKGTiaX9msR/SteKHpr37Ja0qoDS3F3iB/Uo5W9RkW6X57EePN7c9Y0aYbtZmh0yufVcoe+ScRgvqqUH7MTUcKrQdKnyY80Y5PJelA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cd/EptfXvCyqlGxlSIXAvGW/rgMjmrJcRhoKewWEn/Q=;
 b=Ggo/xZT7MFBL83o8kkOaXFwf6QcEyCUfgtsr7/yhvob3d7/2ycPSXudmXRih9Q/E5Bs7THsdj9X+ia0YO3RT519blw2w59QRaJkfebtfzLZB+nY08lG/T1392tjoj/PinOP5sVl2IfaRHeOE1bqK+17tQhAQg1UtdsNO7Rq5T+M=
Authentication-Results: fuzziesquirrel.com; dkim=none (message not signed)
 header.d=none;fuzziesquirrel.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from CO2PR01MB2039.prod.exchangelabs.com (2603:10b6:102:7::6) by
 MW2PR0102MB3433.prod.exchangelabs.com (2603:10b6:302:6::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.27; Fri, 6 Nov 2020 06:58:19 +0000
Received: from CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::f0e3:747d:ec54:6114]) by CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::f0e3:747d:ec54:6114%11]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 06:58:19 +0000
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, bradleyb@fuzziesquirrel.com
From: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
Subject: Request to create meta-ampere repository and meta-ampere folder
Message-ID: <d5f6bea3-a45a-a6e0-275f-b014794712ee@os.amperecomputing.com>
Date: Fri, 6 Nov 2020 13:58:11 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK0PR01CA0066.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::30) To CO2PR01MB2039.prod.exchangelabs.com
 (2603:10b6:102:7::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.33.219] (118.69.219.201) by
 HK0PR01CA0066.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 6 Nov 2020 06:58:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a04d584e-08c3-4521-28b0-08d8822157e0
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3433:
X-Microsoft-Antispam-PRVS: <MW2PR0102MB343396124436E8CD477020828DED0@MW2PR0102MB3433.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5oRZPZlkWMGzPmx8X4p7D62SzgOcAouKdrAdU/04B2sLp5RF8eDwPHooWd5z52yxyb4n6lb8u8vxNX5PBzV9gu1AjLl+WMvdrPpz2CUYP/mESmEBybZeuNGifcmwcgaR2GaExLqOLtS5kiWvazhfj3OXMpOoVDfJZAMYVt3tvoFJctq8edLZXpiW3jk5L0iz0trkwsG04MKRkvUb9bS3rBNeiDeUZryfcdZsxGV+Z0fj/FfLaZmBWJiBUJ0YgZYcYsA7vk3dBkhkaPDDp3sPSYLjViGpRYiTZODxifCXDJ8058CqdIcpsnCgHVaGikcNHGmwCuHmWjnU/qvDE4cWJOT49/A/smTrf8bDRtGt4p4MKd0+3qATe2WP8Ax3BxLEHzpc8SkkSOqxQ/nRJ1HIHryNs5g+p7jVivVLoY07/ws=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO2PR01MB2039.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(366004)(39840400004)(346002)(186003)(86362001)(6666004)(558084003)(5660300002)(2616005)(16576012)(956004)(316002)(16526019)(478600001)(66476007)(66556008)(66946007)(26005)(6486002)(8936002)(31686004)(31696002)(8676002)(2906002)(52116002)(41852002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: bbmgUi2Wexrwj96yfmnv6743UvZ8nfOeiZabgo4I3GP/O3EHU7CBEiUPr3AReuJpZCnPvD4xs33hN0WIQ7z0ZiXZxK3OICraQm9omOHzkSriDfIL17STjwu8Ny0QNhS0ZCaOqJMbjwtRavKUaXWyKQhxzUt4/aEOLxFreyPEPLcBykWEckKmni4T18n9ym9e03iB6FjwndTXEEx0pEuz7JTp0TAWnWFtLwSpIVXGbQ+8BETQyP1kD/oXmYuwXvii/O5qVJbvpHflT86mksyaLkY5B7A07fTX5bsM4Olp7QM829uaAusSabNvAMP5M5MMZD3TZIxuPjxtn5CrVs9adVx95XqvCAp6tJ9CTsTEs31cL5zMtJy3lcWTZjLOyd7ZAJvSEafDaEV09fKnObIiK6vjCufQU80dMu3ntN+O8LdaOLxjpbWVHtjQ2STmIuj9g+IMHz0Q/MlYS/7Ast7HCoj3LOjYTkoPna8SCoODfb7uFKMFZhwiGGYmSabyYPNQ5IG6NWpbellnAYrQ5CPvIV2f0NOfoj1EU0po96/19P7WwTqD0zDqQVosBoukpC0J1ke2WrKH6jZ65YBKjjV8pk7RbRlpIDxbWaYTN+ubRdYM7PRi0flkwN2W9L+CUFYNCbeUfpnIN0oHG3QrrdjKMw==
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a04d584e-08c3-4521-28b0-08d8822157e0
X-MS-Exchange-CrossTenant-AuthSource: CO2PR01MB2039.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2020 06:58:19.4524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FymNtYIJW9ZlqVQMoiFc1/BJAaPjYxa+vIucCQ6WCOyr7N2hi3985iC24ekA3H2f9dG9xJy6g60UhVA4M0SFQka6u0APoFpDXi7qJD+xXNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3433
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

Hi  Brad,

We will start working on submitting our codes to OpenBMC code review 
soon. Could you help create meta-ampere repository as openbmc subtree 
and add the meta-ampere folder in openbmc repository?


Thanks,

Thang Q. Nguyen -

Ampere Computing.

