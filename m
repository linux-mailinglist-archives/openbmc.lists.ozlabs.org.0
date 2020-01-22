Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A57145DC2
	for <lists+openbmc@lfdr.de>; Wed, 22 Jan 2020 22:24:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482z1N47n9zDqW0
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2020 08:24:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482z0b2MXBzDqMV
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jan 2020 08:23:26 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00MLBr2G007189
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2020 16:23:24 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xkwq9e0yy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2020 16:23:24 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00MLLFq5023266
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2020 21:23:23 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02wdc.us.ibm.com with ESMTP id 2xksn6rh1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2020 21:23:23 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00MLNMZr48693574
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2020 21:23:22 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 640C66E052
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2020 21:23:22 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42BCA6E050
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2020 21:23:22 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.252])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2020 21:23:22 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Security working group meeting 2020-01-22
To: openbmc <openbmc@lists.ozlabs.org>
Message-ID: <f62056a8-ddc9-71ae-620f-b9ac45f3c86a@linux.ibm.com>
Date: Wed, 22 Jan 2020 15:23:21 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-22_08:2020-01-22,
 2020-01-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001220181
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

Notes from the security working group meeting 2020-01-22:
Highlights below; details in 
https://github.com/openbmc/openbmc/wiki/Security-working-group


1. Discuss BMCWeb’s site identity certificate handling, specifically 
intermediate certificates.  See 
https://github.com/openbmc/bmcweb/#configuration  

Other web servers have directives to concatenate the intermediate 
certificates (excluding the root CA certificates) and send that. What 
does BMCWeb do? 
  - What is BMCWeb's default default?
  - Need better docs, for example: How can a BMC admin replace theBMCWeb 
site cert?  Is it okay to concatenate intermediate certs? Can we 
document this for BMCWeb?


2. Design discussions about aggregation broached the security topic : 
https://lists.ozlabs.org/pipermail/openbmc/2020-January/020142.html  

We are not sure what security help is needed. at this point.


3. Revisit "Daemons should not run as root" - 
https://github.com/openbmc/openbmc/issues/3383

There is definite interest.  Who can work on this?  Possible initial 
goal: convert bmcweb so it runs as a non-root user.  BMCWeb is selected 
because it is higher risk because implements a network interface. 


4. Merged BMCWeb commit to allow slower image uploads: 
https://github.com/openbmc/bmcweb/commit/2b5e08e2915d886655a78aaabff40745dca6b517 
   See also commit: 0e1cf26b1cd98e0ec069e6187434fcabf1e9c200 “Make the 
max http request body size configurable”. 

Minimal discussion. 


5. Merged BMCWeb commit that added new messages for security events: 
https://github.com/openbmc/bmcweb/commit/8988dda41319950476ebb146df06c2e7b3fbf44d 

Minimal discussion. 


6. How do we bring security assurance work into the OpenBMC project?  Is 
there interest in considering Protection Profiles that apply to 
OpenBMC?  We can use these as a systematic way review security topics.  
For example, the Operating System Protection Profile (OSPP) talks about 
cryptographic functions, audit logging, network security, secure boot, 
etc.  The Virtualization Protection Profile (VPP) considers the BMC to 
be part of the platform management system. 

There was agreement that these security schemes are good starting points 
to use as a guide.  DONE: Joseph added new “Security Assurance Workflow” 
section to guide future work in this area - 
https://github.com/openbmc/openbmc/wiki/Security-working-group#security-assurance-workflow 
.


- Joseph

