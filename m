Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DB077351F
	for <lists+openbmc@lfdr.de>; Tue,  8 Aug 2023 01:40:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aN/953Jq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKXql57cCz3dg7
	for <lists+openbmc@lfdr.de>; Tue,  8 Aug 2023 09:40:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aN/953Jq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKXFz6whXz3dJG
	for <openbmc@lists.ozlabs.org>; Tue,  8 Aug 2023 09:14:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691450072; x=1722986072;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=hGiBr79Dl1qRdBG5MRX0y7bUDla9p5H4LNqQ0iGt0gY=;
  b=aN/953JqaFLuK7UhPzXWAFF4WTC7WXxer/3Jo/dDuYbrrf4OK5mH99XH
   kILn8FjCc4xP4upN+aLd1AJOCZCc2tBFnFfqgUljDyRpsG/+4UpNxB3Dp
   aXTV+WhlEv/4QavVl9vML/nt80eZfWhvKMzRpb0NkitG1ZX8tKtK2tJwe
   pEe9W5bw8eMG/xVp8/DHmb//kGm1vJPaGtRRppU90N2V4g9qzpPH40tua
   PHG17GycFmWr0i+I3ijZhCLf4jE2YJf+vSiMfWGE+861x8cqo0HnQYlKi
   OiVWq0K7Uzf8Bn/sfVD+NptVa+9c4N8Iiz1N2LMzBSVi+ujsNSQncU31q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="373424807"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="373424807"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 16:14:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="760680039"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="760680039"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga008.jf.intel.com with ESMTP; 07 Aug 2023 16:14:17 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 16:14:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 7 Aug 2023 16:14:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 7 Aug 2023 16:14:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKfKIry7+agKw+pRgNtJ34isgIeeoYC9IZMRMnkrKpMyxJhIoDegSgULhRaygqOkmIlDjXrfqtop5Z2Pf3MMTA0BXu1cL/VUADZqUhRLLMTM0yml/nXxDQ5r4T6PL0NDM/MIoiwuDJ9ciJ1zkhaoC+XLhtsgcrD5YTJZfu8ekZOzaUdQPLHC1ZWfJxpfB/ZFITrvr6HXlo8eOfmmq+U+DYSVJeuFrRvtLPeGMYK84t+B40pj17tVEgBmAcFB4HViJl7XRTggyhlmXkGdOMEODCsNEaTkuoCZoCp+9cE++8NHp+N6h61zz6VEb8CAHsqSGYJ/kXaGRT/urvoT8U4EsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGiBr79Dl1qRdBG5MRX0y7bUDla9p5H4LNqQ0iGt0gY=;
 b=ZxlNOHxtDAgpn/GXX+dwVI4fDS4aZ7roNNI1RzWLnPHtrP6gcUgQJa5MXm+UO29layrq1q3c/gRjfCVVhXJENClIZqJZlxyE7iOD5g2IrGxhuZINKM6LQdnEX7uk7XPGRdhzRgQ9JdhvVqHoJ8TCbEv+MBH+0huNpILckCZ18T3gokW5qbRW5FXenvzdWp4l8u9yrd75Ncj3ByrHCDBHaNbOVaQwhQIYO9MYrSs5tvSl13jFI2hWUJ8JWyBAgJ3MChoVEl5FiD+4kK8KKPifbUALkVcxBTA/5r85G9TMkHpxQHTXtvjTGUMIJ1CgnkoQT7O21goURLMqTlO7a1DHZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by PH7PR11MB7500.namprd11.prod.outlook.com (2603:10b6:510:275::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 23:14:07 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::95fe:e2ee:d733:6399]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::95fe:e2ee:d733:6399%5]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 23:14:07 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: [GIT PULL] PECI changes for v6.6-rc1
