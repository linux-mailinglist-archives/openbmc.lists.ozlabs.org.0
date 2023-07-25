Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6DC76196D
	for <lists+openbmc@lfdr.de>; Tue, 25 Jul 2023 15:10:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=velankanigroup.com header.i=jdhanasekar@velankanigroup.com header.a=rsa-sha256 header.s=zoho header.b=A51y8a3a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9HSt71qpz3cWW
	for <lists+openbmc@lfdr.de>; Tue, 25 Jul 2023 23:10:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=velankanigroup.com header.i=jdhanasekar@velankanigroup.com header.a=rsa-sha256 header.s=zoho header.b=A51y8a3a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=velankanigroup.com (client-ip=103.117.158.11; helo=sender-op-o11.zoho.in; envelope-from=jdhanasekar@velankanigroup.com; receiver=lists.ozlabs.org)
Received: from sender-op-o11.zoho.in (sender-op-o11.zoho.in [103.117.158.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9HS81X76z3brX
	for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2023 23:09:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1690290565; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=I1UjGc0RfWGy5g8161p881bWQh1CmGrX5jfxdOwbXUlSE3rQQa7XwvmoOH9VHE7hltaGyk0Yx8b1BtLalEAzysAV+/VqC8kKMT2C3b0WK6S9iFnSgyxRPfeQ8A8ysIu8fV2T6C4ug2ixptfbETmqM90OqOzhBtltl3K6+kh8OJ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1690290565; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=l5TPs/v9b9m/4KbldWWyflfHAAvVTJECMJ+slZpT0sU=; 
	b=ONdMO0dW811LIRHNmkKZ6rEldxGbyJWiJfFzpa/GtAKvF4/lcSZWRZvduDIPIiF7gZdxa8aBfStLxOwTbITTjpiA95E8vbyLVpaSDVPxgAsDVCVT3oWRTAE7/o9sJDrenIbNFACkm2lovIPg7zFPe+vM31Q40HQdxXtARtEm77U=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=velankanigroup.com;
	spf=pass  smtp.mailfrom=jdhanasekar@velankanigroup.com;
	dmarc=pass header.from=<jdhanasekar@velankanigroup.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1690290565;
	s=zoho; d=velankanigroup.com; i=jdhanasekar@velankanigroup.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-Id:Message-Id:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Reply-To;
	bh=l5TPs/v9b9m/4KbldWWyflfHAAvVTJECMJ+slZpT0sU=;
	b=A51y8a3a+qpIuzdAr+crWSgfliBCf1QRWd6L/hphQSSzWoxNLlrFEbi0p6OPssnr
	RHpt2zK9DaS1c5j0rQcX8jSYygIuqTP5cdfR2G5gGX4McJsG4RVJopTOdX6PrtBZIh3
	o8jCDc4z4eneR9prQtcLiKyImzvnXk/I3P7p3x98=
Received: from mail.zoho.in by mx.zoho.in
	with SMTP id 1690290564438297.67873352007655; Tue, 25 Jul 2023 18:39:24 +0530 (IST)
Date: Tue, 25 Jul 2023 18:39:24 +0530
From: J Dhanasekar <jdhanasekar@velankanigroup.com>
To: "Venkatesh, Supreeth" <Supreeth.Venkatesh@amd.com>
Message-Id: <1898d2b2d0e.4ac15546926284.5918723584994850422@velankanigroup.com>
In-Reply-To: <SN6PR12MB4752E05BD406AAE121C86E9C9602A@SN6PR12MB4752.namprd12.prod.outlook.com>
References: <07621845-19a4-0568-be0e-f556ba40b813@amd.com>
 <ZBmJpxTnEVVpfsz2@heinlein.taila677.ts.net>
 <255d7c9a-ce17-bbe1-7312-990d0221cf36@amd.com>
 <CAK7WosjjdVwNqSwkY2mxYhgAeKdwigtyLryTfJ9r6ShjfbRuCA@mail.gmail.com>
 <65515592-8f77-1c8f-731c-165fb833344b@amd.com>
 <CAGm54UG+S7gFkCaKJm_7PxOCDu0haZ4FWUxj716JBGVY-gaTFw@mail.gmail.com>
 <d9f7b650-2e8b-7bd0-2125-035531ce549c@amd.com>
 <d65937a46b6fb4f9f94edbdef44af58e@imap.linux.ibm.com>
 <71a122a9-07a9-06a8-ee1a-dd108db63df3@amd.com>
 <18977ff7cd7.59a883fc562150.7689391317426675156@velankanigroup.com>
 <SN6PR12MB4752B1CEE5232F40EED441C8963FA@SN6PR12MB4752.namprd12.prod.outlook.com>
 <18987ffeff9.35c4bda1801937.8894247920197462243@velankanigroup.com> <SN6PR12MB4752E05BD406AAE121C86E9C9602A@SN6PR12MB4752.namprd12.prod.outlook.com>
Subject: RE: [RFC] BMC RAS Feature
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_2895738_559444056.1690290564369"
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
Cc: Lei Yu <yulei.sh@bytedance.com>, Michael Shen <gpgpgp@google.com>, openbmc <openbmc@lists.ozlabs.org>, dhruvaraj S <dhruvaraj@gmail.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>, Ed Tanous <ed@tanous.net>, "Dhandapani,  Abinaya" <Abinaya.Dhandapani@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_Part_2895738_559444056.1690290564369
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Supreeth,=C2=A0



I am working on SP5 Servers too. SP5 Servers has aspeed 2600 chip and=C2=A0=
 BMC is off the board whereas EthanolX/Daytonax has 2500 and BMC is on the =
board.=C2=A0

Algorithms or Steps for implementing functionalities (SOL, PostCode, PSU..)=
 will=C2=A0=C2=A0remain the same?.=C2=A0



Thanks,

Dhanasekar









---- On Mon, 24 Jul 2023 19:44:52 +0530 Venkatesh, Supreeth <Supreeth.Venka=
tesh@amd.com> wrote ---



[AMD Official Use Only - General]


Hi Dhanasekar,

=C2=A0

DaytonaX and EthanolX platforms were only OpenBMC PoC with limited function=
ality.

We are in the process of upstreaming new AMD CRBs with OpenBMC which has al=
l the functionality you mention below.

Public instance of the staging/intermediary repository before upstream is h=
ere:

https://github.com/AMDESE/OpenBMC

=C2=A0

Thanks,

Supreeth Venkatesh

System Manageability Architect=C2=A0=C2=A0|=C2=A0=C2=A0AMD
 Server Software



=C2=A0

From: J Dhanasekar <mailto:jdhanasekar@velankanigroup.com>=20
 Sent: Monday, July 24, 2023 8:04 AM
 To: Venkatesh, Supreeth <mailto:Supreeth.Venkatesh@amd.com>
 Cc: Lei Yu <mailto:yulei.sh@bytedance.com>; Zane Shelley <mailto:zshelle@i=
map.linux.ibm.com>; Michael Shen <mailto:gpgpgp@google.com>; openbmc <mailt=
o:openbmc@lists.ozlabs.org>; dhruvaraj S <mailto:dhruvaraj@gmail.com>; Brad=
 Bishop <mailto:bradleyb@fuzziesquirrel.com>; Ed Tanous <mailto:ed@tanous.n=
et>;
 Dhandapani, Abinaya <mailto:Abinaya.Dhandapani@amd.com>
 Subject: RE: [RFC] BMC RAS Feature


=C2=A0



Caution: This message originated from an External Source. Use proper cautio=
n when opening attachments, clicking links, or responding.






=C2=A0

Hi Supreeth,


=C2=A0


Thanks for the info. We hoped that Daytonax would be upstreamed. Unfortunat=
ely, It is not available.=C2=A0


Actually, we need to enable SOL, Post code and PSU features in Daytona.=C2=
=A0 Will we get support for this feature enablement? or Are there any refer=
ence=C2=A0implementation
 available for AMD boards?.


=C2=A0


Thanks,


Dhanasekar


=C2=A0


=C2=A0


=C2=A0


---- On Fri, 21 Jul 2023 19:33:41 +0530 Venkatesh, Supreeth <mailto:Supreet=
h.Venkatesh@amd.com> wrote ---


=C2=A0


[AMD Official Use Only - General]

=C2=A0


Hi Dhanasekar,

=C2=A0

It is supported for EPYC Genoa family and beyond at this time.

Daytona uses EPYC Milan family and support is not there in that.

=C2=A0

Thanks,

Supreeth Venkatesh

System Manageability Architect=C2=A0=C2=A0|=C2=A0=C2=A0AMD
 Server Software



=C2=A0

From: J Dhanasekar <mailto:jdhanasekar@velankanigroup.com>=20
 Sent: Friday, July 21, 2023 5:30 AM
 To: Venkatesh, Supreeth <mailto:Supreeth.Venkatesh@amd.com>
 Cc: Zane Shelley <mailto:zshelle@imap.linux.ibm.com>; Lei Yu <mailto:yulei=
.sh@bytedance.com>; Michael Shen <mailto:gpgpgp@google.com>;
 openbmc <mailto:openbmc@lists.ozlabs.org>; dhruvaraj S <mailto:dhruvaraj@g=
mail.com>; Brad Bishop <mailto:bradleyb@fuzziesquirrel.com>;
 Ed Tanous <mailto:ed@tanous.net>; Dhandapani, Abinaya <mailto:Abinaya.Dhan=
dapani@amd.com>
 Subject: Re: [RFC] BMC RAS Feature


=C2=A0



Caution: This message originated from an External Source. Use proper cautio=
n when opening attachments, clicking links, or responding.






=C2=A0

Hi Supreeth Venkatesh,


=C2=A0


Does this RAS feature work for the Daytona Platform.=C2=A0 i have been work=
ing in openBMC development for the Daytonax platform.=C2=A0


If this RAS works for Daytona Platform. I will include it in my project.=C2=
=A0


=C2=A0


Please provide your suggestions.=C2=A0


=C2=A0


Thanks,


Dhanasekar


=C2=A0


=C2=A0



=C2=A0


=C2=A0


=C2=A0


---- On Mon, 03 Apr 2023 22:06:24 +0530 Supreeth Venkatesh <mailto:supreeth=
.venkatesh@amd.com> wrote ---


=C2=A0



On 3/23/23 13:57, Zane Shelley wrote:
 > Caution: This message originated from an External Source. Use proper=20
 > caution when opening attachments, clicking links, or responding.=20
 >=20
 >=20
 > On 2023-03-22 19:07, Supreeth Venkatesh wrote:=20
 >> On 3/22/23 02:10, Lei Yu wrote:=20
 >>> Caution: This message originated from an External Source. Use proper=
=20
 >>> caution when opening attachments, clicking links, or responding.=20
 >>>=20
 >>>=20
 >>>>> On Tue, 21 Mar 2023 at 20:38, Supreeth Venkatesh =20
 >>>>> <mailto:supreeth.venkatesh@amd.com> wrote:=20
 >>>>>=20
 >>>>>=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 On 3/21/23 05:40, Patrick Williams wrote:=
=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 > On Tue, Mar 21, 2023 at 12:14:45AM -0500,=
 Supreeth Venkatesh=20
 >>>>> wrote:=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 >=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 >> #### Alternatives Considered=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 >>=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 >> In-band mechanisms using System Manageme=
nt Mode (SMM)=20
 >>>>> exists.=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 >>=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 >> However, out of band method to gather RA=
S data is processor=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 specific.=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 >>=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 > How does this compare with existing imple=
mentations in=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 > phosphor-debug-collector.=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Thanks for your feedback. See below.=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 > I believe there was some attempt to exten=
d =20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 > P-D-C previously to handle Intel's crashd=
ump behavior.=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Intel's crashdump interface uses com.intel.=
crashdump.=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 We have implemented com.amd.crashdump based=
 on that reference.=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 However,=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 can this be made generic?=20
 >>>>>=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 PoC below:=20
 >>>>>=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 busctl tree com.amd.crashdump=20
 >>>>>=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=94=E2=94=80/com=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=94=E2=94=80/com/am=
d=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=94=E2=
=94=80/com/amd/crashdump=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=E2=94=9C=E2=94=80/com/amd/crashdump/0=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=E2=94=9C=E2=94=80/com/amd/crashdump/1=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=E2=94=9C=E2=94=80/com/amd/crashdump/2=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=E2=94=9C=E2=94=80/com/amd/crashdump/3=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=E2=94=9C=E2=94=80/com/amd/crashdump/4=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=E2=94=9C=E2=94=80/com/amd/crashdump/5=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=E2=94=9C=E2=94=80/com/amd/crashdump/6=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=E2=94=9C=E2=94=80/com/amd/crashdump/7=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=E2=94=9C=E2=94=80/com/amd/crashdump/8=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=E2=94=94=E2=94=80/com/amd/crashdump/9=20
 >>>>>=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 > The repository=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 > currently handles IBM's processors, I thi=
nk, or maybe that is=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 covered by=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 > openpower-debug-collector.=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 >=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 > In any case, I think you should look at t=
he existing D-Bus=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 interfaces=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 > (and associated Redfish implementation) o=
f these repositories=20
 >>>>> and=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 > determine if you can use those approaches=
 (or document why=20
 >>>>> now).=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 I could not find an existing D-Bus interfac=
e for RAS in=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 xyz/openbmc_project/.=20
 >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 It would be helpful if you could point me t=
o it. =20
 >>>>>=20
 >>>>>=20
 >>>>> There is an interface for the dumps generated from the host, which=
=20
 >>>>> can=20
 >>>>> be used for these kinds of dumps=20
 >>>>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml=
/xyz/openbmc_project/Dump/Entry/System.interface.yaml=20
 >>>>>=20
 >>>>>=20
 >>>>> The fault log also provides similar dumps=20
 >>>>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml=
/xyz/openbmc_project/Dump/Entry/FaultLog.interface.yaml=20
 >>>>>=20
 >>>>>=20
 >>>> ThanksDdhruvraj. The interface looks useful for the purpose. However,=
=20
 >>>> the current BMCWEB implementation references=20
 >>>> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/log_se=
rvices.hpp=20
 >>>>=20
 >>>> [com.intel.crashdump]=20
 >>>> constexpr char const* crashdumpPath =3D "/com/intel/crashdump";=20
 >>>>=20
 >>>> constexpr char const* crashdumpInterface =3D "com.intel.crashdump";=
=20
 >>>> constexpr char const* crashdumpObject =3D "com.intel.crashdump";=20
 >>>>=20
 >>>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/=
xyz/openbmc_project/Dump/Entry/System.interface.yaml=20
 >>>>=20
 >>>> or=20
 >>>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/=
xyz/openbmc_project/Dump/Entry/FaultLog.interface.yaml=20
 >>>>=20
 >>>> is it exercised in Redfish logservices?=20
 >>> In our practice, a plugin `tools/dreport.d/plugins.d/acddump` is added=
=20
 >>> to copy the crashdump json file to the dump tarball. =20
 >>> The crashdump tool (Intel or AMD) could trigger a dump after the=20
 >>> crashdump is completed, and then we could get a dump entry containing=
=20
 >>> the crashdump.=20
 >> Thanks Lei Yu for your input. We are using Redfish to retrieve the=20
 >> CPER binary file which can then be passed through a plugin/script for=
=20
 >> detailed analysis.=20
 >> In any case irrespective of whichever Dbus interface we use, we need a=
=20
 >> repository which will gather data from AMD processor via APML as per=20
 >> AMD design.=20
 >> APML=20
 >> Spec: https://www.amd.com/system/files/TechDocs/57019-A0-PUB_3.00.zip=
=20
 >> Can someone please help create bmc-ras or amd-debug-collector=20
 >> repository as there are instances of openpower-debug-collector=20
 >> repository used for Open Power systems?=20
 >>>=20
 >>>=20
 >>> --=20
 >>> BRs,=20
 >>> Lei YU=20
 > I am interested in possibly standardizing some of this. IBM POWER has=20
 > several related components. openpower-hw-diags is a service that will=20
 > listen for the hardware interrupts via a GPIO pin. When an error is=20
 > detected, it will use openpower-libhei to query hardware registers to=20
 > determine what happened. Based on that information openpower-hw-diags=20
 > will generate a PEL, which is an extended log in phosphor-logging, that=
=20
 > is used to tell service what to replace if necessary. Afterward,=20
 > openpower-hw-diags will initiate openpower-debug-collector, which=20
 > gathers a significant amount of data from the hardware for additional=20
 > debug when necessary. I wrote openpower-libhei to be fairly agnostic. It=
=20
 > uses data files (currently XML, but moving to JSON) to define register=
=20
 > addresses and rules for isolation. openpower-hw-diags is fairly POWER=20
 > specific, but I can see some parts can be made generic. Dhruv would have=
=20
 > to help with openpower-debug-collector.=20
 Thank you. Lets collaborate in standardizing some aspects of it.=20
 >=20
 > Regarding creation of a new repository, I think we'll need to have some=
=20
 > more collaboration to determine the scope before creating it. It=20
 > certainly sounds like we are doing similar things, but we need to=20
 > determine if enough can be abstracted to make it worth our time.=20
 I have put in a request here:=20
 https://github.com/openbmc/technical-oversight-forum/issues/24=20
 Please chime in.



=C2=A0



=C2=A0







=C2=A0



=C2=A0
------=_Part_2895738_559444056.1690290564369
Content-Type: multipart/related; 
	boundary="----=_Part_2895739_1302712611.1690290564381"

------=_Part_2895739_1302712611.1690290564381
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head>=
<meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type"></h=
ead><body ><div style=3D"font-family: Verdana, Arial, Helvetica, sans-serif=
; font-size: 10pt;"><div><br></div><div>Hi Supreeth,&nbsp;<br></div><div><b=
r></div><div style=3D"color: rgb(34, 34, 34); font-family: Arial, Helvetica=
, sans-serif; font-size: small; font-style: normal; font-variant-ligatures:=
 normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norma=
l; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; w=
idows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: n=
ormal; text-decoration-thickness: initial; text-decoration-style: initial; =
text-decoration-color: initial;">I am working on SP5 Servers too. SP5 Serve=
rs has aspeed 2600 chip and&nbsp; BMC is off the board whereas EthanolX/Day=
tonax has 2500 and BMC is on the board.&nbsp;<br></div><div style=3D"color:=
 rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: sma=
ll; font-style: normal; font-variant-ligatures: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: s=
tart; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px;=
 -webkit-text-stroke-width: 0px; white-space: normal; text-decoration-thick=
ness: initial; text-decoration-style: initial; text-decoration-color: initi=
al;">Algorithms or Steps for implementing functionalities (SOL, PostCode, P=
SU..) will&nbsp;&nbsp;remain the same?.&nbsp;<br></div><div><br></div><div>=
Thanks,<br></div><div>Dhanasekar</div><div id=3D"Zm-_Id_-Sgn" data-zbluepen=
cil-ignore=3D"true" data-sigid=3D"818525000000014003"><div><br></div></div>=
<div><br></div><div class=3D"zmail_extra_hr" style=3D"border-top: 1px solid=
 rgb(204, 204, 204); height: 0px; margin-top: 10px; margin-bottom: 10px; li=
ne-height: 0px;"><br></div><div class=3D"zmail_extra" data-zbluepencil-igno=
re=3D"true"><div><br></div><div id=3D"Zm-_Id_-Sgn1">---- On Mon, 24 Jul 202=
3 19:44:52 +0530 <b>Venkatesh, Supreeth &lt;Supreeth.Venkatesh@amd.com&gt;<=
/b> wrote ---<br></div><div><br></div><blockquote id=3D"blockquote_zmail" s=
tyle=3D"margin: 0px;"><div style=3D"" class=3D"zm_-1193923588262217367_pars=
e_3236110261449644090"><p style=3D"margin: 5pt; font-style: normal; font-we=
ight: normal; text-decoration: none;"><span class=3D"colour" style=3D"color=
:rgb(0, 0, 255)"><span class=3D"font" style=3D"font-family:Arial"><span cla=
ss=3D"size" style=3D"font-size: 10pt; margin: 5pt; font-style: normal; font=
-weight: normal; text-decoration: none;">[AMD Official Use Only - General]<=
br></span></span></span></p><br><div><div class=3D"x_-684518287WordSection1=
"><p class=3D"" style=3D"margin-top: 0px; margin-bottom: 0px;">Hi Dhanaseka=
r,<br></p><p class=3D"" style=3D"margin-top: 0px; margin-bottom: 0px;">&nbs=
p;<br></p><p class=3D"" style=3D"margin-top: 0px; margin-bottom: 0px;">Dayt=
onaX and EthanolX platforms were only OpenBMC PoC with limited functionalit=
y.<br></p><p class=3D"" style=3D"margin-top: 0px; margin-bottom: 0px;">We a=
re in the process of upstreaming new AMD CRBs with OpenBMC which has all th=
e functionality you mention below.<br></p><p class=3D"" style=3D"margin-top=
: 0px; margin-bottom: 0px;">Public instance of the staging/intermediary rep=
ository before upstream is here:<br></p><p class=3D"" style=3D"margin-top: =
0px; margin-bottom: 0px;"><a href=3D"https://github.com/AMDESE/OpenBMC" tar=
get=3D"_blank">AMDESE/OpenBMC: OpenBMC for Genoa SP5 socket platforms (gith=
ub.com)</a><br></p><p class=3D"" style=3D"margin-top: 0px; margin-bottom: 0=
px;">&nbsp;<br></p><div><p class=3D"" style=3D"margin-top: 0px; margin-bott=
om: 0px;"><span class=3D"colour" style=3D"color:black"><span class=3D"font"=
 style=3D"font-family:Arial, sans-serif"><span class=3D"size" style=3D"font=
-size:10pt">Thanks,</span></span></span><br></p><p class=3D"" style=3D"marg=
in-top: 0px; margin-bottom: 0px;"><b><span class=3D"colour" style=3D"color:=
black"><span class=3D"font" style=3D"font-family:Arial, sans-serif"><span c=
lass=3D"size" style=3D"font-size:10pt">Supreeth Venkatesh</span></span></sp=
an></b><span class=3D"colour" style=3D"color:black"><span class=3D"font" st=
yle=3D"font-family:Arial, sans-serif"><span class=3D"size" style=3D"font-si=
ze:10pt"></span></span></span><br></p><p class=3D"" style=3D"margin-top: 0p=
x; margin-bottom: 0px;"><span class=3D"colour" style=3D"color:black"><span =
class=3D"font" style=3D"font-family:Arial, sans-serif"><span class=3D"size"=
 style=3D"font-size:9pt">System Manageability Architect&nbsp;&nbsp;|<b>&nbs=
p;&nbsp;AMD</b><br> Server Software</span></span></span></p><p class=3D"" s=
tyle=3D"margin-top: 0px; margin-bottom: 0px;"><span class=3D"colour" style=
=3D"color:black"><span class=3D"font" style=3D"font-family:Arial, sans-seri=
f"><img border=3D"0" width=3D"1.5625in" height=3D"0.3645in" style=3D"width:=
 1.5625in;height: 0.3645in;" src=3D"cid:image001.png@01D9BE0F.4EE9EAC0"></s=
pan></span><br></p></div><p class=3D"" style=3D"margin-top: 0px; margin-bot=
tom: 0px;">&nbsp;<br></p><div><div style=3D"border: none;border-top: solid =
rgb(225,225,225) 1.0pt;padding: 3.0pt 0.0in 0.0in 0.0in;"><p class=3D"" sty=
le=3D"margin-top: 0px; margin-bottom: 0px;"><b>From:</b> J Dhanasekar &lt;<=
a href=3D"mailto:jdhanasekar@velankanigroup.com" target=3D"_blank">jdhanase=
kar@velankanigroup.com</a>&gt; <br> <b>Sent:</b> Monday, July 24, 2023 8:04=
 AM<br> <b>To:</b> Venkatesh, Supreeth &lt;<a href=3D"mailto:Supreeth.Venka=
tesh@amd.com" target=3D"_blank">Supreeth.Venkatesh@amd.com</a>&gt;<br> <b>C=
c:</b> Lei Yu &lt;<a href=3D"mailto:yulei.sh@bytedance.com" target=3D"_blan=
k">yulei.sh@bytedance.com</a>&gt;; Zane Shelley &lt;<a href=3D"mailto:zshel=
le@imap.linux.ibm.com" target=3D"_blank">zshelle@imap.linux.ibm.com</a>&gt;=
; Michael Shen &lt;<a href=3D"mailto:gpgpgp@google.com" target=3D"_blank">g=
pgpgp@google.com</a>&gt;; openbmc &lt;<a href=3D"mailto:openbmc@lists.ozlab=
s.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;; dhruvaraj S &lt;=
<a href=3D"mailto:dhruvaraj@gmail.com" target=3D"_blank">dhruvaraj@gmail.co=
m</a>&gt;; Brad Bishop &lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com" t=
arget=3D"_blank">bradleyb@fuzziesquirrel.com</a>&gt;; Ed Tanous &lt;<a href=
=3D"mailto:ed@tanous.net" target=3D"_blank">ed@tanous.net</a>&gt;;
 Dhandapani, Abinaya &lt;<a href=3D"mailto:Abinaya.Dhandapani@amd.com" targ=
et=3D"_blank">Abinaya.Dhandapani@amd.com</a>&gt;<br> <b>Subject:</b> RE: [R=
FC] BMC RAS Feature</p></div></div><p class=3D"" style=3D"margin-top: 0px; =
margin-bottom: 0px;">&nbsp;<br></p><table class=3D"x_-684518287MsoNormalTab=
le" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"left" width=
=3D"100%" style=3D"width: 100.0%;"><tbody><tr><td style=3D"background: rgb(=
255,185,0);padding: 5.0pt 2.0pt 5.0pt 2.0pt;"><br></td><td width=3D"100%" s=
tyle=3D"width: 100.0%;background: rgb(255,248,229);padding: 5.0pt 4.0pt 5.0=
pt 12.0pt;"><div><p class=3D"" style=3D"margin-top: 0px; margin-bottom: 0px=
;"><b><span class=3D"colour" style=3D"color:rgb(34, 34, 34)">Caution:</span=
></b><span class=3D"colour" style=3D"color:rgb(34, 34, 34)"> This message o=
riginated from an External Source. Use proper caution when opening attachme=
nts, clicking links, or responding.</span><br></p></div></td></tr></tbody><=
/table><p class=3D"" style=3D"margin-top: 0px; margin-bottom: 0px;">&nbsp;<=
br></p><div><div><div><p class=3D"" style=3D"margin-top: 0px; margin-bottom=
: 0px;"><span class=3D"font" style=3D"font-family:Verdana, sans-serif"><spa=
n class=3D"size" style=3D"font-size:10pt">Hi Supreeth,</span></span><br></p=
></div><div><p class=3D"" style=3D"margin-top: 0px; margin-bottom: 0px;"><s=
pan class=3D"font" style=3D"font-family:Verdana, sans-serif"><span class=3D=
"size" style=3D"font-size:10pt">&nbsp;</span></span><br></p></div><div><p c=
lass=3D"" style=3D"margin-top: 0px; margin-bottom: 0px;"><span class=3D"col=
our" style=3D"color:rgb(34, 34, 34)"><span class=3D"font" style=3D"font-fam=
ily:Arial, sans-serif"><span class=3D"size" style=3D"font-size:12pt">Thanks=
 for the info. We hoped that Daytonax would be upstreamed. Unfortunately, I=
