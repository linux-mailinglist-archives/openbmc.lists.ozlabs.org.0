Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8AB4C1CD2
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 21:05:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3n8z1b6qz3cGM
	for <lists+openbmc@lfdr.de>; Thu, 24 Feb 2022 07:05:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=REsUxj/F;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=REsUxj/F; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3n8R29Zcz3bPK
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 07:05:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645646728; x=1677182728;
 h=message-id:date:to:cc:references:from:subject:
 in-reply-to:mime-version;
 bh=7BbO4m8XxZbNsHAPXhWCU+3Qf+wH0roM5Yu0s6M/Gas=;
 b=REsUxj/Fx6MO1xBmROxqw0+g0xvtijqjLYwv9Pj4cUAnmq6CwdW/FnrP
 /0LwiGMJiphEhxHla8wz1TbTE/JOwUqG5e2oycziBt/qt/CNsdqzSJGHk
 6ImfJ6oTVSs++TEf4seqaMYRvwHnEJli5bvOjeed3jWmmEfrr1vzPoBcK
 0pFXsx1Out7SdKlKQQawvbwxkI7I3iT6nWyveZ/aOkab2fk7Cagn901BQ
 CQjpFMQMcCKipbybjKFm4Fu+9TX652/GmEdzDgB/6Wn8r4TB/XCzGE4Zg
 fp6xO9Zp3ocAWg4Aek10b5PhYSeZ6kw4/cBQ30I2QZHWcAkeSZX3g4H9l w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="251989111"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="251989111"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 12:04:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="573957963"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 23 Feb 2022 12:04:17 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 23 Feb 2022 12:04:17 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 23 Feb 2022 12:04:17 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 23 Feb 2022 12:04:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEsnU3l7bWzY/Td3cOVkGDs+1ONBbjj+6LUMxRGdfxheLLmGlesr/f5lBFDGkUNLbVr6B9g5EDhuio1yDaT2DAevRgkJHbCdxcQSdaqsdOiN1lRFqBKipMQINcSrqDAlKtGU/qb8xFUFzqJjGssh80VepMofwH0kdbCd9lsMbFPoMDn4t/2/4k5YyRUq7XO6xlQeEQZu57nl+OzJNqFT8QKeY2otaodtlYOztSV3k85KHhjHmMaTIL5va0kMd02kUXDJ0k5iZ626e+EKKjshY00cAgBOzvsbFtbXFX3hpSAv+TiMwFsRgsc7WGYDctWYUZUmRUA30ysXK7aVIXRGrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BbO4m8XxZbNsHAPXhWCU+3Qf+wH0roM5Yu0s6M/Gas=;
 b=mzonYVi/R5LMUsRgVaJebsBnVg7kjno2GshgCLIMgVxLgHlvioo3icF3JLYXtRKib8M02bQ8BZHcCHxWzl9Xs68SuN29qZvocrFM75HNOEvycMUnRXNpTq5oKubrL2hSAXzeDMc6bRO0sMaHoK/5jZOjJlNiDqauJ5W5aKYEKagtDymtwsFeQO+d90AB3/jgSVi9SFaZD2iGlZzpKbvi0/icMf+bHWd8/jmTdZxtCjRG1a9tSiigDtr48B2Qhh1Sjyi8zlecDNFgb0JyIqZ8V3bjBE1cczUgu9nsoCdubxBzx/x+wQCvYfb40JeBZXY/7tQYCCtDrTY6XHFcfqfX+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 by BYAPR11MB3096.namprd11.prod.outlook.com (2603:10b6:a03:8f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Wed, 23 Feb
 2022 20:04:15 +0000
Received: from SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::78bc:db7e:2581:4c92]) by SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::78bc:db7e:2581:4c92%5]) with mapi id 15.20.4975.018; Wed, 23 Feb 2022
 20:04:15 +0000
Message-ID: <3f4f0cc0-7967-66f9-a085-a6b2ae978a01@intel.com>
Date: Wed, 23 Feb 2022 12:04:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Content-Language: en-US
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>, Patrick Williams
 <patrick@stwcx.xyz>
References: <af9a0274-2fb3-8195-a02b-c1d5ecf4848e@intel.com>
 <bb39999e8f9638da3d29b865d85fb54d51da9797.camel@codeconstruct.com.au>
 <CAGm54UE1bFeLF9PHUuj__E0m_+CxLRtA4Htrjm4y5M3SnbOhLA@mail.gmail.com>
 <37a29642-788c-b966-3b58-214c3d44c8f4@intel.com>
 <64727f8e-cca3-b04d-e4cf-709ceb60f37f@linux.intel.com>
 <YhY7Kxgg6ew0HdUR@heinlein>
 <112c8819-24bc-2a24-45a3-9c919088f43a@linux.intel.com>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Re: Checking for network online
