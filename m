Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEBE2D3964
	for <lists+openbmc@lfdr.de>; Wed,  9 Dec 2020 05:02:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrNfw1R6DzDqjM
	for <lists+openbmc@lfdr.de>; Wed,  9 Dec 2020 15:02:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=l9ijo+4q; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrNdV6wstzDqn4
 for <openbmc@lists.ozlabs.org>; Wed,  9 Dec 2020 15:01:18 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B93X3CR100741
 for <openbmc@lists.ozlabs.org>; Tue, 8 Dec 2020 23:01:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : from : subject :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=RJY4ryuj37vrAqUYx/+JEL9tCMNDlX6wkNi89zSRrzQ=;
 b=l9ijo+4qWDtsFwNAHN+lsAeyUJYoZQk6FUQQUAvZfi7ghN2Vm1ipnATKGPnmDM/jKfpi
 1lRw+R+WmuxFQwGjj5laRK57T3lETTe+vsZWrOpDSSoN45YY47Ch1tUF0lN9p8RPn74A
 4lOqVDaSJkfEN3Aq+kF+gdU14enYU1opdipSW5ngqIJN6bRyh881e4Pnw+d/1rPDrLIJ
 EhOLvn95DRstHuO54z59JCN31XfLZ5YCLDg3S6mvnMM4xanxMufQL2PMCGplMaVvYSt+
 JMR/ADCaOrAwf7mcpVA3D9+bUdQ1zJbfmMmI8Csd63QaA1D1RTmyzLey9NUkNDRrjzRl Ig== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35agehsrwv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 08 Dec 2020 23:01:14 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B93pv3U028004
 for <openbmc@lists.ozlabs.org>; Wed, 9 Dec 2020 04:01:13 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 3581u9bt3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 09 Dec 2020 04:01:13 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B941Co316187658
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 9 Dec 2020 04:01:13 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6442AC062
 for <openbmc@lists.ozlabs.org>; Wed,  9 Dec 2020 04:01:12 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B935BAC05E
 for <openbmc@lists.ozlabs.org>; Wed,  9 Dec 2020 04:01:12 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.80.199.96])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed,  9 Dec 2020 04:01:12 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Security Working Group meeting - Wednesday December 9
Message-ID: <2cfae0a8-e691-fe24-835f-8254c6c93f19@linux.ibm.com>
Date: Tue, 8 Dec 2020 22:01:12 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_02:2020-12-08,
 2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=888 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090023
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
scheduled for this Wednesday December 9 at 10:00am PDT.

We'll discuss the following items on the agenda 
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
and anything else that comes up:


 1.

    Discord discussion #webui: Dumps and logs may contain sensitive
    information as documented
    herehttps://github.com/ibm-openbmc/dev/issues/1531#issuecomment-642238544
    <https://github.com/ibm-openbmc/dev/issues/1531#issuecomment-642238544>andhttps://github.com/openbmc/openbmc/wiki/Configuration-guide
    <https://github.com/openbmc/openbmc/wiki/Configuration-guide>

 2.

    Joseph: Proposed PerformService privilege enhancement to BMCWeb
    https://lore.kernel.org/openbmc/1bfe87ea-9fc5-8664-d1de-d3138616a427@linux.ibm.com/T/#u
    <https://lore.kernel.org/openbmc/1bfe87ea-9fc5-8664-d1de-d3138616a427@linux.ibm.com/T/#u>



Access, agenda and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group 
<https://github.com/openbmc/openbmc/wiki/Security-working-group>

