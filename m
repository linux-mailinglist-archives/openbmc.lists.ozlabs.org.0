Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D89D32B34DD
	for <lists+openbmc@lfdr.de>; Sun, 15 Nov 2020 13:19:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CYrqX6HlwzDq8g
	for <lists+openbmc@lfdr.de>; Sun, 15 Nov 2020 23:19:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.236.115;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=LcF/B0iq; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2115.outbound.protection.outlook.com [40.107.236.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CYrlY0h0rzDq6B
 for <openbmc@lists.ozlabs.org>; Sun, 15 Nov 2020 23:16:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+YQ6oLZBusKaZcnm2QM+IAzo3p+NGY801bkztKa7yx45ELEC4qgVUa8+7gFGB2sIByBgls7chnHcZqGMBdhQ3SGMIjrku2c93qM5CaGOlHk+WPX1qSCG3/WCKC+KlipBVRAX2pYRsaDBafK4jUOKBjPmEWYNhNN4OFMHISsH7xDfpU1Xn7gFr9IXL1Bz/2xfHxNB3c3Lu50RBOjmwUkc9haGJ45ONHUZA6apnYNb7axfdox+/kHE0bJyg2wMoF5t9BMWA9pRJbVaBAmItChF6TIG/bV5ZMWygCkqaG840vfiHfS4N8twCGPdPNP7blQCyxPDHGQj1EkiyHdCXKSHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbn1V2vKLBDOv0ffxI/UprRDupndjGSS/qLZ7ae7lzA=;
 b=PQFnSKVswkuTi7yErfihRDoaon+BNGBODO6fF4VI+FeJbaif5oY/fbh1zMSlZbrTiGoOR2TCqlMMIKjgKtwNPut9GFlAtHDOjOYYeAjweIH3ZOcvHEYUlLFvIZ6Vb2mDbjaq9JL+FMWGBmEo/cNwVv/ulPXZpuf5rumfGRYsLQA2bETGeDiq4o1wICp3CXxPaaPdhCFLwTy+RIhBmBmCXdkF7aL/l8JcHKoOaBs9M/kzqALfJivi1dKhCXwSXlwn7t7fQsvn/W8j653fA3r4N2SQ9KjN/O9vulmbcLS73x79yZUu0nIYEgCBmK6rNUqcTn3yZSL7KiCOEbJh2vqqHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbn1V2vKLBDOv0ffxI/UprRDupndjGSS/qLZ7ae7lzA=;
 b=LcF/B0iqF9Y6ouHUto8bTRCtwMBP0XCWz39RL185n6jYKtSAwHmDprMRabhbRpVKCQ0h1i3hNHVUtPwBwAXdI0zo8uRKSkyMYBEW+hQwxJfbsqHbXb4le+xeKh0vuhVnvpmleL6rDmp90gr5/UtXCS/pTv6SNq6bddUsqZnTKL0=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from CO2PR01MB2039.prod.exchangelabs.com (2603:10b6:102:7::6) by
 MW4PR01MB6130.prod.exchangelabs.com (2603:10b6:303:75::8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.25; Sun, 15 Nov 2020 12:15:56 +0000
Received: from CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::9406:896e:16e9:ed0]) by CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::9406:896e:16e9:ed0%2]) with mapi id 15.20.3541.025; Sun, 15 Nov 2020
 12:15:56 +0000
Subject: Re: New meta-ampere request
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <fbcb9c2f-553c-6ebe-d2d1-69dd072a25ad@os.amperecomputing.com>
 <F47638BE-9654-4837-9FE3-1AB188CDB04C@fuzziesquirrel.com>
