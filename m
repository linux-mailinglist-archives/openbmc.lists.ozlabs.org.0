Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8492163886
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2019 17:21:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jmHv0HvpzDqQt
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2019 01:21:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jmH928fjzDqKK
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2019 01:20:52 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x69FDdmv071165
 for <openbmc@lists.ozlabs.org>; Tue, 9 Jul 2019 11:20:49 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tmw60h756-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 09 Jul 2019 11:20:49 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x69FAKH2027510
 for <openbmc@lists.ozlabs.org>; Tue, 9 Jul 2019 15:20:48 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01dal.us.ibm.com with ESMTP id 2tjk975ru6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 09 Jul 2019 15:20:48 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x69FKlMN52363694
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 9 Jul 2019 15:20:47 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B16E6A047
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jul 2019 15:20:47 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 197DE6A04D
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jul 2019 15:20:47 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jul 2019 15:20:46 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: Security Working Group meeting - Wednesday July 10
Message-ID: <178abb88-594e-1c23-bf09-3636e6e9ec2b@linux.ibm.com>
Date: Tue, 9 Jul 2019 10:20:46 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-09_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=825 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907090180
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
scheduled for this Wednesday July 10 at 10:00am PDT.

* * * The call-in access is new/changed for this meeting - details below 
* * *

Current topics:
- Development work (including approved network security considerations)
- BMC use cases
- Release planning input


Access, agenda, and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group

- Joseph

The Security Working Group meeting access is changing.  The old access
will not be used.  The new access is given in the wiki and in this
email.  This is effective immediately, so please update your calendars.
Here is the information for the web video conference and telephone access:
- Join via Web:https://ibm.webex.com/meet/joseph.reynolds1
- Join via Phone: Use access code: 927 034 486 -- United States Toll
Free: 1-844-531-0958. Click here for other phone numbers
<https://ibm.webex.com/cmp3300/webcomponents/widget/globalcallin/globalcallin.do?siteurl=ibm&serviceType=MC&ED=756982637&tollFree=1>
- Visit the Webex web site for more ways to join or for an updated
access code.