t is not available.&nbsp;</span></span></span><br></p></div><div><p class=
=3D"" style=3D"margin-top: 0px; margin-bottom: 0px;"><span class=3D"colour"=
 style=3D"color:rgb(34, 34, 34)"><span class=3D"font" style=3D"font-family:=
Arial, sans-serif"><span class=3D"size" style=3D"font-size:12pt">Actually, =
we need to enable SOL, Post code and PSU features in Daytona.&nbsp; Will we=
 get support for this feature enablement? or Are there any reference&nbsp;i=
mplementation
 available for AMD boards?.</span></span></span><br></p></div><div><p class=
=3D"" style=3D"margin-top: 0px; margin-bottom: 0px;"><span class=3D"colour"=
 style=3D"color:rgb(34, 34, 34)"><span class=3D"font" style=3D"font-family:=
Arial, sans-serif"><span class=3D"size" style=3D"font-size:12pt">&nbsp;</sp=
an></span></span><br></p></div><div><p class=3D"" style=3D"margin-top: 0px;=
 margin-bottom: 0px;"><span class=3D"font" style=3D"font-family:Verdana, sa=
ns-serif"><span class=3D"size" style=3D"font-size:10pt">Thanks,</span></spa=
n><br></p></div><div><p class=3D"" style=3D"margin-top: 0px; margin-bottom:=
 0px;"><span class=3D"font" style=3D"font-family:Verdana, sans-serif"><span=
 class=3D"size" style=3D"font-size:10pt">Dhanasekar</span></span><br></p></=