Thread-Topic: [GIT PULL] PECI changes for v6.6-rc1
Thread-Index: AQHZyYTdEO2feWJQNkKTUXERzP/xYA==
Date: Mon, 7 Aug 2023 23:14:07 +0000
Message-ID: <8a519c13e54deeb81fb07c8f2d3936e493820330.camel@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5823:EE_|PH7PR11MB7500:EE_
x-ms-office365-filtering-correlation-id: b5b438df-bff0-4007-b248-08db979c0018
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b9dx/omREQytGWrR4GVl1Liy50qTiPbCTW5HCEInceJ20eoOVMx++crySPDiS9vyEA1X9p/bbFHqefa01u7hufMFCEP3o9lmUkCKOA2iHG3f4T65i7FIztwcueh0piY0h55UufQw/P0z87Mb31hBfb7gvK9uOPH4LIcKO42WMzjuJ4aslmyv9Eo4gLBUVzFonuQ1/Joa8nDrt2prmnCPJUOBrqU8pTDwceIncxYOEReHfsjaZ7xLUPhTli6z0JMjx5GQR53rtnjVsxxnKK0wn4efINYwx080gzDS630sB8O5wtI3qaz9qAZw69+oCkGeYHM+XZ+ZY+WDzCqxiXn5PUW9fDqsBkCjYRiicMqES0u9Cp3bXWJC0kEbRWjxXUirCq6OuI8VwFXXk2fz9iSh7nYSOnk2Q2Sk/DhJ+u6kFoYjN3RB4HGGhSwml1uMYgpTFd4Wt6quUARmkf+U/t42ONQiNubcq3vDewkKN784Jz4XBA6jL0sOy8lX8rgSv1MjtevvjUeYj9Plsx0K0uWrIC80bLfILnPKbOSQQkw8lonYTeYmx6S2MTl1v3Zv8kQFVARogjoowMsHodZbH0DGvCwtbclH4aC8teCAq7fp1EFbsyZt2Jw4C4ZkKOeG8gjAhb1iFm6E4f7139Xhgp6FLHjt9irj+sBvYKzysIDpFmHZOG047Miwk/rfp8OdIMWg
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(136003)(396003)(346002)(376002)(1800799003)(186006)(90011799007)(90021799007)(451199021)(83380400001)(2616005)(54906003)(2906002)(6916009)(4326008)(316002)(5660300002)(8936002)(38070700005)(8676002)(76116006)(64756008)(66556008)(66476007)(91956017)(66946007)(38100700002)(66446008)(6512007)(478600001)(82960400001)(122000001)(71200400001)(86362001)(6486002)(41300700001)(6506007)(36756003)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGtORU9Wa2RaMjh5Yk5FQlNxZFV0UHZ4dytZU0UxQk12RXMxU3RMRy82clFh?=
 =?utf-8?B?cWFWdHRrOFZ6SFNFT2NjbEw5OTJ0dGlVYlh6Q2VrZDZmTFgwek1INk9FeUdu?=
 =?utf-8?B?SDZvMUw4WCtQdTliQVVEeVdNOVcrMDVIelRTSkh1cG1idUtHMndrWnVZSkJi?=
 =?utf-8?B?QSs3UjBiRWRUMGRXTEN2RTRod0ZkUFBZMW9DK3l1OVdXQ05DQU1yUlVoVlkr?=
 =?utf-8?B?ODZkOVdEaFBuVnQ3SzVUNFNxUjI2Zk4vYlg4RUhXZC8wc1dlKzhIRW4veC9L?=
 =?utf-8?B?V01QK2twUFpBK3hSelpDcWhpTjl6dCtEVkNpbEZCZHpkUzJDN3FNMFJ1Mzc2?=
 =?utf-8?B?amI1bk5iSHZsNVhRWHBZKzd2b1VxMVBXTVgzMGRHWStNRnFqSG50V0pjMk13?=
 =?utf-8?B?NEdzNVRpQUk0TG5RMGtMYzd2T21EZHUwMlVwVUt3MFlsVEUvTXVmTmJRVHRS?=
 =?utf-8?B?eTZmS2JTUlhaeGFUK1pwR3NrRHcrRWdsZHh3ZVZqK2x5WG56WG5SQ2wzKzFr?=
 =?utf-8?B?SFJoVFE0anZJR2hSd0dmc1E4bW9HOWttTjB1a1dtQ2p2bW1BeVpBTU5hZzcw?=
 =?utf-8?B?b3dhRlp4cTlsS0lkS2tDNW9jeUFkMyt5QWo0bWhHR0V3VEhDVXVrNzFXWGti?=
 =?utf-8?B?K0Z5YmVOZ2xrZVYwS0oweVk4VFdPRG1qRCtJUlMwanhHak9KWUJyR1dOZi9i?=
 =?utf-8?B?Wlo2SHNEWUhtSmdVSEZycG9qck9NZ1BHM2oxbzEvVzhkRk0ydkhJMWFXelVF?=
 =?utf-8?B?UWJzS1lnclQzMm4rUzhKY1FpbzJYVVVPYldTalhCbE1TMnR3dXVjd2RhMlF0?=
 =?utf-8?B?WkNTdmJ0Y3g1cjBuWVB5bGhwR3NHNFc5ZWQyanpOM2tOTmdrMnF1Vzg3UWR5?=
 =?utf-8?B?T1UveGJ6b2ZnMzB6ZHZ0SjBOK2tQMXZwbElmb01ORkRpTkk4WDVrb1lOd25Q?=
 =?utf-8?B?VXBpTFN1Qk1BSm5Bb2x6ZEZtZ0xHU1ZyQm9nSVhha2NYUi9iWnZhOGZDdjkr?=
 =?utf-8?B?N1dlL3VsZXc5aDJIeWYyTWNGYWh2MmVrZ2E0WW9YYU5neWp5VGk3Skl4NzNP?=
 =?utf-8?B?ejA5NFBTa2JSYUF2MGJqYmRpM2pPemdjSEJMMm5NYmYvcnhYVlpQUWU3b1VO?=
 =?utf-8?B?QWNBODRuNmJUQU9QdWZxT214c0pWS28zRTN0K0wwWnFwZmIvT25uQldWLytF?=
 =?utf-8?B?N2tFdDNHTjlNa0Jqanl5cUxhanRhNE5HZVVINno5NmdxS2N3NmhEcG54VFNt?=
 =?utf-8?B?SzBnWGRDWE5mM3R6SzFWUUZqZUpsL2xSQXVqdm1qQmU0cUpHZ3pNc3lreVAr?=
 =?utf-8?B?K1ZudHVlMk5hQ2k0Z0NoVzdNUXAwbm5lcGlVU0d3ZUNmRkRuNlBadTUvYzY0?=
 =?utf-8?B?b0VjdGVRaDRoK1JoTW1VZUJhNW5qK3FsT1FsLzNWblprOTJuWWtwN2xmZXhv?=
 =?utf-8?B?TjdjMzhIUWp6WDlwYXIwUTRKV2pjaXJTUWZ1RGpSWG1ndDB6UzdyT0h2bU12?=
 =?utf-8?B?TldWbmRSQk10K05OellKTFN0Qk8vQkRMY2JRSndwRWdIdkxIck1vZ1k1NVN4?=
 =?utf-8?B?aUVjNVpmdVNyRGxGUDc1SEhyWUdsZXBDcmlGTGl1cURlbUNLRmRBNXo1T2s4?=
 =?utf-8?B?QWllZUVVYzNoYzlDZ3JIMHlOYVZWcVN2VGNSZkcvSDZ5SVREN2tjdFdjMGdY?=
 =?utf-8?B?b0sxU0xodWN4QndQakhPdklyRitQaFR6VHJ1MUVLRFVhU0dYUWFNSmNucjlk?=
 =?utf-8?B?WFUxV09pdFo2bEpodkIySDRTU2k2enVvZXY0L1l4Nk1YUnRZRkJvWGZLVEVX?=
 =?utf-8?B?WjBmcnozdHlRcE15QWx0UzRkNDN3NWt2bkFWN3RNazF2SzM4S0hHQzRVS2Vh?=
 =?utf-8?B?NWFLdG5Yakh5WThhRTRNV2VuZDRLRE9rWjArUzZUcU12UHJXVmFKcHVuSzI5?=
 =?utf-8?B?Z3kvY1RGYUxoeThZUEJZMnZVV0gxSnJOQ3V1RHlzZXNsSTZETzVhdzZWcTF1?=
 =?utf-8?B?QkN1U1J6bk5ZNFNtVElSR2ZRZ0lvWHgrNXdQd3N0L3Q5K1RncDFrYUY2Y0Jy?=
 =?utf-8?B?RS9zMWdYdmJHbGJYaDhydlZReEUyaSt5Vk55bzJGM1pNR0FnYnQ5dURaYWZC?=
 =?utf-8?B?RUo2Ukx5VXBqaWx0dUxZNUJqdzNwTXpEU1p0QXRGeTREU0RTaGY4bC9vbWV0?=
 =?utf-8?B?Unc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7EF0772BB1C3DB458468FE37F4062CFA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b438df-bff0-4007-b248-08db979c0018
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2023 23:14:07.4882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gJuGnxMxsXaQh/fJSatgupI6FPtMsSBs10XksatJYHhnDcMtNwSCJD0gIPhvfQUOkRI2DJD0srEtEJEqRBcAe0Q4ioTtSCS5cZe0ODvZoPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7500
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

