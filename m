Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 827A54AC7BD
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 18:37:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JstdX1Cy4z30Qy
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 04:37:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HFbFs0H8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=sharad.khetan@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HFbFs0H8; dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jstd06pL5z30BL
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 04:37:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644255445; x=1675791445;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=D7k7rXEcwMTpYe8L0U7DpQR02W6Y/2h9AmRCHvppWrc=;
 b=HFbFs0H8DL5pemCUDGQzMbz0qIgi/W1gI4EugGmAWT/OpWJWaPgn153W
 cuJnXFGIFLLF8TzQvoumjO3JfBMR8XYnkwwgKhWcqI5SfhzC/AlhPvva7
 VUeWKY0bC/YrLmdF3NWPMOdxhSk01JRZ60HvtEp9uNCQwlP9X5lymT0PX
 MoYAwcRY2o7VMc7g4O59MpmqXpIyaHElW2WFdX4+Tzb2TVGgwa0WOkqWe
 kRrwlTaH8/wBj5Fc6Yro079VKc3DHTrzgdaXr0746wT5rWA+Ht02n6Uku
 07j+uPmYBWFddqdn+h2PFf2hamSsFJpo7awxFxAVz2gsSM11KpT7cVbD3 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="228737264"
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="228737264"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 09:36:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="700544122"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga005.jf.intel.com with ESMTP; 07 Feb 2022 09:36:15 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 7 Feb 2022 09:36:14 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 7 Feb 2022 09:36:14 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 7 Feb 2022 09:36:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AcnRfvFlkCnzXkuhU+AqHr08TEd0eJ5jzDo11JK5oAXWhXspRGIOIiaOV3dIGgpX1dzQ2SIn7uhORSh9RHE5f4HnSPMWo0BTWfqF76n1L9rKRbUN2O2CFAh3aZF6nrVt3yXdVr3135rVrRnobqWIZuIxNiDZ1szzB5+niM5Cy9qKiTV81FTztpzupRHXAnTDdXWezGAhi1pPfdUf5/LaX7AgFl7CGamKGffCzMpbIMRxiWUM0SjpKeDmXmtJVZrFP5FSkcqZ1NMuvxYRQPce3iUUoEYYZ8V+Kepj8IxgniZfDdCR+kyVqUehIeCFM7zx+3kXMPTRxTtpQPuc7YaTSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBJKYaYJzo/wBDx74B8Ytrz44/fswnEvQehZ9GgWhfQ=;
 b=H/LYM6iBkFzRslLoHkpZygoAD4htwfR3lEVtoXXQxrFgpZkaQHCx/a+1uvxR/Q/5DZwwSYFfdPuTyucwbkySeHoRjjw4Iuv3Jshoeq65hAxaHynTZOkJNAZI8UxY/CWX9psltKrAFP2B6tzNdIrc6wOZUrXM3/KF/eiDPTalNShaKq/PDcd48X2Br5h3ZWcs/qeg++KlkteSgNWLLyMWlCfqoofdHs+rPfYpxrDHp5kzHrTqLByjc7jHVU4E5mYanzN77SHOB5mfAnT4vQOC2Y1nQz9wAp71yvBYXG2iC4GQmzbnTUgG/z7ltFl5hmCIS4GXPR0fObuW+dEGTY+SbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MWHPR11MB0046.namprd11.prod.outlook.com (2603:10b6:301:67::30)
 by SN6PR11MB3134.namprd11.prod.outlook.com (2603:10b6:805:d9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 17:36:13 +0000
Received: from MWHPR11MB0046.namprd11.prod.outlook.com
 ([fe80::31d7:4d19:5b17:37e7]) by MWHPR11MB0046.namprd11.prod.outlook.com
 ([fe80::31d7:4d19:5b17:37e7%5]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 17:36:13 +0000
From: "Khetan, Sharad" <sharad.khetan@intel.com>
To: Terry Duncan <terry.s.duncan@linux.intel.com>, Patrick Williams
 <patrick@stwcx.xyz>, OpenBMC List <openbmc@lists.ozlabs.org>
Subject: RE: TOF Nominations
Thread-Topic: TOF Nominations
Thread-Index: AQHYCZaOfkFZpTFTpEmcf0/cd2lmwax5Or0AgA9CBzA=
Date: Mon, 7 Feb 2022 17:36:13 +0000
Message-ID: <MWHPR11MB0046A46CE1A96951234EAC65F12C9@MWHPR11MB0046.namprd11.prod.outlook.com>
References: <YdiCUiwh1iD4ycr8@heinlein> <YeH2OHImO/oRgkjN@heinlein>
 <YeH5uCwUQ02RrGok@heinlein>
 <9758e5b1-b600-edc8-659c-25a93dbcfb44@linux.intel.com>
In-Reply-To: <9758e5b1-b600-edc8-659c-25a93dbcfb44@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8cda0893-0ea1-45e7-5b21-08d9ea605634
x-ms-traffictypediagnostic: SN6PR11MB3134:EE_
x-microsoft-antispam-prvs: <SN6PR11MB31347F76483480EB2F6BB7B7F12C9@SN6PR11MB3134.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 55cLl1orMMHIG/TqlkOaEPixIjZnvXOruTdrlH0s3N1OKri9/Fujp72nvLGyvkPlIdh5AYe5NAmytp0ZgxYrtiwc8VPYzIHrZcxUkdYviD0RcruCAS0d0BiRhtc5QcZWGKx0giGmisQw9cTZT/JrceWjZrftFcqaLgucL4D6E3YP3rqkXU0K5RmB2J0lSYvP+atfYln0Qw2gng+zsbC0XVUUvOa5B6bd5/DSyxRqZ9FDup0lv7aMdl+ql2QAb8/TigKmAc1WBOI3PABRrEUitrBp9TY70KWf/VTshdauZzg4HVfZCj5dBbGUBhz+yru0MFke0LywiWKYmrf10hyb4OUSy+s8e4lohtlzsaeCwUiIUpQ2uwkKL2bBPCbAIdssyCL3k9z0tLbSBKgaxgfWvVWurQ7neQ2Q+IGv/PboyrLjcUq+SGaj0c4mRhfFKYjp2X0Y8KSJe4fG2wSXyfild3szK+bQVR+Iee7m/4IxxqJCYJt3rJqOLtiMaCZzjMkmOj90wP16cQmifyPRIJDmhJJkX95ZiNrGP3eoUPRKxudsfeUnS972jsvp/C0yR0QHlFsop2CTc2ewUjr4UXkyKFMF20NrcGSHSe6scIYyd6ii0p0C8w9pK7uyC0vresC/uwIcX/aWm1glHE2i4KeD8nJFZks+dBaK8ozpwrHkpsVurOvvi99rB6iybbizrmfPMUYHYMjvHPzIo7TN7a+Z6Hv/4uytYbLHka+b6ZA+86TRvgbucKQ1CjU2ozmzkiWuGDC1bvBT4P8pOnrGhjKmpmxFJI5G2WZaE6W8wpg+RO9kppHn1keqG4i4U/dBxL8K+5mPHfdn7iUwgMGC7tHwRA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(83380400001)(86362001)(3480700007)(66446008)(64756008)(7116003)(66556008)(66476007)(8676002)(66946007)(52536014)(5660300002)(76116006)(122000001)(55016003)(110136005)(2906002)(38100700002)(316002)(38070700005)(82960400001)(53546011)(9686003)(71200400001)(7696005)(6506007)(966005)(26005)(186003)(508600001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gQvypYv/C1kpaUcV0xSHIbFMk3HQTi/97NtTsecbM5PKLfIdoxgUHKS7bg6r?=
 =?us-ascii?Q?ui9tiF5FXOg4Zg84Ko3Tn45bt8ZO2ueLG0P4nEOsl4hqjjCPNRJ1g8u+WonP?=
 =?us-ascii?Q?dCkvDuFpcfhaQnsliJwg8QEEL6xQVJwlobp+l4/BXecz2SSy3gL1Tgh+xX3f?=
 =?us-ascii?Q?HcPwjHvS/gv8KUN3AdJmzThKotmCHfU3gcDF9AfQYDLTS9mM2iXZdkKXqR3J?=
 =?us-ascii?Q?ilprVzAVr2rXe9m1nMfRO3xJatJbAjUqwujiuOImMT+EHsPH/RGWrQQyEcbi?=
 =?us-ascii?Q?vPbNTHbxDmGbU3ArFl4H0VR9JvtmRNCbJ3dpUJAS0KsLHZ2KzuqBBtX/1+Gt?=
 =?us-ascii?Q?IcHjWPMrKgItAiK/avFieSbC+GUd0MYeKGeEIxyVCkrMeV52GuvFNzNidCm/?=
 =?us-ascii?Q?vssnGOyUWY3GTNune9NDvXLp5mE74moobABZgaKXhnaz1ebgovNvWjwUT4uD?=
 =?us-ascii?Q?fIm1DhXSSE8FoKq90ZryjPfTOsXSjituoVYPbWcyhf7U2wZEqhCPCppydhoX?=
 =?us-ascii?Q?4zdoKrdrM25nX13h54GRlJTjQLI488B2XdUGwDe3o6/eo9ZxnddnA8FCg/mF?=
 =?us-ascii?Q?g1ZhN2pkFS1l/SYS85QjJbTdyJ6ck2HFAXx4TompzfrL4e3CA/QVgMmhykI/?=
 =?us-ascii?Q?a9mTnlbw6LafKsQJK7SyZ5yxNYqf2rKZx33fL6rCDYwsPLoL94H6AdYHVBxn?=
 =?us-ascii?Q?NLD09iF3pKkUqybjZfF23tfYqaPOhu11BbTMEqMFr1NPt61CinsDcw5HcJrD?=
 =?us-ascii?Q?D8G+5bFtccSV7ij2Gp4nqqmmzXsv7g771cRahowWjStk8E/acXDbjgIggJ1Z?=
 =?us-ascii?Q?ILOC9+2AfCFvpGu+ucIpQAW87hSO1c6R6ySSOZWl5cAjDSK8t0wMFzCurz7A?=
 =?us-ascii?Q?wdz0ey6yliJEQok4J1OJWs8ClCH9Gb1lDpGGaUcB+nfXpWtmkg+yGelt1PZn?=
 =?us-ascii?Q?D17QqzdMjptyzs+k/Tl9cLoLUQo1E3BBvbPBrHJHn/6y3KcmNMkk/FBWqYU5?=
 =?us-ascii?Q?ZisjuZZjgjAQtINLDfTR7OEbDVkVX26z3P+jTUuAD2jLNrjh16qXw94AjWqQ?=
 =?us-ascii?Q?ZrHWkfjuzE52UsQrDPuxv30E383maatwDJmKJJnGtFKLGi3H0KqMPDrs6j11?=
 =?us-ascii?Q?mCJYP08NLhI+KvljAOQsKmXKEJPSQv9bvTW/3Yy7Le2cgKTY7lrtkLSVtjDI?=
 =?us-ascii?Q?T8LaPJOJpqVR3j8JMObLZN8HHPV2UpVLpntu680PJwHSjqVPGjMFl1p4ez/c?=
 =?us-ascii?Q?aEb+iN7jX7d8u9KjKBqrrdUnGE2HHNIEgj0BZZLvReTk8aYCpRBV81Fm9Tjf?=
 =?us-ascii?Q?PEyjGuU0HDLliKm49oo3IVgCjE+hiWO2cIzWo+AIXlVUcjL5Ej48N+bI6TTK?=
 =?us-ascii?Q?cDohxcmZge05lCAT7V7nZMrIGPHCJnR7+Dd5+t/lJ3cq1JVxky2jE+sh/kSP?=
 =?us-ascii?Q?uf5XfoJKO/tkykMZ1ZxWW4wuf+agqhX+jbXSl6fSt5AGzJmp8BVDWNM0SB+l?=
 =?us-ascii?Q?cabZDnRsVQVNSXbagLesgD63vNthe57xDunPpTZjCwOn5u+B4SisLKy4a9dK?=
 =?us-ascii?Q?nssOJ2gguhpL78ae4p2Ylb4OFkBC3V+EDLNvMfbkcnl5GWDrCe7TEHpfLqSV?=
 =?us-ascii?Q?Cg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cda0893-0ea1-45e7-5b21-08d9ea605634
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 17:36:13.2417 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qZYPnAJi5VeFLw8mgDkv09mLLdJkZG5ZtLBbB1TviP8qax9K2VKDeF8KX8yPHLrswCkmKyOpp+Xwg9z77bUeLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3134
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

Hi All,
I would like to nominate Sumanth Bhat for the TOF. I realize this is past t=
he deadline, but would like the TOF to consider his nomination if possible.=
 Sumanth has been contributing to OpenBMC since beginning of 2020 is playin=
g an important role in bringing MCTP and PLDM to OpenBMC.

Thanks,
Sharad

-----Original Message-----
From: openbmc <openbmc-bounces+sharad.khetan=3Dintel.com@lists.ozlabs.org> =
On Behalf Of Terry Duncan
Sent: Friday, January 28, 2022 4:27 PM
To: Patrick Williams <patrick@stwcx.xyz>; OpenBMC List <openbmc@lists.ozlab=
s.org>
Subject: Re: TOF Nominations


On 1/14/22 2:31 PM, Patrick Williams wrote:
> On Fri, Jan 14, 2022 at 04:16:24PM -0600, Patrick Williams wrote:
>> On Fri, Jan 07, 2022 at 12:11:30PM -0600, Patrick Williams wrote:
>  =20
>>> * Jan 30th:	Nominations (self or peer) for TOF seats must be sent to th=
e mailing
>>>              list.

I would like to nominate Jason Bills for the TOF. He is well known in the L=
F community and an active contributor to the OpenBMC community. He has a lo=
ng list of submissions[1] going back to October 2018. He is active on the m=
ailing lists and the discord channel. He is maintainer of five OpenBMC repo=
sitories including x86-power-control, phosphor-sel-logger, host-error-monit=
or, libpeci and peci-pcie. Jason actively reviews code submissions on these=
 repositories and others [2].=20
Jason will a great asset to the OpenBMC TOF.

[1]
https://gerrit.openbmc-project.xyz/q/owner:jason.m.bills%2540linux.intel.co=
m,275

[2]
https://gerrit.openbmc-project.xyz/q/reviewedby:jason.m.bills%2540linux.int=
el.com


