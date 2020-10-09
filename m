Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B7C288958
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 14:52:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C77K343nlzDqMF
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 23:52:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=nam12-bn8-obe.outbound.protection.outlook.com
 (client-ip=40.107.237.63; helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-amdcloud-onmicrosoft-com header.b=T5yIVl6s; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C77Gd6PZWzDqCw
 for <openbmc@lists.ozlabs.org>; Fri,  9 Oct 2020 23:50:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkYTTv5+VCGx8cKnx2FHKBCiGWWbB4ZqYu05BipcKDFZLqWmYHdiDI+AAOM4AZ59nuWQ0wJcBk+JaR4QyF1Ai1z3xk/5Fx7A5jqHEKwCgbLW5aiQ/pj/a0EveLkD6W+lLSHBPfv7BaU8wsaXJ4MlJmtmvKE3Nh8Sc8uGinA2Kgi3tXWVC/RDXfro1SLbyRFZ1BKjFduyl2Q7HB900i1dvNhJ9ao5HdBnG6GMx/QZShhSsJ7b2aDKk00sCa0IKi7oIFwPCzUIUcJgQhPO2rW5+M0Uo33qqt/nXBKsvqLRLtknHu1R0/oCYOqYjpjb/gxLvwyxtvdvuTG/GgsmFRsgtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSRjf05MFLQdceslO9amgMKzyevosvPnpCDU+oGzttA=;
 b=Km1PKCudJJ8o8Ju3kZy6bxQto3cxn6GjerVv0vokpimUR/hJRMQmxr9eBQ5b1ubJwzvlOGiQhXm1aUzdeIejvfqbeMs/Uej7BSg4pdpyuVrGAz6C4xRWAvuaVd+p938UphQyIlZ8Nn8EsrWkjjX7yuhL2wesqAvjdBJKfJ5w7jAyq1l8Oq/mpKheEzx9uaMOc+jopi694bxbhkQIXquMa3rjRUt4h1LYwDkigU0xcvcBASs7zEFu86dEdIid4AwE2CNg04NV7AGcQu0929/cdhyxxxUD02SO17ggobv73cmRvzApF4QV1u/VngZQKUCEUgep1n8y9JHd+qujzliJcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSRjf05MFLQdceslO9amgMKzyevosvPnpCDU+oGzttA=;
 b=T5yIVl6s0OIaa3TgacTZUzn68Fr1rOcvC8irARyoOIasn0PbsW/i/gTLwmjFPEVOQG6EcSNZYvLoe2OTieBxfypgZC0mi+c1YruwYQIz+J7H5d4vc1+5uomPEZMJrPm54H+PQH7n697WJJOIquctf5Zp4gq491NyhoasguHW4kk=
Received: from SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:26::28)
 by SN6PR12MB2685.namprd12.prod.outlook.com (2603:10b6:805:67::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Fri, 9 Oct
 2020 12:50:39 +0000
Received: from SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::10c4:c28f:2a60:c805]) by SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::10c4:c28f:2a60:c805%7]) with mapi id 15.20.3455.024; Fri, 9 Oct 2020
 12:50:39 +0000
From: "Venkatesh, Supreeth" <Supreeth.Venkatesh@amd.com>
To: J Dhanasekar <jdhanasekar@velankanigroup.com>
Subject: RE: build error in AMD Ethanolx
Thread-Topic: build error in AMD Ethanolx
Thread-Index: AQHWnJc4VRnZ7yMP1UWaIJ38JUmTRqmMNcCAgAAJToCAADjcAIAABKyAgAC7Z4CAAIXxgIAABYiAgAD5PoCAAH8YoA==
Date: Fri, 9 Oct 2020 12:50:39 +0000
Message-ID: <SN1PR12MB25422E6E38D7E09D0C35793596080@SN1PR12MB2542.namprd12.prod.outlook.com>
References: <CAOW9pY0o7R4YSYX1WrOUQx-BJ0SG0BLs+NBCoHtgDOndXf4+Aw@mail.gmail.com>
 <c4ef651d-3589-1580-41dd-17959d00df11@amd.com>
 <CAOW9pY1hj4sDp_n2Uk87VEPicaoVZn5QuJcsCK_pS7o9ochb4w@mail.gmail.com>
 <ecc852ee-04ff-c27e-3fe0-fdeda6cb7f34@amd.com>
 <CADVsX8-q58tiaPdthofa4rRgcQ6rS3qc9tEQXuzMgG6TpnbnCg@mail.gmail.com>
 <CAOW9pY0YcQK3+68te6B=YEjzRFxvxtXYoewKGUWd3Jh6rgjKDg@mail.gmail.com>
 <7186ff22-3515-fe72-e2fd-dbd8022e31b9@amd.com>
 <CAOW9pY1YuXbA=nq+4U5ZLLjqELxZv-6ytxPYTFh1e96wD7faRA@mail.gmail.com>
 <CAOW9pY1JUmJj9vJ1XJVGjYfyyeQn85o7=7kxmpRsRLv0WdpUeQ@mail.gmail.com>
