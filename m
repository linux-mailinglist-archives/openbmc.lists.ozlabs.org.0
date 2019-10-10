Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E973AD30E5
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 20:54:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q0cX2sDlzDqS1
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 05:54:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q0bv3pBhzDqHG
 for <openbmc@lists.ozlabs.org>; Fri, 11 Oct 2019 05:53:46 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9AIllHb026966
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 14:53:43 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vj8ugtxtf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 14:53:43 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9AIpfdH026422
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 18:53:42 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 2vejt802uu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 18:53:42 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9AIrfFW54657370
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 18:53:41 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3235AE05F
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 18:53:41 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 855FDAE05C
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 18:53:41 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 18:53:41 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: New docs - provision and administer the BMC
Message-ID: <729b9544-a0e8-2f54-4f5f-b46554abee77@linux.ibm.com>
Date: Thu, 10 Oct 2019 13:53:41 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-10_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910100160
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

Team,

Can we add a new section for provisioning and administrating 
OpenBMC-based systems?  It would give newcomers a more inviting 
out-of-box experience, give us a place to record administrative best 
practices, and (most importantly) give me a place to talk about how set 
the BMC's root password per the [expired password design][].

The revised documentation flow would be:
1. The existing project README [Setting up your OpenBMC project][] 
details how to build an image.
2. The new BMC provisioning section would talk about how to provision 
and administrate the BMC.
3. The existing [OpenBMC Usage][] section introduces some of the BMC 
interfaces.

The content for the new section would walk the admin through BMC 
provisioning tasks such as:
- Loading the initial firmware image into the BMC.
- Accessing the BMC via ssh, Redfish, REST APIs, host interfaces, IPMI, 
serial console, etc.
- Setting the BMC's initial root password.
- Adding admin and user accounts.
- Configuring IP, disabling unneeded network services, etc.

Some of this could be copied from the [expired password cheatsheet 
review][] (which would be abandoned).

What do you think?

- Joseph

References:

[expired password design]: 
https://github.com/openbmc/docs/blob/master/designs/expired-password.md

[Setting up your OpenBMC project]: 
https://github.com/openbmc/openbmc/blob/master/README.md#setting-up-your-openbmc-project

[OpenBMC Usage]: 
https://github.com/openbmc/docs/blob/master/README.md#openbmc-usage

[expired password cheatsheet review]: 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/25706

