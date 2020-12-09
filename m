Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C2B2D39E2
	for <lists+openbmc@lfdr.de>; Wed,  9 Dec 2020 05:48:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrPhK3BrGzDqnB
	for <lists+openbmc@lfdr.de>; Wed,  9 Dec 2020 15:48:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=velankanigroup.com (client-ip=103.117.158.11;
 helo=sender-op-o11.zoho.in; envelope-from=jdhanasekar@velankanigroup.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=velankanigroup.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=velankanigroup.com
 header.i=jdhanasekar@velankanigroup.com header.a=rsa-sha256 header.s=zoho
 header.b=iJuRhpHk; dkim-atps=neutral
X-Greylist: delayed 916 seconds by postgrey-1.36 at bilbo;
 Wed, 09 Dec 2020 15:45:40 AEDT
Received: from sender-op-o11.zoho.in (sender-op-o11.zoho.in [103.117.158.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrPch6ltlzDqq5
 for <openbmc@lists.ozlabs.org>; Wed,  9 Dec 2020 15:45:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1607488213; cv=none; d=zohomail.in; s=zohoarc; 
 b=A6PTOgjnSUMKkh/Mytlg7BgsjZpw1pPnJvPvdWUkPEP6AJf7BquVcaL8+2LCUtykRQlckoP8zDrMtRpCqKCRgRjYytNP3Cl4YYxEyPj1OusfyiWQHVOhE8qVPfLDYXHguEOctr+bQrYUjGw1Z/WU9YaebRchbcblzlgb2PMwz8U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1607488213;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=835+t1XgOsXVY9P6V5fho+DV/0UFvKJWhG4L2izKvhk=; 
 b=cLDeXUnZ20p8f6b24mYqzUb5gYulSHlmZEu8jU6bBY81YvWoY2Z7CqpS5EMO99Y/bpwjjtEfg4A3Rysl7p6qlVtEAD8hzJNytH0vAhOhX84wtAwnG35RonXp9VD5BZ/x8NNpsKOAqyUlZUpG13gAfxMRVOjuD29spBlrKzhobdU=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=velankanigroup.com;
 spf=pass  smtp.mailfrom=jdhanasekar@velankanigroup.com;
 dmarc=pass header.from=<jdhanasekar@velankanigroup.com>
 header.from=<jdhanasekar@velankanigroup.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1607488213; 
 s=zoho; d=velankanigroup.com; i=jdhanasekar@velankanigroup.com;
 h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Subject:MIME-Version:Content-Type;
 bh=835+t1XgOsXVY9P6V5fho+DV/0UFvKJWhG4L2izKvhk=;
 b=iJuRhpHkJYTGbBtNfX5AhIgyNt7BlaZzEBSR96XpQAoRUdOID0l/SMrJxtyN2/ft
 QbNhc16bMUIt51dSCOK63WtjX4NFslVsumsD1sirPhKHRR4UiyKW40U7KR3GliFkzrm
 60zBIJSJ85S6DwHcfTWfqM7JG6IL7HUe+bRMD/0c=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1607488210819127.38573593101614;
 Wed, 9 Dec 2020 10:00:10 +0530 (IST)
Date: Wed, 09 Dec 2020 10:00:10 +0530
From: J Dhanasekar <jdhanasekar@velankanigroup.com>
To: "J Dhanasekar" <jdhanasekar@velankanigroup.com>
Message-Id: <17645c3875b.2c5baaee78626.1330147189989727125@velankanigroup.com>
In-Reply-To: <CAOW9pY0ZHtKu6n34j+5CzckQUo5A+ts23j+XrjmSrgMcfGXr9Q@mail.gmail.com>
References: <CAOW9pY0o7R4YSYX1WrOUQx-BJ0SG0BLs+NBCoHtgDOndXf4+Aw@mail.gmail.com>
 <c4ef651d-3589-1580-41dd-17959d00df11@amd.com>
 <CAOW9pY1hj4sDp_n2Uk87VEPicaoVZn5QuJcsCK_pS7o9ochb4w@mail.gmail.com>
 <ecc852ee-04ff-c27e-3fe0-fdeda6cb7f34@amd.com>
 <CADVsX8-q58tiaPdthofa4rRgcQ6rS3qc9tEQXuzMgG6TpnbnCg@mail.gmail.com>
 <CAOW9pY0YcQK3+68te6B=YEjzRFxvxtXYoewKGUWd3Jh6rgjKDg@mail.gmail.com>
 <7186ff22-3515-fe72-e2fd-dbd8022e31b9@amd.com>
 <CAOW9pY1YuXbA=nq+4U5ZLLjqELxZv-6ytxPYTFh1e96wD7faRA@mail.gmail.com>
 <CAOW9pY1JUmJj9vJ1XJVGjYfyyeQn85o7=7kxmpRsRLv0WdpUeQ@mail.gmail.com>
 <SN1PR12MB25422E6E38D7E09D0C35793596080@SN1PR12MB2542.namprd12.prod.outlook.com>
 <CAOW9pY1WMKjq4V55szP8A56MMZY2QotswnuEibK3sVt8SdjvCw@mail.gmail.com>
 <CAOW9pY1nyeawBBDYkPTt572pJ4KqiuCijbc4xz9N6dVgMhePvw@mail.gmail.com>
 <DM5PR12MB2535AD6C85C82069C465921796EE0@DM5PR12MB2535.namprd12.prod.outlook.com>
 <CAOW9pY0ZHtKu6n34j+5CzckQUo5A+ts23j+XrjmSrgMcfGXr9Q@mail.gmail.com>
Subject: Re: build error in AMD Ethanolx
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_243434_4973212.1607488210783"
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Zoho-Virus-Status: 1
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
Cc: "Venkatesh, Supreeth" <Supreeth.Venkatesh@amd.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ramakrishnan Kumaraswamy <ramakrishnan@bydesignindia.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_Part_243434_4973212.1607488210783
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Supreeth,



Is the DTS file for Milan ready ?.=C2=A0

If available, Please share with us.=C2=A0



Thanks,

Dhanasekar









---- On Fri, 06 Nov 2020 19:14:12 +0530 J Dhanasekar <jdhanasekar@velankani=
group.com> wrote ----



Thanks for the update.

We will be waiting for your update.=C2=A0



Thanks,

Dhanasekar




On Fri, Nov 6, 2020 at 5:16 AM Venkatesh, Supreeth <mailto:Supreeth.Venkate=
sh@amd.com> wrote:

[AMD Public Use]

=C2=A0

We are delayed a few weeks, will let you know, once we have it ready.

=C2=A0

Thanks,

Supreeth Venkatesh

System Manageability Architect=C2=A0=C2=A0|=C2=A0=C2=A0AMD
 Server Software



=C2=A0

From: J Dhanasekar <mailto:jdhanasekar@velankanigroup.com>=20
 Sent: Tuesday, November 3, 2020 9:32 AM
 To: Venkatesh, Supreeth <mailto:Supreeth.Venkatesh@amd.com>
 Cc: OpenBMC Maillist <mailto:openbmc@lists.ozlabs.org>; Ramakrishnan Kumar=
aswamy <mailto:ramakrishnan@bydesignindia.net>
 Subject: Re: build error in AMD Ethanolx


=C2=A0

[CAUTION: External Email]=20

Hi Supreeth,=20

=C2=A0


Is LDT for Daytona CRB ready ?.=C2=A0


Please provide me, if it is available.=C2=A0


=C2=A0


=C2=A0


Thanks,


Dhanasekar



=C2=A0

On Fri, Oct 9, 2020 at 6:59 PM J Dhanasekar <mailto:jdhanasekar@velankanigr=
oup.com> wrote:


Hi Supreeth,=20

=C2=A0


Nice=C2=A0to hear from you.=C2=A0


Thanks for the info.=C2=A0


=C2=A0


-Dhanasekar



=C2=A0

On Fri, Oct 9, 2020 at 6:20 PM Venkatesh, Supreeth <mailto:Supreeth.Venkate=
sh@amd.com> wrote:


[AMD Public Use]

=C2=A0

Hi Dhanasekar,

=C2=A0

Thanks for helping out.

We will make DT for Daytona CRB available latest by early next month =C2=A0=
or end of this month.

=C2=A0

Thanks,

Supreeth Venkatesh

System Manageability Architect=C2=A0=C2=A0|=C2=A0=C2=A0AMD
 Server Software



=C2=A0

From: J Dhanasekar <mailto:jdhanasekar@velankanigroup.com>=20
 Sent: Friday, October 9, 2020 12:14 AM
 To: Venkatesh, Supreeth <mailto:Supreeth.Venkatesh@amd.com>
 Cc: OpenBMC Maillist <mailto:openbmc@lists.ozlabs.org>; Ramakrishnan Kumar=
aswamy <mailto:ramakrishnan@bydesignindia.net>
 Subject: Re: build error in AMD Ethanolx


=C2=A0

[CAUTION: External Email]=20

Hi Supreeth,=20

=C2=A0


If=C2=A0 the DTSs file for Daytona CRB is available, I will work parallel t=
o enable openBMC for Daytona CRB.


=C2=A0


=C2=A0


Thanks,


Dhanasekar



=C2=A0

On Thu, Oct 8, 2020 at 7:51 PM J Dhanasekar <mailto:jdhanasekar@velankanigr=
oup.com> wrote:


Supreeth,=20

=C2=A0


Thanks for the info.


Will OpenBMC on Daytona=C2=A0available=C2=A0end of this year?.


=C2=A0


Thanks,


Dhanasekar



=C2=A0

On Thu, Oct 8, 2020 at 7:31 PM Supreeth Venkatesh <mailto:supreeth.venkates=
h@amd.com> wrote:


On 10/8/20 1:02 AM, J Dhanasekar wrote:
 > [CAUTION: External Email]
 > Hi Supreeth,
 >=20
 > I was able to build the AMD Ethanolx source successfully. I have execute=
d your mentioned commands only,
 >=20
 > *. setup ethanolx
 > bitbake obmc-phosphor-image=C2=A0=C2=A0*
 >=20
 > I built the code in normal=C2=A0user privilege, not root user.=C2=A0
 > Thanks for your support.
 Thanks for letting me know.
 >=20
 > Do you have a linux DTS=C2=A0 for BMC of DaytonaCRB ?.
 Unfortunately, we are not supporting Daytona CRB yet, but we are working t=
owards enabling OpenBMC on Daytona soon. Stay tuned.
=20
 >=20
 > -Dhanasekar
 >=20
 > On Thu, Oct 8, 2020 at 12:21 AM Anton Kachalov <mailto:rnouse@google.com=
 <mailto:mailto:rnouse@google.com>> wrote:
 >=20
 >=C2=A0 =C2=A0 =C2=A0Hey,
 >=20
 >=C2=A0 =C2=A0 =C2=A0would you mind to find the=C2=A0*log.do_rootfs* file =
for obmc-phosphor-initramfs under build/tmp/work. This task has failed.
 >=20
 >=C2=A0 =C2=A0 =C2=A0For instance, on qemuarm target the path looks like t=
his (for obmc-phosphor-*image* instead of obmc-phosphor-*initramfs*):
 >=20
 >=C2=A0 =C2=A0 =C2=A0build/tmp/work/qemuarm-openbmc-linux-gnueabi/obmc-pho=
sphor-image/1.0-r0/temp/log.do_rootfs
 >=20
 >=C2=A0 =C2=A0 =C2=A0On Wed, 7 Oct 2020 at 20:35, Supreeth Venkatesh <mail=
to:supreeth.venkatesh@amd.com <mailto:mailto:supreeth.venkatesh@amd.com>> w=
rote:
 >=20
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 10/7/20 10:11 AM, J Dhanasekar wrote=
:
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> [CAUTION: External Email]
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> Hi Supreeth,
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> Thanks for the reply,
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> I have attached the complete error lo=
g. Please view it.=C2=A0
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> I have removed the build folder and c=
reated a new one twice. Still I am seeing the same error.
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This may be environment issue in your s=
etup.
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I am not seeing this error in my enviro=
nment with the latest master.
 >=20
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0. setup ethanolx
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake bitbake obmc-phosphor-image
 >=20
 >=20
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"WARNING: Host distribution "ubuntu-18.=
04" has not been validated with this version of the build system; you may p=
ossibly experience unexpected failures. It is recommended that you use a te=
sted distribution.
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NOTE: Resolving any missing task queue =
dependencies
 >=20
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Build Configuration:
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D "1.47.0"
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D "x86_64-linux"
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D=
 "ubuntu-18.04"
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D "arm-openbmc-linux-gnueabi"
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D "ethanolx"
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D "openbmc-phosphor"
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D "0.1.0"
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D "arm thumb arm1176jzs"
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D "soft"
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta-oe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta-networking=C2=A0 =C2=A0 =C2=A0
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta-perl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta-python=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta-phosphor=C2=A0 =C2=A0 =C2=A0 =C2=
=A0
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta-aspeed=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta-amd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta-ethanolx=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D "master:c3d88e4d9fcc08e1aae7cc9d0337c0261e996c64""
 >=20
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0....
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0....
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0....
 >=20
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NOTE: Running task 4241 of 4243 (/home/=
supvenka/work/openbmc_upstream/meta-phosphor/recipes-phosphor/images/obmc-p=
hosphor-image.bb:do_image_complete)
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NOTE: recipe obmc-phosphor-image-1.0-r0=
: task do_image_complete: Started
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NOTE: recipe obmc-phosphor-image-1.0-r0=
: task do_image_complete: Succeeded
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NOTE: Running task 4242 of 4243 (/home/=
supvenka/work/openbmc_upstream/meta-phosphor/recipes-phosphor/images/obmc-p=
hosphor-image.bb:do_populate_lic_deploy)
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NOTE: recipe obmc-phosphor-image-1.0-r0=
: task do_populate_lic_deploy: Started
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NOTE: recipe obmc-phosphor-image-1.0-r0=
: task do_populate_lic_deploy: Succeeded
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NOTE: Running noexec task 4243 of 4243 =
(/home/supvenka/work/openbmc_upstream/meta-phosphor/recipes-phosphor/images=
/obmc-phosphor-image.bb:do_build)
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NOTE: Tasks Summary: Attempted 4243 tas=
ks of which 2 didn't need to be rerun and all succeeded."
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> Thanks,
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> Dhanasekar
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> On Wed, Oct 7, 2020 at 8:08 PM Supree=
th Venkatesh <mailto:supreeth.venkatesh@amd.com <mailto:mailto:supreeth.ven=
katesh@amd.com> <mailto:mailto:supreeth.venkatesh@amd.com <mailto:mailto:su=
preeth.venkatesh@amd.com>>> wrote:
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0On 10/7/20 5:44 AM=
, J Dhanasekar wrote:
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> [CAUTION: Extern=
al Email]
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> Hi openBMC,
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Hi Dhanasekar
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> I am working to =
build BMC for AMD Ethanolx platform,
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Nice to hear.
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> After running=C2=
=A0 *bitbake u-boot-aspeed* and *bitbake obmc-phosphor-image*,
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> I am getting bel=
ow error,
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> ERROR: obmc-phos=
phor-initramfs-1.0-r0 do_rootfs: The postinstall intercept hook 'update_gio=
_module_cache' failed, details in /home/user/dhanasekar/BMC/AMD/openbmc/bui=
ld/tmp/work/ethanolx-openbmc-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/t=
emp/log.do_rootfs
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> ERROR: Logfile o=
f failure stored in: /home/user/dhanasekar/BMC/AMD/openbmc/build/tmp/work/e=
thanolx-openbmc-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/temp/log.do_ro=
otfs.14182
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> ERROR: Task (/ho=
me/user/dhanasekar/BMC/AMD/openbmc/meta-phosphor/recipes-phosphor/images/ob=
mc-phosphor-initramfs.bb:do_rootfs) failed with exit code '1'
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Can you send me th=
e complete build logs?
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> Please help me t=
o fix the error,
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0rm the build folde=
r and retry once.
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0I will build it on=
ce today as well and confirm. It may not been tested with latest upstream c=
hanges.
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> Thanks,
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> Dhanasekar,
 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
 >
------=_Part_243434_4973212.1607488210783
Content-Type: multipart/related; 
	boundary="----=_Part_243435_1213886804.1607488210806"

------=_Part_243435_1213886804.1607488210806
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head>=
<meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type"></h=
ead><body ><div style=3D"font-family: Verdana, Arial, Helvetica, sans-serif=
; font-size: 10pt;"><div>Hi Supreeth,<br></div><div><br></div><div>Is the D=
TS file for Milan ready ?.&nbsp;<br></div><div>If available, Please share w=
ith us.&nbsp;<br></div><div><br></div><div>Thanks,<br></div><div>Dhanasekar=
</div><div><br></div><div data-zbluepencil-ignore=3D"true" id=3D"Zm-_Id_-Sg=
n"><div><br></div></div><div><br></div><div style=3D"" data-zbluepencil-ign=
ore=3D"true" class=3D"zmail_extra"><div><br></div><div id=3D"Zm-_Id_-Sgn1">=
---- On Fri, 06 Nov 2020 19:14:12 +0530 <b>J Dhanasekar &lt;jdhanasekar@vel=
ankanigroup.com&gt;</b> wrote ----<br></div><div><br></div><blockquote styl=
e=3D"border-left: 1px solid rgb(204, 204, 204); padding-left: 6px; margin: =
0px 0px 0px 5px;"><div><div dir=3D"ltr"><div>Thanks for the update.<br></di=
v><div>We will be waiting for your update.&nbsp;<br></div><div><br></div><d=
iv>Thanks,<br></div><div>Dhanasekar<br></div></div><div><br></div><div clas=
s=3D"x_87606753gmail_quote"><div class=3D"x_87606753gmail_attr" dir=3D"ltr"=
>On Fri, Nov 6, 2020 at 5:16 AM Venkatesh, Supreeth &lt;<a href=3D"mailto:S=
upreeth.Venkatesh@amd.com" target=3D"_blank">Supreeth.Venkatesh@amd.com</a>=
&gt; wrote:<br></div><blockquote style=3D"margin: 0.0px 0.0px 0.0px 0.8ex;b=
order-left: 1.0px solid rgb(204,204,204);padding-left: 1.0ex;" class=3D"x_8=
7606753gmail_quote"><div style=3D""><div class=3D"x_87606753gmail-m_-185171=
4550134129338WordSection1"><p style=3D"margin: 0.0in;" class=3D"x_87606753g=
mail-m_-1851714550134129338msipheader251902e5"><span class=3D"colour" style=
=3D"color:rgb(49, 113, 0)"><span class=3D"font" style=3D"font-family:Arial,=
 sans-serif"><span class=3D"size" style=3D"font-size:10pt">[AMD Public Use]=
</span></span></span><u></u><u></u><br></p><p class=3D"" style=3D"margin: 0=
px;"><u></u>&nbsp;<u></u><br></p><p class=3D"" style=3D"margin: 0px;">We ar=
e delayed a few weeks, will let you know, once we have it ready.<u></u><u><=
/u><br></p><p class=3D"" style=3D"margin: 0px;"><u></u>&nbsp;<u></u><br></p=
><div><p class=3D"" style=3D"margin: 0px;"><span class=3D"colour" style=3D"=
color:black"><span class=3D"font" style=3D"font-family:Arial, sans-serif"><=
span class=3D"size" style=3D"font-size:10pt">Thanks,<u></u><u></u></span></=
span></span><br></p><p class=3D"" style=3D"margin: 0px;"><b><span class=3D"=
colour" style=3D"color:black"><span class=3D"font" style=3D"font-family:Ari=
al, sans-serif"><span class=3D"size" style=3D"font-size:10pt">Supreeth Venk=
atesh</span></span></span></b><span class=3D"colour" style=3D"color:black">=
<span class=3D"font" style=3D"font-family:Arial, sans-serif"><span class=3D=
"size" style=3D"font-size:10pt"><u></u><u></u></span></span></span><br></p>=
<p class=3D"" style=3D"margin: 0px;"><span class=3D"colour" style=3D"color:=
black"><span class=3D"font" style=3D"font-family:Arial, sans-serif"><span c=
lass=3D"size" style=3D"font-size:9pt">System Manageability Architect&nbsp;&=
nbsp;|<b>&nbsp;&nbsp;AMD</b><br> Server Software<u></u><u></u></span></span=
></span></p><p class=3D"" style=3D"margin: 0px;"><span class=3D"colour" sty=
le=3D"color:black"><span class=3D"font" style=3D"font-family:Arial, sans-se=
rif"><img src=3D"cid:1759dcba5ad4cff311" style=3D"width: 1.5625in;height: 0=
.3645in;" height=3D"0.3645in" width=3D"1.5625in"></span></span><span class=
=3D"colour" style=3D"color:black"><span class=3D"font" style=3D"font-family=
:Arial, sans-serif"><u></u><u></u></span></span><br></p></div><p class=3D""=
 style=3D"margin: 0px;"><u></u>&nbsp;<u></u><br></p><div><div style=3D"bord=
er-right: none;border-bottom: none;border-left: none;border-top: 1.0pt soli=
d rgb(225,225,225);padding: 3.0pt 0.0in 0.0in;"><p class=3D"" style=3D"marg=
in: 0px;"><b>From:</b> J Dhanasekar &lt;<a href=3D"mailto:jdhanasekar@velan=
kanigroup.com" target=3D"_blank">jdhanasekar@velankanigroup.com</a>&gt; <br=
> <b>Sent:</b> Tuesday, November 3, 2020 9:32 AM<br> <b>To:</b> Venkatesh, =
Supreeth &lt;<a href=3D"mailto:Supreeth.Venkatesh@amd.com" target=3D"_blank=
">Supreeth.Venkatesh@amd.com</a>&gt;<br> <b>Cc:</b> OpenBMC Maillist &lt;<a=
 href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.o=
zlabs.org</a>&gt;; Ramakrishnan Kumaraswamy &lt;<a href=3D"mailto:ramakrish=
nan@bydesignindia.net" target=3D"_blank">ramakrishnan@bydesignindia.net</a>=
&gt;<br> <b>Subject:</b> Re: build error in AMD Ethanolx<u></u><u></u></p><=
/div></div><p class=3D"" style=3D"margin: 0px;"><u></u>&nbsp;<u></u><br></p=
><p class=3D"" style=3D"margin: 0px;">[CAUTION: External Email] <u></u><u><=
/u><br></p><div><div><p class=3D"" style=3D"margin: 0px;">Hi Supreeth, <u><=
/u><u></u><br></p><div><p class=3D"" style=3D"margin: 0px;"><u></u>&nbsp;<u=
></u><br></p></div><div><p class=3D"" style=3D"margin: 0px;">Is LDT for Day=
tona CRB ready ?.&nbsp;<u></u><u></u><br></p></div><div><p class=3D"" style=
=3D"margin: 0px;">Please provide me, if it is available.&nbsp;<u></u><u></u=
><br></p></div><div><p class=3D"" style=3D"margin: 0px;"><u></u>&nbsp;<u></=
u><br></p></div><div><p class=3D"" style=3D"margin: 0px;"><u></u>&nbsp;<u><=
/u><br></p></div><div><p class=3D"" style=3D"margin: 0px;">Thanks,<u></u><u=
></u><br></p></div><div><p class=3D"" style=3D"margin: 0px;">Dhanasekar<u><=
/u><u></u><br></p></div></div><p class=3D"" style=3D"margin: 0px;"><u></u>&=
nbsp;<u></u><br></p><div><div><p class=3D"" style=3D"margin: 0px;">On Fri, =
Oct 9, 2020 at 6:59 PM J Dhanasekar &lt;<a href=3D"mailto:jdhanasekar@velan=
kanigroup.com" target=3D"_blank">jdhanasekar@velankanigroup.com</a>&gt; wro=
te:<u></u><u></u><br></p></div><blockquote style=3D"border-top: none;border=
-right: none;border-bottom: none;border-left: 1.0pt solid rgb(204,204,204);=
padding: 0.0in 0.0in 0.0in 6.0pt;margin: 5.0pt 0.0in 5.0pt 4.8pt;"><div><p =
class=3D"" style=3D"margin: 0px;">Hi Supreeth, <u></u><u></u><br></p><div><=
p class=3D"" style=3D"margin: 0px;"><u></u>&nbsp;<u></u><br></p></div><div>=
<p class=3D"" style=3D"margin: 0px;">Nice&nbsp;to hear from you.&nbsp;<u></=
u><u></u><br></p></div><div><p class=3D"" style=3D"margin: 0px;">Thanks for=
 the info.&nbsp;<u></u><u></u><br></p></div><div><p class=3D"" style=3D"mar=
gin: 0px;"><u></u>&nbsp;<u></u><br></p></div><div><p class=3D"" style=3D"ma=
rgin: 0px;">-Dhanasekar<u></u><u></u><br></p></div></div><p class=3D"" styl=
e=3D"margin: 0px;"><u></u>&nbsp;<u></u><br></p><div><div><p class=3D"" styl=
e=3D"margin: 0px;">On Fri, Oct 9, 2020 at 6:20 PM Venkatesh, Supreeth &lt;<=
a href=3D"mailto:Supreeth.Venkatesh@amd.com" target=3D"_blank">Supreeth.Ven=
katesh@amd.com</a>&gt; wrote:<u></u><u></u><br></p></div><blockquote style=
=3D"border-top: none;border-right: none;border-bottom: none;border-left: 1.=
0pt solid rgb(204,204,204);padding: 0.0in 0.0in 0.0in 6.0pt;margin: 5.0pt 0=
.0in 5.0pt 4.8pt;"><div><div><p style=3D"margin: 0.0in;"><span class=3D"col=
our" style=3D"color:rgb(49, 113, 0)"><span class=3D"font" style=3D"font-fam=
ily:Arial, sans-serif"><span class=3D"size" style=3D"font-size:10pt">[AMD P=
ublic Use]</span></span></span><u></u><u></u><br></p><p class=3D"" style=3D=
"margin: 0px;">&nbsp;<u></u><u></u><br></p><p class=3D"" style=3D"margin: 0=
px;">Hi Dhanasekar,<u></u><u></u><br></p><p class=3D"" style=3D"margin: 0px=
;">&nbsp;<u></u><u></u><br></p><p class=3D"" style=3D"margin: 0px;">Thanks =
for helping out.<u></u><u></u><br></p><p class=3D"" style=3D"margin: 0px;">=
We will make DT for Daytona CRB available latest by early next month &nbsp;=
or end of this month.<u></u><u></u><br></p><p class=3D"" style=3D"margin: 0=
px;">&nbsp;<u></u><u></u><br></p><div><p class=3D"" style=3D"margin: 0px;">=
<span class=3D"colour" style=3D"color:black"><span class=3D"font" style=3D"=
font-family:Arial, sans-serif"><span class=3D"size" style=3D"font-size:10pt=
">Thanks,</span></span></span><u></u><u></u><br></p><p class=3D"" style=3D"=
margin: 0px;"><b><span class=3D"colour" style=3D"color:black"><span class=
=3D"font" style=3D"font-family:Arial, sans-serif"><span class=3D"size" styl=
e=3D"font-size:10pt">Supreeth Venkatesh</span></span></span></b><u></u><u><=
/u><br></p><p class=3D"" style=3D"margin: 0px;"><span class=3D"colour" styl=
e=3D"color:black"><span class=3D"font" style=3D"font-family:Arial, sans-ser=
if"><span class=3D"size" style=3D"font-size:9pt">System Manageability Archi=
tect&nbsp;&nbsp;|<b>&nbsp;&nbsp;AMD</b><br> Server Software</span></span></=
span><u></u><u></u></p><p class=3D"" style=3D"margin: 0px;"><span class=3D"=
colour" style=3D"color:black"><span class=3D"font" style=3D"font-family:Ari=
al, sans-serif"><img src=3D"cid:1759dcba5ad4cff311" style=3D"width: 1.5625i=
n;height: 0.3645in;" height=3D"0.3645in" width=3D"1.5625in" border=3D"0"></=
span></span><u></u><u></u><br></p></div><p class=3D"" style=3D"margin: 0px;=
">&nbsp;<u></u><u></u><br></p><div><div style=3D"border-right: none;border-=
bottom: none;border-left: none;border-top: 1.0pt solid rgb(225,225,225);pad=
ding: 3.0pt 0.0in 0.0in;"><p class=3D"" style=3D"margin: 0px;"><b>From:</b>=
 J Dhanasekar &lt;<a href=3D"mailto:jdhanasekar@velankanigroup.com" target=
=3D"_blank">jdhanasekar@velankanigroup.com</a>&gt; <br> <b>Sent:</b> Friday=
, October 9, 2020 12:14 AM<br> <b>To:</b> Venkatesh, Supreeth &lt;<a href=
=3D"mailto:Supreeth.Venkatesh@amd.com" target=3D"_blank">Supreeth.Venkatesh=
@amd.com</a>&gt;<br> <b>Cc:</b> OpenBMC Maillist &lt;<a href=3D"mailto:open=
bmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;; R=
amakrishnan Kumaraswamy &lt;<a href=3D"mailto:ramakrishnan@bydesignindia.ne=
t" target=3D"_blank">ramakrishnan@bydesignindia.net</a>&gt;<br> <b>Subject:=
</b> Re: build error in AMD Ethanolx<u></u><u></u></p></div></div><p class=
=3D"" style=3D"margin: 0px;">&nbsp;<u></u><u></u><br></p><p class=3D"" styl=
e=3D"margin: 0px;">[CAUTION: External Email] <u></u><u></u><br></p><div><di=
v><p class=3D"" style=3D"margin: 0px;">Hi Supreeth, <u></u><u></u><br></p><=
div><p class=3D"" style=3D"margin: 0px;">&nbsp;<u></u><u></u><br></p></div>=
<div><p class=3D"" style=3D"margin: 0px;">If&nbsp; the DTSs file for Dayton=
a CRB is available, I will work parallel to enable openBMC for Daytona CRB.=
<u></u><u></u><br></p></div><div><p class=3D"" style=3D"margin: 0px;">&nbsp=
;<u></u><u></u><br></p></div><div><p class=3D"" style=3D"margin: 0px;">&nbs=
p;<u></u><u></u><br></p></div><div><p class=3D"" style=3D"margin: 0px;">Tha=
nks,<u></u><u></u><br></p></div><div><p class=3D"" style=3D"margin: 0px;">D=
hanasekar<u></u><u></u><br></p></div></div><p class=3D"" style=3D"margin: 0=
px;">&nbsp;<u></u><u></u><br></p><div><div><p class=3D"" style=3D"margin: 0=
px;">On Thu, Oct 8, 2020 at 7:51 PM J Dhanasekar &lt;<a href=3D"mailto:jdha=
nasekar@velankanigroup.com" target=3D"_blank">jdhanasekar@velankanigroup.co=
m</a>&gt; wrote:<u></u><u></u><br></p></div><blockquote style=3D"border-top=
: none;border-right: none;border-bottom: none;border-left: 1.0pt solid rgb(=
204,204,204);padding: 0.0in 0.0in 0.0in 6.0pt;margin: 5.0pt 0.0in 5.0pt 4.8=
pt;"><div><p class=3D"" style=3D"margin: 0px;">Supreeth, <u></u><u></u><br>=
</p><div><p class=3D"" style=3D"margin: 0px;">&nbsp;<u></u><u></u><br></p><=
/div><div><p class=3D"" style=3D"margin: 0px;">Thanks for the info.<u></u><=
u></u><br></p></div><div><p class=3D"" style=3D"margin: 0px;">Will OpenBMC =
on Daytona&nbsp;available&nbsp;end of this year?.<u></u><u></u><br></p></di=
v><div><p class=3D"" style=3D"margin: 0px;">&nbsp;<u></u><u></u><br></p></d=
iv><div><p class=3D"" style=3D"margin: 0px;">Thanks,<u></u><u></u><br></p><=
/div><div><p class=3D"" style=3D"margin: 0px;">Dhanasekar<u></u><u></u><br>=
</p></div></div><p class=3D"" style=3D"margin: 0px;">&nbsp;<u></u><u></u><b=
r></p><div><div><p class=3D"" style=3D"margin: 0px;">On Thu, Oct 8, 2020 at=
 7:31 PM Supreeth Venkatesh &lt;<a href=3D"mailto:supreeth.venkatesh@amd.co=
m" target=3D"_blank">supreeth.venkatesh@amd.com</a>&gt; wrote:<u></u><u></u=
><br></p></div><blockquote style=3D"border-top: none;border-right: none;bor=
der-bottom: none;border-left: 1.0pt solid rgb(204,204,204);padding: 0.0in 0=
.0in 0.0in 6.0pt;margin: 5.0pt 0.0in 5.0pt 4.8pt;"><p class=3D"" style=3D"m=
argin: 0px;">On 10/8/20 1:02 AM, J Dhanasekar wrote:<br> &gt; [CAUTION: Ext=
ernal Email]<br> &gt; Hi Supreeth,<br> &gt; <br> &gt; I was able to build t=
he AMD Ethanolx source successfully. I have executed your mentioned command=
s only,<br> &gt; <br> &gt; *. setup ethanolx<br> &gt; bitbake obmc-phosphor=
-image&nbsp;&nbsp;*<br> &gt; <br> &gt; I built the code in normal&nbsp;user=
 privilege, not root user.&nbsp;<br> &gt; Thanks for your support.<br> Than=
ks for letting me know.<br> &gt; <br> &gt; Do you have a linux DTS&nbsp; fo=
r BMC of DaytonaCRB ?.<br> Unfortunately, we are not supporting Daytona CRB=
 yet, but we are working towards enabling OpenBMC on Daytona soon. Stay tun=
ed.<br> <br> &gt; <br> &gt; -Dhanasekar<br> &gt; <br> &gt; On Thu, Oct 8, 2=
020 at 12:21 AM Anton Kachalov &lt;<a href=3D"mailto:rnouse@google.com" tar=
get=3D"_blank">rnouse@google.com</a> &lt;mailto:<a href=3D"mailto:rnouse@go=
ogle.com" target=3D"_blank">rnouse@google.com</a>&gt;&gt; wrote:<br> &gt; <=
br> &gt;&nbsp; &nbsp; &nbsp;Hey,<br> &gt; <br> &gt;&nbsp; &nbsp; &nbsp;woul=
d you mind to find the&nbsp;*log.do_rootfs* file for obmc-phosphor-initramf=
s under build/tmp/work. This task has failed.<br> &gt; <br> &gt;&nbsp; &nbs=
p; &nbsp;For instance, on qemuarm target the path looks like this (for obmc=
-phosphor-*image* instead of obmc-phosphor-*initramfs*):<br> &gt; <br> &gt;=
&nbsp; &nbsp; &nbsp;build/tmp/work/qemuarm-openbmc-linux-gnueabi/obmc-phosp=
hor-image/1.0-r0/temp/log.do_rootfs<br> &gt; <br> &gt;&nbsp; &nbsp; &nbsp;O=
n Wed, 7 Oct 2020 at 20:35, Supreeth Venkatesh &lt;<a href=3D"mailto:supree=
th.venkatesh@amd.com" target=3D"_blank">supreeth.venkatesh@amd.com</a> &lt;=
mailto:<a href=3D"mailto:supreeth.venkatesh@amd.com" target=3D"_blank">supr=
eeth.venkatesh@amd.com</a>&gt;&gt; wrote:<br> &gt; <br> &gt;&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;On 10/7/20 10:11 AM, J Dhanasekar wrote:<br> &gt;&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;&gt; [CAUTION: External Email]<br> &gt;&nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;&gt; Hi Supreeth,<br> &gt;&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;&gt;<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; Thanks for th=
e reply,<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br> &gt;&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;&gt; I have attached the complete error log. Please =
view it.&nbsp;<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br> &gt;&nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;&gt; I have removed the build folder and creat=
ed a new one twice. Still I am seeing the same error.<br> &gt;&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;This may be environment issue in your setup.<br> &gt;&=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;I am not seeing this error in my environme=
nt with the latest master.<br> &gt; <br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;. setup ethanolx<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bitbake bitb=
ake obmc-phosphor-image<br> &gt; <br> &gt; <br> &gt;&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;"WARNING: Host distribution "ubuntu-18.04" has not been validate=
d with this version of the build system; you may possibly experience unexpe=
cted failures. It is recommended that you use a tested distribution.<br> &g=
t;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NOTE: Resolving any missing task queue =
dependencies<br> &gt; <br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Build Conf=
iguration:<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;BB_VERSION&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;=3D "1.47.0"<br> &gt;&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;BUILD_SYS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "x86_64-lin=
ux"<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NATIVELSBSTRING&nbsp; &nbsp; =
&nbsp; =3D "ubuntu-18.04"<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TARGET_=
SYS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "arm-openbmc-linux-gnueabi"=
<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MACHINE&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; =3D "ethanolx"<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;DISTRO&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "ope=
nbmc-phosphor"<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DISTRO_VERSION&nbs=
p; &nbsp; &nbsp; &nbsp;=3D "0.1.0"<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;TUNE_FEATURES&nbsp; &nbsp; &nbsp; &nbsp; =3D "arm thumb arm1176jzs"<br> &=
gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TARGET_FPU&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;=3D "soft"<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;meta&nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br> &gt;&nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;meta-oe&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;meta-networking&nbsp; &nbsp=
; &nbsp;<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;meta-perl&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;meta-p=
ython&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;meta-phosphor&nbsp; &nbsp; &nbsp; &nbsp;<br> &gt;&nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;meta-aspeed&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br> &gt;&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;meta-amd&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;meta-ethanolx&nbsp; &nb=
sp; &nbsp; &nbsp; =3D "master:c3d88e4d9fcc08e1aae7cc9d0337c0261e996c64""<br=
> &gt; <br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;....<br> &gt;&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;....<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;....<b=
r> &gt; <br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NOTE: Running task 4241 =
of 4243 (/home/supvenka/work/openbmc_upstream/meta-phosphor/recipes-phospho=
r/images/obmc-phosphor-image.bb:do_image_complete)<br> &gt;&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;NOTE: recipe obmc-phosphor-image-1.0-r0: task do_image_co=
mplete: Started<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NOTE: recipe obmc=
-phosphor-image-1.0-r0: task do_image_complete: Succeeded<br> &gt;&nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;NOTE: Running task 4242 of 4243 (/home/supvenka/wo=
rk/openbmc_upstream/meta-phosphor/recipes-phosphor/images/obmc-phosphor-ima=
ge.bb:do_populate_lic_deploy)<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NOT=
E: recipe obmc-phosphor-image-1.0-r0: task do_populate_lic_deploy: Started<=
br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NOTE: recipe obmc-phosphor-image-=
1.0-r0: task do_populate_lic_deploy: Succeeded<br> &gt;&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;NOTE: Running noexec task 4243 of 4243 (/home/supvenka/work/o=
penbmc_upstream/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.b=
b:do_build)<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NOTE: Tasks Summary: =
Attempted 4243 tasks of which 2 didn't need to be rerun and all succeeded."=
<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br> &gt;&nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;&gt; Thanks,<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; =
Dhanasekar<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br> &gt;&nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;&gt; On Wed, Oct 7, 2020 at 8:08 PM Supreeth Venka=
tesh &lt;<a href=3D"mailto:supreeth.venkatesh@amd.com" target=3D"_blank">su=
preeth.venkatesh@amd.com</a> &lt;mailto:<a href=3D"mailto:supreeth.venkates=
h@amd.com" target=3D"_blank">supreeth.venkatesh@amd.com</a>&gt; &lt;mailto:=
<a href=3D"mailto:supreeth.venkatesh@amd.com" target=3D"_blank">supreeth.ve=
nkatesh@amd.com</a> &lt;mailto:<a href=3D"mailto:supreeth.venkatesh@amd.com=
" target=3D"_blank">supreeth.venkatesh@amd.com</a>&gt;&gt;&gt; wrote:<br> &=
gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br> &gt;&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;&gt;&nbsp; &nbsp; &nbsp;On 10/7/20 5:44 AM, J Dhanasekar wrote:<br=
> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt; [CAUTI=
ON: External Email]<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &n=
bsp; &nbsp;&gt; Hi openBMC,<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&=
nbsp; &nbsp; &nbsp;Hi Dhanasekar<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
&gt;<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt;=
<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt; I a=
m working to build BMC for AMD Ethanolx platform,<br> &gt;&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;Nice to hear.<br> &gt;&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt;<br> &gt;&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt; After running&nbsp; *bitbake=
 u-boot-aspeed* and *bitbake obmc-phosphor-image*,<br> &gt;&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt; I am getting below error,<br=
> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt;<br> &g=
t;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt; ERROR: obm=
c-phosphor-initramfs-1.0-r0 do_rootfs: The postinstall intercept hook 'upda=
te_gio_module_cache' failed, details in /home/user/dhanasekar/BMC/AMD/openb=
mc/build/tmp/work/ethanolx-openbmc-linux-gnueabi/obmc-phosphor-initramfs/1.=
0-r0/temp/log.do_rootfs<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp=
; &nbsp; &nbsp;&gt; ERROR: Logfile of failure stored in: /home/user/dhanase=
kar/BMC/AMD/openbmc/build/tmp/work/ethanolx-openbmc-linux-gnueabi/obmc-phos=
phor-initramfs/1.0-r0/temp/log.do_rootfs.14182<br> &gt;&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt; ERROR: Task (/home/user/dhanasek=
ar/BMC/AMD/openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-init=
ramfs.bb:do_rootfs) failed with exit code '1'<br> &gt;&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt;<br> &gt;&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;&gt;&nbsp; &nbsp; &nbsp;Can you send me the complete build logs?<b=
r> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br> &gt;&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;&gt; Please help me to fix the error,<=
br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nbsp;rm the bu=
ild folder and retry once.<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&n=
bsp; &nbsp; &nbsp;I will build it once today as well and confirm. It may no=
t been tested with latest upstream changes.<br> &gt;&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;&gt;<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp;=
 &nbsp;&gt;<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp; &nb=
sp;&gt; Thanks,<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;&nbsp; &nbsp;=
 &nbsp;&gt; Dhanasekar,<br> &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br> =
&gt; <u></u><u></u></p></blockquote></div></blockquote></div></div></div></=
div></blockquote></div></blockquote></div></div></div></div></blockquote></=
div></div></blockquote></div><div><br></div></div><br></body></html>
------=_Part_243435_1213886804.1607488210806
Content-Type: image/png; name=1.png
Content-Transfer-Encoding: base64
Content-Disposition: inline; filename=1.png
Content-ID: <1759dcba5ad4cff311>

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
------=_Part_243435_1213886804.1607488210806--

------=_Part_243434_4973212.1607488210783--

