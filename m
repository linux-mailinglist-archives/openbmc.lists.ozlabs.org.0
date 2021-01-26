Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D0030432B
	for <lists+openbmc@lfdr.de>; Tue, 26 Jan 2021 16:57:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQBFT3DT9zDr0P
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 02:57:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mtBGaUn5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQBDT3NVKzDqwg
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 02:56:24 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10QFXE6p176105; Tue, 26 Jan 2021 10:56:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=n+kQP4cGEUiYj/DcryWkw4aaR08Onw9pDZXtyADuRqQ=;
 b=mtBGaUn5gKHZ5dtmTrWGHdp2Xdfzsvngh4ckzG8xjiD2KhL5413CeurmL9qtWJqd4Tns
 v1zAZUdWyLb0N1Dt4ahcy7F4TZL81ivl/hnR3WFAOHUEnZEkTQHFJKhNKEZ9z++t99ej
 McUoSei1coHeSt5aRdrY6ob4Xgc/TX0mXOMrWcfNrffnKZjM4mdKfzLAUiI15bAmi8eV
 cYYpJUrmJY7t4V++qUcKWKWJh0YofeWgMC8EVJ3VL/4DsQw6S1idQTGsr0DhV/d/aNpd
 pRioh2S50OWTOBtRpNS9/4xezCTAVs3C8NljT/t2D+RjEdDcsn8buW6x3dniTjjGaChN iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36aj4by963-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 10:56:15 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10QFXOlb178706;
 Tue, 26 Jan 2021 10:56:14 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36aj4by95g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 10:56:14 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10QFl6Pi010110;
 Tue, 26 Jan 2021 15:56:13 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 36agvejc5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 15:56:13 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10QFuCSH28443094
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jan 2021 15:56:12 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 357BD6E04E;
 Tue, 26 Jan 2021 15:56:12 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 440DF6E04C;
 Tue, 26 Jan 2021 15:56:11 +0000 (GMT)
Received: from [9.160.24.112] (unknown [9.160.24.112])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 26 Jan 2021 15:56:11 +0000 (GMT)
Subject: Re: OpenBMC Logging Implementations: Interfaces and Error Messaging
To: Ed Tanous <edtanous@google.com>, "Giles, Joshua" <Joshua.Giles@dell.com>
References: <DM6PR19MB356141B80B3FDB392843099195BE9@DM6PR19MB3561.namprd19.prod.outlook.com>
 <CAH2-KxD-e2P1O+yE8E4qzkUhB7MtTZcHJO-CWs7nptTNnrATcQ@mail.gmail.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <b060ccb1-1a6f-cf6b-d70a-79dfdddec305@linux.ibm.com>
Date: Tue, 26 Jan 2021 09:56:12 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAH2-KxD-e2P1O+yE8E4qzkUhB7MtTZcHJO-CWs7nptTNnrATcQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-26_08:2021-01-26,
 2021-01-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 phishscore=0 mlxscore=0 spamscore=0 clxscore=1011 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101260083
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Ed Tanous <ed@tanous.net>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 1/25/2021 1:47 PM, Ed Tanous wrote:
> On Mon, Jan 25, 2021 at 11:05 AM Giles, Joshua <Joshua.Giles@dell.com> wrote:
>> Hello All,
>>
>>
>>
>> We’re hoping to get clarity in two areas of Logging with the aim of proposals to benefit all.
>>
>> These are interfaces and error messaging…
>>
>>
>>
>> Logging interfaces
>>
>> ===============
>>
>> Webui-vue appears to only display redfish Event Logging whereas “legacy” phosphor-logging is used by things such as generating SNMP traps.
>>
>>
>>
>> Question: Will legacy event logging be deprecated in OpenBMC in favor of Redfish logging?  If not, do we merely access legacy logging out-of-band via rsyslog?

I'll just mention that at the very least IBM will be using the 
phosphor-logging event logs for the foreseeable future due to some 
requirements on how we handle service for HW errors.  bmcweb already has 
the ability to convert those event logs into Redfish logservice events.  
At the moment they aren't combined with a message registry, but we plan 
to eventually add that.


>>
>>
>> Error Messaging
>>
>> =============
>>
>> There appears to be some duplicate/unique error messages amongst the two implementations:
>>
>> Phosphor-dbus-interfaces: e.g. https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Sensor/Threshold/Critical.interface.yaml
>> Redfish message registry: e.g. https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/34510/4/redfish-core/include/registries/openbmc_message_registry.hpp (SensorThreshHoldCriticalGoingHigh)
>>
>>
>>
>> Question: Will the unique “legacy” errors defined in the phosphor-dbus-interfaces be available in the redfish message registry?  Is there a plan to consolidate these moving forward?
> I have no plans for this, nor have I seen a design for consolidating
> the two.  Today, they're different because Redfish log endpoints have
> very different requirements than phosphor-logging interfaces were able
> to provide, with that said, I'm open to there being a much simpler
> design that could work well here, I just haven't applied a lot of
> brainpower to trying to get them consolidated.
>
>>
>>
>> -Josh Giles

