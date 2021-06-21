Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 907E43AF508
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 20:26:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7ydq2Nj3z306r
	for <lists+openbmc@lfdr.de>; Tue, 22 Jun 2021 04:26:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gg8ReDap;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gg8ReDap; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7ydT4XVyz2yxY
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jun 2021 04:25:49 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15LI2eMJ168380; Mon, 21 Jun 2021 14:25:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : cc : from : subject
 : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=vk1XYgpsrOo7S5Z+hRYxzrqwLDgV5TNqAI287I0Z88I=;
 b=gg8ReDapETaEZQ9NbZ/YPAqDqubHQyzNXHGWtV76K5AKN4iq25KPPb9+4ikSOz5qIW4b
 2xaSaIAJ0kgfoLEbPaPes4zB18kKSrcEdnepEzQ1MpXiP40b/zQLEX2Iq6kMY9fE600L
 MQBVxR78KH6lWDzPh966RVPlHCg9Zg81KMVfb7M6FD+Qn9HWF5krL9LGFXFwnoKmuA+s
 zfXuU0V/DmrncpkXwfOaeFIHbtIscz8oZpYIgZdgeW0gf50dP2f/vS6zyVBmbIPMX9QW
 SVEPXN7q6/57nhfieQeCACu92NkK4rcjnudkVlCWcm0NE0u70FeaYTercBVPjsTlLqXm ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39avbj7qs1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 14:25:45 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15LI2oiV169018;
 Mon, 21 Jun 2021 14:25:45 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39avbj7qrr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 14:25:45 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15LI83eW030563;
 Mon, 21 Jun 2021 18:25:43 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 399wjfx1p0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 18:25:43 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15LIPgWr33554722
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Jun 2021 18:25:42 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D476AE05F;
 Mon, 21 Jun 2021 18:25:42 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E6C4AE05C;
 Mon, 21 Jun 2021 18:25:42 +0000 (GMT)
Received: from [9.211.34.94] (unknown [9.211.34.94])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 21 Jun 2021 18:25:42 +0000 (GMT)
To: Ed Tanous <edtanous@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
Subject: Which should happen first dbus-sensors or the entity-manager commit?
Message-ID: <d2b7b847-de8a-8cc4-5c64-98721b075deb@linux.vnet.ibm.com>
Date: Mon, 21 Jun 2021 11:25:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Qg-wyG8bsy1OaPM0koBQe5iRJCQ7SVqH
X-Proofpoint-ORIG-GUID: lSadm1QIhZ_pDQoZOaryKJOagCARzbEu
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-21_10:2021-06-21,
 2021-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106210106
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
Cc: Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ed,

Which Gerrit Review commit should happen first dbus-sensors
(that depends on entity-manager) or the entity-manager commit?

My dbus-sensors has to have the entity-manager "Exposes" in
order to operate and give reading.

Thank you.

-- 
Bruce