div><div><p class=3D"" style=3D"margin-top: 0px; margin-bottom: 0px;"><span=
 class=3D"font" style=3D"font-family:Verdana, sans-serif"><span class=3D"si=
ze" style=3D"font-size:10pt">&nbsp;</span></span><br></p></div><div style=
=3D"border: none;border-top: solid rgb(204,204,204) 1.0pt;padding: 0.0in 0.=
0in 0.0in 0.0in;margin-top: 7.5pt;margin-bottom: 7.5pt;"><p class=3D"" styl=
e=3D"margin-top: 0px; margin-bottom: 0px;"><span class=3D"font" style=3D"fo=
nt-family:Verdana, sans-serif"><span class=3D"size" style=3D"font-size:10pt=
">&nbsp;</span></span><br></p></div><div><div><p class=3D"" style=3D"margin=
-top: 0px; margin-bottom: 0px;"><span class=3D"font" style=3D"font-family:V=
erdana, sans-serif"><span class=3D"size" style=3D"font-size:10pt">&nbsp;</s=
pan></span><br></p></div><div id=3D"x_-684518287Zm-_Id_-Sgn1"><p class=3D""=
 style=3D"margin-top: 0px; margin-bottom: 0px;"><span class=3D"font" style=
=3D"font-family:Verdana, sans-serif"><span class=3D"size" style=3D"font-siz=
e:10pt">---- On Fri, 21 Jul 2023 19:33:41 +0530 <b>Venkatesh, Supreeth &lt;=
<a href=3D"mailto:Supreeth.Venkatesh@amd.com" target=3D"_blank">Supreeth.Ve=
nkatesh@amd.com</a>&gt;</b> wrote ---</span></span><br></p></div><div><p cl=
ass=3D"" style=3D"margin-top: 0px; margin-bottom: 0px;"><span class=3D"font=
" style=3D"font-family:Verdana, sans-serif"><span class=3D"size" style=3D"f=
ont-size:10pt">&nbsp;</span></span><br></p></div><blockquote id=3D"x_-68451=
8287blockquote_zmail" style=3D"margin: 0px;"><div><p style=3D"margin-right:=
 5.0pt;margin-bottom: 0.0in;margin-left: 5.0pt;"><span class=3D"x_-68451828=
