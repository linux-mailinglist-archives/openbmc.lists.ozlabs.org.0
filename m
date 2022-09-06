Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 619EB5AEF74
	for <lists+openbmc@lfdr.de>; Tue,  6 Sep 2022 17:54:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMVLP36HTz3bc3
	for <lists+openbmc@lfdr.de>; Wed,  7 Sep 2022 01:54:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N0zHTQos;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Two or more type TXT spf records found.) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N0zHTQos;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMVKs0TRPz2yKD
	for <openbmc@lists.ozlabs.org>; Wed,  7 Sep 2022 01:53:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662479618; x=1694015618;
  h=message-id:date:subject:to:references:from:in-reply-to:
   mime-version;
  bh=xWomLtavW5CBBgYvY73XUkY9Q4b7jcCdDU3XuC2JYGk=;
  b=N0zHTQosMGBVm7aPw8J9YtVdkuDlZxJK0jvML8WiUgrVs+z+Q+SNywRn
   9t6wZuwJ1AaRfuER8ZSq+D4Xq+elZ3bp89mLhBRNkSXh7WJxXlr82qj7H
   l2TMrVx4zOZ/pqieVkHWLOzxyVG+TWvJK/BG4WkMeH2+F5akzwF7dyjwn
   VKs1eR+UAcvAy2yOsI/KhPQwBzYYG19P9r0mCQcUVEAJe50ohVadq0jDi
   rX5buK8VaOT/Opzy+jskBmHqIKFApANauu768bv7ouKsRD+jSpRCUFYnW
   lEAvIrZf6xj3gCS2xjfK2z3bf+nax2YE/msEvA58H3rUSK/BbAaNtbU3i
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="276367910"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208,217";a="276367910"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 08:53:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208,217";a="644219075"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga008.jf.intel.com with ESMTP; 06 Sep 2022 08:53:25 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 08:53:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 08:53:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 6 Sep 2022 08:53:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 6 Sep 2022 08:53:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmJ8kwD3jtPcK3jdGvkx16gVzLYeLVJVpAxKI32bNFs6uXNXUmfmnvTf9XdYydxVFwhkjFMtWn/+FsHJiaT9XUexfmfBqdO2srRyHmhUO2BfeZCBGTOCXz8kyoYQhTEoShDOtcvD1GIxW9k/5sfNPT04UBm9+rF5YBjtKcyXxhTZ8HaZfYydL59tWKLZnxIOZS5pdcCftagUE7WhfNlqOLVAN1aec2h96LtHUnmsSmAlFa3A/qxQ3Uboblf54IIfHsXmQEo+GTwZHP3U08j7Iqg4wR28JRjEfWnCylLYWNC89QHlZlXsNcQZgVyk4kROOope1IyZcuScJ9RX60eQGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8qRExeXz8eDfJal8gXypurXiLV70xRuTNmvd75kzAg=;
 b=BrRI4VbAXGQQK8j47apoFuzb4hPQa03mizTlzl2jZpz1twCB1DkzRkg6hCJlwQYZi5yD0usKok1ORde//PtE7CxTwbilzoi8bW62wyLS96Hvu1KWQNhQC7BD0q1wNb/RhC3WwozCQ6qVCzVo9BS11sc4p5ko24KSPph/VAUfwEDgpBHJwvwHRIQh8OPCf7cLFP07jV8rsWLmpXav42QHIA8yAwYu9gxbGpiOe77hM7Z94g3skh2ev7OkktzgzKZoM8lrE2HCIVcB4sPPBSP4sN+TqMmarvaEavZDNvrtOXiBMjkW9ZnekJ30d6tqlW3D7LHglfVgjglCFYPBQbbWXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by IA1PR11MB7271.namprd11.prod.outlook.com (2603:10b6:208:429::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Tue, 6 Sep
 2022 15:53:12 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fce1:b229:d351:a708]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fce1:b229:d351:a708%9]) with mapi id 15.20.5588.015; Tue, 6 Sep 2022
 15:53:12 +0000
Content-Type: multipart/alternative;
	boundary="------------BgC6SfOQafozHhkdgzXV0L2Z"
