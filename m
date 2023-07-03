Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E996746346
	for <lists+openbmc@lfdr.de>; Mon,  3 Jul 2023 21:24:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KOO+O6kr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qvwpr1JQ5z30hM
	for <lists+openbmc@lfdr.de>; Tue,  4 Jul 2023 05:24:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KOO+O6kr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=johnathanx.mantey@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 04 Jul 2023 05:24:01 AEST
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qvwp92rxHz30hG
	for <openbmc@lists.ozlabs.org>; Tue,  4 Jul 2023 05:24:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688412241; x=1719948241;
  h=message-id:date:subject:to:references:from:in-reply-to:
   mime-version;
  bh=MIKn8rP+L8ACYVhmLFTLtEBpexciZoK+dHNjzeK2Hho=;
  b=KOO+O6krXRe/SZOc/5joV+eHTS27haRTE17ZlTtswb21R2J479dN/73R
   y2vqa0AtzpYIjqsKCWBB/acR+IOoopqT/9t++xOxr2rPaUFp9RkrkMrMj
   QsoJ1+rIngIvCod7Vha2kTh9/UO9BnwDFhQVwtksZJhIlU1rq8J6IBEOJ
   eKsIV0BtaUaPNFfYJEb1FYvEXvYYsq3OMosWtPE23kbF3tNty7fSa/QN+
   5Z5f6cp2BFcXaXqDl7XC4qKdna3VpltVZCzJL0QFaGVl7MTNvF+ztKezw
   Qrg2rUuvioMU82YOHgb/B8AyIr0pLtXD1rrN+JPp2L3kaXES9ExYfREzE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="352780304"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208,217";a="352780304"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 12:22:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="831919644"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208,217";a="831919644"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga002.fm.intel.com with ESMTP; 03 Jul 2023 12:22:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 3 Jul 2023 12:22:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 3 Jul 2023 12:22:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 3 Jul 2023 12:22:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 3 Jul 2023 12:22:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VjGE3ZQ5bHr1/Y3UhnGr59C6/wju4YHV5vClm0KFtHlCq03vRSnlDR+xr8yiu0KwRQhuzUIQnoBw+tik9sBQ/KpKXvFsz9U4dmJViZKvLLI2rd+bHun5A18m+w2T4GkskF1Tfv6FwTZiIaXGxGX7K8e9iZ9svL26Buu03takVFTRnhzVR5aUdb1mbkyZ+7PHLp/ajEIJP8fiC2TGZQ4YFFPT1le/DoUM0w9TZyBWZyb9zJD7EEL3sdfXmM+mmM/dRR++Y2pmUQUTZ1pUtUQuhSEchGJ1ommvSfl8CY+PLmJRzwS8TcatTU1PyZsHdfGK4OtCKDV7Jdbws/aVousTWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wc6PMHOthq8WFmnynVX6G4BfXKx+mWIdr+t5YtfT3YU=;
 b=Qh0JS5pDTHX7gswO6UBj8I0d0ODnSqmQTcrMuDE9atVOeariyAzNvSLY17/eQRvOfjil/RDT64fWnEVk/w3qT4SqDYsrOprUm+JPrTizC/DneNUCdaf2/sDO3UI09lB5w9sJxcVTNj3cgX7u8XJqStleKe5eH/KfJMk5xk8e/MDb+CxP6hnIGCTHSylnxWepzO3p8Nl3YJ/HoTWLGiJvChcpwzhYQUCNIwJ0OXOdxF1kw13HZ8iK1aBNmoJ9DYawm2FLpVGh4UnvoRqW4VcxvwkcZYKhlh8kirRr1YSjaAqbCTHvR1eSdncepFFBNz8H+TPQmEPxuhDGWdAK4PYNZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by PH0PR11MB5877.namprd11.prod.outlook.com (2603:10b6:510:141::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 19:22:36 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::19b7:466f:32ac:b764]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::19b7:466f:32ac:b764%3]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 19:22:36 +0000
Content-Type: multipart/alternative;
	boundary="------------KkhbtGMJ7CNhx041VYFvf9kK"
