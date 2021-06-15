Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 783293A870E
	for <lists+openbmc@lfdr.de>; Tue, 15 Jun 2021 19:04:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4F660Q2Bz3bxs
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 03:04:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kfsISMqj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kfsISMqj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4F5m3Bqtz30DG
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jun 2021 03:03:55 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15FGoaHM010900; Tue, 15 Jun 2021 13:03:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to :
 message-id : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=6jhiw8zOUlwtiN27gl/f+Xv+FX9xTlRetXsAg/wU4dE=;
 b=kfsISMqjNg7vq9YFH6ZWzQ3b3Hh01v1cz44Fw2kxuxUkr1zf38KDToW0WvyU/gqinUAO
 19LRICGR0MWGmeW9h9Qx/0wThPpHjAnCW2pQbQ59eKc8a9Yj1Jos8AYw3yL+uWsmH4F6
 gkwE9NyWklBPoA3DignX57Pyn5Bg3Em8fWarpcldL4ODL1RkP5y/sQd81u/uHAVKSub5
 JyH6Mz6wEvHgJquUmBzZ9WO0wexOOFvUq8rCldhp0dr7kMnzeuanUBqu0Wfs5PuIdmC4
 dhooo0gWxOLykeeU//1zS8IAAw6BahYo7rYm6odgvPUN/2851Q0R+hTulWki6C7I+afZ qQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39702uras6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 13:03:51 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15FGw9ni020995;
 Tue, 15 Jun 2021 17:03:50 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02wdc.us.ibm.com with ESMTP id 394mj9skme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 17:03:50 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15FH3opS32637360
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jun 2021 17:03:50 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 242E2AE064;
 Tue, 15 Jun 2021 17:03:50 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6198AE05F;
 Tue, 15 Jun 2021 17:03:48 +0000 (GMT)
Received: from demeter.local (unknown [9.160.115.150])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 15 Jun 2021 17:03:48 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Need Redfish API for FieldMode?
To: openbmc <openbmc@lists.ozlabs.org>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>, Ed Tanous <ed@tanous.net>
Message-ID: <8cbf340b-b22e-ea87-05aa-10eac14960b5@linux.ibm.com>
Date: Tue, 15 Jun 2021 12:03:47 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: E459CkuIWHeQWBAvxjzduY5VtI8POpPM
X-Proofpoint-GUID: E459CkuIWHeQWBAvxjzduY5VtI8POpPM
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_07:2021-06-15,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=597 adultscore=0 clxscore=1011
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106150103
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

Network access to the BMC "FieldMode" parameter goes away (along with 
all other non-Redfish REST APIs) when BMCWeb changes its default to 
disable the "rest" option ("BMCWEB_ENABLE_DBUS_REST" feature).  Is 
anyone interested in making FieldMode parameter available from a Redfish 
API? I asked Redfish [How to model BMC FieldMode][].

Please reply in the issue or via email if interested.

- Joseph

[How to model BMC FieldMode]: 
https://redfishforum.com/thread/497/model-bmc-fieldmode

