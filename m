Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF1439D7D8
	for <lists+openbmc@lfdr.de>; Mon,  7 Jun 2021 10:46:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fz6R21ZrDz3bnY
	for <lists+openbmc@lfdr.de>; Mon,  7 Jun 2021 18:46:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=cw8rnmVk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.244.96;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=cw8rnmVk; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2096.outbound.protection.outlook.com [40.107.244.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fz6Qf2Vv2z2yWN
 for <openbmc@lists.ozlabs.org>; Mon,  7 Jun 2021 18:45:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1ux+1kEIb3R7iYuRvRkJh4m0hhw+suf94QMNnuvBZgo0xYtjZpFpXgqezcU9pizo7Wpwf3WMMZ7AMt3Yh54LWt46f4amfNiS33L59Q9XK4BgQcRc8WAe1ObLx/eGAaBSZ7mMO0BERD1IoZ2DjMm0qeNChjzAEF+yK+gMRP75K2AGJqbtXLhVqA09k4seA6RBav5t+EQ7PIYdXPYHKzhyEoxmddw3uqxMvmJGV+h1jqS30e19WOm7FNxOmHkvs14Hbc+p+LtxVmtatNrra4EC4/UnIwrBDFjfE5BhEtzsLTp8hp/0e2M7+z4pXxygHP9UUvAZjO9fpFbhjt/n+VoQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aGxRW9ykEOsPZGxJBiioQmmWGwU/GrtTuGjKRzLT0EY=;
 b=Hf/ZlVoKMto57TFyaliyOqzPmwO1kwRHi2RM19IfoZ6mFWp+QYODXobppmHaPUm4fpkjSPII4ZQ5ceLKefLWH52bBhvYhaMZ4t44+j4cvn1SWJol7UF9QKmRoO4savl5AmPoXc7Wi2DTPqhSKozTMMy3uD7vK0shUOCg6gIJk//W2EbvqmwoFxFzWdy5e6DEtODBcbdFmfoy+xPXoIX6vYI3vlSzpYVFO87HsJ3y7Xtc32bK7mzA27jhwzVjFzYGP5RfFsCfXPy5fBHPMKzn4TTS2iYay6gJfyNF/pZgp5qd94KfxyRO+ig6hWXo19SfXbqb0Oy+SNutW4zsZo/sxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aGxRW9ykEOsPZGxJBiioQmmWGwU/GrtTuGjKRzLT0EY=;
 b=cw8rnmVk14Y4+M8xzt4b6Ex75hRbLwWwkppPzeIj4kw2DRtAENZWRfkdEAoxpNmPMJcTlrWXr3HN2M/4JVoWfzatNX1XRAixD/hKSFkPgfmeQh07j+tWFTEMMeOHaoExvQlxnydJ3wthIzbOHWfxOTNbE6pPZqDnz9ru0Rdm930=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 SJ0PR01MB6333.prod.exchangelabs.com (2603:10b6:a03:293::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.24; Mon, 7 Jun 2021 08:45:35 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::1456:37cd:724f:6314]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::1456:37cd:724f:6314%7]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 08:45:35 +0000
Subject: Re: Request to create ampere-platform-mgmt and ampere-ipmi-oem repos
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <38d1440f-b3be-9147-5002-42536117e1e0@os.amperecomputing.com>
 <20210503143347.gncdsonvtqzpfmdo@thinkpad.fuzziesquirrel.com>
