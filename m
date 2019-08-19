Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B7094B2C
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 19:03:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46C0cj1L1KzDqrn
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 03:03:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46C0bm2St8zDqrn
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 03:02:43 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7JH2GpA146975
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 13:02:40 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ufx6mm7hj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 13:02:40 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7JH0Njp010348
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 17:02:39 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 2ue976famk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 17:02:39 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7JH2chH43516366
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 17:02:38 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F61AAC060
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 17:02:38 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31EE6AC05E
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 17:02:38 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 17:02:38 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: Initial expired passwords - low level designs
Message-ID: <b15904b6-aeaa-f3b1-1a62-ba7217727b79@linux.ibm.com>
Date: Mon, 19 Aug 2019 12:02:37 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-19_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908190180
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

This is an attempt to over-communicate progress on the [Initial expired 
passwords design][], currently in review.  This email has the 
significant and tricky work items needed to implement the design.  
Emails about the BMCWeb pieces that need to be changed are [here][]; in 
contrast, this email attempts to decompose the overall design.

[Initial expired passwords design]: 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/23849
[here][]: https://lists.ozlabs.org/pipermail/openbmc/2019-August/017625.html

The "initial expired passwords design" includes the following work. An 
understanding of that design is a pre-requisite to understand the items 
here.

1. Implement the new EXPIRED_PASSWORD image feature (initially off).  
This ensures the password is expired for all local users. The right 
place to do this piece is in Yocto/OpenEmbedded; see 
https://lists.yoctoproject.org/pipermail/yocto-security/2019-July/000114.html

2. Enhance BMCWeb to handle Redfish PasswordChangeRequired (reference: 
https://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1.7.0.pdf 
("Redfish Specification" version 1.7.0 or later) section 13.2.6.1).
This further breaks down into:

2a. Add the PasswordChangeRequired field to 
/redfish/v1/SessionManager/Sessions/<session>.  This new field comes 
from PAM_NEW_AUTHTOK_REQD.

2b. Add the PasswordChangeRequired field to 
/redfish/v1/AccountManager/Accounts/<account>.  Does this require D-Bus 
changes?

2c. Tweak the authority model to handle privilege ConfigureSelf which 
applies only to *your* Session or Account and is intended to encompass 
all the privileges needed change your own expired password.  I am 
pursuing this question in private Redfish forums (issue 1986).

2d. Tweak the authority for the 
/redfish/v1/AccountManager/Accounts/<account> "Password" property as a 
Redfish "property override".  The Password property needs to have a 
different authority than the other ManagerAccount properties in that 
same account.

3. Enhance phosphor-webui to handle the expired password dialog at 
login.  This will use the enhanced Redfish APIs. See 
https://github.com/ibm-openbmc/dev/issues/1048

4. Enhance Dropbear SSH so a user can change their expired password.  
See 
https://lists.ucc.gu.uwa.edu.au/pipermail/dropbear/2016q2/001895.html 
This piece is optional, but I would like this to be available.  The 
alternative is to use the OpenSSH server instead of Dropbear.  The right 
place to do this piece is in Dropbear.

- Joseph

