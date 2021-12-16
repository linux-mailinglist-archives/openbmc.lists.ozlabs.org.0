Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15543477A37
	for <lists+openbmc@lfdr.de>; Thu, 16 Dec 2021 18:15:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFJdf6Lr5z3cWf
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 04:15:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lV3P0KTc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lV3P0KTc; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFJcp6tkMz3cCS
 for <openbmc@lists.ozlabs.org>; Fri, 17 Dec 2021 04:14:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639674859; x=1671210859;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1TxN/rLyBRHlggDBRdiTeyiZisvLw6waXa2YHxZ3FUQ=;
 b=lV3P0KTcaLyQ6A4fxrw2WxgWOKD4XlBCv4bA1ILtYUb8iBjlBCSBkO4y
 Utm0G6sUJkbfSjBnEAEobVH4aCTRT9hqg4N1xAUOOZoWAKtATbUymrO7m
 vQpiPSBirEP6zZY8qSe+g6gQUuDAWdfB8sR92g2R16riAVxa6U4b7ljWc
 MNY502FAu28T3KfyF8+9FFlyjIbZNhid15CbaZm2AbaOU40ZkdGA69Sh6
 P3vUAuHNMOfpcQL637WLHMMA47J55Z1sxBnxjN+2dDiNQNB0Q5gNvRDZb
 fNFRbKeAzk7sKEqUoTidkIkjOvmwfGjhfZ51zIq3uGNp6D1gvVBGmnFfg w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="325827476"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="325827476"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 09:06:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="756123527"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga005.fm.intel.com with ESMTP; 16 Dec 2021 09:06:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 09:06:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 09:06:35 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 16 Dec 2021 09:06:35 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 16 Dec 2021 09:06:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSCHgcaNXZXxRf8bwuEMhHPG/0kQE0JOuBDKNJipkCJzk3gjF+xWK37tOkzqLPO7AfzcEYudfnglSw58AHifv/PV529b1nvNrtgZOEI22BfZIDe3VTPwcuJkn63AjTOsGUrvUQqb12MiYaWpeLGNW+58VJCVuiqL8qS/jSkhwidXH0dD20p9ydIAiwunSNnYOWtT1sv/XF+Dgt0SRo7e1KZQai5F3P9bBRC60I8jXKcwlq352NkluRfVDXhZaaWvF8J6OW2hP9FCGp28x5cWBKQKjD2zeBVkSF3ceOaQ7SHBxe2xRzd1aOjT2Bkc7I7DUsOcIlDldcX37ohBbzSWEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TxN/rLyBRHlggDBRdiTeyiZisvLw6waXa2YHxZ3FUQ=;
 b=ZAL4mHQRg7xYXqlL61qV9yIK//NZ/9ge/TMHaJjm3utA38VRbJE4LHe/U2w5fAGj1O4YMy3gzNQtKb1zgwSUNwcJzKdRXdnKwQS0UdqJbHyPgpgerkZ81dFKQNr2ajX63DLvDqlVdrIq0hAPmS+woYrV2tuIU6UszKXJAG80zHUOWyMFXb2kN97vbOoDXxHCPYeCYeMFpWeqymYcQMtOu+qLsBWlDn9+M8xZOozEZpxsWVJuYBHpyTXybejvSYppId4Q6BhOqgAzWhnydgqVQAZ5yr9Fm6Nm/jLYScKm3GHPDxj2gYpD/yBISSIEt5Fs0Sml0JzeADzzhLj4RNN5Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by MW3PR11MB4651.namprd11.prod.outlook.com (2603:10b6:303:2c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Thu, 16 Dec
 2021 17:06:34 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::1d1b:2541:5263:68de]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::1d1b:2541:5263:68de%4]) with mapi id 15.20.4801.014; Thu, 16 Dec 2021
 17:06:34 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "venture@google.com" <venture@google.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "titusr@google.com" <titusr@google.com>
