Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7947925B992
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 06:18:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bhnc75FzFzDqwL
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 14:18:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=xomgxfKS; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhnbC1RdVzDqfc
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 14:17:37 +1000 (AEST)
IronPort-SDR: pCdil/XdjtQDK3nlfCeRE9MGbjnTH9AR8VyDI2pXWs8PKVQQl1Ij0znkse088GJBVmGJai2bpT
 MsSrj60SzecQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="156786400"
X-IronPort-AV: E=Sophos;i="5.76,385,1592895600"; d="scan'208";a="156786400"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 21:17:32 -0700
IronPort-SDR: b900p1r8Bhn0KwLCjyaVUb4UZBhv9A8Ul3m/d/n+AgdH31XGZAw/LvVH+csFw1cIJinzZ0Pa8m
 /CfrlrWmFgSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,385,1592895600"; d="scan'208";a="283957815"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga008.fm.intel.com with ESMTP; 02 Sep 2020 21:17:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 2 Sep 2020 21:17:32 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 2 Sep 2020 21:17:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 2 Sep 2020 21:17:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 2 Sep 2020 21:17:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FfzRC5B/L/zpfil+wj5zxSf7ZT6MKWZ/2k2dYFonVRZV2C/E8jKT+7i5eYZsDILyOXwx9gk3V5Dikpk0EVL5teQvJImnXJSpTGJBELy6di3onjWIT+320/rt8zyrCLD+uK/x/wils0bhMiZOfVCRsrlygwi+EEtOEir3A9qV0lSlwVbWuKw6bHTT1t9N5c9T05ixrT2HHlD+GqLbmzOSAIbVOZHVwSZ6a0dL+vCuxJH5ftLxnZr8y0o9vfWqui88+RkIWBQfscGi15odIqwTQfy6gj2dvaSKdm05j70OCj0hn9Nt8D7YPP8oR0bdqwsGymEpJJZsQY5uy7adK5R7Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OiU9QJxMlj5sE5lb0jxqfH32s/aiwHuUuIm4KL7BuY=;
 b=eikZU0dtOuQBvW7yNQ+taxDfpyDnq6FhtPLf/a6SBloF4daw7nzQGqWh6R9oEeyacnmGW87zyQEFpAvYPp9JsXW6e/wA+ATmPHD0oFSmChuFVylxHj1QVz4xvFdNPDIO5asH4UmeO78qqcA6r/V1J4o/DY7aptKZJm2nFYswfNKe7IMVopCKpiDsS62j7LuEpuG1osvuQL5b9gVeJWzK7ccEn//mAk87Mg25Q3s/W5UwgUo7tTLomqLNu6VHxzFWsz8CViEdFwbs1d1UCC6cT9T7I/6Qc6V33WHQ4paSZHTBGRJ/hMZlvNUvnjrQ7dW5k+QNQiVagirpZ0u/f4qNFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OiU9QJxMlj5sE5lb0jxqfH32s/aiwHuUuIm4KL7BuY=;
 b=xomgxfKS7yBMdRBXX6auNCxqbXCk13jvCJZnOAOv6rjQrSX9qfU531ATceW+maagIwjyYJONas8oFCVDIqM0XrTtADKmeTZoKtteLrmJIVRbFBnkhVUM9O2GQcmUjfYjanYlJfvjW0E9LKG++v5IiiJ7+/tZRJJ9T3axIy4R1tE=
