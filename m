Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E1B6A02E1
	for <lists+openbmc@lfdr.de>; Thu, 23 Feb 2023 07:41:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMk2l0dxdz3cLx
	for <lists+openbmc@lfdr.de>; Thu, 23 Feb 2023 17:41:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=gMNt/KaP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe5a::706; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=gMNt/KaP;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20706.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::706])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMk244PBHz3btb
	for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2023 17:41:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1/idtXjQtXr77E7kCFYgpnGLDxbSRUxcgT++VLaQfezxy61zzinjDjonD5XI0sbzdUhvk+GcNSvn6uX50/+RpOJoMmZ1vVfkdhDH7/8Z3CwW0lvTxZFRj4F8pI9oY1UQ/TQ5dd8SO3P4iz8iShoyZ2ViZYFl1rLXGeY94Qli1T1K1i+Lo01ilOZjsLI/2TMlgREIjiGUG2V1FQP7gXR2tG6rZBFWEJNFuR0r94xHG+OikBBBsZC8/AOfJixxqdux5+IGLdZel0tW9cwJF1kIesPN6C8qCdkEr2VLRbfO2suuii2P5DutLoXV3F5kE9JMijEb98SdYH3rDQIBgYhQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvHB8en2kZtP/dQfDUzjUsRxq9gZL01WKFikCxshVA0=;
 b=RtenZmV0/il6nlUB0SsQ/M8ict+ZF4MfcoW1yhL7u9XeNm9ljI9TZswgfG39yihJugmQ22oj6fZw1gXN8I4MIjxiT2FmhaGKowy+R3dPvH+QYS6/36XZ3GxzG+By1AA/53lZSZ52OBl09D1eUYWM//JX5qWrnNyHd8k2lXrzMgDGFiOE2Zot0oF8Xr2GeorMdyfZqZOCQMN3Et6JmVXMb9tXCOFRMuWl7rH3BBRDqVLFQ7ppJuzmLT4w/5MXudTaKCtyuLmv3emlCj0qEyasnv7lkWCloEqZTm9OvSvnZ5rsrtTB819pX78RdmjNqX1Xl6CGDYRK+f8K/9LW8I0svQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvHB8en2kZtP/dQfDUzjUsRxq9gZL01WKFikCxshVA0=;
 b=gMNt/KaPoBbUA8sxc4OyzpoHktPTicdZ5+ypH3eLEOY0br8CE51QmFDa/yTkPZlVhPQjNLRGGbEfeyoBuvoa+1dMKjT0bWMlConJgTBy7+1SuA3DMGkKv1VcFy5LQeHh3t/Zh6OUe1giF0bA+H0YlP87layr4z/u5p9bKRSioNM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 DM5PR01MB2810.prod.exchangelabs.com (2603:10b6:3:f5::12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.21; Thu, 23 Feb 2023 06:40:52 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::bf6:8038:9fe8:1588]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::bf6:8038:9fe8:1588%4]) with mapi id 15.20.6086.023; Thu, 23 Feb 2023
 06:40:51 +0000
Message-ID: <67315b49-1703-d1e7-921e-b3958f164135@os.amperecomputing.com>
Date: Thu, 23 Feb 2023 13:40:34 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] ARM: dts: aspeed: mtjade: Add SMPro nodes
Content-Language: en-CA
To: Joel Stanley <joel@jms.id.au>
References: <20221118065109.2339066-1-quan@os.amperecomputing.com>
 <46a56ab4-fda5-0125-1148-d7f8d7726cdc@os.amperecomputing.com>
 <CACPK8XfW0hkLOiO4X34eGVDVaw-TXnQL6ePR8F_y9uwLRyFgzQ@mail.gmail.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <CACPK8XfW0hkLOiO4X34eGVDVaw-TXnQL6ePR8F_y9uwLRyFgzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|DM5PR01MB2810:EE_
