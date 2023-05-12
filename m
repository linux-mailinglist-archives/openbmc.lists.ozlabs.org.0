Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2623D700D08
	for <lists+openbmc@lfdr.de>; Fri, 12 May 2023 18:28:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHvN30bHwz3fWn
	for <lists+openbmc@lfdr.de>; Sat, 13 May 2023 02:28:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G2FdON0Y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G2FdON0Y;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHvMT5HJSz3fN2
	for <openbmc@lists.ozlabs.org>; Sat, 13 May 2023 02:28:21 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34CG9YZV021075;
	Fri, 12 May 2023 16:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=d01chGVu/W2MAewtsag4rnebtlvHC9jIJ78AbJ3f8lU=;
 b=G2FdON0YFz8hP+KwcaPQxGhYvAi0jGoKjbzeTLGLKIE8zrc5CBJLe2keytzKfZSZF73+
 TilFQerVohQrpLCaaK/qPZO/7piLmp/rYqeys3sDsptB6fJNYM7xFSWD23DxBgNIfK1M
 2Vr/v8RNPCMCaGk8k//Rv9575b40SfPd7YH7RH+NW8RxSXrjiVJwmRw14Dja1LJtSqCx
 Fcyk2aQdEI4AISn/ENZnTl5Cn2Ywx23VNzOZewH1ILTpHNbzAWWx8FFpiCXFBh4Iz0Ol
 TiMu2Z37ByjDauX4+F6ZIWb2elacPfRpZxzbDFBGcMH3Izt8nvU0wTTH1LlkkIrykAHG OQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qhr2vsfrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 May 2023 16:28:11 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34CDeKd1026709;
	Fri, 12 May 2023 16:28:09 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
	by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3qf7xdnv2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 May 2023 16:28:09 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34CGS9nE38470120
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 May 2023 16:28:09 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 12ADF58064;
	Fri, 12 May 2023 16:28:09 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 898FB5805A;
	Fri, 12 May 2023 16:28:08 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 12 May 2023 16:28:08 +0000 (GMT)
Message-ID: <ab2fa14b-e749-6e57-ac8f-285da3b13ed1@linux.ibm.com>
Date: Fri, 12 May 2023 12:28:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: OpenBMC porting to portwell pcomc660-ast2600 device.
Content-Language: en-US
To: Lior Weintraub <liorw@pliops.com>, Andrew Jeffery <andrew@aj.id.au>,
        Patrick Williams <patrick@stwcx.xyz>,
        Ryan Chen <ryan_chen@aspeedtech.com>
References: <PR3P195MB055571D5873D3A5F1425213BC39E9@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <be8000ad-722b-418a-8629-ea7c90805782@app.fastmail.com>
 <PR3P195MB055565CDA894F11E456057E7C39C9@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <PR3P195MB055586BFBA25640B58330262C3749@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <PR3P195MB05558407A1DA15EFD31970E0C3749@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <PR3P195MB05556A7B4E0C14103E442714C3749@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <PR3P195MB0555FBD69A0A93D2270BA6EEC3749@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <PR3P195MB0555FBD69A0A93D2270BA6EEC3749@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yHS4na9xu-Fqgt38Sz178_I1_Omm_szI
