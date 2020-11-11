Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECC22AF355
	for <lists+openbmc@lfdr.de>; Wed, 11 Nov 2020 15:16:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWRcF73L1zDqvh
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 01:16:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YJUnjNta; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWRCz1q1KzDqYn
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 00:58:54 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ABDYO8W192686
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 08:58:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : from : subject :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=uVIHXlIDcY2SsI0qfRa+dk9p6HrKqmUCjhUqWtlvOBE=;
 b=YJUnjNtaLZUUbJqTsIftCN+iQs8bwocjC2BGh+TXsgzodu1i0i1rSEvGyjqnCbFY4QIN
 0B3fd8KLXqRP/Qq791MkdaGGsbDw1xnyVb+3nFS6s2hTVH0sVdx3Tq9oqs3D95bmOJgp
 3FUajhzo6YVkpwn+WNVQ70UBxPsZBixBvxl8O2/EjPEuX1gQO8871LC/pIgUr16Oewa+
 GIhqfS1bpo8g47X3SaQPXqEBFYPYJPNfaYN0URTJvbvpW35kQwUfLm2BG9jBFIquRPsD
 8ZtnVWP3ardq7ZyBnYHp+/DNbzmZw00aQyW2yy2NcVLKAvZRFOQw1X+Bkip6duBigVSV aw== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34r8a7735v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 08:58:50 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0ABDsNOB030503
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 13:58:49 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 34nk7r9hsq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 13:58:49 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0ABDwkOp66912738
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 13:58:47 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0D6E6A047
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 13:58:46 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F6A76A04D
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 13:58:46 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.80.230.176])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 13:58:46 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Security Working Group meeting today
Message-ID: <58c3081c-8867-ffe4-c65e-9bc9139b7587@linux.ibm.com>
Date: Wed, 11 Nov 2020 07:58:45 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-11_06:2020-11-10,
 2020-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 mlxlogscore=695
 lowpriorityscore=0 mlxscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011110079
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
scheduled for this Wednesday November 11 at 10:00am PDT.
Apologies if this is a duplicate email.

We'll discuss the following items on the agenda 
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
and anything else that comes up:

 1.

    Is OpenBMC ready to move from root to an admin account?  See
    https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/33847
    <https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/33847>

 2.

    The PAM_ABL module https://github.com/deksai/pam_abl
    <https://github.com/deksai/pam_abl>is no longer supported.  We had
    discussed using PAM_ABL to help prevent DoS.

 3.

    The CSIS
    <https://www.cloudsecurityindustrysummit.org/#documents>published a
    paper “A Case for a Trustworthy BMC
    <https://cloudsecurityindustrysummit.s3.us-east-2.amazonaws.com/a-case-for-a-trustworthy-bmc.pdf>”
    that gives recommendations for security.  A section analyzes how
    well the OpenBMC project meets these recommendations
    <https://cloudsecurityindustrysummit.s3.us-east-2.amazonaws.com/a-case-for-a-trustworthy-bmc.pdf#h.h0igu5dbvaun>. 
    I’ve added this to the OpenBMC security wiki.


Access, agenda and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group 
<https://github.com/openbmc/openbmc/wiki/Security-working-group>


