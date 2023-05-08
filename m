Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0CA6FB82E
	for <lists+openbmc@lfdr.de>; Mon,  8 May 2023 22:14:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFXYx633zz3fH8
	for <lists+openbmc@lfdr.de>; Tue,  9 May 2023 06:14:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W2+tBuOE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W2+tBuOE;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFXYL6LBvz3cLC
	for <openbmc@lists.ozlabs.org>; Tue,  9 May 2023 06:13:42 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 348KC2mj008497
	for <openbmc@lists.ozlabs.org>; Mon, 8 May 2023 20:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : from : subject : to : content-type :
 content-transfer-encoding; s=pp1;
 bh=nE4LJPKqkCmZ4DkjhCfLspiA3IaDsU3WeEyLlHfa7IU=;
 b=W2+tBuOEep/q1PqqMoicA5p/Je5mCNMdZItcSCY/5fCJF82Wp+qBdkvJSOhyhOmLLneD
 j5MfxlZURA4nx9tMpZ2gqJkAluNKg060zpahZw0iC+uQLeuhZwIs3Wve8GCPxI5tmT4B
 vApzUl9F8zikVoJ33ljP2T3tyWTUx2MGUnoYqPKPBTZfyk0o3RdIBJsLJHpUnC3ZIr0a
 Mz6UL/z2Oea9AnOy9gfz08RHXDAx+3TjdHw4pcey9O9iNtdRjcrSDrojnq3Qm9jVV513
 3qm2MlPmIshSn8+pqMWki3z3vhhICO+SpULUyQIS4dqaCn3632cMzPTOncKi8Q087mNH Hg== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qf7weg187-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Mon, 08 May 2023 20:13:38 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 348HD7Cv011961
	for <openbmc@lists.ozlabs.org>; Mon, 8 May 2023 20:13:37 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3qdeh7432t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Mon, 08 May 2023 20:13:37 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 348KDa3P40370512
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Mon, 8 May 2023 20:13:36 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C5BF58055
	for <openbmc@lists.ozlabs.org>; Mon,  8 May 2023 20:13:36 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A7C655804E
	for <openbmc@lists.ozlabs.org>; Mon,  8 May 2023 20:13:35 +0000 (GMT)
Received: from [9.67.11.133] (unknown [9.67.11.133])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP
	for <openbmc@lists.ozlabs.org>; Mon,  8 May 2023 20:13:35 +0000 (GMT)
Message-ID: <62774e92-ee78-a154-672e-fbcf6c25db42@linux.ibm.com>
Date: Mon, 8 May 2023 15:13:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Matt Spinler <mspinler@linux.ibm.com>
Subject: Location Codes in Entity Manager
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HySbvZ9Qsww-nQ8CZor06mGYdi6FKFlK
X-Proofpoint-ORIG-GUID: HySbvZ9Qsww-nQ8CZor06mGYdi6FKFlK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_15,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 clxscore=1011 bulkscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 mlxlogscore=709 malwarescore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305080134
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

We're trying to see if we can move from splitting our inventory needs
between entity-manager and phosphor-inventory into just using EM.

One thing we used PIM for was holding our
xyz.openbmc_project.Inventory.Decorator.LocationCode values, which are 
used to
hierarchically identify a specific connector in the system. This applies to
both internal and external connectors. Several apps make use of them, for
example bmcweb to populate the ServiceLabel property or PLDM to send 
location
codes to the BIOS.

The base of our location code is built with the chassis SN and some 
other values,
and below I'll just refer to it as 'BASE'.  Here are some examples:

BASE
   - chassis location code
BASE-P0
   - the backplane connector on the chassis
BASE-P0-C0
   - the leftmost card connector on the backplane
BASE-P0-C0-T1
   - an ethernet connector on that card

As these point to connectors, they still need to be populated regardless 
of the
presence of what's plugged into the connector.  No location codes downstream
from an absent card are needed (i.e. if no P0-C0 card is populated then
there is no concept of a P0-C0-T1).

Does it make sense to have EM host these interfaces? It seems to fit pretty
naturally, with a few enhancements:

- Come up with a connector model such that Inventory.* D-Bus interfaces 
can be
   created for connectors on an entity.  While I see mentions of 
connectors in
   the Exposes array for use with fans, currently everything in Exposes only
   emits .Configuration. interfaces. Aside from just the location code 
interface
   we'd want the Inventory.Item.Connector interface (or maybe instead 
one that
   identifies the type of connector), and a name property.

- Match up a card with its parent connector, including when there are 
multiple
   connectors the card can plug into (like pcie cards), so that the 
child card
   can obtain its location code from the connector so it can make it 
available
   to its children.  The physical topology code in EM can create 
associations
   between parent and child entities, so it would add on to that and add
   connector associations as well, plus the ability to pull data from the
   connector to use.

- Come up with a concept of a location code base.  Maybe just some new JSON
   syntax that could be used (in the chassis JSON file in our case) that 
says
   where to get it from D-Bus which can then get propagated through the 
model.

Is this the right direction?  If so, any ideas on the modeling?

Thanks!