In-Reply-To: <112c8819-24bc-2a24-45a3-9c919088f43a@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1lYhAlfynBr1SBYXf1mbO5LZ"
X-ClientProxiedBy: MWHPR1601CA0006.namprd16.prod.outlook.com
 (2603:10b6:300:da::16) To SA2PR11MB5177.namprd11.prod.outlook.com
 (2603:10b6:806:11c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25edfa1a-4387-4b4a-0677-08d9f707aabc
X-MS-TrafficTypeDiagnostic: BYAPR11MB3096:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR11MB3096ABE25421440A56EDFA1CE23C9@BYAPR11MB3096.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TfV+i1BY3MdrMUmwCcgF+01AodNlUn2xyVi/+roflxVMQno7cmMcstK4gScWwIf6PTw+9l7MuXXdecaMW7qdTQ9iSpcnjrnbYTsttjAO4fHZk//j3+SBqRP9JkT8bPw+iboz/CYSN3kfG+wjoCCOJgDeIb8eegX3lkk2zTXqv6FhNn7c7ql04WU5gPUBI/MU5uv2PknCMDZDxSiJ2I00VBcx/zzQyihegHwt6ZMX+2rk1eKRqhv2/gLFB8cJbq7m+KvT32GI1blaNHZFGta4UTir/UggkdAzykutfxtI5rqbByoaeiL8mEit0O3DN83rw35HJy2jnTOQICIw0fE0EoRK+FMtzMWtQQHBqowNEjcFX4MZG3SxJUQzzguOZ8vcIcGrMfS7T+VVog4EX2z+rbf19Njdcsvjj1bK4D+eOqGJMCwbUkOSRWiQH6+a+VEEnHQ+4ZMAhF/6jvnV8J4jZR5ARuFLkSTPFi3v+EKAybsQfwIvdJVL+U6CiWcQfJS1zJ7chxkbHDf5UCvQMko3qqtKsnSRrBv4v5p6CLq3SB7PmjaXsXYGZOP0WqC0g3S/s360TmsLgUAbiERF+wkvewJrTZW1fOOJsVv6le16QIULMM2TmHNflbGp5+kHERf6Xh6yILlrSCdD2D3jMaF4/9VlGW/edM89KwkQSVm0exMohELCLB05VWoSRkdotAA6JLduv8uY5Kr/pl0z4lfhPWCDZP9qapBVMj3776n+ValVP02Q7nlEyTBvkr94GUGu/Jxlic7UrQeCO21hWIkgyOMqy/jwpu8Czs2MRXHjKryLLo9PkMKlIDR1spqo8spT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(110136005)(54906003)(235185007)(316002)(21480400003)(66556008)(5660300002)(82960400001)(8676002)(186003)(4326008)(66476007)(6506007)(36756003)(6512007)(2616005)(33964004)(508600001)(6486002)(38100700002)(8936002)(66946007)(53546011)(40140700001)(3480700007)(26005)(31696002)(86362001)(31686004)(6666004)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkNoT0wwR1JkOWhsNDlrekRVbytjdGNqY2lIK292RDFLMG9rdzNxeGwvbFNz?=
 =?utf-8?B?VHQzUDJmYlc5dTBxYzM3MlMxNG53ajVpT3Rtc2FSRGoyKzdvb0k4QnlyTWdT?=
 =?utf-8?B?YVQvcW1DYlRvbWRBTnBkRU1yYTdHcUovaVZibjR1TUlxWUlMYk5zS2xkcHAx?=
 =?utf-8?B?clNIOW8wUFBZQWdUc3AvY2Z1N2E5bDRKS2RHckJnQlZuWThDekg1RWZkZ1ln?=
 =?utf-8?B?ZmlPbjIrSVBWYjc1dUxFVGxydEt4M1dCdWtNTVZaYmx4MlBhb1ArYUNOaTNl?=
 =?utf-8?B?eUVWZWZzMGVNWWk1WE5RVUdkdytoZW5mejNpeUZLNWxtNDVmeVBNL0JRY3My?=
 =?utf-8?B?TkhlMmFGYzFUY1ZzZkllNEx6bHRkWE9ISVVoZzMyZkU3Rk14dVdYZlVYdVBD?=
 =?utf-8?B?NkJVOXdrWlhETzZUZjAzYkJxQXhCOS9rcmxwUEprblJWTEtBcG9IWlE5NE5P?=
 =?utf-8?B?c21iZWthMFVkczRBdFIzYzVuQjYxY2NLNzNKVHhRejluRFhFN3FrOEwwTWp5?=
 =?utf-8?B?ZjA0ck5xaFdrSXdQNVBBU3Y3ZzZieGloRTJ6c0FaeTZ1emxyeEo3dnh3R2Vp?=
 =?utf-8?B?bmJYeGdkWjVkWWx6M2x2bThOdy9VV2tzUUhDR29LenNSMWpWSG5hSi95WUhr?=
 =?utf-8?B?RGZFSXQ3cTdCdG52RDJJOVVuWHlIbzVRbXRKVzYwZkJoU1Z6dFN0NERmckhw?=
 =?utf-8?B?RnBiWEVQNUFRQmhhRmZ3R1c0UXp0akt4bUJFUDNWZitUT3E3bmExZ3IyL1VF?=
 =?utf-8?B?S0Y0RUlSdWhhQmlYdktRVFJOOEJrUE5pSVBEdkRUdFdSNWxETEFBSVZ2S1lM?=
 =?utf-8?B?MW42TFg1L2QzUkZmZzRaRGRKdzJrS1I1YS9QbVFGWDZKRWtCME5ScTNBcTIx?=
 =?utf-8?B?emFGV252SkJaMDZHWmxpWDF6bW9NUStFMjUrS2V0UVNCTFVGN2RVdHBGd3Fl?=
 =?utf-8?B?dGx1VjkraStZZFpyTDVQNW1QRlQ5eHlTRDUrREtmd0pWSFl4OXFCclA0Z1hO?=
 =?utf-8?B?NnVVeE5UR05PWEZUSUlFZlVkRnlsVFlYN0ZEQkpQRnFnNm5seGptVzlRNVBG?=
 =?utf-8?B?RnY0MzRxRnZuU0F2Vmd0R2dkSTNpbU9yVy81Zjl4SjRmQm5JSHZYNW0zaHhx?=
 =?utf-8?B?dmtRc1NJUXY1ZTMraHNiSCtwMVN2R0JLMzE3VURsNFFJakdsMitHNk01N3Fn?=
 =?utf-8?B?VmloMjdlNXNtNGp4Rlpod0RIYXZNQ2FxLzVGaWo2U1c3SnBTZEFVS3hXOEIw?=
 =?utf-8?B?ZW5sZ0JzUDN1MnU2LzlwL0cwaDh3NXEyNkJ6RFFIaElIYXBUMGtCNnl4cHBN?=
 =?utf-8?B?SzdUUFRqc204WGg3SHFxWVc5Q1Z6ZEZhekR1T0plbWJVdzc3OWpjWU9XakFr?=
 =?utf-8?B?Rll0Y2NQbnBHTWgyYVdhbzZXTGVDRHBsTm1uRjlFTUF0S1Y0aUVXNjNaTjVM?=
 =?utf-8?B?dlgwa3JrSGRZMEpzajhaZ2lpbjJNN0srMDdQdjlKY2ZmamloaEVjRVE3Vytl?=
 =?utf-8?B?MUxqbVEyZHRhYUN6ZlpoMTMvL2wyazBNOW1UeHVpMVJvSGRiQkRucDltNzRT?=
 =?utf-8?B?WUNIVURZWEJPSTcvSVNIV2h3V3ZpNFpyYVFPdHJOdHZzdlZDRjR6NktQNHE1?=
 =?utf-8?B?dVdjMFo2V3VqakxhNlo1blRxM1V1MGlvZUtXYU1QRmpKZFlQQTVNd0ZBLzZX?=
 =?utf-8?B?eEdISjVDYmlISUpsbGd2SDNOdDVRcnVsY2hFY2tDdWlEakNqeldpZGhtK3VJ?=
 =?utf-8?B?a3Q3ZlBtVnJmK1ZvQU9iSm8ya01HQ0F4RGJYK1pFUVE2SlVGS1pHSThCb1I1?=
 =?utf-8?B?ZVA2c0dlSHdXNzlXbHJTa2FqbHAzYTN0dkR2MDQ3cXpMdnAyeC9ZR3hmS0ZT?=
 =?utf-8?B?UFZmbmhpZC9xM3lTUFJESzVUZWJJVUxpMHdkcHBGTFhhQjdFUmNnRVk3TEJP?=
 =?utf-8?B?VEUrcmgrMVU3M0U1WlU4S3NQNHUwdzhraFRTUi95S0M0S1Z3V1Z3NXM0eEVm?=
 =?utf-8?B?NEY0VVBsdVlKSERFQ2VjU0dCbDZtL3ZPVWlUWkRvUTdaZ01wQnBMb1RyRExO?=
 =?utf-8?B?T2thbDk4Vk1QQ2htVkhhN0YxZjU1dmREREE0ZWtQcHZQc0NZeFo4VW9EcHV4?=
 =?utf-8?B?cVVEMmx0eEZKUzNQNTRrcUJlSDM1dlkrV0hjUlJ6UU9GSFRhTXRhNVJXWTdE?=
 =?utf-8?B?WGt1Z25oc2o4VS9tenBDeTJnRm9LRnFsS1N6aE5UQWJJWnQ3dy9kZ2orZHJm?=
 =?utf-8?B?NWlkbGJCWkNwMVB5SWVJSmxwcWxBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25edfa1a-4387-4b4a-0677-08d9f707aabc
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 20:04:15.3404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9BwcDlrQ/kopBKny4E/3VpZaQl1GWQ3k4As6MtS73gtRd371Lzs6LojXBMrej6wLCiucvjGwh5ILMEMFSmK5lXGE1cfqCzoCyhlPUlk4JQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3096
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
Cc: Jeremy Kerr <jk@codeconstruct.com.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Lei Yu <yulei.sh@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--------------1lYhAlfynBr1SBYXf1mbO5LZ
Content-Type: multipart/mixed; boundary="------------m15BSJbIdHM0Oni6ty2LVcAK";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>,
 Patrick Williams <patrick@stwcx.xyz>
Cc: Lei Yu <yulei.sh@bytedance.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Message-ID: <3f4f0cc0-7967-66f9-a085-a6b2ae978a01@intel.com>
Subject: Re: Checking for network online
References: <af9a0274-2fb3-8195-a02b-c1d5ecf4848e@intel.com>
 <bb39999e8f9638da3d29b865d85fb54d51da9797.camel@codeconstruct.com.au>
 <CAGm54UE1bFeLF9PHUuj__E0m_+CxLRtA4Htrjm4y5M3SnbOhLA@mail.gmail.com>
 <37a29642-788c-b966-3b58-214c3d44c8f4@intel.com>
 <64727f8e-cca3-b04d-e4cf-709ceb60f37f@linux.intel.com>
 <YhY7Kxgg6ew0HdUR@heinlein>
 <112c8819-24bc-2a24-45a3-9c919088f43a@linux.intel.com>
In-Reply-To: <112c8819-24bc-2a24-45a3-9c919088f43a@linux.intel.com>

--------------m15BSJbIdHM0Oni6ty2LVcAK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCk9uIDIvMjMvMjIgMDk6NDQsIEppYXFpbmcgWmhhbyB3cm90ZToNCj4gT24gMjAyMi0w
Mi0yMyAyMTo0OCwgUGF0cmljayBXaWxsaWFtcyB3cm90ZToNCj4+IE9uIFdlZCwgRmViIDIz
LCAyMDIyIGF0IDEwOjA5OjE5QU0gKzA4MDAsIEppYXFpbmcgWmhhbyB3cm90ZToNCj4+PiBJ
IHRoaW5rIGEgc29sdXRpb24gaXMgdG8gc2V0IFJlcXVpcmVkRm9yT25saW5lPW5vIChodHRw
czovL3d3dy5mcmVlZGVza3RvcC5vcmcvc29mdHdhcmUvc3lzdGVtZC9tYW4vc3lzdGVtZC5u
ZXR3b3JrLmh0bWwjUmVxdWlyZWRGb3JPbmxpbmU9KSBpbiBhbGwgbmV0d29yayBpbnRlcmZh
Y2UgY29uZmlnLiBUaGlzIG9wdGlvbiBza2lwcyB0aGUgaW50ZXJmYWNlIHdoZW4gcnVubmlu
ZyBzeXN0ZW1kLW5ldHdvcmtkLXdhaXQtb25saW5lLnNlcnZpY2UuIENhbm9uaWNhbCBuZXRw
bGFuICh1c2VkIGluIHVidW50dSBzZXJ2ZXIpIGFsc28gdXNlcyB0aGlzIG9wdGlvbiB0byBz
a2lwIHRoZSBvbmxpbmUgY2hlY2sgZm9yIGdpdmVuIGludGVyZmFjZSAoaHR0cHM6Ly9naXRo
dWIuY29tL2Nhbm9uaWNhbC9uZXRwbGFuL2Jsb2IvbWFpbi9zcmMvbmV0d29ya2QuYyNMNjM2
LUw2MzkpLg0KPj4+DQo+Pj4gSSdsbCBzdWJtaXQgYSBwYXRjaCB0byBwaG9zcGhvci1uZXR3
b3JrZCBsYXRlci4NCj4+DQo+PiBJIHJlYWxseSBkb24ndCB0aGluayB0aGlzIGlzIGFwcHJv
cHJpYXRlIGZvciBhbGwgc3lzdGVtcy4gIFNlcnZpY2VzIGhhdmUNCj4+IGRlcGVuZGVuY2ll
cyBvbiBuZXR3b3JrLW9ubGluZS50YXJnZXQgZm9yIGEgcmVhc29uLiAgSWYgdGhlIHNpZGUt
ZWZmZWN0IG9mDQo+PiBoYXZpbmcgdGhlIEJNQyBuZXR3b3JrIGNhYmxlIHVucGx1Z2dlZCBp
cyB0aGF0IHRoZSBob3N0IGRvZXNuJ3QgYm9vdCwgdGhhdCBtaWdodA0KPj4gYmUgZW50aXJl
bHkgcmVhc29uYWJsZSBiZWhhdmlvciBpbiBzb21lIGVudmlyb25tZW50cy4NCj4+DQo+PiBX
ZSB1c2UgcnN5c2xvZyBhcyB0aGUgbWVjaGFuaXNtIHRvIG9mZmxvYWQgb3VyIEJNQyBsb2dn
aW5nIGRhdGEgdG8gYW4NCj4+IGFnZ3JlZ2F0aW9uIHBvaW50LiAgV2hlbiB5b3UgaGF2ZSBh
IHZlcnkgbGFyZ2Ugc2NhbGUgZGVwbG95bWVudCwgaXQgaXMgYWN0dWFsbHkNCj4+IGJldHRl
ciBmb3IgdGhlIHN5c3RlbSB0byBub3QgY29tZSBvbmxpbmUgdGhhbiBmb3IgdXMgdG8gbG9z
ZSBvdXQgb24gdGhhdCBkYXRhLA0KPj4gc2luY2Ugd2UgaGF2ZSBzcGFyZSBjYXBhY2l0eSB0
byB0YWtlIGl0cyBwbGFjZS4NCj4gDQo+IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBpbiBP
cGVuQk1DLCB0aGUgcHJvcG9zZSB0byB1c2UgcnN5c2xvZyBpcyB0byBmb3JtYXQgdGhlIFJl
ZGZpc2ggYW5kIElQTUkgU0VMIGxvZ3MgZnJvbSBzeXN0ZW0gam91cm5hbC4gVGhlICJyIiBv
ZiByc3lzbG9nZCBpcyBub3QgdXNlZCBpbiBtb3N0IGNhc2VzLiBJIHRoaW5rIHRoZSAibmV0
d29yayBub3QgYXZhaWxhYmxlIiBjYW4gYmUgaGFuZGxlZCBzYW1lIGFzICJzZXJ2ZXIgbWlz
Y29uZmlndXJlZCIgaW4gcnN5c2xvZ2QsIGFzIGluIGJvdGggY2FzZXMgaXQgZmFpbHMgdG8g
Y29ubmVjdCB0byB0aGUgc2VydmVyLCBhbmQgbWF5IGV4aXQgb3IgcHJpbnQgc29tZSBlcnJv
ciBtZXNzYWdlcz8gKG5vdCB0cmllZCB5ZXQpDQo+IA0KPiBKb25hdGhhbiBtZW50aW9ucyB0
aGF0IHRoZSAxMjBzIHdhaXQgYmxvY2tzIG11bHRpLXVzZXIudGFyZ2V0IGluIGhpcyBpbml0
aWFsIGVtYWlsLiBDb25zaWRlcmluZyB0aGF0IHRoZXJlIGlzIG5vIEJNQyBzZXJpYWwgcG9y
dCBpbiBtb3N0IHByb2R1Y3Rpb24gaGFyZHdhcmUsIHdoZW4gQk1DIGhhcyBubyBuZXR3b3Jr
IGNvbm5lY3Rpb24sIHRoZSBvbmx5IHdheSB0byBpbnRlcmFjdCB3aXRoIEJNQyBpcyB0byB1
c2UgSVBNSSBpbiBob3N0LiBIb3dldmVyLCBJUE1JIHNlcnZpY2VzIGFyZSBzdGFydGVkIGlu
IG11bHRpLXVzZXIudGFyZ2V0LCBpZiBCTUMgaW5maW5pdGVseSB3YWl0cyBuZXR3b3JrIG9u
bGluZSwgdGhlcmUgd291bGQgYmUgbm8gd2F5IHRvIGRlYnVnIHRoZSBpc3N1ZS4NCj4gDQo+
PiBOb3RlIHRoYXQgdGhlIENhbm9uaWNhbCBuZXRwbGFuIG9ubHkgYXBwbGllcyB0aGlzIG9w
dGlvbiBpZiB0aGUgY29uZmlndXJhdGlvbg0KPj4gaW5kaWNhdGVzIHRoYXQgdGhlIGludGVy
ZmFjZSBpcyBvcHRpb25hbCwgd2hpY2ggaXMgZW50aXJlbHkgYXBwcm9wcmlhdGUuICBUaGUN
Cj4+IHdheSB5b3Ugd3JvdGUgaXQgY291bGQgaGF2ZSBiZWVuIGludGVycHJldGVkIHRoYXQg
dGhleSBzZXQgdGhpcyBvbiAqZXZlcnkqDQo+PiBpbnRlcmZhY2UsIHdoaWNoIGlzIHdoYXQg
aXQgc2VlbXMgbGlrZSB5b3UncmUgcHJvcG9zaW5nIHRvIGRvIHRvDQo+PiBwaG9zcGhvci1u
ZXR3b3JrZA0KPj4NCj4+IElmIHRoaXMgaXMgZGVzaXJlZCBiZWhhdmlvciBmb3Igc29tZW9u
ZSwgY2FuJ3QgeW91IHN1cHBseSBhIHdpbGRjYXJkIC5uZXR3b3JrDQo+PiBmaWxlIHRoYXQg
YWRkcyB0aGlzIG9wdGlvbiwgcmF0aGVyIHRoYW4gbW9kaWZ5aW5nIHBob3NwaG9yLW5ldHdv
cmtkIHRvIG1hbnVhbGx5DQo+PiBhZGQgaXQgdG8gZWFjaCBuZXR3b3JrIGludGVyZmFjZSB0
aGF0IGl0IGlzIG1hbmFnaW5nPw0KPiANCj4gTWF5YmUgd2UgY2FuIGFkZCBhIHNpbWlsYXIg
REJ1cyBwcm9wZXJ0eSBsaWtlIGhvdyBuZXRwbGFuIGRvZXM/IFJlYWRpbmcvd3JpdGluZyBz
eXN0ZW1kLW5ldHdvcmtkIGNvbmZpZyBmaWxlcyBpcyBmZWFzaWJsZSBpbiBwaG9zcGhvci1u
ZXR3b3JrZC4gRGVmYXVsdCB2YWx1ZSBjYW4gYmUgYXNzaWduZWQgdmlhIGJ1aWxkIG9wdGlv
bi4NCj4gICANCj4+IEkgYmVsaWV2ZSBzb21lIGRlc2lnbnMgdXNlIGEgVVNCIG5ldHdvcmsg
ZGV2aWNlIHRvIGNvbm5lY3QgdHdvIGludGVybmFsIHBpZWNlcw0KPj4gb2YgdGhlIHN5c3Rl
bSBhbmQgdGhvc2UgaW50ZXJmYWNlcyBhcmUgbm90IG5lY2Vzc2FyaWx5IG1hbmFnZWQgYnkN
Cj4+IHBob3NwaG9yLW5ldHdvcmtkIChpbnRlcmZhY2VzIHRoYXQsIGZvciBleGFtcGxlIGNv
bm5lY3QgQk1DLXRvLUJNQyBvcg0KPj4gQk1DLXRvLUhvc3QpLiAgV2hpbGUgaXQgaXMgb2J2
aW91c2x5IHVwIHRvIHRoZSBzeXN0ZW0gZGVzaWduZXIgdG8gd29yayB0aHJvdWdoDQo+PiB0
aGlzIGJ1ZywgYnkgYXBwbHlpbmcgdGhpcyBjb25maWd1cmF0aW9uIGFzIHlvdSBwcm9wb3Nl
ZCB5b3UgYXJlIGNhdXNpbmcNCj4+IHVudXN1YWwgZGVmYXVsdCBiZWhhdmlvciBpbiB0aGF0
IG5ldHdvcmtkIGlzIGdvaW5nIHRvIHN0YXJ0IHdhaXRpbmcgZm9yIHRoZXNlDQo+PiBpbnRl
cm5hbCBjb25uZWN0aW9ucyB0byBjb21lIG9ubGluZSBpbnN0ZWFkIG9mIHRoZSBleHRlcm5h
bCBpbnRlcmZhY2UuDQo+IA0KPiBJIHRoaW5rIHRoaXMgaXMgYSBleHRyZW1lbHkgcmFyZSBj
YXNlLCBpbnRlcm5hbCBpbnRlcmZhY2VzIHNob3VsZCBiZSBjb25maWd1cmFibGUuIEZvciBl
eGFtcGxlLCBob3N0IE9TIGNhbiBjaGFuZ2UgdGhlIElQIG9mIGl0cyBCTUMtSG9zdCB2aXJ0
dWFsIGludGVyZmFjZSwgQk1DIHNob3VsZCBhbHNvIGJlIGFibGUgdG8gY2hhbmdlIGl0cywg
YW5kIGZvciBCTUMtdG8tQk1DIGludGVyZmFjZXMsIGl0IGlzIGltcG9zc2libGUgdG8gYXNz
aWduIGEgZml4ZWQgTEFOIElQIHdpdGhvdXQgY29uZmxpY3RzIGluIG1hbnVmYWN0dXJpbmcu
IFRoZSBlYXNpZXN0IHdheSB0byBjb25maWd1cmUgaXQgaXMgdG8gdXRpbGl6ZSB0aGUgcGhv
c3Bob3ItbmV0d29ya2QuDQo+IA0KPiBFdmVuIGl0IGlzIG5vdCBtYW5hZ2VkIGJ5IHBob3Nw
aG9yLW5ldHdvcmtkLCBrZWVwaW5nIGRlZmF1bHQgUmVxdWlyZWRGb3JPbmxpbmU9eWVzIHdp
bGwgY2F1c2UgdGhlIDEyMHMgd2FpdCBvbiBCTUMgYm9vdC4gRGV2ZWxvcGVycyBjYW4gc2lt
cGx5IHNlYXJjaCBpdCBhbmQgZmluZCBvdXQgdGhlIHNvbHV0aW9uLiBJIHJlbWVtYmVyIGl0
IHdpbGwgc2hvdyBhIHRpbWVyIHdpdGggbWVzc2FnZSBvbiBCTUMgc2VyaWFsIGNvbnNvbGUs
IHRoYXQncyBob3cgSSBmb3VuZCBJIHNob3VsZCBzZXQgdGhlICJvcHRpb25hbCIgb24gbXkg
dWJ1bnR1IHNlcnZlci4NCg0KRldJVywgbXkgZXhwZXJpbWVudGF0aW9uIHdpdGggc3lzdGVt
ZC1uZXR3b3JrZC13YWl0LW9ubGluZSB3YXMgbm90IA0Kc3VjY2Vzc2Z1bCBpbiBkb2luZyBt
dWNoIHRvIGNoYW5nZSB0aGUgMTIwIHNlY29uZCB0aW1lb3V0Lg0KDQpTZXR0aW5nIHRoZSBS
ZXF1aXJlZEZvck9ubGluZSBlbnRyeSB0byBmYWxzZSBpbiBzeXN0ZW1kLm5ldHdvcmsgZGlk
IG5vdCANCnByZXZlbnQgdGhlIDEyMCBzZWNvbmQgdGltZW91dCBmcm9tIGVsYXBzaW5nLg0K
DQpTZXR0aW5nIGFueSBvZiB0aGUgZm9sbG93aW5nIHN3aXRjaGVzIGluIHRoZSBzZXJ2aWNl
IGZpbGUgZmFpbGVkIHRvIA0KZWxpbWluYXRlIHRoZSB0aW1lb3V0Og0KLS1pZ25vcmU9ZXRo
MA0KLS1pbnRlcmZhY2U9ZXRoMDpuby1jYXJyaWVyICAgICAgICAgICAgIyBvdmVycmlkZXMg
UmVxdWlyZWRGb3JPbmxpbmUNCi0taW50ZXJmYWNlPWV0aDA6bm8tY2Fycmllcjpuby1jYXJy
aWVyICMgPC0gcHJvYmFibHkgYSBiYWQgc2V0dGluZyBpbg0KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICMgaGluZHNpZ2h0DQoNCkl0IGFwcGVhcnMgc3lzdGVt
ZC1uZXR3b3JrZC13YWl0LW9ubGluZSBleHBlY3RzIHNvbWUgc3RhdGUgZ3JlYXRlciB0aGFu
IA0Kbm8tY2FycmllciB0byBjb25zaWRlciB0aGUgbGluayBvbmxpbmUsIHRodXMgYWxsb3dp
bmcgaXQgdG8gZXhpdCB3aXRoIGEgDQpTVUNDRVNTIGVycm9yIGNvZGUuIFRoaXMgZXZlbiB3
aGVuIGV4cGxpY2l0bHkgaW5zdHJ1Y3RlZCBuby1jYXJyaWVyIGlzIA0KZGVmaW5lZCBhcyAi
b25saW5lIi4NCg0KVGhlIG9ubHkgc3dpdGNoIHRoYXQgc2VlbWVkIHRvIHBlcmZvcm0gYXMg
ZXhwZWN0ZWQgaW4gdGhpcyBpbnN0YW5jZSB3YXMgDQotLXRpbWVvdXQuIEFzc2lnbmluZyBh
IHZhbHVlIGxlc3MgdGhhbiAxMjAgdG8gdGhlIC0tdGltZW91dCBjb250cm9sIGRpZCANCnJl
ZHVjZSB0aGUgd2FpdCBwZXJpb2QuIEl0IGRvZXMgYXNzaWduIGEgU1VDQ0VTUyBlcnJvciBj
b2RlIHVwb24gdGltaW5nIA0Kb3V0LCB3aGljaCBpcyBleHBlY3RlZCBiZWhhdmlvci4NCg0K
c3lzdGVtZC1uZXR3b3JrZC13YWl0LW9ubGluZSBhcHBlYXJzIHRvIGhhdmUgbG9naWMgcHJl
dmVudGluZyBuby1jYXJyaWVyIA0Kc3RhdGUgZnJvbSBiZWluZyBhc3NpZ25lZCBhcyB0aGUg
Im5ldHdvcmsgb25saW5lIiB2YWx1ZS4NCg0KcnN5c2xvZ2QgaGFzIGJvdGggYSBuZXR3b3Jr
IGFuZCBuZXR3b3JrLW9ubGluZSB0YXJnZXQuIElmIHRoZSANCm5ldHdvcmstb25saW5lIHRh
cmdldCBpcyByZW1vdmVkIHRoZW4gc3lzdGVtZC1uZXR3b3JrZC13YWl0LW9ubGluZSANCmRv
ZXNuJ3QgcnVuLCBhbmQgYW55IGNvbmZpZ3VhdGlvbiBvZiB0aGF0IHNlcnZpY2UgYXBwZWFy
cyB0byBiZSANCnBvaW50bGVzcy4gVGhlIGNvbmNsdXNpb24gSSBoYXZlIGZyb20gdGhhdCBp
cyB0aGF0IG5ldHdvcmstb25saW5lLnRhcmdldCANCmlzIGEgdmFsaWQgY29uZmlndXJhdGlv
biBvcHRpb24gZm9yIGEgc2VydmljZSB0byBhc3NpZ24uDQoNClRoZXJlIG1heSBiZSBvcGVu
Ym1jIHBvd2VyZWQgc2VydmVycyB0aGF0IGRvIHVzZSB0aGUgZGlzdHJpYnV0ZWQgbG9nZ2lu
ZyANCnByb3ZpZGVkIGJ5IHJzeXNsb2dkLiBJZiB0aGVyZSBhcmUgdGhlbiBnbG9iYWxseSBy
ZW1vdmluZyBuZXR3b3JrLW9ubGluZSANCmZyb20gdGhlIHJzeXNsb2cgc2VydmljZSBmaWxl
IGlzIHVuZGVzaXJhYmxlLiBJIGNvbnNpZGVyIHRoZSBzYW1lIHRvIGJlIA0KdHJ1ZSBvZiBh
c3NpZ25pbmcgYSBkZWZhdWx0IFJlcXVpcmVkRm9yT25saW5lPWZhbHNlLg0KDQpCYXNlZCBv
biB0aGUgYWJvdmUsIGl0J3MgbXkgb3BpbmlvbiB0aGlzIGlzIGEgdmVuZG9yIGJhc2VkIGRl
Y2lzaW9uIGZvciANCmhvdyB0byBjb25maWd1cmUgcnN5c2xvZy9zeXN0ZW1kLW5ldHdvcmtk
LXdhaXQtb25saW5lLg0KDQotLSANCkpvaG5hdGhhbiBNYW50ZXkNClNlbmlvciBTb2Z0d2Fy
ZSBFbmdpbmVlcg0KKmF6YWQgdGUqKmNobm9sb2d5IHBhcnRuZXJzKg0KQ29udHJpYnV0aW5n
IHRvIFRlY2hub2xvZ3kgSW5ub3ZhdGlvbiBzaW5jZSAxOTkyDQpQaG9uZTogKDUwMykgNzEy
LTY3NjQNCkVtYWlsOiBqb2huYXRoYW54Lm1hbnRleUBpbnRlbC5jb20gPG1haWx0bzpqb2hu
YXRoYW54Lm1hbnRleUBpbnRlbC5jb20+DQoNCg==

--------------m15BSJbIdHM0Oni6ty2LVcAK--

--------------1lYhAlfynBr1SBYXf1mbO5LZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEynmy4K0ckuoyjA+Ocg9x5uaKcAFAmIWkzwFAwAAAAAACgkQOcg9x5uaKcCV
XAf+Li94VE1q9EMsPMuGbu7WDFPWo8LQxP1COp2nRGPTRrS4PAvfjXggOcoTmh+3YEiOmI6XXaPS
RPGhABwgKigucgCHz6uajoe8PijmlLnbhW626j8WwcNVsIec99mZiMD4gGaaa9EpmVkBGjBgOt8S
9d06NgZ4uxaKB1t4wPlrpJqCGFo/vV0bv7FBWYPunJhLlLQvGiuZFUBgX21F0BMCvftKVPVuJI3I
4n9HzAhNzWa5H6V+PoOUzLyPWGLA1mCZsJavAUQjBSrrA2JVhkazKPYTfWLf4OFdQwCTEgk34F4H
6GRQ98hg9X6VdTzAKEMEzl/E67ROq6aKinNIx4U2GA==
=Mprw
-----END PGP SIGNATURE-----

--------------1lYhAlfynBr1SBYXf1mbO5LZ--
