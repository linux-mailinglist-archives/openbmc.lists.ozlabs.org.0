Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC936F6D66
	for <lists+openbmc@lfdr.de>; Thu,  4 May 2023 16:00:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QBwSd2wBFz3cM3
	for <lists+openbmc@lfdr.de>; Fri,  5 May 2023 00:00:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nCMHtTbd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nCMHtTbd;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QBwRx3Jqjz306Y
	for <openbmc@lists.ozlabs.org>; Thu,  4 May 2023 23:59:56 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 344DviEF016339;
	Thu, 4 May 2023 13:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=u8hosVUfGN8a84e232WREDKpkAnAzW0dfESHoX2iOLc=;
 b=nCMHtTbd9tSDu1+gsxUviUM6xKDMv+HhfcBdhs8R4zDtoaGMBghUDLG645XkNW4FN7/G
 X2szJDzCPjioakDnTp0IUViIrnJwgsLu3vXfx50fB7fpQQhkrdUBJHc31jygwFsC+YS7
 XrnIz3rv+vXcFaClaMqKtDNnRVLDfdH3WkE9qdu2/g4HpZX5N42Q3u/IoHpcXpFsHkfz
 UyHoVd6tTPjnxFVIYVpyJ63xdUw5MlAQ1a1UEhzcpFv+gC0DsGTtlEpZzVSM1c8RzZ15
 Eo9xjRzSktxJvEfhyaTVaKgQY5s/AwLeC4wSFi0DIfWa5BPc0VrgpNj/+Se1NT7v+y0j +w== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qccgb3b05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 May 2023 13:59:40 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 344CNJPQ027155;
	Thu, 4 May 2023 13:59:37 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
	by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3q8tv81vf9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 May 2023 13:59:37 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 344Dxapu35258978
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 May 2023 13:59:36 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F00FC58056;
	Thu,  4 May 2023 13:59:35 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8562058060;
	Thu,  4 May 2023 13:59:35 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 May 2023 13:59:35 +0000 (GMT)
Message-ID: <8abb1400-f7c4-f04a-8352-6c2583e23f0b@linux.ibm.com>
Date: Thu, 4 May 2023 09:59:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Integrating swtpm(as a software TPM) with OpenBMC on Qemu
Content-Language: en-US
To: Sandeep Kumar <sandeep.pkumar@tcs.com>,
        =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        Ninad Palsule <ninad@linux.ibm.com>, Joel Stanley <jms@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>
References: <MA1PR01MB412922EF629403C84674A6AD87909@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <8e23c99e-0e62-3866-ce61-c75a14453a37@kaod.org>
 <MA1PR01MB4129EB6FA57EA28AA9002E9C879B9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <2231ac88-3005-0fb4-6aad-e7652ffd3467@kaod.org>
 <MA1PR01MB41297891E40E6E5652661662879D9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <9c136acf-ea18-130b-41bb-5001b01ee8cf@kaod.org>
 <MA1PR01MB4129E3F1719B297B56DC148A87629@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <MA1PR01MB41294AC02644C3CB98E6F84187639@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <MA1PR01MB4129B241046BEB173A6CFA66876D9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <MA1PR01MB4129B241046BEB173A6CFA66876D9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lGs25uJI0xyR9KBayeWNu5vNYCkMpKQM
X-Proofpoint-GUID: lGs25uJI0xyR9KBayeWNu5vNYCkMpKQM
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_09,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 clxscore=1011 suspectscore=0 bulkscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305040111
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