X-MS-Office365-Filtering-Correlation-Id: bdd42b0b-a975-491e-594a-08db1568e785
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	QBRjRdzmntSHJqdWGr2oS9kBSUlketg6hvAf4x4wGStHwGVKo3a9eTMxRmC3z5fHnFX9gBYhQ8tJzdbERKpZEf7KY6N1DCWsFND1Hl1IKbfh2FlQRJql8q0qoXguN42MTrlee6TmwSC3Th2VCl9JY0tfwZilE6QGsgKBcu+vtGb7BeWy8yJ/ZHguOir2iMPLA8lttcMa68bCy2CSFyF7GxsIDohQtqfqj0i8VTHRtYHdv/8wtV5iGfCLubA68tmAvzM3N0UEZ75WRZJa8s1628ZYSGsuBlprzx7BOmtpQ+sSVVgYGF3bUoUgetdJsNfAAp0syJ+HBKUCEaMFktoRnCXd/dDTy0n+ztP6m/3B/eww2T672i66dbZHb9VZEG14QQou7ALVbHSXlTwXKHIzY4MswLIP3mhk1ASW/FRuEGaeoNkb2rMTECjhyvysJk0nA0nAatW39HPS/GJtxfrirql1RfflyCnfdTY+/MRNIPW+lEfVdgrIK5XVAgvNGsxbuG0/U6fxJEHuGRCtYakvRAKSYi/oH2UKgXwOLiy1HweRooZb/Tf3DNfsL3vVs2AQSsn3Q4Py1G8+tPTnKuq51c58zoiBvhjj2j581witIZvphzX/X9fe3hNNtWwskIHr/8VHcJSpT4/KZ8K6pRMqBzU3OUMKIryJjtQfD+rYjh+q4I2byptbHeL0AqyEikBYczmQol4o9UyTk/r/S0jfm0u2wbmC2KcUw5wpRiP9li4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39850400004)(136003)(366004)(396003)(346002)(451199018)(478600001)(107886003)(6506007)(6666004)(6512007)(26005)(186003)(41300700001)(66556008)(66476007)(66946007)(316002)(6916009)(52116002)(6486002)(8676002)(4326008)(53546011)(8936002)(83380400001)(5660300002)(2906002)(38100700002)(38350700002)(31696002)(86362001)(31686004)(2616005)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?aSs4SlQ5ZWdMYlhES0lwWDdhNXUyWitWeGNUcDdDa3c4VTdUQUtvWGd4bHA3?=
 =?utf-8?B?U3JRem5WSWhscjdKTm9oekNSRk1tcU1JVU5BaVFjNEZXVHR6YW41SzlZWEdG?=
 =?utf-8?B?V3VPemNmblBZSzB3K0R4WGNRMk5wcnRlbUtHb1VpUU00NlZZMmNqSmtZbUV1?=
 =?utf-8?B?cTR5L2JIYUpTOWtWR0xTc1dlejdUcEhsUXhUNTRUdnpLdHBrMEk4UlptbDN6?=
 =?utf-8?B?ME1aclRuN2s1VDBnaFBzYkxycGZBVFcxMFlnM2RzeDM2WGs5OVBiMkQ5S0Jw?=
 =?utf-8?B?cUcvU2xsOXpRL0Q5NWdpWHlzcHRBV0pHb3VzdUlhcXNFV1FISkFKK01xOHlM?=
 =?utf-8?B?bCtmQ2xFVk5kakZwdzBQaEw4UlZiYnlyN1ZPZVlKKys1cU94MXFUUTB4Mmp5?=
 =?utf-8?B?bStXcUR1L0Nnd1Z0TUZuM3dlWnZqNVhEK1dnZDlGdG01blZrZk9EVy9CNjJC?=
 =?utf-8?B?QWNrQUpVdUdLUmw0NUova0RRcGZya0NYMlpWSmdtejZZdENobmpBS1NIbmxw?=
 =?utf-8?B?REtzQzN0UHRiN3pxSzJUeXgwK3pWSGl6T3pHbGNHM1dpV1k2dHdTTXNaSEVV?=
 =?utf-8?B?SWQ2QnVBb0szQUNrZTJtQTVWeTJ1cFRWNGZqa292clM4NElnL0ZVQzB0TG14?=
 =?utf-8?B?SHlxVTR6S0ZxT1RjbmFVWWpva21hVkxmeGtQVGwraFFrRGwxeGVjb2ZHQzc3?=
 =?utf-8?B?d1k2azV2SWQ2ajEyK3F6MkVBYnY2WCt3eWVzSmtYRDkzTzdsYk0yaHVrMjZ1?=
 =?utf-8?B?YTFjYlQ1eHYwOEhkdDZCZXQ3bkkzY2tld3NwK05qVFE1ak9heDYrTEowd3ov?=
 =?utf-8?B?d2xIME4veG00djNoTlBXWGxxVUV5MTFiVTluU0RieHJlOW9rVy8zejVBclg1?=
 =?utf-8?B?d1c4R2NGazBlU251WTU4ZTB6cVRTd3hKckFMYXQvMXdZVDdtdWJ2YitpSzUz?=
 =?utf-8?B?V21zTHRhS3BTQlJwNUh3N0t1ejB1dklkRjZhSyt5ZW80NTI5SDgwWDNScXZG?=
 =?utf-8?B?M1JnMFJDSFd1WUtRa3dwbG9ZQ0FNS3BnZ1ZsWUVIUm02cGs1bjlRWlkwM2U3?=
 =?utf-8?B?WWhhZEdyc2FuTXpKRGdsV08vNFEyYy9KRnpsWXV2bzI4aHJ6ZFAwZWpxbCtG?=
 =?utf-8?B?ak42REZLU2x6RXdxNHlxcXpqbStENTJyY2h0V2h2LzZXZXdkQmE5ZEtiSS9Q?=
 =?utf-8?B?M0pOSUx3VjRhUUpTOE9rZGhCdmtvdUN6ekZwS2s3Zm1EOVJ6NWQ4WjQ5ZVV2?=
 =?utf-8?B?N09hUzZhTGF6bDZTSi9iYmRhSXZKNHBtYmJNNkVadE1RT1Jpd1EyOTBCVFoy?=
 =?utf-8?B?bUc0ZktkNXdLK2I3MW01RGlBd1UrOVlZL1hEVVBhRnpkUWlLSGxOTEhTQ3p4?=
 =?utf-8?B?dkkwUWxMcWRtZ2hQWElLUWVXRTIyR2ZOR1pyNk1ITTRPd05MYjlJK1djZUFE?=
 =?utf-8?B?UkpubWkxbEpEWVp1K1YybGZWQm1LaFhEcHgwN2RQWlo2U2JGWE1NS0l5K2RX?=
 =?utf-8?B?NldWUGdHaWl1NTdBVHg1Uk5HaEtOdUxMN0RJSStsaWNySE1kM0hoQ2R1VStP?=
 =?utf-8?B?OUpXTjYzYjZNUlpkVFp3b0w5R2dMdWJaVUUwakJMRG9lb3ZYdXlzN2xvTUdS?=
 =?utf-8?B?eE01TDRNemxFZE9Fb2VaYzVmdndmWTNHbm9pUm42WEl0Tnc3MUdEUXhJakdp?=
 =?utf-8?B?RXk2MlZDZmNvb244L25WUVp2bzlibm5tU2FRU3hUWnlUMjlVVThNT0kvWnNl?=
 =?utf-8?B?dzZhbDFWRTBVTjFBY0tFUUIyWUhweVlRWXVSUlVXenR3T0xLNU1xUG1NcDRr?=
 =?utf-8?B?TnoxajIxay9yQjJ2eVNpQ1RCRjd2MXZFejU0dEUzSCs4ckVIbnBNTGE3SUc5?=
 =?utf-8?B?akN1aFB5OEgwR3gxY09XSDU1MW5Ra0xiZUpud0RBYXNKbmVqb0p6TW9pQUx5?=
 =?utf-8?B?TjhGVlNQZ3hXYVU5OHhUMDNRenZsVkxHQWxYVE5ZM2g2SU84WStqM3JlR3FB?=
 =?utf-8?B?K3ZYMzZZSmdVbnd1K2dLaTVuUEpiTEFNY2dhQjRxcDZhK29SUUtlcXJQZWgx?=
 =?utf-8?B?dXA2dURoYzE4VnFQb2JPTllhRmpkcTN3SjVuYlgwaXlVU1l4bTV5a2lTa1hq?=
 =?utf-8?B?LzRCUFBZQnlEK3MyV1VVVjFDNVJadCtrei8ra2ZnTzNxZGkvZ0ZIeWZZSVlj?=
 =?utf-8?Q?kt+tUX1JBMp2KOFJIeGkM/0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdd42b0b-a975-491e-594a-08db1568e785
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 06:40:51.5301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qfd+/hFruQ6fJXNEY9h3dK4oPsAl7nrAYzS/zNP5GikOMTE7vYmt/14OtAHbFoUhktpwrTAqAWL/LnR8iOvVzEXOGc2ILpt23sqyXUTiNzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR01MB2810
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
Cc: openbmc@lists.ozlabs.org, Open Source Submission <patches@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks Joel,

