Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 243B12FBE5E
	for <lists+openbmc@lfdr.de>; Tue, 19 Jan 2021 18:57:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKxFp4hH4zDr3p
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 04:57:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=s7Qp1IjY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKxDp3pS9zDr2g
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 04:56:57 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10JHhD5k058496
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2021 12:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : from : subject :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=yAxjtPeJqAgoG9u+aOoTBXihWyVGqF58uLsAuwaX6lM=;
 b=s7Qp1IjYaaiT0Ttukc0VMbei9CoiYza7W9AIwcXSP4L9OLISLh2I3x0I/Y1TihdYX6Ol
 AcMuHLKeNpoLlIpvBmpa1wZO7/+J3uDTxEuH46JYanl+2h0z+RnnZE1Mb0M8ox9NP5gr
 dpf3Yg59p0/7cNpV71lcawttvwsmjX4TrRW8QXZacUkV5CYBPiwxBgf2AtmS9iTjCMS0
 kbRbVShXowMm/c3R0V0Jq375SB8Ar486Uc6DIbBKIbfyJAr2e3AlXRZ7TLjZnYyY5w8X
 MzVuDAUB8EpBiWhDA1Q/DnI8tChU1JXf01ocEbivGb1FK24T9yl8Gm78rX9fbHQzffhU sQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36642qgbcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2021 12:56:55 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10JHkVpA027446
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2021 17:56:54 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 363qs90066-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2021 17:56:54 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10JHusuB25231694
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2021 17:56:54 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67203AC05B
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2021 17:56:54 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BDFBAC059
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2021 17:56:54 +0000 (GMT)
Received: from demeter.local (unknown [9.85.146.197])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2021 17:56:54 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Security Working Group - Wednesday January 20
Message-ID: <26909931-a316-f283-12a5-cf3892d15e06@linux.ibm.com>
Date: Tue, 19 Jan 2021 11:56:53 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_07:2021-01-18,
 2021-01-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 adultscore=0 mlxlogscore=480 priorityscore=1501 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190099
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
scheduled for this Wednesday January 20 at 10:00am PDT.

We'll discuss the following items on the agenda 
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
and anything else that comes up:

 1.

    (email) Call for OpenBMC 2.9.0 release.

 2.

    Yocto email: Dropped openssl support for deprecated algorithms,
    including TLS 1.0 and TLS 1.1.  I (Joseph) believe we already have
    dropped TLS below TLSv1.2, but let’s take a look to see if we want
    any changes in this area.

 3.

    (gerrit review): Does anyone have a use case to allow customers to
    disable HTTPS?
    https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39006
    <https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39006>

 4.

    (gerrit review): Linux-PAM dropped support for pam_cracklib and
    pam_tally2.  These are being removed from OpenBMC usage because they
    are no longer available from yocto, but the function is not yet
    replaced.  See https://github.com/openbmc/openbmc/issues/3750
    <https://github.com/openbmc/openbmc/issues/3750>.


Access, agenda and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group 
<https://github.com/openbmc/openbmc/wiki/Security-working-group>
