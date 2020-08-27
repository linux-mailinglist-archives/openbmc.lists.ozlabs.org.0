Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DFB253D4D
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 07:44:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcWrg3g50zDqXS
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 15:44:35 +1000 (AEST)
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
 header.s=pp1 header.b=XBEatZUG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcWqx5KRKzDqXM
 for <openbmc@lists.ozlabs.org>; Thu, 27 Aug 2020 15:43:57 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07R5XJ2o100724; Thu, 27 Aug 2020 01:43:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=FPS0FLc81ctLSKjHv/kEtmFMLbm7o/pEqGSfUp7ky8o=;
 b=XBEatZUGZ4u3Kj2Q+QQu8LN+kvheRSOwjL1kkS0BLd7MSq8mVy8Wr8eh69WxijgqSh15
 r8EXkwdanN5o8cEzQM7UyFVfHBTZ/Fj089O6PwXf88P1v9Px+BHEA5oxd0xpxfjm4OFj
 SRUOxj9Hi59nG8VY0add9EjtyxT/I7fSKCbbIsWubPb9y8BKx1w+FbD6MWp55tgPOoFw
 igxRaSnhe2CI4DuOawFqRttIUqAlH+K8PXgRmpmJC3Z29P1KYY9Ml5/5hhZAUt8/hA8g
 GHBCVUzbnbJMpus0vpAMRbcIdVfERVLxrOdK52qH+lg1+i5ySt79JInjo8l97Pu6nnQ3 0A== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3365p7hrpq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 01:43:51 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07R5cevx019341;
 Thu, 27 Aug 2020 05:43:49 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 332uk6dakx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 05:43:48 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07R5hkL233489308
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Aug 2020 05:43:46 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CC12A4054;
 Thu, 27 Aug 2020 05:43:46 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74E59A405F;
 Thu, 27 Aug 2020 05:43:42 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.226.184])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Aug 2020 05:43:42 +0000 (GMT)
Subject: Re: OpenBMC - FRU inventory with Entity Manager
To: Vijay Khemka <vijaykhemka@fb.com>, Jiandi An <jan@nvidia.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Tom Joseph <tomjose@linux.vnet.ibm.com>, vernon.mauery@linux.intel.com
References: <DM6PR12MB3020D6DD47C7E6DBBD6530A3CD550@DM6PR12MB3020.namprd12.prod.outlook.com>
 <22E14C00-D87D-489F-AB22-6401DE8CDDF5@fb.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <5e71fa32-4547-fb5e-ed50-dffe19cefc09@linux.vnet.ibm.com>
Date: Thu, 27 Aug 2020 11:13:41 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <22E14C00-D87D-489F-AB22-6401DE8CDDF5@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-27_01:2020-08-26,
 2020-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 impostorscore=0 adultscore=0 mlxlogscore=999 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008270044
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

On 27/08/20 11:02 am, Vijay Khemka wrote:
> I don't think ipmi fru command is pointing to the right dbus object of FruDevice. We may have to fix or add this support in ipmid for standard fru command. Currently this command has been overridden by intel-ipmi-oem and fb-ipmi-oem for their respective target. If you add intel-ipmi-oem to your image then it should work.

It seems like several ipmi-oem implementations (intel, fb and likely 
several others) rely on the FruDevice to prepare IPMI FRU information, 
so this code is likely getting duplicated across the ipmi-oem repos. 
Should this be the other way around, i.e house the FruDevice based 
implementation in phosphor-host-ipmid and the current 
phosphor-host-ipmid implementation, which expects YAML config files, 
should be in an ibm-ipmi-oem repo?

Regards,
Deepak

