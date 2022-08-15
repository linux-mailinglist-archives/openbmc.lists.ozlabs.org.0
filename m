Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AC15935F4
	for <lists+openbmc@lfdr.de>; Mon, 15 Aug 2022 21:00:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M63W36Ynbz3bl3
	for <lists+openbmc@lfdr.de>; Tue, 16 Aug 2022 04:59:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XwlGPflm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XwlGPflm;
	dkim-atps=neutral
X-Greylist: delayed 63 seconds by postgrey-1.36 at boromir; Tue, 16 Aug 2022 04:59:31 AEST
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M63VW6xzlz2xGR
	for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2022 04:59:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660589972; x=1692125972;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=z479qCNIHWORaKgoMXzA62uExQe6+zkgeOdFXtOxmu4=;
  b=XwlGPflmFfYd9IjUJ82GqOwka3Dgd67F08efwxxo1vghcVZL51Ix7r5S
   MX2iSqKT3hSOoZ/QGIhx5uDj3SUmOXhyp+u+3ohDZd+cdnoq4f9Nwvo5G
   6N2EnUC1+5fS/fWi6/OHI6KFIIjvaxMLCB4T3ICm4a7JEmBq+goDqQT8G
   Ypt9AjbgSith08UY07oVdiA4Bz7w9Qq/3jBoyenYzEoFf5PqLfFQof947
   LNLl1vMrJVMo7oCux/ToLc39ccfb558NIBkIpYqyabtJKxvqryFWbTZoX
   gkF+RnuHEQrI7krQqlUkoNG470tqhO6ovvbIP7tugsIEzqYO3zpPX6US7
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="272427762"
X-IronPort-AV: E=Sophos;i="5.93,239,1654585200"; 
   d="scan'208";a="272427762"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2022 11:58:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,239,1654585200"; 
   d="scan'208";a="666769887"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga008.fm.intel.com with ESMTP; 15 Aug 2022 11:58:20 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 15 Aug 2022 11:58:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 15 Aug 2022 11:58:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 15 Aug 2022 11:58:18 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Mon, 15 Aug 2022 11:58:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hrte9FOp788bya/EDV/EJF2k6NiIeUjf1mt8plqFh77uYNFbHfa03dx/dda/lglfLydvIjqvDl+BiwvDsXEjuB0Ljl5Y4kNzHJGMWO9wjWgf65i74CYClZl2rjVVjasdBUovMwSr1HobeJqVOIvrHGct1bpsSi1XJPIDEhz66cwz8sjp9rLQquSCkykanG3SG4HpGhVxg/Sm/9FvclWvovJixmOebn2wiqS6H3VwC8AXPPd1U5T5sL4NVjHFMlmmCjBamzcyJhiGTiEyVpUWVM50+8yQU1UEpKoYVUCa61IwzThGIbjeF3tcWhJ82cNfm2vPcogqTZh1ZgL0mG5sXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z479qCNIHWORaKgoMXzA62uExQe6+zkgeOdFXtOxmu4=;
 b=PNae7US6p1f/RbtLRYxJbaoVrUXY5YKCYbuhqg9bXMIKtVG6UAt3ngGd0Qe0Uz7GZFuKL1M5+Wp9csblH8lhJpisPu/xKQp2OoV9vqhWt5EziuokqgI8LHpfD5vvJzIoN4JWJfGFicLV3qpnZ+G802JT5ReARErzO/ftzYvuMAOhMiyDcjtPZ8j+5jmulphRXs+c2fHGc88wVFrhOctDywQ1AFdqOOWQrleGnwf5qFu6IUcVdIO4y6lY/g8EbBU+drTv97AFTQeNGOtfMBKZUj7Kf+pG1DpVIQHwoEjlxds3zIgIUewkNxeWang19P4fpSLdiuDe4wUG5qM6AkZLfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by CH2PR11MB4246.namprd11.prod.outlook.com (2603:10b6:610:40::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Mon, 15 Aug
 2022 18:58:16 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::e89d:7ae8:fe67:76b9]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::e89d:7ae8:fe67:76b9%8]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 18:58:16 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: [GIT PULL] PECI fixes for v6.0
