Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1862B3FD3
	for <lists+openbmc@lfdr.de>; Mon, 16 Nov 2020 10:34:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZP6W38sSzDqJ8
	for <lists+openbmc@lfdr.de>; Mon, 16 Nov 2020 20:34:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.223.112;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=XSbocq8/; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2112.outbound.protection.outlook.com [40.107.223.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZP5V0W4TzDqJ8
 for <openbmc@lists.ozlabs.org>; Mon, 16 Nov 2020 20:33:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJ8uMC7W7VYFncpisANj3+jC3c/Bbd1U5OZLfEh7O+VSClDr3Gy9e2lD/MDxQyZrwESzAkW/X7EOTGKxz3VQzEiIIomZrRYkGWxBqviY3xJfYRjrd+go/lFWTeniw97j2fH6Pu3r2w6zzGUEClz0+54oYSSU0Blkn9mPJhdoIFNbE24YqkcxgtHVg63PvGXD17tMbIYe6XXIP+NSf9OImcqW21Uz2Vzr1GyZlV1W+GrkEgr22Eu1pcZIPPrw9qK7+xGPMTLC0FfTVEBrbrnx20oAXFIDJ79wCLCJhClWjz6ZktBqpfhVp+c7xDv0q9VNz4vPPHlt1xk2Z+v3extSPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVZXR8YKH8annOQA9of7ORhxb8lvmfi5cYtj0CdPDcY=;
 b=NmCDoXAYbGrSoWGqJ6oCkOxVtNVPAOvhNqYa3GbPg4vjgtVEr9oqN8V8/NgBGfriWzz79TgAhFhzWPRVojaA6MhNaK1MIQ/ZxKYk4/KAnV/+BOdWnCI8MeXHS0Rmq3Cp/dlaFvKLNxs7zD8QwgnPNs7Q4eqfhtfC9nFrsPQaqlO8L5Kul7qe+BPrdXZVTNM8sZDsP8LG21ph25JWzTK40+8kC+c7GggN0IWyOV8GEeAjXFX5PwB8cMTmkE5CBawg2ZqeBea3/9fE9fwsu8g5GlZzBJh4VA4Vr1OEyAfG4r5OLScvtoOLiUhE7zUKT/v/onTv0oDncFiC9gwQznicKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVZXR8YKH8annOQA9of7ORhxb8lvmfi5cYtj0CdPDcY=;
 b=XSbocq8/frErbUPo7gbK3oEmmFMnZITCXIAWqroKT0EwGMP2gVtLPR6oxlZxwMaDrNxcvIhi3JJ5GV3WrlBBvv0KwNQuKRbvCI0NMaEcG9N2M0ceBH5x6ztv8qjVi57wTSwGS7dL20FibexPjNBn24KsdBR43ZKbvRfAtQPCRno=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from CO2PR01MB2039.prod.exchangelabs.com (2603:10b6:102:7::6) by
 MW2PR0102MB3403.prod.exchangelabs.com (2603:10b6:302:2::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21; Mon, 16 Nov 2020 09:33:22 +0000
Received: from CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::9406:896e:16e9:ed0]) by CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::9406:896e:16e9:ed0%2]) with mapi id 15.20.3541.028; Mon, 16 Nov 2020
 09:33:22 +0000
Subject: Re: New meta-ampere request
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <fbcb9c2f-553c-6ebe-d2d1-69dd072a25ad@os.amperecomputing.com>
 <F47638BE-9654-4837-9FE3-1AB188CDB04C@fuzziesquirrel.com>