7size"><span class=3D"colour" style=3D"color:blue"><span class=3D"font" sty=
le=3D"font-family:Arial, sans-serif"><span class=3D"size" style=3D"font-siz=
e:10pt">[AMD Official Use Only - General]</span></span></span></span><span =
class=3D"font" style=3D"font-family:Verdana, sans-serif"><span class=3D"siz=
e" style=3D"font-size:10pt"></span></span><br></p><div><p class=3D"" style=
=3D"margin-top: 0px; margin-bottom: 0px;"><span class=3D"font" style=3D"fon=
t-family:Verdana, sans-serif"><span class=3D"size" style=3D"font-size:10pt"=
>&nbsp;</span></span><br></p></div><div><div><p class=3D"" style=3D"margin-=
top: 0px; margin-bottom: 0px;"><span class=3D"font" style=3D"font-family:Ve=
rdana, sans-serif"><span class=3D"size" style=3D"font-size:10pt">Hi Dhanase=
kar,</span></span><br></p><p class=3D"" style=3D"margin-top: 0px; margin-bo=
ttom: 0px;"><span class=3D"font" style=3D"font-family:Verdana, sans-serif">=
<span class=3D"size" style=3D"font-size:10pt">&nbsp;</span></span><br></p><=
p class=3D"" style=3D"margin-top: 0px; margin-bottom: 0px;"><span class=3D"=
font" style=3D"font-family:Verdana, sans-serif"><span class=3D"size" style=
=3D"font-size:10pt">It is supported for EPYC Genoa family and beyond at thi=
s time.</span></span><br></p><p class=3D"" style=3D"margin-top: 0px; margin=
-bottom: 0px;"><span class=3D"font" style=3D"font-family:Verdana, sans-seri=
f"><span class=3D"size" style=3D"font-size:10pt">Daytona uses EPYC Milan fa=
mily and support is not there in that.</span></span><br></p><p class=3D"" s=
tyle=3D"margin-top: 0px; margin-bottom: 0px;"><span class=3D"font" style=3D=
"font-family:Verdana, sans-serif"><span class=3D"size" style=3D"font-size:1=
0pt">&nbsp;</span></span><br></p><div><p class=3D"" style=3D"margin-top: 0p=
x; margin-bottom: 0px;"><span class=3D"x_-684518287size"><span class=3D"col=
our" style=3D"color:black"><span class=3D"font" style=3D"font-family:Arial,=
 sans-serif"><span class=3D"size" style=3D"font-size:10pt">Thanks,</span></=
span></span></span><span class=3D"font" style=3D"font-family:Verdana, sans-=
serif"><span class=3D"size" style=3D"font-size:10pt"></span></span><br></p>=
<p class=3D"" style=3D"margin-top: 0px; margin-bottom: 0px;"><span class=3D=
"x_-684518287size"><b><span class=3D"colour" style=3D"color:black"><span cl=
ass=3D"font" style=3D"font-family:Arial, sans-serif"><span class=3D"size" s=
tyle=3D"font-size:10pt">Supreeth Venkatesh</span></span></span></b></span><=
span class=3D"font" style=3D"font-family:Verdana, sans-serif"><span class=
=3D"size" style=3D"font-size:10pt"></span></span><br></p><p class=3D"" styl=
e=3D"margin-top: 0px; margin-bottom: 0px;"><span class=3D"x_-684518287size"=
><span class=3D"colour" style=3D"color:black"><span class=3D"font" style=3D=
"font-family:Arial, sans-serif"><span class=3D"size" style=3D"font-size:9pt=
">System Manageability Architect&nbsp;&nbsp;|<b>&nbsp;&nbsp;AMD</b></span><=
/span></span></span><span class=3D"colour" style=3D"color:black"><span clas=
s=3D"font" style=3D"font-family:Arial, sans-serif"><span class=3D"size" sty=
le=3D"font-size:9pt"><br> <span class=3D"x_-684518287size">Server Software<=
/span></span></span></span><span class=3D"font" style=3D"font-family:Verdan=
a, sans-serif"><span class=3D"size" style=3D"font-size:10pt"></span></span>=
</p><p class=3D"" style=3D"margin-top: 0px; margin-bottom: 0px;"><span clas=
s=3D"colour" style=3D"color:black"><span class=3D"font" style=3D"font-famil=
y:Arial, sans-serif"><span class=3D"size" style=3D"font-size:10pt"><img bor=
der=3D"0" width=3D"1.5625in" height=3D"0.3645in" style=3D"width: 1.5625in;h=
eight: 0.3645in;" src=3D"cid:image001.png@01D9BE0F.4EE9EAC0"></span></span>=
</span><span class=3D"font" style=3D"font-family:Verdana, sans-serif"><span=
 class=3D"size" style=3D"font-size:10pt"></span></span><br></p></div><p cla=
