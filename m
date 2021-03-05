Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B94032DFFC
	for <lists+openbmc@lfdr.de>; Fri,  5 Mar 2021 04:15:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsCXd0Cvvz3d2x
	for <lists+openbmc@lfdr.de>; Fri,  5 Mar 2021 14:15:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MpCtC69K;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MpCtC69K; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsCXH5W5tz3cHr
 for <openbmc@lists.ozlabs.org>; Fri,  5 Mar 2021 14:14:54 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1253349S106417
 for <openbmc@lists.ozlabs.org>; Thu, 4 Mar 2021 22:14:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=qipRl1pGR7GZH5scNl9pCeQGeKYfMfblerzY/rqeahE=;
 b=MpCtC69KmIVjRSf+v9unWdVy1uBNceMlF9CYNe20osBErMhhTn7j+49Iu52Pj7/QtpLE
 xjxW4CClNpASImobVmwEqLeMv6MrixWWiLMMrJXkrcTfzrkUBfRF7d37w0U9s3Oq38na
 BYwXffrcej2EDPmqS/d9RNmXyaby1rKCWawySFmdam5BKcXZKuQ6zJu1rJBdLrn8coM7
 +zr7aXS2o6G/c95F813AhnLIp6rj9UAyob0gKlpgEfreJrSBRaPrVZhY8vKxg/vwJ9XP
 u0/OrS7MwCXOW6ESwmaixSMOjvOsuhHGoF2uNcX4IUMxIC7sVaZPTgo8O0/fElgHC00h gQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 373a2c3bd0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 04 Mar 2021 22:14:50 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1253727H019445
 for <openbmc@lists.ozlabs.org>; Fri, 5 Mar 2021 03:14:50 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 371qmv1ved-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 05 Mar 2021 03:14:49 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1253EmNP46268906
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 5 Mar 2021 03:14:48 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6233BE051
 for <openbmc@lists.ozlabs.org>; Fri,  5 Mar 2021 03:14:48 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73097BE04F
 for <openbmc@lists.ozlabs.org>; Fri,  5 Mar 2021 03:14:48 +0000 (GMT)
Received: from demeter.local (unknown [9.160.7.87])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Fri,  5 Mar 2021 03:14:48 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Request new repo for IBM-specific code
To: openbmc <openbmc@lists.ozlabs.org>
Message-ID: <b8af3438-f85a-cb82-c88c-9c4e120399e9@linux.ibm.com>
Date: Thu, 4 Mar 2021 21:14:47 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-04_09:2021-03-03,
 2021-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=918 lowpriorityscore=1 clxscore=1015
 adultscore=0 malwarescore=0 mlxscore=0 spamscore=0 bulkscore=1
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103050013
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

What is the right repository for a new Linux-PAM module to implement an 
IBM-specific ACF authentication?

The access control file (ACF) design was introduced to the OpenBMC 
security working group and is described in [IBM issue 1737][] and 
further explained in [IBM issue 2562][].

Note the [pam-ipmi modules][] are scoped to the OpenBMC project because 
the IPMI implementation is shared by all of OpenBMC.  By comparison, the 
proposed ibm-pam-acf module is intended only for IBM Enterprise 
systems.  The intended implementation is based on standard cryptography 
techniques and could be developed into a general authentication 
solution, but the ACF is specific to IBM in terms of its exact format 
and content, and I expect it will only be used by IBM and its partners.

Can we create a new OpenBMC repo for this?  Perhaps ibm-pam-acf?  Or 
should this go into some other repo?

- Joseph

[IBM issue 1737]: https://github.com/ibm-openbmc/dev/issues/1737
[IBM issue 2562]: https://github.com/ibm-openbmc/dev/issues/2562
[pam-ipmi modules]: https://github.com/openbmc/pam-ipmi
