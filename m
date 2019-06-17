Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B386848934
	for <lists+openbmc@lfdr.de>; Mon, 17 Jun 2019 18:45:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SHBr5pq3zDqXl
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 02:45:24 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SHB960jwzDqW4
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 02:44:49 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5HGgLMw121841
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 12:44:45 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t6bmh8jfr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 12:44:45 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.ibm.com>;
 Mon, 17 Jun 2019 17:44:43 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 17 Jun 2019 17:44:40 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5HGidp624314360
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 16:44:39 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9446EAC05F
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 16:44:39 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43680AC059
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 16:44:39 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 16:44:39 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Mon, 17 Jun 2019 11:46:10 -0500
From: Joseph Reynolds <jrey@linux.ibm.com>
To: Openbmc <openbmc@lists.ozlabs.org>
Subject: Move away from default password
X-Sender: jrey@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19061716-0052-0000-0000-000003D20D70
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011279; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01219338; UDB=6.00641356; IPR=6.01000480; 
 MB=3.00027346; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-17 16:44:41
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061716-0053-0000-0000-0000615BAC25
Message-Id: <1164a9a82b2b59087059c59391e65d04@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-17_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906170148
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

There is some interest in moving OpenBMC away from a default password.
- email: 
https://lists.ozlabs.org/pipermail/openbmc/2019-June/016515.html  (which 
references a RestrictionMode design: 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/21195)

Having a default password is a security risk.  Note that changing to a 
different default password is not a good solution.  For example, if a 
bad actor learns the default password from one device, that actor will 
likely know the password for many of them.

I am exploring two options for OpenBMC, and want your feedback.

1. Unique password per BMC.
In this approach, there is a way to change the factory default password. 
  Example flow: assemble the BMC, test it, factory reset, generate unique 
password (such as `pwgen`), then use a new function “save factory 
default settings” which would save the current setting into a new 
“factory settings” flash partition.  After that, a factory reset 
would reset to the factory installed password, not to the setting in the 
source code.
Presumably the new factory default would be printed on a sticker, or 
something.
Are there any other factory settings (settings unique to each device) 
that would benefit from being set like this?
One downside to this approach is someone who orders 100 systems has to 
enter 100 unique passwords.

2. Create new account on first access.
Specifically, default OpenBMC to use a new RestrictionMode=SetupAccess 
which:
  - (A) requires users to set up their credentials (at least: remove the 
default password) before they can leave that mode, and
  - (B) does not let the user do anything else, including other 
provisioning or operating the host, while in this mode.
So we could manufacture the BMC with a default password, but require it 
to be changed as the first step to provision the BMC.
We might want to make network services react to this new mode, for 
example, the phosphor-webui GUI would likely want to handle this 
specially, and most REST APIs would be restricted.
Note this approach gives an attacker a window of time before the 
credentials are set up.

I believe both of these approaches represent reasonable security 
practices which may satisfy laws regarding consumer products.  For 
example, CA Law SB-327 
https://leginfo.legislature.ca.gov/faces/billTextClient.xhtml?bill_id=201720180SB327

Are there guidelines we can follow?  Can you find additional 
vulnerabilities with these approaches?  Can we do better than this 
without requiring additional infrastructure?

I plan to discuss this at the 2019-06-26 Security working group meeting: 
https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/
and would be happy to see ideas here.

- Joseph