SGkgR3JlZyENCg0KUGxlYXNlIHB1bGwgUEVDSSB1cGRhdGUgZm9yIExpbnV4IHY2LjYuDQoNClRo
YW5rcw0KLUl3b25hDQoNClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNWQwYzIz
MGYxZGU4Yzc1MTViNjU2N2Q5YWZiYTFmMTk2ZmI0ZTJmNDoNCg0KICBMaW51eCA2LjUtcmM0ICgy
MDIzLTA3LTMwIDEzOjIzOjQ3IC0wNzAwKQ0KDQphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVw
b3NpdG9yeSBhdDoNCg0KICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvaXdpL2xpbnV4LmdpdCB0YWdzL3BlY2ktbmV4dC02LjYtcmMxDQoNCmZvciB5b3UgdG8g
ZmV0Y2ggY2hhbmdlcyB1cCB0byBkN2M5OTg5MGZlMDZhMTcwYzc3YWYxMmIwYzEwNWJhYmIzYTQ3
YTA0Og0KDQogIGFybTY0OiBkdHM6IG51dm90b246IEFkZCBQRUNJIGNvbnRyb2xsZXIgbm9kZSAo
MjAyMy0wOC0wNyAxODoyNzo1NSArMDIwMCkNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KVXBkYXRlIHBlY2ktbmV4dCBm
b3IgdjYuNi1yYzENCg0KKiBBZGQgSW50ZWwgU2FwcGhpcmUgUmFwaWRzIHN1cHBvcnQuDQoqIEFk
ZCBOdXZvdG9uIGNvbnRyb2xsZXIgZHJpdmVyLg0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpJd29uYSBXaW5pYXJza2Eg
KDIpOg0KICAgICAgQVJNOiBkdHM6IG51dm90b246IEFkZCBQRUNJIGNvbnRyb2xsZXIgbm9kZQ0K
ICAgICAgYXJtNjQ6IGR0czogbnV2b3RvbjogQWRkIFBFQ0kgY29udHJvbGxlciBub2RlDQoNCk5h
cmVzaCBTb2xhbmtpICgxKToNCiAgICAgIHBlY2k6IGNwdTogQWRkIEludGVsIFNhcHBoaXJlIFJh
cGlkcyBzdXBwb3J0DQoNClBhdHJpY2sgUnVkb2xwaCAoMik6DQogICAgICBod21vbjogKHBlY2kv
Y3B1dGVtcCkgQWRkIEludGVsIFNhcHBoaXJlIFJhcGlkcyBzdXBwb3J0DQogICAgICBod21vbjog
KHBlY2kvZGltbXRlbXApIEFkZCBTYXBwaGlyZSBSYXBpZHMgc3VwcG9ydA0KDQpUb21lciBNYWlt
b24gKDIpOg0KICAgICAgZHQtYmluZGluZ3M6IEFkZCBiaW5kaW5ncyBmb3IgcGVjaS1ucGNtDQog
ICAgICBwZWNpOiBBZGQgcGVjaS1ucGNtIGNvbnRyb2xsZXIgZHJpdmVyDQoNCiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGVjaS9udXZvdG9uLG5wY20tcGVjaS55YW1sIHwgIDU2
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQogYXJjaC9hcm0vYm9vdC9kdHMvbnV2
b3Rvbi9udXZvdG9uLWNvbW1vbi1ucGNtN3h4LmR0c2kgICAgICAgICB8ICAgOSArKysrKysNCiBh
cmNoL2FybTY0L2Jvb3QvZHRzL251dm90b24vbnV2b3Rvbi1jb21tb24tbnBjbTh4eC5kdHNpICAg
ICAgIHwgICA5ICsrKysrKw0KIGRyaXZlcnMvaHdtb24vcGVjaS9jcHV0ZW1wLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTggKysrKysrKysrKysNCiBkcml2ZXJzL2h3bW9u
L3BlY2kvZGltbXRlbXAuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDUwICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrDQogZHJpdmVycy9wZWNpL2NvbnRyb2xsZXIvS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxNiArKysrKysrKysNCiBkcml2
ZXJzL3BlY2kvY29udHJvbGxlci9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICAxICsNCiBkcml2ZXJzL3BlY2kvY29udHJvbGxlci9wZWNpLW5wY20uYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgMjk4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKw0KIGRyaXZlcnMvcGVjaS9jcHUuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDUgKysrDQogOSBmaWxlcyBjaGFuZ2VkLCA0
NjIgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcGVjaS9udXZvdG9uLG5wY20tcGVjaS55YW1sDQogY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvcGVjaS9jb250cm9sbGVyL3BlY2ktbnBjbS5jDQoNCg==
