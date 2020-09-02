Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0167B25A2D4
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 04:04:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bh6gw11sJzDqbw
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 12:04:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=xNcWnUMg; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh6g30mL7zDqTx
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 12:03:41 +1000 (AEST)
IronPort-SDR: 9jvCcmPgLeN70U0pr4Lkgg9EY4fK9tCKnA9CQ5Kz4zPtOxl5mbsKSV5Ob0Zs5MZfNCp337g6X5
 ynOkFn5ky3WQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="242125760"
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="242125760"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 19:03:37 -0700
IronPort-SDR: rcv7AI/UVSkmihTCkS39uUj5I8OMvcNYhWhYV6apTepI8aTfOnkDYncvwAQdWvf5aMC7l6K405
 2GtmqG+KDrTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="375369633"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 01 Sep 2020 19:03:38 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 1 Sep 2020 19:02:09 -0700
Received: from fmsmsx106.amr.corp.intel.com (10.18.124.204) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 1 Sep 2020 19:02:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 1 Sep 2020 19:02:02 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 1 Sep 2020 19:02:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9Tkmue7/CKFwMCI1BvSXO95eOGFRfZ4d+TwA2371oGob45fVHj/uOUxl4G4Jqi/5EC7vmMpW13kNHs5eKxuzmIyJM+PMVlarOnJfq7J1HU/7W2Pi1Y8qWX/N8NFf3mGuhS4Ej3DpS/NsrqhlveKKndjJzbIYHATZNTS7qIw4TiXfpXFpqFVvMsjhPwHKRACnfRKlKuLb770h6q+RMFhGTBFGmMz7Iz4KiS2oHoOdzUwiTZv1w2H1bo9FuxMlwO0HlvzM/TmHGsL3RAouAaJ+j//+soelKbyAnEztW5uQAS9tHHE+W7deEC8mI2htJLHATpa5QodlJmnNIVcMvActw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3GFuwOFhgrXnMSxaZBnbqa59TgxY3+OqZFzFvljL7Y=;
 b=eX3e1LsT1U9zVaP2n53iuFyWAvJ3HqzcIDX9uHjJxj3zUqUHsIE5PMCUdS0PaQG/CBrF8ForcN7Pcq5oPrfIiyWCJjjojtFsZYURMsppZZGapb1R3iVwNJ8Q9u6rF3OZ2pOGnWeQeSsZfe3LHujzxDEne+LE/Qfb89Jd/32A4TklFRzwnYW4XTBqwPV/UtCNEfBLMUdibMTVBo0ZFg0lHcFPHDVEOKG513BYNa0oXy9CjtHWq0IhNi6pyRl28ZL4FSyzxMkdkOZXrLybEo02QFF8zmNrA9OIfnW8ER+NOTlnP8oD8qvGW4eT38gCxaNsFFjtHskasMOidg5Gq8ZwrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3GFuwOFhgrXnMSxaZBnbqa59TgxY3+OqZFzFvljL7Y=;
 b=xNcWnUMgfODjxdE1quIHYMYsGNwcGXLsiaaChF5ch8RNvw1yowK8P3boFDy+gqJAiMxLtgnOwBhk/zNXwvo7LqTij3IXt8bvdF0eilmwdnkRfToJr4P+Y0cjNPLN1mXyEhfJll7kBHu8aUpU5pcZhmAkSQS1C8iH97b/egq5qlo=
Received: from SN6PR11MB3520.namprd11.prod.outlook.com (2603:10b6:805:cf::12)
 by SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 2 Sep
 2020 02:02:01 +0000
Received: from SN6PR11MB3520.namprd11.prod.outlook.com
 ([fe80::d933:53ea:b87a:f917]) by SN6PR11MB3520.namprd11.prod.outlook.com
 ([fe80::d933:53ea:b87a:f917%4]) with mapi id 15.20.3326.025; Wed, 2 Sep 2020
 02:02:01 +0000
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: Need update CI build config for new repo smbios-mdr.
Thread-Topic: Need update CI build config for new repo smbios-mdr.
Thread-Index: AdZ8T8WMWe7UjTu1QQafCbbBYikJpQBJL32AAHDrLbAAUQMGgAAAodOAABNvhOA=
Date: Wed, 2 Sep 2020 02:02:00 +0000
Message-ID: <SN6PR11MB352047845E48681E8F71B139902F0@SN6PR11MB3520.namprd11.prod.outlook.com>
References: <SN6PR11MB35203BE16B23BAD1193FCB9F90550@SN6PR11MB3520.namprd11.prod.outlook.com>
 <5a9a43046be525f9ed5d23bc40eac14d4ed8d53c.camel@fuzziesquirrel.com>
 <SN6PR11MB35205154DB67E625EF74388A90510@SN6PR11MB3520.namprd11.prod.outlook.com>
 <20200901162333.GT3532@heinlein> <20200901164139.GV3532@heinlein>
