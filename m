Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B052B5435
	for <lists+openbmc@lfdr.de>; Mon, 16 Nov 2020 23:20:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZk6R4jVRzDqQG
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 09:20:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pCn4QX1W; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZk5S1Z2LzDqN2
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2020 09:19:39 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AGM2MxX043985; Mon, 16 Nov 2020 17:19:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=jUlAxd4JBULk9kasv27fV16Y/bcskffMJgfVwoLMcaA=;
 b=pCn4QX1Wd5IOzvF9Uhd6UObFJSRN4yKX7BGFNiLEJIfJ8nos+BhfShcX2HYEe2l2CFCX
 f7jSkbQt9ZQX1OWwQVgjU/GkOoku+VKQKvaiH9pSkmDOZWjKCYqEb1edie/DFMtLGg7K
 RU3HT3MF5ecQIycN90GsIlIKIJIyZp8kgVLZOCw5eE/79loZjarI25MP6BICKX12BNVa
 NoixjpqVm/bqz6+pnB4DhQaxnQbWKMVwZs2DtXQnV9wWAEiB2jVTZn/GauKZMYClEWkV
 LkdB9ngKr4dlQT5R9EUH1XvQbyqeTTViUyD6TTrtx1b4zDluNbkkM1JJpYZ44rZxJuGi Fg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34ussqpkq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Nov 2020 17:19:36 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AGMHfYq015585;
 Mon, 16 Nov 2020 22:19:35 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 34t6v96cnc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Nov 2020 22:19:35 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AGMJPeG12386996
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Nov 2020 22:19:25 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B72B0136053;
 Mon, 16 Nov 2020 22:19:33 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CAA7136051;
 Mon, 16 Nov 2020 22:19:33 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.139.110])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 16 Nov 2020 22:19:32 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Subject: User-manager default group roles
Message-ID: <8031d32c-9dd2-a72a-7751-8784fe9d2d99@linux.ibm.com>
Date: Mon, 16 Nov 2020 16:19:32 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-16_11:2020-11-13,
 2020-11-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 malwarescore=0 bulkscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 clxscore=1011 adultscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011160127
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


What is the right way to assign default phosphor-user-manager "group 
roles" to dynamically created users?

Background: Currently, when a new local user is created via Redfish API 
POST /redfish/v1/AccountService/Accounts you have to specify a Redfish 
RoleId.  BMCWeb maps the RoleId to a phosphor user manager "Privilege 
Role" [1] and assigns ALL of the "group roles" to the new user [2].  Per 
[3] this is not intended, and I need to fix this for my use case.

IMHO, the correct approach is for the project to define a mapping from 
"role" to "privilege role" that can be used when dynamically creating a 
new user.  For example, the admin role maps to "ssh ipmi redfish web" 
whereas the readonly role maps to "ipmi redfish web" (omits "ssh").  
Then images can customize this as needed.

But where should this mapping be applied?  Does it belong in BMCWeb or 
in phosphor-user-manager [4]?  Should we have another D-Bus property [5] 
to give this mapping?

- Joseph

[1]: 
https://github.com/openbmc/docs/blob/master/architecture/user-management.md
[2]: 
https://github.com/openbmc/bmcweb/blob/929d4b57f10bc4200e16b71fbcf32521d8cc23c1/redfish-core/lib/account_service.hpp#L1435
[3]: https://github.com/openbmc/openbmc/issues/3643
[4]: 
https://github.com/openbmc/phosphor-user-manager/blob/master/user_mgr.hpp
[5]: 
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/User/Manager.interface.yaml

