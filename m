Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA04243F39
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 21:16:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSGWl579pzDqgq
	for <lists+openbmc@lfdr.de>; Fri, 14 Aug 2020 05:16:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PcAMpL5o; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSGVv3cC7zDqg3
 for <openbmc@lists.ozlabs.org>; Fri, 14 Aug 2020 05:15:34 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07DJ5KJ2139216; Thu, 13 Aug 2020 15:15:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=x0BE3CpCKzvoX4Kb5z3Tx0i/m7/27eOPwzkO6ulQUzU=;
 b=PcAMpL5odrwafKZDc1xI2bfygiR3H0tBrD8gz1Gyp/3/aGDD4xSVE5GA80DqTApRW947
 CVclyLqvGCsnw70DF1oeEgIDVNM/PzbMJ/orzd0UVV64bn5RrpD8bwzOtw9b5ZHSixl1
 Sz93zfYLCBvGE6Q0Qhie91YbvFRRABZ6vR/b3Qmh98z82Wn2vkJSnXye9+UrgH+GPwyg
 eY3zUhR+wwPyNe9swKSKmc/NfSWHe43zJSFQSdl0nd7tkjmT6kBqmkxszoBm8nma3uCv
 rEuoTQjv6qi+JOYsXbnbVlUkfh6PlJHcdzieVTWbCHqQBCh+6iKAJldrqJ5OOZFYIOqx iQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32w6vcgkn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 15:15:29 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07DJFJpm008367;
 Thu, 13 Aug 2020 19:15:28 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 32skp9yje3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 19:15:28 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07DJFNBK65405256
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Aug 2020 19:15:23 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 393046E054;
 Thu, 13 Aug 2020 19:15:27 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5D946E053;
 Thu, 13 Aug 2020 19:15:26 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.80.201.154])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 13 Aug 2020 19:15:26 +0000 (GMT)
Subject: Re: BMCWeb payloads larger than than 64MB
To: Ed Tanous <ed@tanous.net>
References: <cf68b3d3-9f1d-0f2e-cfa2-98afde52e243@linux.ibm.com>
 <e736ad6d-66fd-f24f-b1e5-74cc2c71e856@linux.ibm.com>
 <9d648ded-ed67-da73-1fa9-084cdc02713c@linux.ibm.com>
 <CACWQX809XrsH_HDo-7AEpX3YBWZboq8qeTS3JVA2fjLve4hikg@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <d24fa69f-ae1c-9384-2c22-6271058bddee@linux.ibm.com>
Date: Thu, 13 Aug 2020 14:15:25 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACWQX809XrsH_HDo-7AEpX3YBWZboq8qeTS3JVA2fjLve4hikg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_15:2020-08-13,
 2020-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=657 phishscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008130131
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Ed Tanous <ed.tanous@intel.com>,
 James Feist <james.feist@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Ed,

Thanks for the info!  That is what I was looking for.

- Joseph

