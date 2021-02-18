Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE8731E704
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 08:43:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dh6Bw2xpgz30N6
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 18:43:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=pa0dxxR7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.135;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=pa0dxxR7; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2135.outbound.protection.outlook.com [40.107.220.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dh6Bg1VC1z30L3
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 18:43:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMhbhY8DvI+FKcOvFQyDk3UV3EtTVAWpUpba36QO96t1BHVjukaE8VKNQ5DhMWQxlAoAJonElRSDpcQsO8fbXCrLnqZ4lZW6ecLwCNOvMbYcKbxzN6witiWxDRBmOwsPAKufFLU2b3YFz18AJx440FnF2Rg0NRENbfZ89nNFxlb+XveTTOLVod3VQw1PEJWbiJpDGxRHSZblsS6iMVQm5KYM7WZRgOwLqXFMUCDU2FqmImV7Xd7Hm2ZfMbN7eSQ4LyqGdfU8XL+Qq65xsSv7lZpuzZl4OTpARGQq7Y79yOwz/hwVybx+rdFHQZpb6fg9UQspG0hHWvqHT3hGQ9THhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWov/t/BAr5MQuA333ewKOvEwWzEbGZk+yJZ0qBAmEQ=;
 b=SpIlFlO1VCgxxq7PwVgbuv6l1PgL2zRUDGkKBHTtvOha2kEodbPc1SI2ZU8RRZLjN8RS5b88J0PtYitL52ET2DMW3noGj3CrevEX0NtUOhiknm0vqPh1g63nSRrZD1dshX5svdfl5ydoFTmROdzC9CkSEHRu2qYWPpckDzPxTiS+r2R2tZyFMDXp3MkAb9r6uePrnWNqSzdQjQqbDMHkvOFenEgvNZME7QkJkkIh0ax9RunX3jpCvXKZvUQYV3WjR56WzqbQTjzBofiFRdS3enibgnPU5v8bCYFotf9v1N2mj/42Fz6p4CxaV1Z0Bj8KCDX7QCKbMCcvDo5iO+DjLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWov/t/BAr5MQuA333ewKOvEwWzEbGZk+yJZ0qBAmEQ=;
 b=pa0dxxR78d7xAh9WTNiaZjnDB2LLyLn/Uh/rVLx5IQdZIJa/5MhpmxSG/7jA4lvdiVuVKFQB3NU1zsfVRWU19szbce+acJ3NAurOraDebMTYc8NEmrne7ImB5MhAsqTtR1554hHpVyDxh7qnLJdC6z0i6VQMvzE343oqJjyS/4A=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BY3PR01MB6676.prod.exchangelabs.com (2603:10b6:a03:36c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.26; Thu, 18 Feb 2021 07:42:59 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96%6]) with mapi id 15.20.3825.040; Thu, 18 Feb 2021
 07:42:59 +0000
Subject: Re: Any convention on putting source codes into openbmc/openbmc
 repository
To: Joel Stanley <joel@jms.id.au>, pvo@amperecomputing.com
References: <71820e5a-1231-1937-1344-dee9f4a03600@os.amperecomputing.com>
 <CADfYTpF9yX0xheCwu5mftWs9b4YAe=ttGNNsf7GL8KkpW4dAcw@mail.gmail.com>
 <42403202-49c9-2b85-1207-4c84ec491332@os.amperecomputing.com>
 <CACPK8XdFxB4JQR09tNvV-DN4V4fiUmbY2_7+MArh_jdAs1YVkQ@mail.gmail.com>