In-Reply-To: <CAOW9pY1JUmJj9vJ1XJVGjYfyyeQn85o7=7kxmpRsRLv0WdpUeQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-10-09T12:50:32Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=56437bef-5c5a-42ba-b183-00001a5af37b;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-10-09T12:50:38Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: 8c9641cd-d9b9-4d7e-abf5-0000184e64ae
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-10-09T12:50:24Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: e285f34c-1547-407a-9c7e-000037cb81ec
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: velankanigroup.com; dkim=none (message not signed)
 header.d=none; velankanigroup.com; dmarc=none action=none header.from=amd.com; 
x-originating-ip: [99.185.131.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2e14d532-1b3a-4234-cb30-08d86c51ecbc
x-ms-traffictypediagnostic: SN6PR12MB2685:
x-microsoft-antispam-prvs: <SN6PR12MB26856C3E4991C529343044FA96080@SN6PR12MB2685.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YRbIj0lAu0BgKHVPDNnlsDdPIQM9M5KHiFyiHkHqnneShux5PfNkV8MHwRQ9cUP3jFkGDuv/LOsF4OvpeFJUjmYNIYDoy5ZyF2N96FlOuUPBtzVJ0BCWY75tTQ0+In4bBg3RxUnrqUv1x9DRLudEjzmedNpTL+SAkB9LVPFsndXc1AjPhf0guMKJyDWUjbMA9szC4+uJM4U7cNQIibptBZJSvnIYWr6shKOld6AUmys+x3cJSNGTKN5MQ/wO3AdmWC0e3GABD3h7dMUE/CoPrqA6keBb0+qJp1yq/7hkDDW7/izkcJfJfyQBvzwF4dhF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2542.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(396003)(376002)(39860400002)(71200400001)(99936003)(8936002)(33656002)(55016002)(7696005)(66616009)(66946007)(6916009)(66446008)(64756008)(66476007)(66556008)(26005)(86362001)(9686003)(478600001)(4326008)(186003)(76116006)(53546011)(52536014)(54906003)(6506007)(5660300002)(83380400001)(8676002)(316002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ruBY9dyHdcmoUR7+1edu/B/Wlc/CJFQOMCAXps5frZWpPYrTrdCaGo8hRORxPMVK8PeAsY6gy4Pa8w+UZXuEseApp/XUr8vGXmiXHo3RQmkZWuJXFoCJF+hBsKCSPYAf4Ayu9W7cmfGuELhu2JIifITijIEuv8wE6OfP5e4IVcIYr8UKI5FTSoxfrU0M+3mFJVD1S+t3s1Y1xqEjwgIS3qig/uuJn9bnyGkG+sQHkAG2p75K0bFOdEMRsztGjfywJ2Hl5luJ23bQK826fN8Z3d1DuyTHLcFTO373zunywhWAyEGQUyMUG879VV/XJuP1DkasLBxoLX0j200YxibqiDZy/PfJ2QidXwf949qScLLqy50ib82fvfUc/gwoezDYTi7CmCiAjqqB0Yc/DftFxDln92PdOvlntabgrlir1yn10l2iKBQsx33To61LBmNAaVxyLa5shs4lCrqFOtFpxP0UikFlqK2WwhgFkEXU4JlYzOETU4sROLURoNRLGeZM3C//eaeAjK4uk/neAKs2UhraSwzmmKV60W5RJwJuwbpOfV7HmAJgkmr/6DxcTh4R2GtsFCrgMOdJHakjeU/2YVOuCwktE2NfaE9wqOvE827CFivCCKuJjzTA0CdeRxsNQi7y8IGQUupkCYibegjlQQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/related;
 boundary="_004_SN1PR12MB25422E6E38D7E09D0C35793596080SN1PR12MB2542namp_";
 type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2542.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e14d532-1b3a-4234-cb30-08d86c51ecbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2020 12:50:39.1102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d2W491XReoiF90O0H+etRuSPxePp8AODw9j8rzU++yzIpslZ13PhG2lCJDhvJnL6msQ8vogtd8aTYEQRdUwhLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2685
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ramakrishnan Kumaraswamy <ramakrishnan@bydesignindia.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_004_SN1PR12MB25422E6E38D7E09D0C35793596080SN1PR12MB2542namp_
Content-Type: multipart/alternative;
	boundary="_000_SN1PR12MB25422E6E38D7E09D0C35793596080SN1PR12MB2542namp_"

--_000_SN1PR12MB25422E6E38D7E09D0C35793596080SN1PR12MB2542namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Public Use]

Hi Dhanasekar,

Thanks for helping out.
We will make DT for Daytona CRB available latest by early next month  or en=
d of this month.

Thanks,
Supreeth Venkatesh
System Manageability Architect  |  AMD
Server Software
[cid:image001.png@01D69E10.D86632D0]

From: J Dhanasekar <jdhanasekar@velankanigroup.com>
Sent: Friday, October 9, 2020 12:14 AM
To: Venkatesh, Supreeth <Supreeth.Venkatesh@amd.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Ramakrishnan Kumaraswamy <=
ramakrishnan@bydesignindia.net>
Subject: Re: build error in AMD Ethanolx

[CAUTION: External Email]
Hi Supreeth,

If  the DTSs file for Daytona CRB is available, I will work parallel to ena=
ble openBMC for Daytona CRB.


Thanks,
Dhanasekar

On Thu, Oct 8, 2020 at 7:51 PM J Dhanasekar <jdhanasekar@velankanigroup.com=
<mailto:jdhanasekar@velankanigroup.com>> wrote:
Supreeth,

Thanks for the info.
Will OpenBMC on Daytona available end of this year?.

Thanks,
Dhanasekar

On Thu, Oct 8, 2020 at 7:31 PM Supreeth Venkatesh <supreeth.venkatesh@amd.c=
om<mailto:supreeth.venkatesh@amd.com>> wrote:
On 10/8/20 1:02 AM, J Dhanasekar wrote:
> [CAUTION: External Email]
> Hi Supreeth,
>
> I was able to build the AMD Ethanolx source successfully. I have executed=
 your mentioned commands only,
>
> *. setup ethanolx
> bitbake obmc-phosphor-image  *
>
> I built the code in normal user privilege, not root user.
> Thanks for your support.
Thanks for letting me know.
>
> Do you have a linux DTS  for BMC of DaytonaCRB ?.
Unfortunately, we are not supporting Daytona CRB yet, but we are working to=
wards enabling OpenBMC on Daytona soon. Stay tuned.

>
> -Dhanasekar
>
> On Thu, Oct 8, 2020 at 12:21 AM Anton Kachalov <rnouse@google.com<mailto:=
rnouse@google.com> <mailto:rnouse@google.com<mailto:rnouse@google.com>>> wr=
ote:
>
>     Hey,
>
>     would you mind to find the *log.do_rootfs* file for obmc-phosphor-ini=
tramfs under build/tmp/work. This task has failed.
>
>     For instance, on qemuarm target the path looks like this (for obmc-ph=
osphor-*image* instead of obmc-phosphor-*initramfs*):
>
>     build/tmp/work/qemuarm-openbmc-linux-gnueabi/obmc-phosphor-image/1.0-=
r0/temp/log.do_rootfs
>
>     On Wed, 7 Oct 2020 at 20:35, Supreeth Venkatesh <supreeth.venkatesh@a=
md.com<mailto:supreeth.venkatesh@amd.com> <mailto:supreeth.venkatesh@amd.co=
m<mailto:supreeth.venkatesh@amd.com>>> wrote:
>
>         On 10/7/20 10:11 AM, J Dhanasekar wrote:
>         > [CAUTION: External Email]
>         > Hi Supreeth,
>         >
>         > Thanks for the reply,
>         >
>         > I have attached the complete error log. Please view it.
>         >
>         > I have removed the build folder and created a new one twice. St=
ill I am seeing the same error.
>         This may be environment issue in your setup.
>         I am not seeing this error in my environment with the latest mast=
er.
>
>         . setup ethanolx
>         bitbake bitbake obmc-phosphor-image
>
>
>         "WARNING: Host distribution "ubuntu-18.04" has not been validated=
 with this version of the build system; you may possibly experience unexpec=
ted failures. It is recommended that you use a tested distribution.
>         NOTE: Resolving any missing task queue dependencies
>
>         Build Configuration:
>         BB_VERSION           =3D "1.47.0"
>         BUILD_SYS            =3D "x86_64-linux"
>         NATIVELSBSTRING      =3D "ubuntu-18.04"
>         TARGET_SYS           =3D "arm-openbmc-linux-gnueabi"
>         MACHINE              =3D "ethanolx"
>         DISTRO               =3D "openbmc-phosphor"
>         DISTRO_VERSION       =3D "0.1.0"
>         TUNE_FEATURES        =3D "arm thumb arm1176jzs"
>         TARGET_FPU           =3D "soft"
>         meta
>         meta-oe
>         meta-networking
>         meta-perl
>         meta-python
>         meta-phosphor
>         meta-aspeed
>         meta-amd
>         meta-ethanolx        =3D "master:c3d88e4d9fcc08e1aae7cc9d0337c026=
1e996c64""
>
>         ....
>         ....
>         ....
>
>         NOTE: Running task 4241 of 4243 (/home/supvenka/work/openbmc_upst=
ream/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:do_image_=
complete)
>         NOTE: recipe obmc-phosphor-image-1.0-r0: task do_image_complete: =
Started
>         NOTE: recipe obmc-phosphor-image-1.0-r0: task do_image_complete: =
Succeeded
>         NOTE: Running task 4242 of 4243 (/home/supvenka/work/openbmc_upst=
ream/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:do_popula=
te_lic_deploy)
>         NOTE: recipe obmc-phosphor-image-1.0-r0: task do_populate_lic_dep=
loy: Started
>         NOTE: recipe obmc-phosphor-image-1.0-r0: task do_populate_lic_dep=
loy: Succeeded
>         NOTE: Running noexec task 4243 of 4243 (/home/supvenka/work/openb=
mc_upstream/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:do=
_build)
>         NOTE: Tasks Summary: Attempted 4243 tasks of which 2 didn't need =
to be rerun and all succeeded."
>         >
>         > Thanks,
>         > Dhanasekar
>         >
>         > On Wed, Oct 7, 2020 at 8:08 PM Supreeth Venkatesh <supreeth.ven=
katesh@amd.com<mailto:supreeth.venkatesh@amd.com> <mailto:supreeth.venkates=
h@amd.com<mailto:supreeth.venkatesh@amd.com>> <mailto:supreeth.venkatesh@am=
d.com<mailto:supreeth.venkatesh@amd.com> <mailto:supreeth.venkatesh@amd.com=
<mailto:supreeth.venkatesh@amd.com>>>> wrote:
>         >
>         >     On 10/7/20 5:44 AM, J Dhanasekar wrote:
>         >     > [CAUTION: External Email]
>         >     > Hi openBMC,
>         >     Hi Dhanasekar
>         >
>         >     >
>         >     > I am working to build BMC for AMD Ethanolx platform,
>         >     Nice to hear.
>         >     >
>         >     > After running  *bitbake u-boot-aspeed* and *bitbake obmc-=
phosphor-image*,
>         >     > I am getting below error,
>         >     >
>         >     > ERROR: obmc-phosphor-initramfs-1.0-r0 do_rootfs: The post=
install intercept hook 'update_gio_module_cache' failed, details in /home/u=
ser/dhanasekar/BMC/AMD/openbmc/build/tmp/work/ethanolx-openbmc-linux-gnueab=
i/obmc-phosphor-initramfs/1.0-r0/temp/log.do_rootfs
>         >     > ERROR: Logfile of failure stored in: /home/user/dhanaseka=
r/BMC/AMD/openbmc/build/tmp/work/ethanolx-openbmc-linux-gnueabi/obmc-phosph=
or-initramfs/1.0-r0/temp/log.do_rootfs.14182
>         >     > ERROR: Task (/home/user/dhanasekar/BMC/AMD/openbmc/meta-p=
hosphor/recipes-phosphor/images/obmc-phosphor-initramfs.bb:do_rootfs) faile=
d with exit code '1'
>         >     >
>         >     Can you send me the complete build logs?
>         >
>         >     > Please help me to fix the error,
>         >     rm the build folder and retry once.
>         >     I will build it once today as well and confirm. It may not =
been tested with latest upstream changes.
>         >
>         >     >
>         >     > Thanks,
>         >     > Dhanasekar,
>         >
>

--_000_SN1PR12MB25422E6E38D7E09D0C35793596080SN1PR12MB2542namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
p.msipheader251902e5, li.msipheader251902e5, div.msipheader251902e5
	{mso-style-name:msipheader251902e5;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"msipheader251902e5" style=3D"margin:0in"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#317100">[AMD Publ=
ic Use]</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi Dhanasekar,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks for helping out.<o:p></o:p></p>
<p class=3D"MsoNormal">We will make DT for Daytona CRB available latest by =
early next month &nbsp;or end of this month.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:black">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Arial&quot;,sans-serif;color:black">Supreeth Venkatesh</span></b><span sty=
le=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black=
"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Ari=
al&quot;,sans-serif;color:black">System Manageability Architect&nbsp;&nbsp;=
|<b>&nbsp;&nbsp;AMD</b><br>
Server Software<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black"><img width=3D"150" height=3D"35" style=3D"width:1.5625in;h=
eight:.3645in" id=3D"Picture_x0020_11" src=3D"cid:image001.png@01D69E10.D86=
632D0"></span><span style=3D"font-family:&quot;Arial&quot;,sans-serif;color=
:black"><o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> J Dhanasekar &lt;jdhanasekar@velankanig=
roup.com&gt; <br>
<b>Sent:</b> Friday, October 9, 2020 12:14 AM<br>
<b>To:</b> Venkatesh, Supreeth &lt;Supreeth.Venkatesh@amd.com&gt;<br>
<b>Cc:</b> OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;; Ramakrishnan =
Kumaraswamy &lt;ramakrishnan@bydesignindia.net&gt;<br>
<b>Subject:</b> Re: build error in AMD Ethanolx<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">[CAUTION: External Email] <o:p></o:p></p>
<div>
<div>
<p class=3D"MsoNormal">Hi Supreeth, <o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">If&nbsp; the DTSs file for Daytona CRB is available,=
 I will work parallel to enable openBMC for Daytona CRB.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Dhanasekar<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">On Thu, Oct 8, 2020 at 7:51 PM J Dhanasekar &lt;<a h=
ref=3D"mailto:jdhanasekar@velankanigroup.com">jdhanasekar@velankanigroup.co=
m</a>&gt; wrote:<o:p></o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-=
bottom:5.0pt">
<div>
<p class=3D"MsoNormal">Supreeth, <o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks for the info.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Will OpenBMC on Daytona&nbsp;available&nbsp;end of t=
his year?.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Dhanasekar<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">On Thu, Oct 8, 2020 at 7:31 PM Supreeth Venkatesh &l=
t;<a href=3D"mailto:supreeth.venkatesh@amd.com" target=3D"_blank">supreeth.=
venkatesh@amd.com</a>&gt; wrote:<o:p></o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-=
bottom:5.0pt">
<p class=3D"MsoNormal">On 10/8/20 1:02 AM, J Dhanasekar wrote:<br>
&gt; [CAUTION: External Email]<br>
&gt; Hi Supreeth,<br>
&gt; <br>
&gt; I was able to build the AMD Ethanolx source successfully. I have execu=
ted your mentioned commands only,<br>
&gt; <br>
&gt; *. setup ethanolx<br>
&gt; bitbake obmc-phosphor-image&nbsp;&nbsp;*<br>
&gt; <br>
&gt; I built the code in normal&nbsp;user privilege, not root user.&nbsp;<b=
r>
&gt; Thanks for your support.<br>
Thanks for letting me know.<br>
&gt; <br>
&gt; Do you have a linux DTS&nbsp; for BMC of DaytonaCRB ?.<br>
Unfortunately, we are not supporting Daytona CRB yet, but we are working to=
wards enabling OpenBMC on Daytona soon. Stay tuned.<br>
<br>
&gt; <br>
&gt; -Dhanasekar<br>
&gt; <br>
&gt; On Thu, Oct 8, 2020 at 12:21 AM Anton Kachalov &lt;<a href=3D"mailto:r=
nouse@google.com" target=3D"_blank">rnouse@google.com</a> &lt;mailto:<a hre=
f=3D"mailto:rnouse@google.com" target=3D"_blank">rnouse@google.com</a>&gt;&=
gt; wrote:<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp;Hey,<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp;would you mind to find the&nbsp;*log.do_rootfs* fil=
e for obmc-phosphor-initramfs under build/tmp/work. This task has failed.<b=
r>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp;For instance, on qemuarm target the path looks like=
 this (for obmc-phosphor-*image* instead of obmc-phosphor-*initramfs*):<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp;build/tmp/work/qemuarm-openbmc-linux-gnueabi/obmc-p=
hosphor-image/1.0-r0/temp/log.do_rootfs<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp;On Wed, 7 Oct 2020 at 20:35, Supreeth Venkatesh &lt=
;<a href=3D"mailto:supreeth.venkatesh@amd.com" target=3D"_blank">supreeth.v=
enkatesh@amd.com</a> &lt;mailto:<a href=3D"mailto:supreeth.venkatesh@amd.co=
m" target=3D"_blank">supreeth.venkatesh@amd.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;On 10/7/20 10:11 AM, J Dhanasekar wro=
te:<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; [CAUTION: External Email]<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; Hi Supreeth,<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; Thanks for the reply,<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; I have attached the complete err=
or log. Please view it.&nbsp;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; I have removed the build folder =
and created a new one twice. Still I am seeing the same error.<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;This may be environment issue in your=
 setup.<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;I am not seeing this error in my envi=
ronment with the latest master.<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;. setup ethanolx<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bitbake bitbake obmc-phosphor-image<b=
r>
&gt; <br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;WARNING: Host distribution &quo=
t;ubuntu-18.04&quot; has not been validated with this version of the build =
system; you may possibly experience unexpected failures. It is recommended =
that you use a tested distribution.<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NOTE: Resolving any missing task queu=
e dependencies<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Build Configuration:<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;BB_VERSION&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;=3D &quot;1.47.0&quot;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;BUILD_SYS&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; =3D &quot;x86_64-linux&quot;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NATIVELSBSTRING&nbsp; &nbsp; &nbsp; =
=3D &quot;ubuntu-18.04&quot;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TARGET_SYS&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;=3D &quot;arm-openbmc-linux-gnueabi&quot;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MACHINE&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; =3D &quot;ethanolx&quot;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DISTRO&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;=3D &quot;openbmc-phosphor&quot;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DISTRO_VERSION&nbsp; &nbsp; &nbsp; &n=
bsp;=3D &quot;0.1.0&quot;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TUNE_FEATURES&nbsp; &nbsp; &nbsp; &nb=
sp; =3D &quot;arm thumb arm1176jzs&quot;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TARGET_FPU&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;=3D &quot;soft&quot;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;meta&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;meta-oe&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;meta-networking&nbsp; &nbsp; &nbsp;<b=
r>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;meta-perl&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;meta-python&nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;meta-phosphor&nbsp; &nbsp; &nbsp; &nb=
sp;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;meta-aspeed&nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;meta-amd&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;meta-ethanolx&nbsp; &nbsp; &nbsp; &nb=
sp; =3D &quot;master:c3d88e4d9fcc08e1aae7cc9d0337c0261e996c64&quot;&quot;<b=
r>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;....<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;....<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;....<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NOTE: Running task 4241 of 4243 (/hom=
e/supvenka/work/openbmc_upstream/meta-phosphor/recipes-phosphor/images/obmc=
-phosphor-image.bb:do_image_complete)<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NOTE: recipe obmc-phosphor-image-1.0-=
r0: task do_image_complete: Started<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NOTE: recipe obmc-phosphor-image-1.0-=
r0: task do_image_complete: Succeeded<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NOTE: Running task 4242 of 4243 (/hom=
e/supvenka/work/openbmc_upstream/meta-phosphor/recipes-phosphor/images/obmc=
-phosphor-image.bb:do_populate_lic_deploy)<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NOTE: recipe obmc-phosphor-image-1.0-=
r0: task do_populate_lic_deploy: Started<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NOTE: recipe obmc-phosphor-image-1.0-=
r0: task do_populate_lic_deploy: Succeeded<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NOTE: Running noexec task 4243 of 424=
3 (/home/supvenka/work/openbmc_upstream/meta-phosphor/recipes-phosphor/imag=
es/obmc-phosphor-image.bb:do_build)<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NOTE: Tasks Summary: Attempted 4243 t=
asks of which 2 didn't need to be rerun and all succeeded.&quot;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; Thanks,<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; Dhanasekar<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; On Wed, Oct 7, 2020 at 8:08 PM S=
upreeth Venkatesh &lt;<a href=3D"mailto:supreeth.venkatesh@amd.com" target=
=3D"_blank">supreeth.venkatesh@amd.com</a> &lt;mailto:<a href=3D"mailto:sup=
reeth.venkatesh@amd.com" target=3D"_blank">supreeth.venkatesh@amd.com</a>&g=
t; &lt;mailto:<a href=3D"mailto:supreeth.venkatesh@amd.com" target=3D"_blan=
k">supreeth.venkatesh@amd.com</a>
 &lt;mailto:<a href=3D"mailto:supreeth.venkatesh@amd.com" target=3D"_blank"=
>supreeth.venkatesh@amd.com</a>&gt;&gt;&gt; wrote:<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;On 10/7/20 5:=
44 AM, J Dhanasekar wrote:<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt; [CAUTION=
: External Email]<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt; Hi openB=
MC,<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;Hi Dhanasekar=
<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt; I am wor=
king to build BMC for AMD Ethanolx platform,<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;Nice to hear.=
<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt; After ru=
nning&nbsp; *bitbake u-boot-aspeed* and *bitbake obmc-phosphor-image*,<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt; I am get=
ting below error,<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt; ERROR: o=
bmc-phosphor-initramfs-1.0-r0 do_rootfs: The postinstall intercept hook 'up=
date_gio_module_cache' failed, details in /home/user/dhanasekar/BMC/AMD/ope=
nbmc/build/tmp/work/ethanolx-openbmc-linux-gnueabi/obmc-phosphor-initramfs/=
1.0-r0/temp/log.do_rootfs<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt; ERROR: L=
ogfile of failure stored in: /home/user/dhanasekar/BMC/AMD/openbmc/build/tm=
p/work/ethanolx-openbmc-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/temp/l=
og.do_rootfs.14182<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt; ERROR: T=
ask (/home/user/dhanasekar/BMC/AMD/openbmc/meta-phosphor/recipes-phosphor/i=
mages/obmc-phosphor-initramfs.bb:do_rootfs) failed with exit code '1'<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;Can you send =
me the complete build logs?<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt; Please h=
elp me to fix the error,<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;rm the build =
folder and retry once.<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;I will build =
it once today as well and confirm. It may not been tested with latest upstr=
eam changes.<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt; Thanks,<=
br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt; Dhanasek=
ar,<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
&gt; <o:p></o:p></p>
</blockquote>
</div>
</blockquote>
</div>
</div>
</div>
</body>
</html>

--_000_SN1PR12MB25422E6E38D7E09D0C35793596080SN1PR12MB2542namp_--

--_004_SN1PR12MB25422E6E38D7E09D0C35793596080SN1PR12MB2542namp_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=3608;
	creation-date="Fri, 09 Oct 2020 12:50:38 GMT";
	modification-date="Fri, 09 Oct 2020 12:50:38 GMT"
Content-ID: <image001.png@01D69E10.D86632D0>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAJYAAAAjCAYAAAB2BvMkAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJ
bWFnZVJlYWR5ccllPAAAA0xpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdp
bj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6
eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTQ1IDc5LjE2
MzQ5OSwgMjAxOC8wOC8xMy0xNjo0MDoyMiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJo
dHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlw
dGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEu
MC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVz
b3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1N
OkRvY3VtZW50SUQ9InhtcC5kaWQ6Njg2Njg2MTAwRDEzMTFFOTg1OEREMTQ2NTU1Qjg5RTUiIHht
cE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6Njg2Njg2MEYwRDEzMTFFOTg1OEREMTQ2NTU1Qjg5RTUi
IHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTkgKE1hY2ludG9zaCkiPiA8
eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0iYWRvYmU6ZG9jaWQ6cGhvdG9zaG9w
OmRmOTM1NGYxLTFiODYtNDE0Zi1hYmE2LWIzZDg0OGUzYjMxYiIgc3RSZWY6ZG9jdW1lbnRJRD0i
YWRvYmU6ZG9jaWQ6cGhvdG9zaG9wOmRmOTM1NGYxLTFiODYtNDE0Zi1hYmE2LWIzZDg0OGUzYjMx
YiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0
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
PP9xuG0AAAAASUVORK5CYII=

--_004_SN1PR12MB25422E6E38D7E09D0C35793596080SN1PR12MB2542namp_--
