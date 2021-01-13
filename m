Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B55EA2F533F
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 20:24:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGHSZ0KtpzDrSd
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 06:24:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gAukb/X5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGHRb25zYzDrS2
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 06:23:38 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10DJCxcY108906
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 14:23:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : from : subject :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=lw090LVd6PE/k+Yy5xDzUZxeyfn2yzRN3Bn0wFo2eJA=;
 b=gAukb/X5qH51kgqPNAkqsb+9eFiPKzNdJO1RcYRzlHtoZ1VeH5GbMOFfi8yNEGwRjDcK
 rY8dOvymUlQo/R9XPvaYnp6JcJCBWDAN8hr/5+jZc8gagoqDpBvNVbHifthd4D48WSWY
 xU9/hiehKbTKjP0DWHfVxxtV6DFLDdo3qT/utau1a8nRwn8ejP5WZnU2Qo0kmBJT4QxQ
 S+KczGzkN0xTkH8fDzX9n6BQoK2QPeXDPZsnkf5Atd8jQxHHL4mtDIu40dtSdEOrv9Fn
 8vvMJNpI7FSGKd7HYRNfk4KrhutiacrITeFpFjggS9EiQ9v46jwfnWF/JITwj5LXbym4 SA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3626tp08jh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 14:23:35 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10DJHDfA031149
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 19:23:34 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 35y4497ttd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 19:23:34 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10DJNYEc31916498
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 19:23:34 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81A9B28058
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 19:23:34 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56A4728059
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 19:23:34 +0000 (GMT)
Received: from demeter.local (unknown [9.80.209.253])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 19:23:34 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Use cases: what interface should admins be allowed to disable?
Message-ID: <8156dcbe-42d3-76f9-ba41-5998d3da6199@linux.ibm.com>
Date: Wed, 13 Jan 2021 13:23:33 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-13_09:2021-01-13,
 2021-01-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 mlxlogscore=437 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101130109
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

What network interfaces does your BMC support?  Do you want to allow the 
BMC admin to disable them?
Please help provide use cases and guidance.  This is for current work in 
this area: https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39006

Discussion:

OpenBMC provides several network interfaces including:
  - HTTP - either as access to BMCWeb without transport layer security, 
or as a redirect to HTTPS (pending review)
  - HTTPS - access to the BMCWeb server
  - SSH - access to both the BMC's command shell (port 22) and the 
host's console (port 2200)
  - IPMI (RAKP)
  - NTP

See detailed interface discussion here: 
https://github.com/openbmc/docs/blob/master/architecture/interface-overview.md


BMCWeb currently implements a Redfish API (ManagerNetworkProtocol) for 
the BMC admin to enable and disable network interfaces.  This interface 
is being enhanced by the gerrit review linked above.  We are trying to 
determine how this should work.

I wrote down my preferences here: 
https://github.com/ibm-openbmc/dev/issues/1763  and I understand others 
will have different use cases.  So, the purpose of this email is to 
understand how to move forward.  I also understand some use cases will 
completely disable various interfaces.  For example, some users may 
completely remove IPMI functions from the firmware image.

For each interface, I see three possible configurations:
1. The interface is not present in the image.  Naturally, the admin 
shall have no way to enable this interface (because it is not present).  
For example, we want IPMI eventually to be configured out of the image.
2. The interface is present in the image but the admin shall have no way 
to disable it.  For example, SSH is present and the admin has no API to 
disable it.  Another example, disabling HTTPS would prevent Redfish 
access, and then the admin may lock themselves out of the BMC.  This is 
not a desirable situation.
3. The interface is present in the image and the admin shall have a way 
to enable and disable it.  For example, this capability already exists 
in BMCWeb for IPMI and NTP.  The case for SSH is discussed in issue 1763 
linked above.

How can these configurations be implemented?
1. When the interface is not present in the image -- Write bitbake 
recipes to configure/build the feature out of the image, and also 
configure BMCWeb so it cannot enable/disable that interface.
2. When the interface is present and should always remain enabled -- 
Configure BMCWeb so it cannot enable/disable the interface.
3. When the interface is present and the admin shall have a way to 
enable and disable it -- First, if needed, enhance the BMCWeb Redfish 
API to allow the admin to enable and disable the interface. Then 
configure BMCWeb to allow that.

I propose project defaults as follows:
  - HTTP - interface present and redirects to HTTP / admin allowed to 
enable and disable.
  - HTTPS - always enabled (the admin is not allowed to disable it)
  - SSH - present in the image & admin allowed to enable and disable
  - IPMI - present in the image & admin allowed to enable and disable
  - NTP - present in the image & admin allowed to enable and disable

Oops, I wrote too much!  Feedback here or in the gerrit review is 
appreciated.

- Joseph

