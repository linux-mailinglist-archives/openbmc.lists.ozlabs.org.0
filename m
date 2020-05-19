Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 511D11D8E55
	for <lists+openbmc@lfdr.de>; Tue, 19 May 2020 05:41:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49R1rP6QPDzDqnw
	for <lists+openbmc@lfdr.de>; Tue, 19 May 2020 13:41:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49R1qX5XYYzDqm9
 for <openbmc@lists.ozlabs.org>; Tue, 19 May 2020 13:40:24 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04J3Xrr8109984; Mon, 18 May 2020 23:40:13 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312c22qrpn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 23:40:12 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04J3UiCO011271;
 Tue, 19 May 2020 03:40:11 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 313wne0c4h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 May 2020 03:40:11 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04J3e8ad2359666
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 May 2020 03:40:08 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0F18A4065;
 Tue, 19 May 2020 03:40:07 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 926F4A4057;
 Tue, 19 May 2020 03:40:06 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.246.128])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 19 May 2020 03:40:06 +0000 (GMT)
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Subject: Processing PLDM FRU information with entity manager
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 James Feist <james.feist@linux.intel.com>,
 "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 "Bhat, Sumanth" <sumanth.bhat@intel.com>
Message-ID: <7d8ba039-377f-c567-6a3d-5a18c4789df2@linux.vnet.ibm.com>
Date: Tue, 19 May 2020 09:10:05 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-18_11:2020-05-15,
 2020-05-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 cotscore=-2147483648 lowpriorityscore=0 adultscore=0 malwarescore=0
 mlxlogscore=828 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005190025
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

IBM systems have a requirement to consume FRU information sent down via 
the host firmware and then relay that onto D-Bus (and then onto 
Redfish). The host firmware will send down FRU information using PLDM.

We wanted to use entity manager to enable transforming the PLDM FRU data 
to D-Bus properties that fall under D-Bus inventory interfaces such as 
the xyz.openbmc_project.Inventory.Decorator.Asset interface. I have an 
update to the PLDM design doc to capture this flow [1], and some D-Bus 
interfaces [2] proposed on Gerrit. Would appreciate feedback on the 
same. The high level idea is that the pldm daemon will host raw PLDM FRU 
information on D-Bus, and via JSON configs, entity manager can convert 
those to D-Bus inventory objects (which then can be found by bmcweb).

 From an entity manager perspective, I had few questions :
- I see there is provision for persistence, but it looks like applying 
the persisted information works only if "D-Bus probes" succeed. We have 
a requirement to make the host-sent inventory information available even 
when the host is powered off. Now if the host has sent this, then powers 
off, and then BMC reboots, the BMC will no longer have the raw PLDM FRU 
information on D-Bus and hence the entity manager probe on the same will 
fail. Question is, can the probes be made optional when reading the 
persisted config (system.json)?

- How are hierarchical relationships between FRUs supposed to be 
represented? Is that based on D-Bus pathnames? Or making use of 
something like the D-Bus Associations interface? Any thoughts on how 
representing such parent-child relation can be achieved via entity 
manager configs?

[1] https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/32532/
[2] 
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/32533/

Thanks,
Deepak

