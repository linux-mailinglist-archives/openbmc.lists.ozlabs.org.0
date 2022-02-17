Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 798484BACF1
	for <lists+openbmc@lfdr.de>; Thu, 17 Feb 2022 23:55:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K09Cm06w2z3bmf
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 09:55:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oGJQmB1U;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=oGJQmB1U; dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K09CJ4zPCz2x9Z
 for <openbmc@lists.ozlabs.org>; Fri, 18 Feb 2022 09:55:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645138525; x=1676674525;
 h=message-id:date:to:from:subject:mime-version;
 bh=tfIR6+cm5HS/3ylILgkq9zxPe/2rTVdl865bsamtHgg=;
 b=oGJQmB1U9LDY10SB3xu2lkrKoed1nn+E1Bp02WYHalzFow+VLL4ttH8Y
 WXVFhEc9Q3l4o5/vJVhnh5t/3wkyEJ6OI3SQ5r/ShbpoKzVti2m3XzzBR
 c465WFdUJcbbVbf62wOMzrWedFwrV520xqb4DqVDi3Xb+7wazCEmhTIuw
 3UAYj+cro+1hOnCY+uGiFNOV5fRxg0mM4xQvC9K4bTX1kRfm/6NGpVSH5
 IbegLHN/+9eeoUoAMaKNmLSGAZvcY23PUnb5n7pzZj1m8CH34wE4jkzcX
 /OevOnYqhk4nOTGdMioej/Pm7Zj3ardrm+00Smq1oNJMfailb2yzI5c/7 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="275588141"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="275588141"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 14:54:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="605261591"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 17 Feb 2022 14:54:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 17 Feb 2022 14:54:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 17 Feb 2022 14:54:20 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 17 Feb 2022 14:54:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjZk/6p+/CrnlPRc8qjFEXxqP1GciYQOvUwGKTMmv1fXMTxHbVgfTKdPFYMfBu/SQG3m53MgS7BJfZtNj4AqAYjqb0d/AXEvITm9I5k3y5fbNOjo+S/e1V6IxHiejwWBq8cYWIM2AM0caD8ITPk6zezpn7ZYOkvVMwQQJMZizZi8CnHPIoqn6VyiKv/wqMf1Txff5s0/ozibLC8HVZGrTtOpPzlJ5FbBsFrF+rnnuqP/JcDc/KULLgcIjJyAXHCh3AKUdp22sWC0GhXnJIHvC0TcgeSkHEHaOoEPs/WsM2+iz0Azvtf8diHY5perxYf8kCE4z12qR2aTSY8+oRGdzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfIR6+cm5HS/3ylILgkq9zxPe/2rTVdl865bsamtHgg=;
 b=LBmqcvT5rpwDl7V7aXmkVJgr6jr3mtqpDidsO9soxNYP8xI6DE5bScx5g+B2jN5mvqiBzPpp57XYj7IzV8IpGOH7eJ3WMieN7VXjqAyx6xzXARQzaoo7hHbIXRU7qrqwYfMh0tawm7GwjZtCr6X5aAqHfU8ecrUisC/rS1NvWFsl/4EsQp2Mh0KUYArTKI5EpV9P/QLphMHdIRhMlAqjKyf7nHCU9/bArUphT3nlnkSW+ZsEegaFEAU1cdLACardOCLxlSj8UUpIZxntLPZ2uWhyxSD5VZApnev0RzYC2ILCkxYyWOF5Wqo4ruIjuQm8/+FuxawipnUjVppQEvV+wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 by DM5PR11MB2028.namprd11.prod.outlook.com (2603:10b6:3:d::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.16; Thu, 17 Feb 2022 22:54:19 +0000
Received: from SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::78bc:db7e:2581:4c92]) by SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::78bc:db7e:2581:4c92%5]) with mapi id 15.20.4975.018; Thu, 17 Feb 2022
 22:54:19 +0000
