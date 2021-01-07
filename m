Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 077A02ED3AE
	for <lists+openbmc@lfdr.de>; Thu,  7 Jan 2021 16:43:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DBVrQ4BrbzDqZq
	for <lists+openbmc@lfdr.de>; Fri,  8 Jan 2021 02:43:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TQUwf90+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DBVqc51gFzDqX9
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jan 2021 02:42:51 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 107FX56F035662
 for <openbmc@lists.ozlabs.org>; Thu, 7 Jan 2021 10:42:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=ICnOiuAbmPkJVzGNbWrTO3uDoQp8mFkOxukeHnEUyyE=;
 b=TQUwf90+pIDGPT183mLw5mT5/ziHDhyaI/aCbzpvPrB7w6jaycyicBavKCjX7nGAuleC
 K8W2uqXZKzwVd6wjXroiP/KslChzUJ3B5KxU4IpxnU8Vqyl9BMm0U1wL9hP/uTuITXSK
 NK7ZR6k8gb05bNdrmyVtyFau4Q/6yNwPYAxn1lLddlqtJud946z8NqKZPdBs2F7UZpJ/
 4XXwSbmggQgUx1Ij+qJdAzLmnhbFLXyYXp9MKS9Qs2M29JknpPzHErGfg6thNYXr4RE6
 1sAQ/9WumNiijbslEv9OoolCvhcPG98t6hw/gQsS+dyri3NefB95OX0crPgr35L6Qyf7 Sg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35x510r977-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 07 Jan 2021 10:42:47 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 107FVlaq030220
 for <openbmc@lists.ozlabs.org>; Thu, 7 Jan 2021 15:42:47 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 35tgf9eufx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 07 Jan 2021 15:42:47 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 107FgkvI21889394
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 7 Jan 2021 15:42:46 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48CD6AE05C
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jan 2021 15:42:46 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15708AE060
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jan 2021 15:42:46 +0000 (GMT)
Received: from [9.160.45.31] (unknown [9.160.45.31])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jan 2021 15:42:45 +0000 (GMT)
From: Matt Spinler <mspinler@linux.ibm.com>
Subject: taking actions on thermal issues
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Message-ID: <1ffff04c-151a-eb75-08a1-51c3945e6294@linux.ibm.com>
Date: Thu, 7 Jan 2021 09:42:46 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-07_07:2021-01-07,
 2021-01-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101070097
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

Hi,

As I mentioned in 
https://lore.kernel.org/openbmc/d8116efd-678c-2450-1756-a0bacc470858@linux.ibm.com/, 
I need to take several different actions based on various sensor 
thresholds (just temperature for now) in the system.  The actions are 
things like:

* a hard power off after staged delays based on threshold alarms
* different phosphor-logging event logs based on which threshold alarm trips
* possibly setting other D-Bus properties to alert of things like throttling

I plan on putting this in a thermal-monitor app in the 
phosphor-fan-presence repo (this hopefully-soon-to-be-renamed repo 
already has multiple selectable applications and does more than fan 
presence).

The actions it takes will be selectable somehow, and if other people 
need to do other sorts of similar things, I think they could be added in 
here as well.

Thanks!
Matt
