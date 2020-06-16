Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 010561FBFC4
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 22:14:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mfYS26TkzDr0B
	for <lists+openbmc@lfdr.de>; Wed, 17 Jun 2020 06:14:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mfXd33WhzDqnx
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2020 06:13:36 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05GJVxWD060454; Tue, 16 Jun 2020 15:48:06 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31pux0jgad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 15:48:06 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05GJiCEE025541;
 Tue, 16 Jun 2020 19:48:05 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 31q26f9mk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 19:48:05 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05GJl54o15074070
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jun 2020 19:47:05 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C7B12805A;
 Tue, 16 Jun 2020 19:47:05 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA81C28060;
 Tue, 16 Jun 2020 19:47:04 +0000 (GMT)
Received: from [9.85.179.235] (unknown [9.85.179.235])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jun 2020 19:47:04 +0000 (GMT)
From: Matt Spinler <mspinler@linux.ibm.com>
Subject: Message registries continuation
To: James Feist <james.feist@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Message-ID: <74794819-3b3c-0c39-30e0-b2ca6c46d9fb@linux.ibm.com>
Date: Tue, 16 Jun 2020 14:47:04 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_11:2020-06-16,
 2020-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 cotscore=-2147483648 lowpriorityscore=0 spamscore=0 suspectscore=0
 malwarescore=0 clxscore=1011 adultscore=0 phishscore=0 mlxlogscore=971
 mlxscore=0 priorityscore=1501 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006160134
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

Hi James,

Picking up the discussion again from 
https://lists.ozlabs.org/pipermail/openbmc/2020-February/020620.html
about reading  in message registries...

When this was left off, I believe we were leaning toward being able to 
copy message registry JSON files
into some target directory on the BMC during the build where bmcweb 
would load them on startup
and leave them in their JSON objects, and they would be pulled from 
there when LogService requests
were made.

This was to be able to support multiple languages, and in general just 
to support other registries besides
the existing OpenBMC one that is hardcoded in a header file.  (We're 
going to have an IBM registry we
use together with our D-Bus logs based LogService.)

An open issue we still had was if these registries had to be validated, 
or if that was left to whoever
made them.  A stake in the ground could be that we leave the OpenBMC 
registry as it is in a header
file, which negates validation, or put it in JSON too and validate just 
that one during the build.
Or if there are any other ideas here...

As far as the directory used, I think that /usr/share/bmcweb/ would be 
appropriate, or maybe
/usr/share/bmcweb/registries/ if either of those are OK with you.

Also, it may be overkill to need to  read in the same registry for every 
language, as there could
be dozens and realistically they will never all be used on a single 
system, but if the desire is only
to load them at startup before the current language is known I don't 
really see a way around it.

Thanks!
Matt
