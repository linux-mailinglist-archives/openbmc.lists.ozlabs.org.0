Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 862FF30998A
	for <lists+openbmc@lfdr.de>; Sun, 31 Jan 2021 02:02:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSt8Q5fDGzDqQq
	for <lists+openbmc@lfdr.de>; Sun, 31 Jan 2021 12:02:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.223.120;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=s3D5k7bo; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2120.outbound.protection.outlook.com [40.107.223.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSt7R6sYjzDrdY
 for <openbmc@lists.ozlabs.org>; Sun, 31 Jan 2021 12:01:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocUKHbdbNouEK7B+ASeyhUt03C3gGSBJFl4RV9QLRZvsDFXb6hOw+905NSuBMPPjTNrj7VKCLyX7z6WcM8eShMIRzmG78Pv/30/i6F3daaTiUkAuLos9+NZvPwWpcJj7sb1X6JSgLirkVBZooGvUEjqexqsNTPhN45wE126O8tuxg8/MSPjgneyT8h3LzYrip5rSenW1D0JjlrGClk2J9zrUYjFISKziQbE+6PIPW7/G8Pist0J58sv2RlYpICDz0rS4OBze+cPHmQO/Qy+YZFvykAszSY9avrJ+0juEgDicEGlavGm1SfRGwFpLVAiCfCjr91N/NZr1Jxn1CkSAxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POQWvrgDe55Mi1aQxwzwyHzmVknS2/1B3ncwOJ85l3Q=;
 b=b8WN6Z8AtcVivaOXEz/1xznTcIAA0DogwScAB6h9kvf+g7zyjwK2WUTMHo9ck87xA2L12TcT97bi0aHN0pXM2yEfN8RhqIGcEmqIFbtbO7EiNXJmmTgssTnm7qhCiF3zFr1WP7J1PIw5WyYQGAjMH2lLdV7FQzXRv4eRv4zq9QOeXcdm3ZBOGXHeLpEBavW4XRjRFlcNMONT803HsKlB4j+TuRxWTgysV3RWPQD5ik/iH5F/Mgq/cQ+8Faz6WE0YmpKs4jqYpg3W5xa7gqsgmDK0X6FT3ii0gZ3wLzugvN2cMPIGnrOz+rpKRFN8Hu/LeAr2x69YyL03AFk9qIZzBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POQWvrgDe55Mi1aQxwzwyHzmVknS2/1B3ncwOJ85l3Q=;
 b=s3D5k7bou/fT42OJwxMRZA5Vxb/DZK+GJi4j+6JHB+3gQBYBhzA4GTjUw//1mP5nIXTQl7lg6gbUD1BiwxuiO2cya3Kw5c4rLOhD9uEBaFGWImBd1pd7vy/2o/Tb0seqBoO5JcRL5zxmFlgC82zLZHi7CbGcgZugjsM2MmD7faU=
Authentication-Results: fii-usa.com; dkim=none (message not signed)
 header.d=none;fii-usa.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BYAPR01MB5366.prod.exchangelabs.com (2603:10b6:a03:125::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.19; Sun, 31 Jan 2021 01:01:14 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96%6]) with mapi id 15.20.3784.022; Sun, 31 Jan 2021
 01:01:14 +0000
Subject: Re: create meta-ampere folder in openbmc repo
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <d5302c4f-c0c4-0bde-2a60-e943a2f41788@os.amperecomputing.com>
 <0e2507bc-f8c5-85c4-cd39-4c603a729f4c@os.amperecomputing.com>
 <da62c090-c6a0-1844-cc2b-44846b83c89d@os.amperecomputing.com>
 <3eff5596ee50878be8623c021816977f42111ea4.camel@fuzziesquirrel.com>
 <96568613-294f-8a3b-9aa9-7918b5df2d9b@os.amperecomputing.com>
 <20210130161537.gj6jhwvsnwgdkofa@thinkpad.fuzziesquirrel.com>
