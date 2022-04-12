Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B92B4FE5F3
	for <lists+openbmc@lfdr.de>; Tue, 12 Apr 2022 18:35:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdBDW3rcYz3bWf
	for <lists+openbmc@lfdr.de>; Wed, 13 Apr 2022 02:35:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=czHEJafT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=czHEJafT; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdBD52kr5z2yh9
 for <openbmc@lists.ozlabs.org>; Wed, 13 Apr 2022 02:35:33 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23CGPGl3012260
 for <openbmc@lists.ozlabs.org>; Tue, 12 Apr 2022 16:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : references : to : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=e3jGFWUGTH5HOAy2p2BtLru5uH5IRny9rLpy5HVFHik=;
 b=czHEJafTj+tPNHRXJhqkIrGgb41uap8MRLqdwE4MjSC4y9mbwuZ4e0sbPvfOJays6tNe
 DSZASZyaHfA6bMlGIkOyqKVukBlmzad9TDH690x6xMuythmcr6Z4pwb5PgursbhMMlrZ
 TKObZF61XMebCiXyV29hlf8PRpo1ivcll5Y8MqvWSImJMlbQbVACW3x4i+rQDGMI+/Kx
 czd9FmQQ//gVM7y8FLLEc1WvpSX/X38Tj6+eUp/+7LjoqHM53qzJ+KMBmd/XeFzcWOLl
 +QTQoZvbMfQJVCrlHX5+SJ8xz+aOJgk+vfhkKuuZE2ootVteW+4/qGBTAIy/rkgE1qdM gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fdcx788er-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 12 Apr 2022 16:35:30 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23CGP9dT012105
 for <openbmc@lists.ozlabs.org>; Tue, 12 Apr 2022 16:35:30 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fdcx788ec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 16:35:30 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23CGWApp017950;
 Tue, 12 Apr 2022 16:35:29 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 3fb1s9qq1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 16:35:29 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23CGZTnA25625070
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Apr 2022 16:35:29 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0872B2068;
 Tue, 12 Apr 2022 16:35:28 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B29ABB2065;
 Tue, 12 Apr 2022 16:35:28 +0000 (GMT)
Received: from [9.160.0.223] (unknown [9.160.0.223])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 12 Apr 2022 16:35:28 +0000 (GMT)
Message-ID: <9e907d43-4d45-ab8c-9b75-7d9347bd1822@linux.ibm.com>
Date: Tue, 12 Apr 2022 11:35:27 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Fwd: Security Working Group meeting - Wednesday April 13 - SELinux
Content-Language: en-US
References: <04f7f71d-16db-ce88-f359-f7d60c0a798e@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>, Anton Kachalov <gmouse@google.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <04f7f71d-16db-ce88-f359-f7d60c0a798e@linux.ibm.com>
X-Forwarded-Message-Id: <04f7f71d-16db-ce88-f359-f7d60c0a798e@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 43tNVzGzWSChyKd2Tzxne4-GLmcM9W3M
X-Proofpoint-ORIG-GUID: 3_mPeh7UFo2jqOJCzmuVIbjK7-F7Ytg1
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-12_06,2022-04-12_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 spamscore=0 malwarescore=0 mlxlogscore=896 priorityscore=1501
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204120079
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

Anton,

Folks from IBM research are planning to attend the OpenBMC Security 
Working Group meeting to learn more about how to apply SELinux to 
OpenBMC.  I understand this is an alternate solution to the work you had 
started here: 
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/42748 
<https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/42748> and 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/49100 
<https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/49100>.

Joseph


-------- Forwarded Message --------
Subject: 	Security Working Group meeting - Wednesday April 13
Date: 	Tue, 12 Apr 2022 11:28:24 -0500
From: 	Joseph Reynolds <jrey@linux.ibm.com>
To: 	openbmc <openbmc@lists.ozlabs.org>



This is a reminder of the OpenBMC Security Working Group meeting 
scheduled for this Wednesday April 13 at 10:00am PDT.

We'll discuss the following items on the agenda 
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
and anything else that comes up:

1. Renewed interest in securing D-Bus interfaces and using SELinux.




Access, agenda and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group 
<https://github.com/openbmc/openbmc/wiki/Security-working-group>

- Joseph

