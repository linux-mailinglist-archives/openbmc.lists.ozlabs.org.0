Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4D0284249
	for <lists+openbmc@lfdr.de>; Mon,  5 Oct 2020 23:48:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C4vPJ53mwzDqNT
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 08:48:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VM7SF6Zf; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C4vMs5j53zDqMh
 for <openbmc@lists.ozlabs.org>; Tue,  6 Oct 2020 08:47:37 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 095KWFZs089807; Mon, 5 Oct 2020 16:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to : cc
 : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=+PhuZLfUVT3oCbxIQ8dfJHAwGioYZSoXiw0fYIZSu1I=;
 b=VM7SF6ZfIwVdzCKYH2XcuyQ51GTvl77lrTQIfM1VUxCa3MBdWICfLSx0Ho+OPPcxBsqC
 bUmA+POtF75UWxvsQQxBcyO4ErGhtJt5ItQBzUUNA2Hy5jSSlUSt6gIGZOzus094O8O0
 vUrTWai7mDqgOgZKe7sCkkFghZwtSqjXVy4WprIee/wHkfFqkoBP/eHIqjsnDP83rc6W
 9VKC6ryQLAb+2sRSO9yk53B5JOVmlIaLIcZ766fBkmMp3/Ilb5vtQXOW+8sFQ1nH2Vgs
 u47C2pH/PORl1zhm/kPOrLWHONZO1xdNyzsNQoX0UKVAnHTrrbVGSpl3UoOVj0/nC+Tm fg== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 340a4s8xva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Oct 2020 16:34:52 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 095KXGoq016325;
 Mon, 5 Oct 2020 20:34:52 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 33xgx9aa3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Oct 2020 20:34:52 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 095KYpZD46268804
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 5 Oct 2020 20:34:52 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C679EAE05C;
 Mon,  5 Oct 2020 20:34:51 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87C68AE05F;
 Mon,  5 Oct 2020 20:34:50 +0000 (GMT)
Received: from [9.206.182.230] (unknown [9.206.182.230])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  5 Oct 2020 20:34:50 +0000 (GMT)
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Subject: Redfish: Supporting deprecated properties
To: openbmc@lists.ozlabs.org
Message-ID: <1a66bd6f-4095-2357-c860-80435c63bbe5@linux.vnet.ibm.com>
Date: Mon, 5 Oct 2020 14:34:48 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-05_15:2020-10-05,
 2020-10-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010050141
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
Cc: ed@tanous.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Felt this needed some broader discussion. Although Redfish tries to 
avoid, it does deprecate properties. In the future, Redfish plans to 
deprecate whole schemas. One of these deprecated properties was the 
IndicatorLED property, replaced by the LocationIndicatorActive property. 
More information on this can be found at (Slide 11): 
http://www.dmtf.org/sites/default/files/Redfish_Release_2020.3_Overview.pdf

On https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36886, it was 
proposed supporting both the deprecated and new property for some time.
This would introduce a new Redfish Validator warning about implementing 
a deprecated property. We have other warnings today so maybe not a big deal.
How long do we need to support both properties?
Based on releases? 6 months? That feels too long. Are our releases used 
broadly enough and release process mature enough?
If it is not a replacement and just deprecating a property, can we just 
drop the deprecated property immediately when switching to a new schema 
version that deprecates?
Do we need to do the same when a schema is deprecated? This matters 
because Redfish is targeting 2020.4 for new Power and Thermal Subsystem 
Schemas. Redfish plans to deprecate the old Power and Thermal Schemas 
and release new schemas.

I think it is reasonable we support both IndicatorLED and 
LocationIndicatorActive for some time, I'll throw out 2 months. Our 
Redfish implementation is young and I am not sure it is worth the 
developmental and support costs, at least at this time, to maintain 
deprecated properties and schemas for long.

Clients can use the schema version to determine which properties are 
available. If needed companies in a fork could maintain backward 
compatibility for longer.

Thanks,
Gunnar
