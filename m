Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBC574137B
	for <lists+openbmc@lfdr.de>; Wed, 28 Jun 2023 16:13:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fj78o0/O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qrk8g6t40z30fd
	for <lists+openbmc@lfdr.de>; Thu, 29 Jun 2023 00:13:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fj78o0/O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=johnathanx.mantey@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Thu, 29 Jun 2023 00:13:22 AEST
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qrk822Jkyz300d
	for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2023 00:13:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687961602; x=1719497602;
  h=message-id:date:subject:to:references:from:in-reply-to:
   mime-version;
  bh=fj4Apmbm9gV13RuC6nnZkiy+Cs0V4rLKLh+o+U8TxdI=;
  b=fj78o0/O+Ieu67xBKAcTpb6jt1E3B5Es5cUvDxPAYAnMCYhn8arTilRh
   NXj5rZxUyUdBhTHpoUgmH6P4w9Ss58aU0ewnqoqK867xgK4Qqs3jDMX7c
   O9usQM3zbOfpaACFNsIAM7cX2fNqqJfbrY7lVHVRbXwpk8uDyhDPk6NyR
   OLRVjD+ExAI6vOHptVO4HRnH4fzuVcI64Xu4Rx847nY6ItbNU9u67UuxI
   RyqeN6RmZKd91l2HMPpoGDYyt9HfQJvRcNbYz9HuikL54NrBCVgbNlP1r
   BF/Osg/2rJ0AOWWanw4w0Gefs1A2Q2g19dZEFg9jYa+QrFpmWo2x4+xW4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="360706072"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208,217";a="360706072"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 07:11:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="1047421923"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208,217";a="1047421923"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jun 2023 07:11:44 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 07:11:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 07:11:43 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 07:11:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1au01Ww+7BpYtEz7wdGPGQ90OeNM1P/c2T9TFj2JKKZrTrl3dvJ3+gXSLuyP4umY4c7O3OHDFyrFee5JGF7DcfeQlRkoXAehqQV/4Cms49P3rM1C9tjybsRsDNK4YJnFqmYrtS/yvdIQV32B0Hdw/MUp2D6ORFlTFUMMkKHXz05CqJ/D6B3IrcTFAR+RWfd9RhgK/ME2c3yybFfRVnOw5GohaoUHdFWwTSFDA5i74c3LXczLkzXzKWhA6tNKAmMwhlcW1a3qBXumtNWq/aw81jLvPyUfSHUdg7fbZqTouwfTAv8aqHIt9UXW9aJ7Ne7G8UC7UCk/SpcZCAzFR5K/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWmgWJAZt6SeDZADA8h79mg6Jd99Y/qDsuBLS7QWZC8=;
 b=brxooVGrWOeWQ3JBUrpeiRG2i1X0pdWMNSNLQBlm/5ddxzY0sOsikJvx85NJZjKfo3g9wZOI9Ch4q/9N12rM7Pno5a5XjCWOaHusyum5g2Ci5hMsMJyPYOwJjzOpwgGlqzEjNtUAe0Q1d94zcIl1/TFO/wY4PBPwCXl5CRffxMckMiLK/OsrVBUZOo5+f0gy/OftSBvTtbHG5G0WyOXK22UR33qbN68w52dEpeghTnMDn+c9h3vLMNcB/u6kmRUkuM+too5UyQhY7fkeNnehCVjT+5oXFriI3LImMF5bNyM1kHHyggPIFe3MUAdRAQY63tvirScAKwbaXtcOYPrjJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.24; Wed, 28 Jun 2023 14:11:40 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::19b7:466f:32ac:b764]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::19b7:466f:32ac:b764%3]) with mapi id 15.20.6521.026; Wed, 28 Jun 2023
 14:11:40 +0000
Content-Type: multipart/alternative;
	boundary="------------6qnU2TGWjWqzDWtp0Qvf5Ma0"