Thread-Topic: [GIT PULL] PECI fixes for v6.0
Thread-Index: AQHYsNj6TEjwwaVc3kG64FlXh7Miww==
Date: Mon, 15 Aug 2022 18:58:16 +0000
Message-ID: <c0585d60961ed200f422a9f2124ee269827504e3.camel@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.3 (3.44.3-1.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ba6c120-a62f-41c3-b2d5-08da7ef01c93
x-ms-traffictypediagnostic: CH2PR11MB4246:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vBMnArVoYfhhDx+FHQS/jriQqMqW8x+WaO6uEtOxZ6bnKLc0VVUL7KR3Aw7QcWBuTh7j4cZQHsc2i4KqF+NvZYpfMCSrJAz/pasITWD0/Dy0aYZR0lHTM1ccjYqrIAkyOh+qhqFZJTQ1RBjLSHe3M0B702DB1k8kkiwz7teP+3+zGeQvGXjmMUNdKtEgKCSt8L5NF3ymJIi90+JUQDcdNZ0CQyusSWWhM7/fkd5CSURbfgDWKSAXe5O9Xz+sKL/bSPEThafZJs5VmNtJB+3LnvQXINayddd+TGfu03ANGrtsI4zq++HOK7z+FvfU8YbW54FOxWwPetzA6R4Ut+QEWBYt534yhNpzgETwBW9M10ej9THR3u/kJWzl4ugNqzqtoZMQmBpsEmIwvWpjhIbP5Rl375Si0gOdc3f/n3lIjTaT8Fib09wCMlQpIubGF/l+wNOU3ap4wLaEhNfhyGfMNP6uTJOe+dS3ealK29IDrkzPilcAFbf8+vyUpDfmM6mjINjwNHTwxpUFhxO+YSKfmYH9TxKy/bGk3joXBaYemqbnpE1vIN8ThhELApKrOyzBS+PGZwktsSFOzKMwTk0+Kc6+7SC8ePb4HYk57uk17KEyLEk0AMlsX81CcQyUFsE+CKtCAfg66HeWkIHs3qBXLFH2vD627k6dY914SdeMP2s5nIss5MrzLrKubMp733GIA/6RPDJMht9mIc8MGc9XlOVygDOrxPO/0lvy1vRlwhW1K63rVSIzqFbOG8HbolSPeekHHYMDpeuYHh2peXkD0GjOt0ugXBOJprrm5yR8tTU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(376002)(136003)(39860400002)(366004)(76116006)(91956017)(66946007)(66556008)(66446008)(64756008)(66476007)(8676002)(5660300002)(316002)(6916009)(54906003)(4326008)(8936002)(2906002)(38100700002)(122000001)(36756003)(86362001)(82960400001)(38070700005)(41300700001)(478600001)(71200400001)(26005)(6506007)(6512007)(6486002)(83380400001)(186003)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXhQUHU3cklPWk5PUStTTEpJSDMvVGh0Rks2cWkwNlRqODVoWkV1MWdIeTVN?=
 =?utf-8?B?NDdsWklZbndXZklGcnVnbzJTSllCKythN3FlcUE5azJObGQrVng2R0l4OWQ1?=
 =?utf-8?B?amNOOWF0QUJEdXJFZGlTQUo2bFRja0ZvYnQzNW50V0pWNmxWSHhUVHpvUXEx?=
 =?utf-8?B?VXI0NHdxZ2hIUWpTaDZDUmJlRExDOXNmWGRPNnVwUU5OdFAzQUNIaTV0TlFO?=
 =?utf-8?B?V05OS0dxNWdzZmdwMmJ2bm9TcVFKdTFlc1p1ZExFeTZLZ3NiclJNVTAzVkw3?=
 =?utf-8?B?dkNFQUR5NVNJbVZyc1NQWkFqM3JiNWVEcThDeXBSSEdyYXBWVjNEWkJpUEYr?=
 =?utf-8?B?NDJia0ptSms2TkIwaWY0UjdrS3pZV3A1akJhM0pSRUZCTUpGaTBIRnRoWERz?=
 =?utf-8?B?eldnd2p1YStSaVRyMlVRNnNualBxN3FBbHhPKzBPbHd4bVkrME50OWc5aFBu?=
 =?utf-8?B?Lzl4UGp4Q01vSmY1TlBWQjhTMGNoV05NVnF2Z0hFVGRqQ1ZFKy9EdjQrSWJz?=
 =?utf-8?B?cFVjV2VuT0Y2eGJxU0c1UzM3cEZ4eWk5SDN1SWE4V3hiclBIVEI0Q3NycTFi?=
 =?utf-8?B?NGFHcCtISFd0TlB6REk4bDBMMGRwMy9IaHY5bmpLSEY2Qk5JNFNLLytqbDdE?=
 =?utf-8?B?cUlTelhEWlR1WVJ1NGdGL2tvTzZxc3NJQ1JXZFdVYnZINTlTMnYzb0hZaGhZ?=
 =?utf-8?B?cWNFWE9WN0J4V251ZzlpZk82VmVwVGN3YVRUYkQ5KzFxN0VpWUQ2a09CSC9G?=
 =?utf-8?B?REtoWDEwdGNIUm12a0J6VGpGaWt4UVhVR2oxTGJER0JtcXR6YVlxTGJ3dXda?=
 =?utf-8?B?a2pFSGtRekkwTXRvYWNQZml2SHJPRXQyU0V4RXRBeDNDcCt0WnJHK0EvUU1N?=
 =?utf-8?B?Ni9EUktRdHk0SUsvQ3c5blR3VmdtVDBBeE9qY1lwQW1VNzRxdmVLbG1hQjhU?=
 =?utf-8?B?dWVieXd0NDNHcFZpQVFKeTNqSTZ3Q1hrUjlLQk8xdFpONGVsL1hzdVRsNUp0?=
 =?utf-8?B?bG0rbis1S2NZY29VUW5leG9UTlZHZzR2am9KREN2Uzg2LytlSkUwbFFXUGtz?=
 =?utf-8?B?SzlLZnQ1N2FpOHUrT2RTRU4rbFIzNkdERlpyZXZnMGovOVVGZ2QvZERYTjBm?=
 =?utf-8?B?TlFVMmx3b2EvUjM1dU9VVjZBcUwzODNpNVVnajdxRDBGMmV5cytVRVA3VUFr?=
 =?utf-8?B?Rlo3cHVNK2o4enR0aXJVZWYwaGt0aEZkNmQ5aDdIdkZNRkg2M0dKUWFRMUlu?=
 =?utf-8?B?c2V6ZWlaR1orbFdHTEFHazBwNnRuZ0crR2hyQVRJdWZobWRHYStCMUxsQVlr?=
 =?utf-8?B?bW9GYU5TYXBib0UrWlVpektDOWpOcGZvc2hhc3ozVklva2pUSjI2REJTTmhG?=
 =?utf-8?B?T1NBL1hjYXEzRXJUc3dMcmFKRUNwaDhyaTN5OW4rMHhTMDJyaHpPRktQYlBU?=
 =?utf-8?B?T08xbk1JbW1SQVF3bGpiZk95Zk9PdUlLNmdYZTdiNmFFTUkvWXc0VHBRWUZs?=
 =?utf-8?B?UDhUMkx6UFE0TVlQTmhQdVlWNzc3N2NvTTY2dktYNnpITlNNSjlWbTA3ZE1V?=
 =?utf-8?B?ZDI4Q2VCWWQvcHMybU04NEszb0lDMlI4OWJ0Mk01QWlkVDZTd1VtRndlSFE3?=
 =?utf-8?B?ZjIra2pweWYrbDhPQmRJejAwV0NuVUl4RHJSOWJLWDRGN2RSbENoTHcyeFRz?=
 =?utf-8?B?WGpKYmJGMzdpa0hyb2tKWVB0S244QWdaMi82YStlS2N1M2JqK0V2MVNmUUtu?=
 =?utf-8?B?MWhnZTlHSzVvdFQ2UkhtRGhnbGVFeE1CZ2dNMHBGN2phQnE0U2tDdmRab0Nx?=
 =?utf-8?B?OGl5bmdIa1J6SHRCMmkxZGdKRUhlL1E0eUlaVTh6eXFSZ3l3TG43T0F6TnVm?=
 =?utf-8?B?bEJSYzlqVHZpRmZRcTFmSTJ6TmlMZjhwN0ZWSjFCOGlPMFdZWm9jVEV0UEpE?=
 =?utf-8?B?SW0reHUwakw4d0VHeVdid2dEY003bTRBS3FnSVkreGdmb3RPZmZlTi9lN1NR?=
 =?utf-8?B?Sm16dmlRRUgwWjBnZDlGNUlWWmJaZkxrNkJKTFN5NHpQRVc5OFBGajNXRjJE?=
 =?utf-8?B?emF6NGFCNDB6K3I5YXEzVnVMZEZiM1JQQS9Gb1k4cjVHVUh0Rk1Xd1RwemFS?=
 =?utf-8?B?MWgvY2c2MXRwZVhFSkFhbE5nMzc3SzZYL292NzVieU5KSGtGMHZPbndISWpz?=
 =?utf-8?B?dHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44DF3028C4B43D4FB8015E74DE08AFDA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba6c120-a62f-41c3-b2d5-08da7ef01c93
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 18:58:16.2414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J9B76t5OptOUiZdPQY9Jga5eWsaqOD3WJ48bZ2VmE115VA71dHOJYc7NkPJSjJTZArDf00Ca/33QdsUP1FTqmHmXE1fwgBqRVujINyzzsP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4246
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgR3JlZywNCg0KVGhvc2UgZml4ZXMgd2VyZSBwcmV2aW91c2x5IHNlbnQgYWZ0ZXIgeW91ciBk
ZXZlbG9wbWVudCB0cmVlIHdhcyBhbHJlYWR5IGNsb3NlZC4NCkl0IHdvdWxkIGJlIGdyZWF0LCBp
ZiB5b3UgY2FuIHB1bGwgdGhlbSBmb3IgTGludXggdjYuMC4NCg0KVGhhbmtzDQotSXdvbmENCg0K
VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA1NjgwMzViMDFjZmIxMDdhZjhkMmU0
YmQyZmI5YWVhMjJjZjViODY4Og0KDQogIExpbnV4IDYuMC1yYzEgKDIwMjItMDgtMTQgMTU6NTA6
MTggLTA3MDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KDQog
IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9pd2kvbGludXgu
Z2l0IHRhZ3MvcGVjaS1maXhlcy02LjANCg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRv
IDFjMTEyODliMzRhYjY3ZWQwODBiYmUwZjE4NTVjNDkzODM2MmQ5Y2Y6DQoNCiAgcGVjaTogY3B1
OiBGaXggdXNlLWFmdGVyLWZyZWUgaW4gYWRldl9yZWxlYXNlKCkgKDIwMjItMDgtMTUgMjA6MzE6
MzUgKzAyMDApDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NClBFQ0kgZml4ZXMgZm9yIHY2LjANCg0KVHdvIG1pbm9yIGZp
eGVzOg0KKiBjcHUNCi0gRml4IHVzZS1hZnRlci1mcmVlIGluIGFkZXZfcmVsZWFzZSgpDQoNCiog
YXNwZWVkDQotIEZpeCBlcnJvciBjaGVjayBmb3IgcGxhdGZvcm1fZ2V0X2lycSgpDQoNCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0NCkl3b25hIFdpbmlhcnNrYSAoMSk6DQogICAgICBwZWNpOiBjcHU6IEZpeCB1c2UtYWZ0ZXIt
ZnJlZSBpbiBhZGV2X3JlbGVhc2UoKQ0KDQpMdiBSdXlpICgxKToNCiAgICAgIHBlY2k6IGFzcGVl
ZDogZml4IGVycm9yIGNoZWNrIHJldHVybiB2YWx1ZSBvZiBwbGF0Zm9ybV9nZXRfaXJxKCkNCg0K
IGRyaXZlcnMvcGVjaS9jb250cm9sbGVyL3BlY2ktYXNwZWVkLmMgfCAyICstDQogZHJpdmVycy9w
ZWNpL2NwdS5jICAgICAgICAgICAgICAgICAgICB8IDMgKy0tDQogMiBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo=
