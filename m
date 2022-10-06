Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F5B5F6159
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 09:05:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjjBB4xhJz3c3W
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 18:05:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=H7nmxxI2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.100.123; helo=nam04-bn8-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=H7nmxxI2;
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2123.outbound.protection.outlook.com [40.107.100.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjj9Z2SRJz2yZ8
	for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2022 18:04:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LkmAP84iD1Z1kBvik/Y7et4SKTNBIZCzpibjkLNQ9JzW5w/q37zyFkIlxxNeNn91Mu0TBkBLaamUtO41Vmo4GCZ2O3W43dOZQUoSrMRbp56jnlVr9fQw/VGnmqz7o6U5PF45sEwLiC1Od6tZnJLFjqHjTuPL5zUhXxYDvqOj9SNz53Zc75Xm1Cxuw1bXbIutxadf/Il+qCjmydCVWDlPNCE6U799JnGpk3+FkZCRT71i+iwCC84qGMr6gTQJ2H1wta4mVUq5tynVy0SfbfA0m8qC2CqKZm7YtKjSKoJNOnEzCEGy1gdkaTvOn9vZacABjxx37lVccaGUDmnXT+sLRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57bzriIGO41hTVp88zDT17lwT0rw1Ofeli90xxwCBe8=;
 b=W7wVzeDXE+MbtkzGRSfruWl60WsM60MBL5reovHXCDk8UwBzKF6+kkNFnMjJzkkbm9j4/LzduQ0sIXqdYSLQ0RJ0lwJGmzXX6cd4y0VfmQPXBbhJ6PxQkYt0ibl/wu/ZYRVolgIzKk9qjBn1GNPuT4bzb0C45Ghzu614EbUdyuJPaE2DMTifjFTgthPN0CZXE53bgMXsG34uOLjJopGHi1G072ojqMinmBdhxAZU/YQvjkTD24XiLgXtM813uxqthABegpFq+zP0KELXN8SZ7ZPBRKrZb2YOjATqcRjaooBuoobaiyYywtFDq0xhIPkdV7K4TUr/LxeDEFf4EMWvqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57bzriIGO41hTVp88zDT17lwT0rw1Ofeli90xxwCBe8=;
 b=H7nmxxI2MKnUcH+faEjzOBAunZgAR78s1DC+O+MQs52qvCndLJH47zx4kQbCtdM94koKDjKHw7n92N+9i17buqK4EQLgGI8O3foWUIKh2QnCWPYe84ySUBruyMSie4VT8eiRAnkdqLjhjKE0Dgia797ork3mQJlyHv5nGR8bj8w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BL0PR01MB5282.prod.exchangelabs.com (2603:10b6:208:78::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.31; Thu, 6 Oct 2022 07:04:12 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.032; Thu, 6 Oct 2022
 07:04:11 +0000
Message-ID: <27257597-8068-ab59-ec5d-99deb66065e2@os.amperecomputing.com>
Date: Thu, 6 Oct 2022 14:04:03 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: Linux kernel updates and v6.0
Content-Language: en-CA
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CACPK8XdERea0Mt+3o1z2TwbN_NXJ-FDYf8mxUEAWe5Lp7oFRmg@mail.gmail.com>
 <CACPK8XfrECvJtwZ8AR1EgsVHpSnkKCVp2LovCXCyFXBpjeBbfQ@mail.gmail.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <CACPK8XfrECvJtwZ8AR1EgsVHpSnkKCVp2LovCXCyFXBpjeBbfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0092.apcprd02.prod.outlook.com
 (2603:1096:4:90::32) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|BL0PR01MB5282:EE_
X-MS-Office365-Filtering-Correlation-Id: 00195607-892f-4572-66bd-08daa768f886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	QIpC48zjNlcHehit34JmMqkAJkivmqdsGsFJQL2a4Mvi7dwbUKudY3TEadCwwxMl3WSLFkoYOJrz/OFHkMF6c4soLrW2N4deeZgQxbyj6Q6vwU41I6rEps48TR8vpFY6WU/PMI2RYd1iGPduWkEpVfcHEpJfV59dxHKfJSHfns9PAmwfLTMUqFN1QPkl5jBvMo8cZTiSJ+WIVaUUNPMUJP2gjZP7Z6TWcbjfRJaz8DQ6suV2feUMzy7qVvyEfmA38YKnn0DUXg/p06+KBDzj2hRAhJNHnNOKwvPYRW6vrJJxZz8uyAzUOkjSDiUQ8Rd3XGUd+/M8kVQNrCsp6exV1PKUQaBc1ffoJPy25IB0wYU6rlLwcyom3OC64RBGW+y8FVJHccgIbSpzYwxV4m+qvmM/svhg6yyfkqFRQkNlyjlKk+TsiQ8UX67VHAYvg4Cb3d5SyU7rNqOn32rd2BtyUoZBlUrQs0mR1A/2yndn6Ytwhjs2GwabPfNAjHdzkbarNOFBnitcyj20TgEPEJgJBoDo9MlneNOSTtiuvx39MESBU48/4BHwtkioUDRtUWJIg0RPFYPp+lftgIBNgrZjHMefRoGRlZPGuIkVkpoxv8T/S5mlcmMa1ZEYNWq30kENpsorM3VPpZqDmJjcM3G6HLwsB0NELAZOCp28TrP769fI8YS+xiMS+KW8XowVxUdHceNTz4lcntNB8/9ZY19yTzH8ufVOiV1fdLMqfsbhTCjzSnjZ2RP6GZPWqpYQByOJLpP8KKX98hRDgRtuntGMZXrB3fJYWLc6a3zf0O1CBFd0NI+0c73OjPoJz7I0SG9Zd0MQ0b2fyUa8Q1YsydplZQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39850400004)(366004)(136003)(376002)(396003)(451199015)(31696002)(478600001)(110136005)(86362001)(316002)(26005)(2616005)(5660300002)(8676002)(6506007)(8936002)(6666004)(66556008)(186003)(66476007)(66946007)(2906002)(6512007)(41300700001)(52116002)(83380400001)(4744005)(38350700002)(38100700002)(31686004)(6486002)(966005)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?SjB3Z1RTRWRtMEJIdWFtbSt0TUtzNXIxb29CQnhOeCtMOVR6UHVtYXRzemFI?=
 =?utf-8?B?akZ3UWY3U2JoT1VNWlNDM0lJZTZLRmptQzRTMEVncnBXL2VGNXkrcG5TSjFo?=
 =?utf-8?B?V2k2bmE2ZVpNblpkNXJ6V1N2MnFGZVczT2F6WVJncVVjU1lQNVExK1Y4b3hF?=
 =?utf-8?B?aTYwUmxGK09DajhkNjdxTHMwbWQxM29PaHhYWUVRUTVmLzhLQWNzcTVBM0JZ?=
 =?utf-8?B?RUZxUDI1UUZQVzhHYVZLM3lKampUNDBieFVaU3QwWk9ocVZrTDFEQ09xTFVr?=
 =?utf-8?B?K1NsbDJlYldGUG90ZkZrc0RjN0R5QkFhaWt3dUZPWk9KR2EyV1JMWmdIZlF3?=
 =?utf-8?B?UjRSTlFFek1CWnZIRnVGN3VVUnFkRmRVeWZ3cTZmdmhQRGZKU1NUamhOakFx?=
 =?utf-8?B?eWMvcyt3ZmhGYjN2ZWVRd2hxUUdxUnF0SVZ0NWJYaHRBelhmclQyaTU2dnA2?=
 =?utf-8?B?L1lTZldPTHFRa1pSSlZTUVlvbTlhTFhPVDlUV2hKcS9jcEd5bE1qRk9wSVdT?=
 =?utf-8?B?K2tFRGdQNGd3dnFpY0wwZ3RKK2NpU04zU2JiTUxFbDV1WW56OFpzZGVDWDMz?=
 =?utf-8?B?RDRWeXBvbXEzWGhBL0E3dUNDdU4xNUdHUllzQ0J5OWtFVzdyNEZxRmdFZ0pB?=
 =?utf-8?B?WENDNFd4OTJGRkcwZDFwOCtrSEdzbHBjOTllTDhqS3Z6V24vRVZ4Y01Rc09U?=
 =?utf-8?B?SHFTOVp5Rm1ib09idVZhWmlDVXo0VnpYM2xGMTBnS0c1enZpYkZOZDFmcDgv?=
 =?utf-8?B?UHlrMHk4WUlia3BwdnFZeEhaRk5oU3M0SUw2Z3ZDdDE3Z1Rya1FubjgvNlZm?=
 =?utf-8?B?Q0tCK3FueXNKVjVCQ1VEZG1YNTFLSVB1c3lSY2lvQWtJcERuNmxuQ2dST04x?=
 =?utf-8?B?MXkzK1dYQ1lTamV3ZFc3Ui9KY2JmQnl6ZTZjdEJyZkQrakUyaFc0d1R3Qm5x?=
 =?utf-8?B?ZjBYams0MFF5UEFXc2E3UXhSNkxDYXI4U2VYTFhCa2VFMUIyQkdMWnUvYnRy?=
 =?utf-8?B?STRqQTFLVGorSDRUWUtLR3lTMVJMVU1HZ2FuOGNzSEd0Q05paGxBZFZRajlp?=
 =?utf-8?B?S210K1NUbklIZFAxTWJPalUxVkpGN3dkK0xzNGhFU0gwSVR4cE50bnc4R0gz?=
 =?utf-8?B?cFIrTGFuU0VRTGd2Rmh4NjVyZVhZUWJ2N0lqc2VReTFub1V3bE1nTTNuN3hq?=
 =?utf-8?B?T1MxN1h3S3V4KzVsMmZTaExMR3h4MXQvZFNoY2o0SStBTTNaeExGRm9OaUZx?=
 =?utf-8?B?Vjk5QTJwOVJCNTFLeXhUTDJNaGgvanZRMHJRbk9jOHo3VXFCbkxLZUdDYUZB?=
 =?utf-8?B?UldDOXNwakEyZFExeldMa2h1M0tsVWMrM2pOazNoWitFMTh5R0VVTUw3V04v?=
 =?utf-8?B?ZnRWRW85Tmd4ODUrWVUwd0Q4VzJnOWFNTElXalV1cFlQWEkrVEp1WEMrRW1K?=
 =?utf-8?B?ald1eTVzRGhFLzZ6MmdJWmJ1MHJNTzh2VFp5MXh1N240NGNVNHh5ekFnV09x?=
 =?utf-8?B?cmZRb2hlTWhLUGNIb3cvanNDY0lWcnNwZXdnVzUwWnNqV1pwZUpBNE9GeW1D?=
 =?utf-8?B?UGJCZmVCZDFqRTFPM0hFR3YvRkRzTG5mN2ZlN1BWT2dQZk0wMXJDRGVaemxW?=
 =?utf-8?B?amhPdDJlRWUvd25UdEZYVzlrbGU3aUNtaG41d0JEWVFEdUsyM3ZyQk8wNXg1?=
 =?utf-8?B?REdZZDhBMEZYTTNXbjlXdXBGUEJta2pjbVhDNkYxSGZnOXBWbzNSRUF1RXcx?=
 =?utf-8?B?VWpYbmlSb2R2bzhZRlR2SXM3UVlaUlVPd1Q1N2dGSjlNOVNzUjVXS1NkWjVW?=
 =?utf-8?B?cTlzQWN3MFNJYnJYYUN5UFRFM2lZeGRZb2l5SnRKRDRnVU5LNyt0dXdYem1K?=
 =?utf-8?B?NnJXQmp5YnpsZGhXV0ZxaDdUYWpKbmoyMzF6U0h4aVRCWE94NWRrUWd0NmUz?=
 =?utf-8?B?UXFtVnlDWDlPQmJsM0hnVXJsQzRJV0FVMTlmRUpPYU1pYkxDb1ltTWlLSXlP?=
 =?utf-8?B?VkpvU05PY3VrSmFoa0d1UitxSXQ3K3BNdlpSeUVDdExXY2pvSUhSNFN2ZzNM?=
 =?utf-8?B?MnpraHhuaUpvamsyazBQcHZPRU9kSk1QbmRKR01KeS8wdXhhYnM0QXN0WTV5?=
 =?utf-8?B?T0RpUkNQZk9LSURReDlTcnRpb3o1NVJnenFWOUpWdEVCNjhYRXF1YXdES1Ev?=
 =?utf-8?Q?LGYKHjbA2dXxpzIm/D9dp7Y=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00195607-892f-4572-66bd-08daa768f886
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 07:04:11.7621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ooXpqz0os7cfGVPGXdp+ExlvS9lvlxDlpfpvJfEGtHcywJfKXF/uJavYYmq4lYjhHs+txWKuQcRr+4OURSMiacFqw+AdtF+En4qc/OQp53o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB5282
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


> 
>> Please address any future patches to the dev-6.0 tree.
> 
> If you have pending patches then please let me know that you want them
> merged to the dev-6.0 branch. Otherwise, rebase and re-send them to
> the list.
> 

Hi Joel,

Could you help to pick this patchset to the dev-6.0 branch ?

https://lore.kernel.org/lkml/20221004093106.1653317-4-quan@os.amperecomputing.com/

Thank you,
- Quan
