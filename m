Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0933531C5C0
	for <lists+openbmc@lfdr.de>; Tue, 16 Feb 2021 04:14:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DfmK967R9z30Jw
	for <lists+openbmc@lfdr.de>; Tue, 16 Feb 2021 14:14:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fi2ALo9P;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Fi2ALo9P; dkim-atps=neutral
X-Greylist: delayed 3434 seconds by postgrey-1.36 at boromir;
 Tue, 16 Feb 2021 14:13:51 AEDT
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DfmJv0VPWz2yRh
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2021 14:13:50 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11G21okW039551; Mon, 15 Feb 2021 21:16:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=iL3zNWk061rVZG63ZKErDgn4ot0aP5hG4mzH6A10oAU=;
 b=Fi2ALo9PlcK+4uklU7KlZhXK3+9R5t0FkI9OvPhBppSmdVchkxn/JWw7DlwTxsxujBx2
 vUtEwcLWU4mH+9/Jii5F7ygxKKX8HFhLltQHAT2ZhDEqmguyRl1SZWkLjBDso7nsL+ID
 OlH+tjyRyvrEzOok8q+fJvkuTEnj5WFd5PrFSoFGy0EZq3ksbJ62nlu7W9KdDW9nLajc
 AGvvume2U33OgCowAqbFrMUUSVnOLvKGgO+2PaBLm+0kowl/wQ7TMxLMfU4o8b4sLDNn
 5sZTVrQKk047YZ/XGCEiq1k9CHRzkajNfTK3tQUVayut8Yidhq4N9CjsW52v11Vet8NJ HQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36r4n8rmmd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Feb 2021 21:16:30 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11G22M5e041692;
 Mon, 15 Feb 2021 21:16:30 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36r4n8rmm2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Feb 2021 21:16:30 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11G2BduN027103;
 Tue, 16 Feb 2021 02:16:28 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 36p6d937sm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Feb 2021 02:16:28 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11G2GSvc24838456
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Feb 2021 02:16:28 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C141124053;
 Tue, 16 Feb 2021 02:16:28 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EB5C124052;
 Tue, 16 Feb 2021 02:16:24 +0000 (GMT)
Received: from [9.102.51.15] (unknown [9.102.51.15])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 16 Feb 2021 02:16:24 +0000 (GMT)
Subject: Re: Switch SensorCollection to show all sensors as new power/thermal
 schemas implemented
To: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
References: <3475dcc0-5630-b18d-5cbe-e36ba1454fc4@linux.vnet.ibm.com>
 <d1511a78-6a2d-4709-9839-fc7413c64a92@linux.vnet.ibm.com>
 <CAM=TmwWkokfJMdT-Vd88SSui4ee7jYPudMmRXPo0uPO=6bCY4Q@mail.gmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <48458f34-53d0-3a61-b1bd-4d6ff513a2cb@linux.vnet.ibm.com>
Date: Mon, 15 Feb 2021 19:16:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAM=TmwWkokfJMdT-Vd88SSui4ee7jYPudMmRXPo0uPO=6bCY4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-15_16:2021-02-12,
 2021-02-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=661 clxscore=1011 bulkscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2102160013
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>, Lei Yu <yulei.sh@bytedance.com>, "Li,
 Yong B" <yong.b.li@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 1/19/2021 9:53 PM, Deepak Kodihalli wrote:
> 
> Where would the sensor collection be rooted at?
> /redfish/v1/chassis/{ID}/sensors? 


Late reply. Yes. Sensors are associated to a chassis via an association.
https://github.com/openbmc/docs/blob/919a7b6816a5f16aa72d298e81e0756d95d5031e/architecture/sensor-architecture.md#association-type-1-linking-a-chassis-to-all-sensors-within-the-chassis

https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/40169 is the code 
for moving bmcweb to all sensors in the sensor collection.


If so, would this also contain
> sensors accessible to the system software (some CPU/DIMM sensors for
> eg)?


Yes, it could. There is nothing in the Redfish spec that prevents that. 
The definition of what a sensor is in Redfish is very broad.
If you need additional "ReadingTypes", I'm sure Redfish would be willing 
to add with a use case.

https://redfish.dmtf.org/schemas/v1/Sensor.v1_2_0.json

Hope this helps,
Gunnar