From: Thang Nguyen <thang@os.amperecomputing.com>
Message-ID: <1afee506-f30e-9f2e-9614-566e58ca25c5@os.amperecomputing.com>
Date: Mon, 7 Jun 2021 15:45:27 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
In-Reply-To: <20210503143347.gncdsonvtqzpfmdo@thinkpad.fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [1.53.208.114]
X-ClientProxiedBy: HKAPR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:203:d0::12) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from HCM-FVFX4014HV2J.local (1.53.208.114) by
 HKAPR04CA0002.apcprd04.prod.outlook.com (2603:1096:203:d0::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 08:45:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9402edb7-8b4a-4978-2718-08d929909dfc
X-MS-TrafficTypeDiagnostic: SJ0PR01MB6333:
X-Microsoft-Antispam-PRVS: <SJ0PR01MB63335ABBA0F30875DF0D8D628D389@SJ0PR01MB6333.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AXO8rJ+TEQ6zVxTlFkbiHJuwmCIoWts7KDjQTCxq5egiFTJZYtVwqZkbpQXYi3OUq97FtiydDcuqoD153PLnkMvdeOhFtsQfEQ8x+sSnz2/2Ggy7ORr5eNKxMT585oGOuBdTlaogWT/+yyQ4ZP48J9g6nbQVmVpqtIYyWSZBKmuywBK2Cu77inIASZmkE5AjtgWA9YHBzyUAPNyChMEwWjrtJ4yvFp+GY+zXh6LOFh2/RRI2ksueMP3cBKDPKQjL0zKNppCw6YzxR+TbXVtJBVYCK68PyQWhGqjzknH6GeemE+lfoE9Q+EfN9b6paUnhuAFQe4tqoAlCBoeweXGjk0SfabDIstjWG9cA70u4a9+cjkw3udEf2GUTa956oSCLGFwi438g2O8MdqX9/LaLHKNkiKS7zlM8L8wHZ4acgv7QxoR2Bc6VkfyJRJ1a/+4BWMBi+ypghOUxP79d4cgAxXk//G9z+n3pM9PgumI70LG/ccHMa3QTEkGUvFrdt92QR4Gcwf1Fx2wbtkWIZMiy2grOCwBR2isjgJd90mKPg8luHTC9dIgimzcsT1/LIpF/nWcAtaYjdzIh2m7/JK7/t/QtOSWZzGaDESxiKCjhFMTAxFCTL2nOgX2QLIbW/hfkOqosjBRla1yqDbGvQSwY1uwMwhIKG8VaMzt10ETiyYLPfNFfhTTnPvF0d571YsB17+EefnefeyFnjI7P5BQw0V8IaKY16KY7TC8kxEkJZC90ivVBz6ITW0F/4gEwU1bMgH/Hl4BWAGxzf5Kq+B07Uw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(39840400004)(366004)(136003)(6512007)(6486002)(2906002)(316002)(84040400003)(31696002)(5660300002)(8676002)(8936002)(6666004)(86362001)(186003)(16526019)(478600001)(52116002)(6506007)(53546011)(4744005)(38100700002)(38350700002)(31686004)(26005)(2616005)(956004)(66946007)(66556008)(66476007)(6916009)(4326008)(36456004)(42976004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ODd2SFJ1a3UwRFJsencydEs3dTFKU242MVJOL2pIK0JrSUNpU0NNOXp5ck9Z?=
 =?utf-8?B?ckxEUEdkTzV0Z0JWYWtWam1WNEEya2ZsbVk0ZVIzMjZCbnM0U3ozREZRQ0gv?=
 =?utf-8?B?ZzFsTGVDVVJzM0FPeWdzcWdnVkVKeHlrdldIL2FmV0laZVBFWXJseU5lSFZV?=
 =?utf-8?B?Z3hvWG9pVXFhUGF4d0RiUU1RbEZlanRTenJHSlVjcjZZaUY4Qk8xc2lhb0g1?=
 =?utf-8?B?cEJLcmtwektQSFVOSTRWR1NrOG01cU82SU9uUmI2djJRa21sZ3p0ajliTXRM?=
 =?utf-8?B?dzNxM1ZlTEtBditCNGpORitCdjl3bnFQMWtrZnhIRXZqRVBuMlVNZlIwQXg2?=
 =?utf-8?B?ZElIckFhbWl6aCtSWE9KeUdVTExYM25NR1VHOCs0aDNNaUo2T3BWZnBFMFIx?=
 =?utf-8?B?V2lDb2FTN2YxaDU3enc5elpyOHdPdXB5T3VScm1rVHZlNDYvY3dLblZSR2p5?=
 =?utf-8?B?Y1QyRk04T3BQaGE5d0ZTT2wwaEgrUEVEVG5sMEtObG1pVk5PcGN3citKblhX?=
 =?utf-8?B?U3JUbElDNnJaTllkeUZZTEViN3VWU3ZUYlU0OGxoWGFOakxXZ1I4aGE3MzBC?=
 =?utf-8?B?ZndyWHRST2xoR0pmODBsKzh6b1RYNDZONmxYY3VEbW9wemJMQWs4TjlGTnUx?=
 =?utf-8?B?eHNFRm5iaFQreSthSEFjMzRVQlV2NUU1dWFocGhORDBJNXEyb2pUc0xZbTRa?=
 =?utf-8?B?SXpXQXNiVHRkb0pJYTFSaFhOMnA4ZSttS1RpdGJ0dWZMeU1lenliSFJ6dExQ?=
 =?utf-8?B?TmkwUlo1bHQ2Qit4eHpBVVFxeVJySnBMR1NwbFlkSjdzZFVJaFFaWTB1Znow?=
 =?utf-8?B?dkNOWmpRekpvSGtrcEFMSWx2d1NjQ1Q4dkp3NVhRMkVTMldTOVdQaHBQNld0?=
 =?utf-8?B?TVA5NXFjOVAzUXhsZ2dXU0JublFLZkVBWVAvN2Z4RGpYdURubWdpbmFBb0Nw?=
 =?utf-8?B?WlBDYTNzSHB1U3BrenFhMWg5VkZ0U2lvMjlZeC9ZZTNnQkFYcnA4Y0pDOFIr?=
 =?utf-8?B?cXdZMFhoYk96VHBmNm1wRGpMaDhVc1YrRW9BdEVXc2JBenBtSHl1Tm5PaUJw?=
 =?utf-8?B?YkY2Nk8wWTNGWUR6RWhJS0RyeUtucWpVbXRTblpNNTZyaVJ3THoxd2t0emVX?=
 =?utf-8?B?NXg0ZWM5VmZlc1pVY1dDRHNGTml3UWRvNGJTVTFDTS9oeS82WEZUa05QL0Fy?=
 =?utf-8?B?UmRKWGdlV2svb0JlWEpUS1EwTGtPL2RIZmpMalByZkdpNzRIMzZ5ZUFGaFlk?=
 =?utf-8?B?N2FEdkNUUklzL3kvVTFMV1QwZ3hLRFovbEF3b2h0N3FJOUpRRGNYTTRGR1lk?=
 =?utf-8?B?M0kzR2Y3Vit4bW1jM1B0VElORkJxbnVuME9ISy9rQTJnQXpLS2tiNTd3eEFS?=
 =?utf-8?B?WkJJSnlJTUErOWFTUktDeHJNNVd5alpkSlh5RUlDNXpDdkpPRGczS01IbW9P?=
 =?utf-8?B?WWFzZzU4WDdhTlBhVXVOOGJTYVZ1bU8yR0twWU9GaklLMWM1bmI1K2NMWXV5?=
 =?utf-8?B?RE11Vi9GZWJPdHFzam9ZN2UraXUwMkJrV3FyV21IejArVzRCRXhGQWhPTEYz?=
 =?utf-8?B?QjllNkpMZ2p1NTZra2xoMU5takJhSTdxTWo4aXNaTkVSOVczelJnKzc3VTFF?=
 =?utf-8?B?UHljQzRYQk5ZbnhPZXRXTEcyRHNvaGtaTUtjODlVWHZ0cEJkL3pibGR4YzJZ?=
 =?utf-8?B?NFh0T1V6ekpVMFdISGxSTWo5YUtIbGpvdDl5L0ZFaTlZOWljOG1xbjV4QkdZ?=
 =?utf-8?Q?CDxKUu2f4f8UPJqLRD8QU2vZNOISYoxKIcfVfNB?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9402edb7-8b4a-4978-2718-08d929909dfc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 08:45:35.3902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t8hVor0KWiX4ldF9IrJhiulC2sywmVADQ5r/s58uvqB3Yh+W2EuWnp+pOeur+to9+G5TM3HP+TTLPb7cOpfPzFHH2ZlCqtypbtV8+uqVRfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6333
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


On 03/05/2021 21:33, Brad Bishop wrote:
> On Fri, Apr 16, 2021 at 09:05:36AM +0700, Thang Nguyen wrote:
>> Hi Brad,
>>
>> Can you help create 2 new repositories for Ampere specific codes:
>>
>> - ampere-platform-mgmt: contains codes for Ampere specific 
>> applications to monitor and control Ampere's Host like RAS error 
>> handling, Temp event, ...
>>
>> - ampere-ipmi-oem: contains codes for Ampere specific IPMI command 
>> support.
>
> ampere-ipmi-oem is ready for your use.
>
> thx - brad

Hi Brad,

Can you help enable CI for the ampere-ipmi-oem repo? It does not trigger 
CI when adding new patch in gerrit.


Thx - ThangQ