ss=3D"" style=3D"margin-top: 0px; margin-bottom: 0px;"><span class=3D"font"=
 style=3D"font-family:Verdana, sans-serif"><span class=3D"size" style=3D"fo=
nt-size:10pt">&nbsp;</span></span><br></p><div><div style=3D"border: none;b=
order-top: solid rgb(225,225,225) 1.0pt;padding: 3.0pt 0.0in 0.0in 0.0in;">=
<p class=3D"" style=3D"margin-top: 0px; margin-bottom: 0px;"><b><span class=
=3D"font" style=3D"font-family:Verdana, sans-serif"><span class=3D"size" st=
yle=3D"font-size:10pt">From:</span></span></b><span class=3D"font" style=3D=
"font-family:Verdana, sans-serif"><span class=3D"size" style=3D"font-size:1=
0pt"> J Dhanasekar &lt;<a href=3D"mailto:jdhanasekar@velankanigroup.com" ta=
rget=3D"_blank">jdhanasekar@velankanigroup.com</a>&gt; <br> <b>Sent:</b> Fr=
iday, July 21, 2023 5:30 AM<br> <b>To:</b> Venkatesh, Supreeth &lt;<a href=
=3D"mailto:Supreeth.Venkatesh@amd.com" target=3D"_blank">Supreeth.Venkatesh=
@amd.com</a>&gt;<br> <b>Cc:</b> Zane Shelley &lt;<a href=3D"mailto:zshelle@=
imap.linux.ibm.com" target=3D"_blank">zshelle@imap.linux.ibm.com</a>&gt;; L=
ei Yu &lt;<a href=3D"mailto:yulei.sh@bytedance.com" target=3D"_blank">yulei=
.sh@bytedance.com</a>&gt;; Michael Shen &lt;<a href=3D"mailto:gpgpgp@google=
.com" target=3D"_blank">gpgpgp@google.com</a>&gt;;
 openbmc &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">=
openbmc@lists.ozlabs.org</a>&gt;; dhruvaraj S &lt;<a href=3D"mailto:dhruvar=
aj@gmail.com" target=3D"_blank">dhruvaraj@gmail.com</a>&gt;; Brad Bishop &l=
t;<a href=3D"mailto:bradleyb@fuzziesquirrel.com" target=3D"_blank">bradleyb=
@fuzziesquirrel.com</a>&gt;;
 Ed Tanous &lt;<a href=3D"mailto:ed@tanous.net" target=3D"_blank">ed@tanous=
.net</a>&gt;; Dhandapani, Abinaya &lt;<a href=3D"mailto:Abinaya.Dhandapani@=
amd.com" target=3D"_blank">Abinaya.Dhandapani@amd.com</a>&gt;<br> <b>Subjec=
t:</b> Re: [RFC] BMC RAS Feature</span></span></p></div></div><p class=3D""=
 style=3D"margin-top: 0px; margin-bottom: 0px;"><span class=3D"font" style=
=3D"font-family:Verdana, sans-serif"><span class=3D"size" style=3D"font-siz=
e:10pt">&nbsp;</span></span><br></p><table class=3D"x_-684518287MsoNormalTa=
ble" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"left" width=
=3D"100%" style=3D"width: 100.0%;"><tbody><tr><td style=3D"background: rgb(=
255,185,0);padding: 5.0pt 2.0pt 5.0pt 2.0pt;"><br></td><td width=3D"100%" s=
tyle=3D"width: 100.0%;background: rgb(255,248,229);padding: 5.0pt 4.0pt 5.0=
pt 12.0pt;"><div><p class=3D"" style=3D"margin-top: 0px; margin-bottom: 0px=
;"><span class=3D"x_-684518287colour"><b><span class=3D"colour" style=3D"co=
lor:rgb(34, 34, 34)">Caution:</span></b><span class=3D"colour" style=3D"col=
or:rgb(34, 34, 34)"> This message originated from an External Source. Use p=
roper caution when opening attachments, clicking links, or responding.</spa=
n></span><br></p></div></td></tr></tbody></table><p class=3D"" style=3D"mar=
gin-top: 0px; margin-bottom: 0px;"><span class=3D"font" style=3D"font-famil=
y:Verdana, sans-serif"><span class=3D"size" style=3D"font-size:10pt">&nbsp;=
</span></span><br></p><div><div><div><p class=3D"" style=3D"margin-top: 0px=
; margin-bottom: 0px;"><span class=3D"x_-684518287size"><span class=3D"font=
" style=3D"font-family:Verdana, sans-serif"><span class=3D"size" style=3D"f=
ont-size:10pt">Hi Supreeth Venkatesh,</span></span></span><span class=3D"fo=
nt" style=3D"font-family:Verdana, sans-serif"><span class=3D"size" style=3D=
"font-size:10pt"></span></span><br></p></div><div><p class=3D"" style=3D"ma=
rgin-top: 0px; margin-bottom: 0px;"><span class=3D"x_-684518287size"><span =
class=3D"font" style=3D"font-family:Verdana, sans-serif"><span class=3D"siz=
e" style=3D"font-size:10pt">&nbsp;</span></span></span><span class=3D"font"=
 style=3D"font-family:Verdana, sans-serif"><span class=3D"size" style=3D"fo=
nt-size:10pt"></span></span><br></p></div><div><p class=3D"" style=3D"margi=
n-top: 0px; margin-bottom: 0px;"><span class=3D"x_-684518287size"><span cla=
ss=3D"colour" style=3D"color:rgb(34, 34, 34)"><span class=3D"font" style=3D=
"font-family:Arial, sans-serif"><span class=3D"size" style=3D"font-size:12p=
t">Does this RAS feature work for the Daytona Platform.&nbsp; i have been w=
orking in openBMC development for the Daytonax platform.&nbsp;</span></span=
></span></span><span class=3D"font" style=3D"font-family:Verdana, sans-seri=
f"><span class=3D"size" style=3D"font-size:10pt"></span></span><br></p></di=
v><div><p class=3D"" style=3D"margin-top: 0px; margin-bottom: 0px;"><span c=
lass=3D"x_-684518287size"><span class=3D"colour" style=3D"color:rgb(34, 34,=
 34)"><span class=3D"font" style=3D"font-family:Arial, sans-serif"><span cl=
ass=3D"size" style=3D"font-size:12pt">If this RAS works for Daytona Platfor=
m. I will include it in my project.&nbsp;</span></span></span></span><span =
class=3D"font" style=3D"font-family:Verdana, sans-serif"><span class=3D"siz=
e" style=3D"font-size:10pt"></span></span><br></p></div><div><p class=3D"" =
style=3D"margin-top: 0px; margin-bottom: 0px;"><span class=3D"x_-684518287s=
ize"><span class=3D"colour" style=3D"color:rgb(34, 34, 34)"><span class=3D"=
font" style=3D"font-family:Arial, sans-serif"><span class=3D"size" style=3D=
"font-size:12pt">&nbsp;</span></span></span></span><span class=3D"font" sty=
le=3D"font-family:Verdana, sans-serif"><span class=3D"size" style=3D"font-s=
ize:10pt"></span></span><br></p></div><div><p class=3D"" style=3D"margin-to=
p: 0px; margin-bottom: 0px;"><span class=3D"x_-684518287size"><span class=
=3D"colour" style=3D"color:rgb(34, 34, 34)"><span class=3D"font" style=3D"f=
ont-family:Arial, sans-serif"><span class=3D"size" style=3D"font-size:12pt"=
>Please provide your suggestions.&nbsp;</span></span></span></span><span cl=
ass=3D"font" style=3D"font-family:Verdana, sans-serif"><span class=3D"size"=
 style=3D"font-size:10pt"></span></span><br></p></div><div><p class=3D"" st=
