Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BA257C26F
	for <lists+openbmc@lfdr.de>; Thu, 21 Jul 2022 04:48:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpH7D2ZHtz3c6F
	for <lists+openbmc@lfdr.de>; Thu, 21 Jul 2022 12:48:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Rgc9N0dM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e88::713; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Rgc9N0dM;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20713.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::713])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpH686LgBz3c7S;
	Thu, 21 Jul 2022 12:47:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMZQwILX6Ggk2lAOkmoWR/CGfS1x7sx4GJpmyN0YuDpWY13R6WIm5rH7rr4LIHmpAhPgeI18DtC2IAF8Y+d2R90ej43ml1eAWR4vfRNnNxJqksGpNrM6JEOAzO2SAjGzcJwSDhEJuaL1HV5bHsQ48v0GRzJQCnOesJlUZGwqEcccu1IjKviUElmwXU5DqO3ABLKd0qVTGOK0dwRoUrfzQnDRFEwSpdidXx+6d9REyH9xY7SZ4S+0SEP1v1RV4181LzRo4U9JYR7EROeDEHjT3rje5ryGFeueruSyE4u1gwcWrf47DE/fKnpaplq9mtqICqEd+WglTfXMrKG1H4UQ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWVUica3jXRnISWMbst9J7Ty7BnhVPqlQFZJUlbCBAg=;
 b=F72XgQtZwqOgsU0dgHfFv2OGXXXlbMkK78PCq7PSrWRI4ZKlfHN5baYNKkTGVRF95ecd2LEVIHletX2NXjLyavl9BpVEQ4dIiqqam5mL8p1Y3EbBN9G4Obi/mohzZ+RuelDJ2yYcEC5GxJ1KrHmjc0QOHCYI00qhYDzQVtRl16GeCY3A0L0UjtYz7utk/UIq0OmR5mBHI6E9qH/iLjdSVArXELQeQv5NvVvv+7HgConqv9yXwSr0ipP3xwBQVPBpM6c3KxPcs0GOQK7xdIBqZtX9AlPbOtVTjZVJOOxSKFqjN2kK89PEP7JdHCrhFeJ5auRPRyJh4cXYArz4IFJbxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWVUica3jXRnISWMbst9J7Ty7BnhVPqlQFZJUlbCBAg=;
 b=Rgc9N0dM18Mu3xjd4VnTmL2BoR4YeOn7XdvN+6/SdZ38DYBFtlu8Q1dDFs3QAfiYS+e6ICjQz7w2WFYbGcgUgUCee0idlcFQ7Cjn6b/l5wCCkopmmqdLRSSpCrDyzijwdzlQkzi8v+NMhbPS/0+0ND74D6e2sM+HkI8d4nNVaGA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 DM5PR01MB2668.prod.exchangelabs.com (2603:10b6:3:f3::10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.18; Thu, 21 Jul 2022 02:46:54 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e%9]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 02:46:53 +0000
Message-ID: <4516d7a6-f493-aa51-2700-bbab8ea8533a@os.amperecomputing.com>
Date: Thu, 21 Jul 2022 09:46:42 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.2
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: aspeed: document Ampere
 Mt.Mitchell BMC compatibles
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 openbmc@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Open Source Submission <patches@amperecomputing.com>
References: <20220720085230.3801945-1-quan@os.amperecomputing.com>
 <20220720085230.3801945-2-quan@os.amperecomputing.com>
 <0a5cbaaa-565a-7215-5e31-12c52f4bbcbd@linaro.org>
