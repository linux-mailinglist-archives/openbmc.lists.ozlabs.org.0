Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1932148C3D
	for <lists+openbmc@lfdr.de>; Mon, 17 Jun 2019 20:40:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SKlp20vmzDqT5
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 04:40:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SKl96fDLzDqSm
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 04:40:04 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5HIb9oZ024020
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 14:40:02 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t6f0pb1xj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 14:40:02 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Mon, 17 Jun 2019 19:40:01 +0100
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 17 Jun 2019 19:39:59 +0100
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5HIdwgd9765262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 18:39:58 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60BD7BE054;
 Mon, 17 Jun 2019 18:39:58 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34E4ABE051;
 Mon, 17 Jun 2019 18:39:58 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 17 Jun 2019 18:39:58 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Mon, 17 Jun 2019 13:41:30 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Move away from default password
In-Reply-To: <1ec23c9c-6fd1-1a37-150e-6ac7c950cc0d@linux.intel.com>
References: <1164a9a82b2b59087059c59391e65d04@linux.vnet.ibm.com>
 <1ec23c9c-6fd1-1a37-150e-6ac7c950cc0d@linux.intel.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19061718-0012-0000-0000-00001744F371
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011280; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01219376; UDB=6.00641380; IPR=6.01000518; 
 MB=3.00027347; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-17 18:40:01
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061718-0013-0000-0000-000057B9E039
Message-Id: <67d4cc41211749ef9ff888a31d9e8615@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-17_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=973 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906170165
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 Openbmc <openbmc@lists.ozlabs.org>, "Thomaiyar, Richard
 Marian" <richard.marian.thomaiyar@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


>> 1. Unique password per BMC.
>> In this approach, there is a way to change the factory default 
>> password.  Example flow: assemble the BMC, test it, factory reset, 
>> generate unique password (such as `pwgen`), then use a new function 
>> “save factory default settings” which would save the current 
>> setting into a new “factory settings” flash partition. After that, 
>> a factory reset would reset to the factory installed password, not to 
>> the setting in the source code.

How would this new "factory settings" flash partition be protected 
against being modified by an unauthorized or malicious user?

>> Presumably the new factory default would be printed on a sticker, or 
>> something.
>> Are there any other factory settings (settings unique to each device) 
>> that would benefit from being set like this?
>> One downside to this approach is someone who orders 100 systems has to 
>> enter 100 unique passwords.
>> 

