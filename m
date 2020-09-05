Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A2525E797
	for <lists+openbmc@lfdr.de>; Sat,  5 Sep 2020 14:50:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BkDt22wDHzDql2
	for <lists+openbmc@lfdr.de>; Sat,  5 Sep 2020 22:50:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qMRSmWUj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BkDry24xfzDql0
 for <openbmc@lists.ozlabs.org>; Sat,  5 Sep 2020 22:49:36 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 085CWsHO124917
 for <openbmc@lists.ozlabs.org>; Sat, 5 Sep 2020 08:49:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=qWM2Stk3yoG34sJbnQ9FyzVm7YxaIbl00UUEhTxS8Ug=;
 b=qMRSmWUjJReKyF6/ipEu3pX+tbCt4mejPhSdTpCm650FaGQR0N4DIPYbR8ZABSsM+d8I
 CkpUev+fmRVctHTBeOkWRaarbiKeQAUion7hEA/lt3UJ43d9nPhg11Qd8mHcv2gxnZND
 sLQWHr7yrjG64gFXcpTBEhfFF8jNk0rraczFMAv7O7o6NVYyc0o9lzec+KBviNF0q1MA
 5oPTXnPv73OJ/PO0wwXben1c0wrFNB2zNn7n0xbi6UTbkRPqtox23ghD+dRdHRufvHMm
 FtGMddtwN8O7gXNpkrgLxcIE514FNuPzbbs3RZ083w/bCEtN/psqv6cJ3PEBTH9AK3qt SA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33c95yhtrk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 05 Sep 2020 08:49:33 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 085CjrRK002015
 for <openbmc@lists.ozlabs.org>; Sat, 5 Sep 2020 08:49:33 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33c95yhtr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Sep 2020 08:49:33 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 085CinlO015881;
 Sat, 5 Sep 2020 12:49:30 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 33c2a88b8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Sep 2020 12:49:30 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 085CnSe725035108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 5 Sep 2020 12:49:28 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9128DAE055;
 Sat,  5 Sep 2020 12:49:28 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D074CAE051;
 Sat,  5 Sep 2020 12:49:27 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.231.112])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat,  5 Sep 2020 12:49:27 +0000 (GMT)
Subject: Re: Enable UBI support for a platform
To: Kun Zhao <zkxz@hotmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <BYAPR14MB23426A9032F9FDAF87F1BC19CF2D0@BYAPR14MB2342.namprd14.prod.outlook.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <242dee50-7e1b-3fc3-5105-ca33f288d959@linux.vnet.ibm.com>
Date: Sat, 5 Sep 2020 18:19:26 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <BYAPR14MB23426A9032F9FDAF87F1BC19CF2D0@BYAPR14MB2342.namprd14.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-05_04:2020-09-04,
 2020-09-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 mlxscore=0 impostorscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009050121
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

Hi Kun,

On 05/09/20 5:32 am, Kun Zhao wrote:
> Hi Team,
> 
> My platform is based on ast2500, and I’ve already been able to built out 
> the ubi image. But when I tried to test it with qemu, it just stopped at 
> u-boot because ‘can’t get kernel image,
> 
> qemu-system-arm: Aspeed iBT has no chardev backend
> 
> U-Boot 2016.07 (Sep 04 2020 - 19:47:48 +0000)
> 
>         Watchdog enabled
> 
> DRAM:  496 MiB
> 
> Flash: 32 MiB
> 
> *** Warning - bad CRC, using default environment
> 
> In:    serial
> 
> Out:   serial
> 
> Err:   serial
> 
> Net:   MAC0 : RGMII
> 
> MAC1 : RGMII
> 
> FTGMAC100#0
> 
> Error: FTGMAC100#0 address not set.
> 
> , FTGMAC100#1
> 
> Error: FTGMAC100#1 address not set.
> 
> Hit any key to stop autoboot:  0
> 
> Wrong Image Format for bootm command
> 
> ERROR: can't get kernel image!
> 
> ast#
> 
> And I found the bootargs is not right,
> 
> ast# print
> 
> baudrate=115200
> 
> bootargs=console=ttyS4,115200n8 root=/dev/ram rw
> 
> bootcmd=bootm 20080000
> 
> bootdelay=2
> 
> Checked in the build folder for 
> tmp/work/myplatform-openbmc-linux-gnueabi/u-boot-aspeed/1_v2016.07+gitAUTOINC+1ded9fa3a2-r0/ 
> and found the none of the following patches are there,
> 
> 0002-config-ast-common-hack-bootopts.patch
> 
> 0003-config-ast-common-Add-bootopts-to-support-ubi-and-mt.patch
> 
> 0004-config-ast-common-Add-conditional-factory-reset-comm.patch
> 
> 0005-config-ast-common-Fall-back-to-secondary-flash-on-fa.patch
> 
> I think that’s why the bootargs is not correct.
> 
> This is the details of how I enabled the ubi support in my platform recipes,
> 
> 1. In meta-myplatform/conf/distro/openbmc-myplatform.conf, I added,
> 
> require conf/distro/include/phosphor-base.inc
> 
> require conf/distro/include/phosphor-ubi.inc

You should just need the one line above, plus a device tree change for 
your system. The default openbmc-flash-layout.dtsi doesn't make a ubifs 
partition. You can for eg look at witherspoon's dts, which uses ubifs.

Does anyone know why the default is static partitions, and not ubifs?

Regards,
Deepak

> 2. In meta-myplatform/conf/machine/myplatform.conf, I added,
> 
> IMAGE_FSTYPES += " mtd-ubi mtd-ubi-tar"
> 
> OBMC_MACHINE_FEATURES += " obmc-ubi-fs"
> 
> Do I miss anything?
> 
> Thanks.
> 
> Best regards,
> 
> Kun Zhao
> 
> /*
> 
> zkxz@hotmail.com <mailto:zkxz@hotmail.com>
> 
> */
> 