Message-ID: <2cdb6ea6-fc85-9835-d410-01195148a3eb@intel.com>
Date: Tue, 6 Sep 2022 08:53:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: SATA hotplug notifications for BMC inventory updates
Content-Language: en-US
To: Paul Fertser <fercerpav@gmail.com>, <openbmc@lists.ozlabs.org>
References: <YxXZeFQhJWDSHSVf@home.paul.comp>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
In-Reply-To: <YxXZeFQhJWDSHSVf@home.paul.comp>
X-ClientProxiedBy: BY5PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:a03:180::26) To BL1PR11MB5978.namprd11.prod.outlook.com
 (2603:10b6:208:385::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b41f8182-6908-4d2b-ea8f-08da901fe734
X-MS-TrafficTypeDiagnostic: IA1PR11MB7271:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dJi34JZO0JhwBVa+rV0y4F5MNa7roXfbL8/ajJsoIs09Hn4YOAvOwQbKNsKs5WDEj0P8ngc9ohPky7RHd9q/ZcxBxS5yYqoumSSU15CuiEc2UrBYteIW9vgNotz1NTKw17t38REG6pphzxqWuL/bw1fZfffcyMpUoXH2uLGTVp9eaFyWCq9BCqI9Uqkfl1iOwmjgINnw/Q9CWKAARGRSXEBjg9aHTRoCAbUuTBhBNm7cVXSGYTLgcHIFRcI1+rriuxVj7hRWtA+IqIJP5LgVtci0+iXecRV6hkNzsukeyHi8XCaq4Y19LOVtfyxdU2+mHoM4u5Ru0pVSjI8B7CBhUujQ8TV+HuUD7qozIJKlofA7x1ONQYGpQtv6Jm/SpoezfUmDqspTJyzCDH6uZKpFinQC0/tdAwOTlJa3RQJjiRcRzQ7cWXG6Ty0rxAJ8UNNLsiIpcHsBJNqCbVqd+ak6eV/C7Ac0Razbr6EIKj1vUT6VXsVW3eQD6KHS1IOddKaXx6MIG0tO1JZI5shGqOIuCq3yUiNfq5MqMo++KBoZjFj+jK/gEJsreUQvotlhk6MYjDpChsQ+JVeWJqnMnXzcV5j1Eo9BqIVBHGpOoMxE+ToyfU2wf0nhD9yTiwHkWjf63d7qXI2/b1CEyvhfXu6QFwv3INkDAYO9rC87wsyRcgdyf7xxufNWm6i748H4bMkz8so3nYMp4aXivPBFeK2WGmeShSON63ZN6Fhild2gkOtpsUPO3TD1YJJUlMi5G13+NQk4Uz2zwK9LapbNL+OkDEHAocbztHnxMET9cIra+o8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(376002)(366004)(136003)(396003)(66556008)(82960400001)(38100700002)(66476007)(8676002)(66946007)(316002)(2906002)(83380400001)(5660300002)(53546011)(36756003)(2616005)(8936002)(186003)(26005)(6512007)(6486002)(478600001)(6666004)(41300700001)(6506007)(33964004)(40140700001)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTdobEgydDJDQW56dUJDL2tEZjg3eFg4Rk52a2c2RVpLbzRFSndUR0VuZXF6?=
 =?utf-8?B?Zi9RQThhVnFmcWFYb204NXhqcDd5NllteVh2aHhieDVLb3UyK2ViMGtMVDRi?=
 =?utf-8?B?d2NUc05POW83Q3RsdlNDUW1lMldpZmxTeWx4R3BvVTFRd1ZtdkwxNWJuVk9H?=
 =?utf-8?B?VzdSM1phS2s0QmlHMkFGQ0dRQ0l5M0MvY1pVeVlyZHlUM2FSSHV5NzJPTy9p?=
 =?utf-8?B?UEpVQUtXNDh2OWtIbFVOTlNxZllrZWsxYWhCRkJoUnJlblBUcG4yaVV4S2dB?=
 =?utf-8?B?NnVjeXR3QWpSYXlqcFp6TVI4d1lUQWx5VW15VlVYU0RMK2lrYjlpbUpkdG15?=
 =?utf-8?B?YkVTQjVURGxWQ21iaTdxTTVLVWlEOXN3V0dSbXJ4NjU2TytpL0tsanFZZWRF?=
 =?utf-8?B?Yzd2SGFGMURVaGpsSk1QRHpMaFRtT0d1L1RxSm5ta0lFY3RGeVVHWUd4NDBM?=
 =?utf-8?B?cE9mekFpNENmaG9mQ3RGNDQ3d2VNYXEvV2JJY29jcjRKU0hZeUxhMkdTYWsy?=
 =?utf-8?B?bDZKYUs5SWwxWTh1N3JpK0hDZlUyZGFsQzEza3lmclRSa3FnbmxFZDV4dEpj?=
 =?utf-8?B?WXFpbTlacE1xbm5icFhBMzI4V08wVjFTT3hLRE1MT2VCdlIzZ2c1cFhKWE5p?=
 =?utf-8?B?WmthU1BWd1B1VkwzaWt2Y2JrOVQ1QUd3N04yOWFUYngvVEpFTElYMjNaWERX?=
 =?utf-8?B?akJkVE12b0p2b3pQZ0hWeHNrOGp2ZDNRSjRaVGhXNFpoYTIvZDNTNjk2dDdW?=
 =?utf-8?B?TXNwQzJpc0g0YUpTQ1A0bTNobEpmTVpHTFQ2aXlwaEJDeDhsMjZhekhKRG9I?=
 =?utf-8?B?RmJoNU13U2l5ME5PYUdKSDU1TTd0VHJselh2SEV4cG90RmVxK2g1T0w0aTRZ?=
 =?utf-8?B?Mi9iUFlsc0liV0o3OEh4THZrb1BaK0pwMWFSWXNubnNhMmhZQ0QyRUlJWkdK?=
 =?utf-8?B?NVA5d0Rpb213OSt2TndXVzBQNzNnS3dQMnVkYUpnc2V2UzNTTTh2YkRaRE1l?=
 =?utf-8?B?TnozaVYwdzhURkY2QlJWRmV3ZTRGd3YybG9DbVlaRnE5VVBld09MY1NvSjl5?=
 =?utf-8?B?VlFoT1ppajZqMTNjdmdDOFdWS1BxWXhKUFQ0aDJLbWlmanl6VU9WSDhuajAx?=
 =?utf-8?B?YkIwZGNZTTZ0cWtja1B0Ri94clhXVXozS0hqQmNiS3RKSmhzdG5JdmFSK3lE?=
 =?utf-8?B?cWYzK1hUdWV6NFdqMEhRLzNhUis2aTE1Lzl6Z25YZW9EZlppVUVBRmdEbWti?=
 =?utf-8?B?NXY3R1R1NHc1WVM2Tm5tRlcxTW16T0xUY1ZVWFZUZTg2ODFNcHU0aGNJOXhy?=
 =?utf-8?B?Vkxtc2l1aE1KbTZqODkzRWV5TjVEOFB0dzk5dG12dkkveEZqZGdQVFl4RWw1?=
 =?utf-8?B?Qk5EcElCRlhsQmd3b3hFUDhWdUIzdG1peGx6K0U3cEhvQnc1MXd4YURmWXZE?=
 =?utf-8?B?UTlmWlU5U0VXc0RVeDcvWklobDVkakc5c3BoSGhwWU0yUUZtcEtHcTRiUUdU?=
 =?utf-8?B?RFZ1QkhxUWQ2N21tMU8rUTE3cUlWdGVIR09CS1dwLzBlSWQwVXdpS0t5N3pR?=
 =?utf-8?B?UExGS2k0aVZ1N0x6cVJScU14SGlyZ2RVVWFmNG5aV2VLNEViUDJiYlBUVU5W?=
 =?utf-8?B?eitYNStTd2lqRFlrYmNjUHhrazFFRDZLVC9oUysxek5KKzhtUHFJWWVEei9T?=
 =?utf-8?B?VmJOOWxmN1QxNnptME84cFBmNTZRM1l6TEpCRWVhUkJJV3hEMWhhR1dtUkVU?=
 =?utf-8?B?VnJlZ0NYNFVvWHUrZElYaVhIaHhrcFpQcE5qR0QvRzY0a1ZEQzFDQ2VuMXZB?=
 =?utf-8?B?OXlUS3VTcGJqKytqcm5SU2kwQ1diem9aa1VqTFl5TG92a01mZnNGc0pWS1Uw?=
 =?utf-8?B?TXYzS2tPS2pnZlpySWo1N2VmQmRnR0UyUnAwZHU0QXRRMENjdk5hNWQ5NGtu?=
 =?utf-8?B?bytaKzZpZGZPcWhlanRZZDZ4VHN3RGtWSHJualVudkR0dlphVllkNDZVMTZy?=
 =?utf-8?B?aHlMTEx4UWpFeUdFVHFzaXBlZE9CSXViUHErOG92ZlliL1kzQTdTUkxWb2FY?=
 =?utf-8?B?UG81R29JbVRHOW9pWklOckJRUW1PempqeWRvcTF3T1BnWi9wamtTcG5hZzlz?=
 =?utf-8?B?Tmd6NlVoY2RzYWNzbloxS1RlYkdUd0VuelpDS2htcDFUdDZOekl3VWVKWjlW?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b41f8182-6908-4d2b-ea8f-08da901fe734
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 15:53:12.5455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nrbayg/n1Vi48v9XcoHM/2x5EsEeyR8omJWAZz890T1hxAoHbAofX6/QU97e0YxKYhXuekk358KKEiH0jOjQ1tK/zv1wcuJEvv4Int2u8uY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7271
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

--------------BgC6SfOQafozHhkdgzXV0L2Z
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/5/22 04:11, Paul Fertser wrote:
> Hi,
>
> An OCP Tioga Pass platform features up to 4 drive bays for SATA
> storage accessible from the front and fully hot-pluggable. The
> backplane is usually connected directly to Intel C620 PCH (aka
> Lewisburg).
>
> It would be nice to have information about the currently attached
> devices (model and serial number) available in BMC inventory but what
> are the ways to get this information?

Intel systems only get drive mdl/sn from NVMe devices that provide that 
information via MCTP over SMBus. SAS/SATA drives, to my current 
knowledge, don't supply this info in that mode.

The insertion/removal events are also managed from the BMC via I2C to a 
FPGA solution residing on the Hot Swap Backplane. The FPGA provides 
registers that allow the BMC to query the PRSTn/IFDETn pins.

>
> Is it possible there's some additional module in the all-mighty ME
> that can supply BMC with the current state of PCH SATA controller? Or
> is there some other sensible mechanism other than talking to UEFI on
> startup (which would mean BMC is showing stale and thus misleading
> data till the next reboot)?
>
> Even though the question is quite specific we'd appreciate any related
> insights on the topic; there must be some side-channels to RAID
> controllers and such for BMC to be obtaining essential information but
> so far I wasn't able to find any documentation about this.
RAID solutions are outside of scope for the Intel BMC.

-- 
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com

--------------BgC6SfOQafozHhkdgzXV0L2Z
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 9/5/22 04:11, Paul Fertser wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YxXZeFQhJWDSHSVf@home.paul.comp">
      <pre class="moz-quote-pre" wrap="">Hi,

An OCP Tioga Pass platform features up to 4 drive bays for SATA
storage accessible from the front and fully hot-pluggable. The
backplane is usually connected directly to Intel C620 PCH (aka
Lewisburg).

It would be nice to have information about the currently attached
devices (model and serial number) available in BMC inventory but what
are the ways to get this information?</pre>
    </blockquote>
    <p>Intel systems only get drive mdl/sn from NVMe devices that
      provide that information via MCTP over SMBus. SAS/SATA drives, to
      my current knowledge, don't supply this info in that mode.<br>
    </p>
    <p>The insertion/removal events are also managed from the BMC via
      I2C to a FPGA solution residing on the Hot Swap Backplane. The
      FPGA provides registers that allow the BMC to query the
      PRSTn/IFDETn pins.<br>
    </p>
    <blockquote type="cite" cite="mid:YxXZeFQhJWDSHSVf@home.paul.comp">
      <pre class="moz-quote-pre" wrap="">

Is it possible there's some additional module in the all-mighty ME
that can supply BMC with the current state of PCH SATA controller? Or
is there some other sensible mechanism other than talking to UEFI on
startup (which would mean BMC is showing stale and thus misleading
data till the next reboot)?

Even though the question is quite specific we'd appreciate any related
insights on the topic; there must be some side-channels to RAID
controllers and such for BMC to be obtaining essential information but
so far I wasn't able to find any documentation about this.
</pre>
    </blockquote>
    RAID solutions are outside of scope for the Intel BMC.<br>
    <pre class="moz-quote-pre" wrap="">
</pre>
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

--------------BgC6SfOQafozHhkdgzXV0L2Z--