yle=3D"margin-top: 0px; margin-bottom: 0px;"><span class=3D"x_-684518287siz=
e"><span class=3D"font" style=3D"font-family:Verdana, sans-serif"><span cla=
ss=3D"size" style=3D"font-size:10pt">&nbsp;</span></span></span><span class=
=3D"font" style=3D"font-family:Verdana, sans-serif"><span class=3D"size" st=
yle=3D"font-size:10pt"></span></span><br></p></div><div><p class=3D"" style=
=3D"margin-top: 0px; margin-bottom: 0px;"><span class=3D"x_-684518287size">=
<span class=3D"font" style=3D"font-family:Verdana, sans-serif"><span class=
=3D"size" style=3D"font-size:10pt">Thanks,</span></span></span><span class=
=3D"font" style=3D"font-family:Verdana, sans-serif"><span class=3D"size" st=
yle=3D"font-size:10pt"></span></span><br></p></div><div><p class=3D"" style=
=3D"margin-top: 0px; margin-bottom: 0px;"><span class=3D"x_-684518287size">=
<span class=3D"font" style=3D"font-family:Verdana, sans-serif"><span class=
=3D"size" style=3D"font-size:10pt">Dhanasekar</span></span></span><span cla=
ss=3D"font" style=3D"font-family:Verdana, sans-serif"><span class=3D"size" =
style=3D"font-size:10pt"></span></span><br></p></div><div><p class=3D"" sty=
le=3D"margin-top: 0px; margin-bottom: 0px;"><span class=3D"x_-684518287size=
"><span class=3D"font" style=3D"font-family:Verdana, sans-serif"><span clas=
s=3D"size" style=3D"font-size:10pt">&nbsp;</span></span></span><span class=
=3D"font" style=3D"font-family:Verdana, sans-serif"><span class=3D"size" st=
yle=3D"font-size:10pt"></span></span><br></p></div><div id=3D"x_-204459234Z=
m-_Id_-Sgn"><div><p class=3D"" style=3D"margin-top: 0px; margin-bottom: 0px=
;"><span class=3D"x_-684518287size"><span class=3D"font" style=3D"font-fami=
ly:Verdana, sans-serif"><span class=3D"size" style=3D"font-size:10pt">&nbsp=
;</span></span></span><span class=3D"font" style=3D"font-family:Verdana, sa=
ns-serif"><span class=3D"size" style=3D"font-size:10pt"></span></span><br><=
/p></div></div><div><p class=3D"" style=3D"margin-top: 0px; margin-bottom: =
0px;"><span class=3D"x_-684518287size"><span class=3D"font" style=3D"font-f=
amily:Verdana, sans-serif"><span class=3D"size" style=3D"font-size:10pt">&n=
bsp;</span></span></span><span class=3D"font" style=3D"font-family:Verdana,=
 sans-serif"><span class=3D"size" style=3D"font-size:10pt"></span></span><b=
r></p></div><div style=3D"border: none;border-top: solid rgb(204,204,204) 1=
.0pt;padding: 0.0in 0.0in 0.0in 0.0in;margin-top: 7.5pt;margin-bottom: 7.5p=
t;"><p class=3D"" style=3D"margin-top: 0px; margin-bottom: 0px;"><span clas=
s=3D"x_-684518287size"><span class=3D"font" style=3D"font-family:Verdana, s=
ans-serif"><span class=3D"size" style=3D"font-size:10pt">&nbsp;</span></spa=
n></span><span class=3D"font" style=3D"font-family:Verdana, sans-serif"><sp=
an class=3D"size" style=3D"font-size:10pt"></span></span><br></p></div><div=
><div><p class=3D"" style=3D"margin-top: 0px; margin-bottom: 0px;"><span cl=
ass=3D"x_-684518287size"><span class=3D"font" style=3D"font-family:Verdana,=
 sans-serif"><span class=3D"size" style=3D"font-size:10pt">&nbsp;</span></s=
pan></span><span class=3D"font" style=3D"font-family:Verdana, sans-serif"><=
span class=3D"size" style=3D"font-size:10pt"></span></span><br></p></div><d=
iv id=3D"x_-204459234Zm-_Id_-Sgn1"><p class=3D"" style=3D"margin-top: 0px; =
margin-bottom: 0px;"><span class=3D"x_-684518287size"><span class=3D"font" =
style=3D"font-family:Verdana, sans-serif"><span class=3D"size" style=3D"fon=
t-size:10pt">---- On Mon, 03 Apr 2023 22:06:24 +0530 <b>Supreeth Venkatesh =
&lt;<a href=3D"mailto:supreeth.venkatesh@amd.com" target=3D"_blank">supreet=
h.venkatesh@amd.com</a>&gt;</b> wrote ---</span></span></span><span class=
=3D"font" style=3D"font-family:Verdana, sans-serif"><span class=3D"size" st=
yle=3D"font-size:10pt"></span></span><br></p></div><div><p class=3D"" style=
=3D"margin-top: 0px; margin-bottom: 0px;"><span class=3D"x_-684518287size">=
<span class=3D"font" style=3D"font-family:Verdana, sans-serif"><span class=
=3D"size" style=3D"font-size:10pt">&nbsp;</span></span></span><span class=
=3D"font" style=3D"font-family:Verdana, sans-serif"><span class=3D"size" st=
yle=3D"font-size:10pt"></span></span><br></p></div><blockquote id=3D"x_-204=
459234blockquote_zmail" style=3D"margin: 0px;"><div><p class=3D"" style=3D"=
margin-top: 0px; margin-bottom: 0px;"><span class=3D"font" style=3D"font-fa=
mily:Verdana, sans-serif"><span class=3D"size" style=3D"font-size:10pt"><br=
><span class=3D"x_-684518287size">On 3/23/23 13:57, Zane Shelley wrote:</sp=
an><br> <span class=3D"x_-684518287size">&gt; Caution: This message origina=
ted from an External Source. Use proper </span><br> <span class=3D"x_-68451=
8287size">&gt; caution when opening attachments, clicking links, or respond=
ing. </span><br> <span class=3D"x_-684518287size">&gt; </span><br> <span cl=
ass=3D"x_-684518287size">&gt; </span><br> <span class=3D"x_-684518287size">=
&gt; On 2023-03-22 19:07, Supreeth Venkatesh wrote: </span><br> <span class=
=3D"x_-684518287size">&gt;&gt; On 3/22/23 02:10, Lei Yu wrote: </span><br> =
<span class=3D"x_-684518287size">&gt;&gt;&gt; Caution: This message origina=
ted from an External Source. Use proper </span><br> <span class=3D"x_-68451=
8287size">&gt;&gt;&gt; caution when opening attachments, clicking links, or=
 responding. </span><br> <span class=3D"x_-684518287size">&gt;&gt;&gt; </sp=
an><br> <span class=3D"x_-684518287size">&gt;&gt;&gt; </span><br> <span cla=
ss=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; On Tue, 21 Mar 2023 at 20:38, =
Supreeth Venkatesh </span> <br> <span class=3D"x_-684518287size">&gt;&gt;&g=
t;&gt;&gt; &lt;<a href=3D"mailto:supreeth.venkatesh@amd.com" target=3D"_bla=
nk">supreeth.venkatesh@amd.com</a>&gt; wrote: </span><br> <span class=3D"x_=
-684518287size">&gt;&gt;&gt;&gt;&gt; </span><br> <span class=3D"x_-68451828=
7size">&gt;&gt;&gt;&gt;&gt; </span><br> <span class=3D"x_-684518287size">&g=
t;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; On 3/21/23 05:40, Patrick Willi=
ams wrote: </span><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt=
; &nbsp;&nbsp;&nbsp;&nbsp; &gt; On Tue, Mar 21, 2023 at 12:14:45AM -0500, S=
upreeth Venkatesh </span><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;=
&gt;&gt; wrote: </span><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&g=
t;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &gt; </span><br> <span class=3D"x_-68451828=
7size">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; #### Alternat=
ives Considered </span><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&g=
t;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; </span><br> <span class=3D"x_-6845=
18287size">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; In-band m=
echanisms using System Management Mode (SMM) </span><br> <span class=3D"x_-=
684518287size">&gt;&gt;&gt;&gt;&gt; exists. </span><br> <span class=3D"x_-6=
84518287size">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; </span=
><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nb=
sp;&nbsp; &gt;&gt; However, out of band method to gather RAS data is proces=
sor </span><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; &nbsp=
;&nbsp;&nbsp;&nbsp; specific. </span><br> <span class=3D"x_-684518287size">=
&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; </span><br> <span cl=
ass=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &gt;=
 How does this compare with existing implementations in </span><br> <span c=
lass=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &gt=
; phosphor-debug-collector. </span><br> <span class=3D"x_-684518287size">&g=
t;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; Thanks for your feedback. See b=
elow. </span><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; &nb=
sp;&nbsp;&nbsp;&nbsp; &gt; I believe there was some attempt to extend </spa=
n> <br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&=
nbsp;&nbsp; &gt; P-D-C previously to handle Intel's crashdump behavior. </s=
pan><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;=
&nbsp;&nbsp; Intel's crashdump interface uses com.intel.crashdump. </span><=
br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp=
;&nbsp; We have implemented com.amd.crashdump based on that reference. </sp=
an><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&=
nbsp;&nbsp; However, </span><br> <span class=3D"x_-684518287size">&gt;&gt;&=
gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; can this be made generic? </span><br> =
<span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; </span><br> <span cla=
ss=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; PoC b=
elow: </span><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; </s=
pan><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;=
&nbsp;&nbsp; busctl tree com.amd.crashdump </span><br> <span class=3D"x_-68=
4518287size">&gt;&gt;&gt;&gt;&gt; </span><br> <span class=3D"x_-684518287si=
ze">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; =E2=94=94=E2=94=80/com </=
span><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=94=94=E2=94=80/com/amd </span><br> <spa=
n class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=94=94=E2=94=80/com/amd/crashdump </span><=
br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><spa=
n class=3D"x_-684518287size"><span class=3D"font" style=3D"font-family:Aria=
l, sans-serif"><span class=3D"size" style=3D"font-size:10pt">=E2=94=9C</spa=
n></span></span><span class=3D"x_-684518287size"><span class=3D"font" style=
=3D"font-family:Verdana, sans-serif"><span class=3D"size" style=3D"font-siz=
e:10pt">=E2=94=80/com/amd/crashdump/0 </span></span></span><span class=3D"f=
ont" style=3D"font-family:Verdana, sans-serif"><span class=3D"size" style=
=3D"font-size:10pt"><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&=
gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </sp=
an></span></span><span class=3D"x_-684518287size"><span class=3D"font" styl=
e=3D"font-family:Arial, sans-serif"><span class=3D"size" style=3D"font-size=
:10pt">=E2=94=9C</span></span></span><span class=3D"x_-684518287size"><span=
 class=3D"font" style=3D"font-family:Verdana, sans-serif"><span class=3D"si=
