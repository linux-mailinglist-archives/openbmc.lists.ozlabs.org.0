Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71127323F6A
	for <lists+openbmc@lfdr.de>; Wed, 24 Feb 2021 16:14:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dlzx03nrkz3cGP
	for <lists+openbmc@lfdr.de>; Thu, 25 Feb 2021 02:14:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fADY4uGf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fADY4uGf; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dlzwm2Dmlz30HJ
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2021 02:14:31 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11OF6TjA102991
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2021 10:14:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=4wUG7cV1Roq2BuAOiOeNcjvxRBTAT2Zx74yjaI8H978=;
 b=fADY4uGfHdfy+QoWArWmCtXkk/ix1A62LvfoCI/7GFtG7KMKYLk5e49hgqgiNrI+Jdms
 nv+3TmrY/EtnGSqYxIPQab9ZrAPmwjtEKcgczKCfd0sIRLD7ASpE7mSL/4DZY55ceVXr
 VCl+SOxsb0sM3v2fLW6FcS+WtznXTmKvFhFm4aRJvd1624+QtTkR7zt9Dm8NPFt7a+7G
 YtwwXr5FawA0JZVU3Z6djQfRYMekIFUg1thR1LGdA38I9N/wrlgCISpGdbnyYd7PkpDk
 C88W4V/TljQYqCMhTdeJQcC+8L4ZuY7Okh6AE5FrSq7rxz9vFxzusjT39PJK09elsZwi 3Q== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36wk3tnhe0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2021 10:14:26 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11OF7pY1016533
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2021 15:14:26 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03dal.us.ibm.com with ESMTP id 36v5y97t1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2021 15:14:25 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11OFEOoe17957372
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2021 15:14:24 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B85DEC6094
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2021 15:14:24 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D71F4C6098
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2021 15:14:23 +0000 (GMT)
Received: from [9.206.206.190] (unknown [9.206.206.190])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2021 15:14:23 +0000 (GMT)
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Redfish 2020.4 release webinar
Message-ID: <48a9da2d-d86a-45ee-08ba-86bf1b0065cc@linux.vnet.ibm.com>
Date: Wed, 24 Feb 2021 08:14:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-24_06:2021-02-24,
 2021-02-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=694 spamscore=0 phishscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102240114
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

Redfish is hosting a webinar on March 5th. Details below.

DMTF’s Redfish Forum[1] would like to invite the OpenBMC community to 
learn about the Redfish 2020.4[2] release via a live webinar hosted on 
Zoom on March 5 at 11am PT.

The Forum chairs will present the contents of the release including 
focusing on: new power and thermal modeling, ‘Conditions’ within the 
common ‘Status’ property, and additional account types added to manager 
accounts.

Attendees will be able to ask questions during the Q and A session via 
the chat function. We look forward to a lively discussion.

Register today 
https://us02web.zoom.us/webinar/register/WN_GMQdIVWrT1Ky_VHq17jbGQ

For questions email webinars@dmtf.org.

[1] https://www.dmtf.org/standards/redfish
[2] 
https://www.dmtf.org/sites/default/files/Redfish_Release_2020.4_Overview.pdf
[3] https://us02web.zoom.us/webinar/register/WN_GMQdIVWrT1Ky_VHq17jbGQ
