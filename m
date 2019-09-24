Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E732DBCA85
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 16:45:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46d3rw3Fs5zDqR1
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 00:45:36 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46d3r33THMzDqTM
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 00:44:50 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8OEd9Kv072334
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 10:44:43 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v7m1bkd7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 10:44:43 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8OEeU9P029853
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 14:44:42 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 2v5bg74mch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 14:44:42 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8OEifuD41091534
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Sep 2019 14:44:41 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EF45112063;
 Tue, 24 Sep 2019 14:44:41 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9CE5112061;
 Tue, 24 Sep 2019 14:44:40 +0000 (GMT)
Received: from demeter.local (unknown [9.85.182.133])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 24 Sep 2019 14:44:40 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>, jen.spatz@ibm.com
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Resend: 32 character minimum password requirement
Message-ID: <76299dcf-7dfb-000f-022b-af2d08909336@linux.ibm.com>
Date: Tue, 24 Sep 2019 09:44:40 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-24_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909240143
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

I am re-sending this email from Jen Spatz in plain text (not HTML) so 
more people will be able to read it.  There was some discussion recently 
in  IRC about this topic.  The original email is archived here:
https://lists.ozlabs.org/pipermail/openbmc/2019-September/018173.html

------- begin message:

We’ve created design mockups for the 32 character minimum password 
requirement in the Add/Modify modal. We’d appreciate your feedback.

Context:
IPMI requires a password of 20 characters or less. But, some customers 
have a 32 character minimum password required for ROOT accounts.


Designs:

In “Add User” modal:
If user password exceeds 20 characters, validation text notifies the 
admin/user that:
      1. their initial password is too long
      2. they will later have the opportunity to change their password 
to a longer length
Prototype: Add User Modal

In “Modify User” modal
If user password is changed to a length of over 20 characters, a warning 
notifies the admin/user that a password of 21 characters or more will 
result in the user losing IPMI access

Prototype: Modify User Modal



These particular prototypes are not interactive.

To comment, please click on the bottom right of the screen where it says 
“Comments”



Github Issue:

https://github.com/openbmc/phosphor-webui/issues/93

Thanks very much,
Jen + GUI Design Team
