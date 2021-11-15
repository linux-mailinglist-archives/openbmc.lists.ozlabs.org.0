Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1D44517A1
	for <lists+openbmc@lfdr.de>; Mon, 15 Nov 2021 23:37:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtPFW135gz2yPS
	for <lists+openbmc@lfdr.de>; Tue, 16 Nov 2021 09:37:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=hm/uFOPo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=hm/uFOPo; dkim-atps=neutral
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtPDz4zcWz2xDr;
 Tue, 16 Nov 2021 09:36:29 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="294365644"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="294365644"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 14:35:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="604052876"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 15 Nov 2021 14:35:25 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 15 Nov 2021 14:35:25 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 15 Nov 2021 14:35:25 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 15 Nov 2021 14:35:25 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 15 Nov 2021 14:35:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOhNf39+O8mD2pw1WUDgs7ui29IrXkpdOR+lqpruwGb+uTb1smT7lReoilk0WmS0ukb4ShikljVvPf9x7w86SX1LOqpdkxOjei6i76Bn5P9AI9Zehjanc97vSk0oKlSzJDCt44oN7j9EA5f4FteVkDwqoTRpzFauDLWtSE+1sud8bkm3j6DG54DqsLqmSvCcrZSwOlUxYEWsOj9uoGwBJDNEr/n+Fmj4mBygWipKyVkgIEzwLkhvas1NPV/zNsog0Op++/IL+4UzdRNDD5h26mQfK59rp6oT/QLpUGhaJlE0Y+5JlmKm7DfwqkUHUuxw7hhBKWjWQpHIxRiicRg41g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/aW7KGgLZXg7ts3dPHP6JHaWVZ6xIEP+pkWmobE3iQ=;
 b=WOZZZULg8yU4fKJT/vpUffKc3XNMpj5q67u3O1A2ztx7Dmu+CauHNDLLnYJpLLRTwJ7Mo8Yd4RiyXxIgVsvRyQtjxU/TfT2kU5LlxfA0/VOTT6XbCMGNsEqoU3xZzFHLKFOzTZvl/4An5U+Iv50PWXZru63qCRZULTcorTDCRvCnmvGeW3cC5BLRLOky8ujOcrHwgMH3ZzE41RbFBMc4xAYG5DWxDObCvcPZKbfmE9hj6nhD01prNDUVb8mljJIRyb3FosLm1or3mrtZm0imOixDbheqtjbeY7/acfRLjqAgg0HNr/gZbxidWMFYH+bfvNNQMdeYQnuV0Yk6Kq5cAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/aW7KGgLZXg7ts3dPHP6JHaWVZ6xIEP+pkWmobE3iQ=;
 b=hm/uFOPofm3P0DZPOVfWJKhE94O8QFGbw96q5g6H7ybN0hDAzb7z151zb4fUA2qLFy/VVTZHcNH4AvTgm++/j77undxrVvD96ndfnuIqKbn2tHe4IuHe6mOYlvyeBMcz/Fol6S9TtDJOnjxGV7hKq7rRj6A5/hIRror3cKmyuJs=
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by CO1PR11MB5123.namprd11.prod.outlook.com (2603:10b6:303:94::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 22:35:23 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::6553:c7f9:a224:cac1]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::6553:c7f9:a224:cac1%4]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 22:35:23 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 06/13] peci: Add device detection
Thread-Topic: [PATCH v3 06/13] peci: Add device detection
Thread-Index: AQHX2k6vfpbjE6OLJ069BVykJfvHA6wE7o6AgAA++wA=
Date: Mon, 15 Nov 2021 22:35:23 +0000
Message-ID: <368c990c30c5bacde15ac4bce5db8389aea3ec9c.camel@intel.com>
References: <20211115182552.3830849-1-iwona.winiarska@intel.com>
 <20211115182552.3830849-7-iwona.winiarska@intel.com>
 <YZKr1Rqfx6Cmw+Ok@kroah.com>