From: Thang Nguyen <thang@os.amperecomputing.com>
Message-ID: <c0dc2002-0196-b086-4af4-b7f13a847a16@os.amperecomputing.com>
Date: Thu, 18 Feb 2021 14:42:52 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
In-Reply-To: <CACPK8XdFxB4JQR09tNvV-DN4V4fiUmbY2_7+MArh_jdAs1YVkQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK0PR03CA0105.apcprd03.prod.outlook.com
 (2603:1096:203:b0::21) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from HCM-FVFX4014HV2J.local (118.69.219.201) by
 HK0PR03CA0105.apcprd03.prod.outlook.com (2603:1096:203:b0::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 07:42:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79ba8a49-8cab-4d50-b45a-08d8d3e0d053
X-MS-TrafficTypeDiagnostic: BY3PR01MB6676:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY3PR01MB6676B38C633B85BE24CF982D8D859@BY3PR01MB6676.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2rI4DsIbZPsntoHr34RlLiFUtaRWwrYFhA3A5yc8te1jWQcYK8zUWIvbietLfc9mTndTEllpg7LHRhzeQZpc7wjOxpNFCxw69E6Gog+Cz72M3RlyXP0x52Cjkr/uYBkrX6hf1jQB5o99DcgF4kez7K4ffgrih5kDhUEyQUsHNtgl0mGSOy9HYjsytB2DgmkLyD/VDhK/sf+GhsBlBWVu5xzH0oMTKIh65SHo3EVPahwOeZJGaQSXynihiuBC4ctw8UBM5Fu7qxKY/FjhnQUZ4xJH/5/fHwS2gMaIXo1bBimUaOc2D+FzXFAYspr37OMgWRbjFTO50NiwoZz8dCPo6lSEz6919kc4k2nKNCSqoKs/WfdcmzA3OdEhr5NSyV2guycxZyXmPmKNYt7r8IRhQDbacKu5AifCAaBlfbhaBzDGow2spCEwNQEZUCr0XHGEFDvR8CQoAHbESblftnPwVEpMrQbLUHsTSltppTrPR2xfeZupm5vb7igOb4ZbTVe0OWrr0u1y7r/GEUROx2QZrC96cgq18kIZfn7hCgJDgpmJq4HIX25r4+z/XIHKm2MWrV75Nyooi4/0n34bFNkQeeG5hRGA7BpCECmbZEUXrKY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39850400004)(136003)(396003)(366004)(83380400001)(956004)(52116002)(31696002)(66556008)(16526019)(316002)(6512007)(8936002)(8676002)(6506007)(66946007)(6666004)(53546011)(6486002)(4326008)(66476007)(54906003)(186003)(2906002)(31686004)(2616005)(26005)(478600001)(86362001)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S0h5RHk0RDRueTduVE43c25FeFc4UVZyNDl3SW9pUkN4SGxRL1pUSENVNzdt?=
 =?utf-8?B?MEk3UXN0aWJoSE1VbzJTTjBIbmZZYjczRmJQdE9OS2QxS3cyWWo5b3padlFz?=
 =?utf-8?B?SE1TNUVoM01nZ0pUK0RrTm1saFdJVncvZlEvclFSKzhKVzlqdzJXdWNOZlNj?=
 =?utf-8?B?ak45RFdERDMxQnRVNTRwTnRnY1d0Z2loeG5WWjZ0cEo5dldYcHJIenlmUUht?=
 =?utf-8?B?L1BuTFpyL1B1SWFybi90dUgzKzY5aElJVnpqYUZ1R2g4cUkzKzM4aXd2V3Bt?=
 =?utf-8?B?M2MzUVpJdjhWdUxJU00yU2hXS2dqNFp4ZHhnNDd4WWNBQ0ZOOU9TUnRQSlVs?=
 =?utf-8?B?dXB0cFhXb1hPMnRGNUlGZ2Jncis3OWlVbWRNUDJZMGloK0RTM1AyRHVPWWNJ?=
 =?utf-8?B?aTI1ZnNlSXY2Z2pMbVJTczFCYW5rdGJsdUpHQzNZWmV6Ulc3Z20xWTBSWFFm?=
 =?utf-8?B?cGxWM0pOZWFOT3JWUFdva3lCR3BrRGxpMHh2YzhBd2hDMWw1MTBlcWE2TlJv?=
 =?utf-8?B?a3M2c0NTL0N1UzBQWStLc0JtVjBCQVZGbmxoVW5sYnM4TTNXcmt2ejRXY3No?=
 =?utf-8?B?eGRhb3AzaUZJSlpUZTQ2MUFETC9IbEdiYmdkOGRGNnc0R0JjWG1VS25RNHpK?=
 =?utf-8?B?b096OGdFTlhlMGlYeHFmenhZSG1TYUhuaDVpd09sZFVzc0pGNFcvd0N5alU5?=
 =?utf-8?B?aDR1T2c0TzIvc0hxV1BpVHMwMUVlV2pLbFkyUUlRai8yclAwQ3B6ZklyK2w5?=
 =?utf-8?B?c2IwOXp2bWhOLzdYRURTbXFTNUVCUTVIQ2IrNGEvQ2tjZzZYWllmR3JybzJK?=
 =?utf-8?B?NmZTalhXNGZNWjMyTGIyQU9Td00zOXpnWmpjcDlwcUFNaHJtdnQ2N01PMGRn?=
 =?utf-8?B?R0ZpVjJlNzcvajFFNzUrbkhqeDkrQzI2Zi85aXJCM1FQeDRhaHRORmptZm9I?=
 =?utf-8?B?NWErNGlFUk1uVGZXZDZpcW9pWm9lTGcyb01CZ3RZYUNSRXVkRVhseGVrbnJV?=
 =?utf-8?B?U0tRc2pMb1dEYlFjWEhMcnJPWFM4dk1iSWxmbzlQMWh1K245TUlTWnhOVk54?=
 =?utf-8?B?YnI1YTdNTWZHbERTN1VzeStEV2h3Q29kUVZ3QlY1QnlObVRXbzM3ZGxQQzlJ?=
 =?utf-8?B?LzlGaldDME04SHlmK3VBMnJsZGxHa21oY21WZWlVUjVvUkxtbDVRVzBhRU9P?=
 =?utf-8?B?dVlHT3NKS3JHc3A5MW81MERDRDQ5Z25NaXFtTkhUMndCL3hQWm11MEhrTFRG?=
 =?utf-8?B?TkVjNit2Sm5OYUNtWkZhN2xRK3JESXkyb2xwQUNHZnNPWFFnNkhrdk5ZMk8r?=
 =?utf-8?B?WjRNaGlMUnRkN2dBRHdKb0doTCtvTHVNbmxaNVIyMjJRVEs4QkxGRDJ0RGxE?=
 =?utf-8?B?N0NmcnJPMXZwTEExQmNzMURtSUNYa2dneHlaV1U2MkRLUUV0OHcwZW5Qa01v?=
 =?utf-8?B?bVNVM1VzQjBrWnhtQVBsK0w0aUxyU0JUUm03YW9jR2poQVVVdHlraXQ1aG5m?=
 =?utf-8?B?cmVoT1lLTTZmR1hCZlluVGd4dG5jdTMwM05Hb2s3ZXJyK1RJWDFrUG5QM2pV?=
 =?utf-8?B?enByUHgyU3JnZHZhUjJPaC81bW1qZThGSi9NbDBmUXR4dnZ4b1YzaW0wL2RI?=
 =?utf-8?B?d1d0ejZTQnZyQzgwVWp2cDh6UXcvM245NnNaZlBYaDFpVElBOGV3bzdHdE9I?=
 =?utf-8?B?YjRCZG94LzVhZThxNHpIRUhvZWtHMUpLdHRlV3p6STdkZUhyWWh4bFNUS1Zn?=
 =?utf-8?Q?kCtMSX5/FEofQ7ObbcVoQSyPR0XH6cAaF11lFXI?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ba8a49-8cab-4d50-b45a-08d8d3e0d053
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 07:42:59.5626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFrJcGe6LwMnIRYL0IePpeqAgfY8z2rupXOy0F8IUqrDqxLTKmK5u/YhKyu8D2ZshiUFddcat1SlzGTErKQKvAFiIBjUpyhtLGCT/IG95E0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR01MB6676
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


