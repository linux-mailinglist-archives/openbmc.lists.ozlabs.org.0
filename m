Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1A0688B47
	for <lists+openbmc@lfdr.de>; Fri,  3 Feb 2023 01:02:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7G6p5WRqz3f5Q
	for <lists+openbmc@lfdr.de>; Fri,  3 Feb 2023 11:02:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UDvXnkTy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UDvXnkTy;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7G696fX1z301F
	for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2023 11:01:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675382498; x=1706918498;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rfd1D0jUhVyLYpmuXaGcLYydtkJWOKsbArTz6nxUNf0=;
  b=UDvXnkTyEfq12C1FG4WKp2kZGTv3gdQ2fSlNuykw0CVtcVtfGUeAYVZP
   p82XACvfKq2hhhEDTDnRbuqOhrsWEiGhBrZrNZcJomtt7GzPbpcH/uj/e
   clVyG41io7YcLPefjm0sU0YR7Vlx9tjElpWr32+WlL8JPXJ0VSU4M9vNq
   g+G82s7ArIXTNrKZV9W4rOhg1HU0F/dlq7mysUqRyOtueE3kXc9l7RzMr
   woSBo6Si2w4FHWwcMYnZPntj05x/qqHCF9jPOI9aPLB/nfplh3WAkmPVH
   P0lMuu64fgF8yyToZVpO+BOOXurcHKgLA4F5ZLRtlewvNHNca9EqmkF8i
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="308948492"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="308948492"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 16:01:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="643088355"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="643088355"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga006.jf.intel.com with ESMTP; 02 Feb 2023 16:01:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 16:01:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 2 Feb 2023 16:01:32 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 2 Feb 2023 16:01:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWk7f+Lk7Cwjgxw4bFV1eEcCKWEWLisCXkWYp8os0pcaukWuuWGnseGXLYgMQN4f0hKTfxabyz9DQQdW+AfXlla9ZUDkoRZjEFICol4Q43mOZF/96rM2x+ir8/Xe2PkMb6v+nTvZG/xZSA8LAdu+MQ3us9qIekdzj/e3bH1z084/82T7N5Kbo7i7BT3kFKlQ9TCNHKHst/QZmQ8tF9CQpDYlZB9rktDCF8EtFHIAWD+Rbbq/p04K5Afy1kRV6kDlFEF8673shYqolxJjLr1h/z73mecyCm7+YZutp/Kzxdgj+7i7/0cMLmIzT/mDh3VqKncF7cW4idm965SCnvPvng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rfd1D0jUhVyLYpmuXaGcLYydtkJWOKsbArTz6nxUNf0=;
 b=eGWLnCCCckQNwICC42aY+yC8Sxd7f9qisnlX0WowrfUmKdYFEbCvVs+nVfiB0t6CG1gi7Io8v6T3ILTRk6BgZ91QbqhI4nQvz02Nr744I05gUJ+LgrRbUX4otyoT3NumlfYJ5g5CAh3SArY3pL5vH5rYqv+6+vllIxB4Z7W8ELCZG0AJxtdFx7NsaCi5eY4HnNV+Iq6cOXt4TYhTNyW1SugVcM3caLxbE/bMchfrigESdSNSnP/Q701g6YYuDY9J0TlYuh5TUxbYRhijD3NhUojMFgi9fJ/LH48HxbVbRxqruMgj/6E3SxVwYI8CO6OPJDWY+Nte6yvGG98u9earRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by SJ0PR11MB5200.namprd11.prod.outlook.com (2603:10b6:a03:2df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Fri, 3 Feb
 2023 00:01:30 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::ee2c:e87b:970a:a3f4]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::ee2c:e87b:970a:a3f4%7]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 00:01:30 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>, "zev@bewilderbeest.net"
	<zev@bewilderbeest.net>
Subject: Re: [PATCH] hwmon: (peci/cputemp) Fix off-by-one in coretemp_label
 allocation
Thread-Topic: [PATCH] hwmon: (peci/cputemp) Fix off-by-one in coretemp_label
 allocation
