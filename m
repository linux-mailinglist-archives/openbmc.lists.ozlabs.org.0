Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8422E737BE
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 21:20:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45v4v56PklzDqMK
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 05:20:49 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45v4tL24jxzDqLW
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 05:20:08 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6OJK098130941
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 15:20:04 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2txv0hupke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 15:20:02 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x6OJFH8D002117
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 19:18:58 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 2tx61n8se5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 19:18:58 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6OJIvEn29098338
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 19:18:57 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5CE96A054
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 19:18:56 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1ED16A047
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 19:18:55 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 19:18:55 +0000 (GMT)
Subject: Re: Security Working Group - Wednesday July 24 - results
To: openbmc@lists.ozlabs.org
References: <ee35ab16-f95b-f51b-956f-fb07b2234aaf@linux.ibm.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <e20a1db2-9fcf-b48b-1289-3e7d96a07002@linux.ibm.com>
Date: Wed, 24 Jul 2019 14:18:54 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ee35ab16-f95b-f51b-956f-fb07b2234aaf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-24_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907240206
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


> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday July 24 at 10:00am PDT.
>
> * * * The call-in access changed on July 10 (the previous meeting) - 
> details below * * *
>
> Current topics:
> - Development work (including approved network security considerations)
> - SPDM
> - Default user config: root, ipmi group, password limited to char[20]

We discussed using the emerging SPDM standard which negotiates security 
with other endpoints via MCTP/PLDM or similar (example: trusted platform 
module (TPM), or host firmware elements). As OpenBMC uses MCTP/PLDM we 
would naturally be interested in using the SPDM standard.

We discussed changing OpenBMC's default users, for example, root/0penBmc 
is in the IPMI group. Joseph will push a design for this. We discussed 
difficulties in how to identify and track security fixes (as CVEs) as 
they flow into OpenBMC from Yocto and other upstream projects. We 
touched on how Yocto long term support (LTS) might be desirable. Joseph 
advertised the BMC Threat Model review: 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/22404- Joseph
> Access, agenda, and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group
>
> - Joseph
>
> The Security Working Group meeting access changed on July 10.  The old 
> access
> will not be used.  The new access is given in the wiki and in this
> email.  This is effective now, so please update your calendars.
> Here is the information for the web video conference and telephone 
> access:
> - Join via Web:https://ibm.webex.com/meet/joseph.reynolds1
> - Join via Phone: Use access code: 927 034 486 -- United States Toll
> Free: 1-844-531-0958. Click here for other phone numbers
> <https://ibm.webex.com/cmp3300/webcomponents/widget/globalcallin/globalcallin.do?siteurl=ibm&serviceType=MC&ED=756982637&tollFree=1> 
>
> - Visit the Webex web site for more ways to join or for an updated
> access code.
>