Message-ID: <57ae2df9-214c-ac48-f7ae-f069c83c9617@intel.com>
Date: Wed, 28 Jun 2023 07:11:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: IPMI Sensor Name limitation of 16 bytes
Content-Language: en-US
To: Rohit Pai <ropai@nvidia.com>, Ed Tanous <edtanous@google.com>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <LV2PR12MB60140D575EA40854D74472F4CD719@LV2PR12MB6014.namprd12.prod.outlook.com>
 <CAH2-KxAVgJUC89mdLO4RnrQgAV-rVROrUHSDz=j-SzyVhTMKFA@mail.gmail.com>
 <LV2PR12MB60148354AAD9D6E65F2B1419CD24A@LV2PR12MB6014.namprd12.prod.outlook.com>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
In-Reply-To: <LV2PR12MB60148354AAD9D6E65F2B1419CD24A@LV2PR12MB6014.namprd12.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0285.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::20) To BL1PR11MB5978.namprd11.prod.outlook.com
 (2603:10b6:208:385::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5978:EE_|DM8PR11MB5687:EE_
X-MS-Office365-Filtering-Correlation-Id: e0c1bf52-99d3-4055-dcc0-08db77e197d6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MaQ5Nr/NiCc6sZ8O78aPJQMaY99KK/PHSfTlmR8NnZpDDlMxHmy9GQJ6eQ0Aw0dOuE+beGM7vd70k0b3Fp1rCwQaWumoWvXj+TjAlHl+kzq+XRjmNbno0qG2joGV1pYP9YejFB4Ex6n13+pt4JymKudFa79/TTpYRXI5gZ2neZn6+Wn+6+x2tT+SNEgVtiPyfimk/ZorDKgfQbifYEy6nYJLgtI1H+FbqKj6qtofZ/0J4VCMnHjAKhOreQKXFT4Q5FSJ8DweYjcuV8YqVD26XEvnhcSJCgoxVY4iONooTJ8v0oktxnlmb6FqytG9kbxQNLkK8tSlLppVP7blAmeiHxFGAdfFC2LKyAJej3beJ5m+7E/sub46rupzmI4Hww9ZFtmDYqB6CL3W1NVfj4tPsAGVpWjUuoV2mzzFCkrVSv37GAnChRLjastyHek6IiTMsgAuuqdLUMsfIrnH3lrJya1E8NqnVk0i5o/bBbKfefyvuDR7dOmBYtva3HxBpvOxZ/iBwgg8pseP3vFo2NtFMbgjGgNprcoJjxNzZdAxzZyFF1owK0DFUrkWo8G7hLR2b3jcR4RYKURhavSN2x+fpGhLgi2G+orHiH+GZFkChwlDaS2kSBaKLURM32ho4HVUTF9rDiowD/bTfmvN4PDBXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(39860400002)(366004)(396003)(376002)(451199021)(6512007)(31686004)(19627235002)(26005)(66556008)(66476007)(5660300002)(86362001)(40140700001)(8936002)(41300700001)(316002)(8676002)(82960400001)(36756003)(66946007)(38100700002)(31696002)(110136005)(6506007)(53546011)(6486002)(186003)(2906002)(83380400001)(33964004)(6666004)(2616005)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1YxUWVsdmhmdEk4L2I5M1JwNjdJdzZmaHdWbXdDQjhVQnVFN0RWb3BxVkxi?=
 =?utf-8?B?bVV2aUxCYS82WTY0R0dDU3kxRE5JaHhlejE2VWdTRTgvQTR0Mzc3RkJ1UXlv?=
 =?utf-8?B?MXJVem5rRDFyc3FTOGpPTEdJQW5HbUpGTmhWaWV6RWpOeDJVQXJ4YXE2aElZ?=
 =?utf-8?B?ekl4ZDErTXBRN1pJQ2gvdVJ5TVQyem9BbzBBTVM4R1BIWjR4Nnp5UWE5dzZP?=
 =?utf-8?B?NXZVemx6S0ZWK0FsYUl2ZVhwWFkvYXpRaGhrKzdwRE1EOGdwamFDTEdOOEN5?=
 =?utf-8?B?YVJsZU53OWpnaGxEYjB5WHpLMDlZcDVDbVlEcFlLekJ2YS9uRTVYdmoyejN2?=
 =?utf-8?B?YzRkUlB5SkZ0Vm1LQUhla0R2VklPNDc3S0JodjZhQUxlZzYzL1NoWktBQmp0?=
 =?utf-8?B?Ty8wY1FRTHJRdUwxamgrMTVtMlpJL2VzOGh6dUpjbjRxQlRhWmRwMjlCaXpX?=
 =?utf-8?B?SGQyUVhmUFRkSGhxWFdFVDFqY1RyQTZyVnljbWZIenhHNGI3cHIrNkh4UW1z?=
 =?utf-8?B?ZkpISkVGMVlqMGpORXFtdHNtUjAvTlVUL1FZK05Sa1ZaU3p1dTZRSEgxbk9D?=
 =?utf-8?B?djNRV3NIb0hkVGZmMnRWNDRJTEJad1dkTDFmWEFuc0d6bGdvR3pxdzdNS3Jx?=
 =?utf-8?B?cG5iYjVtZXVtdE44MEVobUhmSlVMTGZRTVNESlkvOExKd240S3o5TmVTbUVn?=
 =?utf-8?B?dThMVUhlUFNTMnhLUDdMR29ZTEd1bkVLYWZIWnlNSDNpVTNsWG9VTTRCRzlw?=
 =?utf-8?B?MndKL0NwOGZlRXo3ZFNEWFhGRjM3eGJJQ0JFRVNsTExQTm42NlREcThjcVVZ?=
 =?utf-8?B?Ym9lYVpEYWhqRXBkUEJBNEJzb2JsN1VaVHlkdnRKN3RjWXo2UU81NnFVSkJs?=
 =?utf-8?B?SG84b1Y5alByZ1E5dDVObUpsQXNzemtCWm9idXJaTjljamRTbnZnNGhLcEN1?=
 =?utf-8?B?U2xZZyswUk5BWWpRam5wRVpnT3NGNU11dFliVXQ4WEdtTDZhbkI0Rk02bWh2?=
 =?utf-8?B?cXRmVzZoQThVdHBYSUE1WkxlVXY3bW95YjV4bmw1RW9JZUFVczNjbVoxL2xm?=
 =?utf-8?B?alJYcTFxb3ZNL2hjc2VHcmdlQ0tXYkJNcU1XZi9PM0ZzMUdNRmNEc254UVJJ?=
 =?utf-8?B?ZUtVTkgycHhJK3JUWUlqazdPb0F1YWlaZ3VYQnVVM1ZscHgvODJPZit6cDBq?=
 =?utf-8?B?dnEydVdQZkNMQVJGdmJsMHZMUWxZVjBkUHB1VmVVZ2d5bHcwM1g1N1pqeE9F?=
 =?utf-8?B?ZW9HWTFZK0habUZzMXBReTY2K2lHcHM0ZExJVkdRYTdUWkNUditxTzNDY0pP?=
 =?utf-8?B?OWRCMjBvS2RtNzhXcFNPd0RwbFZJSGw1VXhFRFpkcUFwUm03UFNOWTYwVmhr?=
 =?utf-8?B?NVJSUWYxVGxuRkRIT2VoR0d3NVA1N2MwY0RDNkpLMVhUMTgxRmFFTFZTNFVZ?=
 =?utf-8?B?aHlVVHQ1anh3dnNmc0dlOU83SVhCNG5WajR3U1o2WGZ0SFUvRmdoRlRJOFNG?=
 =?utf-8?B?VDFHdXZsRVBlWDF6NE1TcDlNUjgzeXN1QmRYL3YrZ2FTc1RSMTJkNk04UThm?=
 =?utf-8?B?UGxvRTRUY2lyaU1LRGJGY0pPRnNmS0w5TEZQUE5xS0NHL05iRytJWlVYTFUv?=
 =?utf-8?B?K3NBV2xHRXJmTGlGWXlnR0VHRkg0QW4rN2xHbmNJczRRaDVzU3MyU3hiZEFl?=
 =?utf-8?B?cHRmRUJ3cUU5VEE3eG8rVEhYT0R3U095enVoQlkzb3JWV0k0cW1FTlF4dGgr?=
 =?utf-8?B?bFBHSVJyN01PUDQ3QUl2QlFmcUFQN0cyeEFkVUhxTkVpZnpVeWdyWHZPVldu?=
 =?utf-8?B?bTg0c1VST2pKZmVwMHA5YWtwUXpiSE1BaHlvRWw1ZTE1RHdXekJ0TGZSY3Nl?=
 =?utf-8?B?MjFJN0dQTlF1b2JxMFlCVG5KQzdvdjUwaEFibnppL1R6MmlPVlV5bERJcE5G?=
 =?utf-8?B?elhCK1hFYVpubjRMMkVwa21RZk92VW9FYkhvNCtkcFJjbjJDdituejdhZk1h?=
 =?utf-8?B?Y2xIVkowWGZYdElXVGV6L3FXTDd0YWJSUExzN3BzTWdVaTZwN0lFdmdLMWU4?=
 =?utf-8?B?dk1UWTNEeHJNU1JyR0t4VGxFVlk3U1NWc01kREkxWm9SaTJXcVUxVlpnUWRV?=
 =?utf-8?B?a0FnTG8zcFpaMS9RM2hvYi9hcXU4QzlJWktVRVlOOFNyRktaLzQySjJwdTYr?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c1bf52-99d3-4055-dcc0-08db77e197d6
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 14:11:40.3369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PmBymRsoXeZhVjLGV+Jq/h6FbSBr/e+PzJf8Vafjk+LaYxkLsJeIwitig/hcHTRJ4gTfJX6ycC5GU6kJuohXiCZ8JZRADJi/rvwUeEYcUtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5687
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

--------------6qnU2TGWjWqzDWtp0Qvf5Ma0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 6/28/23 03:23, Rohit Pai wrote:
>
> Hello,
>
> Below I have the proposal for a simple algorithm which seem to work 
> for the sensors names we have in our platforms.
>
> Any feedback on making it more generic and reusable would be appreciated.
>
I am currently in the process of a different solution. Instead of using 
an algorithm, which is either going to come up with a very mangled 
solution (50 char example below), or an algorithm that may mistakenly 
generate duplicate sensor names, we're proposing adding a "ShortName" 
entry to the JSON configuration file read by Entity Manager. Doing so 
allows each company to decide for themselves how they want the name to 
appear.

For example:
"Name": "CPU_ADC_Controller",
"ShortName": "CPU_ADC_Ctrlr",

The long example below might be represented by a human like this:
"Name": "ProcessorModule_0_MemCntl_0_PageRetirementCountl_0",
"ShortName": "PM0_MC0_PgRC0"
This is 13 chars, and leaves room for regex replacement of the '0' 
characters to allow for PM1_MC0, PM0_MC2, etc...

This also does away with the current solution that erases specific 
strings, which increases the probability of a sensor name collision.
  constexpr std::array<const char*, 7> suffixes = {
      "_Output_Voltage", "_Input_Voltage", "_Output_Current", 
"_Input_Current",
      "_Output_Power",   "_Input_Power",   "_Temperature"};

> Step 1: Split the given name into sub words using predefined delimiter 
> set, remove all delimiters, and combine the sub words, remember the 
> position of the delimiters. Some examples of delimiter are _, space, 
> -, camelCase pattern, etc. Combine the words without delimiters and 
> exit if the new string is less than 16 chars.
>
> Step 2: Start from the first sub word and repeat for all the sub words.
>
>                2.1: if the sub word character length is less than 
> allowed_min_char_length then skip and leave it as it is.
>
>                2.2: else remove all the characters from the sub word 
> which appear after the offset allowed_min_char_length
>
>                2.3: Stop the abbreviation process if the total length 
> of the new string is less than 16 chars.
>
> Step 3: Start by setting threshold as ( allowed_min_char_length - 1 ) 
> and repeat by decreasing threshold by 1 in each iteration until it 
> reaches value 1.
>
>                3.1: if the sub word character length is less than 
> threshold then skip and leave it as it is.
>
>                3.2: else remove all the characters from the sub word 
> which appear after the offset threshold.
>
>                3.3: Stop the abbreviation process if the total length 
> of the new string is less than 16 chars.
>
> Step 4    Remove sub words starting from the first sub word until we 
> reach last sub word or if the total length of the new string is less 
> than 16 chars.
>
> Some unit test data with allowed_min_char_length set to value 5.
>
> Length
>
> 	
>
> Input Names
>
> 	
>
> New Length
>
> 	
>
> Short Names
>
> 14
>
> 	
>
> CPU_0_Energy_0
>
> 	
>
> 14
>
> 	
>
> CPU_0_Energy_0
>
> 20
>
> 	
>
> GPU_0_DRAM_0_Power_0
>
> 	
>
> 15
>
> 	
>
> GPU0DRAM0Power0
>
> 20
>
> 	
>
> CPU_0_EDPViolation_0
>
> 	
>
> 15
>
> 	
>
> CPU0EDPViolati0
>
> 26
>
> 	
>
> ProcessorModule_0_Energy_0
>
> 	
>
> 15
>
> 	
>
> ProcModu0Energ0
>
> 23
>
> 	
>
> Baseboard_HSC_0_Power_0
>
> 	
>
> 15
>
> 	
>
> BasebHSC0Power0
>
> 50
>
> 	
>
> ProcessorModule_0_MemCntl_0_PageRetirementCountl_0
>
> 	
>
> 15
>
> 	
>
> PM0MC0PaReCoun0
>
> Thanks
>
> Rohit
>
-- 
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com

--------------6qnU2TGWjWqzDWtp0Qvf5Ma0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 6/28/23 03:23, Rohit Pai wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:LV2PR12MB60148354AAD9D6E65F2B1419CD24A@LV2PR12MB6014.namprd12.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:"Google Sans Mono";
	panose-1:0 0 0 0 0 0 0 0 0 0;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoPlainText">Hello, <o:p></o:p></p>
        <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
        <p class="MsoPlainText">Below I have the proposal for a simple
          algorithm which seem to work for the sensors names we have in
          our platforms.
          <o:p></o:p></p>
        <p class="MsoPlainText">Any feedback on making it more generic
          and reusable would be appreciated.
        </p>
      </div>
    </blockquote>
    <p>I am currently in the process of a different solution. Instead of
      using an algorithm, which is either going to come up with a very
      mangled solution (50 char example below), or an algorithm that may
      mistakenly generate duplicate sensor names, we're proposing adding
      a &quot;ShortName&quot; entry to the JSON configuration file read by Entity
      Manager. Doing so allows each company to decide for themselves how
      they want the name to appear.<br>
    </p>
    <p>For example:<br>
      &quot;Name&quot;: &quot;CPU_ADC_Controller&quot;,<br>
      &quot;ShortName&quot;: &quot;CPU_ADC_Ctrlr&quot;,</p>
    <p>The long example below might be represented by a human like this:<br>
      &quot;Name&quot;: &quot;ProcessorModule_0_MemCntl_0_PageRetirementCountl_0&quot;,<br>
      &quot;ShortName&quot;: &quot;PM0_MC0_PgRC0&quot;<br>
      This is 13 chars, and leaves room for regex replacement of the '0'
      characters to allow for PM1_MC0, PM0_MC2, etc...<br>
      <br>
      This also does away with the current solution that erases specific
      strings, which increases the probability of a sensor name
      collision.<br>
      &nbsp;constexpr std::array&lt;const char*, 7&gt; suffixes = {<br>
      &nbsp;&nbsp;&nbsp;&nbsp; &quot;_Output_Voltage&quot;, &quot;_Input_Voltage&quot;, &quot;_Output_Current&quot;,
      &quot;_Input_Current&quot;,<br>
      &nbsp;&nbsp;&nbsp;&nbsp; &quot;_Output_Power&quot;,&nbsp;&nbsp; &quot;_Input_Power&quot;,&nbsp;&nbsp; &quot;_Temperature&quot;};<br>
    </p>
    <blockquote type="cite" cite="mid:LV2PR12MB60148354AAD9D6E65F2B1419CD24A@LV2PR12MB6014.namprd12.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoPlainText"><o:p></o:p></p>
        <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
        <p class="MsoPlainText">Step 1: Split the given name into sub
          words using predefined delimiter set, remove all delimiters,
          and combine the sub words, remember the position of the
          delimiters. Some examples of delimiter are _, space, -,
          camelCase pattern, etc. Combine the words without delimiters
          and exit if the new string is less than 16 chars.
          <o:p></o:p></p>
        <p class="MsoPlainText">Step 2: Start from the first sub word
          and repeat for all the sub words. &nbsp;<o:p></o:p></p>
        <p class="MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.1: if the sub word
          character length is less than allowed_min_char_length then
          skip and leave it as it is. &nbsp;<o:p></o:p></p>
        <p class="MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.2: else remove all the
          characters from the sub word which appear after the offset
          allowed_min_char_length<o:p></o:p></p>
        <p class="MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.3: Stop the
          abbreviation process if the total length of the new string is
          less than 16 chars.
          <o:p></o:p></p>
        <p class="MsoPlainText">Step 3: Start by setting threshold as (
          allowed_min_char_length - 1 ) and repeat by decreasing
          threshold by 1 in each iteration until it reaches value 1.
          <o:p></o:p></p>
        <p class="MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.1: if the sub word
          character length is less than threshold then skip and leave it
          as it is.&nbsp;
          <o:p></o:p></p>
        <p class="MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.2: else remove all the
          characters from the sub word which appear after the offset
          threshold.
          <o:p></o:p></p>
        <p class="MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.3: Stop the
          abbreviation process if the total length of the new string is
          less than 16 chars.<o:p></o:p></p>
        <p class="MsoPlainText">Step 4&nbsp;&nbsp;&nbsp; Remove sub words starting from
          the first sub word until we reach last sub word or if the
          total length of the new string is less than 16 chars.<o:p></o:p></p>
        <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
        <p class="MsoPlainText">Some unit test data with
          allowed_min_char_length set to value 5.
          <o:p></o:p></p>
        <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
        <table class="MsoNormalTable" style="border-collapse:collapse" width="0" cellspacing="0" cellpadding="0" border="0">
          <tbody>
            <tr style="height:15.75pt">
              <td style="border:solid #CCCCCC 1.0pt;padding:1.5pt 2.25pt
                1.5pt 2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ligatures:none">Length
                    <o:p></o:p></span></p>
              </td>
              <td style="border:solid #CCCCCC
                1.0pt;border-left:none;padding:1.5pt 2.25pt 1.5pt
                2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ligatures:none">Input
                    Names<o:p></o:p></span></p>
              </td>
              <td style="border:solid #CCCCCC
                1.0pt;border-left:none;padding:1.5pt 2.25pt 1.5pt
                2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ligatures:none">New
                    Length
                    <o:p></o:p></span></p>
              </td>
              <td style="border:solid #CCCCCC
                1.0pt;border-left:none;padding:1.5pt 2.25pt 1.5pt
                2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ligatures:none">Short
                    Names
                    <o:p></o:p></span></p>
              </td>
            </tr>
            <tr style="height:15.75pt">
              <td style="border:solid #CCCCCC
                1.0pt;border-top:none;padding:1.5pt 2.25pt 1.5pt
                2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal" style="text-align:right" align="right"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ligatures:none">14<o:p></o:p></span></p>
              </td>
              <td style="border-top:none;border-left:none;border-bottom:solid
                #CCCCCC 1.0pt;border-right:solid #CCCCCC
                1.0pt;padding:1.5pt 2.25pt 1.5pt 2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ligatures:none">CPU_0_Energy_0<o:p></o:p></span></p>
              </td>
              <td style="border-top:none;border-left:none;border-bottom:solid
                #CCCCCC 1.0pt;border-right:solid #CCCCCC
                1.0pt;background:white;padding:1.5pt 2.25pt 1.5pt
                2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal" style="text-align:right" align="right"><span style="font-size:9.0pt;font-family:&quot;Google Sans
                    Mono&quot;,serif;color:black;mso-ligatures:none">14</span><span style="font-size:9.0pt;font-family:&quot;Google Sans
                    Mono&quot;,serif;mso-ligatures:none"><o:p></o:p></span></p>
              </td>
              <td style="border-top:none;border-left:none;border-bottom:solid
                #CCCCCC 1.0pt;border-right:solid #CCCCCC
                1.0pt;padding:1.5pt 2.25pt 1.5pt 2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ligatures:none">CPU_0_Energy_0<o:p></o:p></span></p>
              </td>
            </tr>
            <tr style="height:15.75pt">
              <td style="border:solid #CCCCCC
                1.0pt;border-top:none;padding:1.5pt 2.25pt 1.5pt
                2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal" style="text-align:right" align="right"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ligatures:none">20<o:p></o:p></span></p>
              </td>
              <td style="border-top:none;border-left:none;border-bottom:solid
                #CCCCCC 1.0pt;border-right:solid #CCCCCC
                1.0pt;padding:1.5pt 2.25pt 1.5pt 2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ligatures:none">GPU_0_DRAM_0_Power_0<o:p></o:p></span></p>
              </td>
              <td style="border-top:none;border-left:none;border-bottom:solid
                #CCCCCC 1.0pt;border-right:solid #CCCCCC
                1.0pt;background:white;padding:1.5pt 2.25pt 1.5pt
                2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal" style="text-align:right" align="right"><span style="font-size:9.0pt;font-family:&quot;Google Sans
                    Mono&quot;,serif;color:black;mso-ligatures:none">15</span><span style="font-size:9.0pt;font-family:&quot;Google Sans
                    Mono&quot;,serif;mso-ligatures:none"><o:p></o:p></span></p>
              </td>
              <td style="border-top:none;border-left:none;border-bottom:solid
                #CCCCCC 1.0pt;border-right:solid #CCCCCC
                1.0pt;padding:1.5pt 2.25pt 1.5pt 2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ligatures:none">GPU0DRAM0Power0<o:p></o:p></span></p>
              </td>
            </tr>
            <tr style="height:15.75pt">
              <td style="border:solid #CCCCCC
                1.0pt;border-top:none;padding:1.5pt 2.25pt 1.5pt
                2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal" style="text-align:right" align="right"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ligatures:none">20<o:p></o:p></span></p>
              </td>
              <td style="border-top:none;border-left:none;border-bottom:solid
                #CCCCCC 1.0pt;border-right:solid #CCCCCC
                1.0pt;padding:1.5pt 2.25pt 1.5pt 2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ligatures:none">CPU_0_EDPViolation_0<o:p></o:p></span></p>
              </td>
              <td style="border-top:none;border-left:none;border-bottom:solid
                #CCCCCC 1.0pt;border-right:solid #CCCCCC
                1.0pt;background:white;padding:1.5pt 2.25pt 1.5pt
                2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal" style="text-align:right" align="right"><span style="font-size:9.0pt;font-family:&quot;Google Sans
                    Mono&quot;,serif;color:black;mso-ligatures:none">15</span><span style="font-size:9.0pt;font-family:&quot;Google Sans
                    Mono&quot;,serif;mso-ligatures:none"><o:p></o:p></span></p>
              </td>
              <td style="border-top:none;border-left:none;border-bottom:solid
                #CCCCCC 1.0pt;border-right:solid #CCCCCC
                1.0pt;padding:1.5pt 2.25pt 1.5pt 2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ligatures:none">CPU0EDPViolati0<o:p></o:p></span></p>
              </td>
            </tr>
            <tr style="height:15.75pt">
              <td style="border:solid #CCCCCC
                1.0pt;border-top:none;padding:1.5pt 2.25pt 1.5pt
                2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal" style="text-align:right" align="right"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ligatures:none">26<o:p></o:p></span></p>
              </td>
              <td style="border-top:none;border-left:none;border-bottom:solid
                #CCCCCC 1.0pt;border-right:solid #CCCCCC
                1.0pt;padding:1.5pt 2.25pt 1.5pt 2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ligatures:none">ProcessorModule_0_Energy_0<o:p></o:p></span></p>
              </td>
              <td style="border-top:none;border-left:none;border-bottom:solid
                #CCCCCC 1.0pt;border-right:solid #CCCCCC
                1.0pt;background:white;padding:1.5pt 2.25pt 1.5pt
                2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal" style="text-align:right" align="right"><span style="font-size:9.0pt;font-family:&quot;Google Sans
                    Mono&quot;,serif;color:black;mso-ligatures:none">15</span><span style="font-size:9.0pt;font-family:&quot;Google Sans
                    Mono&quot;,serif;mso-ligatures:none"><o:p></o:p></span></p>
              </td>
              <td style="border-top:none;border-left:none;border-bottom:solid
                #CCCCCC 1.0pt;border-right:solid #CCCCCC
                1.0pt;padding:1.5pt 2.25pt 1.5pt 2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ligatures:none">ProcModu0Energ0<o:p></o:p></span></p>
              </td>
            </tr>
            <tr style="height:15.75pt">
              <td style="border:solid #CCCCCC
                1.0pt;border-top:none;padding:1.5pt 2.25pt 1.5pt
                2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal" style="text-align:right" align="right"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ligatures:none">23<o:p></o:p></span></p>
              </td>
              <td style="border-top:none;border-left:none;border-bottom:solid
                #CCCCCC 1.0pt;border-right:solid #CCCCCC
                1.0pt;padding:1.5pt 2.25pt 1.5pt 2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ligatures:none">Baseboard_HSC_0_Power_0<o:p></o:p></span></p>
              </td>
              <td style="border-top:none;border-left:none;border-bottom:solid
                #CCCCCC 1.0pt;border-right:solid #CCCCCC
                1.0pt;background:white;padding:1.5pt 2.25pt 1.5pt
                2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal" style="text-align:right" align="right"><span style="font-size:9.0pt;font-family:&quot;Google Sans
                    Mono&quot;,serif;color:black;mso-ligatures:none">15</span><span style="font-size:9.0pt;font-family:&quot;Google Sans
                    Mono&quot;,serif;mso-ligatures:none"><o:p></o:p></span></p>
              </td>
              <td style="border-top:none;border-left:none;border-bottom:solid
                #CCCCCC 1.0pt;border-right:solid #CCCCCC
                1.0pt;padding:1.5pt 2.25pt 1.5pt 2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ligatures:none">BasebHSC0Power0<o:p></o:p></span></p>
              </td>
            </tr>
            <tr style="height:15.75pt">
              <td style="border:solid #CCCCCC
                1.0pt;border-top:none;padding:1.5pt 2.25pt 1.5pt
                2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal" style="text-align:right" align="right"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ligatures:none">50<o:p></o:p></span></p>
              </td>
              <td style="border-top:none;border-left:none;border-bottom:solid
                #CCCCCC 1.0pt;border-right:solid #CCCCCC
                1.0pt;padding:1.5pt 2.25pt 1.5pt 2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ligatures:none">ProcessorModule_0_MemCntl_0_PageRetirementCountl_0<o:p></o:p></span></p>
              </td>
              <td style="border-top:none;border-left:none;border-bottom:solid
                #CCCCCC 1.0pt;border-right:solid #CCCCCC
                1.0pt;background:white;padding:1.5pt 2.25pt 1.5pt
                2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal" style="text-align:right" align="right"><span style="font-size:9.0pt;font-family:&quot;Google Sans
                    Mono&quot;,serif;color:black;mso-ligatures:none">15</span><span style="font-size:9.0pt;font-family:&quot;Google Sans
                    Mono&quot;,serif;mso-ligatures:none"><o:p></o:p></span></p>
              </td>
              <td style="border-top:none;border-left:none;border-bottom:solid
                #CCCCCC 1.0pt;border-right:solid #CCCCCC
                1.0pt;padding:1.5pt 2.25pt 1.5pt 2.25pt;height:15.75pt" valign="bottom">
                <p class="MsoNormal"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ligatures:none">PM0MC0PaReCoun0<o:p></o:p></span></p>
              </td>
            </tr>
          </tbody>
        </table>
        <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
        <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
        <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
        <p class="MsoPlainText">Thanks <o:p></o:p></p>
        <p class="MsoPlainText">Rohit <o:p></o:p></p>
        <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
        <o:p></o:p>
      </div>
    </blockquote>
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

--------------6qnU2TGWjWqzDWtp0Qvf5Ma0--
