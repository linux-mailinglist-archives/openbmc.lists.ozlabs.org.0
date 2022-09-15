Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DC55BA0F9
	for <lists+openbmc@lfdr.de>; Thu, 15 Sep 2022 20:51:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MT5rN5Y7Bz3c1N
	for <lists+openbmc@lfdr.de>; Fri, 16 Sep 2022 04:51:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nkUgdhM/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nkUgdhM/;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MT5qs6rRJz3bcv
	for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2022 04:50:33 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28FIFC8i032514;
	Thu, 15 Sep 2022 18:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Ewdv/WiwGJCAW+fbGUTw3XpZfhgAj7KF28PuuQ2M0Ik=;
 b=nkUgdhM/yB1urmAGxX6rQutLOOBUR3/19kHwoygibsM5vINLTskTtiKmKlcRGYXiQ6sA
 HDQpx0ENBksJG5Gy+M6d9FARvSXfAonXvVhHwkxwc3z5ViO2hekqLpyCr3IkdT+sgK14
 z3Du454kosuF1opRqI+pi1vN2RENuCEvJeCAJ/H8QZGOQd7W/zxmW5KEPttAZEzN8j+6
 M7EHz5IcmR6usf+lNBdtoCy76t8bI00PRhtGQkbm4LijhuhyEMm/Lb4oB8UYB64D9qBi
 xVaiAB+apAKaWASwCI3cB2R1IrCPjDs4fTQTV31tlU9KDtz2jOVbk0LDQBP2KHGfgM0c Og== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jm95u8ycv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Sep 2022 18:50:27 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28FIoKuG010067;
	Thu, 15 Sep 2022 18:50:25 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
	by ppma03wdc.us.ibm.com with ESMTP id 3jm91w06b1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Sep 2022 18:50:25 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28FIoPOQ48365842
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Sep 2022 18:50:25 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 60E75AC059;
	Thu, 15 Sep 2022 18:50:25 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C642AC05E;
	Thu, 15 Sep 2022 18:50:25 +0000 (GMT)
Received: from [9.160.48.77] (unknown [9.160.48.77])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Thu, 15 Sep 2022 18:50:24 +0000 (GMT)
Message-ID: <49eab14f-806d-fa1d-9867-c6f0ce549ad0@linux.vnet.ibm.com>
Date: Thu, 15 Sep 2022 12:50:23 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: What is the purpose of xyz.openbmc_project.Inventory.Item.Global
 interface and getGlobalPath in HealthPopulate ?
Content-Language: en-US
To: Francine Sauvage <francine.sauvage@atos.net>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <PAXPR02MB768047479061D2A85A63A2B5E4469@PAXPR02MB7680.eurprd02.prod.outlook.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
In-Reply-To: <PAXPR02MB768047479061D2A85A63A2B5E4469@PAXPR02MB7680.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fgeveRSvtpBCADF0tTytYbenOCRArf6Y
X-Proofpoint-GUID: fgeveRSvtpBCADF0tTytYbenOCRArf6Y
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_10,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 mlxlogscore=999 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2209150112
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

On 9/14/2022 8:16 AM, Francine Sauvage wrote:
> 
> I would like to set the Status/Health of a target directly that target 
> is not a sensor.
> 
> I saw HealthPopulate, composed of 2 parts:
> 
>   * getAllStatusAssociations like all_sensors => linked to a rela sensor
>     => not interested
>   * getGlobalPath => cannot understand how it works ? Should I add this
>     interface to a dbus object, and the magic appears ?
> 
> I would be grateful if you have any example !
> 

As I understand it, Inventory.Item.Global is a way to designate what 
resources should have the Redfish health rollup from their children.

Inventory Items like Chassis or System would be good candidates for this 
Inventory.Item.Global interface. An example is a Redfish Chassis with 
Health Rollup from children resources like power supplies and fans.

https://github.com/openbmc/docs/blob/master/designs/redfish-health-rolllup.md

https://github.com/openbmc/phosphor-dbus-interfaces/blob/1133524601de2ffc27ddcbd05ff6afc8b5cc1420/yaml/xyz/openbmc_project/Inventory/Item/Global.interface.yaml

https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/health.hpp

https://github.com/openbmc/s2600wf-misc/commit/dc7bbdcb62c593011671afe30471cc8fff6ebb19

