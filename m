Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D893B6ED9
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 23:30:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YY721PplzF4Zf
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 07:30:38 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YY6G6Yc4zF4ZG
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 07:29:58 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8ILKOr5109551
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 17:29:54 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v3vdng8qd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 17:29:54 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8ILGtxB028640
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 21:29:53 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 2v3vbu82mm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 21:29:53 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8ILTrhk50790660
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 21:29:53 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D57EB2066
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 21:29:53 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1F76B2064
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 21:29:52 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 21:29:52 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Staging plans to remove network IPMI support?
To: openbmc <openbmc@lists.ozlabs.org>
Message-ID: <24ab3a70-2752-e2ba-5a37-41ee35f8aa92@linux.ibm.com>
Date: Wed, 18 Sep 2019 16:29:52 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-18_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909180182
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

The OpenBMC security working group discussed a desire to remove 
out-of-band network IPMI support from the OpenBMC firmware stack, here: 
https://lists.ozlabs.org/pipermail/openbmc/2019-September/018319.html

This would affect out-of-band (network IPMI) only, in repository 
https://github.com/openbmc/phosphor-net-ipmid. The host IPMI support is 
a separate topic.

The *main idea* is a staging plan to remove network IPMI support over a 
period of years, like in this progression:

1. Tell everyone the plans at each stage below. For example: emails to 
the group, mention in the release notes, update 
https://github.com/openbmc/phosphor-net-ipmid/blob/master/README.mdand 
the ipmitool repo. 2. Implement the Redfish ManagerNetworkProtocol - 
defined in the DMTF Redfish Resource and Schema Guide DSP2046 
https://www.dmtf.org/dsp/DSP2046.  This gives the BMC admin an interface 
to disable out-of-band network IPMI.That means stopping the IPMI network 
service and closing its port. 3. Change the IPMI ManagerNetworkProtocol 
setting to be disabled by default.  After this, BMC admins have to take 
an explicit action to enable IPMI access.By this point it should be 
possible to learn how to migrate from IPMI to Redfish APIs. 4. Remove 
IPMI from the default OpenBMC configuration. This means network IPMI is 
not built into the BMC firmware image. After this, project who want to 
use network IPMI willhave to explicitly add it to their image. This will 
hopefully be a wake-up call to anyone who is still using network IPMI. 
5. Remove all references to network IPMI from OpenBMC. Discussion? - Joseph
