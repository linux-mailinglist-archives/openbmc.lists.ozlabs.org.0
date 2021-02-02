Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB11C30D1A9
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 03:38:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVm8N6HvxzDrcP
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 13:38:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fKLt/+fW; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVW7D53PczDq9s
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2021 03:51:51 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 112GZHsC027943
 for <openbmc@lists.ozlabs.org>; Tue, 2 Feb 2021 11:51:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : from : subject :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=Jp4tzkgqQzJ2nmppjBx2s2O8rOax3csf9R5cxTUz/1U=;
 b=fKLt/+fWcok0bD9fvqDdUhyMtMtBMdfCvp37vGCkuAF2oSzik+kezjWKsIovdwdTkzPR
 98VAGZMZXhi09jtLEfrxMIJTy3EyhH38nU0men9xFm2dlFYmPfJtRtqAawK3UFzPF//X
 9YkNzr1COIDbjv8wGm/G1hyGnvA4RFLmAavdJ0YXwa80jsDhjnFJRkPkYCqz8MhNtini
 kSGRlVZMh2py2ab/s19PMk3vNgm9uIwhztxDAFrJueeFzyU/7ir3qirB0HOkp1nd3+vf
 6caCfbX0M0fVpKhoSnrL3mtRRlaXjiFeKBvPDD0eUvPwjnDh1pLUvaz3lVaI67ySYr72 fg== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36f988bekc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 02 Feb 2021 11:51:47 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 112Gm7i6016110
 for <openbmc@lists.ozlabs.org>; Tue, 2 Feb 2021 16:51:46 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 36f2nwu66v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 02 Feb 2021 16:51:46 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 112GpkaZ27525626
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 2 Feb 2021 16:51:46 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69C14124052
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2021 16:51:46 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D615124053
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2021 16:51:46 +0000 (GMT)
Received: from demeter.local (unknown [9.80.194.248])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2021 16:51:46 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Security Working Group meeting - Wednesday February 3
Message-ID: <e42da574-888d-cc33-3f7f-80c8cef4dac0@linux.ibm.com>
Date: Tue, 2 Feb 2021 10:51:45 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-02_08:2021-02-02,
 2021-02-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxlogscore=775
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102020108
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
scheduled for this Wednesday February 3 at 10:00am PDT.

We'll discuss the following items on the agenda 
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
and anything else that comes up:

1. Continue to discuss APIs to disable HTTPS 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39006 
<https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39006>

2. Review Linux-PAM changes 
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/40102 
<https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/40102> and 
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-user-manager/+/39853 
<https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-user-manager/+/39853> 


3. Discuss plans for IBM Enterprise system “service” login support.
3a. Implement restricted roles and restricted privileges per Redfish 
spec DSP0266 1.12.0 aka 2020.4 
https://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1.12.0.pdf 
<https://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1.12.0.pdf> 

3b. Story here: https://github.com/ibm-openbmc/dev/issues/1756 
<https://github.com/ibm-openbmc/dev/issues/1756>
3c. Need a special REST API to require variable privileges: 
https://github.com/ibm-openbmc/dev/issues/2875 
<https://github.com/ibm-openbmc/dev/issues/2875>

4. Need help for 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39756 
<https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39756> ?

5. (Discord > OpenBMC > #yocto 2021-02-02) Security concerns using a 
sstate cache.


Access, agenda and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group 
<https://github.com/openbmc/openbmc/wiki/Security-working-group>
