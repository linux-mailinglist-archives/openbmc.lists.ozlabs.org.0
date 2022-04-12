Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A704FE9DF
	for <lists+openbmc@lfdr.de>; Tue, 12 Apr 2022 23:14:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdJPq2XDtz3bYZ
	for <lists+openbmc@lfdr.de>; Wed, 13 Apr 2022 07:14:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JPxg8wBM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JPxg8wBM; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdJPC0881z2yHL;
 Wed, 13 Apr 2022 07:13:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649798031; x=1681334031;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=X/cRMn1yUyCDO+ggS8EbXLT8u15dGYu0SlcSAPYTWQo=;
 b=JPxg8wBMR17Yw2EeqSZgkJaDFhM2KbiP4yUrNxXk3SFMPS8tb9RcVbBz
 iTo2zzb1FBAj5aD/MOoYcAfp72RwaAUhn7iC6ed1MsszZYyzPbPaWeWbc
 SZi32P8QqKQiBFBRSCHmcoW6Lv3UaDlvmzPMIPaluoisA+3aOyLzXO5es
 /5gehJa7vlQQF9yF0tSRc76eAbCHDTQE28ZNE0S84DxtRfhniKa1jpKaa
 oGzUt1xIjklTk4iBiUoZ4X0MW2EKlqyTnD2LlDqNzn6DBGrON4pRuR9db
 ovQ6Ch/CMkig3TdpY2C3Qc54OBZLHo/nAKUcfA7HFDmuvnMtpNyz4rUk7 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="261948531"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; d="scan'208";a="261948531"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 14:12:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; d="scan'208";a="507719745"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga003.jf.intel.com with ESMTP; 12 Apr 2022 14:12:41 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Apr 2022 14:12:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Apr 2022 14:12:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 12 Apr 2022 14:12:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 12 Apr 2022 14:12:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWKPOeoqJqMiI3UKPe/4FsBp7/1ln9Hkl2vlVSSrJQ6ZKxqwhq2bdYabB+azVLFt13Px73/ea1DbvTwRuuwBfFVImMpEFaIbgwyYmyHszzMGjiID4WZ9qDscsY2tXo3XYiK7yQ5RE0Sp3cHpO796HXP6IAQ6ev+nN14eNyYV/F3MInmRZ2hwR7nmCCDq6obQzFQH3MnmxApYmwzoSeRsag7naondDHdMTnxe3Nbkbwi4QxVVnTv0nlg+rkr876oVc+/FBbyYPe4iB+LBd1l/Os6lWXgAR2qcmPKJGSMF/e5JTtZXvv4c1b5Zuv4h5ParL44T8olib41XQk/1qMkElA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/cRMn1yUyCDO+ggS8EbXLT8u15dGYu0SlcSAPYTWQo=;
 b=Qj13TiaCWMM7hspg9dp4dr7HjDsgWR7qE1IoR9OBVjfzErFYTCPYWuVkFfj8Wt98P5bgQTCElKbD0eJ6Cj7y0m3foZRws53/CYg1tz7Cb8rz0RXIZ2EpJ8rGLX4xR2qAghZ7iKV4rdCMB+y9YCqgi7WLC7b2P+MIGPkkHY5Qi2KGNP8NJSQwCOybG54Mf9MjaxKWKIf/bFWLc+3GZBgiwCy+13XQmNkHrrjdrHl4ZkIfOg8D7UdCwu7YDyvTUQQvcXNrM5OdoCleMtIo9aezqNNLWGMxUei+aPQFH+jtgootKakrlvpUtWJJkifE1dOqrAHCgHbuMgxHgEcDWYLbOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by MN2PR11MB3917.namprd11.prod.outlook.com (2603:10b6:208:135::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Tue, 12 Apr
 2022 21:12:36 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::d87b:eb8b:b755:c336]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::d87b:eb8b:b755:c336%9]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 21:12:36 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "andrew@aj.id.au" <andrew@aj.id.au>, "cgel.zte@gmail.com"
 <cgel.zte@gmail.com>, "joel@jms.id.au" <joel@jms.id.au>