X-Proofpoint-GUID: yHS4na9xu-Fqgt38Sz178_I1_Omm_szI
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_10,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 clxscore=1011 mlxlogscore=999 impostorscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305120133
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 5/11/23 16:48, Lior Weintraub wrote:
> Well, Yocto is a tricky build system for newbies ☹
> I thought I found something but then saw something else that I cannot explain...
> 
> 1.
> I managed to build it successfully after cd into tmp/work-shared/pcomc660-ast2600/kernel-source, git pull and git apply patch 0001-pcomc660-ast2600.patch.
> Then go back to execute bitbake obmc-phosphor-image.
> Further investigation suggested that the meta-portwell layer was using the Yocto incorrectly (or it might be how Yocto used to work 18 months ago?).
> The issue was that their linux-aspeed_git.bb was probably ignored and that explains why the patch was never applied.
> 2.
> Copied the syntax of linux-aspeed_%.bbapend from meta-ibm and after applying it to the portwell layer things started to happen.
> I got compilation errors on aspeed-g6-pwm-tacho.c and after some digging I found that 12 months ago the API of PWM was changed and this caused the errors.
> (linux commit 0829c35dc5346e90f428de61896362b51ab58296: pwm: Drop support for legacy drivers)
> After fixing the compilation errors I could build again.
> 
> Still I have no clue why after manually applying the patch (#1) I didn't get the compilation errors.

Is the file you are patching actually being compiled? Are the config options that need to be set in .config to have
the file compiled? I find my .config file here:

build/evb-ast2600/tmp/work/evb_ast2600-openbmc-linux-gnueabi/linux-aspeed/6.1.15+gitAUTOINC+580639a973-r0/linux-evb_ast2600-standard-build/.config

All the object files from compiling the kernel are located here on my machine and I sometimes check whether they were compiled using 'find <path> | grep <module name>'.

build/evb-ast2600/tmp/work/evb_ast2600-openbmc-linux-gnueabi/linux-aspeed/6.1.15+gitAUTOINC+580639a973-r0/linux-evb_ast2600-standard-build/

   Cheers,
     Stefan

> Thanks for listening 😊
> Cheers,
> Lior.
>   
> 
> -----Original Message-----
> From: Lior Weintraub
> Sent: Thursday, May 11, 2023 6:06 PM
> To: Andrew Jeffery <andrew@aj.id.au>; Patrick Williams <patrick@stwcx.xyz>; Ryan Chen <ryan_chen@aspeedtech.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: RE: OpenBMC porting to portwell pcomc660-ast2600 device.
> 
> After fixing the patch (verified it can be applied without errors onto linux branch 6.1) I was still getting the error.
> I found that the patch was never actually applied (could explain why bitbake didn't complain about the errors).
> Part of the patch was adding a new file pcomc660-ast2600.dts but it wasn't found on tmp/work-shared/pcomc660-ast2600/kernel-source/arch/arm/boot/dts.
> So I suspect something is wrong with this SRC_URI line:
> 
> KBRANCH ?= "dev-6.1"
> LINUX_VERSION ?= "6.1.15"
> SRCREV="580639a973406691fa93b8fa377c4c5a43f66094"
> SRC_URI:append = " file://0001-pcomc660-ast2600.patch"
> require linux-aspeed.inc
> 
> I also tried using
> SRC_URI += "file://0001-pcomc660-ast2600.patch" or
> SRC_URI:append:pcomc660-ast2600 = " file://0001-pcomc660-ast2600.patch"
> 
> but still it seems that the patch wasn't applied.
> Any thoughts?
> 
> -----Original Message-----
> From: Lior Weintraub
> Sent: Thursday, May 11, 2023 1:27 PM
> To: Andrew Jeffery <andrew@aj.id.au>; Patrick Williams <patrick@stwcx.xyz>; Ryan Chen <ryan_chen@aspeedtech.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: RE: OpenBMC porting to portwell pcomc660-ast2600 device.
> 
> I think I have a clue what the issue is (still no solution).
> I took the Linux kernel dev-6.1 from https://github.com/openbmc/linux into a separate folder and just tried to apply the Portwell patch manually:
> error: patch failed: arch/arm/boot/dts/aspeed-g6.dtsi:304
> error: arch/arm/boot/dts/aspeed-g6.dtsi: patch does not apply
> error: patch failed: drivers/usb/host/ehci-hcd.c:634
> error: drivers/usb/host/ehci-hcd.c: patch does not apply
> error: patch failed: drivers/usb/host/ehci.h:218
> error: drivers/usb/host/ehci.h: patch does not apply
> 
> 1. I will try to find what causes these errors 2. I wonder why (maybe it is a Yocto question) there is no indication to this fail during the bitbake phase.
> 
> Cheers,
> Lior.
> 
> -----Original Message-----
> From: Lior Weintraub
> Sent: Thursday, May 11, 2023 12:46 PM
> To: Andrew Jeffery <andrew@aj.id.au>; Patrick Williams <patrick@stwcx.xyz>; Ryan Chen <ryan_chen@aspeedtech.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: RE: OpenBMC porting to portwell pcomc660-ast2600 device.
> 
> Hi,
> 
> Portwell support helped resolving the u-boot compilation error with this modification on “meta-portwell/meta-pcomc660-ast2600/recipes-bsp/u-boot/u-boot-aspeed-sdk_2019.04.bbappend”
> 
> FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> SRCREV = "44a8c618c1215e0faac0f335f0afd56ed4240e76"
> SRC_URI += "file://0001-2021-11-18-Add-PCOM-C660-AST2600-u-boot-support.patch"
> SOCSEC_SIGN_ENABLE = "0"
> 
> Now there is another error:
> make[1]: *** No rule to make target 'arch/arm/boot/dts/pcomc660-ast2600.dtb'.  Stop.
> 
> Portwell have a patch with pcomc660-ast2600.dts so I am not sure why it was working on kernel version 5.18 and not on 6.1.
> The patch is located on: https://github.com/wlbe4/openbmc/blob/portwell/meta-portwell/meta-pcomc660-ast2600/recipes-kernel/linux/linux-aspeed/0001-2021-11-18-Add-Pcom-C660-AST2600-support.patch
> The linux-aspeed_git.bb file that adds this patch is located on: https://github.com/wlbe4/openbmc/blob/portwell/meta-portwell/meta-pcomc660-ast2600/recipes-kernel/linux/linux-aspeed_git.bb
> 
> I'm waiting for Portwell support but if you have an idea what can be the reason 😊
> 
> Cheers,
> Lior.
> 
> -----Original Message-----
> From: Lior Weintraub
> Sent: Monday, April 17, 2023 9:55 AM
> To: 'Andrew Jeffery' <andrew@aj.id.au>; Patrick Williams <patrick@stwcx.xyz>; Ryan Chen <ryan_chen@aspeedtech.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: RE: OpenBMC porting to portwell pcomc660-ast2600 device.
> 
> Hi Andrew,
> 
> The AST2600 Development kit from Portwell comes with a slightly old version of OpenBMC.
> The sources came as a tar.xz file and could be downloaded from: https://www.dropbox.com/s/t2nb11mkuoisj0s/PCOM-C660-AST2600_BSP_20211210.tar.xz?dl=0
> 
> What I try to do is to get the latest OpenBMC codebase and integrate meta-portwell layer from the old sources (dated from Dec. 2021).
> If you take a look on the 3 last commits from https://github.com/wlbe4/openbmc/tree/portwell, you can see my migration attempt.
> 
> I have upgraded the linux-aspeed version they used (5.10.67) to 6.1.15 but left their patch as it includes the device tree for their platform.
> I have removed the patch they had for u-boot-aspeed-sdk as an attempt to solve the errors I got even though I think this patch might be needed.
> 
> The current build error with u-boot-aspeed-sdk is:
> build/pcomc660-ast2600/tmp/work/pcomc660_ast2600-openbmc-linux-gnueabi/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+fd915728e1-r0/git/lib/smbios.c:84:58: error: 'U_BOOT_DMI_DATE' undeclared (first use in this function)
>     84 |         t->bios_release_date = smbios_add_string(t->eos, U_BOOT_DMI_DATE);
> 
> Regarding the errors I had with obmc-console:
> ERROR: /media/data/workspace/openbmc/openbmc-fork/meta-phosphor/recipes-phosphor/console/obmc-console_git.bb: Unable to get checksum for obmc-console SRC_URI entry obmc-console.conffile: file could not be found
> 
> Their original code included a bbappend file for the obmc-console:
> FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/:"
> OBMC_CONSOLE_HOST_TTY = "ttyS0"
> 
> SRC_URI:remove = "file://${BPN}.conf"
> SRC_URI:append = "file://server.ttyS0.conf"
> 
> do_install:append() {
>          # Remove upstream-provided configuration
>          rm -rf ${D}${sysconfdir}/${BPN}
> 
>          # Install the server configuration
>          install -m 0755 -d ${D}${sysconfdir}/${BPN}
>          install -m 0644 ${WORKDIR}/*.conf ${D}${sysconfdir}/${BPN}/
>          # Remove upstream-provided server configuration
>          rm -f ${D}${sysconfdir}/${BPN}/server.ttyVUART0.conf
> }
> 
> I suspected that their removal of "file://${BPN}.conf" wasn't welcomed by the obmc-console_git.bb recipe So I just commented it all out (except for the first line), copied the obmc-console.conf and the error was gone.
> 
> Their server.ttyS0.conf file included:
> local-tty = ttyS0
> baud = 115200
> So I have and added the local-tty line to my obmc-console.conf copy.
> 
> I am not sure that the console will work after my changes as I currently don't have the board for testing (will arrive in 2 weeks time).
> So I am currently focusing my efforts on migration and fixing the compilation errors.
> 
> Thanks for your help,
> Lior.
>   
> -----Original Message-----
> From: Andrew Jeffery <andrew@aj.id.au>
> Sent: Monday, April 17, 2023 5:58 AM
> To: Lior Weintraub <liorw@pliops.com>; Patrick Williams <patrick@stwcx.xyz>; Ryan Chen <ryan_chen@aspeedtech.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: OpenBMC porting to portwell pcomc660-ast2600 device.
> 
> CAUTION: External Sender
> 
> Hi Lior,
> 
> On Sat, 15 Apr 2023, at 20:08, Lior Weintraub wrote:
>> Hi Guys,
>>
>> I have forked the openbmc project and opened a "portwell" branch from
>> it's "master".
>> The repo is under: https://github.com/wlbe4/openbmc I am trying to
>> port OpenBMC into this board:
>> https://portwell.com/solutions/openBMC.php
>>
>> My first commit to this branch was the original code of meta-portwell
>> layer given to me by Portwell support (PCOM-C660-AST2600_BSP_20211210).
>> The second commit tries to migrate meta-portwell layer to the latest
>> Yocto syntax.
>>
>> Changes include (among others):
>> 1. replace _append with :append
>> 2. replace _prepend with :prepend
>> 3. move bblayers.conf.sample, conf-notes.txt and local.conf.sample
>> into templates/default folder.
>> 4. Try to fix build errors on u-boot and aspeed-linux - Still there
>> are errors
> 
> This doesn't give us any insight as to what the errors were. Can you provide more detail?
> 
>> 5. Try to fix obmc-console - The build errors are gone but not sure it
>> will work (no platform for testing yet)
> 
> What build errors did you see?
> 
>>
>> Some of the changes were just a syntax change but some requires deeper
>> understanding.
>> Few examples are the changes in obmc-concole, u-boot and aspeed-linux.
>> Since the original version is based on older u-boot and linux kernel,
>> the patches might not be relevant anymore.
>>
>> Can you please review the following changes on my repo:
>> meta-portwell/meta-pcomc660-ast2600/recipes-phosphor/console/obmc-cons
>> ole_%.bbappend
> 
> It's hard to say whether that's correct for your platform, but I don't think there's anything obviously wrong there.
> 
>> meta-portwell/meta-pcomc660-ast2600/classes/socsec-sign.bbclass
> 
> Can you unpack what were you trying to achieve by copying socsec-sign.bbclass?
> 
>> meta-portwell/meta-pcomc660-ast2600/conf/machine/pcomc660-ast2600.conf
>> meta-portwell/meta-pcomc660-ast2600/recipes-bsp/u-boot/u-boot-aspeed-s
>> dk_2019.04.bbappend
>> meta-portwell/meta-pcomc660-ast2600/recipes-kernel/linux/linux-aspeed_
>> git.bb
> 
> Have you tried building without applying patches to u-boot and linux-aspeed? It's not clear whether its your own patches that are breaking the build or if something else is afoot.
> 
> Andrew
