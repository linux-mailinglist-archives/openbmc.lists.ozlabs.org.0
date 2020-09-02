Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1021625B621
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 23:47:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhcxM21d2zDqpH
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 07:47:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=zhikui.ren@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=PVFX7SfU; dkim-atps=neutral
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhcwG10JGzDr0v
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 07:46:51 +1000 (AEST)
IronPort-SDR: mnAduQQzJxr6sViSZUl46EEyMwERu/RKB8BIYdXhS+JlijaD0N3zPxRqRT/IrxEwSMcRoaSzcE
 6ahBcmygG8Yw==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="219037726"
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="219037726"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 14:46:48 -0700
IronPort-SDR: Vefvoz2cKKvKxTcuvLQ3Zl7BfXoNuxm3bUxyhdz18CDL1vXQq+HxGcE7DKy7sRjhU7hwdNZWSj
 wiKahxT1pT6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="339057951"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Sep 2020 14:46:48 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 2 Sep 2020 14:46:48 -0700
Received: from orsmsx105.amr.corp.intel.com (10.22.225.132) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 2 Sep 2020 14:46:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX105.amr.corp.intel.com (10.22.225.132) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 2 Sep 2020 14:46:47 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (104.47.46.59) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 2 Sep 2020 14:46:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMfQxt7TyS4TvsddSpX1NvAFLzn/AiqZ0z643A7S6BI4xcEBbZhT0EGcfTHmEngWDWGtb+8ouHD9NmD6Cr9+AL58RetCe3xpgnEjzssLke9dT5sLz892WTZPy+JHhpM00u+ttJW+7Er5Ik0nOgfzzTF4v1iTpRISy+LPHMtVgk6wdnkvHWTDICTv6isZjTU6zWRethvzvKSPK5Nyt1jF2GxLPsd+EaLf48RMJl/urZaWI4H19CTE74X7e0Jf901VzdkjiaFXRsCTBVrEBap4v+rmiUQpbuw0b6dlfTjvyFF1nmhmg0tFb+Gdq0TAFUqHCO7wpcgrODDLq1/n2UCz4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CG+WiyhmQkYqe5Vui2rxM9+63lpqB2rRkzBTrNIW7dM=;
 b=AcDQMPG/lzmtnHXDwvjrUKdznYail+UZ/55DAEmZ1hNqgwtmVGrKJRILAnEeQYoTY3X0zSqEnPHT+4tFLe0O8h8CfpeK3LZV2f3t2wfUyr3BfXUKLBiagC37geUK6FCbGkGt/QMz4xrDaveyJPOB48lSfQXJ4RVAz5OrvRS+nuSOgBNQy2vPom5jQKmsfF9DrSZWxLASBHhuMCI4KZJTMDjIOC1es6Cek01haHQeAw7RHzPoG7hROGjmuVqBTVOFcMHmWAwLZexS98eAt5pTtUQ5zLyKLUk9xR4t2MLpH1WXB6X4MhmRSpe/NqkMSESaSUuWCckHEhD8r93kV0+gxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CG+WiyhmQkYqe5Vui2rxM9+63lpqB2rRkzBTrNIW7dM=;
 b=PVFX7SfU1OfZ3b0eUsKW8jkCOsGjOFZ4kpYFiEt7RDvIAyLPsW9qPlvZ8Z9c96d67VMavjn8BUR1RqKHKjCm1gLbX0W/QC98zu6Uqk4fhm3BKkd8dvIyTYPv1n2vIwxI+e+egv9Oqmqhe1jWAsTl3qzEFkss+aPzN2B3nabeYhQ=
Received: from DM6PR11MB4410.namprd11.prod.outlook.com (2603:10b6:5:1d9::11)
 by DM5PR11MB1561.namprd11.prod.outlook.com (2603:10b6:4:a::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.21; Wed, 2 Sep 2020 21:46:46 +0000
Received: from DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::d02d:3a87:869f:1544]) by DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::d02d:3a87:869f:1544%5]) with mapi id 15.20.3326.025; Wed, 2 Sep 2020
 21:46:46 +0000