On 18/02/2021 12:23, Joel Stanley wrote:
> On Thu, 18 Feb 2021 at 01:31, Thang Nguyen <thang@os.amperecomputing.com> wrote:
>>
>> On 18/02/2021 06:46, Nancy Yuen wrote:
>>
>> Code should be put into an appropriate repo, and repos created where necessary.  Then referenced in recipes from openbmc/openbmc metalayers.
>>
>> Thanks Nancy for the feedback. Do we have requirement for this or just a recommendation?
> It's a requirement.
>
> OpenBMC uses a project called yocto, which is itself based on
> openembedded (OE). OE is a set of build scripts and configuration
> files for building a filesystem. The filesystem will contain
> applications, such as ipmi daemons, web servers, sensor monitoring
> code, etc. The source code for those applications comes from the
> application's repository. For example, our ssh server (dropbear) comes
> from dropbear's website.
>
> For applications that are developed exclusively for openbmc, we host
> their source code as part of the openbmc organisation on github. But
> the source code lives outside of the main yocto-derived repository,
> and is checked out at build time.
>
> If you have application code that you wish to be part of your system,
> you should first see if it makes sense to contribute that code to an
> existing repository. If it is unique, or deserves it's own repository,
> then you can mail the list to request the creation of a new repository
> for your code.
>
> Apologies if I've covered something you already understood. Once
> you've been around the project for a while it becomes second nature,
> but it was hard to describe the concepts from scratch!
>
> Cheers,
>
> Joel

Thanks Joel for your feedback.

BR/ThangQ.