Subject: Re: Introducing PECI support in Qemu
Thread-Topic: Introducing PECI support in Qemu
Thread-Index: AQHX8paQR3pN6hsRcEWWsg0jTofRS6w1WVwA
Date: Thu, 16 Dec 2021 17:06:33 +0000
Message-ID: <00c14e7209eabffd78bc36d3cc4ac0d4b37eba00.camel@intel.com>
References: <CAO=notwUAezOS58BBPL4-fzENrUj55Tbdi1Lwvjz1Y_vpc69uA@mail.gmail.com>
In-Reply-To: <CAO=notwUAezOS58BBPL4-fzENrUj55Tbdi1Lwvjz1Y_vpc69uA@mail.gmail.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f673bdba-9a65-4e3e-43b8-08d9c0b669ca
x-ms-traffictypediagnostic: MW3PR11MB4651:EE_
x-microsoft-antispam-prvs: <MW3PR11MB46513F4B7E56C6DDD4329176EC779@MW3PR11MB4651.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cUQNKllQqfkGOZNy+ZWCbAm4nT4/wPN/G7bPDcQAX+J/JAoafeKhX/6gWA17IfDnaksXo9LKxjFKAY36DVwNAnlb9ji73nyG3Toej5MjCi/cOBBQXHhWGLOxeM8/3oVtMbX7Dx+Gt8lXONks9oDVzlkM+LJAlUXu3lCqZrLhf6PgJ/OzkpzeXbHCkYPtv2ct5gZPVE3HjRcxEWt7hyWZvpGovB1U0JnbRklfGpFHziV1b6EgOM1UT+zb4S6lFZSgnU6lPGrlRGy7bk0V8MyIHu2CbbuO1WEWr3uBSFdGanV47dpRJ4wXs8X5QWTcpqqFXozlVsw9AmFhALQo0gin8wyOMSKHpvN/K4iyHeeRJfp8toh9g9Rh8Bj/7Ah746vw0qUG8qGUZlWWSQcg4dhLNHXw7ke+8cJvhyTLTlN9D7t0ehu/jALd7Dzru7X1EXJZS6bjzz2chR9Ca5MFjQ44W/KC7atQbWRtb8EZLy+aHwQmnb4tKd9vxEqhfRmmyiyTrZMqIoZzJ1f9vUwgLZ8aOuElnpKbmavaoqayc1vJc54rUHbUQcuVsIqGZuAl9TgzfV0ltS2mNT5uZMd630CnsUb/zMc+4jOLEPWNu9N0SPEaB8baR/wXBd52PAASWaLlz+ED8mgw1ZR7+aoP+PG/p1faIl8bZbQ6v0uZJTCwOW/GKcDyq8/DBqgRkxjLQhgJthcYsLGJRfioJgMxBpDFS8i1iIBI514BJE72xmMgdccD/QpZFm4bFDcU1KKAm0jBoiazEwFoS2BP2SqiPlVqihwGN0u3wt4OPugT8UImkl0woBQcbUoWbFPJXCEKDnTv3/ia0mQqyIZpJrBZTsz1xw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5823.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(64756008)(8936002)(4326008)(66446008)(4001150100001)(966005)(2906002)(316002)(2616005)(6506007)(66476007)(83380400001)(508600001)(86362001)(186003)(82960400001)(36756003)(66946007)(71200400001)(76116006)(38100700002)(91956017)(6486002)(122000001)(5660300002)(26005)(6512007)(110136005)(38070700005)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkMxMnMveHNwRnArK3NpdTd1N3drb1pualhaa3EyNXJoOG9wSGh2MXR4VFBi?=
 =?utf-8?B?NzYzM0tpdWJBK1Y2anRIMmwxMldzMDV2WmJ1ZVc4dHJlaEJsRzdoaE1NZHIr?=
 =?utf-8?B?aU5ocUtnYXQyWEZpckRJQ0tSVmtGUjlVZWdpTVRNMnlGVkplV0VGeUw5U05Q?=
 =?utf-8?B?SUNGQkxVckZkVkhzQnhUOTVSSW9TSStkanVDaW1uQWZ3ZjUxSXk3elBmQnlj?=
 =?utf-8?B?SEdpeGV3ZWtWM2gwcHFXd2owZS9USDhLQnJMalJaMnE5Qmt1M2ZOcjBpQjU2?=
 =?utf-8?B?YmNCeHFRelZYbWs5NmFMVkZqUHJyMlRRVTRRbk0rOUZ5U2R2SVZSTjVQMkpK?=
 =?utf-8?B?YnRSVS8zMUdxMjBsQ212M0ozOEpTQnRIM2ZMdGJGd08xN1VPOVhsUFQwYnpq?=
 =?utf-8?B?SStJOERwOWFqUDRIVG94OUEvdjcxZVVuUU5JbkFhbEF5bEt3L0JXTEFyS2U2?=
 =?utf-8?B?N3hVejB2QnFPd1lpSzJaNFJhTFB5SjBsOXg2YUpCTmJGclRXbHZIaHBtT3NQ?=
 =?utf-8?B?SjhORzZTTUFyeUEyUS9kclY1R0gzNVkvTWdsVUoxUy9QS0NBVEFaUVErMTNS?=
 =?utf-8?B?S0puSERFWStFTDJOYkRvWDZWVktzTXlramdaWnovMFVoWFE4Y1llOS9YSnFP?=
 =?utf-8?B?b0tFQmpiUFltWGR4VXl6S0QwWVkwUVI0UWw5UGRzN0k4WGUzc3g4WlVOUXdM?=
 =?utf-8?B?alRScTFZOFI1dzZSUWQwamNWVjVzMUFzWHUrV1cyRGV0RGlEcXMyRVI5ZG9O?=
 =?utf-8?B?TDNYLzFZR3ZacXU1enk3a3ZZc3B6OWFTTmZPRUt1VkFCc2gxSG5DRUlNUVBy?=
 =?utf-8?B?WXozemljcjhwNktXOGFJU3FwMHlWZ1JGNmVZcitQRitmNEd5WXdVRGg5S3hH?=
 =?utf-8?B?ZGM1NllVQTVPR3NUWFhSNlVpbVpMTXBXOUE3MTJ1TXVnc25VV0MvaUlOQTIw?=
 =?utf-8?B?N2hHc3EzbklDc3pzWDRaT1hGdEc0ay90bnJFQlkvaU5RbzNWNHkzTWdRSC9m?=
 =?utf-8?B?UTdRbDhyeE5rZUZpQXFiVGhnTE9vWVQ1Qi9PR3AwYnlzenJYZjNMUE1aQTZs?=
 =?utf-8?B?VXNBTzRDNkJveWdKYnd3MDR2STVrNlNuVXdBRzlpb3FGWDJBeWFQdldJYlR6?=
 =?utf-8?B?ODM3OFFYeWJpYzlkRW0rSEpTNmJOSm1DRlhjbzVzT25nYjFVY1RtaEVQTFRV?=
 =?utf-8?B?ckgyNkRLYld5M2d4Vm1VYytlZEY3dXR2RXNrbWRLVGgxbTNZZ2t0QlVxNkp0?=
 =?utf-8?B?RXdrM2Y5dHFVR3RWNEVMaUdqVU9sbDJNWjMrNW9DWVQzMUlUbHlDRjBsYXR4?=
 =?utf-8?B?YU5zeDB1UWIwdGlsbE1DSnhGYWRwNm1uUHUrdUlKV0hVaDJ4SXpBRlMrZFFa?=
 =?utf-8?B?cHNVeXowRU91aUlOQ0xyOW5kSGlYSndWbkcxMUtqRkNZYml2aWZjR3lDTElz?=
 =?utf-8?B?cVA5Z2ZUTHZvVHlBN0I3bjdaRjZxOFV3NFplVnB2b09BVno3RkZBcTRNamV0?=
 =?utf-8?B?SFl0S01EMklhZzJoSGR1OXlBMjFweEhtWVh3RlFDS0xyOG9DSmhWL0tVdDAz?=
 =?utf-8?B?b0RxSGtJSll5RlMwUExMR1FSVTZEZFdpei9ZZ2w4Z2lvOFdVbi9qRHl6OUVo?=
 =?utf-8?B?N3laV2F3TGdTNVB6M3hGbGhvNDlpV1pCODhMN3JmUm9ZWGlpcFlrZGF5bDJl?=
 =?utf-8?B?ZEptc1dJUzIzdDNadW4wQ29jbktwYy9aTzBaR3lRekxBRVp0YVlnMm5BOWhL?=
 =?utf-8?B?TDViWU56U1F4RjdSVThmMSt3aUJaQVlIQmRTUEg2R1JxRW9IY1NOMXFZL3Yy?=
 =?utf-8?B?bWxrR1ozUno4SDBIOUFnQWxQREtUZVFIbFdMOEdMZllPNk16b1poRTl4S1FX?=
 =?utf-8?B?SHIvL2pIU08zcmcrUmxhZ2dHZjNCYnZ1YWpXby9OTnRHcTV2Z2F3SW0yUmxt?=
 =?utf-8?B?ZVoxWktoSVVFOFpzbzVpT2kzQmMvSGdDcmRCeEd2Q3ZXeHBrZElzRmpZWHho?=
 =?utf-8?B?UkhNLzEvODZ2MTc1RG5hbElZK2NDd0hJaHlsemxBU1VzQklQbDQ5WVFyL3R2?=
 =?utf-8?B?WEc5cGZtZlU1Yk02S2lDZlNsNFRJSjVEUEpmZW44aU8ydllYWmplVUhZUmQ5?=
 =?utf-8?B?U0dBd05YSUZGVHVhZUJlUGFkUVhkMTVtOVRRWmFFVVpSTmduOXBFa2lJenEz?=
 =?utf-8?B?WHZyTUhvMHJicmhlTlhnNTdKeVJsemRVdlR0K2hFWTlwbnE2dnVZc2thcFZF?=
 =?utf-8?Q?4/zV9wJxOtEkwYlWwbFDO0T/ywbxhA6AL5a6lakFNE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9035C102B649E44E9C66BF84D53695A0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f673bdba-9a65-4e3e-43b8-08d9c0b669ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 17:06:34.0154 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eOZ5jWmtFUgZEgu1nyr8IwbDlTWisHXVTZ5sse1wQI9pilCW26OE56zLjT8J/GItk6wmAHA342ccYokMnq/E7ZldqEEpC0fddJYs8Zu3ezQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4651
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
Cc: "tmaimon77@gmail.com" <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gVGh1LCAyMDIxLTEyLTE2IGF0IDA4OjAzIC0wODAwLCBQYXRyaWNrIFZlbnR1cmUgd3JvdGU6
DQo+IEhpIGFsbDsNCj4gDQo+IE15IHRlYW0gaGFzIGEgd29ya2luZyBQRUNJIGJ1cy9kZXZpY2Ug
aW4gUWVtdSwgYnV0IHdlIG9ubHkgaGF2ZSBpbnRlcm5hbCBib2FyZA0KPiBzcGVjaWZpY2F0aW9u
cyB0aGF0IGVuYWJsZSBpdC7CoCBXZSdkIGxpa2UgdG8gdXBzdHJlYW0gaXQgYXMgc29vbiBhc8Kg
cG9zc2libGUsDQo+IGJ1dCBvYnZpb3VzbHkgd2UgY2FuJ3QgZW5hYmxlIHRlc3RpbmcgZm9yIGl0
IHdpdGhvdXQgYW4gdXBzdHJlYW0gYm9hcmQgdGhhdCB1c2VzDQo+IGl0LsKgIFdlIG9ubHkgaGF2
ZSBpdCBhdHRhY2hlZCB0byBOdXZvdG9uIDd4eCBwcmVzZW50bHksIGJ1dCBhcmUgc2xhdGVkIHRv
IGVuYWJsZQ0KPiBpdCBmb3IgdGhlIEFzcGVlZCBzZXJpZXMgaW4gdGhlIG5leHTCoHF1YXJ0ZXIu
DQo+IA0KPiBEb2VzIGFueW9uZSBoYXZlIGFuIHVwc3RyZWFtIE51dm90b24gN3h4IHNlcmllcyBC
TUMgYm9hcmQgdGhhdCBoYXMgUEVDSSBlbmFibGVkDQo+IGluIHRoZSBEVFMsIHdoZXJlIHdlIGNh
biBlbmFibGUgaXQgdG8gdGhlaXIgcWVtdSBib2FyZCB0byBlbmFibGUgdGhlIHVwc3RyZWFtDQo+
IHRlc3Rpbmc/ICh0aGluazogcXRlc3QpLg0KDQpJZiB5b3UgbWVhbiBMaW51eCBrZXJuZWwgb3Ig
T3BlbkJNQywgSSBkb24ndCB0aGluayBhbnkgdXBzdHJlYW0gQk1DIGJvYXJkIGhhcw0KUEVDSSBl
bmFibGVkLg0KDQpJbiBjYXNlIG9mIExpbnV4LCBQRUNJIHN1YnN5c3RlbSBwYXRjaGVzIHdpdGgg
QXNwZWVkIHN1cHBvcnQgYXJlIHN0aWxsIHVuZGVyDQpyZXZpZXc6DQpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sLzIwMjExMTIzMTQwNzA2LjI5NDU3MDAtMS1pd29uYS53aW5pYXJza2FAaW50
ZWwuY29tLw0KKENvdXBsZSBvZiBkYXlzIGFnbywgVG9tZXIgTWFpbW9uIHNlbnQgcGF0Y2hlcyB0
aGF0IGFkZGVkIFBFQ0kgc3VwcG9ydCBmb3INCk51dm90b24gYW5kIHdlcmUgdGVzdGVkIG9uIE5Q
Q003NTAgYW5kIE5QQ004NDUgQk1DOg0KaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL3BpcGVybWFp
bC9vcGVuYm1jLzIwMjEtRGVjZW1iZXIvMDI4NjAyLmh0bWwpDQpXaGVuIGl0IGNvbWVzIHRvIE9w
ZW5CTUMgdXBzdHJlYW0sIFBFQ0kgc3VwcG9ydCB3YXMgZHJvcHBlZCBzb21lIHRpbWUgYWdvIGFu
ZCwNCmFzIGZhciBhcyBJIGtub3csIE9wZW5CTUMgcHJvamVjdCB3b24ndCBwdWxsIGl0IHVudGls
IGl0IGlzIG1lcmdlZCBpbnRvIExpbnV4DQp1cHN0cmVhbS4NCg0KLUl3b25hDQoNCj4gDQo+IFBh
dHJpY2sNCg0K
