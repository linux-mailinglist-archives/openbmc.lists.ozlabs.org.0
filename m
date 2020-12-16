Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF342DBE0D
	for <lists+openbmc@lfdr.de>; Wed, 16 Dec 2020 10:55:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cwr8w1TyMzDqMw
	for <lists+openbmc@lfdr.de>; Wed, 16 Dec 2020 20:55:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.244.102;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=O93PpE0B; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2102.outbound.protection.outlook.com [40.107.244.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cwr8635X4zDqJV
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2020 20:54:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmo8X3xopfGnweJ0R6oc14I2jLHU177CxT2GHRoaRjgatJFWER2WmS8LduR0RBSDJQL0cQ2maw0OVvvTb1XfohCVn0aU+HzQOSpRPMs5ugLibKWkwKnSjIH0CsLMjwwLM3Y9WNknQxdi/yQT+PfsUHff1Fy+GJOyBDF+ZJ0PCXmToq7CK+sOYIrl1M13fmDNUf5mk8812eNpGI5uxepoV1WwBg87L29tXTR+idNL5w5VKxO2fFHX5FQKYvg95PbmXChR9YbIjwzrcnXuzwPcv7xgKboL/xAENB7ekJa3mFEWudo7dxOfrXDrWsWrJU1fIbrV3bGgHsofEO/DaQqrYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyB5qWvQxO1EEYp9r3jE8hw+MP+D3btWOTIT5MQtU+g=;
 b=ZxknWDV5uhUjCZy1mfFYy4Rs/RQ86r00Bc9LmQZdrNNFF0AAH+VH6jVQzZLjOq8xl8uTVGJIvjbmpp2D4rLxYLwKS2TDxB1SBCHFZqbQvzLoBbMB3kzBo3c0sOjOxuEqxN5WC7UCt5zkDxWND9ByGpoKyeN3ZrsXs2bMbtchSHhK4m0UoicH4qQSKEPlWAtHnteApbOV3y1Wzw+1mvypVu3rNI/RgE3KMK8/Ia/9M2YQE0QEAoV6m2cLl5wHvARm4j8aHJtS9E1ZOrCy1hLloODdOhFMX8iv5ny6OYsSEdrgKHfB27i9hXzcwl3dziW9IrgLrKwLefoMy4w0knXo8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyB5qWvQxO1EEYp9r3jE8hw+MP+D3btWOTIT5MQtU+g=;
 b=O93PpE0BbFe0QqHoNHf6ST4vwGznZMp6d2cOGKYnjaiLCPTNHokC9lHfjtihISUC2bgd5fAxOfMdD66vMsXQBNTKbmt9WdEbVaftWrAqieJ+s6qTcqsNAwosGW0iFe9YxPgT7Ec+CxyiEx3ppehIsbn8DmSg3xDotoCOMFBJAZ4=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from CO2PR01MB2039.prod.exchangelabs.com (2603:10b6:102:7::6) by
 MWHPR01MB2237.prod.exchangelabs.com (2603:10b6:300:23::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.21; Wed, 16 Dec 2020 09:54:34 +0000
Received: from CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::8077:5998:860:1210]) by CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::8077:5998:860:1210%11]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 09:54:22 +0000
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
Subject: create meta-ampere folder in openbmc repo
Message-ID: <d5302c4f-c0c4-0bde-2a60-e943a2f41788@os.amperecomputing.com>
Date: Wed, 16 Dec 2020 16:54:14 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR02CA0205.apcprd02.prod.outlook.com
 (2603:1096:201:20::17) To CO2PR01MB2039.prod.exchangelabs.com
 (2603:10b6:102:7::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.33.58] (118.69.219.201) by
 HK2PR02CA0205.apcprd02.prod.outlook.com (2603:1096:201:20::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 16 Dec 2020 09:54:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f06c3ebc-3d57-4c8d-c2f1-08d8a1a8904e
X-MS-TrafficTypeDiagnostic: MWHPR01MB2237:
X-Microsoft-Antispam-PRVS: <MWHPR01MB22371EBA05EE160E8FA6DF458DC50@MWHPR01MB2237.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ohsJ3aOXmIv8GFlSAGt5Usjw1RrJKCYreJTGamfMns809BJO9RisFr7jAwowSzB0PuR6mNSFynbzP/jVGGZoKhRLtJeZ6cEikFBmM0Kt98Yexbj20fLxswl5es8Kk5ZshshPM8kkx+OuSMUSKfuqz5X3xQj36Oows1NN7L03uOAjsoJs7GtrEKRCIiCpChCe9rbfpBfURvF93MjdJloNWkvO6KBvGgJrmRfbxZRe0OJKjcXN4a9oU/vEtacdOI0FxUzK763u5c4mTMNfnYJsfl+IvwFAqRM9SvUrkRuAhU3UmZEdAIXuqQeVXK56vDc7zzY+sBZqA40bKqLmeKuYTJ8dvglxSoeXspOa0ywOsLNAtAJgKvKK+PtEUwjh2ew2mwu2yJnMzGUFCcC429No6BMrY5KCK8SY7i402vpEQTo7DANSrew+z6IBcegQPDw3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO2PR01MB2039.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39850400004)(6666004)(16576012)(52116002)(6486002)(316002)(478600001)(5660300002)(2906002)(956004)(8676002)(2616005)(8936002)(66946007)(558084003)(16526019)(26005)(110136005)(66556008)(86362001)(186003)(31696002)(66476007)(31686004)(41852002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ekFYOTF4eVZ5MUFJOHpueS93WnlhWkFsbUM0VlI0ak52Q3Y1cUNBTVgyK2hF?=
 =?utf-8?B?ditMZDdLQkFIRWZ6TWRpcUgrOStFUW0zdzMyeTRSUldmdkhCUTZCdndKVlBF?=
 =?utf-8?B?cmNhSTAvdjQ0NjNZMWdLN3R6TkRiRS8rRW5IMnV4bnQ2b3pNcUZhdEM0bEJw?=
 =?utf-8?B?NFB4Znh6WkhoWG1JOUdBRjJqNG9qUktpRHRYSEdFT3JlKy8ybms2WFZObkZ6?=
 =?utf-8?B?bExZVEtIZ0hiYldiRndLb2ZUM2ZoRHpWN0V1OFpNNmwzNVoxcVRFNy9ZWWU0?=
 =?utf-8?B?azVYQU1yY3pJM1czYmRTZlpzTVFIZGJ3YzRhVkl6M1U5d3BFeldhME1PSEkx?=
 =?utf-8?B?aVNVbUgzdU5YeHd3c0ZDYkVzZ3dHMjdQUC9RMzJSVFlyRmQwQjZ3RmtXRG1U?=
 =?utf-8?B?N0F2WGpHZ1VzRERoaFIvVTBlL1U2MmhBbW14SE5vSFlHYlNiMzVYeXJtUWJu?=
 =?utf-8?B?ZG9SL3cxeWdEMTNVZjRxWXVmc1V2NGFBd1VMU0h4aVFoTlNFeHVZUFRuT2tw?=
 =?utf-8?B?TXZFazEwQldvNDVLaDRsOHhwczkweEpReDd5NGdFZktVbEl4bEI0UWV4SzBj?=
 =?utf-8?B?SExWVlNjYUFFeCtFYnV1dnpTU2IvSEdBTTF1dU00REZyOUd0bk5lVlBua0o5?=
 =?utf-8?B?aGRPV1UzcEk5M1RaTVU1ZVFjcitFTjhwdFZQQW01eEZnNkdZYm5zZlVkZUxh?=
 =?utf-8?B?OFdjWXVoWEp0cG14L2wxMWttYlFXNmFGcU04ZzUvSnF0bldmRnVSVW9DcGNl?=
 =?utf-8?B?dlNmOU9QcVhtalNxUmZtbS9ua1A5QkRjc3JoaWhML0txQzZuQXFNeTZ3a01r?=
 =?utf-8?B?MGVnQzRvaUZuVGZQdHh4Y25XZFpIL2NOaDlKUzE1ZXhTZDZyemNVZ0ZSc1Vp?=
 =?utf-8?B?QmJWaHRhM3hnTmRMeHhhb0NwTFRnL3MxSk5JaTgvVm9zSXZuOXcxYy9sd25T?=
 =?utf-8?B?azhuc0EyTmdnNFhJUmN2ZEF3ZWkwZER1eHRSN3FRdUZrRURuYzFlTndlNllz?=
 =?utf-8?B?ZVJOOXpjRkhoUENoMXVRbno0b0N3TnMrdDlSb09DMlV4TUoraXVwWnBHUFg3?=
 =?utf-8?B?WGRQSys0UWE5ZXVRa2JYeG9ScXp4SGFJNi9lUGhqVElicUtPQW84cTI1L29S?=
 =?utf-8?B?eUdZa3BCVFdpT0pCZkhkV2tDZ1BxWHNaQXFaR1hDSy9oSktpQkE3Z3JQZjF3?=
 =?utf-8?B?ekZybXZNeFc1RlNFazkvVXlMUU1HVWtDWEhuVFJMRTRaVTJBaTg2RXNZcVk0?=
 =?utf-8?B?a0x1NlQ4VjZVNFY0blEzWFRPRkJDQ3pJRUU0UzNwL1g5MitOQkhIVUV4SlBO?=
 =?utf-8?Q?BsdCPCp0oFtVa4M6fV885QE5LQ56vA6PCh?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthSource: CO2PR01MB2039.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 09:54:21.9544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-Network-Message-Id: f06c3ebc-3d57-4c8d-c2f1-08d8a1a8904e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: npXuGDDnJ+9WlCRvdO4+02Ynp7DdsJpoPKwbevA1cKqJnq84xAmiyUJmr3ogcFZzny3RxAp3j4xqPOUEqQne3zxXMbCgU7pjFkjZSalblSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2237
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

Hi Brad,

Please help add meta-ampere repository into openbmc as a subtree.
The meta-ampere repository has been populated with basic bring up code.

Thanks,
Thang Q. Nguyen