We will switch to dev-6.1

- Quan

On 22/02/2023 08:16, Joel Stanley wrote:
> On Mon, 13 Feb 2023 at 07:43, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>>
>> Dear Joel,
>>
>> Can I ask you for help to pick this patch to openbmc/linux dev-6.0
>> branch? This was accepted in linux-next but not yet picked to openbmc repo.
> 
> We're moving to 6.1, which includes this change. As 6.0 is EOL from an
> upstream stable perspective I won't pick the patch into that tree.
> 
> Cheers,
> 
> Joel
> 
>>
>> Thank you for the help.
>> - Quan
>>
>> On 18/11/2022 13:51, Quan Nguyen wrote:
>>> Add SMPro nodes to Mt. Jade BMC.
>>>
>>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>>> ---
>>>    arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 8 ++++++++
>>>    1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
>>> index 353359822d7b..0a51d2e32fab 100644
>>> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
>>> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
>>> @@ -354,6 +354,14 @@ &i2c1 {
>>>
>>>    &i2c2 {
>>>        status = "okay";
>>> +     smpro@4f {
>>> +             compatible = "ampere,smpro";
>>> +             reg = <0x4f>;
>>> +     };
>>> +     smpro@4e {
>>> +             compatible = "ampere,smpro";
>>> +             reg = <0x4e>;
>>> +     };
>>>    };
>>>
>>>    &i2c3 {