Received: from BYAPR11MB3511.namprd11.prod.outlook.com (20.177.224.158) by
 BY5PR11MB4212.namprd11.prod.outlook.com (52.132.255.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.22; Thu, 3 Sep 2020 04:17:30 +0000
Received: from BYAPR11MB3511.namprd11.prod.outlook.com
 ([fe80::3c94:3dee:85c8:3b85]) by BYAPR11MB3511.namprd11.prod.outlook.com
 ([fe80::3c94:3dee:85c8:3b85%7]) with mapi id 15.20.3326.025; Thu, 3 Sep 2020
 04:17:30 +0000
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: Need update CI build config for new repo smbios-mdr.
Thread-Topic: Need update CI build config for new repo smbios-mdr.
Thread-Index: AdZ8T8WMWe7UjTu1QQafCbbBYikJpQBJL32AAHDrLbAAUQMGgAAAodOAABNvhOAAHQrrAAAaGLEw
Date: Thu, 3 Sep 2020 04:17:29 +0000
Message-ID: <BYAPR11MB35115A7732F2DE1AA4872096902C0@BYAPR11MB3511.namprd11.prod.outlook.com>
References: <SN6PR11MB35203BE16B23BAD1193FCB9F90550@SN6PR11MB3520.namprd11.prod.outlook.com>
 <5a9a43046be525f9ed5d23bc40eac14d4ed8d53c.camel@fuzziesquirrel.com>
 <SN6PR11MB35205154DB67E625EF74388A90510@SN6PR11MB3520.namprd11.prod.outlook.com>
 <20200901162333.GT3532@heinlein> <20200901164139.GV3532@heinlein>
 <SN6PR11MB352047845E48681E8F71B139902F0@SN6PR11MB3520.namprd11.prod.outlook.com>
 <20200902154944.GW3532@heinlein>
In-Reply-To: <20200902154944.GW3532@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMGNlYTA1NmMtN2YxNy00OGQ1LWJkZDMtNjA2N2M3NGNkNWM0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiMFRySG9KK3IyKzYzZHFCeDBJazhFMXNrcTJTTkZzZ0dMMldqUXo5dFA0MmIzNnFwS2kxakpmMW02bERpMm8zRyJ9
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
x-ctpclassification: CTP_NT
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.102.204.37]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 250a027d-fbcb-4317-8450-08d84fc04632
x-ms-traffictypediagnostic: BY5PR11MB4212:
x-microsoft-antispam-prvs: <BY5PR11MB42129F5AC63A4E7D0286CFA3902C0@BY5PR11MB4212.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jmtgxxy2aco67djcD0pzCtpNQcKlRk33GCbAOOlfkr1Eyr2NIdP1B7ISTubQvMX9T4gI3O13HhQgrjGvWyYx9eu2gjBzfSJ68NaMEqIMBYi6P5IwKrFsSZpw34wb0GmDwZigWf0dVQB7Y19xqvLKCJK6k0pyRi1sucJfpTGKlPuNDWkIHzs4JRlz7240mNXKpXoc9uIRfd21a7KQj6E44pM5x+AoKUmx4tJGc7xT3fqfcDBFez0BD3ANVsISrilvy0qLYNP4E65Mjpu+hmxwuNrRSg1RTjAtoL1U0Ih5y9Nmx3IUgmrgDq5pJdDXKuvkbyqCJBsVsgPSF8blVjTdxswSr1RM7Fm0Ck/e9mKqy+hxwJxZyrlE1PNdnK/tFHEocoS4bXcvRaB8jX4+4SWQGg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3511.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(6916009)(7696005)(8676002)(33656002)(186003)(2906002)(26005)(4326008)(71200400001)(5660300002)(66946007)(76116006)(6506007)(8936002)(66446008)(66556008)(64756008)(53546011)(52536014)(66476007)(15650500001)(478600001)(316002)(86362001)(54906003)(55016002)(66574015)(83380400001)(9686003)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: TK1/cXWAHvnfHOaG4TqmZmRgb0IulVai+kpPESgOp/oygxzYofPjfgQirPiTonfvrZT01cjdtCZLpS07+Fj7gzOahw0IP1eO1RFqfMoCD12llTjtveN7fNzb4h+r4VFddbGnltbdU6kViv49z61QvF0UN7WLsoV7UAiKX+F5oHizEbCP+VaK5+nALaO1l0v4Xp9UfvR4V018HsLnmrIMjUGFEEMVs07d9eXD5Kep9IBe/pcE+RRxi63kd14U/2u6xOuiwbRWv1NJK7nXZDiGzjjTtkuUvcJkyc8RUbJgSB9d7ea0lqg0LZ5pYzJS3KJpuDkux7s9kxrbRkOsYlEaX0fKzhCRAnPZP1vmfZRuPMoPOnWUhLM9SuitAaz8CZQRsqZN4H5ezJgmEJXENImdI8QWCx3FjBTMESzb9UhZKveKWkSFLkOHX8eWjYYsCSkO+qIjEoJRvWK2KCR4MqvoRi7lLrjy8itpfpUeQXmQwOK6OyaULTaZvo8JOn2X8KU3RmrgEsfyUvb1ydKZlkcHvYO3euXx6EsnBl5W1G8tlP0mRPM1ckccYTYlZDeKN77sWlTXsOv7p0C12w7nbsvmJwAI53i4Li7y6mt3ay1SnmYZGi7SMn67v2EnbfrnNYGpdT9cgB4CiT0OLe+febvQYw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3511.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 250a027d-fbcb-4317-8450-08d84fc04632
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2020 04:17:30.1057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DryIKpQtBvtA9UsTiqpzIryoEGKAAuJlgqM79rseWsNbk7KYAtF430R1hHpbmmUDiONGIgzHyvaZhu/Iy+vTyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4212
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

