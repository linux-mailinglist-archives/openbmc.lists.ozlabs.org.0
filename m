Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B24309987
	for <lists+openbmc@lfdr.de>; Sun, 31 Jan 2021 01:57:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSt2z3FPnzDrhh
	for <lists+openbmc@lfdr.de>; Sun, 31 Jan 2021 11:57:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.237.100;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=PWeutMBj; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2100.outbound.protection.outlook.com [40.107.237.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSt2B3m0TzDrQ1
 for <openbmc@lists.ozlabs.org>; Sun, 31 Jan 2021 11:56:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXhm2s2gzGusq7q3RhQt2/QWiGkVEfWOYKD8o7Q7tI3qaGORWIqnZSbLhVsFNSLkPQJh+oQSF5U2YeXg2PnfFs1yp14rTpSPKcGDJuzl9q71bk0arlbAKWPfRpFwuEfmc06/XHk41XOxS6zdYG2d2gQHlXYOrfHjOpUXGMP+x2X37LDoSKhkyaCgLRs1Fi196mcPwhxfzG+n9Whd7TmKAvebjyDAVLabBjElM7L1etOcqq/LHW8vAQ70noHPJJ7EsgaiFZSdncMKvB4S2JEct7p2++KSS91/kRgLXrTq9Gvd8nFwzTW4WXJbDqXwSj5H6finJcqJjNjHvqe/FeMCNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfphyh6VQt70L+8l2QHakTQaLJR56nba6QaZqg9OlBQ=;
 b=Bo3FQjTA0a2xnIz5XVHPnWW1v/j5+Awj6SBaNXEmXcTlGr019kVOqwO+RYWIoDFZbOO4zvFwJQKyOZoHEgtPwNYo6hdDMvXZtj0xsOKaFcHE4kIbeWMkCFWdSLObaXi6+Xs/Jt8bB110LmT6Kaq4zgtrA86qHFtUHpgZhG3PCrn2JjeRII58WFBR1YHw1BEi+7mH687LG30wAaCeSLWjzU1RmUGsdVyKOmdF6JJhDA5JmSYPj00qeP54vAURA26ueEFIXXMAE5K5tWaGw03++bU0CgpqFafueSY9ZGAYENqlh0XJfCr2HXp1vkYa0DDjggBZxt6Rm8sNwdgCoGIhsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfphyh6VQt70L+8l2QHakTQaLJR56nba6QaZqg9OlBQ=;
 b=PWeutMBjeK8T+AOpOCGjVa5swyOzfqZXbPyvnE33wzSOOx5tZkZrdH4iQBaeOOlBI2fewIoN6XtdSjs8Uid53/JAsdA0eUn6wZVnJfPQt81hqwTY3Pdb6E52XHGaBIhjclKXG84mGCyntfj9wARjLyEUfwOQVPhP3rCyd94PA/I=
Authentication-Results: fii-usa.com; dkim=none (message not signed)
 header.d=none;fii-usa.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BYAPR01MB4983.prod.exchangelabs.com (2603:10b6:a03:1c::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17; Sun, 31 Jan 2021 00:56:39 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96%6]) with mapi id 15.20.3784.022; Sun, 31 Jan 2021
 00:56:39 +0000
Subject: Re: create meta-ampere folder in openbmc repo
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <d5302c4f-c0c4-0bde-2a60-e943a2f41788@os.amperecomputing.com>
 <0e2507bc-f8c5-85c4-cd39-4c603a729f4c@os.amperecomputing.com>
 <da62c090-c6a0-1844-cc2b-44846b83c89d@os.amperecomputing.com>
 <3eff5596ee50878be8623c021816977f42111ea4.camel@fuzziesquirrel.com>
 <96568613-294f-8a3b-9aa9-7918b5df2d9b@os.amperecomputing.com>
 <20210130161537.gj6jhwvsnwgdkofa@thinkpad.fuzziesquirrel.com>
