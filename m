Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B6115226D
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2020 23:41:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48C0770hJzzDqHx
	for <lists+openbmc@lfdr.de>; Wed,  5 Feb 2020 09:41:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48C06R6hgrzDqHx
 for <openbmc@lists.ozlabs.org>; Wed,  5 Feb 2020 09:41:19 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 014MfAnc075839
 for <openbmc@lists.ozlabs.org>; Tue, 4 Feb 2020 17:41:15 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xyhmag0ad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 04 Feb 2020 17:41:15 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 014MeSGr010073
 for <openbmc@lists.ozlabs.org>; Tue, 4 Feb 2020 22:41:13 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01wdc.us.ibm.com with ESMTP id 2xyhm6g018-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 04 Feb 2020 22:41:13 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 014MfD1l51839242
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 4 Feb 2020 22:41:13 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 132B7112067
 for <openbmc@lists.ozlabs.org>; Tue,  4 Feb 2020 22:41:13 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA9E8112066
 for <openbmc@lists.ozlabs.org>; Tue,  4 Feb 2020 22:41:12 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.252])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Tue,  4 Feb 2020 22:41:12 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: BMCWeb: rate-limit authentication failures
To: openbmc <openbmc@lists.ozlabs.org>
Message-ID: <60250182-21b5-8bf2-9995-413c266f075f@linux.ibm.com>
Date: Tue, 4 Feb 2020 16:41:12 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-04_08:2020-02-04,
 2020-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002040155
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

I would like to enhance BMCWeb to rate-limit password-based 
authentication attempts (footnote1) to address [CWE-307][].  [Broken 
Authentication][] is an OWASP top 10 item.  The goal is to protect 
against CWE-307 without causing denial of service.  Specifically, when 
excessive authentication attempts are happening, legitimate users should 
be able to access the BMC (specifically an admin can login), and 
degraded BMC performance is acceptable.

The main idea for the design is to allow authentication at full speed, 
and rate-limit only when needed.   This is consistent with the approach 
OWASP outlines.

Perhaps the design can be as simple as recording the 10 most recent 
authentication failures (steady_clock time only, having them time out 
after a minute) to define "excessive", and using the timestamp of the 
most recent failure to determine when the next attempt will be allowed.  
When authentication is requested but not allowed, return HTTP status 
code 429 (Too Many Requests) with HTTP response header "Retry-After: 
3".  ==> This will slow down attackers (for example, to 30 tries per 
minute, even when multiple connections are used) and allow legitimate 
users to compete for authentication attempts.

However, I think even this apparently simple design might be tricky to 
get right.  Is there an open source solution we can use?  What do you 
think?  Let me know if this is important to you.  I would like to hear 
ideas how to proceed.

- Joseph

<snip/>TL;DR (too long; don't read):

A counterpart to this design is to delay any failed authentication 
attempt for a few seconds.  This is intended to slow down malfunctioning 
network agents that repeatedly fail to authenticate to the BMC.  This 
won't slow down attackers who can use multiple connections to the BMC.

I looked at using Linux-PAM.  For example, [OpenBMC uses pam_tally2][] 
but does not configure account lockouts.  I don't want to pursue using 
the pam_tally2 lockout mechanism because that can lead to denial of 
service.  I believe rate-limiting is a better approach.

I only want to protect access via BMCWeb.  The protection techniques may 
also apply to network IPMI and SSH, but the direction is to disable 
these accesses, so I am less interested.  Access via the BMC's serial 
console would not be protected.  Access via the BMC's host should have 
similar protections, but I am not investigating that now.

CWE-307 is a problem only because OpenBMC offers password-based 
authentication without requiring multi-factor authentication (MFA). 
Disabling password-based auth remains a popular use case, and OpenBMC 
has no MFA capabilities.  So I need CWE-307 protection as a stop-gap 
solution.

References and footnotes:
[CWE-307]: https://cwe.mitre.org/data/definitions/307.html
[OpenBMC uses pam_tally2]: 
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-extended/pam/libpam/pam.d/common-auth
(footnote1): BMCWeb's password-based authentication includes Basic Auth, 
login via /login, and creating a Redfish session.  It does not include 
authentication via mTLS or using an X-Auth-Token or a cookie from an 
established session.
[Broken Authentication]: 
https://owasp.org/www-project-top-ten/OWASP_Top_Ten_2017/Top_10-2017_A2-Broken_Authentication
