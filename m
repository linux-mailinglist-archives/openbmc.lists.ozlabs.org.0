Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD88F6923C3
	for <lists+openbmc@lfdr.de>; Fri, 10 Feb 2023 17:56:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PD0Hd3xMXz3f3s
	for <lists+openbmc@lfdr.de>; Sat, 11 Feb 2023 03:56:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AeHlBr1X;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AeHlBr1X;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PD0Gz2FZRz3cGm
	for <openbmc@lists.ozlabs.org>; Sat, 11 Feb 2023 03:55:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676048139; x=1707584139;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:mime-version;
  bh=pvuf7OSZuudfyJom3qtB2dy8ki9P2Ghxb4ukKJUF7iQ=;
  b=AeHlBr1XCVbl0MK7Qcxw2BsD2kR+BZHb3ecafrIjXJYss723i4J0Z2H/
   o9hvVg0ZKgclAF0xBUpW3FjUhJEWePrEy0oBYzTlK8/cewVN6NEhSEzGn
   N9yAtx/+hK2olRn154ATzntOj8jl1XDY/8e58JgKDNOSrQl8pjh0lU4cy
   Kx0uW3z5pmgcwI4UtsSmEItGnXdYLywVgXCE95hU+pYsZA0DMK4fdo9GZ
   0KEvYNJ3KaxcaDEsOVjgwqrFnCvUKM+Bi//1iXInobnsBerygOMvk6kZ2
   4tNohe3AqweuLZQDE1dFNpjqjtdNLmdH93SL7ez4Hs2fDEtRuzukGpbf7
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="329094710"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208,217";a="329094710"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 08:55:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="731761118"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208,217";a="731761118"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga008.fm.intel.com with ESMTP; 10 Feb 2023 08:55:30 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 10 Feb 2023 08:55:30 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 10 Feb 2023 08:55:28 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 10 Feb 2023 08:55:28 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 10 Feb 2023 08:55:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YcDE12zUZqDIUuXs8L2a7UJDBi5a9Sl6KoODIEdDJPFfIRL81D/EDU2pfw6XJZOcLtOPDt/p+rz0va57rp0oM9uOzwCyK212RpbDZHQkLACZlQPD4AVs6Kequ3gXfxzCdOzwETBs9Ep7Yr0S2Me930v50ZG3xxuLk7vyIniP8DAJxjrTLXv75IyUf7u7DHv6v33eZ9Ndf7lLLhxnjgCQ8jI6BNP6Ordv3H+60ZHsOXQoVKq6Mu5RrP3iIp6IHTitSvnqFFj5AIoYTS5d49G6FtVqN1WiWen3fBOW+oWuYIhp/VzlRhwmEMzziiBIwPFTWj7JMtx6kAFqiNxhIUfVGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noRmHuUMMaqRRwszRgH5q+caxm5fI+b5L13CAZtyiXc=;
 b=K91YsFnlddZjtrJT8CVRpXyM9qvjvM/MyI/1tKGtj3M9xbqVnbl6IecwDKB0tVOg9QL6RtBzmYzS5I9Ya3E6wAAKnWDtLKNDPbGsWtTTqxsjOJ1eUAKtnU7bUxe5Qd8Zil6rW360AUl8BESMrBsPh8TlP3Z/36ZYqu4Gl2cBuwm1aW8LS9v1NydWf+IwmzX2akZ1jNWOI5x4b1K44eXumFRqC5qOoF1DF9gWdoP6g8rn9TSCW4ndXaSeZgAzdWYgDKtd6eOhMMy6Fqol4Imx00s6dhtYa3rhGgwhrlKVHFHMQyKja8B0NGDho+esWlD9TRQb74rd2BEtdEdLOD4BxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by PH8PR11MB6925.namprd11.prod.outlook.com (2603:10b6:510:227::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Fri, 10 Feb
 2023 16:55:24 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::3f19:b226:ebf1:b04a]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::3f19:b226:ebf1:b04a%8]) with mapi id 15.20.6086.021; Fri, 10 Feb 2023
 16:55:24 +0000
Content-Type: multipart/alternative;
	boundary="------------c9kYE5i0nbFdGb5fjqYQWDvq"
