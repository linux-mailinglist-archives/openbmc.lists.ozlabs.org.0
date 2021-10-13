Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D650842CC67
	for <lists+openbmc@lfdr.de>; Wed, 13 Oct 2021 22:57:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HV4bj2kjXz2ywj
	for <lists+openbmc@lfdr.de>; Thu, 14 Oct 2021 07:57:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r+9L38BZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=r+9L38BZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HV4bC4xRnz2xtP
 for <openbmc@lists.ozlabs.org>; Thu, 14 Oct 2021 07:56:55 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19DJTVh0030993
 for <openbmc@lists.ozlabs.org>; Wed, 13 Oct 2021 16:56:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 message-id : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=R2LVGTxbqbD9SP4oUxWojDUklfOaZEJUolvPP1AVPgk=;
 b=r+9L38BZvRm4tScl75LW+LaOiA2uNJL8EKggAMPHDFaXaKqixeycc/4HuysoAZYOOdwR
 ES++Gjpo/YxmV4kLMk/dY4B+HPmQGDPaoeXKUlAhhW9PLV2nAIxzjjWLSLZUBxNA8eI+
 su3YKQKbteYIwSRRiH2Di2F/r+VSSbuq1RdaGDXHVYvO6yNlOUkxy/5ITHtwZ4/FeDrD
 SKjUIxjPbop0HZ8Yj5zFal+6TxzWab632S6jP2XC/AXm7xeECb7oawHJ5GrRSgejWuKQ
 0rJEE/qz6V9ma4hl31aCgFcsBDgrKuGuOa8Kx6tC9m0c9hVsNo73oA/bfB5Wyr5AVLe1 gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bnm419exx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 13 Oct 2021 16:56:51 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19DKumPZ012870
 for <openbmc@lists.ozlabs.org>; Wed, 13 Oct 2021 16:56:51 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bnm419ext-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 16:56:51 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19DKlTdW025997;
 Wed, 13 Oct 2021 20:56:50 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 3bnm3asfug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 20:56:50 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19DKunvV19726808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Oct 2021 20:56:49 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 558D76A08D;
 Wed, 13 Oct 2021 20:56:49 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 070176A0AE;
 Wed, 13 Oct 2021 20:56:48 +0000 (GMT)
Received: from demeter.local (unknown [9.160.18.190])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 13 Oct 2021 20:56:48 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>, Andrew Geissler <geissonator@gmail.com>
Subject: Start using github security advisories
Message-ID: <62b15edd-110a-3574-66c5-d11299bbd38c@linux.ibm.com>
Date: Wed, 13 Oct 2021 15:56:47 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: by3pqzvrD73LEftJv9AQ1gQUYJP0WjjY
X-Proofpoint-GUID: fbiTShmFAShO44JT02CvdABlPyiWHhGg
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-13_08,2021-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=905 phishscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110130123
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


Per today's Security working group meeting, we want to start using 
[GitHub security advisories][].  I think we need someone with admin 
permissions to github.com/openbmc/openbmc to create new advisories. Then 
we'll want a group (team? perhaps security-response-team) with the 
current OpenBMC [security response team][] members.  (I have that list.)

How do we get started?  Who has admin authority?

Joseph


[GitHub security advisories]: 
https://docs.github.com/en/code-security/security-advisories/about-github-security-advisories
[security response team]: 
https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team-guidelines.md