> Regards
> -Vijay
> 
> ﻿On 8/26/20, 5:54 PM, "openbmc on behalf of Jiandi An" <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org on behalf of jan@nvidia.com> wrote:
> 
>      Hi,
> 
>      Have a question related how IPMI fru command is handled when having FRU inventory handled by Entity Manager.
>      I've enabled Entity Manager and through the config JSONs, got the entity manager to probe FRU config information off of EEPROM and getting the FruDevice inventory D-Bus object added.
>      For example I I have /xyz/openbmc_project/FruDevice/My_FRU show up under xyz.openbmc_project.FruDevice.  And I can introspect it.  But I can't get that FRU to be handled and displayed when I ran "ipmitool fru"
> 
>      root@bmc:~# busctl tree --no-pager xyz.openbmc_project.FruDevice
>      └/xyz
>        └/xyz/openbmc_project
>          └/xyz/openbmc_project/FruDevice
>            └/xyz/openbmc_project/FruDevice/My_FRU
> 
>      root@bmc:~# busctl introspect --no-pager xyz.openbmc_project.FruDevice /xyz/openbmc_project/FruDevice/My_FRU
>      NAME                                                          TYPE                   SIGNATURE   RESULT/VALUE                       FLAGS
>      org.freedesktop.DBus.Introspectable   interface             -                      -                                                 -
>      .Introspect                                                  method               -                      s                                                -
>      org.freedesktop.DBus.Peer                     interface             -                      -                                                 -
>      .GetMachineId                                           method               -                      s                                                -
>      .Ping                                                             method               -                      -                                                 -
>      org.freedesktop.DBus.Properties           interface             -                      -                                                 -
>      .Get                                                              method               ss                    v                                                 -
>      .GetAll                                                          method               s                     a{sv}                                          -
>      .Set                                                               method               ssv                  -                                                 -
>      .PropertiesChanged                                   signal                  sa{sv}as          -                                                 -
>      xyz.openbmc_project.FruDevice            interface              -                      -                                                 -
>      .ADDRESS                                                    property              u                     84                                             emits-change
>      .BOARD_INFO_AM1                                  property              s                     "\001"                                      emits-change
>      .BOARD_LANGUAGE_CODE                     property              s                     "25"                                          emits-change
>      .BOARD_MANUFACTURER                       property              s                     "XYZ COMPANY"                    emits-change
>      .BOARD_MANUFACTURE_DATE              property              s                     "2020-01-01 - 12:00:00"      emits-change
>      .BOARD_PART_NUMBER                          property              s                      "123.ABCD.1234"                 emits-change
>      .BOARD_PRODUCT_NAME                       property              s                      "My FRU"                               emits-change
>      .BOARD_SERIAL_NUMBER                       property               s                     "123ABC"                                emits-change
>      .BUS                                                              property              u                     2                                                emits-change
>      .CHASSIS_PART_NUMBER                        property               s                     "123-12345-1234-000"         emits-change
>      .CHASSIS_SERIAL_NUMBER                     property               s                     "1234567890123"                  emits-change
>      .CHASSIS_TYPE                                           property               s                     "23"                                           emits-change
>      .Common_Format_Version                     property               s                     "1"                                             emits-change
>      .PRODUCT_ASSET_TAG                            property               s                     "0000000000000"                  emits-change
>      .PRODUCT_FRU_VERSION_ID                 property               s                     "v0.5"                                        emits-change
>      .PRODUCT_LANGUAGE_CODE                property               s                     "25"                                           emits-change
>      .PRODUCT_MANUFACTURER                  property               s                     "XYZ COMPANY"                      emits-change
>      .PRODUCT_PART_NUMBER                     property               s                     "123-12345-1234-000"          emits-change
>      .PRODUCT_PRODUCT_NAME                  property               s                     "TBD"                                        emits-change
>      .PRODUCT_SERIAL_NUMBER                  property               s                     "1234567890123"                   emits-change
>      .PRODUCT_VERSION                                 property               s                     "v1.0"                                         emits-change
> 
>      When I ran the standard IPMI fru command, it always defaults to getting Builtin FRU Device, and dimm0, dimm1, cpu0, cpu1 FRUs and of course they are not there so it fails.  Is there anything that I'm missing to get the standard IPMI fru command to map to the DBUS object xyz.openbmc_project.FruDevice /xyz/openbmc_project/FruDevice/My_FRU under Entity Manger?
> 
>      root@dev-system:~# ipmitool -I lanplus -H $BMC_IP -U root -P 0penBmc -C 17 fru
>      FRU Device Description : Builtin FRU Device (ID 0)
>       Device not present (Unspecified error)
> 
>      FRU Device Description : dimm0 (ID 1)
>       Device not present (Unspecified error)
> 
>      FRU Device Description : dimm1 (ID 2)
>       Device not present (Unspecified error)
> 
>      FRU Device Description : cpu0 (ID 3)
>       Device not present (Unspecified error)
> 
>      FRU Device Description : cpu1 (ID 4)
>       Device not present (Unspecified error)
> 
>      Thanks
>      - Jiandi
> 

