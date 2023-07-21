Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4266475C4EE
	for <lists+openbmc@lfdr.de>; Fri, 21 Jul 2023 12:45:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=velankanigroup.com header.i=jdhanasekar@velankanigroup.com header.a=rsa-sha256 header.s=zoho header.b=AL6JNZmc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6mRk3pYvz3bxr
	for <lists+openbmc@lfdr.de>; Fri, 21 Jul 2023 20:45:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=velankanigroup.com header.i=jdhanasekar@velankanigroup.com header.a=rsa-sha256 header.s=zoho header.b=AL6JNZmc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=velankanigroup.com (client-ip=103.117.158.11; helo=sender-op-o11.zoho.in; envelope-from=jdhanasekar@velankanigroup.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 905 seconds by postgrey-1.37 at boromir; Fri, 21 Jul 2023 20:45:06 AEST
Received: from sender-op-o11.zoho.in (sender-op-o11.zoho.in [103.117.158.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6mR65gJTz3bpd
	for <openbmc@lists.ozlabs.org>; Fri, 21 Jul 2023 20:45:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1689935380; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=PUWze4cjVSE9IHKWSlXHDQRgEMN4EQ+iP1PC7smVxIBbMRwHEyh5wNwt1gpnL5MREpyr88lYuGtE3rY6WjamCyy6G5v8Obmd4AzhJEVkHfVYVJesUvrOJCajCNi3l8cNW7IubXSBU1T743NWOfLLPJLLLLZwH10MOQpqdElSabQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1689935380; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=nSuj5215cz1qwEtgua3+MIbhDclSc+3guDtrc9pXX5g=; 
	b=TRwgbf9OXYl64WKoLSh8sG2f+hsXkY7H8NYlIlTBVdoJeq4SyhXza4iSyaPXbU8sRg+zYrkjqDxpGbBe+MC+ynFcqg/g9Rbnc7y31zyBuuuUimYY/qbxqfeBY9JFZgGxH2vOxZIlaEVIr+zQeF+N2HEwkZHu6CMVpyTSVR2CfoQ=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=velankanigroup.com;
	spf=pass  smtp.mailfrom=jdhanasekar@velankanigroup.com;
	dmarc=pass header.from=<jdhanasekar@velankanigroup.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1689935380;
	s=zoho; d=velankanigroup.com; i=jdhanasekar@velankanigroup.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-Id:Message-Id:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Reply-To;
	bh=nSuj5215cz1qwEtgua3+MIbhDclSc+3guDtrc9pXX5g=;
	b=AL6JNZmcfuCsOWTlsK9V2FpS96R+UqDR3iBjuq7WVwhH+rPcgwO+i1/4709TnHkN
	fqdqIcdRetqUzgj6bk0qG/CCo4kh8Nab91mtlhKLLp4J98ZT7To/YBIdYz/JSIfpteW
	eAC/PLMLmyuImSME3BFtoqlJ3GbQDB2HEyjWTzcM=
Received: from mail.zoho.in by mx.zoho.in
	with SMTP id 1689935379699793.7508394902146; Fri, 21 Jul 2023 15:59:39 +0530 (IST)
Date: Fri, 21 Jul 2023 15:59:39 +0530
From: J Dhanasekar <jdhanasekar@velankanigroup.com>
To: "Supreeth Venkatesh" <supreeth.venkatesh@amd.com>
Message-Id: <18977ff7cd7.59a883fc562150.7689391317426675156@velankanigroup.com>
In-Reply-To: <71a122a9-07a9-06a8-ee1a-dd108db63df3@amd.com>
References: <07621845-19a4-0568-be0e-f556ba40b813@amd.com>
 <ZBmJpxTnEVVpfsz2@heinlein.taila677.ts.net>
 <255d7c9a-ce17-bbe1-7312-990d0221cf36@amd.com>
 <CAK7WosjjdVwNqSwkY2mxYhgAeKdwigtyLryTfJ9r6ShjfbRuCA@mail.gmail.com>
 <65515592-8f77-1c8f-731c-165fb833344b@amd.com>
 <CAGm54UG+S7gFkCaKJm_7PxOCDu0haZ4FWUxj716JBGVY-gaTFw@mail.gmail.com>
 <d9f7b650-2e8b-7bd0-2125-035531ce549c@amd.com>
 <d65937a46b6fb4f9f94edbdef44af58e@imap.linux.ibm.com> <71a122a9-07a9-06a8-ee1a-dd108db63df3@amd.com>
Subject: Re: [RFC] BMC RAS Feature
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_1762041_818402065.1689935379671"
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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
Cc: Lei Yu <yulei.sh@bytedance.com>, Zane Shelley <zshelle@imap.linux.ibm.com>, Michael Shen <gpgpgp@google.com>, openbmc <openbmc@lists.ozlabs.org>, dhruvaraj S <dhruvaraj@gmail.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>, Ed Tanous <ed@tanous.net>, "Abinaya.Dhandapani" <Abinaya.Dhandapani@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_Part_1762041_818402065.1689935379671
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Supreeth Venkatesh,



Does this RAS feature work for the Daytona Platform.=C2=A0 i have been work=
ing in openBMC development for the Daytonax platform.=C2=A0

If this RAS works for Daytona Platform. I will include it in my project.=C2=
=A0



Please provide your suggestions.=C2=A0



Thanks,

Dhanasekar











---- On Mon, 03 Apr 2023 22:06:24 +0530 Supreeth Venkatesh <supreeth.venkat=
esh@amd.com> wrote ---




On 3/23/23 13:57, Zane Shelley wrote:=20
> Caution: This message originated from an External Source. Use proper=20
> caution when opening attachments, clicking links, or responding.=20
>=20
>=20
> On 2023-03-22 19:07, Supreeth Venkatesh wrote:=20
>> On 3/22/23 02:10, Lei Yu wrote:=20
>>> Caution: This message originated from an External Source. Use proper=20
>>> caution when opening attachments, clicking links, or responding.=20
>>>=20
>>>=20
>>>>> On Tue, 21 Mar 2023 at 20:38, Supreeth Venkatesh=20
>>>>> <mailto:supreeth.venkatesh@amd.com> wrote:=20
>>>>>=20
>>>>>=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 On 3/21/23 05:40, Patrick Williams wrote:=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 > On Tue, Mar 21, 2023 at 12:14:45AM -0500, =
Supreeth Venkatesh=20
>>>>> wrote:=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 >=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 >> #### Alternatives Considered=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 >>=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 >> In-band mechanisms using System Managemen=
t Mode (SMM)=20
>>>>> exists.=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 >>=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 >> However, out of band method to gather RAS=
 data is processor=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 specific.=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 >>=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 > How does this compare with existing implem=
entations in=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 > phosphor-debug-collector.=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Thanks for your feedback. See below.=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 > I believe there was some attempt to extend=
=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 > P-D-C previously to handle Intel's crashdu=
mp behavior.=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Intel's crashdump interface uses com.intel.c=
rashdump.=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 We have implemented com.amd.crashdump based =
on that reference.=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 However,=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 can this be made generic?=20
>>>>>=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 PoC below:=20
>>>>>=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 busctl tree com.amd.crashdump=20
>>>>>=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=94=E2=94=80/com=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=94=E2=94=80/com/amd=
=20
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
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 > currently handles IBM's processors, I thin=
k, or maybe that is=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 covered by=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 > openpower-debug-collector.=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 >=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 > In any case, I think you should look at th=
e existing D-Bus=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 interfaces=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 > (and associated Redfish implementation) of=
 these repositories=20
>>>>> and=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 > determine if you can use those approaches =
(or document why=20
>>>>> now).=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 I could not find an existing D-Bus interface=
 for RAS in=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 xyz/openbmc_project/.=20
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 It would be helpful if you could point me to=
 it.=20
>>>>>=20
>>>>>=20
>>>>> There is an interface for the dumps generated from the host, which=20
>>>>> can=20
>>>>> be used for these kinds of dumps=20
>>>>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/=
xyz/openbmc_project/Dump/Entry/System.interface.yaml=20
>>>>>=20
>>>>>=20
>>>>> The fault log also provides similar dumps=20
>>>>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/=
xyz/openbmc_project/Dump/Entry/FaultLog.interface.yaml=20
>>>>>=20
>>>>>=20
>>>> ThanksDdhruvraj. The interface looks useful for the purpose. However,=
=20
>>>> the current BMCWEB implementation references=20
>>>> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/log_ser=
vices.hpp=20
>>>>=20
>>>> [com.intel.crashdump]=20
>>>> constexpr char const* crashdumpPath =3D "/com/intel/crashdump";=20
>>>>=20
>>>> constexpr char const* crashdumpInterface =3D "com.intel.crashdump";=20
>>>> constexpr char const* crashdumpObject =3D "com.intel.crashdump";=20
>>>>=20
>>>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/x=
yz/openbmc_project/Dump/Entry/System.interface.yaml=20
>>>>=20
>>>> or=20
>>>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/x=
yz/openbmc_project/Dump/Entry/FaultLog.interface.yaml=20
>>>>=20
>>>> is it exercised in Redfish logservices?=20
>>> In our practice, a plugin `tools/dreport.d/plugins.d/acddump` is added=
=20
>>> to copy the crashdump json file to the dump tarball.=20
>>> The crashdump tool (Intel or AMD) could trigger a dump after the=20
>>> crashdump is completed, and then we could get a dump entry containing=
=20
>>> the crashdump.=20
>> Thanks Lei Yu for your input. We are using Redfish to retrieve the=20
>> CPER binary file which can then be passed through a plugin/script for=20
>> detailed analysis.=20
>> In any case irrespective of whichever Dbus interface we use, we need a=
=20
>> repository which will gather data from AMD processor via APML as per=20
>> AMD design.=20
>> APML=20
>> Spec: https://www.amd.com/system/files/TechDocs/57019-A0-PUB_3.00.zip=20
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
> uses data files (currently XML, but moving to JSON) to define register=20
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
------=_Part_1762041_818402065.1689935379671
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head>=
<meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type"></h=
ead><body ><div style=3D"font-family: Verdana, Arial, Helvetica, sans-serif=
; font-size: 10pt;"><div>Hi Supreeth Venkatesh,<br></div><div><br></div><di=
v style=3D"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-seri=
f; font-size: small; font-style: normal; font-variant-ligatures: normal; fo=
nt-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans:=
 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; w=
ord-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; text=
-decoration-thickness: initial; text-decoration-style: initial; text-decora=
tion-color: initial;">Does this RAS feature work for the Daytona Platform.&=
nbsp; i have been working in openBMC development for the Daytonax platform.=
&nbsp;<br></div><div style=3D"color: rgb(34, 34, 34); font-family: Arial, H=
elvetica, sans-serif; font-size: small; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacin=
g: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform:=
 none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-=
space: normal; text-decoration-thickness: initial; text-decoration-style: i=
nitial; text-decoration-color: initial;">If this RAS works for Daytona Plat=
form. I will include it in my project.&nbsp;<br></div><div style=3D"color: =
rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: smal=
l; font-style: normal; font-variant-ligatures: normal; font-variant-caps: n=
ormal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: st=
art; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; white-space: normal; text-decoration-thickn=
ess: initial; text-decoration-style: initial; text-decoration-color: initia=
l;"><br></div><div style=3D"color: rgb(34, 34, 34); font-family: Arial, Hel=
vetica, sans-serif; font-size: small; font-style: normal; font-variant-liga=
tures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing:=
 normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: n=
one; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-sp=
ace: normal; text-decoration-thickness: initial; text-decoration-style: ini=
tial; text-decoration-color: initial;">Please provide your suggestions.&nbs=
p;<br></div><div><br></div><div>Thanks,<br></div><div>Dhanasekar</div><div>=
<br></div><div id=3D"Zm-_Id_-Sgn" data-zbluepencil-ignore=3D"true" data-sig=
id=3D"818525000000014003"><div><br></div></div><div><br></div><div class=3D=
"zmail_extra_hr" style=3D"border-top: 1px solid rgb(204, 204, 204); height:=
 0px; margin-top: 10px; margin-bottom: 10px; line-height: 0px;"><br></div><=
div class=3D"zmail_extra" data-zbluepencil-ignore=3D"true"><div><br></div><=
div id=3D"Zm-_Id_-Sgn1">---- On Mon, 03 Apr 2023 22:06:24 +0530 <b>Supreeth=
 Venkatesh &lt;supreeth.venkatesh@amd.com&gt;</b> wrote ---<br></div><div><=
br></div><blockquote id=3D"blockquote_zmail" style=3D"margin: 0px;"><div><b=
r>On 3/23/23 13:57, Zane Shelley wrote: <br>&gt; Caution: This message orig=
inated from an External Source. Use proper <br>&gt; caution when opening at=
tachments, clicking links, or responding. <br>&gt; <br>&gt; <br>&gt; On 202=
3-03-22 19:07, Supreeth Venkatesh wrote: <br>&gt;&gt; On 3/22/23 02:10, Lei=
 Yu wrote: <br>&gt;&gt;&gt; Caution: This message originated from an Extern=
al Source. Use proper <br>&gt;&gt;&gt; caution when opening attachments, cl=
icking links, or responding. <br>&gt;&gt;&gt; <br>&gt;&gt;&gt; <br>&gt;&gt;=
&gt;&gt;&gt; On Tue, 21 Mar 2023 at 20:38, Supreeth Venkatesh <br>&gt;&gt;&=
gt;&gt;&gt; &lt;<a href=3D"mailto:supreeth.venkatesh@amd.com" target=3D"_bl=
ank">supreeth.venkatesh@amd.com</a>&gt; wrote: <br>&gt;&gt;&gt;&gt;&gt; <br=
>&gt;&gt;&gt;&gt;&gt; <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; On =
3/21/23 05:40, Patrick Williams wrote: <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp=
;&nbsp;&nbsp; &gt; On Tue, Mar 21, 2023 at 12:14:45AM -0500, Supreeth Venka=
tesh <br>&gt;&gt;&gt;&gt;&gt; wrote: <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&=
nbsp;&nbsp; &gt; <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;=
 #### Alternatives Considered <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&n=
bsp; &gt;&gt; <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; In=
-band mechanisms using System Management Mode (SMM) <br>&gt;&gt;&gt;&gt;&gt=
; exists. <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; <br>&g=
t;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; However, out of band m=
ethod to gather RAS data is processor <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;=
&nbsp;&nbsp; specific. <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &g=
t;&gt; <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &gt; How does this=
 compare with existing implementations in <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&n=
bsp;&nbsp;&nbsp; &gt; phosphor-debug-collector. <br>&gt;&gt;&gt;&gt;&gt; &n=
bsp;&nbsp;&nbsp;&nbsp; Thanks for your feedback. See below. <br>&gt;&gt;&gt=
;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &gt; I believe there was some attempt to=
 extend <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &gt; P-D-C previo=
usly to handle Intel's crashdump behavior. <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&=
nbsp;&nbsp;&nbsp; Intel's crashdump interface uses com.intel.crashdump. <br=
>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; We have implemented com.amd.=
crashdump based on that reference. <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nb=
sp;&nbsp; However, <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; can th=
is be made generic? <br>&gt;&gt;&gt;&gt;&gt; <br>&gt;&gt;&gt;&gt;&gt; &nbsp=
;&nbsp;&nbsp;&nbsp; PoC below: <br>&gt;&gt;&gt;&gt;&gt; <br>&gt;&gt;&gt;&gt=
;&gt; &nbsp;&nbsp;&nbsp;&nbsp; busctl tree com.amd.crashdump <br>&gt;&gt;&g=
t;&gt;&gt; <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; =E2=94=94=E2=
=94=80/com <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; =E2=94=94=E2=94=80/com/amd <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=94=94=E2=94=80/com/amd/crashdump <b=
r>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; =E2=94=9C=E2=94=80/com/amd/crashdump/0 <br>&gt;&gt;&gt;&gt;&=
gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=
=94=9C=E2=94=80/com/amd/crashdump/1 <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=94=9C=E2=94=80/com=
/amd/crashdump/2 <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=94=9C=E2=94=80/com/amd/crashdump/3 <b=
r>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; =E2=94=9C=E2=94=80/com/amd/crashdump/4 <br>&gt;&gt;&gt;&gt;&=
gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=
=94=9C=E2=94=80/com/amd/crashdump/5 <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=94=9C=E2=94=80/com=
/amd/crashdump/6 <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=94=9C=E2=94=80/com/amd/crashdump/7 <b=
r>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; =E2=94=9C=E2=94=80/com/amd/crashdump/8 <br>&gt;&gt;&gt;&gt;&=
gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=
=94=94=E2=94=80/com/amd/crashdump/9 <br>&gt;&gt;&gt;&gt;&gt; <br>&gt;&gt;&g=
t;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &gt; The repository <br>&gt;&gt;&gt;&gt=
;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &gt; currently handles IBM's processors, I t=
hink, or maybe that is <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; co=
vered by <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &gt; openpower-d=
ebug-collector. <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &gt; <br>=
&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &gt; In any case, I think you=
 should look at the existing D-Bus <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nb=
sp;&nbsp; interfaces <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &gt;=
 (and associated Redfish implementation) of these repositories <br>&gt;&gt;=
&gt;&gt;&gt; and <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; &gt; det=
ermine if you can use those approaches (or document why <br>&gt;&gt;&gt;&gt=
;&gt; now). <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; I could not f=
ind an existing D-Bus interface for RAS in <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&=
nbsp;&nbsp;&nbsp; xyz/openbmc_project/. <br>&gt;&gt;&gt;&gt;&gt; &nbsp;&nbs=
p;&nbsp;&nbsp; It would be helpful if you could point me to it. <br>&gt;&gt=
;&gt;&gt;&gt; <br>&gt;&gt;&gt;&gt;&gt; <br>&gt;&gt;&gt;&gt;&gt; There is an=
 interface for the dumps generated from the host, which <br>&gt;&gt;&gt;&gt=
;&gt; can <br>&gt;&gt;&gt;&gt;&gt; be used for these kinds of dumps <br>&gt=
;&gt;&gt;&gt;&gt; <a href=3D"https://github.com/openbmc/phosphor-dbus-inter=
faces/blob/master/yaml/xyz/openbmc_project/Dump/Entry/System.interface.yaml=
" target=3D"_blank">https://github.com/openbmc/phosphor-dbus-interfaces/blo=
b/master/yaml/xyz/openbmc_project/Dump/Entry/System.interface.yaml</a> <br>=
&gt;&gt;&gt;&gt;&gt; <br>&gt;&gt;&gt;&gt;&gt; <br>&gt;&gt;&gt;&gt;&gt; The =
fault log also provides similar dumps <br>&gt;&gt;&gt;&gt;&gt; <a href=3D"h=
ttps://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/ope=
nbmc_project/Dump/Entry/FaultLog.interface.yaml" target=3D"_blank">https://=
github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_pr=
oject/Dump/Entry/FaultLog.interface.yaml</a> <br>&gt;&gt;&gt;&gt;&gt; <br>&=
gt;&gt;&gt;&gt;&gt; <br>&gt;&gt;&gt;&gt; ThanksDdhruvraj. The interface loo=
ks useful for the purpose. However, <br>&gt;&gt;&gt;&gt; the current BMCWEB=
 implementation references <br>&gt;&gt;&gt;&gt; <a href=3D"https://github.c=
om/openbmc/bmcweb/blob/master/redfish-core/lib/log_services.hpp" target=3D"=
_blank">https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/log_=
services.hpp</a> <br>&gt;&gt;&gt;&gt; <br>&gt;&gt;&gt;&gt; [com.intel.crash=
dump] <br>&gt;&gt;&gt;&gt; constexpr char const* crashdumpPath =3D "/com/in=
tel/crashdump"; <br>&gt;&gt;&gt;&gt; <br>&gt;&gt;&gt;&gt; constexpr char co=
nst* crashdumpInterface =3D "com.intel.crashdump"; <br>&gt;&gt;&gt;&gt; con=
stexpr char const* crashdumpObject =3D "com.intel.crashdump"; <br>&gt;&gt;&=
gt;&gt; <br>&gt;&gt;&gt;&gt; <a href=3D"https://github.com/openbmc/phosphor=
-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Dump/Entry/System.int=
erface.yaml" target=3D"_blank">https://github.com/openbmc/phosphor-dbus-int=
erfaces/blob/master/yaml/xyz/openbmc_project/Dump/Entry/System.interface.ya=
ml</a> <br>&gt;&gt;&gt;&gt; <br>&gt;&gt;&gt;&gt; or <br>&gt;&gt;&gt;&gt; <a=
 href=3D"https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/ya=
ml/xyz/openbmc_project/Dump/Entry/FaultLog.interface.yaml" target=3D"_blank=
">https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/=
openbmc_project/Dump/Entry/FaultLog.interface.yaml</a> <br>&gt;&gt;&gt;&gt;=
 <br>&gt;&gt;&gt;&gt; is it exercised in Redfish logservices? <br>&gt;&gt;&=
gt; In our practice, a plugin `tools/dreport.d/plugins.d/acddump` is added =
<br>&gt;&gt;&gt; to copy the crashdump json file to the dump tarball. <br>&=
gt;&gt;&gt; The crashdump tool (Intel or AMD) could trigger a dump after th=
e <br>&gt;&gt;&gt; crashdump is completed, and then we could get a dump ent=
ry containing <br>&gt;&gt;&gt; the crashdump. <br>&gt;&gt; Thanks Lei Yu fo=
r your input. We are using Redfish to retrieve the <br>&gt;&gt; CPER binary=
 file which can then be passed through a plugin/script for <br>&gt;&gt; det=
ailed analysis. <br>&gt;&gt; In any case irrespective of whichever Dbus int=
erface we use, we need a <br>&gt;&gt; repository which will gather data fro=
m AMD processor via APML as per <br>&gt;&gt; AMD design. <br>&gt;&gt; APML =
<br>&gt;&gt; Spec: <a href=3D"https://www.amd.com/system/files/TechDocs/570=
19-A0-PUB_3.00.zip" target=3D"_blank">https://www.amd.com/system/files/Tech=
Docs/57019-A0-PUB_3.00.zip</a> <br>&gt;&gt; Can someone please help create =
bmc-ras or amd-debug-collector <br>&gt;&gt; repository as there are instanc=
es of openpower-debug-collector <br>&gt;&gt; repository used for Open Power=
 systems? <br>&gt;&gt;&gt; <br>&gt;&gt;&gt; <br>&gt;&gt;&gt; -- <br>&gt;&gt=
;&gt; BRs, <br>&gt;&gt;&gt; Lei YU <br>&gt; I am interested in possibly sta=
ndardizing some of this. IBM POWER has <br>&gt; several related components.=
 openpower-hw-diags is a service that will <br>&gt; listen for the hardware=
 interrupts via a GPIO pin. When an error is <br>&gt; detected, it will use=
 openpower-libhei to query hardware registers to <br>&gt; determine what ha=
ppened. Based on that information openpower-hw-diags <br>&gt; will generate=
 a PEL, which is an extended log in phosphor-logging, that <br>&gt; is used=
 to tell service what to replace if necessary. Afterward, <br>&gt; openpowe=
r-hw-diags will initiate openpower-debug-collector, which <br>&gt; gathers =
a significant amount of data from the hardware for additional <br>&gt; debu=
g when necessary. I wrote openpower-libhei to be fairly agnostic. It <br>&g=
t; uses data files (currently XML, but moving to JSON) to define register <=
br>&gt; addresses and rules for isolation. openpower-hw-diags is fairly POW=
ER <br>&gt; specific, but I can see some parts can be made generic. Dhruv w=
ould have <br>&gt; to help with openpower-debug-collector. <br>Thank you. L=
ets collaborate in standardizing some aspects of it. <br>&gt; <br>&gt; Rega=
rding creation of a new repository, I think we'll need to have some <br>&gt=
; more collaboration to determine the scope before creating it. It <br>&gt;=
 certainly sounds like we are doing similar things, but we need to <br>&gt;=
 determine if enough can be abstracted to make it worth our time. <br>I hav=
e put in a request here: <br><a href=3D"https://github.com/openbmc/technica=
l-oversight-forum/issues/24" target=3D"_blank">https://github.com/openbmc/t=
echnical-oversight-forum/issues/24</a> <br>Please chime in. <br></div></blo=
ckquote></div><div><br></div></div><br></body></html>
------=_Part_1762041_818402065.1689935379671--