ze" style=3D"font-size:10pt">=E2=94=80/com/amd/crashdump/1 </span></span></=
span><span class=3D"font" style=3D"font-family:Verdana, sans-serif"><span c=
lass=3D"size" style=3D"font-size:10pt"><br> <span class=3D"x_-684518287size=
">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; </span></span></span><span class=3D"x_-684518287size"><span =
class=3D"font" style=3D"font-family:Arial, sans-serif"><span class=3D"size"=
 style=3D"font-size:10pt">=E2=94=9C</span></span></span><span class=3D"x_-6=
84518287size"><span class=3D"font" style=3D"font-family:Verdana, sans-serif=
"><span class=3D"size" style=3D"font-size:10pt">=E2=94=80/com/amd/crashdump=
/2 </span></span></span><span class=3D"font" style=3D"font-family:Verdana, =
sans-serif"><span class=3D"size" style=3D"font-size:10pt"><br> <span class=
=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><span class=3D"x_-6=
84518287size"><span class=3D"font" style=3D"font-family:Arial, sans-serif">=
<span class=3D"size" style=3D"font-size:10pt">=E2=94=9C</span></span></span=
><span class=3D"x_-684518287size"><span class=3D"font" style=3D"font-family=
:Verdana, sans-serif"><span class=3D"size" style=3D"font-size:10pt">=E2=94=
=80/com/amd/crashdump/3 </span></span></span><span class=3D"font" style=3D"=
font-family:Verdana, sans-serif"><span class=3D"size" style=3D"font-size:10=
pt"><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span=
><span class=3D"x_-684518287size"><span class=3D"font" style=3D"font-family=
:Arial, sans-serif"><span class=3D"size" style=3D"font-size:10pt">=E2=94=9C=
</span></span></span><span class=3D"x_-684518287size"><span class=3D"font" =
style=3D"font-family:Verdana, sans-serif"><span class=3D"size" style=3D"fon=
t-size:10pt">=E2=94=80/com/amd/crashdump/4 </span></span></span><span class=
=3D"font" style=3D"font-family:Verdana, sans-serif"><span class=3D"size" st=
yle=3D"font-size:10pt"><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&g=
t;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <=
/span></span></span><span class=3D"x_-684518287size"><span class=3D"font" s=
tyle=3D"font-family:Arial, sans-serif"><span class=3D"size" style=3D"font-s=
ize:10pt">=E2=94=9C</span></span></span><span class=3D"x_-684518287size"><s=
pan class=3D"font" style=3D"font-family:Verdana, sans-serif"><span class=3D=
"size" style=3D"font-size:10pt">=E2=94=80/com/amd/crashdump/5 </span></span=
></span><span class=3D"font" style=3D"font-family:Verdana, sans-serif"><spa=
n class=3D"size" style=3D"font-size:10pt"><br> <span class=3D"x_-684518287s=
ize">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; </span></span></span><span class=3D"x_-684518287size"><sp=
an class=3D"font" style=3D"font-family:Arial, sans-serif"><span class=3D"si=
ze" style=3D"font-size:10pt">=E2=94=9C</span></span></span><span class=3D"x=
_-684518287size"><span class=3D"font" style=3D"font-family:Verdana, sans-se=
rif"><span class=3D"size" style=3D"font-size:10pt">=E2=94=80/com/amd/crashd=
ump/6 </span></span></span><span class=3D"font" style=3D"font-family:Verdan=
a, sans-serif"><span class=3D"size" style=3D"font-size:10pt"><br> <span cla=
ss=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><span class=3D"x_=
-684518287size"><span class=3D"font" style=3D"font-family:Arial, sans-serif=
"><span class=3D"size" style=3D"font-size:10pt">=E2=94=9C</span></span></sp=
an><span class=3D"x_-684518287size"><span class=3D"font" style=3D"font-fami=
ly:Verdana, sans-serif"><span class=3D"size" style=3D"font-size:10pt">=E2=
=94=80/com/amd/crashdump/7 </span></span></span><span class=3D"font" style=
=3D"font-family:Verdana, sans-serif"><span class=3D"size" style=3D"font-siz=
e:10pt"><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; &nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></=
span><span class=3D"x_-684518287size"><span class=3D"font" style=3D"font-fa=
mily:Arial, sans-serif"><span class=3D"size" style=3D"font-size:10pt">=E2=
=94=9C</span></span></span><span class=3D"x_-684518287size"><span class=3D"=
font" style=3D"font-family:Verdana, sans-serif"><span class=3D"size" style=
=3D"font-size:10pt">=E2=94=80/com/amd/crashdump/8 </span></span></span><spa=
n class=3D"font" style=3D"font-family:Verdana, sans-serif"><span class=3D"s=
ize" style=3D"font-size:10pt"><br> <span class=3D"x_-684518287size">&gt;&gt=
;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; =E2=94=94=E2=94=80/com/amd/crashdump/9 </span><br> <span class=3D"x_-=
684518287size">&gt;&gt;&gt;&gt;&gt; </span><br> <span class=3D"x_-684518287=
size">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &gt; The repository </s=
pan><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;=
&nbsp;&nbsp; &gt; currently handles IBM's processors, I think, or maybe tha=
t is </span><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; &nbs=
p;&nbsp;&nbsp;&nbsp; covered by </span><br> <span class=3D"x_-684518287size=
">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &gt; openpower-debug-collec=
tor. </span><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; &nbs=
p;&nbsp;&nbsp;&nbsp; &gt; </span><br> <span class=3D"x_-684518287size">&gt;=
&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &gt; In any case, I think you sho=
uld look at the existing D-Bus </span><br> <span class=3D"x_-684518287size"=
>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; interfaces </span><br> <span=
 class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &=
gt; (and associated Redfish implementation) of these repositories </span><b=
r> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; and </span><br> <s=
pan class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp=
; &gt; determine if you can use those approaches (or document why </span><b=
r> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; now). </span><br> =
<span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nb=
sp; I could not find an existing D-Bus interface for RAS in </span><br> <sp=
an class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;=
 xyz/openbmc_project/. </span><br> <span class=3D"x_-684518287size">&gt;&gt=
;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; It would be helpful if you could poi=
nt me to it. </span> <br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;=
&gt; </span><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; </sp=
an><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; There is an i=
nterface for the dumps generated from the host, which </span><br> <span cla=
ss=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; can </span><br> <span class=3D=
"x_-684518287size">&gt;&gt;&gt;&gt;&gt; be used for these kinds of dumps </=
span><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; <a href=3D"=
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/op=
enbmc_project/Dump/Entry/System.interface.yaml" target=3D"_blank"> https://=
github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_pr=
oject/Dump/Entry/System.interface.yaml</a> </span><br> <span class=3D"x_-68=
4518287size">&gt;&gt;&gt;&gt;&gt; </span><br> <span class=3D"x_-684518287si=
ze">&gt;&gt;&gt;&gt;&gt; </span><br> <span class=3D"x_-684518287size">&gt;&=
gt;&gt;&gt;&gt; The fault log also provides similar dumps </span><br> <span=
 class=3D"x_-684518287size">&gt;&gt;&gt;&gt;&gt; <a href=3D"https://github.=
com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/D=
ump/Entry/FaultLog.interface.yaml" target=3D"_blank"> https://github.com/op=
enbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Dump/En=
try/FaultLog.interface.yaml</a> </span><br> <span class=3D"x_-684518287size=
">&gt;&gt;&gt;&gt;&gt; </span><br> <span class=3D"x_-684518287size">&gt;&gt=
;&gt;&gt;&gt; </span><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;=
 ThanksDdhruvraj. The interface looks useful for the purpose. However, </sp=