From: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
Message-ID: <51e879c8-768d-f8bf-f748-9fae51db6acd@os.amperecomputing.com>
Date: Sun, 15 Nov 2020 19:15:45 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
In-Reply-To: <F47638BE-9654-4837-9FE3-1AB188CDB04C@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [113.23.16.98]
X-ClientProxiedBy: SG2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:3:17::22) To CO2PR01MB2039.prod.exchangelabs.com
 (2603:10b6:102:7::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.86.98] (113.23.16.98) by
 SG2PR02CA0010.apcprd02.prod.outlook.com (2603:1096:3:17::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.25 via Frontend Transport; Sun, 15 Nov 2020 12:15:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ea84a97-5d1a-4a75-849e-08d889603421
X-MS-TrafficTypeDiagnostic: MW4PR01MB6130:
X-Microsoft-Antispam-PRVS: <MW4PR01MB613018934263E6CC6C5778918DE40@MW4PR01MB6130.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: opWSqJuxuobWiylmOdNd1uKLxAC8f9lF7LxcdbA1yBx86C8lGW/KRIn8qG5yNyOhSFHGh9BoZsEFGtp9Je5Z7jiNn80aqm4ZvaHt8xigAkVaSvvbKEeUalR8C9bpEXqOwoOqXSeVnkfDVaQoslvQLJIJZQvaDUWiSs6TULvd2Epf5Dpn4NsKbtzulLuQCBtIEWIU+df2trN3Sw9xI3OkUZSar1TzNYRceEoIwg4R9Jrj6ma02MrbytTe/Nt4YZI0ogojjNwgr7z+UHf5ylmAcVR+PPwgH3n/ZDHtEWGdl2jOy2GfmZZ4t4W1GbNPINFMs0IpFtuWluRyA8+prO9XRBauYsE2rqrSYrOjjbmlk4ObBFD7i3y2S8M8mtDdgig5Cjh+0fMdfjrkAur5TaC28Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO2PR01MB2039.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(376002)(39830400003)(136003)(16526019)(66556008)(2906002)(86362001)(66946007)(66476007)(26005)(16576012)(186003)(316002)(3480700007)(52116002)(6486002)(53546011)(478600001)(8676002)(31696002)(956004)(2616005)(6666004)(4326008)(31686004)(6916009)(5660300002)(8936002)(4744005)(41852002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: KGsRaaF5/sK2EgKbCquCNKL4xQjQamL8GHuDYor7QmRyCP2vQSfeAZBTZe3Cw4kAsuq0XJ2QVvSRs2FKmJr2asxy+wAOBOLK5H9PjD3llfx7CC533u4mv3ytScxDixhUvof4GLR5EYjiy4R4eFsGgGeYa+1GClxnz/FYzzkdMvaKTl5R2dwqQgx+o5zlOiQw08zCPuce6bPQM9CGUhI5UUIcQaJikXQiN5shA7CkebTI0KEZg+mGrlAevdLPsProLe88XOl1xjOR2ZD0jwgqgUHl/yHmHmdBOnJbxxWqtm0FzDqvAqEgGQG14mL0TqZqhmpR7bxwXrJstlASSiuTrMWgRLM+BwIo4m88SGlJx32aOwj/SzWziGKDRsk0rKhadK1zuYrVt3fHK1QYscrC+xlYwr1WXbNGztOf+lZ1UhTMvQsq/YR5UsYjq5W05SoTnG6kKKMU14arR0H5FX/AT/7P+MQsQCnmRGDxLIn/+QqD1dv/Jp7DTLdZLioXajqe9nu0LM0M7OB5Ye4cs2p257RCc3k2G5cFkThPS/w+nBjQSExFqD//pXdFGuV0LL66F4bW5lLQgUPNtptlgoF8FagENklzsJBiIYfM3To39XhEKIZknKzxdhTzP+rj9sTMFvzKMpE5DRmlc+vU/7mycw==
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea84a97-5d1a-4a75-849e-08d889603421
X-MS-Exchange-CrossTenant-AuthSource: CO2PR01MB2039.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2020 12:15:55.9471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3qJVwa8u+7pU0XKpbJFxkWByXMvnXOYR0AmxPMtzz9/UX85qGWTuT5K9qLKHJD8yE/57C8B99HN8cuw74KOqVAePiG5plE4Ny9ZiqiLbQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6130
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


On 11/12/20 20:20, Brad Bishop wrote:
> at 1:58 AM, Thang Q. Nguyen <thang@os.amperecomputing.com> wrote:
>
>> Hi Brad,
>>
>> I am from Ampere Computing. We are using the OpenBMC to develop our 
>> BMC for our reference platform (with Ampere CPU and Aspeed AST2500).
>>
>> We need you to help create a new meta-ampere repository for us to 
>> start pushing our codes for review.
>>
>> Below is the information to create new meta-ampere layer:
>>
>> Maintainers:
>>
>>     thang@os.amperecomputing.com
>>
>>     tung@os.amperecomputing.com
>>
>> Let me know if I miss anything.
>>
>>
>> Best Regards,
>>
>> Thang Q. Nguyen
>
> Hi Thang - meta-ampere created!
>
> thx - brad

Hi Brad,

Thanks a lot for your support.