From: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
Message-ID: <94d1598b-0dbd-17ad-3326-c581d583cc41@os.amperecomputing.com>
Date: Sun, 31 Jan 2021 08:01:08 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
In-Reply-To: <20210130161537.gj6jhwvsnwgdkofa@thinkpad.fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [42.119.148.40]
X-ClientProxiedBy: HK2PR02CA0152.apcprd02.prod.outlook.com
 (2603:1096:201:1f::12) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.86.145] (42.119.148.40) by
 HK2PR02CA0152.apcprd02.prod.outlook.com (2603:1096:201:1f::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Sun, 31 Jan 2021 01:01:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b83c0b3e-516a-4d77-0695-08d8c583b52e
X-MS-TrafficTypeDiagnostic: BYAPR01MB5366:
X-Microsoft-Antispam-PRVS: <BYAPR01MB53666091798C2720175CD9C28DB79@BYAPR01MB5366.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6QoNGVo+2JWTWIcsns2e0DcndYEoaU7xvZ5NX1XT34Wexd2lSeKbsDCRkJk6X4QHHc+q/e+Zf+/pzTI9V9teAXFyJvzsLKTRb04hDxo8y9DWUZu/2orDeZnEMGHN55qCM++JaCtUTNhzFH0cePwFIeBi0weToQrZ4xi0ssM+AgRk4BR2PsGfpc5D8emC19vdqRguIltHla3wT7i+lYLzpKJWoVqx4P5bRdmLLDuaHSYweyeFW44tdIXYnidNhZ1ywS1hf66IoDBQuAn+nTdmzPMEl+Gc0Y09q1L1onc56IbTGVKJPTYU1hTuZD7GfCElfsPx0MgwrXL/qctpRYpiRFl6IQFd4ssU6Z6QundkLCdVplwZeZ0BvQMU8f1q3SBv+sekPU/W81K+vE+Tv3t08gLIyU7NwoUZTTWeyHcf1DUMNtqNAihQ6HE058Dp69UwJrSSfv8irAIXuDbj2a50WcJFgPmDwt7mPcGZ4miOnAG1HmlyZCKIeA6q2T9VZejlwYC4AFu6dwYJ/2fzcQer9vPmZJbGIRsfl/VaG0TcvWmJqE9imvsLW6qdmYa1NVOx7vrO+Z6nBu10zCqGi0ZZdDmySybxALjLZzQesnGQeNT7AAFrTNOqyahDzZOyczNMKe6QcHGo1ztonHzGTTMiDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(366004)(346002)(376002)(396003)(136003)(5660300002)(6486002)(83380400001)(8936002)(956004)(2616005)(6666004)(478600001)(2906002)(31696002)(186003)(52116002)(16576012)(16526019)(66476007)(53546011)(86362001)(316002)(26005)(66946007)(4326008)(66556008)(8676002)(31686004)(6916009)(41852002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WlNHU3c5RVJTR3IrVVV4RDR3ZlU5MUJscjdMM3E0ZHN3VFlyOVBiT1lKUkxB?=
 =?utf-8?B?R0RaWElFS0ZrSGRFVXl5ZHJzSHlnRWxiZVdQRzRKSk1LK1J6R3V6TUYyTDNC?=
 =?utf-8?B?SlNySmtzL1h4Z3FhelFtaFVSM2R6LzZxYlRVSytxVjg1blMyczU0bk1VcGtt?=
 =?utf-8?B?Uzd1alZKajZUQkQ4cEtHUUsvUng3VWlzYS9XY0c0RUpBUlRMa3k2RVcrbWZr?=
 =?utf-8?B?cnlsMmE0UFlMdjh6NFBzN2o2WGxNc3UyY242NHJhbUtSU0JxRFJkSVFyWUdD?=
 =?utf-8?B?TjZqRWN4b1Y5RlhnOWhML2lPckdISWJZdTEvRFByT3BaUmVQZ2x5WTJ6Wmxn?=
 =?utf-8?B?QW0raWcvQnJtRko5MFoydDlPYUtGSGpqdG1BSXpkWk9XYUYyVTZTMUZRZy9Q?=
 =?utf-8?B?RkFLQnZ5dCtSSWordUJnaUR6ZDlOM1pKRG5PdXIzSGswNHpUeU9wd0VnbUJm?=
 =?utf-8?B?VnYvUVlFWVF2d1oyVW0yQU1mN3QzZzBLZkZBOVgxU2RXZ2VoeUZmbXA4ekps?=
 =?utf-8?B?YkFNQ2JxWDJpSnFuaVdDMUFaanN0eklVUm1kd0lGY2RiN1VzcVJRb2kxbmh6?=
 =?utf-8?B?UEEzZ2RuelhVYWJ3aExidHR1ODVzM043N21BUjVLNERDOFVIcm10UndXaVh5?=
 =?utf-8?B?QWEvQzl5MC9yWlNMZjAwQVhoZjkrczZOWE9qTFBLYm1XMzZjZU5oTWo4OUd6?=
 =?utf-8?B?K2Q0Zk9LdmRJZXorcXo3QndtLzdXMUIwUFdYZW13dGFVdm1kajlLRm9qZ3kz?=
 =?utf-8?B?aEs1OXh1elY5ZzBtU1NIbFVQbEp4NExCUFVCUWI1aitVZDFYNUJZSFZJd04x?=
 =?utf-8?B?N2RLc3ZCNk5qTGZFUjE4T3VVTVVIQ3lnNlFDUkRLZHBBYUJhV09ZQXZGeCtI?=
 =?utf-8?B?T1VEZnV5YXJpdEh4dHNZTFM0ay9JSDFyWXR5ZWZVWTBZMHRPTkpIK2h0NEcr?=
 =?utf-8?B?T051YnN5Y2FHNzhDZ05QTHdtZnBYTGpYR3NhOHl5YisrWHp5M2RZaXVOTnBk?=
 =?utf-8?B?MVpiYTJQWFovenMwc1d1cnhpNXhqZDExOUhTVHBRRTd6K2l0cFYwbFNxaVVq?=
 =?utf-8?B?dGdlYWlZWlo2ODcwWThNazZiTjlaWTdsZytSb3pBeENMU21BTXVxdjdxOS82?=
 =?utf-8?B?VzI2SkE1Zm1BOGIrWW1KRHFEYW5KRjl4K2V6Mm8xZWxWNUI0aVpzcDl1QUE2?=
 =?utf-8?B?UUF1bjJRU21ScGR5VWZYVURCcUQxaUozSnFmSS96Yk9rT1ZReEF5MXdZY0xl?=
 =?utf-8?B?ZVNVV3JTdXhiOFJpYjhidXFUbGx3NGFvQTluclNMZ24wcG1BSGFTQUdsalhy?=
 =?utf-8?B?WUNpMEZkWFcvNVFuVEhzZ1drM1FleEpaT01mRkdXQll5ekVVVDBLdmJ2OEh5?=
 =?utf-8?B?ZE1sNUI1WEFSaW8yeUo0Y1hTd2hocnhUQlU5Yy9CYVBhUHY1cGlNQUJSY0RZ?=
 =?utf-8?Q?VwqJdgp9?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b83c0b3e-516a-4d77-0695-08d8c583b52e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2021 01:01:14.5118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxQCHIJy68FwxFEBlT2rDIvyPG59gvJussNbDO/Exg8koBH+uEXM+R6g37L64+vw7GLRc+8tAf+KWYwA6BVcoSpxlatpynCeNC0769JBoqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5366
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

Hi Brad,

I just see 3 commits in the meta-ampere folder while we have 17 commits 
in github.com/openbmc/meta-ampere. Are the remain still in sync?

BR - ThangQ

