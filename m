Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F071A0FC6
	for <lists+openbmc@lfdr.de>; Tue,  7 Apr 2020 17:00:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xVv170xDzDr76
	for <lists+openbmc@lfdr.de>; Wed,  8 Apr 2020 00:59:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xVsC1FC4zDqTg
 for <openbmc@lists.ozlabs.org>; Wed,  8 Apr 2020 00:58:21 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 037EYgoJ040624
 for <openbmc@lists.ozlabs.org>; Tue, 7 Apr 2020 10:58:18 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3082hgu322-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 07 Apr 2020 10:58:18 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 037Evrwf031842
 for <openbmc@lists.ozlabs.org>; Tue, 7 Apr 2020 14:58:17 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 306hv6gu2s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 07 Apr 2020 14:58:17 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 037EwGaL52101468
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Apr 2020 14:58:16 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89515112061;
 Tue,  7 Apr 2020 14:58:16 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FC69112063;
 Tue,  7 Apr 2020 14:58:16 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.171.253])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue,  7 Apr 2020 14:58:16 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Why does OpenBMC use Avahi mDNS instead of SSDP?
Message-ID: <64ed3841-fc25-50d2-5353-d778301ce06d@linux.ibm.com>
Date: Tue, 7 Apr 2020 09:58:15 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_07:2020-04-07,
 2020-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxlogscore=939 spamscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004070127
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
Cc: Gunnar Mills <gmills@linux.vnet.ibm.com>,
 ratagupt <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Redfish specifies SSDP [1] [2] as the standard discovery service but 
OpenBMC uses the Avahi mDNS discovery service [3].  I asked Redfish to 
add mDNS to the spec [4] but they don't want to, and pointed to their spec.

I want to allow the BMC admin to enable and disable the mDNS discovery 
service.  How can this be done?  Options:
1. Implement ManagerNetworkProtocol.Oem.OpenBMC.mDNS.
2. Move OpenBMC to SSDP and away from mDNS.
3. Re-ask Redfish to add a ManagerNetworkProtocol.mDNS protocol.

What is best for the project?

- Joseph

[1]: Redfish spec DSP0266 version 1.9.0 section 5.6.4 "Service Discovery".
[2]: Redfish ManagerNetworkProtocol.SSDP version 1.4.2
[3]: 
https://github.com/openbmc/docs/blob/master/designs/management-console/service_discovery.md
[3]: https://redfishforum.com/thread/267/add-avahi-managernetworkprotocol

Note: This email refreshes a previous thread archived here:
https://lists.ozlabs.org/pipermail/openbmc/2020-April/021170.html

