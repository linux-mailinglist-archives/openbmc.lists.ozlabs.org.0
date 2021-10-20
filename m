Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B879D434F32
	for <lists+openbmc@lfdr.de>; Wed, 20 Oct 2021 17:36:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZF8J1XGDz305Q
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 02:36:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cQXRXV8b;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cQXRXV8b; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZF7p45W6z2yHJ
 for <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 02:36:06 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19KFGUXv006361; 
 Wed, 20 Oct 2021 11:36:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ISajHiOfctlvMy5SAbfXyWc1Mw1dk9tovFnq5GcZ03k=;
 b=cQXRXV8bsdG/+VNeDFFKihRiOZrElctvoLLVrNx73hwMasgVXrpR7BhYNQVviK/LxkMc
 GPcb8B2qiYScKUH2GyDm/k5aOf9ZFuXAQsmvBKZ5SBYTJNLKi7zCgaC2lO6V+PlLH2t3
 qOrEd0xUc/sw07yHo4C+R195Bss4/b4/6q/VCpV5OCnqkp5oocDZV6qlGvibdQ7UX1wJ
 dNMiyfyrRjLIU9vDZmptaYs/HT6m2kwTRsaubJKwDDPnh3svUlbuFn49dv0G7g9OVb+V
 63XAnyPuRU28ZOetBHnX1gc4WASN4QsIdoxPcpZ7EGJdbTzhjdQUcO3K78zxj63p/aH4 BQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3btkvguf8s-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 11:36:02 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19KF4CAU003132;
 Wed, 20 Oct 2021 15:13:08 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 3bqpccten7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 15:13:08 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19KFD7fg33882486
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Oct 2021 15:13:07 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F95AC6067;
 Wed, 20 Oct 2021 15:13:07 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4073DC6065;
 Wed, 20 Oct 2021 15:13:07 +0000 (GMT)
Received: from [9.160.173.42] (unknown [9.160.173.42])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 20 Oct 2021 15:13:07 +0000 (GMT)
Subject: Re: [phosphor-logging] About the "Stop emitting Entry propChanged
 before ifacesAdded" change reason
To: CS20 CHMa0 <CHMA0@nuvoton.com>
References: <HK0PR03MB3089CFCA31102DE7BB551413F5BE9@HK0PR03MB3089.apcprd03.prod.outlook.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <b71bb325-cf41-deab-5422-11520f85cc55@linux.ibm.com>
Date: Wed, 20 Oct 2021 10:13:06 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <HK0PR03MB3089CFCA31102DE7BB551413F5BE9@HK0PR03MB3089.apcprd03.prod.outlook.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UGNQf0zhtVHaCpMc9w6f_Na7QAQwE6ps
X-Proofpoint-ORIG-GUID: UGNQf0zhtVHaCpMc9w6f_Na7QAQwE6ps
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-20_05,2021-10-20_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=559 adultscore=0
 clxscore=1011 bulkscore=0 mlxscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110200089
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



On 10/20/2021 3:39 AM, CS20 CHMa0 wrote:
> Hi Matt, I meet an issue in bmcweb while update service handle 
> firmware update error 
> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/update_service.hpp#L321 
> After I revert the change or try to change the match rule from 
> 'PropertiesChanged' ZjQcmQRYFpfptBannerStart
> This Message Is From an External Sender
> This message came from outside your organization.
> ZjQcmQRYFpfptBannerEnd
>
> Hi Matt,
>
> I meet an issue in bmcweb while update service handle firmware update 
> error
>
> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/update_service.hpp#L321 
> <https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/update_service.hpp#L321> 
>
>
> After I  revert the change or try to change the match rule from 
> 'PropertiesChanged' to 'InterfacesAdded',
>
> the error handler work well in update service.
>
>      fwUpdateErrorMatcher = 
> std::make_unique<sdbusplus::bus::match::match>(
>
>          *crow::connections::systemBus,
>
> - "type='signal',member='PropertiesChanged',path_namespace='/xyz/"
>
> -        "openbmc_project/logging/entry',"
>
> - "arg0='xyz.openbmc_project.Logging.Entry'",
>
> + "interface='org.freedesktop.DBus.ObjectManager',type='signal',"
>
> +        "member='InterfacesAdded',"
>
> + "path='/xyz/openbmc_project/logging'",
>
> May I ask the reason why you update the change? 
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-logging/+/46055 
> <https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-logging/+/46055>
>

Hi,
I guess I saw this as a bug fix.  The code creates the interface on 
D-Bus with the defer-interfaces-added parameter set to true so it 
wouldn't emit interfacesAdded at the point, then sets all the property 
values, and then explicitly emits the IA signal.   Others can chime in, 
but I didn't see it as proper D-Bus behavior to emit propertiesChanged 
before InterfacesAdded, since in fact no property is changing after the 
interface was added.

It seems like every application does their own thing here, so maybe we 
can come up with some official best practices for how to emit signals 
for new interfaces (unless it's there and I missed it).


> Thanks
>
> Brian
>
> ------------------------------------------------------------------------
> The privileged confidential information contained in this email is 
> intended for use only by the addressees as indicated by the original 
> sender of this email. If you are not the addressee indicated in this 
> email or are not responsible for delivery of the email to such a 
> person, please kindly reply to the sender indicating this fact and 
> delete all copies of it from your computer and network server 
> immediately. Your cooperation is highly appreciated. It is advised 
> that any unauthorized use of confidential information of Nuvoton is 
> strictly prohibited; and any information in this email irrelevant to 
> the official business of Nuvoton shall be deemed as neither given nor 
> endorsed by Nuvoton. 

