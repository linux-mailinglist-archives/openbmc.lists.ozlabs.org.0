Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E78DC35E30C
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 17:40:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKVDK6TNqz3bVR
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 01:40:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Airvsvcb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Airvsvcb; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKVD45Byqz30C6
 for <openbmc@lists.ozlabs.org>; Wed, 14 Apr 2021 01:40:03 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DFYjsk039041
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 11:40:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to :
 message-id : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=yEvcRHr9JxvYwaIKt3D/5iGt/Gc8qtTYh71MrVWRJOw=;
 b=AirvsvcbqDG0qFVjypcsK01imwoLLTdAiEGKL783Pzs0cNbiZ//rn/PEgEbCJDgHGlvt
 B3/apN5v/4tusfRvET3vhYFDjmPsZ4klPffYp9JJkbDdwRojv9s2f+Tubzs02T3d1ePI
 ajpNiKb5tjX+UgIL4NtkHu85y0mEovgzKxi3KQFtTFXl29k+vwScrf4al4pF5vkr6rgi
 YuqAkrnX7LvK5LyRVxCn43BgGm6Vz1IMLeDdlQduqiXkt9oBi7C1doGwcvcVk0Hcp6D8
 1Re8ptwlQebPuUXQELaO/ARlwWhDjC4AAnD7NcxE6E33T+8zlB4itrhCdVnyT0FcDdis Ww== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37vk3sp0un-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 11:40:00 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13DFYm1l039309
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 11:40:00 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37vk3sp0ue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 11:40:00 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DFSCBs006960;
 Tue, 13 Apr 2021 15:39:59 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 37u3n9r861-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 15:39:59 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13DFdvRS24838532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 15:39:58 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D71617805C;
 Tue, 13 Apr 2021 15:39:57 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D03578063;
 Tue, 13 Apr 2021 15:39:57 +0000 (GMT)
Received: from demeter.local (unknown [9.160.29.196])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 13 Apr 2021 15:39:57 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: OpenBMC expired password feature
To: openbmc <openbmc@lists.ozlabs.org>, Mario Sanchez <wehurtsalami@gmail.com>
Message-ID: <7b094d0b-ce2a-38e9-70e0-a8d36356f870@linux.ibm.com>
Date: Tue, 13 Apr 2021 10:39:55 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PqsNNExxuwhvPK8koBShQ_uBvOSpNj2l
X-Proofpoint-ORIG-GUID: ZfGfR3-e1E61aI82ptD3Tfox7NhOzlxs
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 1 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_09:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130108
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

 > Hi Joseph,
 >
 > I am working on OpenBMC and would like to test the 'initial expired 
password' feature that you worked on.  I am not sure how to enable this 
in an OpenBMC image though.
 >
 > I couldn't find another document which described that process, other 
than the design documentation listed here: 
https://github.com/openbmc/docs/blob/master/designs/expired-password.md 
<https://github.com/openbmc/docs/blob/master/designs/expired-password.md>
 >
 > Is there another document which describes the enablement process, or 
can you provide some more information on this?

Mario,

The support to have initial expired passwords is not fully available in 
the OpenBMC project.  Here are the pieces you need:

(1)
The EXPIRED_PASSWORD image feature is not implemented.  There are two 
alternate ways to expire the password:
1. Directly expire the root account password via a bitbake recipe.  See 
https://github.com/openembedded/openembedded-core/pull/63/commits/7ace37a67c56fb4b9e0e98f8eff4ed067eb89f1e
2. Add a BMC systemd service to expire the password on BMC first boot.  
See 
https://github.com/ibm-openbmc/openbmc/blob/5434eaa5e4f53d9972c7bf3c4a90fd189f529547/meta-phosphor/recipes-phosphor/users/phosphor-user-manager_git.bb

The reason for the first-boot-expire-password.service has to do with how 
the factory reset function works.
Neither of these are merged into the OpenBMC project or OE core.

(2)
Both BMCWeb and the WebUI have the functions to handle expired 
passwords.  Specifically:
- BMCWeb follows the Redfish "password change required handling" spec.
- The WebUI has a special dialog which allows a user to change their own 
expired password during login.

Note a proposed BMCWeb change breaks the "password change required 
handling" function:
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39756
Work on that is pending.

(3)
The dropbear SSH server does not allow you to login or to change your 
password when your password is expired.  My attempt to patch dropbear 
has failed, and I carry a local patch here: 
https://github.com/ibm-openbmc/openbmc/blob/86f9791c2a2d991c3509f5e785322b1011c71d26/meta-phosphor/recipes-core/dropbear/dropbear_%25.bbappend

You can avoid this issue by using the OpenSSH server in place of dropbear.


- Joseph

 >
 > Thanks,
 > --Mario.

