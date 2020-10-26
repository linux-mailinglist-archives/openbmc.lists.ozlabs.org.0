Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B6B2995BF
	for <lists+openbmc@lfdr.de>; Mon, 26 Oct 2020 19:50:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKkSC5XHZzDqKM
	for <lists+openbmc@lfdr.de>; Tue, 27 Oct 2020 05:50:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gpsrfRkf; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKkR75xVbzDqDb
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2020 05:49:54 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09QIVncp137100; Mon, 26 Oct 2020 14:49:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : from : subject : cc
 : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=nNcIagdZe3He86/YeWFgc4k4d4B+fSy+Kf0YLmbY6ew=;
 b=gpsrfRkfl0QTfx+SyVfF+f655nZZpekPpZzr4q3y0W71cx7CvIR9hZIoM+xcSrFh4+2o
 nLxHIm8noK9TVTvshRYjdFpcIU3j4qT2YvPqlSgxWvS/eCGp+zoDOsK4em9Vihy7KFDL
 d/XFBxYU+mwdWdWteDShXh2bBTVzP8NSbjqwc2VNe0kLN7otEPGzXkwzItdL/KKGsGju
 k3au+g9hqpBUh6ia7ARJC1F83ckxPalqkYk/3l/v4EcC1H/7NCB61A7HGlX3Rdk9BzUJ
 mi4JUTsGHwvG3oAlu9dz051A9VyANaOjPb8i5hWawxuyThzq/ggmzPzktjvS085sQf/J +g== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34dp1r01vb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Oct 2020 14:49:51 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09QIWEMG021294;
 Mon, 26 Oct 2020 18:49:50 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 34cbw8x7xu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Oct 2020 18:49:50 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09QInntI44958152
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Oct 2020 18:49:49 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 800F8112063;
 Mon, 26 Oct 2020 18:49:49 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9675112062;
 Mon, 26 Oct 2020 18:49:47 +0000 (GMT)
Received: from [9.102.33.190] (unknown [9.102.33.190])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 26 Oct 2020 18:49:47 +0000 (GMT)
To: pawel.rapkiewicz@intel.com, Ed Tanous <ed@tanous.net>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Subject: bmcweb: Memory: Why not use "Present" for Redfish's Status State ?
Message-ID: <a6723812-c9f1-eb69-888f-d79b3da0cc71@linux.vnet.ibm.com>
Date: Mon, 26 Oct 2020 12:49:45 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-26_08:2020-10-26,
 2020-10-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 mlxlogscore=883 spamscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 clxscore=1011 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010260122
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

Hi Ed and Pawel,

I am missing some context here.
Why if MemorySizeInKB is 0 we set the "Status""State" of the DIMM to Absent?
Why not use the Present property?

https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/memory.hpp#L373

https://github.com/openbmc/phosphor-dbus-interfaces/blob/8aec946e2844831cfc377c0e0136de5714c08a5b/xyz/openbmc_project/Inventory/Item.interface.yaml#L9

By default MemorySizeInKB is 0 so if MemorySizeInKB hasn't been set your 
DIMM looks like (all other properties are skipped):

curl -k https://$bmc/redfish/v1/Systems/system/Memory/dimm6
{
   "@odata.id": "/redfish/v1/Systems/system/Memory/dimm6",
   "@odata.type": "#Memory.v1_7_0.Memory",
   "Id": "dimm6",
   "Name": "DIMM Slot",
   "Status": {
     "Health": "OK",
     "HealthRollup": "OK",
     "State": "Absent"
   }

This logic was added here:
https://github.com/openbmc/bmcweb/commit/443c2934ac1ae86b6d496e3509e2b8acf283fb18

Thanks,
Gunnar
