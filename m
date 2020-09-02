Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 286BF25A2FA
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 04:23:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bh75Y2hd2zDqbx
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 12:23:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=teoJl9vN; dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh74V42mYzDqKv
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 12:22:12 +1000 (AEST)
IronPort-SDR: J+Du67PL/zKUGbAUFDi/7E4PkZ1Q8q6ROxOI+2JeMVtY0K/FqDJjqZWnHqjAT2I+tzm8cx4vQy
 87pWY5RkEd3Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="154812124"
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="154812124"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 19:22:10 -0700
IronPort-SDR: zoQyLWplkhIvu+96/F5eUbYxAvsxicmVLv4t1kfZ0BZH50jL/EFOl4orQHfDg04Gr8Mf2LtPEh
 IjoCrSwvOCoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="325596207"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga004.fm.intel.com with ESMTP; 01 Sep 2020 19:22:10 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 1 Sep 2020 19:22:09 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 1 Sep 2020 19:22:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 1 Sep 2020 19:22:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZ/qV7O8rBVSY732kFEkXU96ELF36fv1S5G2h5xNWvWUz2RtZAjElvKrtt+s2xd5RiLV0FW7hSCNHlUde3MG/IYopaKkW2riLwzPiKy45ibI4uz5tPSl8f2AqofC6VlmxEH79KLXu1sh4Ja9+b6Lnc1Fwzo66uC+BZYjPQNBOIRGj4+VBtIZGt7kEZwHUa3OXzPhUqw4RrW7rHW+oPexi+flT/cwRvaulNaTsTFZJutHH/m64hL+0D1TU2Ctf/d3bcIEbLGkGRLmeiMlPQOSZDLbhr+DywARMNZzwMWUUT7UddZU64X2HRFex3unDy+8WMuQzFLNiumE/vBcw7Obyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvL5LIyP5BhlPvDxnPCyD3nLRafDkalhqOwtjOFFYxY=;
 b=mnJN4m2jC7AZZ+NkLVPoeuvm1+i4qUV1qZ4a7j3rOjDS8SGKMxGgNELnYYFX9K+YSm6rKKyruwnUqaZykdn43OMTg8Ur4waMT8R+kO9qO76dc+17M6eBQeDGsYgDqs+AUb0K8sZPZTEk+PRWaGptuaEV/Q230gXiiR+fUS37cVXEzqIsX0k0n1DtyALPOxIGrgBpaavNIYFfuoyPoXmo3bv0TTZo3e3n0SIiwBL0DJH/H/65I9lJqnTQPF4j9HsnMZ5GK03eVgxJeUG3bvYY+n3NqCnOp4LAo4ipIIJEmytBm1AFtr7TTXG7CTXzdMt+yDNN7nIYVahlGcqLWy6Y8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvL5LIyP5BhlPvDxnPCyD3nLRafDkalhqOwtjOFFYxY=;
 b=teoJl9vNzTkpsEuhsykag7LHgdxKA4OrDHl9eKv7ABAzuAlviwEI4k1mBTGe7N9BFCKRyU8QHvxg2SI9acaabwy5aSFIVUrZdJwRtor8DQQYf9oPTjeO6OVci2OLE1U2BDc07LAdVdhhFRsQzHWieDojg5yS2oLZ3BhO+p+90zI=