From: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
Message-ID: <51c0cb92-49a7-41f4-b9c1-809af5388109@os.amperecomputing.com>
Date: Mon, 16 Nov 2020 16:33:12 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
In-Reply-To: <F47638BE-9654-4837-9FE3-1AB188CDB04C@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR02CA0179.apcprd02.prod.outlook.com
 (2603:1096:201:21::15) To CO2PR01MB2039.prod.exchangelabs.com
 (2603:10b6:102:7::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.33.219] (118.69.219.201) by
 HK2PR02CA0179.apcprd02.prod.outlook.com (2603:1096:201:21::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.25 via Frontend Transport; Mon, 16 Nov 2020 09:33:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac5d8523-647f-4416-e782-08d88a12a8b0
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3403:
X-Microsoft-Antispam-PRVS: <MW2PR0102MB34034B0F435E33F7ECFC327D8DE30@MW2PR0102MB3403.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vsarCnlhnpUECELmGDwooJ8KQc+owAaIPUHIrCy9QF6qaXM40WpX1kgS4Sq0JaA4gK/ivv5DwcwBxVWDpGWCKTMAMe/m5ZDUakmGKwsE1ykpwYNloTJs5BdOBxu588IoTZdQje/0553UblpQpTy0wK1d17jNL5Hq8mNo7EwVCQdyNTrT32eNy2KtfCqMaJ/t3vkKg6ef9rjQQllR57vV8y0jrHRPXmJEL2eZjUk3thceLD9nTAw09X6M4nR4cIBfK9KVBy6ygB6uHPVuT+63lcsbAT7bJZ0TQTF3VJwlfvx6Dk5JOeG/SdYBJNk4LoMGf28Ras4l+13vQNOtBjVZwLKdgGWBSss3AfaQ9v4t1Q1aVaoqTXmAZ60O1rlXYwaaeDBjFivsfe/fbKeengde7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO2PR01MB2039.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(396003)(376002)(346002)(136003)(66476007)(66946007)(6486002)(66556008)(2906002)(8936002)(16526019)(26005)(186003)(52116002)(2616005)(31686004)(956004)(5660300002)(53546011)(6666004)(316002)(4744005)(83380400001)(16576012)(86362001)(8676002)(478600001)(4326008)(6916009)(3480700007)(31696002)(41852002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: ysHPbd9s51KjhIEDinKPgTlTntXjJFUbJaKWThBtUO6gq10BDwUxUtLwoqf/WTiXeUAOBZyfXnkV5zcSCSnSokJ5lGqFtyXpb6YI3uMSaaDppw+uqW4bxLtt5rW1dylpSaddtYZfF5Efwwku05gCtXW9F+196tuIlaOkX3xsrFDHyumj4LY6jaNOMfZz1PIZio8GOYRsfabkBMN0zFHdE4J4yp8q4vTByMxHQqUdUQ40yl3iTgX3x3YlnwCzuUlUdKpB5/vxcF7s6wgK56lv6rzfIyNPkZRvph3WxqNxqwOT3Lpyl6Fp6Lzg4mSmImf0Sw5HiFxFiOG8qlQa3o94Lq0Gt5WMLs51psurTtO3Z3qqzcVLZeX38AspFQbCOitCc5sXMPxQF1+4fzkREcO7fQ2fUhPlEc2ArcdGjCCB5juSGkFdwddlSxlsxoTT9+m3mAQsMnN70nv/Q+yoZ+u4oAC9dOvp4VbRpYSOP+g3ZqG5qG0wtoUXzqSxLk+opiEGiAdCk3M6EZLJz8B3ohxWFEwjmZ960I5FHt1avmNB5zluI9beKnwZN+TZdAo5zOYpndlikPetMjYYmvuHMNV4ZdOFvZGMynuRWju3Y03nK8hXFdeg3sYlTwTntvK2tomNoTZ+1Xuq1aDDKjz136RINQ==
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5d8523-647f-4416-e782-08d88a12a8b0
X-MS-Exchange-CrossTenant-AuthSource: CO2PR01MB2039.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 09:33:22.1673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZQUNGAIwLYpe8a+ggOttCGlPehAWww/FAxG08PsqpuT1HwQFZbtXVRsc5p3Ng34ZXDu5KxHiQDTR1dq7DAmmtD4FbbFjP+TkwjHCEvSsyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3403
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

I am sorry for sending you the wrong email from maintainer list. Please 
help update the email from Tung Nguyen as below:

tungnguyen@os.amperecomputing.com (remove tung@os.amperecomputing.com 
and use this one).


Best Regards,

Thang Q. Nguyen

