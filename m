Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD2C2D9EF8
	for <lists+openbmc@lfdr.de>; Mon, 14 Dec 2020 19:28:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cvqdm14W3zDqLq
	for <lists+openbmc@lfdr.de>; Tue, 15 Dec 2020 05:28:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=M49ayd8+; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cvqct2lWrzDq9L
 for <openbmc@lists.ozlabs.org>; Tue, 15 Dec 2020 05:27:41 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BEI27JQ083426; Mon, 14 Dec 2020 13:27:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : cc : from : subject
 : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=3tWy96qhWAT2SQptav5uv3/t03fgxXQue88kslZ1XpY=;
 b=M49ayd8+N6wXu/t1EYEbPWOYSFWM/cSEnbvk/BucFXtQA3KYZQgT1a4InGQR3pvznWVh
 OvdgUuzjG62ZcaSsYlEhZNNtaooiFNN6fLyJwmw4QevhtN9JLAzh1YA4KJLlsQMDw2fv
 P5glkcjiKrRffS6732weNeUaZSldbO5kq6bw2niZKhJFH0qZnOrRJ6Ca0htvlb/2xqX6
 HOzdDf8B91mN8HFTNUMBMcmwR0iiueQMlApK9lFqpJCRa/hQSEH54wPmW766TCzRNVsy
 PVk2uDPTHCHmdW+p+UBCTKWaeL2GAvqjdIng4vfOP7pDxGMl+B+TdDF+1bhL5Epx00K4 2w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35ea24ycsy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Dec 2020 13:27:35 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BEIOGvU171000;
 Mon, 14 Dec 2020 13:27:34 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35ea24ycsm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Dec 2020 13:27:34 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BEII1Uc003785;
 Mon, 14 Dec 2020 18:27:34 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04wdc.us.ibm.com with ESMTP id 35cng8su5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Dec 2020 18:27:34 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BEIRX3710420652
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Dec 2020 18:27:33 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C1ADC6061;
 Mon, 14 Dec 2020 18:27:33 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0633C6057;
 Mon, 14 Dec 2020 18:27:30 +0000 (GMT)
Received: from [9.102.38.236] (unknown [9.102.38.236])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 14 Dec 2020 18:27:30 +0000 (GMT)
To: raviteja28031990@gmail.com
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Subject: Depreciate PATCH support for HostName at NetworkProtocol
Message-ID: <757e2adb-4f63-30f2-3f53-0f25bd990a72@linux.vnet.ibm.com>
Date: Mon, 14 Dec 2020 11:27:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-14_09:2020-12-11,
 2020-12-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 mlxlogscore=823 bulkscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012140119
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>, rbailapu@in.ibm.com,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>, johnathanx.mantey@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ravi,

I believe you implemented PATCH support for HostName at 
/redfish/v1/Managers/bmc/NetworkProtocol

https://github.com/openbmc/bmcweb/commit/501be32b4230dfa2730467985c6306f15fe7af61

Looking for some background around the commit. Do you know why this was 
added? Do you know if any clients are PATCHing HostName here?

HostName at /redfish/v1/Managers/bmc/NetworkProtocol is a read-only 
property and PATCH support here violates the Redfish spec.

HostName at /redfish/v1/Managers/bmc/EthernetInterfaces/<str> is a 
read-write property and can be PATCHed. This is what webui-vue uses.

Still discussion on how we would depreciate this PATCH support on
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/38475

Does anyone know of a client PATCHing HostName at the NetworkProtocol 
resource?

https://redfish.dmtf.org/schemas/v1/ManagerNetworkProtocol.v1_6_1.json
https://redfish.dmtf.org/schemas/v1/EthernetInterface.v1_6_2.json


Thanks,
Gunnar