From: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
Message-ID: <ec320044-0898-0c0f-3e93-21bcadf49ffc@os.amperecomputing.com>
Date: Sun, 31 Jan 2021 07:56:30 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
In-Reply-To: <20210130161537.gj6jhwvsnwgdkofa@thinkpad.fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [42.119.148.40]
X-ClientProxiedBy: HK2PR02CA0207.apcprd02.prod.outlook.com
 (2603:1096:201:20::19) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.86.145] (42.119.148.40) by
 HK2PR02CA0207.apcprd02.prod.outlook.com (2603:1096:201:20::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Sun, 31 Jan 2021 00:56:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf938ac5-de72-478f-8ce7-08d8c583107c
X-MS-TrafficTypeDiagnostic: BYAPR01MB4983:
X-Microsoft-Antispam-PRVS: <BYAPR01MB498367B7442E6A08EDCFC1388DB79@BYAPR01MB4983.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3qvouxH02t9ZR5yL5h2OZqxxV/RODoi/8JvT4DOuozoVjTWh9bAAfo/3re54aGZH7bC+4Alr8RVu5Bvkd5MU4UrUox3fkH1v84ccQUpeJeMjcm0lT+15t7CVrVPmzVbxO3Sq3exDbevo7rwiDz8iePaKYmFCoc9F/g18tU7cXUd1Ei3Es+nZ5BtM6TsBPogUBVjCA6R+4XmRt6LEKf9+4XjgmjsLcJ4eLeOHAt1GjXPyuCGDUMdc/wiiS0n2V356NNEEu2bEvUwVjyep1fATWH5bB6Vqzw+SxnXC+jBbJoj/01slMxlBg8KjEKOcMft5RPTNHxntHqjwaipUlbvhA+hGVxNsm9Td0/XMTn2u/kZGARKZjN270nlfoc8Gg1JxoFRtEPg3NYDoDicRv7hvaEAUTOMVoMYLifzdlovHyEARJ7iiZqaZNnMnbhfIxXWij5UoYJgm8P1woGT/lDLuA+y8l10IINSsddg5btiNpE3+lf+inGHxl2ZcrwKXGYjktig0/txgzDuZpsPoakeGuh6q0a0uYx/HVeBeHqb8pfQ0I0h0Ym9TU/E27c1TPbnakO54/HTsDwCYYp0SN1wwMw9W2366P+feLMAeLEyR1zeakTfXYTGYzrLgUr3v7KPTXBiKWanTOniPjKamql7quzNFLSdU6/9cmoiBGYNyYbJAov7HLdcj0JyQS0UXIIcmkRnGM7EzCaY0HAIy80aKIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39830400003)(346002)(366004)(376002)(4326008)(8936002)(83380400001)(966005)(16576012)(52116002)(53546011)(2616005)(956004)(31686004)(6666004)(16526019)(86362001)(6916009)(5660300002)(6486002)(2906002)(26005)(478600001)(8676002)(316002)(186003)(31696002)(66946007)(66476007)(66556008)(41852002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eTlFbFZuOUFHeEJGb2JFNGliMjI2U0N6a3U3dTNtZVplY0pBQk4zSXJHTVoz?=
 =?utf-8?B?UWFsYkM2VmNaeUxGcUhJZWtTM0FiRWlYbTdHWkNRbjFRVm9zSGlRNUZvOHlr?=
 =?utf-8?B?VXRHZXlZZkNCVjkxdFI0RXphVmM1RmxyYXgzdjA0dk1rczZtVHplOVdFaVQ0?=
 =?utf-8?B?V3lkZjd2V2RNVEtWYkJsa2lFckY2a3hFK0I4RHAvbEptRTFPZHpOdjlBcHJY?=
 =?utf-8?B?WnhLdEEyeE0veUxoQ2dYUVgzQlRXWjVwZzU0OGxkWEhlem04Rm1nZGpkYU42?=
 =?utf-8?B?R3BYOFRlT2cvVzRhTEVRUFJoV2YzUjZEczBmaHdsTjdJWkl4SlZFckZlSGlP?=
 =?utf-8?B?eEtKQTNhRzhPbmM3ZzRXRGhzaFV5UXF3bWZTS1U4Rlc2VFV4MEpSbjBiaXdi?=
 =?utf-8?B?OW5IZHdhRmJLejc3RWlkNmZUcUE3bDN4QW9mQ2MybG55a1U3Zlo2RDVyNDNB?=
 =?utf-8?B?UUhjeS93U3FaY2NVMlFRZmpqZ1VHaGp6TjVERmJRMTNiUGtaWUcrUlRYYVpN?=
 =?utf-8?B?b1ZqRFJzcmlJM0RKeDR6WjhxeVhwZXFuQk9lKzRhenZySjVRci9aR2ZSVzlh?=
 =?utf-8?B?SmtoY1NsVzVsc09ZQ1o4RjY3OGhwM09EYVNDY20xcTJPbkZOZEJpejVFNWJ4?=
 =?utf-8?B?YmkrY1FvbGYyejJDYS9WTjNsVnFMbFJuOTdpKzVGMmJEa2xaUVVTQ3o5OUV1?=
 =?utf-8?B?RkdHV0FMbUZvS1BRQWhFSjBVNzhhVjZreXM2bWdoL3JwdWI0VFMvSVJ1TXk3?=
 =?utf-8?B?ZEZ1RkxVcmdKdG11OU0vd0NGSXpyL3ErUnZYcU5XSHdmaVpKWEhqMWlPS2or?=
 =?utf-8?B?UUtHc1VmVVUrN0ZtTy9zTGxIaFZHU3Q4WFZBS0lnVVk1aVl5Q0RqdWVqVkRq?=
 =?utf-8?B?NHdiaUdGWGtUTTdtZGh4MTBmckh6dmw3blJNaFV2ZXpYMXRsTFptTHA3djls?=
 =?utf-8?B?R3o5Y1l5TGNmOTlJc2xVdGZEUXBDb003cjl2TS80MVkxakQwTzV6cTR0R0pJ?=
 =?utf-8?B?d0RBd21KK1FoKzhHUVBrSzcrUFpKMm4zNEZITWNzWS9GcEh6QzhUT2RxZHNB?=
 =?utf-8?B?Yzc4bmoyR1dtbktLSWpZSElFQUtQUjdiTUFFUlZHZG5FZFdBS1BSK0R4eGha?=
 =?utf-8?B?Q205a00xN2Z1NENScjMvd1RDams2Rm9lai9uNlFmZC80dVdhUmw0SFJtUTN4?=
 =?utf-8?B?UlRJZnpQczZzYzZubzM4YmoyU3JYT1VBNnJaOWFYYVJiSk1nNndkaTJoMk1y?=
 =?utf-8?B?dmdtd3I4eHFOeC94bHF1TjVxQmswbkJHNXoza1lpbzAzTDlzUVR2aUpKNXBQ?=
 =?utf-8?B?SWllMFRPZDdRcUlLME0yb1A3ZmM5bzVHQzZ3NFg1VWlFemVrcE1ROWdDcDNq?=
 =?utf-8?B?L2x5VlBZTXZzUDh0N05zMDNia1lpa085a0tlQVZzL1llbzhTVW9tQVlTL3dP?=
 =?utf-8?Q?me3WwLP5?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf938ac5-de72-478f-8ce7-08d8c583107c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2021 00:56:39.1146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7kGONSCkC/acHxZRdsKQSxi9C9J1Gg23o/fBNX/zPyIDU7VNiB7mILCtOrNvUbu4CwmBUatKIltgWYL9xpqo9PjXeNc/56sw6MlYq3m3Sf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB4983
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Lancelot.Kao@fii-usa.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 1/30/21 23:15, Brad Bishop wrote:
> On Sat, Jan 30, 2021 at 10:37:52AM +0700, Thang Q. Nguyen wrote:
>> On 1/5/21 20:54, Brad Bishop wrote:
>>> On Tue, 2021-01-05 at 08:48 +0700, Thang Q. Nguyen wrote:
>>>> Hi Brad,
>>>>
>>>> Just a reminder. Have you got any chance to check our meta-ampere?
>>> Hello Thang
>>>
>>> Apologies for the lack of responsiveness.  This is definitely on my 
>>> todo
>>> list, along with the request from Fii.
>>>
>>> thx - brad
>>>
>>
>> Hi Brad,
>>
>> With the change recently in owner plugin, what should I do with my 
>> meta-ampere?
>>
>> - Wait for meta-ampere integrated to openbmc/openbmc before pushing 
>> new codes?
>
> Hi Thang, I pushed the commits in meta-ampere to openbmc/openbmc just 
> now.  Going forward please submit meta-ampere patches to openbmc 
> instead of meta-ampere.  You'll want to submit an OWNERS file in 
> meta-ampere so that you can approve metadata in meta-ampere.
>
> This is long overdue, thanks for being patient.  Like I said in the 
> meta-fii note, thanks to the work of Ed, and others, to deploy the 
> owners plugin this shouldn't be a problem for others in the future.
>
> thx -brad

Thanks Brad for your great support.

I have just added the OWNER file into meta-ampere at 
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/40157.