Message-ID: <af9a0274-2fb3-8195-a02b-c1d5ecf4848e@intel.com>
Date: Thu, 17 Feb 2022 14:54:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Content-Language: en-US
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Checking for network online
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AaFp4zaoFDs3HioWdHUG7bZ4"
X-ClientProxiedBy: CO2PR04CA0099.namprd04.prod.outlook.com
 (2603:10b6:104:6::25) To SA2PR11MB5177.namprd11.prod.outlook.com
 (2603:10b6:806:11c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b6d11cb-4332-4db9-34b2-08d9f2686e49
X-MS-TrafficTypeDiagnostic: DM5PR11MB2028:EE_
X-Microsoft-Antispam-PRVS: <DM5PR11MB20284001377661CF9918F231E2369@DM5PR11MB2028.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S38/QcBew/0kc2UdSzcybaVteMMci1/EMG1Bv6en/HUFnQXg+4RQMMGSn2pdemeK4yCUlT9+BOMo1yi5yR5/S52VXfi49Xotwjl54dIxLJj5LPd7oTc2RuosOW017Btxf4+1O0PnOhzgL+qnDgmH5tnWHIidIgMm3zTIUZth4UFVIjMwiCQUeyn0EpIHPYYZ1BKqkAf7iGUrpaJxxM7Dde+3ZrCDI7IK7/K5AlklXZi2DWiBbX973ynMOFtedur8eYM160KgBlCYofQhBB2UilXw1eMnydTW2Yp8U9hXf0ciKAL5N5jtxX0DpGRqGetJygqx1ZvPuOhb/uHDlW6mKSAKlMfmbnQGESUo5f66d2e2L+6UbGHYg02Gtt3VA7oKZgosNGpacH57G9khR+9aHTjBlAFryxnUuC81SLkqhhzC6bQhNDKCXiksg+SHyGfek+fa67xuxSB2dYgybujEIYAytFnvQNtD1OCyA3SUecCRqXZiJjHWQo8peij4UHI6CRozd3umAUf0Kwh7k4m7NLGAynB+W21Llu6oqTKUjq0uuybbuBKgC83zdcLY8ZIM3KkekBSFZ7j2eshhk6n9CYPJJ3GCi/DqjsoGGXIWj06ui6aIG3SstN+G7j3UXfJc+OJe5H8cQm0YQXiNbbr5JAh8n+gFCEHgS4K9jqStz3q9qA+vWW2pk1bevSWiXyj+yeif7kKyb6UUwToH0rlRjyuwvTBT1ECBn9hkRGfXOcc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(8936002)(86362001)(6916009)(2906002)(235185007)(31696002)(5660300002)(508600001)(186003)(26005)(6486002)(31686004)(33964004)(6506007)(6666004)(21480400003)(2616005)(83380400001)(38100700002)(40140700001)(316002)(66946007)(66556008)(66476007)(82960400001)(8676002)(36756003)(3480700007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0VzMGNuQVBqaFNuRG9Rb1ovL0ZCYnJpK2t2YjJueHdaODhlNnFKbUpEYmtr?=
 =?utf-8?B?b0swTzVvQ0lpK2JIaWJ4VUtQL1I4ZTN6dGtaeXd3UWZvaG5Za0dFTks0T2tt?=
 =?utf-8?B?V25icUpFTVY4dzcvYWNTQW5ud1hEQXcwRHBISEVTU1ErV1lPSzY5aGxDcENB?=
 =?utf-8?B?cTVZRU13MTlaU0swTWlOdDF0a1BUY3lkRlB5RW1YYkIvSjFucTJIWktGdSt0?=
 =?utf-8?B?RnZmZFFvTXBYQmJtVWlFVTJucnIzdVVoTmxGTWJDd3ZrbmxLNWdHTEcrNkZF?=
 =?utf-8?B?b0owQnNEcllNMFIzQ3JEczFtWEVSRTJjTVVkYWhXemdaWW1TMHhxR3RNUXJ5?=
 =?utf-8?B?ZnByenF6TVgrQlQ3ZE82OU5nZFhDRCtOTGZxSUVJZlgzWVhrMDJkZDNMbzRR?=
 =?utf-8?B?UlVFeWtNbmdKaG14RU5xb2NBcG90ME5sbUcwTFZzMUgxdi83YXA5ZzZERnBS?=
 =?utf-8?B?R0piVzhhVWJRT1BSWXMyVjJITWF1MG9aT0NRazB1amRrOGpRZFA5KzZ0R0Nm?=
 =?utf-8?B?Z3dnTUYrait6azJQclNYS01HYzRjT0p3OXNIajJUbWk2WU1tTGNyUWhKcUQ3?=
 =?utf-8?B?eGtLUG9PWUU5clUwODVndFNyUk1uZlZmemRHYlBUWmNxMml5bnVzbXcyNTlh?=
 =?utf-8?B?WlNocWJDRjRuaFBLSCtYY05INlZxK1hScmMramVVbE4rRmU1OEgyZXlOOVNR?=
 =?utf-8?B?WloxSFNyNDQxZVp0RTBEN3VwekszNUxaYTIzd0grU0w3MEUwbnNpUytXMTg3?=
 =?utf-8?B?ZXhJN05wRDc1VTdFdEZlOXFObnVrNk5XRVAxbEtneC9jY1VCbjVhYWMvYitj?=
 =?utf-8?B?UWFIQW1ldk84ZXRmOWs5MFlRZE5lS1R0UW9MVCt4N2FkOXM2U1duSnRZeUZJ?=
 =?utf-8?B?U3RmT1kxamU1RFNaRVdZUGpCRzlSUVJ0cjV3TzQ3VVpXdGtJaCtxeGlxMmw0?=
 =?utf-8?B?WEwrLzRKS2pCMjBERzhYTndRczBtRjNwZWN5MDhUNlBZckRMdjcrZlpqQUNW?=
 =?utf-8?B?ajdsYi95OFRFZHY1WmNIWGlrcWREMGY3MEJ1S1JuVnBoK0dnZ2tCbVl4Sytz?=
 =?utf-8?B?M3IvaG1KMlVjTG84bUxBc3J6Q1poeSsyd2FNRGxlLytpcWdscDNSY2RwSU5G?=
 =?utf-8?B?UWpRR0phWWYzemZDQmxSTHhodG5MaW9UTlJiNThYdkwva1Y2UmxDZk1FL0lC?=
 =?utf-8?B?VmxRdjJxNjJ0b1hUbVE3eTliUFhrSi9sMkRyMUpvQUZEUDBEdXlUWG82R2pz?=
 =?utf-8?B?UVdvTnMxdzZlODAyNndsVklBM1hrVndrUy9Mak5jb202dlBVOXpIRHJKR0VW?=
 =?utf-8?B?OTVZMVdXY3VQQ1l2Kzc5d0Z1cFJRVStudGxJMldkS3p1aEhqN2REVjlRL3ZQ?=
 =?utf-8?B?aXFLai9OYUJ4TUd1eVJSRWVSeE9kMzBVeVZiVEErRUI0NDNpSjA2OUd6MGh2?=
 =?utf-8?B?cmk4Rjlqd3pmdGtHUVFabFpTaXRhczYwWjFPd3g0cmkzUWoybDQ5dERRTVk1?=
 =?utf-8?B?ME02U0JqMjNDc0tJc2VtV25YYVVVMnpjY0phcElaQlk0UHRndkkwN2dZNUdX?=
 =?utf-8?B?YzRtZzc5c3Riem5mdUFPU21rcEY2Rmc5Yjl2SjFIU0xzTzRSSEZrOUh5YW9a?=
 =?utf-8?B?QU9YblBGQk9vNzM5WGZsRTlQTlhpcmllSlB5aS92VFJ4aWVoZ1ZxSjJiODYx?=
 =?utf-8?B?REZWeWhXbkZqZCtTQlM1dzN3d2lXSGlHVVljdklNaURTRnp1UVZIbUJYR1NQ?=
 =?utf-8?B?RkJuc3JCSEJsTmFiR3d2REQ4azdrQ243dG1ZejZRbU9IQ1ovWlp3alNubG1Y?=
 =?utf-8?B?NFljbkl2R2pxM3lJVWpIU2JoTkRpdHFzUkdYZFhxTkV4OVBBS1FBcWU2eE1o?=
 =?utf-8?B?YXA4ZVZIa3VFQ1JYNERpalR2SHdQS3JhLzhwdThHM3VzWFBSdjhxWVhyN3Vk?=
 =?utf-8?B?bmpFdUYwR1Z6MkdFTVJraEt3WGJCaHlJQ25oaXpzMEYwciszM1Uxc3RiQ2pa?=
 =?utf-8?B?UCtCUWp4cmRIMkw2SVZLKzR1OHN3OUdJaVF3YU1VRFYrUUpza2VjamhISlRn?=
 =?utf-8?B?Q2M1VmNCeEg0YWF6ZC9MdTF6ZEFlR2xIMG96NW9lRDF2aUJnSTJKMW12ajRP?=
 =?utf-8?B?endubHFuR2MyUm1kUm5RVFZUTEdjS2JNMjVIRTlidE1pZGVQblFUMisraExu?=
 =?utf-8?B?NHRYU1dRczhvM1VwWk5vOW0wZXBqbWNUMEpWZkNQYkRwelE2UXRtcGkyTjBN?=
 =?utf-8?B?NElDMW9ic1BzRTY5N1VmcW11eTdRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b6d11cb-4332-4db9-34b2-08d9f2686e49
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 22:54:19.2322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7UkAreyFIa00kxUxrFc2cUMvWj2MPIC5baKVy+OM1mDDlw7PwSuYhrUWlC+kJ0SMlYgkGuOigQNyrsXbM85ZhZThAa3Squ68Cluam51h5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB2028
X-OriginatorOrg: intel.com
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

--------------AaFp4zaoFDs3HioWdHUG7bZ4
Content-Type: multipart/mixed; boundary="------------4fXVh6ZYug1TJpqblsGdtGUF";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Message-ID: <af9a0274-2fb3-8195-a02b-c1d5ecf4848e@intel.com>
Subject: Checking for network online

--------------4fXVh6ZYug1TJpqblsGdtGUF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

L0kvbnRlbCBoYXMgcmVjZW50bHkgcnVuIGludG8gYW4gaXNzdWUgcmVnYXJkaW5nIGEgc3lz
dGVtZCBzZXJ2aWNlLCBhbmQgDQp3ZSdyZSBpbnRlcmVzdGVkIGluIHNvbGljaXRpbmcgZmVl
ZGJhY2sgZnJvbSB0aGUgY29tbXVuaXR5Lg0KDQpJc3N1ZTogc3lzdGVtZC1uZXR3b3JrZC13
YWl0LW9ubGluZS5zZXJ2aWNlIHN0YWxscyBmb3IgMTIwIHNlY29uZHMgd2hlbiANCnRoZSBt
YW5hZ2VkIE5JQ3MgZG8gbm90IGhhdmUgYSBuZXR3b3JrIGNvbm5lY3Rpb24uDQoNClRMRFI6
IFNob3VsZCBPcGVuQk1DIHJlbW92ZSBzeXN0ZW1kLW5ldHdvcmtkLXdhaXQtb25saW5lLnNl
cnZpY2UgDQp1bml2ZXJzYWxseT8NCg0KU3lzdGVtIENvbmZpZzogQWxsIE5JQ3MgaW4gdGhl
IHN5c3RlbSBhcmUgbm90IGNvbm5lY3RlZCB0byBhbiBhY3RpdmUgDQpuZXR3b3JrLg0KDQpU
ZXN0IFByb2Nlc3M6IFRoZSBzeXN0ZW0gdW5kZXIgdGVzdCAoU1VUKSBoYXMgQUMgcmVtb3Zl
ZCwgYW5kIHNvbWUgdGltZSANCmxhdGVyIEFDIGFwcGxpZWQuIFdhaXQgZm9yIEJNQy9CSU9T
IHRvIGJvb3QNCg0KQmVoYXZpb3I6IFUtQm9vdCBoYW5kcyBjb250cm9sIHRvIHRoZSBMaW51
eCBib290IHByb2Nlc3MsIGFuZCB0aGUgDQpzeXN0ZW1kIHNlcnZpY2VzIGFyZSBzdGFydGVk
LiBXaGVuIHN5c3RlbWQtbmV0d29ya2Qtd2FpdC1vbmxpbmUuc2VydmljZSANCnN0YXJ0cyBp
dCBzdGFsbHMgd2FpdGluZyBmb3IgdGhlIE5JQ3MgdG8gZW50ZXIgYSBmdWxseSBmdW5jdGlv
bmFsIHN0YXRlLiANClRoaXMgbmV2ZXIgaGFwcGVucyBkdXJpbmcgdGhlIGRlZmF1bHQgMTIw
IHNlY29uZCB0aW1lb3V0IHBlcmlvZCBmb3IgdGhpcyANCnNlcnZpY2UuIFdoZW4gdGhlIHRp
bWVvdXQgZWxhcHNlcywgYW4gZXJyb3IgbWVzc2FnZSBpcyBsb2dnZWQgdG8gdGhlIA0Kam91
cm5hbCByZXBvcnRpbmcgdGhlIHNlcnZpY2UgZXhpdGVkIHVuc3VjY2Vzc2Z1bGx5Lg0KDQpJ
c3N1ZXM6IFRoaXMgc2VydmljZSBibG9ja3MgZW50cnkgdG8gbXVsdGktdXNlci50YXJnZXQu
DQpwaG9zcGhvci1zdGF0ZS1tYW5hZ2VyIHVzZXMgbXVsdGktdXNlci50YXJnZXQgdG8gcmVw
b3J0IHRoZSBCTUMgaXMgcmVhZHkgDQp0byB1c2UuDQpUaGlzIGlzIHJlcG9ydGVkIHZpYSBJ
UE1JIEdldCBEZXZpY2UgSUQuDQpUaGUgSW50ZWwgQklPUyBpcyBibG9ja2VkIGZyb20gYm9v
dGluZyB1bnRpbCANCnN5c3RlbWQtbmV0d29ya2Qtd2FpdC1vbmxpbmUgdGltZXMgb3V0Lg0K
Qk1DIGVudHJ5IHRvIG11bHRpLXVzZXIudGFyZ2V0IGlzIGRlbGF5ZWQuIEpvdXJuYWwgZW50
cmllcyBhcmUgY3JlYXRlZC4NCg0KUXVlc3Rpb24gZm9yIHRoZSBjb21tdW5pdHk6IEdpdmVu
IHRoZSBuZWdhdGl2ZSBzaWRlIGVmZmVjdHMgY2F1c2VkIGJ5IA0KcnVubmluZyB0aGlzIHNl
cnZpY2UgZG9lcyB0aGUgY29tbXVuaXR5IHdhbnQgdG8gaGF2ZSB0aGlzIHNlcnZpY2UgDQpj
b2xsZWN0aXZlbHkgcmVtb3ZlZCBmcm9tIGdsb2JhbCBidWlsZCBpbWFnZT8NCg0KLS0gDQpK
b2huYXRoYW4gTWFudGV5DQpTZW5pb3IgU29mdHdhcmUgRW5naW5lZXINCiphemFkIHRlKipj
aG5vbG9neSBwYXJ0bmVycyoNCkNvbnRyaWJ1dGluZyB0byBUZWNobm9sb2d5IElubm92YXRp
b24gc2luY2UgMTk5Mg0KUGhvbmU6ICg1MDMpIDcxMi02NzY0DQpFbWFpbDogam9obmF0aGFu
eC5tYW50ZXlAaW50ZWwuY29tDQoNCg==

--------------4fXVh6ZYug1TJpqblsGdtGUF--

--------------AaFp4zaoFDs3HioWdHUG7bZ4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEynmy4K0ckuoyjA+Ocg9x5uaKcAFAmIO0hgFAwAAAAAACgkQOcg9x5uaKcBx
igf/VIqLmUonsUX/6qZlsmL26o2lj9jD51DuUOB5SusF+qy55M0TNtkYQTznwRorfvs8RJnVXato
Zx9/d1FwERiY1oI4iW8Z+InXS7c48ktQl25dKL6dMZ9JQzHz2L1+WPR78wVfQNg2u0rSMLnSc1TA
eMYa/oXt2aa1wAfD1n4sk91qqjPRS3b9IJ4c9RHA6MjswPIkTh14z7wTWpqsIb+4U4pzYXUI9ee6
/bRmkafNBvSME79ieeNBgrvQvh/8A3J8F8cwaTnbh3kyPJ4//zZg3TbI7rQ+3aiC1TJYZSNyqqbe
e1fKLokJuva1BoiPITYNflFoj2OwRqEn4ZHp0nDAMw==
=lh+S
-----END PGP SIGNATURE-----

--------------AaFp4zaoFDs3HioWdHUG7bZ4--
