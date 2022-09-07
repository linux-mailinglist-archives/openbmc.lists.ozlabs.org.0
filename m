Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E915B0718
	for <lists+openbmc@lfdr.de>; Wed,  7 Sep 2022 16:37:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MN4bw0qdQz3bls
	for <lists+openbmc@lfdr.de>; Thu,  8 Sep 2022 00:37:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jmlQWwju;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Two or more type TXT spf records found.) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jmlQWwju;
	dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir; Thu, 08 Sep 2022 00:37:23 AEST
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MN4bR0fWTz3bNj
	for <openbmc@lists.ozlabs.org>; Thu,  8 Sep 2022 00:37:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662561443; x=1694097443;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:mime-version;
  bh=oVp81XLEY9IzaMVA2Cuq8sW9I8ZbWQA0sgGoHjmOG8s=;
  b=jmlQWwjusJTOK6klV+KQh+QuQuraJVooM+L7BrhvcrUrU7Iqdgssthms
   fQWnhN3UCMbfKLjaYZ+SKacte2LQptDqeCXq4JoWI5PopVWZbs8kVIQGT
   2ZVXOk2hfiuBinOJVTnZc9aCWXMwe3Q43E/zqC3PHWBrTHV5AbmaNmc6o
   kZXig14PAOqLzGO2oTrDTaXGQ2PHvB46gnlYKLzRzinwju+EMhgrvgifa
   o08VolX1wMZak6YYebsb+fK8Rsg4o8F9MCLhl/9plFBQkFVIXppJOEtUF
   rQAVQGyqH+5ZVSaE9KaI7Wucmkelk1AcIu8LviXBGbsx+ZQzKybK3PYG+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="277282202"
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; 
   d="scan'208,217";a="277282202"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 07:36:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; 
   d="scan'208,217";a="644640826"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga008.jf.intel.com with ESMTP; 07 Sep 2022 07:36:15 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Sep 2022 07:36:15 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Sep 2022 07:36:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 7 Sep 2022 07:36:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 7 Sep 2022 07:36:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHv5JjOv0ORiC3pTffYJaIS2rU+o6INe3qBBymxapMnc4YS+NFq5R5SZ4h0XSE+F6i7qfy+1s8KWLgsOM30yzDuB4IW8Xd61MDK8hCxxmSqb7PVCnwASGCjRgR391H2Ygt4p5WAQAUkY7dmqT63esj8fKlrdXJ7oj4NOlwOmi6dJ/9p43X6t8vsq9u3Aq8rzYPHZ0zFf9znly9V3wazbQmvK70O7UygQkiMjP28yPnjZAo0/jr5i/wFss5I87aBb0xkx/lWUc6jmHDus2idMxoTlrZwxXStqSsqWN5Gq3bsuJsXFWGYVn/fxP+H5IzDeFYOcP9lCZMa8hTYHEu8v9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i93xHwcB7O7kQZXlukk9Bz1VjV3UIfIiPKj1k+1BRyY=;
 b=Wi8MLt8eSB7qcEX9/IMHLZKBA4dJV/2zyx1G3CvBvNLkuEZZ7qgrWih6j+oQ3R5ZIG5iZ0Y776oY2SxYRot/1GAWlYl1OlFv7ljeD1hlMn+cNhQGDjXYO1j5pnN37KcLFcA46TLa8VBbK0b0DLv7bEl9G9jcD9heA9Sa6iyQdmTqByKvtYLN53brYI1zcjbx6sQlHa4tHn7O+MqrQFQ+xjSHE1TtV816iA2fAu/hK7IxDyxgSHSmHSyK6sjCfRphruHYXqqTmbJTCk1DCxrs0ltaczC8wdkosAZLl7uuNgPrPGQkOOzgvbn5Zy9kk8uRP/64Oqcy879baO9xVQAjoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 7 Sep
 2022 14:36:12 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fce1:b229:d351:a708]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fce1:b229:d351:a708%9]) with mapi id 15.20.5588.015; Wed, 7 Sep 2022
 14:36:11 +0000