On 5/4/23 05:12, Sandeep Kumar wrote:
> TCS Confidential Hi C, I was able to build and run the image(for evb-ast2600) with swtpm. Few issues observed, If I run with the flash. img provided in your github link(https: //github. com/legoater/qemu-aspeed-boot/tree/master/images) everything
> ZjQcmQRYFpfptBannerStart
> This Message Is From an External Sender
> This message came from outside your organization.
> ZjQcmQRYFpfptBannerEnd
> TCS Confidential
> 
> Hi C,
> I was able to build and run the image(for evb-ast2600) with swtpm. Few issues observed,
> 
>  1. If I run with the flash.img provided in your github link(_https://github.com/legoater/qemu-aspeed-boot/tree/master/images_ <https://github.com/legoater/qemu-aspeed-boot/tree/master/images>) everything works as expected, i.e I get the below output.
> 
> *# echo tpm_tis_i2c 0x2e > /sys/bus/i2c/devices/i2c-12/new_device*
> *[  182.735902] tpm_tis_i2c 12-002e: 2.0 TPM (device-id 0x1, rev-id 1)*
> *[  182.773885] i2c i2c-12: new_device: Instantiated device tpm_tis_i2c at 0x2e*
> *#*
> *#*
> *# cat /sys/class/tpm/tpm0/pcr-sha256/0*
> *B804724EA13F52A9072BA87FE8FDCC497DFC9DF9AA15B9088694639C431688E0*
> *#*
> *#*
> 
>  2. If I run it with the locally built image, I get this error,

Is the kernel configured in the same way? Are you using the same kernel version?
> 
> *root@evb-ast2600:~# echo tpm_tis_i2c 0x2e > /sys/bus/i2c/devices/i2c-12/new_device*
> *[  174.063597] i2c i2c-12: new_device: Instantiated device tpm_tis_i2c at 0x2e*

What is the output of this?

find /sys/class/tpm | grep pcr

   Stefan

> *root@evb-ast2600:~# cat /sys/class/tpm/tpm0/pcr-sha256/0*
> *cat: can't open '/sys/class/tpm/tpm0/pcr-sha256/0': No such file or directory*
> *root@evb-ast2600:~#*
> *root@evb-ast2600:~#*
> Please do let me know about what has been done to write the values into “*/sys/class/tpm/tpm0/pcr-sha256/0**” . *
> Thanks,
> Sandeep.
> _____________________________________________
> *From:* Sandeep Kumar
> *Sent:* Thursday, April 20, 2023 5:45 PM
> *To:* Cédric Le Goater <clg@kaod.org>; openbmc@lists.ozlabs.org; Ninad Palsule <ninad@linux.ibm.com>; Joel Stanley <jms@jms.id.au>; Andrew Jeffery <andrew@aj.id.au>
> *Subject:* RE: Integrating swtpm(as a software TPM) with OpenBMC on Qemu
> Hi C,
> How to build this image => *obmc-phosphor-image.rootfs.wic.qcow2* ? In openBmc build directory we don’t get this image built.
> Also, remaining image formats used while running on qemu are available in the build directory. i.e fitImage-linux.bin, aspeed-bmc-ibm-rainier.dtb and obmc-phosphor-initramfs.rootfs.cpio.xz .
> Please advise if we have to build openbmc stack in a different way than the standard procedure. We follow the below steps for build,
> 1. . setup Romulus
> 2. bitbake obmc-phosphor-image
> Thanks,
> Sandeep.
> -----Original Message-----
> From: Sandeep Kumar
> Sent: Wednesday, April 19, 2023 3:00 PM
> To: Cédric Le Goater <_clg@kaod.org_ <mailto:clg@kaod.org>>; _openbmc@lists.ozlabs.org_ <mailto:openbmc@lists.ozlabs.org>; Ninad Palsule <_ninad@linux.ibm.com_ <mailto:ninad@linux.ibm.com>>; Joel Stanley <_jms@jms.id.au_ <mailto:jms@jms.id.au>>; Andrew Jeffery <_andrew@aj.id.au_ <mailto:andrew@aj.id.au>>
> Subject: RE: Integrating swtpm(as a software TPM) with OpenBMC on Qemu
> Hi C,
> Got it working. Looks like slirp is no longer supported on ubnutu 18.04. have upgraded to a newer version  and is working now.
> Thanks,
> Sandeep.
> -----Original Message-----
> From: Cédric Le Goater <clg@kaod.org <mailto:clg@kaod.org>>
> Sent: Wednesday, April 19, 2023 2:26 PM
> To: Sandeep Kumar <sandeep.pkumar@tcs.com <mailto:sandeep.pkumar@tcs.com>>; openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>; Ninad Palsule <ninad@linux.ibm.com <mailto:ninad@linux.ibm.com>>; Joel Stanley <jms@jms.id.au <mailto:jms@jms.id.au>>; Andrew Jeffery <andrew@aj.id.au <mailto:andrew@aj.id.au>>
> Subject: Re: Integrating swtpm(as a software TPM) with OpenBMC on Qemu
> "External email. Open with Caution"
> Hello Sandeep
> On 4/18/23 09:45, Sandeep Kumar wrote:
>> TCS Confidential
>> 
>> Hi C,
>> Built the qemu from your branch. Few issues, *$ ./qemu-system-arm -m
>> 256 -M romulus-bmc -nographic -drive
>> file=./obmc-phosphor-image-romulus.static.mtd,format=raw,if=mtd -net 
>> nic -net 
>> user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:4443-:443,hostfwd=
>> tcp:127.0.0.1:8880-:80,hostfwd=tcp:127.0.0.1:2200-:2200,hostfwd=udp:12
>> 7.0.0.1:6623-:623,hostfwd=udp:127.0.0.1:6664-:664,hostname=qemu*
>> *qemu-system-arm: -net
>> user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:4443-:443,hostfwd=
>> tcp:127.0.0.1:8880-:80,hostfwd=tcp:127.0.0.1:2200-:2200,hostfwd=udp:12
>> 7.0.0.1:6623-:623,hostfwd=udp:127.0.0.1:6664-:664,hostname=qemu: 
>> network backend 'user' is not compiled into this binary* I didn’t 
>> enable the slirp package I guess. So enabled it while running 
>> configure, *$ ../configure --enable-slirp*
>> *........*
>> *Run-time dependency slirp found: NO (tried pkgconfig)*
>> *../meson.build:681:2: ERROR: Dependency "slirp" not found, tried
>> pkgconfig* *A full log can be found at 
>> /home/tcs/work/sandeep/measured_boot/ibm_qemu/qemu/build/meson-logs/me
>> son-log.txt*
>> *NOTICE: You are using Python 3.6 which is EOL. Starting with v0.62.0, 
>> Meson will require Python 3.7 or newer*
>> *ERROR: meson setup failed*
>> I have already installed slirp locally, but still getting the above error.
> Did you install the libslirp-dev or libslirp-devel package ?
> C.
> 
> TCS Confidential
> 
> =====-----=====-----=====
> Notice: The information contained in this e-mail
> message and/or attachments to it may contain
> confidential or privileged information. If you are
> not the intended recipient, any dissemination, use,
> review, distribution, printing or copying of the
> information contained in this e-mail message
> and/or attachments to it are strictly prohibited. If
> you have received this communication in error,
> please notify us by reply e-mail or telephone and
> immediately and permanently delete the message
> and any attachments. Thank you
> 
