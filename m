Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C93C9AACE3
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 22:20:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PXB03vvHzDr6P
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2019 06:20:24 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PX9956wqzDr43
 for <openbmc@lists.ozlabs.org>; Fri,  6 Sep 2019 06:19:40 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x85KH0v1002401
 for <openbmc@lists.ozlabs.org>; Thu, 5 Sep 2019 16:19:38 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uu63t6tq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Sep 2019 16:19:38 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x85KF72i004206
 for <openbmc@lists.ozlabs.org>; Thu, 5 Sep 2019 20:19:37 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02wdc.us.ibm.com with ESMTP id 2uqgh7c6ss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Sep 2019 20:19:37 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x85KJag254002030
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 5 Sep 2019 20:19:36 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B66A4AE05C
 for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2019 20:19:36 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9871FAE05F
 for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2019 20:19:36 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2019 20:19:36 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Expired password + disabled power button design
To: openbmc <openbmc@lists.ozlabs.org>
Message-ID: <af6cb67f-1d0f-1dcf-8b88-5b7950a5bc1b@linux.ibm.com>
Date: Thu, 5 Sep 2019 15:19:36 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-05_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909050187
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

I am working to reduce the time window when the BMC offers a default 
password to its network users.  See the [expired password design][].  
The idea is to force users to change the BMC's password as soon as possible.

[expired password design]: 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/23849

Note: This design seeks to reduce the time window when the BMC is on the 
network with a default password, not to completely remove this 
vulnerability.  The time window begins when the system is plugged into 
power, and ends when the BMC's password is changed.

When complete, I believe this will offer significant protection for the 
BMC and can be used to help comply with laws such as CA Law [SB-327][], 
specifically section 1798.91.04 (b) (2) which states "The device 
contains a security feature that requires a user to generate a new means 
of authentication before access is granted to the device for the first 
time."  Where "the device" is the BMC, and "access" means access past 
the BMC's authentication mechanism to a session which can operate the 
BMC's controls.  The section cited above seems to accept the time window 
as a reasonable security exposure and to use the term "access" as I have 
done.

[SB-327]: 
https://leginfo.legislature.ca.gov/faces/billTextClient.xhtml?bill_id=201720180SB327

HOWEVER, there is a hole in this design which extends the time window 
indefinitely.  The scenario begins when the installer takes possession 
of a new system (BMC + host) and plugs it into power.  At this point, 
the BMC starts running and offering its services to network users.  The 
host remains powered off.  The installer then disregards the BMC and 
uses the power button to boot the host system, then continues to 
disregard the BMC when provisioning the host, either using physical 
access to the host (not via the BMC), or a pre-configured host.  This 
results in a fully-functional host and a BMC which still has its default 
password.

THEREFORE, I am proposing a new "disabled power button" image feature.  
Normally, pressing the power button tells the BMC to power on and boot 
the host.  With this design, if the BMC still has its default expired 
password, it will ignore a power button press, and will instead indicate 
to the operator to configure the BMC's password, and try again.  Options 
for the BMC to indicate this are machine-specific and include: messages 
to an operator panel, or LED blink codes.  The recovery procedure is for 
the installer to access the BMC, change its password, and try again to 
power on the server.

The implementation might possibly be in the [state manager][] so it can 
perform this check if the server is powered on for any reason. The test 
if the BMC still has its default expired password could be performed by 
invoking Linux PAM APIs, effectively trying to authenticate using the 
default credentials, and checking if the credentials and valid and 
expired.  An alternate approach could instead check if the BMC is in 
provisioning mode.

[state manager]: https://github.com/openbmc/phosphor-state-manager

Note: The "disabled power button" design feature would be off default.  
Platforms wanting to use it would have enable the image feature.

- Joseph