Message-ID: <77638e28-e71e-6415-f827-bc644dbf0008@intel.com>
Date: Mon, 3 Jul 2023 12:22:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: IPMI Sensor Name limitation of 16 bytes
Content-Language: en-US
To: Rohit Pai <ropai@nvidia.com>, Ed Tanous <edtanous@google.com>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <LV2PR12MB60140D575EA40854D74472F4CD719@LV2PR12MB6014.namprd12.prod.outlook.com>
 <CAH2-KxAVgJUC89mdLO4RnrQgAV-rVROrUHSDz=j-SzyVhTMKFA@mail.gmail.com>
 <LV2PR12MB60148354AAD9D6E65F2B1419CD24A@LV2PR12MB6014.namprd12.prod.outlook.com>
 <57ae2df9-214c-ac48-f7ae-f069c83c9617@intel.com>
 <LV2PR12MB6014B1512E2965258DBB52B8CD2AA@LV2PR12MB6014.namprd12.prod.outlook.com>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
In-Reply-To: <LV2PR12MB6014B1512E2965258DBB52B8CD2AA@LV2PR12MB6014.namprd12.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0111.namprd05.prod.outlook.com
 (2603:10b6:a03:334::26) To BL1PR11MB5978.namprd11.prod.outlook.com
 (2603:10b6:208:385::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5978:EE_|PH0PR11MB5877:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bec109d-2b77-4427-257b-08db7bfadb98
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7hjwleYPoppdDBRQec54PQOlYoLFLiqJEdgYojEvb4dxjJJYKfiTTx/YTJYDZhxQ8So22dCkkwRuHQ+beJm3c+m/FnIdSgUmT9Rq0SpfJP3ndGh0JWiqQFMEw/K8xwtGE+K39SDXmIWqsU3Kbo7bJK2m/PZcNfEj01+FDKbfmlWxOCsGd+fnPM2sFVdX6jwIn52j24WE9PJUMMzRY8Lx16GorgkoZn+rLbRcvRoRRW6XpyQhlcTYKQ3f3EqC6hGa47vF9AQbMyhkGIkDlPcGMoENvtRuOtOjaC8yHzcZw5SyRvyKM3qWSCwsm+Mtq6/kxDaO7yXisJ+iQhEF0wh4rnFRNFCjSkNosiBaTCV4hauw6821IyIydYBs2qtbNxcd8g5m35md4UcoTOzyjM0AXgnGzyUsUY9nxZMG1gDd/RdxIJAeH519g7pPkZwpdmIs2KllRQEj3PF1jffXkODF8Nf+3FN6ll41a0uXfFXfD+7LszN7Qz9WrJaP+ccWG5e/TS2zFNotp2TeTnpn95OerQheoph45artbBaIJU5JjyWZ/majBja3mIS9ffnA7SkeE5BShDA6FZeusArqXXOr3oOQU7p1bXhJhB7K4k672PysV8rGDe75Lw1LjkThcRx1xigD5WPNBqOt8TI/kGPunw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(346002)(39860400002)(376002)(396003)(451199021)(316002)(31686004)(66556008)(66946007)(186003)(86362001)(31696002)(6506007)(66476007)(6512007)(26005)(53546011)(40140700001)(82960400001)(2616005)(2906002)(33964004)(6486002)(6666004)(38100700002)(5660300002)(478600001)(8676002)(110136005)(8936002)(41300700001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3VRR0xzb2FreWwrV3F2dW1HWmVQZWhsSWQ4d25Td3Y4UnpZWGFaK0ZZQ1dR?=
 =?utf-8?B?dmF6TmJOZDFEQkVpWGgvWWhJWTErY0s3dTlrbW5mbGFjeWgxNkl1N242ZTZO?=
 =?utf-8?B?N1lNeFE3UUxDWjNjYnpOVDMwRU03cjRpNXVYV1k5OWdzVTJtV2c5a25kREUy?=
 =?utf-8?B?b1ZWdHdmV09ZNjVmWFEvRFMrTDFhZE8zMmRXUDlqR2xLMXREcFI1MXp2TzVY?=
 =?utf-8?B?cHJ2NDdzUExhb01sKzBDZzZnSG5BallINC9DUnFBVWxrYThUbC9ORWR0MnVF?=
 =?utf-8?B?dk0ybmZhZ2VmZXhQOVNCWDc1aEZmdkZBR1ZndTBGU3gySjIzTk5jaGlXZ1N3?=
 =?utf-8?B?SC94TU1NN01MaDlPUHNhSlNFdTJabkNtMjMrcHhDVWhLY0lUazdZSUp3eHAr?=
 =?utf-8?B?azJpU1NMN1pGTC9tbVFUL3BMd1k0aERWdEdVRmx6NGJwLytpSTY4MUZPWjh1?=
 =?utf-8?B?U2ZCTDFLcWQ5eC9KNWJNOFZEZjZETFRhMm1wQ3BuRXRmQnhPWDZHRzRNVDUz?=
 =?utf-8?B?RUVlczZlS2tUZmVXMDZqKzhRL214NkNBWlpTSGRBTUEraTBocUw3Vy8rVFY3?=
 =?utf-8?B?OWxQTlZHRHl1QU1MT3U1YTQwL3dpWGN2cTYzVldmYkJtdkMyNXlQSy9qdk1W?=
 =?utf-8?B?dGZ0cjBXbndjZlQzdlJOWXo2amN6MERiSGs0K2pJRVVVUTdGNCtSZnNudHVq?=
 =?utf-8?B?MURjU0Ftc1E0NlI1NlNobEFrQ3M3c09BMThxSXBpQWtJRE1hY2x3S2tIc2hT?=
 =?utf-8?B?TEpsejhXTmdpOTRNRjFVYVVJOFJlcEw1OWZLcGhsZVRDVU1ZQW05SGdaM2pX?=
 =?utf-8?B?V0RyQlJsRSt2NENodnp4UlN1R1BkUFRWckNPYXh2OUZJeTM5cUczQ2lScVAr?=
 =?utf-8?B?WGtkaTN2MWl2UFVFNUFhNWJlQldPOGs1cVZEaUNuM3hzMDBraEhZR0QyMUlL?=
 =?utf-8?B?UVZaT1VSTTYyZnR0Y2d2aEsvRVdoMUE2Y21LNHFwWlZiUW91SG9iNGpEcWlk?=
 =?utf-8?B?ZG43YTQ3MWdCQ0RxQ3FqeWhGdUloaUV3UnRqaVdDOFVKd2J1akl6VXI1NW9h?=
 =?utf-8?B?aERFMys5TjJvL3kvcFhTSFRkeXdVbmFwcmZKQVk0aVp3NS9Zdk1TRWd2RCtH?=
 =?utf-8?B?WXZLR2hQNHBGRVdSbnh3VjFUcTdzYnU2U0k0R2R1SStuQWNNWGV2NjVuZlI4?=
 =?utf-8?B?RzhyZGV6cDRyQW5UTEYrTWtjTXBkNFpwTkFpRnJMbm1VQUlUTTNPRE9meEdU?=
 =?utf-8?B?MU1hMnBSRUxCWkcyS0ZsY0x2Z2c4NTZFOEN2a3VxeSttTXd2eFdDK3AyUzU0?=
 =?utf-8?B?d3p6a0g5QXVwN0l5Zll0SG5UdEZFZFRrWFZ3b0x4YlJjNjFpbXkyV083OXY0?=
 =?utf-8?B?LzBFVFByVVVkamYybkRxa0xwcWczYmIzckV4SlVUNStNNVJNdS9UeFBWTWxJ?=
 =?utf-8?B?MWI3bTFHSXdTNnN4NlFZRFpBUlRtUytxWGFKTWpHODVDL3A4VnRZTWlGTUJw?=
 =?utf-8?B?Y1FTR3VIVlhmZFM3RGovL2JOVUtvc1prbm5vT1dMWmQ1Zm41ZHFUVEx5bnRM?=
 =?utf-8?B?TEN0SDFKYWRQYkJKWFFidFFqa3U0dzJuTm5reDlNY09KUFhUVkdlRkVqc3RO?=
 =?utf-8?B?ckJOcUZHN2x4aElscy9tM2UrblBiUkMwMklaR1o3NDc0ZVYxWi9PMUMvbEFV?=
 =?utf-8?B?MlR3QWVLNGVxaWtNVE81Y1JhUXdxYkNFci91emVrbjlZSWJjN3lYZ1IyVEQ0?=
 =?utf-8?B?T0g5K2s2K2paSjBSVVowRFF2REJ6YWkyN05XbWlIS05YM1JSVEdTWG5KMC82?=
 =?utf-8?B?TzdXcFZaMGNKVEN5Z0ppdUhPU285dVo2NThRUWg4NGhmUEtZajNuNXZaOHVn?=
 =?utf-8?B?U3RlZzc3QmlwcUZyTWxRWGRvSHZ4MW9SRVBpanlhVTJLSElUL3R4djhITXVO?=
 =?utf-8?B?alZiRU5mMHdNTGswN3VkV3ZaU0N2QXRLaklQMjZjaHkzWWsvZ2hscnQ2S0tP?=
 =?utf-8?B?TWp4WHc1ZVh1amFjWGJzbTByQzlaMmNGVWVhODFETEQzbENuaHQvQVlObjAr?=
 =?utf-8?B?OWVFMFY2R2NMR0NvSnMxQXJUZXUxMmsrMjVhRXZib0RYaXR2dXN3QmJRQVhQ?=
 =?utf-8?B?UFhjalozWGRmVDlHZjhJeWo0b3BQNnFNMG82WXFYTXB0aWZBNTBTNFZOM2cw?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bec109d-2b77-4427-257b-08db7bfadb98
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 19:22:36.1085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFBSguUEngN5Fbj6Dqs33HxE7elX9qyVZaHNo+6d1iCexuLKh4Y9XbaN8uEyLtBh41oa0ceDsMhBtpoQCUnnOc4/PT9erhZ/1Ys8INbG9O0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5877
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

--------------KkhbtGMJ7CNhx041VYFvf9kK
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 6/30/23 02:04, Rohit Pai wrote:
>
> Hello Johnathan,
>
> Thanks for your reply.
>
> >> We're proposing adding a "ShortName" entry to the JSON 
> configuration file read by Entity Manager.
>
> Could you please add some more detail here, how this would be consumed 
> by ipmid ?
>
> The sensors can be created by an application, and we were looking to 
> do modification in one place where this conversion can happen.
>
> Also, as per your proposal we need to know all possible names of the 
> sensor per platform and configure it right ? We wanted to propose some 
> auto generation algorithms where it can take up any new sensors which 
> can get added or discovered. I agree with you on the point that auto 
> generation algorithms can produce mangled/duplicate names.
>
The current plan:

Modify phosphor-dbus-interfaces Sensor/Value.interface.yaml to include a 
"ShortName" string entry.

Modify EntityManager JSON input files to include a "ShortName" field. 
The "ShortName", in my current thought process, is optional. The intent 
is to use "Name" directly if it is already short enough to meet IPMI 
requirements.

Modify dbus-sensor daemons to properly generate short names based upon 
the "ShortName" string provided via D-Bus. The ShortName may need 
adjustment if the incoming string has fields that require regex 
modification. Once the final ShortName is computed it is stored as part 
of the 'struct Sensor' upon which most of the dbus-sensors are derived.

Modify phosphor-host-ipmid D-Bus SDR generation to use either "Name" or 
"ShortName". This will replace the code that generates the name from the 
D-Bus path string currently in use. The dbus-sensors code returns 
Value.interface entries with the "Name" or the "ShortName" fully formed. 
If the D-Bus record has a "ShortName" entry, use it directly. Otherwise 
use the "Name" entry directly.

The goal of following this model is to provide each OpenBMC vendor to 
control how sensor names are emitted. Another goal is to avoid receiving 
a series of defect reports issued by QA stating the name of IPMI sensors 
are suddenly significantly different that they were in prior releases of 
OpenBMC. The proposal here mitigates this second issue.

I am currently working on a project to do away with some portions of 
intel-ipmi-oem and migrating to phosphor-host-ipmid. I'm not certain I 
can continue the project if a significant change in how sensors are 
named is implemented.

<snip>

-- 
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com

--------------KkhbtGMJ7CNhx041VYFvf9kK
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/30/23 02:04, Rohit Pai wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:LV2PR12MB6014B1512E2965258DBB52B8CD2AA@LV2PR12MB6014.namprd12.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;}@font-face
	{font-family:"Century Gothic";
	panose-1:2 11 5 2 2 2 2 2 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal">Hello Johnathan, <o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">Thanks for your reply. <o:p></o:p></p>
        <p class="MsoNormal">&gt;&gt; We're proposing adding a
          &quot;ShortName&quot; entry to the JSON configuration file read by
          Entity Manager.<o:p></o:p></p>
        <p class="MsoNormal">Could you please add some more detail here,
          how this would be consumed by ipmid ?
          <o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">The sensors can be created by an
          application, and we were looking to do modification in one
          place where this conversion can happen.
          <o:p></o:p></p>
        <p class="MsoNormal">Also, as per your proposal we need to know
          all possible names of the sensor per platform and configure it
          right ? We wanted to propose some auto generation algorithms
          where it can take up any new sensors which can get added or
          discovered. I agree with you on the point that auto generation
          algorithms can produce mangled/duplicate names.
        </p>
      </div>
    </blockquote>
    <p>The current plan:</p>
    <p>Modify phosphor-dbus-interfaces Sensor/Value.interface.yaml to
      include a &quot;ShortName&quot; string entry.<br>
    </p>
    <p>Modify EntityManager JSON input files to include a &quot;ShortName&quot;
      field. The &quot;ShortName&quot;, in my current thought process, is
      optional. The intent is to use &quot;Name&quot; directly if it is already
      short enough to meet IPMI requirements.<br>
      <br>
      Modify dbus-sensor daemons to properly generate short names based
      upon the &quot;ShortName&quot; string provided via D-Bus. The ShortName may
      need adjustment if the incoming string has fields that require
      regex modification. Once the final ShortName is computed it is
      stored as part of the 'struct Sensor' upon which most of the
      dbus-sensors are derived.<br>
    </p>
    <p>Modify phosphor-host-ipmid D-Bus SDR generation to use either
      &quot;Name&quot; or &quot;ShortName&quot;. This will replace the code that generates
      the name from the D-Bus path string currently in use. The
      dbus-sensors code returns Value.interface entries with the &quot;Name&quot;
      or the &quot;ShortName&quot; fully formed. If the D-Bus record has a
      &quot;ShortName&quot; entry, use it directly. Otherwise use the &quot;Name&quot; entry
      directly.</p>
    <p>The goal of following this model is to provide each OpenBMC
      vendor to control how sensor names are emitted. Another goal is to
      avoid receiving a series of defect reports issued by QA stating
      the name of IPMI sensors are suddenly significantly different that
      they were in prior releases of OpenBMC. The proposal here
      mitigates this second issue.</p>
    <p>I am currently working on a project to do away with some portions
      of intel-ipmi-oem and migrating to phosphor-host-ipmid. I'm not
      certain I can continue the project if a significant change in how
      sensors are named is implemented.<br>
      <br>
      &lt;snip&gt;<br>
    </p>
    -- <br>
    <div class="moz-signature">
      
      <font color="#1F497D"><font face="Century Gothic">Johnathan Mantey<br>
          <small>Senior Software Engineer</small><br>
          <big><font color="#555555"><small><b>azad te</b><b>chnology
                  partners</b></small><br>
              <small><font color="#1F497D"><small>Contributing to
                    Technology Innovation since 1992</small></font><small><br>
                  <font color="#1F497D">Phone: (503) 712-6764<br>
                    Email: <a href="mailto:johnathanx.mantey@intel.com" class="moz-txt-link-freetext">johnathanx.mantey@intel.com</a></font></small><br>
                <br>
              </small></font></big></font></font> </div>
  </body>
</html>

--------------KkhbtGMJ7CNhx041VYFvf9kK--