an><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt; the current BMCWE=
B implementation references </span><br> <span class=3D"x_-684518287size">&g=
t;&gt;&gt;&gt; <a href=3D"https://github.com/openbmc/bmcweb/blob/master/red=
fish-core/lib/log_services.hpp" target=3D"_blank"> https://github.com/openb=
mc/bmcweb/blob/master/redfish-core/lib/log_services.hpp</a> </span><br> <sp=
an class=3D"x_-684518287size">&gt;&gt;&gt;&gt; </span><br> <span class=3D"x=
_-684518287size">&gt;&gt;&gt;&gt; [com.intel.crashdump] </span><br> <span c=
lass=3D"x_-684518287size">&gt;&gt;&gt;&gt; constexpr char const* crashdumpP=
ath =3D "/com/intel/crashdump"; </span><br> <span class=3D"x_-684518287size=
">&gt;&gt;&gt;&gt; </span><br> <span class=3D"x_-684518287size">&gt;&gt;&gt=
;&gt; constexpr char const* crashdumpInterface =3D "com.intel.crashdump"; <=
/span><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt; constexpr char=
 const* crashdumpObject =3D "com.intel.crashdump"; </span><br> <span class=
=3D"x_-684518287size">&gt;&gt;&gt;&gt; </span><br> <span class=3D"x_-684518=
287size">&gt;&gt;&gt;&gt; <a href=3D"https://github.com/openbmc/phosphor-db=
us-interfaces/blob/master/yaml/xyz/openbmc_project/Dump/Entry/System.interf=
ace.yaml" target=3D"_blank"> https://github.com/openbmc/phosphor-dbus-inter=
faces/blob/master/yaml/xyz/openbmc_project/Dump/Entry/System.interface.yaml=
</a> </span><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt; </span><=
br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt; or </span><br> <span =
class=3D"x_-684518287size">&gt;&gt;&gt;&gt; <a href=3D"https://github.com/o=
penbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Dump/E=
ntry/FaultLog.interface.yaml" target=3D"_blank"> https://github.com/openbmc=
/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Dump/Entry/F=
aultLog.interface.yaml</a> </span><br> <span class=3D"x_-684518287size">&gt=
;&gt;&gt;&gt; </span><br> <span class=3D"x_-684518287size">&gt;&gt;&gt;&gt;=
 is it exercised in Redfish logservices? </span><br> <span class=3D"x_-6845=
18287size">&gt;&gt;&gt; In our practice, a plugin `tools/dreport.d/plugins.=
d/acddump` is added </span><br> <span class=3D"x_-684518287size">&gt;&gt;&g=
t; to copy the crashdump json file to the dump tarball. </span> <br> <span =
class=3D"x_-684518287size">&gt;&gt;&gt; The crashdump tool (Intel or AMD) c=
ould trigger a dump after the </span><br> <span class=3D"x_-684518287size">=
&gt;&gt;&gt; crashdump is completed, and then we could get a dump entry con=
taining </span><br> <span class=3D"x_-684518287size">&gt;&gt;&gt; the crash=
dump. </span><br> <span class=3D"x_-684518287size">&gt;&gt; Thanks Lei Yu f=
or your input. We are using Redfish to retrieve the </span><br> <span class=
=3D"x_-684518287size">&gt;&gt; CPER binary file which can then be passed th=
rough a plugin/script for </span><br> <span class=3D"x_-684518287size">&gt;=
&gt; detailed analysis. </span><br> <span class=3D"x_-684518287size">&gt;&g=
t; In any case irrespective of whichever Dbus interface we use, we need a <=
/span><br> <span class=3D"x_-684518287size">&gt;&gt; repository which will =
gather data from AMD processor via APML as per </span><br> <span class=3D"x=
_-684518287size">&gt;&gt; AMD design. </span><br> <span class=3D"x_-6845182=
87size">&gt;&gt; APML </span><br> <span class=3D"x_-684518287size">&gt;&gt;=
 Spec: <a href=3D"https://www.amd.com/system/files/TechDocs/57019-A0-PUB_3.=
00.zip" target=3D"_blank"> https://www.amd.com/system/files/TechDocs/57019-=
A0-PUB_3.00.zip</a> </span><br> <span class=3D"x_-684518287size">&gt;&gt; C=
an someone please help create bmc-ras or amd-debug-collector </span><br> <s=
pan class=3D"x_-684518287size">&gt;&gt; repository as there are instances o=
f openpower-debug-collector </span><br> <span class=3D"x_-684518287size">&g=
t;&gt; repository used for Open Power systems? </span><br> <span class=3D"x=
_-684518287size">&gt;&gt;&gt; </span><br> <span class=3D"x_-684518287size">=
&gt;&gt;&gt; </span><br> <span class=3D"x_-684518287size">&gt;&gt;&gt; -- <=
/span><br> <span class=3D"x_-684518287size">&gt;&gt;&gt; BRs, </span><br> <=
span class=3D"x_-684518287size">&gt;&gt;&gt; Lei YU </span><br> <span class=
=3D"x_-684518287size">&gt; I am interested in possibly standardizing some o=
f this. IBM POWER has </span><br> <span class=3D"x_-684518287size">&gt; sev=
eral related components. openpower-hw-diags is a service that will </span><=
br> <span class=3D"x_-684518287size">&gt; listen for the hardware interrupt=
s via a GPIO pin. When an error is </span><br> <span class=3D"x_-684518287s=
ize">&gt; detected, it will use openpower-libhei to query hardware register=
s to </span><br> <span class=3D"x_-684518287size">&gt; determine what happe=
ned. Based on that information openpower-hw-diags </span><br> <span class=
=3D"x_-684518287size">&gt; will generate a PEL, which is an extended log in=
 phosphor-logging, that </span><br> <span class=3D"x_-684518287size">&gt; i=
s used to tell service what to replace if necessary. Afterward, </span><br>=
 <span class=3D"x_-684518287size">&gt; openpower-hw-diags will initiate ope=
npower-debug-collector, which </span><br> <span class=3D"x_-684518287size">=
&gt; gathers a significant amount of data from the hardware for additional =
</span><br> <span class=3D"x_-684518287size">&gt; debug when necessary. I w=
rote openpower-libhei to be fairly agnostic. It </span><br> <span class=3D"=
x_-684518287size">&gt; uses data files (currently XML, but moving to JSON) =
to define register </span><br> <span class=3D"x_-684518287size">&gt; addres=
ses and rules for isolation. openpower-hw-diags is fairly POWER </span><br>=
 <span class=3D"x_-684518287size">&gt; specific, but I can see some parts c=
an be made generic. Dhruv would have </span><br> <span class=3D"x_-68451828=
7size">&gt; to help with openpower-debug-collector. </span><br> <span class=
=3D"x_-684518287size">Thank you. Lets collaborate in standardizing some asp=
ects of it. </span><br> <span class=3D"x_-684518287size">&gt; </span><br> <=
span class=3D"x_-684518287size">&gt; Regarding creation of a new repository=
, I think we'll need to have some </span><br> <span class=3D"x_-684518287si=
ze">&gt; more collaboration to determine the scope before creating it. It <=
/span><br> <span class=3D"x_-684518287size">&gt; certainly sounds like we a=
re doing similar things, but we need to </span><br> <span class=3D"x_-68451=
8287size">&gt; determine if enough can be abstracted to make it worth our t=
ime. </span><br> <span class=3D"x_-684518287size">I have put in a request h=
ere: </span><br> <span class=3D"x_-684518287size"><a href=3D"https://github=
.com/openbmc/technical-oversight-forum/issues/24" target=3D"_blank">https:/=
/github.com/openbmc/technical-oversight-forum/issues/24</a> </span><br> <sp=
an class=3D"x_-684518287size">Please chime in.</span></span></span></p></di=
v></blockquote></div><div><p class=3D"" style=3D"margin-top: 0px; margin-bo=
ttom: 0px;"><span class=3D"x_-684518287size"><span class=3D"font" style=3D"=
font-family:Verdana, sans-serif"><span class=3D"size" style=3D"font-size:10=
pt">&nbsp;</span></span></span><span class=3D"font" style=3D"font-family:Ve=
rdana, sans-serif"><span class=3D"size" style=3D"font-size:10pt"></span></s=
pan><br></p></div></div><p class=3D"" style=3D"margin-top: 0px; margin-bott=
om: 0px;"><span class=3D"font" style=3D"font-family:Verdana, sans-serif"><s=
pan class=3D"size" style=3D"font-size:10pt">&nbsp;</span></span><br></p></d=
iv></div></div></div></blockquote></div><div><p class=3D"" style=3D"margin-=
top: 0px; margin-bottom: 0px;"><span class=3D"font" style=3D"font-family:Ve=
rdana, sans-serif"><span class=3D"size" style=3D"font-size:10pt">&nbsp;</sp=
an></span><br></p></div></div><p class=3D"" style=3D"margin-top: 0px; margi=
n-bottom: 0px;">&nbsp;<br></p></div></div></div></div></blockquote></div><d=
iv><br></div></div><br></body></html>
------=_Part_2895739_1302712611.1690290564381
Content-Type: image/png; name=1.png
Content-Transfer-Encoding: base64
Content-Disposition: inline; filename=1.png
Content-ID: <image001.png@01D9BE0F.4EE9EAC0>

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
------=_Part_2895739_1302712611.1690290564381--

------=_Part_2895738_559444056.1690290564369--