Thanks a lot.
It's done https://gerrit.openbmc-project.xyz/#/c/openbmc/smbios-mdr/+/36177=
/


Thanks,
Kwin.

-----Original Message-----
From: Patrick Williams <patrick@stwcx.xyz>=20
Sent: Wednesday, September 2, 2020 11:50 PM
To: Wang, Kuiying <kuiying.wang@intel.com>
Cc: openbmc@lists.ozlabs.org; Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: Need update CI build config for new repo smbios-mdr.

On Wed, Sep 02, 2020 at 02:02:00AM +0000, Wang, Kuiying wrote:
> Hi Williams,
> The key thing is sdbusplus interface is not match.
> You could config CI based on this patch=20
> https://gerrit.openbmc-project.xyz/#/c/openbmc/smbios-mdr/+/36011/
> That's ok, if it can pass the build.
>=20
> Thanks,
> Kwin.
>=20

Here is a snippet of the compile log:

/home/jenkins-slave/workspace/ci-repository/openbmc/smbios-mdr/src/cpuinfo_=
main.cpp:34:10: fatal error: peci.h: No such file or directory
   34 | #include <peci.h>
      |          ^~~~~~~~
compilation terminated.


This one might be a missing dependency?  Where is 'peci.h' from?  Is it fro=
m a kernel header for the ioctls or some other repository?  Do you need to =
stub this out when building on x86?


make[2]: *** [CMakeFiles/cpuinfoapp.dir/build.make:63: CMakeFiles/cpuinfoap=
p.dir/src/cpuinfo_main.cpp.o] Error 1
make[1]: *** [CMakeFiles/Makefile2:78: CMakeFiles/cpuinfoapp.dir/all] Error=
 2
make[1]: *** Waiting for unfinished jobs....
In file included from /home/jenkins-slave/workspace/ci-repository/openbmc/s=
mbios-mdr/src/cpu.cpp:17:
/home/jenkins-slave/workspace/ci-repository/openbmc/smbios-mdr/include/cpu.=
hpp:113:17: error: =E2std::string phosphor::smbios::Cpu::processorSocket(st=
d::string)=E2 marked =E2override=E2, but does not override
  113 |     std::string processorSocket(std::string value) override;

This appears to be a case where the current phosphor-dbus-interfaces doesn'=
t match whatever your commit is trying to do.  You've got additional method=
s for handling dbus properties, but those properties do not exist in phosph=
or-dbus-interface's Cpu interface.

I suspect you're trying to implement
xyz/openbmc_project/Inventory/Item/Cpu, which has a 'Socket' property but n=
ot a 'ProcessorSocket'.  If I recall, this happened in the code review wher=
e the "Processor" part was requested to be removed since it was redundant.

There are a number of other properties in your compile fail that need simil=
ar updating.

--
Patrick Williams