Subject: Re: [PATCH] peci: fix error check return value of platform_get_irq()
Thread-Topic: [PATCH] peci: fix error check return value of platform_get_irq()
Thread-Index: AQHYTkv6Gt0PlPxOG0KKXS5Je2+nnazsx3eA
Date: Tue, 12 Apr 2022 21:12:36 +0000
Message-ID: <d09484f7cda13de3f156bd1bcba8c2671495dcd1.camel@intel.com>
References: <20220412090148.2533219-1-lv.ruyi@zte.com.cn>
In-Reply-To: <20220412090148.2533219-1-lv.ruyi@zte.com.cn>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-3.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ee4b7b2-d774-4709-f1de-08da1cc92b3c
x-ms-traffictypediagnostic: MN2PR11MB3917:EE_
x-microsoft-antispam-prvs: <MN2PR11MB39170F00D6352FA96B453D63ECED9@MN2PR11MB3917.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VhPVT2pCDZ0XCtTCUMg7R70Oy8JTOtdxSEgRwZWgUlqzPzXKvE+/aWj4e5H1QWYCQCO3SOWpl+IE2YkWF8MfESqVTIPxLuVOUSZY0Bs5qN8sfSy5AxSA98uztCq5wTDAlOcU3VezYmdGpTUvlFDiTkl3C0fZIZhiMuyPCkEjZjAPmFSJZzYP0M6O+5Mg2oYeOC1xE/M0ZfWPTVNF6Oky1hbY6myktWsn4eS00qE7iI1J2aI/du91N5vPrL269HZP5tacRR0eqzQs8vC1/bsu+DWVfJ83Wm/KXVJg+Z7uo3p94DQ0JVATA2EUM8qmRV7TFpdkdWV/zVCjpiymLCjj/fNy3X61EtPd/pSG4cdA4PhB6EFjIB4oyBg8mXsR3sf2nhGHJZOw1Soo2iAbfqwNXgfSS8paIq7SLhxWPWxvL9xP+GVr9b1aM4UpAJG6oDT9ZiYA+0T00jYv/6Jeoe0atLhklo/MIKoUxkpCjygR4T988/XxyxzCaG34JnYbZp4gTmtdnEKobmbh8K3GStctBKuX7dYaQLZCa716QC7X4FXItswG+qEDam+7SaF51hWIgaNTFd7shGIJCr9+puFgpX0m2Qnxf6Ysg0jSkIKITN8p70iAJSvkv03kJ8itX2fxE+Nvzqa27UzebN4Qs4SZRicLf7k2um9EmfHdeDA9cCFGuCI9uYWXUSOAF6UsQrU9+DMuU1Hz0nAn9m66E2wbkg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5823.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(86362001)(71200400001)(26005)(6512007)(186003)(2616005)(6506007)(7416002)(8936002)(4326008)(8676002)(38070700005)(82960400001)(5660300002)(2906002)(64756008)(66446008)(122000001)(36756003)(66476007)(38100700002)(54906003)(110136005)(6486002)(508600001)(66556008)(91956017)(66946007)(76116006)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVVDeStoQTUvejR0Y3V0OE1sQmFlZEFVOTNTNzhrVXN0VHpOM3BmN1p3L1k5?=
 =?utf-8?B?WWowdGNtU0dobXp4ZUdzUEV3RlZXYmRBa3dZVFV0MDZsMEZzaUJ6d2EzZ0J3?=
 =?utf-8?B?MWp3MnI4NmVEQ0VhM0hCblRHb0xUM3M1NnN2ckxacmUxa3UrYkFQM1hEem9E?=
 =?utf-8?B?VTFkMithS1djTHlKR1kzdXJrS21KWVF5cFYzbHZJU2g1N2NsNjJVYWNlbk10?=
 =?utf-8?B?VjhybitRSXVrR1MzM25KVkY5SVhWNnRqeEdYdDFQZDhocVBaZE95L1JMSmFk?=
 =?utf-8?B?UldRWUt3Ri9UbERReDBUT2ZmWDkvM0ZCWUFRVnc3VE00cDhSNFdEa0daM1Vm?=
 =?utf-8?B?VXgwMy9SZllGdnRzb1hMN2hYQlpzMWZqU3N2MEFZYWF3c0pOYjFVcnd4eDJ0?=
 =?utf-8?B?a3o4bVdRVEdnb1pGZjlBZklUQldCQUZiMWZJTmNOWjZlRG1Nek10aDh4ajJ3?=
 =?utf-8?B?R1kvZmNoOWNNQUo4NHNHby9sV2hYV0JUN2V5cjYrbXlJcS96cXgwbElpc0Ju?=
 =?utf-8?B?KzdnRnV5MnZtNTdHbTBNRVNySW5QZXhXT1JPOUd3czBkQTBYa0JKOTFsWjI2?=
 =?utf-8?B?OTcxU1hRUGVMUHlWb1JacnM2cldTUmthdkpVelBLQkdtODdCd3NVNS9wVmtw?=
 =?utf-8?B?M2xxaXg3bFpyRXgzd1M5RFdsQ2ZHM1phZnBzM2ljV0JQaHM0NDVRcngyZmJ0?=
 =?utf-8?B?bzdWcmxFb0JYSzJoVkszaEdIV1daOGc5Qlh0UmRKaFJ1bnc5NGZrTVZYblBo?=
 =?utf-8?B?OWlYKzg3TnBNc1FPaUJJVGpVUTlDK3dpc0VtSUdkTVlKR1YzREZ2Sk5DR0Fv?=
 =?utf-8?B?cUdLcFJlK2o0ekNZVDJkNkdRSnFEOVQzVHVrTkZPQTVIdHlMeXFsaHcvZ3Fh?=
 =?utf-8?B?TnhGOGRGZ3l0SWhHS0FHZFRPTVNwTGFrc3dDeXlBYlFoSTV4YThNWEZSOWVw?=
 =?utf-8?B?OTN1QXVpVUtmdXR0UE5XYU1BampFcHd5czEzUldERzZBNGVyUnZWKzBHLzlP?=
 =?utf-8?B?TkRPa3pQeWdzRGp2aHlkT2ROVWNVMWZCcVJpZ3BWdmZSdEpUQXY1YjAwamVx?=
 =?utf-8?B?WlI5a2p6bkI2Z2daaVMrTjF1cnVrVTVqVjkyYnRVbXBuMUZQL0xsOUd6eDhJ?=
 =?utf-8?B?Sy9ubzdac3BlZkowM05Ydkx1dDNFbmI0TWMrSzg2SkxTck5uVmdnckdWWGpM?=
 =?utf-8?B?cnY1Y0lRWXdpQUViMXJ2TmgyUWs3d0NrMEFwaHhNY2lOVW1iVWJuM1dPSWR0?=
 =?utf-8?B?SDR4dEhmR2VzSnFGUHVNZ1c5SFNPMkwyM2MyWEhtdDU4ditRVzYweVJpZjA5?=
 =?utf-8?B?dGM5RGYvdnhRTzBZeU5DZzNEdHhvenpjWjJqK2NtZVF4OHhwRFVNN3ZxRHln?=
 =?utf-8?B?TnJVaXBVVnVQWVZoeGRrWVd1ZWZrM29HdjZEb3lZcFJvMFdIQnBQbnRrNDV5?=
 =?utf-8?B?VjVzSVhBKzRMVVdGUnVJaThKV0dSYTlKTGFMSlhiZllZRTF0VDc0U3dJMU1F?=
 =?utf-8?B?L01CVVQ2RlJrYnoyc2toekRxcFRxTWlsdldGeWxLMjR0N1R1K1E5NURlaWUx?=
 =?utf-8?B?Z3FTTkRvT0JYbVlGVzd6UzA1WWxSUWwrSGpPWUZOSFcxYUJ1QzZVSWRwRzlN?=
 =?utf-8?B?dDNSS3lUSW1rWGZScFhoWFpEZS95K1BGS2dDV2FmNE1uOGVZSUxDa3hrdGVQ?=
 =?utf-8?B?OGF6aU53cDUwY3hoMVZhc1ZOZUVMN1RLbnppV0Jlc1U3VXBIeTVSZVprMW4z?=
 =?utf-8?B?VWlwUGVRUmo4QjQyL1VMc3plWWlsdE5YbHBGQkZub1I1SUgrZk9ja3NSUGIy?=
 =?utf-8?B?UmV5OUVWaVpReWV6WVdYd1hURGRTWWo1bFpjMGdOMzV4TWc0MzhXcXkwT0ZU?=
 =?utf-8?B?eDloRVBheXBwbUVydnAvK1RvNTl6RFVqRHZ6RDBQK0JBNjMzVGprN2tCU3px?=
 =?utf-8?B?WG9lRzlKZCtFVGs5cnZ6ckdsbG9sdmc1SFFvNk92Mkt5MVZPNVFlWDYrclZT?=
 =?utf-8?B?R1poNVZScUp0VGNqY2x2UlE1bzBKQ00zZ21aVC9aTDhzai80a3pTUVMwSEha?=
 =?utf-8?B?RFpTWmdRUy9UMGxrdUt4eHNxbXJsV0hGSEhtMG4xdE9IOWJuNENBWEM5UjdH?=
 =?utf-8?B?RzNmVjZzLzdhQktSQkIyQTUzVzI4OUU0QkM2dktRSlh4WFE3Zzl0ekJ2U2Rw?=
 =?utf-8?B?WGUvMXVKejJEZ1UycUJVdTRBMXVVcDMrWHJZblMvQXBpK21TbW43azhBbWUz?=
 =?utf-8?B?VHBpcUMrOUdsQWlsMlBNaGtKdXhKZkdCdHZQenRhb0dhdXBDVGQ5UW9PNkZH?=
 =?utf-8?B?ZTZmaEtoQ1Q5M3FqVnl6T2ZRaXZzMFhtb0pNZlBoME1TeDNxaml2MHg5TUxx?=
 =?utf-8?Q?31+K0nJlI1iizejs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6A9105924FFA9468BBAEB83EC90A1FC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee4b7b2-d774-4709-f1de-08da1cc92b3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2022 21:12:36.5452 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cld+ku744YEEjbgn69npe3r1pBG7hKV1Sz+jW2pr4OKcEi5/eBZNSgi5hyh6yOhq+LZBtjL8h/R3dTFTOs9w1qIcKNPf0ugxr25rYxFBPdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3917
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
Cc: "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "lv.ruyi@zte.com.cn" <lv.ruyi@zte.com.cn>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "zealci@zte.com.cn" <zealci@zte.com.cn>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gVHVlLCAyMDIyLTA0LTEyIGF0IDA5OjAxICswMDAwLCBjZ2VsLnp0ZUBnbWFpbC5jb20gd3Jv
dGU6DQo+IEZyb206IEx2IFJ1eWkgPGx2LnJ1eWlAenRlLmNvbS5jbj4NCg0KVGhhbmtzIGZvciB0
aGUgZml4LiBDYW4gd2UgcHJlZml4IHRoZSBzdWJqZWN0IHdpdGggInBlY2k6IGFzcGVlZDoiPyBK
dXN0IHRvDQpkaXN0aW5ndWlzaCBjaGFuZ2VzIHJlbGF0ZWQgdG8gc3BlY2lmaWMgY29udHJvbGxl
ciBmcm9tIHRoZSBvbmVzIHRvdWNoaW5nIHBlY2ktDQpjb3JlLg0KDQo+IA0KPiBwbGF0Zm9ybV9n
ZXRfaXJxKCkgcmV0dXJuIG5lZ2F0aXZlIHZhbHVlIG9uIGZhaWx1cmUsIHNvIG51bGwgY2hlY2sg
b2YNCj4gcHJpdi0+aXJxIGlzIGluY29ycmVjdC4gRml4IGl0IGJ5IGNvbXBhcmluZyB3aGV0aGVy
IGl0IGlzIGxlc3MgdGhhbiB6ZXJvLg0KPiANCj4gRml4ZXM6IGE4NWU0YzUyMDg2YyAoInBlY2k6
IEFkZCBwZWNpLWFzcGVlZCBjb250cm9sbGVyIGRyaXZlciIpDQo+IFJlcG9ydGVkLWJ5OiBaZWFs
IFJvYm90IDx6ZWFsY2lAenRlLmNvbS5jbj4NCj4gU2lnbmVkLW9mZi1ieTogTHYgUnV5aSA8bHYu
cnV5aUB6dGUuY29tLmNuPg0KDQpSZXZpZXdlZC1ieTogSXdvbmEgV2luaWFyc2thIDxpd29uYS53
aW5pYXJza2FAaW50ZWwuY29tPg0KDQotSXdvbmENCg0KPiAtLS0NCj4gwqBkcml2ZXJzL3BlY2kv
Y29udHJvbGxlci9wZWNpLWFzcGVlZC5jIHwgMiArLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVj
aS9jb250cm9sbGVyL3BlY2ktYXNwZWVkLmMNCj4gYi9kcml2ZXJzL3BlY2kvY29udHJvbGxlci9w
ZWNpLWFzcGVlZC5jDQo+IGluZGV4IDE5MjVkZGMxM2YwMC4uNzMxYzVkOGY3NWM2IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL3BlY2kvY29udHJvbGxlci9wZWNpLWFzcGVlZC5jDQo+ICsrKyBiL2Ry
aXZlcnMvcGVjaS9jb250cm9sbGVyL3BlY2ktYXNwZWVkLmMNCj4gQEAgLTUyMyw3ICs1MjMsNyBA
QCBzdGF0aWMgaW50IGFzcGVlZF9wZWNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIFBUUl9FUlIocHJp
di0+YmFzZSk7DQo+IMKgDQo+IMKgwqDCoMKgwqDCoMKgwqBwcml2LT5pcnEgPSBwbGF0Zm9ybV9n
ZXRfaXJxKHBkZXYsIDApOw0KPiAtwqDCoMKgwqDCoMKgwqBpZiAoIXByaXYtPmlycSkNCj4gK8Kg
wqDCoMKgwqDCoMKgaWYgKHByaXYtPmlycSA8IDApDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcmV0dXJuIHByaXYtPmlycTsNCj4gwqANCj4gwqDCoMKgwqDCoMKgwqDCoHJldCA9
IGRldm1fcmVxdWVzdF9pcnEoJnBkZXYtPmRldiwgcHJpdi0+aXJxLCBhc3BlZWRfcGVjaV9pcnFf
aGFuZGxlciwNCg==