In-Reply-To: <YZKr1Rqfx6Cmw+Ok@kroah.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9fa09d48-837d-4073-d430-08d9a88836da
x-ms-traffictypediagnostic: CO1PR11MB5123:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-microsoft-antispam-prvs: <CO1PR11MB51234E8E3EBDDE050A951841EC989@CO1PR11MB5123.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ufUTV4kj8T88980pNtkgc7PonAcLAie0IQWOWhyUNaxWwTC3G0s+XMPBHDI13rThEBQSXb0PvefRTKxNap/TYG9YQeKYh/Y0LDDzgpG8Cuu+wTPs2Ei3K2FQgVNExMUqV08RvZIkwG5jXToIvRkbkRKsBwsDyzkEeq4nx/sixnT0DLcShTyQi2WeUlCXJrS0V2IF+yapHRywF2/eDKcsf0LPCEOzbJYduiVzCP688fEs9aG0y1H4AsgTtdkTtxNXtqp78/H9lEl2oHd8W/oUh01nA9b2Lts+C9sPUtb+J9Cuak1h3ymtVrv5QlDc1jNn08V4t6SaZk+BR949uzHy7JJz5UKyclbecwJiDl2pkRIqCB9hm3QYaG8PRgCXJ11FJljMsTacb2eP2Ce6dUgJ3VsQIQiaUYnFP1CFeas8zkK6X5/y1xEYR5itAR0KbXgX3xTDxmEXdTkrEJY01WevN9C40KKzky7aHbKOCg6vx7/whMUnB003ai2IQT3Y/WIZLEhVQvSykNOyXXRhaLnWLY8CwLHUADBKb52hg87JMhRLxaf5EFIUjvhuzODS74a+awdgtxQm3F5V0HnlGAwPQKeqtqqaJ/O0Oj+aOZXYC/lH3Eonke247b1ZkUHa1ULRBx+Ps4P5k83w44dAthadTCyvOYm6QZDhBqZIp+OFFtLJXW2vUPfvaveOhBAFuvIrNNIRuLxZKweB2d7twflyQg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5823.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(66476007)(76116006)(71200400001)(8936002)(64756008)(316002)(54906003)(4001150100001)(36756003)(5660300002)(91956017)(2906002)(38100700002)(508600001)(122000001)(82960400001)(6506007)(6916009)(83380400001)(8676002)(6486002)(6512007)(2616005)(186003)(66446008)(86362001)(7416002)(26005)(38070700005)(66946007)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHhlVXNHZTdkZ1hSWnlyKzU5azZkWVVvM1ZqdXRLSDNVN0tiN05OS053cDE0?=
 =?utf-8?B?dUhrRThSM2R1TFhLL0E5Z1VYNWtDcFBuV2EzL240eEN2YzIySFAzSUROaVpp?=
 =?utf-8?B?SmJRZExoUWFoUGpKVXppVG4zaG5kL1dRbjUwNHB5S3p0Q2RUL2VHLzJvQjNS?=
 =?utf-8?B?ZFdZY1JoYmlCWFZpUEZyTmhMWlpOQTZwWVFBYldrT1N5T0sxZDBVS3lRQThQ?=
 =?utf-8?B?Y3h1T04wSE5HTk1IRER4UTRTTkF1NC9KdjVyU1M1TmRpenlBRUhHY1l2T0k5?=
 =?utf-8?B?SXVKd1g0d3NEVEVpUThYRzFTa0pVN3JBcXlIbG91T3dKcG1PZ0FQNFlQZWNQ?=
 =?utf-8?B?Sk1meklrbm84RW1QOXNUb1lZUE15d2JRcnpTakN1QTBnOEtwMVRzZWlud05n?=
 =?utf-8?B?VnBGYlN5dEVCTktWUnpWR1lieWJ5UkYzYkxMQ29Fc0hNdGhaUnhxRDJQMzdm?=
 =?utf-8?B?MVRKZlZ4SzBCdlREaW5TMncxcHpvZ1lXajdsdGY3cVdaOVFZMkx5N3BXSk9I?=
 =?utf-8?B?eXltNFBidktnMjRVODZQRlpXOVhWRW5KWDE3bmMwaXE2M2w5Z3Q2Z2VNaTFy?=
 =?utf-8?B?WkFtSlAxd3NmL2RkMUFlMUxwNDB1ak9NYm1xNHZaT1FvQ0JZZTkyRXBNb282?=
 =?utf-8?B?a2Z3MVo4MENLYm5mQ0ZlQm9pc0J0ZDByNkhUZkRpeGpHL2hzNmhUVkx4Q1pE?=
 =?utf-8?B?UDNoM2t6UThzZ3oyeHM3TEkvNkYxOTVHcXdEOGJpOUtWbkZOTzBPeWJzRUxO?=
 =?utf-8?B?TDB6d2FnOWJ3R1pEVHRQTi9zb01HbVA3ZWJJa0ozcFozdFhTcTQ3WDhML1d2?=
 =?utf-8?B?WVZuMTRaek5vbDNTQmJYWHVKSUd1SEFVek4vekpYcE51L051YVZUYXBFNjQz?=
 =?utf-8?B?WE9kUjk4cEJwL3JFNmdTZjFESHd6UjM0bGdzbk1qcXFqQmRqNVZOdjc2RjFI?=
 =?utf-8?B?RCt0Y3VjUExxTmlFTXhmaFJEeHE2ZHMybEMxLzdFU1dHWko4U1hOak1yc2J1?=
 =?utf-8?B?b2J5Njc2d1dVT0dBbnp1bEhFak45Rnd5cmgrSjNyemZmRGVVTThLbWdzSFBl?=
 =?utf-8?B?eE1FR0EwQ1BSS243dmI5Wk5JRHd2QndERjNtMmFXUDNlcVYrTTZxTU92MmRs?=
 =?utf-8?B?U1VkL3h4VXZiZjg5NE8zcFBmL2k2R1hPUGYwZ0JPRkNodlJMRW9iVVZWdkdo?=
 =?utf-8?B?M2gyY3JUWTAyU2ZQR1BKTUlPSjdqUWIvVWtUekFrZThwbEpOaktiaWV2aE9u?=
 =?utf-8?B?d2RXVWhwcUU1bmc5b2l4UDNGUUNLeTRMS2Y3OGdQcjM0RmxJUDdDc3ZPckVy?=
 =?utf-8?B?NXdvSFc4dXFEUGphNytWbWZxRXUraUI1OW9jY2g5SHJ5UEZvSlpnTkpCcjdo?=
 =?utf-8?B?ZDlEQ0RLdkRBdEZ4TG42WS9zRGJWQzM5TjVxOXVwTFNBb3NwcnF0bTFLNjNq?=
 =?utf-8?B?QkpVaEd0cDJmbi9yeXFUYlg3KzdRbGFDdEVLUEI2enAySjd5TUR5M0FzcFM3?=
 =?utf-8?B?SmhQY1phdUJjanlYUXZUM0xTTnlhSDBNd25tUU0zdHQvcDU1TFZkOHJQTHpB?=
 =?utf-8?B?aXI2MFhVblBINllTY0Rtdk9lNWhYaDNPalZ5Q1JxZGIyYWFrUlpHbWtUU3dC?=
 =?utf-8?B?N0hkTWY0Yng4Vzh2SlFlZVpMbVlIRG5UK3gyd3kwR09qeStmaFVvRGxMZHZk?=
 =?utf-8?B?MG9HTlJaQkdKNzcyQmRXVUxWa1dqaGRuWkNaUyt6a1pVOWMvWmNkQTdUZmdi?=
 =?utf-8?B?TWpLK0VZT1hZcUkwRVFmMyt1Z3B1NjRReS90VkN2aEZmc3NOOSt0R1pYSTVs?=
 =?utf-8?B?RmlXVkRyNW1mMEhDNFd5aFNZSXN4eG82bEN0bTQ2MG93dHhRZit0TThLRTFk?=
 =?utf-8?B?SjB1NUFVSlJTVW5sZ0dzMkdFNmZrUE11c2xNTWwrOTFET2FCcVhadDVOV2h5?=
 =?utf-8?B?MnEzT1Q5Rm1zbkhFYTlmVnNFV3JTcHNtclN1UE5zbXlyTlNBN05yeUJoQWht?=
 =?utf-8?B?cTQ5NitLY0ppVHU1eHdKYlM3Ti9BRXVEdFcvNW5PTHhyOWZvaGIxQUxmdmFG?=
 =?utf-8?B?UW1ZQjZHQ2lUb2ZmM29LdkZZS3J0d0Z3WFZjaU82NmxOYUJGNjQzK3pxbGxP?=
 =?utf-8?B?M2hrNmViaFROK3E4bVgyM3pFak1LLzdERlFubS9GemhhK0dRdVhic0VIYW9X?=
 =?utf-8?B?ODdqbmNMdTdVakZXVGw1NmsyTnlMYWJhR3UralJZMHM0aXBoeE8rd3ZIVGdV?=
 =?utf-8?Q?el8Zi39mO9VyTQdo/ncfc98rZxBVZioZcV9UvvUzog=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0753BAE25815142A6592DB1F5E78778@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa09d48-837d-4073-d430-08d9a88836da
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2021 22:35:23.6834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rztPXGBaWoTxNQdQrkrJItF7HZKsyIClirIsC5RW3UfrGKK3/TvSzNfJIzVns7Z6a5c4/jpIgUk5vuP8VQ0Zai0KrVMN8EIDbIqOgx588r8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5123
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Hansen,
 Dave" <dave.hansen@intel.com>, "zweiss@equinix.com" <zweiss@equinix.com>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "Williams, Dan J" <dan.j.williams@intel.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Luck, 
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "olof@lixom.net" <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gTW9uLCAyMDIxLTExLTE1IGF0IDE5OjQ5ICswMTAwLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3Jv
dGU6DQo+IE9uIE1vbiwgTm92IDE1LCAyMDIxIGF0IDA3OjI1OjQ1UE0gKzAxMDAsIEl3b25hIFdp
bmlhcnNrYSB3cm90ZToNCj4gPiArdm9pZCBwZWNpX2RldmljZV9kZXN0cm95KHN0cnVjdCBwZWNp
X2RldmljZSAqZGV2aWNlKQ0KPiA+ICt7DQo+ID4gK8KgwqDCoMKgwqDCoMKgYm9vbCBraWxsZWQ7
DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoGRldmljZV9sb2NrKCZkZXZpY2UtPmRldik7DQo+
ID4gK8KgwqDCoMKgwqDCoMKga2lsbGVkID0ga2lsbF9kZXZpY2UoJmRldmljZS0+ZGV2KTsNCj4g
DQo+IEVlZWssIHdoeSBjYWxsIHRoaXM/DQo+IA0KPiA+ICvCoMKgwqDCoMKgwqDCoGRldmljZV91
bmxvY2soJmRldmljZS0+ZGV2KTsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKCFraWxs
ZWQpDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsNCj4gDQo+IFdo
YXQgaGFwcGVuZWQgaWYgc29tZXRoaW5nIGNoYW5nZWQgYWZ0ZXIgeW91IHVubG9ja2VkIGl0Pw0K
DQpXZSBlaXRoZXIga2lsbGVkIGl0LCBvciB0aGUgb3RoZXIgY2FsbGVyIGtpbGxlZCBpdC4NCg0K
PiANCj4gV2h5IGlzIGtpbGxfZGV2aWNlKCkgcmVxdWlyZWQgYXQgYWxsP8KgIFRoYXQncyBhIHZl
cnkgcmFyZSBmdW5jdGlvbiB0bw0KPiBjYWxsLCBhbmQgb25lIHRoYXQgb25seSBvbmUgImJ1cyIg
Y2FsbHMgdG9kYXkgYmVjYXVzZSBpdCBpcyB2ZXJ5DQo+IHNwZWNpYWwgKGkuZS4gY3JhenkgYW5k
IGJyb2tlbi4uLikNCg0KSXQncyB1c2VkIHRvIGF2b2lkIGRvdWJsZS1kZWxldGUgaW4gY2FzZSBv
ZiByYWNlcyBiZXR3ZWVuIHBlY2lfY29udHJvbGxlcg0KdW5yZWdpc3RlciBhbmQgIm1hbnVhbGx5
IiByZW1vdmluZyB0aGUgZGV2aWNlIHVzaW5nIHN5c2ZzIChwb2ludGVkIG91dCBieSBEYW4gaW4N
CnYyKS4gV2UncmUgY2FsbGluZyBwZWNpX2RldmljZV9kZXN0cm95KCkgaW4gYm90aCBjYWxsc2l0
ZXMuDQpPdGhlciB3YXkgdG8gc29sdmUgaXQgd291bGQgYmUgdG8ganVzdCBoYXZlIGEgcGVjaS1z
cGVjaWZpYyBsb2NrLCBidXQNCmtpbGxfZGV2aWNlIHNlZW1lZCB0byBiZSB3ZWxsIHN1aXRlZCBm
b3IgdGhlIHByb2JsZW0gYXQgaGFuZC4NCkRvIHlvdSBzdWdnZXN0IHRvIHJlbW92ZSBpdCBhbmQg
anVzdCBnbyB3aXRoIHRoZSBsb2NrPw0KDQpUaGFua3MNCi1Jd29uYQ0KDQo+IA0KPiB0aGFua3Ms
DQo+IA0KPiBncmVnIGstaA0KDQo=