From: "Ren, Zhikui" <zhikui.ren@intel.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Need update CI build config for new repo smbios-mdr.
Thread-Topic: Need update CI build config for new repo smbios-mdr.
Thread-Index: AdZ8T8WMWe7UjTu1QQafCbbBYikJpQBJL32AAHDrLbAAUQMGgAAAodOAABNvhOAAHQrrAAAFaJ4AAASRQIA=
Date: Wed, 2 Sep 2020 21:46:45 +0000
Message-ID: <DM6PR11MB4410D360CFFE2F5EF99B64F3942F0@DM6PR11MB4410.namprd11.prod.outlook.com>
References: <SN6PR11MB35203BE16B23BAD1193FCB9F90550@SN6PR11MB3520.namprd11.prod.outlook.com>
 <5a9a43046be525f9ed5d23bc40eac14d4ed8d53c.camel@fuzziesquirrel.com>
 <SN6PR11MB35205154DB67E625EF74388A90510@SN6PR11MB3520.namprd11.prod.outlook.com>
 <20200901162333.GT3532@heinlein> <20200901164139.GV3532@heinlein>
 <SN6PR11MB352047845E48681E8F71B139902F0@SN6PR11MB3520.namprd11.prod.outlook.com>
 <20200902154944.GW3532@heinlein>
 <5e9cb6fe-ae95-422b-2d06-1ad2db40916e@linux.intel.com>