Message-ID: <0ef2b569-caae-a5bb-853a-d5135fd00ceb@intel.com>
Date: Fri, 10 Feb 2023 08:55:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: PSU Sensors Association with Entity Manager
Content-Language: en-US
To: <zehra.ozdemir@inventron.com.tr>, <openbmc@lists.ozlabs.org>
References: <000001d93d6d$7618b2c0$624a1840$@inventron.com.tr>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
In-Reply-To: <000001d93d6d$7618b2c0$624a1840$@inventron.com.tr>
X-ClientProxiedBy: SJ0PR13CA0086.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::31) To BL1PR11MB5978.namprd11.prod.outlook.com
 (2603:10b6:208:385::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5978:EE_|PH8PR11MB6925:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ef05db-7526-45c2-5a40-08db0b879a4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ahWaAHOw0heomtdo/v+980TYDZIBzNnGC6HNlFQv+l45/Hoos24JQB2v/M4qCg0iD5NNKBZSgiack0R6nQANFZFw744Ubt7CrNW2s2S42I6noSwfu8FuC7cKf1dv4dFmULpt68H+AmYrBIJxEoBQS8KdBsuzBJQOysEoD04qHHEmnyXs6qnw6uixnaClOLrKGBovJCv4IFEa6lW1/YysQNM3ZHxTTHauH3YQCfLxcmMzhUf/Ms+2Zj0nWLAiVlQvU65+KSiMI5NgAiMwozAayO0pbR1I/688g0AhaadyssnyIkE0dcZ46x90pdwpQXztT4TGuIPEkNO3tM174Z69VMY+UOv+hiBeBjCd6Jy91dylIlMxB5KglZlGtrBq3XNbDkD+hDa9Qo7oVZFYt9+QB3MTkmuJGtiOxSMSMH3/66QvrAEIeRFXP+5dleEPercXGIB0tc2gYbVLHkpyVE7mRLoR+43YEIMw6rALYsuY4BB7vzewWfs2pGM/6G5FOW1kYTzLmuwxOaEL4hJMdViu0MmzwhKp64KOP9qBfWndP+5cqay9EGnYUUvJNJnpJnuhVPY1b7/crsTr9xLjZVoJZfpqQr3uS4udciS0M7cDB+Eewml+R2suA4Ozla51jJ+3njQBwl3bWUScydll4JJF97YbUwrXulpNYPAxR6c0f38q2sT1+jcGXqHu0AcnvwJPRgg+tvEWin8iaNU56hBb1pDXpnoKJ2SJ5cuq9NWdCNr3XzVnkRkQooxZNyj6zef+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(376002)(136003)(346002)(396003)(39860400002)(451199018)(316002)(966005)(6486002)(83380400001)(36756003)(31696002)(2616005)(478600001)(186003)(6512007)(86362001)(66556008)(40140700001)(26005)(31686004)(33964004)(53546011)(6506007)(66476007)(4326008)(66946007)(2906002)(41300700001)(8676002)(38100700002)(5660300002)(82960400001)(166002)(6666004)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0Y0bnZRdlFaeTFTclpUUjFZOFcxcHJPUEl4UUd1VGtjZnl5dHZyVHVtM2Uz?=
 =?utf-8?B?QW1oWjJqNFZZbWxmRXdSN0VuUU5SWFdWRzVYNGEwWjI5QlcrNUtucXFvelFU?=
 =?utf-8?B?TG96eEJEU2V6RUo1OW9ucDg0MFFuYUppMUEydU5GME0yVnFvc0JIcXRpSG13?=
 =?utf-8?B?bDIveThGRHdjby9KTkZFcTRkeFRxN2JQeXh5aG9kM3l4R2E5c1pCSCtMaHVn?=
 =?utf-8?B?RVhza0EyeHdTazlYY0dMN0dwU3YxcUFMa0JiUzNaTVA0b1Mxc1hmNnJNN3Jm?=
 =?utf-8?B?U0VkQUtBQmU3MlNiWElvYWRkV3Nlb2xCeUVTL0tJVDJDMjVvM3NuYm8rSGtE?=
 =?utf-8?B?eXVXNXFLcllHZ0RaQVNiaXpKNGl1Y1hJbVJsR3g3eENiYXo4RHVETkdERHEr?=
 =?utf-8?B?N0lreDBha0lFTXhXZlNvY2p2V1gxWWtxSE95YWgwUHhEdWkvSW1EVVBzTHhE?=
 =?utf-8?B?azdVRUJvb0loU1RaQWd2SUx4TC9hUXgzM3hBb1VqcWJkaHc0elpMYW1OM2Rt?=
 =?utf-8?B?TjNIVEZVWVdpU2dXSFJVcFBVVitwT2Rxdkw2L2htY05vbDNRVVNzRW5wNGRF?=
 =?utf-8?B?aXBPT0dWSXFhMW8rVWMxR0dVMWtQb3JRYTNsYjV3SXRBOEx3ZGhFaHIwbXh3?=
 =?utf-8?B?VDEvSjJTTldvbDdEcVNKY1htRElISDAxNStJZ25BS0VpeDNTZTJXSlFaUmdE?=
 =?utf-8?B?SE5INTN1Q2dOaUlXdzRrV0JEa3ZzRzhlUWRSQjR0dHFEVDJvUlhYUE9iODBH?=
 =?utf-8?B?bXJjUjVnUUJ1c0xyNHdockhKTmpPeWhKZ1ZWTmsxME4zeVoxYmhDT2U1N015?=
 =?utf-8?B?aDYvOGxLd3RmbjA2NTVxV0tHejJDR2Uveit5ZTEvT1kzUUpKQmFFOUl5dGtD?=
 =?utf-8?B?SmVTTlRPM3E0RTZINW91ajBMbVdCNDlvK3FyUkhSUmdLTlZTcFlXaUFDc3hG?=
 =?utf-8?B?ak1WM29aa3pORkRNQjBtN3JrYnZJeXlCMmh4eXdmemtuakhtb2czR1p3Q0hx?=
 =?utf-8?B?MHppY3Z3Y0ttQllSV3U2emtmTHBvTFdYOHhJNm94MENKWmxXSm80UHZCNHJz?=
 =?utf-8?B?aENhMWlJcVhvWjVOdkFmdnREU0xRcWkwZjNKUE9oVHVzNmlPN2VvSkRBM3g4?=
 =?utf-8?B?N3Z3WkJSLzM4c21rdEMwYVNCRnlFZXNGOThxdGlRc3NFNEcwRGt5Vll4aGVG?=
 =?utf-8?B?bHJXOElia015SVgxVFYybkZGTVh3dW5xTUtZWVA1VHBYdHZGYm5lMWswMUIz?=
 =?utf-8?B?em4wQXU5bTVZR3ZkQjZYanFMRURtQlpvN3dsbUJHU3dZWUpkcmd3QU10YjVI?=
 =?utf-8?B?ODBqK1dmU2FKVmVHaUZZbVIyUHVjK2thUXR0SnFGckFFV3Yvc0lXcjZtQjlB?=
 =?utf-8?B?WWVkNGp2Y1drcWF5YmNMS053SEpCMTZINmVwenFqUFhmTHBhYmxnTi9JeHBs?=
 =?utf-8?B?Z3FhbW5jMTk4MnRvckNpWURPNHYzQVJvV2E0aHQ3WEdrNG1LMGE3NXJRU2dz?=
 =?utf-8?B?MVI1OGdOTUpmd05FUkdtcXdBdFpGbkFUMW1DbDVIRWpKVlJlK2tmTHRNL0k3?=
 =?utf-8?B?aGNjV0NZTkFpbHBNbnJMblkrUnVTQis0azFlR1B3SkhRbFRrQVU2T3IvWkpD?=
 =?utf-8?B?MXlSa1JqMSt2VS9GOXZPdkpUS1h4dnFPYUhUU2tkNUp1UlR4ZjZJNVV6dS91?=
 =?utf-8?B?eWlMMnJhdi84MVpSUFljOGR1VU9lM0IxWUVGV2krMmpPWjloSnhrdU5TMnlS?=
 =?utf-8?B?N2M2TGtsR1BqZHRlQS9TL0NRbkEwVlEzZHI4UWZnU2RRRnlMS0NUTmkwYXVa?=
 =?utf-8?B?NHZ3emVCQ2JobXMrSDdibXRFU3EzWmhQNU5yRXFVc2xvRlFZdkN5YkdRNEY0?=
 =?utf-8?B?aFZhd056RTVaVFJzTU9maWZJMjk3MFcvdXB5eHNGeVk4cUs4QXkzUDZVbXlU?=
 =?utf-8?B?WmdPV0RaWFVBZVhvaFZFM3hScW9TQWFURERleEh0SXgzbGVUUjRlcjBOaWNU?=
 =?utf-8?B?MFlDVXRuWDh2dHRFbFI5ODZSSHhpam9sVlhNQWFLdFNZNzMrQ3VYQzZDT0dv?=
 =?utf-8?B?UWRyNmEvT0s2Y3hWY1NZUUlRYzA1bTdTL1pVSms2cU9tMEtnY2pCOHprak11?=
 =?utf-8?B?MEdpdVdYcVUwZTZzcVdEaUtjeXY0eGY3MzFmZ1cyR1FHYXBnYkRZSVVCd2t1?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ef05db-7526-45c2-5a40-08db0b879a4a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 16:55:24.4017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QgiNujopQyJPjShH15kAZj61F7Wl8eQ3xrezIFu22iYvd0TXFcYGrLK6au+8d4vK0bkc2KGZCorUnDNUGxwaNbKDattzCs3ISpksdxdChPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6925
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
Cc: "'M. Erhan Yigitbasi'" <erhan.yigitbasi@inventron.com.tr>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--------------c9kYE5i0nbFdGb5fjqYQWDvq
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 2/10/23 08:33, zehra.ozdemir@inventron.com.tr wrote:
>
> Hello,
>
> We are trying to implement psu sensors with entity-manager by defining 
> chassis and power supply in separate json configuration file according 
> to entity-manager’s sample configurations.  PSU sensors are not 
> displayed under 
> /xyz/openbmc_project/inventory/system/board/{chassisID}/all_sensors 
> but under 
> /xyz/openbmc_project/inventory/system/powersupply/{powersupplyID}/all_sensors. 
> And they are not shown in the Web UI. Here is the powersupply.json 
> configuration we used:
>
<snip>

There have been changes in the Redfish schema, which is still in 
transition in bmcweb.

There are meson flags that allow you to choose between the two:
EXTRA_OEMESON += " -Dredfish-new-powersubsystem-thermalsubsystem=enabled"
EXTRA_OEMESON += " -Dredfish-allow-deprecated-power-thermal=disabled"

The "new" model, implementing the PowerSubsystem schema, is incomplete. 
There is a group of commits as part of the 'redfish-power-supply' topic:
https://gerrit.openbmc.org/q/topic:redfish-power-supply
The commits are not merged, excepting one.

I'm sure other openbmc members may also have additional input.

-- 
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com

--------------c9kYE5i0nbFdGb5fjqYQWDvq
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/10/23 08:33,
      <a class="moz-txt-link-abbreviated" href="mailto:zehra.ozdemir@inventron.com.tr">zehra.ozdemir@inventron.com.tr</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:000001d93d6d$7618b2c0$624a1840$@inventron.com.tr">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}span.E-postaStili17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal">Hello,<o:p></o:p></p>
        <p class="MsoNormal">We are trying to implement psu sensors with
          entity-manager by defining chassis and power supply in
          separate json configuration file according to entity-manager’s
          sample configurations. &nbsp;PSU sensors are not displayed under
          /xyz/openbmc_project/inventory/system/board/{chassisID}/all_sensors
          but under
/xyz/openbmc_project/inventory/system/powersupply/{powersupplyID}/all_sensors.
          And they are not shown in the Web UI. Here is the
          powersupply.json configuration we used:</p>
      </div>
    </blockquote>
    <p>&lt;snip&gt;<br>
    </p>
    <p>There have been changes in the Redfish schema, which is still in
      transition in bmcweb.</p>
    <p>There are meson flags that allow you to choose between the two:<br>
      EXTRA_OEMESON += &quot;
      -Dredfish-new-powersubsystem-thermalsubsystem=enabled&quot;<br>
      EXTRA_OEMESON += &quot;
      -Dredfish-allow-deprecated-power-thermal=disabled&quot;<br>
      <br>
      The &quot;new&quot; model, implementing the PowerSubsystem schema, is
      incomplete. There is a group of commits as part of the
      'redfish-power-supply' topic:<br>
      <a class="moz-txt-link-freetext" href="https://gerrit.openbmc.org/q/topic:redfish-power-supply">https://gerrit.openbmc.org/q/topic:redfish-power-supply</a><br>
      The commits are not merged, excepting one.<br>
      <br>
      I'm sure other openbmc members may also have additional input.<br>
    </p>
    <div class="moz-signature">-- <br>
      
      <title></title>
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

--------------c9kYE5i0nbFdGb5fjqYQWDvq--