Content-Language: en-CA
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <0a5cbaaa-565a-7215-5e31-12c52f4bbcbd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:3:17::17) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e14f0cb7-fc60-433e-55a5-08da6ac344f7
X-MS-TrafficTypeDiagnostic: DM5PR01MB2668:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	CkpkbSW8is87jdVYw8Ya51FxhW9PGqDViEzFBdWTmqW9oFCWMoX6Zs6KqHut36ZEisxFjHBBtGXrHOxXrYJKXZMagCyJTV1VO/PjmOxmAz2aR/dxa+3p0cDAcnxwZPsAGOpBMVbcMDJBqmaMew7oQzhkXFKwfeIvRqGQfhrY/l0JXphOUd9F8uGj8cQ3wgxcRnxnSJg4IuQ9hcHszUOwUulAGo+NnpmZ4rVFq7NgZ6BNKqRpBf2tvMkRlHQYvGstm7WZIEkwO9uk0ku9fyrWoNGudt9CrfsjPLYsqgJPPaTgZf5qfeDF992tjGPbyP9oUs2FJdoBlo+BjZyVVGejy1viG65iOi3RfAwrIM1NKd14GhfD/pxwRnfcn39JLETuyxaR/R4+Hy/qSPw1/E+HzlMelkbGB9FG/tN6aaTndSW2LguX4/D3IjSxOECDHA2lrgc3KxmqEtoxRhV3aI1FUDL97qIV/SYZ++slWbgfpfhcIG0KWwHFsiHNtvqljTnATYUOtHcva4u48f8/E4g5SDGDU1k2FtPF+jk5BchQMbYzYwYE4ZwLjxG1RAagAfSe2nq7L1CLvyiGpxXIECZY47A+BcyK7dmz/iDGDaApJFbHoO/jVg2uIdV1gFqK3s++o6vqbKOilhQ2RrpWJPL3Jj6zU05K6gpF5HeZand+9PdacLE65d0F+u0wo/5vV0WPUPZXbAltqGu9LLBsFpVC/fg5lh2SqHXEtgp5zLQYhKjc+M6gM71KQg0EDSbPtXmjJ7nVRZy7/Xd9aSMGs0yjBHdxepQrj9G843qJ5IU/44Ptb7sNHPzuIOOORJP7qX/lwNr5TZ1lHHojdl9wXXbTaxs0Y4L53CDQnZcFKXyjz5E=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(396003)(136003)(366004)(346002)(376002)(7416002)(8676002)(8936002)(5660300002)(4326008)(66946007)(66556008)(66476007)(2906002)(83380400001)(86362001)(38350700002)(38100700002)(6486002)(921005)(6506007)(6512007)(316002)(107886003)(2616005)(110136005)(52116002)(478600001)(26005)(186003)(41300700001)(31686004)(31696002)(53546011)(6666004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?NkhEeWU0S3l5SmljZ2ZGSUtRblE5bE9NWHdJM3VSeHpNOFBOL3FKZ0RZMnU4?=
 =?utf-8?B?RFpzSVljTVNzWlc2aXFHRzYxY01vaVFTSjBBVnlTVUE4RGtNck9pSFhYN0s3?=
 =?utf-8?B?ajFCZ2dZQ2VmRmphZ2JjdW02Y2tPcGlybGR6SmlhRWdTc0Q3U1NvdVQ5bXYy?=
 =?utf-8?B?L1ZMSHJpSVlkMHlrVEdmNlB2SmloMG9hZ3dmclVGSWE2eC95SWpYaFlJM293?=
 =?utf-8?B?bjNZSWtUUVRHdHBoWWVOc0VRajVLWTkvYnJQd2ZYcFQwK2hBU1FFbkd1Ri9a?=
 =?utf-8?B?V3dEL1lFZUt4L0owazlDUXo0cUF2Zm5ybGNYWWl2c2ZqVk5qZ2VGeXliS1B3?=
 =?utf-8?B?KzIzNlFrdHVqWC9CaFU0Y1l4MEpsMmdLWklYUGIxUlhCNTN3RFdpbDh2VlFG?=
 =?utf-8?B?NzhnOGt6OFUvRmlNbnEzWmRRSytXNzRKU012OFZxb1E4aWRlajhsNWRMZTZQ?=
 =?utf-8?B?cWZQT3BIWXRoV1VwMW1OWXZvUVlpRjVJUEJWR2pSdjM1ZUUwcHF3ODdIOVJi?=
 =?utf-8?B?cXZUekNtb0tYSklFM2czaUdaekNVaFhQSTh4QzVCMnUzbUN3TVVuUlB3cDVa?=
 =?utf-8?B?TXpkbkhNR2FpYXdUcDdrSDhDU1NPSlkybFd4clZTbVBFK0g3bnI5VzA4YXVG?=
 =?utf-8?B?MW1QdjFWemM5WFZoNjZUaERFdzdIK2hwS0FHZXc5WkxoVHpGbFMrTWpCejJL?=
 =?utf-8?B?RklYZUFpTjhpeEFSeFNCU0hsdFVlWktOYjFoSzI1bUxacW14a250QmhQeXJT?=
 =?utf-8?B?MmY5QUlzODlhbUlVcHQ1OXhjdm1ESnR1NnhVM0l6RVdoWEJ3NVZlODQ0aGpP?=
 =?utf-8?B?bXhRTXRZQVVkU3BBdUlLM0tYTjFJdXVvbmFHMlNkTVFJV0xVc1hGNFBnNito?=
 =?utf-8?B?UWFoYklkaWlLakU0SHlxZWFsTkNyTzNyUmt6bDZSTkUwQUFvcjNULy9HYnRY?=
 =?utf-8?B?NXBxWW1NOEZYOTltd042TXdMeDRKb2g2VjQzNkdlelltUks1Ym9ySHZGcVNM?=
 =?utf-8?B?Q09NYWk5SFRhWGRIdUY5Mi8vKzdheDduTHJ4YURZWlFCZmttNnZ0K3l4YitX?=
 =?utf-8?B?VFZLQzVrMGpyakJpMFZVZWIvY29hallxRC9HTXhrRWtXN2tzODc1b09NdG1N?=
 =?utf-8?B?bzBSQVppdlRDbE8waTFlNnRTbUNUM1RXNWRrS0lta1dYN0FObGM5N1U0dVAy?=
 =?utf-8?B?d0JwRzZKRC9QRzM1Z3JjQW1Pa3N2bk9qbi80RmxYbzlBcUtuYkJsbk1tSFZF?=
 =?utf-8?B?Z0F5RlhPZ1lLSkNSb0QzTTQyR0ZOOFFScEx6SW03VWZTYzJDUElZK29rSGNw?=
 =?utf-8?B?c2VkV0FjbUc5dmFQdHpSUkplUk9wYmUyTUpvM041Y0hRWjF6MEV0cXlnbFor?=
 =?utf-8?B?SmsxZzlRVllFdWpZSlJtOVdZdkt0dWl0UXpxYytZeVYxWVhPcHpDNlZvTVpY?=
 =?utf-8?B?U0J2dlNHc240U3E4S0oxSzJidFU2UE9BTTAwVkJmb2xYT3M3bUliSUltUENQ?=
 =?utf-8?B?bVBIVWYyVjVIaXE5NklaQWNWcmduQXh2UWxQVUtMQkNxNno2NzVKdnJ0LzZC?=
 =?utf-8?B?TlVaMnVlVHBML0RzRFRzZjZTWkhXamJxZHQwVVRhMW12d3VOSDVhUkhFNHV3?=
 =?utf-8?B?MnpNbjhBQjFpNXNaSkFHMlVUQ0VzYm5ITGFEZ3kxZjRudHA3VW9seEZERkU5?=
 =?utf-8?B?ZTRsclhKRzlmN2JDUDU4ZW0wNWkrdi9ycHpiZ2hrdFR1UDVUK296bmtSWjdW?=
 =?utf-8?B?djFObkYrRERRUjBnNWFGMzY2MXRCajVvcW1NcU5oa29ScnMwT0wya1RkZ1FL?=
 =?utf-8?B?ajJVcTZpOG1WbTg3V2VKUjczUFRKQmtDdWhWQU1EZXJFL1VVWEx0MkhNWTYy?=
 =?utf-8?B?alpNMkltZThvcEptd0poemtETE43OXB4MEhXaU5Hc2V0MHpjbmtwUWRlYjVz?=
 =?utf-8?B?UVhNdlFuWVZtcllVcW5Yd1BvUGZKT0w4V3FzZkFqUUhOVVEwbEpvOTRQWGRK?=
 =?utf-8?B?NG1vWVp4WFpKM1BpOS9zRDdyWk14eWVsZDI0Ym9XY1EzVWJ2bUkyR3hjQ3pU?=
 =?utf-8?B?K0ZZeU53Qzdwc0Y1Vlh4ZTRyVVlEOVZMTXdnVFNReU1CWkt1akdZeUNkK0VL?=
 =?utf-8?B?ZzRTZTNWejM1aDdrVmE3bkRlbEF2ZllkWHZTZjNtamM2NGYzUnlCamcrQVly?=
 =?utf-8?Q?B1q5ytSuNF/3MC3sbTUgLN4=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e14f0cb7-fc60-433e-55a5-08da6ac344f7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 02:46:53.8167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O9SrukKahuNxxcdUUGTKO08N0XFfP8uKwHRyWLvsHOLOLx+4ORFBeYpSeSSfkU1QpJkAq3ZvTgxG1eCzwgx1jwd7v20M1yQWIVnF90f2NFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR01MB2668
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
Cc: thang@os.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 20/07/2022 17:34, Krzysztof Kozlowski wrote:
> On 20/07/2022 10:52, Quan Nguyen wrote:
>> Document Ampere Mt.Mitchell BMC board compatible.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> 
> Thank you for your patch. There is something to discuss/improve.
> 
>> ---
>> v2:
>>    + Introduce in v2 to add Ampere Mt. Mitchell BMC compatible [Krzysztof]
>>
>>   Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
>> index d61408194998..b8146d5c4431 100644
>> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
>> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
>> @@ -71,6 +71,7 @@ properties:
>>             - enum:
>>                 - aspeed,ast2600-evb
>>                 - aspeed,ast2600-evb-a1
>> +              - ampere,mtmitchell-bmc
> 
> Put the entry ordered alphabetically.
> 

Thanks Krzysztof for the review.

Will change to :
              - enum:
  +              - ampere,mtmitchell-bmc
                 - aspeed,ast2600-evb
                 - aspeed,ast2600-evb-a1

But, should we correct the below as well? ie: to move 
"ampere,mtjade-bmc" to before "aspeed,ast2500-evb" ?

- description: AST2500 based boards
         items:
           - enum:
               - aspeed,ast2500-evb
               - amd,ethanolx-bmc
               - ampere,mtjade-bmc
               - asrock,e3c246d4i-bmc

Thanks,
- Quan
