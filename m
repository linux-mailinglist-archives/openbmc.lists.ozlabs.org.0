Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B70F161D52
	for <lists+openbmc@lfdr.de>; Mon, 17 Feb 2020 23:30:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LzFS1HGhzDqRG
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 09:30:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LzDm4DbJzDqB0
 for <openbmc@lists.ozlabs.org>; Tue, 18 Feb 2020 09:29:28 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01HMSsjb010499
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 17:29:25 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y6e1gw9hs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 17:29:25 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01HMPYvl008736
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 22:29:24 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma05wdc.us.ibm.com with ESMTP id 2y6896d5vj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 22:29:24 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01HMTNNb42402208
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 22:29:23 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0A8728059
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 22:29:23 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B36712805A
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 22:29:23 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.252])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 22:29:23 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Security Working Group meeting - this Wednesday February 19
Message-ID: <b9170918-0937-714a-470e-cb41e1e74b63@linux.ibm.com>
Date: Mon, 17 Feb 2020 16:29:23 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-17_14:2020-02-17,
 2020-02-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002170183
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

This is a reminder of the OpenBMC Security Working Group meeting 
scheduled for this Wednesday February 19 at 10:00am PDT.

We'll discuss current development items, and anything else that comes up.

Ratan intends to participate and has requested that we cover the 
following two items first:
(A) service discovery direction, (B) using pam_abl

The current topics:

1. (Joseph): Is OpenBMC affected by the Chrome browser’s SameSite cookie 
changes 
(https://blog.chromium.org/2020/02/samesite-cookie-changes-in-february.html)? 
Do we want to enhance BMCWeb 
(https://github.com/openbmc/bmcweb/blob/master/include/token_authorization_middleware.hpp#L430) 
to create cookies with SameSite=None; Secure when 
BMCWEB_INSECURE_DISABLE_XSS_PREVENTION is also used, to allow the BMC to 
be used by the Chrome browser.  Perhaps by default BMCWeb should 
generate cookies with SameSite=Strict?   

2. (Joseph, follow up to agenda item 3 from 2020-02-05): Redfish 
Privilege updates: 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/28881 and 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/28878  Update Feb 
11: See 
https://redfishforum.com/thread/281/manageraccountcollection-change-allows-account-enumeration 
clarified the intention to NOT enumerate all accounts (unless you are 
the admin) 

3. (email) FYA.  BMC aggregator - includes a security topic. 
https://lists.ozlabs.org/pipermail/openbmc/2020-February/020433.html  

4. (email) FYA - BMC Secure Boot / U-Boot - use dm-verity or alternate? 
https://lists.ozlabs.org/pipermail/openbmc/2020-February/020452.html  

5. Redfish forum question: Direction for channel based restrictions - 
https://redfishforum.com/thread/279/channel-privilege-support-direction-redfish  

6. (Bruce via email):  BMCWeb Cert valid for 10 years - 
https://lists.ozlabs.org/pipermail/openbmc/2020-February/020488.html  

7. (Joseph / James / Richard email): Rate limiting, use pam_abl - 
https://lists.ozlabs.org/pipermail/openbmc/2020-February/020430.html  

8. (Joseph via email): New Redfish roles ServiceRep & OemRep - 
https://lists.ozlabs.org/pipermail/openbmc/2020-February/020540.html  

9. (Joseph email): Implement the Redfish PasswordChangeRequired property 
  https://lists.ozlabs.org/pipermail/openbmc/2020-February/020554.html  

10. (Joseph email): delete BMCWeb sessions after some kinds of account 
changes  
https://lists.ozlabs.org/pipermail/openbmc/2020-February/020555.html   


Access, agenda, and notes are in the wiki:

https://github.com/openbmc/openbmc/wiki/Security-working-group

- Joseph