Thread-Index: AQHZNqyrmfAMR2uvx0O6gLacv31meq68V/cA
Date: Fri, 3 Feb 2023 00:01:30 +0000
Message-ID: <c4b9beb89c62c35fa6ae81b78f6f8243c5a4e4aa.camel@intel.com>
References: <20230202021825.21486-1-zev@bewilderbeest.net>
In-Reply-To: <20230202021825.21486-1-zev@bewilderbeest.net>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.3 (3.46.3-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5823:EE_|SJ0PR11MB5200:EE_
x-ms-office365-filtering-correlation-id: 70d72c26-9036-43f2-eb27-08db0579cdca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RvLDfvley/ipFUm9ZKiod7Y8c0M6IfPVF+kJUX6SAwwxnwfbaIIc7K6xYZI1Pb52av1MGmEYKZVEvyisZ87Cz2hxw5aqVOG9CidjD9zkCsr5T7d09ZLI0s+tkNapB7SckyvdXY4TfKPlZqsc2kOPL4CVv3r9IB8uW43NAUiGUkALoHqJP3iLAuhj7jcZrn/4pUMXG6ck52ESF4rNEYALpz2TDkVpF0+TxHCsKETiW1ZrhvkV9zboFWYUpnxFmGEaPLY4MV0Na6KXyt7J75TRtpRD5xnvpuLlU+tzY6eHA37NSXv6W6kniozBbj0fE079VDbzFwD4D3B/gumJ0CUM3MYsWHmcAPf6zVCwIJ+dvECMc0SeKVgJg3gAPNW5DLtQpCX7jqVndmedCQm6RRAXq6pmScUqlJfdsXFb4mJKWjlfAlfKJC0a+NmpFukJc4g/8Rp58mSx3w8SFYpB1L6IPe+j1+wYSlQXNe3FAp4jE4m5AVjUHIlonFwQmAx6MJrfUQ0AZ8CjELwapJA8ublZ3lmBs0p7bYilUBzRHJw40JvByCnl62mIGn/ZvTkLGzLE94SZXmKB0z1Uax+AUJqaXFsWTFzrL2MXa/g6lW+Kzk72KvjYn2wu0WJg89FuzQ6ADNKq+EdpJizt+cysAyzaybqgqe69H6YZzJpSPcuUgN2v7N8BfY/vTlUYDEAWvmFUQhqAgKNiyeTRO/92ejaHTA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199018)(122000001)(86362001)(38100700002)(66946007)(66556008)(66446008)(8676002)(38070700005)(36756003)(91956017)(6486002)(66476007)(64756008)(316002)(76116006)(71200400001)(54906003)(110136005)(4326008)(8936002)(41300700001)(5660300002)(7416002)(2906002)(186003)(82960400001)(478600001)(6512007)(26005)(6506007)(83380400001)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3FHRG1tdlRvR2dnTnhVMWhndXA4Y3BQa1YvY0VEemV1SklLQ0U1MGIzQXox?=
 =?utf-8?B?WUtGU0cxaTAveWdZZHpoa1A0YzluTW1xZzNNZ0lLWHpjWjd5RC9idDZ0MEVh?=
 =?utf-8?B?SnE0RzJDQVFrTmpVZDlibkJuYk8xVVQ1a0NqVTdFaktzYnVTR0dvL25uMnR0?=
 =?utf-8?B?Q3VkM0pJMFI3ZjBENEFHVGh1Vy9rdDR2dGd2bXczTUVMUTNQQ1lIRHBTK1Y1?=
 =?utf-8?B?enZuNkprMDhtd0wyUmtWR2VLcE1QNFNWTDNLc1BVZnVaZFRzbUJUaFNqNGpD?=
 =?utf-8?B?K3VzUmJzVk1Nb1hicnd2dDA0Zy9vU1JsanlnblNPbC9MYjJERnIveVpOcTJD?=
 =?utf-8?B?WlN5ZE95YllmYi9Xak9TMFE3NlVUcm1Md0JtY3locHN1MTYyOGNHaGhHZTlD?=
 =?utf-8?B?T3d6bjg2dFlibytkOG5tRjlmdkJKTDZDNjM5NWhTdWVDY0RlVXR4dkxjVDhD?=
 =?utf-8?B?dWpONWptcnhzem82YjB1TlFKeTBGMjFFbWRIZ2lNbnhwOWYwZ0dCS2J3aElp?=
 =?utf-8?B?elh2QWlwdTExNVJKbkYyeGpHM1Urc2E2dWMwWWJhaldqa2xxeGlDTk1LSWF2?=
 =?utf-8?B?elNqdjdiUzF5cStmc0RJVE13VTQrZk9QTUhiSlcvTzZvZlRXcjlrNTRxNWZ6?=
 =?utf-8?B?eHlxSDJsbUVoeSt6THcwVEViZi9PR0dUWVR6dmlJQnRVcm4zSElMSEl5ZFJO?=
 =?utf-8?B?MlY0eUxiWEFZanVNRnFsQ09KNm1Xa3dnUU9FVStUNGs0WVZTdkpvS3FYQ0xG?=
 =?utf-8?B?enF3RkVmeEdWdjk3SHo0L3Fsb3N0UWZYZ2Jad2t1NEdCSHVoSEdseklYZnFH?=
 =?utf-8?B?c2VLc00vV1YrZ2V4OXNYMUQrbkxzYWNJMFY3ekgyTWlJR1JSeFBoMDdIVkU2?=
 =?utf-8?B?MHI4WGF3b2x4b3B6WHdmazZqa0xiby9DQSswNE9WSW1DN09iSHBIN0FxUVU0?=
 =?utf-8?B?SmVrcWxLZ0NyOGwwNXFiTlozV0Z1MENwTm9LbURMdStudkdTZ2Q2Y0hrSVFP?=
 =?utf-8?B?YndxQTB4NDh3WmZ1cVMyRE1vTWE1Y2h0cGdRV0d5NW9iQ29WY3hGeFJyQ09k?=
 =?utf-8?B?RVpNS25rbCtTbnJtU1FDQlRyWEhuSi9DYzExdVpHbTF5S2NxUFZ0L2U1L2dS?=
 =?utf-8?B?dW1jb0RwRnIzcm9hWXVRcEZFSXEzTitWcVBaRjdZcFhrbXh1aDYweGVyU0Ur?=
 =?utf-8?B?aFRpQ25SYmtFMkVoWFhwbkhrR1F2SkNkUVFvQ0NBZk9jeWtyOUpXZ04xQmNU?=
 =?utf-8?B?eFhIR1NvTkZOZGZieW1Fc29LZFdsMHNrWXkvVGtmbmtJaERLZW1DZ3FjMVBC?=
 =?utf-8?B?YkxQRWU5N1hTS3Z3OHA3dnk2Zk4rTUg4ZFBBYlVvZURuMGYzbUIrN1NwT3B5?=
 =?utf-8?B?djRoZy9uYUVBeld2WnpGL3pMWnpWRU0zWWpJcFZnNzVaWE1lMnZNVXhCc3VZ?=
 =?utf-8?B?SXdpcEJ0eHRjVFRRRHlkMDF0Nmlac0Z4em1iUGRnUlFzYWh6akhvdDA4UnRF?=
 =?utf-8?B?RWVYa2dGYjdTSmdQMTJlVlVUV1pPbkZSZ0crZnhEc2pvT2U3OW5sVEYvTm9D?=
 =?utf-8?B?TVFNcVphcmc5c09OY3B4Q0s4NDVRTnJXSGVUZHRuSEd5VUQ5RUpKbDlBVUV5?=
 =?utf-8?B?MThNMzBDK3d3OWhGZUtNeXNVeU04M2xZcVRRSmh2bWRwSkJ3d21QME1Ga2Np?=
 =?utf-8?B?dlZQa0VqZndLaEVrWFZaOVlETlNMUWlXbXBBalRYcXRZdFA2R1lQV1JlbWFF?=
 =?utf-8?B?bVNtR3NCNVpZZ05KMDFHTk4wSWJLWCtnbnlJVmlBMjdWRWF2am5YQ1dybEtm?=
 =?utf-8?B?OWR0OTNMYmx0eFVwQ3RDYWxuUkxCMmx1ZnlQWklEcC9BaU5oeTdidURObzR5?=
 =?utf-8?B?aWE1NTZlMU9uaGwrbE8yVGZzbUovRytGY0YxcDZqTGR0REFFR1lYdzBQbkN6?=
 =?utf-8?B?YzRlNkN4Y1VCQUdtWVREUXBCUnFySWZCZTRVQjVxZkpDcC9CT1l5ZmxRTU9a?=
 =?utf-8?B?THE1ZlV4WCtSL3JxRnQrN2JmSG81TTAwOVlYdzR2T3V6elNzcU83bHFDMTIr?=
 =?utf-8?B?TzdPRnVxUzNZZmdRQjZ2UjR0OTFCREtsOFN1U2lhYmVKVHk2bmpjWEhCbDU4?=
 =?utf-8?B?VWpiUmsxSHhtL0lsRi9OQ0MwU1g3bUFTUW9IWGJMUWN4Sm5zeGxLODZYTFVm?=
 =?utf-8?B?eEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <93408599F09F744D9B7A6DA01E6A4052@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d72c26-9036-43f2-eb27-08db0579cdca
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2023 00:01:30.4241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uz7xrfD6GSQuaxM8EsMAP/Y5Vvg9pIPbCIei51L5SbxSPy83T6oy4QzG1WEtOap/TSbti+vPc40tZ7ysAT1g/zue4vkbJ2PG8hM5UXUy+js=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5200
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>, "jdelvare@suse.com" <jdelvare@suse.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@kernel.org" <stable@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDIzLTAyLTAxIGF0IDE4OjE4IC0wODAwLCBaZXYgV2Vpc3Mgd3JvdGU6DQo+IFRo
ZSBmaW5kX2xhc3RfYml0KCkgY2FsbCBwcm9kdWNlcyB0aGUgaW5kZXggb2YgdGhlIGhpZ2hlc3Qt
bnVtYmVyZWQNCj4gY29yZSBpbiBjb3JlX21hc2s7IGJlY2F1c2UgY29yZXMgYXJlIG51bWJlcmVk
IGZyb20gemVybywgdGhlIG51bWJlciBvZg0KPiBlbGVtZW50cyB3ZSBuZWVkIHRvIGFsbG9jYXRl
IGlzIG9uZSBtb3JlIHRoYW4gdGhhdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpldiBXZWlzcyA8
emV2QGJld2lsZGVyYmVlc3QubmV0Pg0KPiBDYzogc3RhYmxlQGtlcm5lbC5vcmfCoCMgdjUuMTgN
Cj4gRml4ZXM6IGJmMzYwOGYzMzhlOSAoImh3bW9uOiBwZWNpOiBBZGQgY3B1dGVtcCBkcml2ZXIi
KQ0KDQpUaGFua3MgZm9yIGNhdGNoaW5nIGl0Lg0KDQpSZXZpZXdlZC1ieTogSXdvbmEgV2luaWFy
c2thIDxpd29uYS53aW5pYXJza2FAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiDCoGRyaXZlcnMvaHdt
b24vcGVjaS9jcHV0ZW1wLmMgfCAyICstDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9wZWNp
L2NwdXRlbXAuYyBiL2RyaXZlcnMvaHdtb24vcGVjaS9jcHV0ZW1wLmMNCj4gaW5kZXggZWM5ODUx
ZGFmMmU4Li5mMTNjYzQxNzBmNTggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaHdtb24vcGVjaS9j
cHV0ZW1wLmMNCj4gKysrIGIvZHJpdmVycy9od21vbi9wZWNpL2NwdXRlbXAuYw0KPiBAQCAtNDMx
LDcgKzQzMSw3IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3RlbXBfbGFiZWwoc3RydWN0IHBlY2lfY3B1
dGVtcCAqcHJpdikNCj4gwqDCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxvbmcgY29yZV9tYXggPSBm
aW5kX2xhc3RfYml0KHByaXYtPmNvcmVfbWFzaywNCj4gQ09SRV9OVU1TX01BWCk7DQo+IMKgwqDC
oMKgwqDCoMKgwqBpbnQgaTsNCj4gwqANCj4gLcKgwqDCoMKgwqDCoMKgcHJpdi0+Y29yZXRlbXBf
bGFiZWwgPSBkZXZtX2t6YWxsb2MocHJpdi0+ZGV2LCBjb3JlX21heCAqIHNpemVvZihjaGFyDQo+
ICopLCBHRlBfS0VSTkVMKTsNCj4gK8KgwqDCoMKgwqDCoMKgcHJpdi0+Y29yZXRlbXBfbGFiZWwg
PSBkZXZtX2t6YWxsb2MocHJpdi0+ZGV2LCAoY29yZV9tYXggKyAxKSAqDQo+IHNpemVvZihjaGFy
ICopLCBHRlBfS0VSTkVMKTsNCj4gwqDCoMKgwqDCoMKgwqDCoGlmICghcHJpdi0+Y29yZXRlbXBf
bGFiZWwpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FTk9NRU07
DQo+IMKgDQoNCg==