Received: from SN6PR11MB3520.namprd11.prod.outlook.com (2603:10b6:805:cf::12)
 by SN6PR11MB2800.namprd11.prod.outlook.com (2603:10b6:805:5b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Wed, 2 Sep
 2020 02:22:05 +0000
Received: from SN6PR11MB3520.namprd11.prod.outlook.com
 ([fe80::d933:53ea:b87a:f917]) by SN6PR11MB3520.namprd11.prod.outlook.com
 ([fe80::d933:53ea:b87a:f917%4]) with mapi id 15.20.3326.025; Wed, 2 Sep 2020
 02:22:05 +0000
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: Need update CI build config for new repo smbios-mdr.
Thread-Topic: Need update CI build config for new repo smbios-mdr.
Thread-Index: AdZ8T8WMWe7UjTu1QQafCbbBYikJpQBJL32AAHDrLbAAUQMGgAAUyG5g
Date: Wed, 2 Sep 2020 02:22:05 +0000
Message-ID: <SN6PR11MB3520672A5666E13E2431F7F3902F0@SN6PR11MB3520.namprd11.prod.outlook.com>
References: <SN6PR11MB35203BE16B23BAD1193FCB9F90550@SN6PR11MB3520.namprd11.prod.outlook.com>
 <5a9a43046be525f9ed5d23bc40eac14d4ed8d53c.camel@fuzziesquirrel.com>
 <SN6PR11MB35205154DB67E625EF74388A90510@SN6PR11MB3520.namprd11.prod.outlook.com>
 <20200901162333.GT3532@heinlein>
In-Reply-To: <20200901162333.GT3532@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMWRkMzBhNzItMTYwOS00ZmVkLTg2YzYtY2RkNTk2MDIyODI0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiRUJzM2djWWZNQ3BJdXZvR0t3Z3Y3SytTcXg4eG1FeGo4Q1B6WmZHWXB2aDNOeUpDYkxGdUNic0FVU3ZmcVc4SiJ9
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
x-ctpclassification: CTP_NT
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.46.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52345e8f-30a2-479f-b295-08d84ee6fc27
x-ms-traffictypediagnostic: SN6PR11MB2800:
x-microsoft-antispam-prvs: <SN6PR11MB2800525DB91A14C44DD34E0A902F0@SN6PR11MB2800.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8AWq6h9CugkQR6i1+wSgPzSEdEJswJqHONgXj08V32cmAh14EQBN6Q7DJ/eM/5jU0AyOJu8BKFxAeAHMGhzp6CclcWkPu/nsrO/Pe25+a6SoBxCYPFiT1gWunjlLiM8g+xnTRmTl76S+m/qPS2W99EhG8j/NInaKQ12qnet03neDmLGILW85d94UOPG72OHg4sF7EnQAOa0w+elSjdDhUBjoX2Nn2rtpf6mY9CJv2Fv6bmOkLshePGojkv1M9FztIkeGeXGghBbxw102MFdr5vImK7zMxZflLOkPS7Qq3B42gMEAltyv+zC2R25A4iYjAHpXZ6qoMpR4ZUaXW31fWrNrn536rjYWV9k81vDPhzDjIb5sLN/h/YVA0oG5CSlacdfAMhuSb8GAHUjx72Qkiw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3520.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(53546011)(4326008)(15650500001)(76116006)(8936002)(6916009)(83380400001)(6506007)(33656002)(66556008)(66446008)(66946007)(66476007)(86362001)(52536014)(9686003)(54906003)(5660300002)(316002)(64756008)(478600001)(186003)(2906002)(71200400001)(8676002)(55016002)(26005)(7696005)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: TrpVe/1FWUpMl9ljUIaYqpMBMgyTIuXuhI7bAtYezy6k4rpo9jMEjr2cdMWm8eXj0Eopg/g3X8CgXYr1LxppH8NsbXpqUtsKXwciaulVwYLzfACbxUNhxGPgRlbICrIcQN/4Ij7syYMtIRAx10+D56f7Ag5PN3nRpIfRgSKVrf7tf7W+VyTM86xPVyvzzd0GbtGpGx7lXj0rhZ6jUHc0oze/3Q0SoKRYrWeCxtYLNyQBCO5J6wIOmKqARsDIE7Ggf7rfa09x5L2LRy9LG7bt/sYThjD5jfjVGhfDmFMVuzuFQHh/5ZgTqXeThYEMH9fwcGNu6xy0vV2QhDCQvBytUYvtLYz50akPmJRaqu845qBJ3KxPVnwJACmFMTPSiduaDOi6CGGdC3ivFZiT2CAO/085TjFK/S/zH6PyWnn01PreIu6M/qavFfh1LwO0wdRbwjTgGrX/JPJytBi/t6ZwKuZefxqO99MHcAzEZfP0DA+Da/dsMzWZkM7nFu45EUx50UipqgPEo9w0WWiwDS/ViIqEOzGhuEdyAl27AXfsSidv9XugHqnk2XYevV+ed6RdnScN27i+T0x+yw3DAkqULBfyN2SS0i3sNeCwQrUzTN3c+gVstiTpF3Ens4crWPJSTuEFi/+Ri69wKgeLo/FYGg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3520.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52345e8f-30a2-479f-b295-08d84ee6fc27
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2020 02:22:05.1390 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nym/ZB+L88QaVokXP86FwHJhyFEiwdA2lsKlDHL5Er9LIiM91WZ5UQ7k0rGgucMP4zkDpU2DkBEdRbVyt4rf4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2800
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
I triggered a new build.
https://gerrit.openbmc-project.xyz/#/c/openbmc/smbios-mdr/+/36011/=20

Thanks,
Kwin.

-----Original Message-----
From: Patrick Williams <patrick@stwcx.xyz>=20
Sent: Wednesday, September 2, 2020 12:24 AM
To: Wang, Kuiying <kuiying.wang@intel.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>; openbmc@lists.ozlabs.org
Subject: Re: Need update CI build config for new repo smbios-mdr.

On Mon, Aug 31, 2020 at 01:45:17AM +0000, Wang, Kuiying wrote:
>  Hi Brad,
>  I am starting to enable the new repo smbios-mdr, but there is build =20
> failure.
>  CI build config need add below depends:
>  DEPENDS +=3D " \
>      autoconf-archive-native \
>      boost \
>      systemd \
>      sdbusplus \
>      sdbusplus-native \
>      phosphor-dbus-interfaces \
>      phosphor-dbus-interfaces-native \
>      phosphor-logging \
>      libpeci \
>      i2c-tools \
>      "
> =20
>  https://gerrit.openbmc-project.xyz/#/c/openbmc/smbios-mdr/+/36011/
> =20
> =20
>  Thanks,
>  Kwin.
>=20

Hello Kwin.

Individual repository CI builds to not happen within the context of Yocto. =
 If you think there are some dependencies missing, you'll want to enhance t=
he 'openbmc/openbmc-build-scripts' repository to include your additional de=
pendencies.  In the repo-level CI path, we build Docker images that contain=
 all the dependencies and build the repo-under-test within that.

Your Jenkins console log seems to have expired, so I can't tell exactly wha=
t is missing in your case.

--
Patrick Williams