Content-Type: multipart/alternative;
	boundary="------------ZSZnG2qEIKu9VkmPdvI07Ci7"
Message-ID: <2f56b77e-a7a2-3577-c868-90fa6226f483@intel.com>
Date: Wed, 7 Sep 2022 07:36:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: SATA hotplug notifications for BMC inventory updates
Content-Language: en-US
To: Paul Fertser <fercerpav@gmail.com>
References: <YxXZeFQhJWDSHSVf@home.paul.comp>
 <2cdb6ea6-fc85-9835-d410-01195148a3eb@intel.com>
 <Yxin03RwpUvVPsAy@home.paul.comp>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
In-Reply-To: <Yxin03RwpUvVPsAy@home.paul.comp>
X-ClientProxiedBy: BY3PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:217::33) To BL1PR11MB5978.namprd11.prod.outlook.com
 (2603:10b6:208:385::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f5af35a-2e21-436e-2ec1-08da90de4f57
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5085:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RrjvVsCOpCFOZajGBVwcuvwjjIpkb7QtMPdl5UMvvomMNuDzE/jddh2jDfDfDugDTujjj6eoPWxNt/XfpczSSi9fuGkkoOWyYuPPPbCOnKfEjER6ZXmWDsqQfFW63lyRoTzkH+UReR1SK17gx/Y/ODwQOQIjH9VfrDR1H47sSB57l/9lLBMdPPcS/ltNHhgNVTIirNWKW+2c5ajUFr25IkJ7O+NIlPlU+jYWwtCEMlm0TSWA6HGWp/cFdk3tmxr5qRey/dR3rboVmXBT6T9zR55gFYLbLHsPxTv35Czu03l3iCam85fGqc6fjaBBV3cFlw6MbYIuBJ8y1CKlHaWQEXyo9rAdA2TXDrIz3bFaPr2zI1+uRsTDOEv6XciCLrA1AK73eappbCypTRJY1KLJO3N5Mk1CB8nU6baqAF03Ho8fSv3FAkNJtqtnj6SUi2bmfIdil84blgDK5iVJP4fjBT1iZY1cUhny9Ep6IT0vC+XcBa+WeapuffuIEeo374mQv0sJTkKKDHeX5jnqRiG8IT2+2CzGtfCktUl9Xe3NpKqBV5dsdki2oZY+rVX49+tha4oGYm8vfQojprth9IPa8ClVDvDlnLCgopj4j9HDqupLpZW+QIV3OiVPHHWLa6IOBPBiF0LmTKV7OmcYF2PENTMGIVU5m1I6CZXsIF7frtnV29dsONf0bfEDvmtBmGFgCL/DA0Ai0ugPoBoL9X/x7yLn77pM3iHSCm87V1JBZTmgBUofC/e4WAplxDDreI+5zaxiC/vPUL6u/zLfodFdVkXEVeaHROcP6QP1DZuKCa8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(346002)(366004)(39860400002)(136003)(6506007)(478600001)(26005)(6486002)(41300700001)(33964004)(6512007)(186003)(6666004)(53546011)(5660300002)(8936002)(2616005)(2906002)(6916009)(38100700002)(4326008)(66476007)(8676002)(66946007)(66556008)(31696002)(86362001)(31686004)(316002)(82960400001)(40140700001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWZwenpoUmUyMWFVVnRFQTNGODRBRit5ZnBaM3ZGelR1K29DRkdyZ0JSQVIr?=
 =?utf-8?B?TXJFWURodll6eEwyMEtuQkJpYzFKdzkvdzE5WG1KZGRldGlxdDNIdkJRRlQv?=
 =?utf-8?B?OUpPN3ZBMm9KcVNWeVQydDZ6bVl3RVpMSGJkczJmMlh5OUppaWZPR2hDZ0tl?=
 =?utf-8?B?TENWajIvTm1hR0tXMWI2ZXFUY0VoUDZuYjRlRWJrdi9FTTdnYmpHUXlsNzAv?=
 =?utf-8?B?MjFBNFZDWjZTYkhISXVlYlU2MnoxRlEvVGYyQkJMTGF2TDlVWGVlS2oyYkd3?=
 =?utf-8?B?NXZuY3pOaExMaitIcEd1dThrbXN2TFB1czFkemtyTlA5ZUI5WGtBOWpYN1cv?=
 =?utf-8?B?UFQ5S0ttVXA4STRBZ09mM2xMY1F6QTBvVjNuNkt5bk40ZlUyd1RSR1p0ZGhp?=
 =?utf-8?B?bmhaek5ic0lmVGNxNXpCRFJhZktxRmY5QXFyT1Iya1dxQzRIdlhlNFVjWDB6?=
 =?utf-8?B?OEpEUGViSXRaQ0o2Q0Zwa2FQVU0yUTRKYXpTcGxxK3BJbFZvYVljUTlzVHdD?=
 =?utf-8?B?eGgwZEFOT3h5RmdXNVFpNzF5aDJPdXZvcXZyNkZ6UUl1V2wwbW51T1E4TUgr?=
 =?utf-8?B?SG5vOVhJa20zUjVvQWczWVRBaDZFVkw4WnhlWkNvYjVuOW43ZWFPU3cyRWJl?=
 =?utf-8?B?aUhwNXNhWmROUmRycGhjdGF4dm9aZlBRK3N4WDdZWWZPTWhlSVViQVlSeGdx?=
 =?utf-8?B?Rk1vclExMEtjT2dGQ2NySVFkVS9GU2tjVnIyNlRISGFBZHR0TE9ZYVVuNHEy?=
 =?utf-8?B?UUVGeFFWaWIzdHI4NVZYZ0IwTUh2d1ZReEFVV25ET3BpYzVZVU82dFAxVGFX?=
 =?utf-8?B?WTVETEM1VlhFWXM3Y2NCYmJ5Wnk4Tkt6RHgzNEZQWkxXMXJWVGx2eDJSZXly?=
 =?utf-8?B?U3owUm15YWo3L3BZUFVQeUxNV2lBMDJydXFpQ2JSS2NhclNmZFBnNVIxYVp2?=
 =?utf-8?B?WC9lY1NWMW51RUIvRXhCQ2s0bWxUSEMwc1Q4R29zajh0R2pHVjA0S3M4RTVo?=
 =?utf-8?B?MkJRaENaK29nQ25aMHFpQ2h5Y3JJZkowSUlyN09uaGxrVVNhcEVyRkt0dkNK?=
 =?utf-8?B?ZSt6ODE2bVhjWEpTMzljZWU5cEg0NVZNZWMvbDFmc2F2M1BPYzNabDdWMGYy?=
 =?utf-8?B?VXVmWE1iWUFMcHZNUVhaV2lWazZOcmRtcVdiTFhqRkdiY0UwUHdHT2hoRVd6?=
 =?utf-8?B?NU5mUVhKZHhaNEgrSnUvZGtxMlRRZTlJckNuMDB1QTlTbmc4WXNhS3lVRnU0?=
 =?utf-8?B?ZjA4VjZ6Y0xFd25yemxzRGFsdFFiSkxBK0ZORXZpVFNuSWFicFZBTU5YSEFy?=
 =?utf-8?B?UDlQa2FqNnlVMW1oN0IvTkRQbERKWHFmdXlWV3VqK2tHNmVuYTNuZ2Fac1JQ?=
 =?utf-8?B?SHJEWG5rZFdmQnlHbWswVVJ1VGV1bWdzZEhzOS9PUFVsdzYyVHV6Qk80eGRy?=
 =?utf-8?B?Zkh2d01GU2ljQmozTGRsVnFyMEtRdVpPalNqOFJQMzZRMHBtWGR2QUZlSkwz?=
 =?utf-8?B?ODNyTEkvekFpV0srRTRRQWRjelZiNU5DWFZQQlc4WlE5Z0R5bFNhaVVBTGVt?=
 =?utf-8?B?RExBOEtMaEFwMzdFUFUrNDVMT2sxOWIyTDRFV3FiQUlSZXZzcndVODljcTht?=
 =?utf-8?B?alFmU3haYW04VlZkb3lzb0lvbjliUVhYRnJ2TTFFblczMzNQR1BocnNVclF0?=
 =?utf-8?B?aENJSmJsUmd2aHRLWDY0MFd2bFhyVi9wUUVSNDdBYnRRZjUvYUtHU0lKWnlT?=
 =?utf-8?B?cE43OXZSWmFlVEViTEV3TlNqcDNyemJxYnpGUHFtTlBIUjFxUk1PMkptRmxZ?=
 =?utf-8?B?elNoRVZVYkMwSS9BZ09uaGh3aVFNMmxObjdXcmVkMkZ6OEhZcXpNM3l4dmtk?=
 =?utf-8?B?WDF5ZU9pejRrTjRSUytvSmFBM2NlcHk1dXRScTZkemFoaGZ1aERybTZWdDZm?=
 =?utf-8?B?RmZsODZWS1BBQlpwSWVRbUpJSlY3cnp1SGF2dm1SS0VvVnFmbXYraDBDMHgr?=
 =?utf-8?B?eFh2QnRMT3FlMjhoeU1FdTh5SkI3N3NWM01YNU01OEdWdjBIR25NZmtSdVNE?=
 =?utf-8?B?Vmh0S21iK0Z4QzhZUXN6eGwxeExrMVRhZ05ybm1VbWhvYXpvMHk5dWF0dmxv?=
 =?utf-8?B?UWd3T2h1cFRZY2cyQ1Q2NU1qak5Ibms3YlMwMHB4czloR0pGNmxPQzhSckhV?=
 =?utf-8?B?Y0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f5af35a-2e21-436e-2ec1-08da90de4f57
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 14:36:11.6474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZzIsWE4p1rxCGfZru2GYwJ3YH2lFuW3S8E2UxGsIFAZF8EfBSCGJDMP6r7hqz4BS+LWFfxP19877E9O+bCgMzfcm86PajMFyxepf2vCUbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--------------ZSZnG2qEIKu9VkmPdvI07Ci7
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 9/7/22 07:16, Paul Fertser wrote:
> Hello Johnathan,
>
> Thank you for answering, please see inline.
>
<snip>
> RAID solutions are outside of scope for the Intel BMC.
> Intel VROC too? Why? We'd be willing to contribute some development
> effort into bringing RAID monitoring and management to OpenBMC,
> wouldn't the community benefit from that? Many other vendors currently
> offer this feature, why shouldn't OpenBMC? The problem seems to be
> with the documentation availability; can you please tell where the
> relevant hardware and protocols are described?
>
Paul, this question now crosses a demarcation line. As a contract worker 
I'm not comfortable discussing the topics you raise in that paragraph.
-- 
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com

--------------ZSZnG2qEIKu9VkmPdvI07Ci7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/7/22 07:16, Paul Fertser wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Yxin03RwpUvVPsAy@home.paul.comp">
      <pre class="moz-quote-pre" wrap="">Hello Johnathan,

Thank you for answering, please see inline.

</pre>
    </blockquote>
    &lt;snip&gt;<br>
    <blockquote type="cite" cite="mid:Yxin03RwpUvVPsAy@home.paul.comp">
      <pre class="moz-quote-pre" wrap="">RAID solutions are outside of scope for the Intel BMC.
</pre>
      <pre class="moz-quote-pre" wrap="">
Intel VROC too? Why? We'd be willing to contribute some development
effort into bringing RAID monitoring and management to OpenBMC,
wouldn't the community benefit from that? Many other vendors currently
offer this feature, why shouldn't OpenBMC? The problem seems to be
with the documentation availability; can you please tell where the
relevant hardware and protocols are described?

</pre>
    </blockquote>
    Paul, this question now crosses a demarcation line. As a contract
    worker I'm not comfortable discussing the topics you raise in that
    paragraph.<br>
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

--------------ZSZnG2qEIKu9VkmPdvI07Ci7--