In-Reply-To: <20200901164139.GV3532@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYzIwOTBjNjktYzZmMi00ODhkLThiY2ItNTZjNzljYjdmNGE0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiaXlwVHlQUVh0TGVjbTdtNjl6QjZ2bzJ6WXpDOThZbkZ1allFV3BvaXU0NmZEK2xNODMxWjdiUUhEWk53dWxTZyJ9
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
x-ctpclassification: CTP_NT
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.46.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0dcd7c9-01b5-4615-af5c-08d84ee42e64
x-ms-traffictypediagnostic: SN6PR11MB3230:
x-microsoft-antispam-prvs: <SN6PR11MB32303EBBF8CC40375A0041BF902F0@SN6PR11MB3230.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iTfwwXOou74nBfLDlAIgN546XhIxCs+r0b8Ib4LY9VAWbfr3OFkZloUFxlvUF+3u4I1tsWsSDuQ+5U3yqUqoEJf+rYU2atuzqq8LoUCaj2mUo4GCgPF0NLr3xXbuHuD43qrucsvTJm8tL44/VXQrHNiE2D1kDRcq+W1bqe5ZVdm/pAkLucrAxVOWsy9CTH8mcRLA5A3Uh2j9mEiRiGTfsIlrM94Tp/yV9XvlaOI5b+RNZZGiiNrJypVX6b7kL+KFl+8Gb9tEBmby495KIlkLFRFio1vPC9DEhe+wo/KZPp7nm26+ZMWq61MZUizzdI7ync+5xqTL1lsKh6kTRtJrT99Bn5J9b6iEdAQ7pfqOXUU1R7zr5ajVnxGHu+ll2uvefGEIRtOAIBd+TjZRzHk7YQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3520.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(7696005)(52536014)(316002)(9686003)(6506007)(5660300002)(66556008)(76116006)(66476007)(53546011)(4326008)(64756008)(66446008)(71200400001)(33656002)(66946007)(966005)(26005)(86362001)(83380400001)(8676002)(55016002)(8936002)(15650500001)(6916009)(2906002)(54906003)(478600001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 6f3kAa2HF2lxhiYu7NARyTilG4LqZPT9fx/noSjcXOtgY7ezLVR5VRi3NC/IvESIeVuxJJ81BYOlycfVg76mPdlswiPp7dW+1pv/SJJE6AqwvlrKhbOmRtfd/bQ7d5SAw8BelGiwz52mG1/NhnnIaQyHwUFhmMl8mx7QI3i5aKIq9p+qDxj8Biz0tOjEINyYaHksV8QCWZ4Zn0ZSA/Vox6Bxa3A2wY0hZneCx00TB8oZusAqSmE1ArQqTDT7VAVoZBuk42UYkVZeFNIy9cZBoAXNpngNDBDnwyF10fMsTIPkR07zJakw6wMiJvbShoKeYwqC1gn2dbq7PP+L6L3DWsQviHZDZzOOY0EwfupAcQ0omcsKprFer3+oEQER9rxIsFMddWWdaA+hYNmdZO7QSuwczKe5RhREsX6hT1kYgpgS6Z8G4bTD7Jvd2w5BVbYRee9+ZtUCbqk5Ybc/X4H5bG8WIJcatrw+BFmVQ4Y3DTAM0YTmCcZoFqVOUnxMg6pGwk1vArckDzUfPwv5VQcMH9YhGhCIoRu1+BjpQZARh/GQobZc+5zEPDFt0AbgcjsPNiG/g0TSFBqdMFTObxZOxlmddaDGdd+C5QumBJyxLorgVxuuoBF3O1/G0zi4I3GyJPjplsRLrnM5OyowIx0tFg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3520.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0dcd7c9-01b5-4615-af5c-08d84ee42e64
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2020 02:02:00.9286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ePL8MnRT2uL+yNoQSGnIFtaUW1CWx8BD7v3iB6Jly8Hdav/nNf6iUTDellg4URO5cNlBG76VVQfab0Xwjztgqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3230
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Williams,
The key thing is sdbusplus interface is not match.
You could config CI based on this patch https://gerrit.openbmc-project.xyz/=
#/c/openbmc/smbios-mdr/+/36011/
That's ok, if it can pass the build.

Thanks,
Kwin.

-----Original Message-----
From: Patrick Williams <patrick@stwcx.xyz>=20
Sent: Wednesday, September 2, 2020 12:42 AM
To: Wang, Kuiying <kuiying.wang@intel.com>
Cc: openbmc@lists.ozlabs.org; Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: Need update CI build config for new repo smbios-mdr.

Also, a few minor comments on your proposed dependencies.

On Tue, Sep 01, 2020 at 11:23:33AM -0500, Patrick Williams wrote:
> On Mon, Aug 31, 2020 at 01:45:17AM +0000, Wang, Kuiying wrote:
> >  DEPENDS +=3D " \
> >      autoconf-archive-native \

Your repository appears to be cmake-based, so I don't think there is any re=
ason for you to have autoconf-archive as a dependency.

> >      sdbusplus-native \

This alias is only provided for convenience but should not be used any long=
er.  Please use '${PYTHONPN}-sdbus++-native' instead if you really have a d=
ependency on using the sdbus++ tool within your repository.
There should be fairly few cases where you actually have this dependency th=
ough, so if you're not calling `sdbus++` in your own build process, don't a=
dd it.

`git grep sdbusplus-native` shows only a recipe added on Aug 3rd, which is =
incorrect.

> >      phosphor-dbus-interfaces-native \

This no longer exists.  I suspect you don't need this either.  There is a f=
airly rare case when you might now need 'phosphor-dbus-interfaces-yaml' but=
 I suspect this repository isn't one.
Probably your existing dependency on 'phosphor-dbus-interfaces' is all you =
need.

`git grep interfaces-native` shows no hits.
`git grep interfaces-yaml` shows only a hit on an sdk package group.

--
Patrick Williams