In-Reply-To: <5e9cb6fe-ae95-422b-2d06-1ad2db40916e@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.11.44.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5639995d-217a-4b56-320b-08d84f89b092
x-ms-traffictypediagnostic: DM5PR11MB1561:
x-microsoft-antispam-prvs: <DM5PR11MB156173AAC950A66334A3475B942F0@DM5PR11MB1561.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XRiaK2cBeXuDEbzY8P6147ZDv0uV8jmG3Preua2jPefrCOfgyAjMnVBBIjRfDehs/oYN0csCrgxsgWq/4ck90Y5t9067/dYZfvx4hn5khd8TK1Mcj6DmuTGXNg3krgOJOg6NxkvD6MPf1M6TIK+THBlEt522IEP30Ei96+bjJCtbeBb8u1oKIQPOCANTf1g+awQUy03TagAjp6c8iu9lA64uWfjI38YiP3EIR/wnbqH+cCSq1oa5E7Yur4xXgJfvp8EQA9Pgl/6+VvUXX4hvoZluJo/NMoNcFYwDrT5WyS7T+qOP8wYePn3dnP+6tasKZbebAiFwxPPZBSM0/xt7ivyimW/oN72nqZ9+SxU5ERpky/uyuFzsP+KCvyJsifnN7ALYxLqcF0DqfjIuHidVhw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(2906002)(66946007)(66446008)(66556008)(110136005)(66476007)(76116006)(26005)(316002)(186003)(64756008)(55016002)(9686003)(33656002)(5660300002)(71200400001)(8936002)(66574015)(83380400001)(966005)(6506007)(53546011)(52536014)(86362001)(478600001)(7696005)(15650500001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: zXBRB9p7TMUCt6pnARmX9m5HgGOvvmQSKi5nbgpuEcLy7xCJokS+gBDCeCnD6JF8LVD39jeuOFciPpU0shU2FKT4XksbXOUXBwE9F9N0BZKW8lShx4uDH0pDx2l3p6zVrz3QEVeFCl+8itFlmDpf4ACP0WEPG3wC3h/8jokkWPg+YMElSrlxS9adk6DhxvBvpD9yP18b5m4dhKFsxYvkAFUXHuUSuVrUZeV89qUmw+p9v73JyXzLjSW30IBB/R7o2KnLa6RoYYG1SsGGBbPzw0cOm4SorI8wrFrYE7khF+xHU2xVDOebtl/WpuEgBiCh0IvLP8G2kiwx2zmlQlKaQbrNoWxwSaKOBWKvvz6U3/jReOSdh1TOJm2VpsFj/AKXa0D/TyUtDyhKAwEqXSYkr4DOEpSWrpkndpkdBfuUPFHaFSTs6bTaBvA6Ttyj8CNWUZHZJGyWS4w/fnLjHcaehheNvFZlJ25jdoqCMHEpqolGeYo4f1NRAJhzFY/JmVYsho3JxRGuK2UxN0vmXZXd6OF6+wsixHHbmwXx5TWabLvm7VeVxS7nKO2a0faotZHh8vXP6R16JL1hs51vW0N5r8K3WbqwUxIL2impGXmrt7HYyu6FpcjWBmrpf46BkoTMNzUwujL8ho4BUimr+wMedw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5639995d-217a-4b56-320b-08d84f89b092
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2020 21:46:46.2960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 24YO2qY2Q7zFG007oFV3jDj0bFPA1GrAWcly3EDCjJAiZylnM7GdWffSAiE7WrPjOK/bHVV0AoyWo4LBbg85Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1561
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

Thanks, Jason.

Kwin,

I have updated the patch that is compatible with the current dbus interface=
, it builds successfully now.
https://gerrit.openbmc-project.xyz/c/openbmc/smbios-mdr/+/36177

Thanks,
Zhikui



-----Original Message-----
From: openbmc <openbmc-bounces+zhikui.ren=3Dintel.com@lists.ozlabs.org> On =
Behalf Of Bills, Jason M
Sent: Wednesday, September 2, 2020 11:25 AM
To: openbmc@lists.ozlabs.org
Subject: Re: Need update CI build config for new repo smbios-mdr.



On 9/2/2020 8:49 AM, Patrick Williams wrote:
> On Wed, Sep 02, 2020 at 02:02:00AM +0000, Wang, Kuiying wrote:
>> Hi Williams,
>> The key thing is sdbusplus interface is not match.
>> You could config CI based on this patch=20
>> https://gerrit.openbmc-project.xyz/#/c/openbmc/smbios-mdr/+/36011/
>> That's ok, if it can pass the build.
>>
>> Thanks,
>> Kwin.
>>
>=20
> Here is a snippet of the compile log:
>=20
> /home/jenkins-slave/workspace/ci-repository/openbmc/smbios-mdr/src/cpuinf=
o_main.cpp:34:10: fatal error: peci.h: No such file or directory
>     34 | #include <peci.h>
>        |          ^~~~~~~~
> compilation terminated.
>=20
>=20
> This one might be a missing dependency?  Where is 'peci.h' from?  Is=20
> it from a kernel header for the ioctls or some other repository?  Do=20
> you need to stub this out when building on x86?
peci.h comes from libpeci which needs to be pulled in as an ExternalProject=
 in CMake when not building with Yocto.

Here is an example of how I got libpeci working for the host-error-monitor =
to pass CI:=20
https://gerrit.openbmc-project.xyz/c/openbmc/host-error-monitor/+/32545/1/C=
MakeLists.txt.

>=20
>=20
> make[2]: *** [CMakeFiles/cpuinfoapp.dir/build.make:63:=20
> CMakeFiles/cpuinfoapp.dir/src/cpuinfo_main.cpp.o] Error 1
> make[1]: *** [CMakeFiles/Makefile2:78: CMakeFiles/cpuinfoapp.dir/all]=20
> Error 2
> make[1]: *** Waiting for unfinished jobs....
> In file included from /home/jenkins-slave/workspace/ci-repository/openbmc=
/smbios-mdr/src/cpu.cpp:17:
> /home/jenkins-slave/workspace/ci-repository/openbmc/smbios-mdr/include/cp=
u.hpp:113:17: error: =E2std::string phosphor::smbios::Cpu::processorSocket(=
std::string)=E2 marked =E2override=E2, but does not override
>    113 |     std::string processorSocket(std::string value) override;
>=20
> This appears to be a case where the current phosphor-dbus-interfaces=20
> doesn't match whatever your commit is trying to do.  You've got=20
> additional methods for handling dbus properties, but those properties=20
> do not exist in phosphor-dbus-interface's Cpu interface.
>=20
> I suspect you're trying to implement
> xyz/openbmc_project/Inventory/Item/Cpu, which has a 'Socket' property=20
> but not a 'ProcessorSocket'.  If I recall, this happened in the code=20
> review where the "Processor" part was requested to be removed since it=20
> was redundant.
>=20
> There are a number of other properties in your compile fail that need=20
> similar updating.
>=20
