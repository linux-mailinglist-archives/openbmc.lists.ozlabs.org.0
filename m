Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D52B543CA1
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 21:14:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJH3b23xHz3bs2
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 05:14:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=phRhj5L3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=phRhj5L3;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJH380Mp7z3bm7
	for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2022 05:14:27 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 258JBcF8005850;
	Wed, 8 Jun 2022 19:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=KYJnUyL4mVlDS3fQzWn6JGRZwV6n3LMgew27SC+xPkA=;
 b=phRhj5L3cGx3vMmO0m203DbOw3dKbM/rVfYP2JIE9xYIFoyd5PYtBLY6fzIKMMPItgr9
 +4WMN8GglPBzJ3BuEDSNZ05WmFr/u37wKJnRhbY93zWqxMC0TpebJJoQ9khXTovSDVPY
 VWthzajfvP8UXEOx8PZ8zIhID71XG5lDmFq3m8XUOE4pWJPjfENloydxNXZsRJBzaKz2
 hrv1RlYSuDCn9Vcur8zEMZ8FrRvePSBBAHdtuh8iGUZghGQqJPBgpDL2T6GjwnjxYzoI
 mhlqJYL7Ao2UF2SpIJe84V77q6slg3WWd7d7qgEf0+/ZtzfWJHVEytdozyJK+Pw92FIW ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gk1q7g182-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jun 2022 19:14:24 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 258JCCiM011527;
	Wed, 8 Jun 2022 19:14:24 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gk1q7g17s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jun 2022 19:14:24 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 258IobFd031046;
	Wed, 8 Jun 2022 19:14:23 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
	by ppma01dal.us.ibm.com with ESMTP id 3gfy1achn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jun 2022 19:14:23 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 258JEMTu7340796
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jun 2022 19:14:22 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9192D124053;
	Wed,  8 Jun 2022 19:14:22 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4412C12405A;
	Wed,  8 Jun 2022 19:14:22 +0000 (GMT)
Received: from [9.160.53.66] (unknown [9.160.53.66])
	by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
	Wed,  8 Jun 2022 19:14:22 +0000 (GMT)
Message-ID: <7c210f05-ef5e-5a9e-8986-677044dffe5d@linux.ibm.com>
Date: Wed, 8 Jun 2022 14:14:21 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: FW: Newbie question on Redfish URI resource names
Content-Language: en-US
To: Jeff Friedman <jeff.friedman@ztsystems.com>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        Ed Tanous <edtanous@google.com>
References: <1593fdf40a6046a7a614407f7d08be15@ztsystems.com>
 <68063aedd81c42b39d1b343e3a0748b5@ztsystems.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <68063aedd81c42b39d1b343e3a0748b5@ztsystems.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dhED2rknBi2wYqarmQha3eGylBvq-hty
X-Proofpoint-GUID: ytO7Eh-c4OWsB9CYZxblaQY8fiE8zOk8
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-08_05,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 bulkscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206080074
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

On 6/8/22 1:08 PM, Jeff Friedman wrote:
> Hello all, New to OpenBMC, and am not clear on one thing as pertaining 
> to the Redfish schema and URI resource names: The DMTF Redfish schema 
> URIs are defined as: /redfish/v1/Chassis/{ChassisId}/ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ 
> ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍
> ZjQcmQRYFpfptBannerStart
> This Message Is From an External Sender
> This message came from outside your organization.
> ZjQcmQRYFpfptBannerEnd
>
> Hello all,
>
> New to OpenBMC, and am not clear on one thing as pertaining to the 
> Redfish schema and URI resource names:
>
> The DMTF Redfish schema URIs are defined as:
>
> /redfish/v1/Chassis/{ChassisId}/
>
> /redfish/v1/Managers/{ManagerId}
>
> /redfish/v1/Systems/{ComputerSystemId}
>
> Vendors can use their own names for {ChassisId}, {ManagerId}, and 
> {ComputerSystemId} as long as they conform to the syntax rules.
>
> Question: Does OpenBMC specify names for these resources as part of 
> the OpenBMC spec? Or does OpenBMC just refer to the existing DMTF 
> Redfish schemas?
>
> I ask because I have seen reference to the following names in examples 
> for Managers and Systems on the OpenBMC website:
>
> /redfish/v1/Chassis/{ChassisId}/
>
> /redfish/v1/Managers/*/bmc/*/
>
> /redfish/v1/Systems/*/system/*/
>
> In summary, does OpenBMC specify these resource names as part of their 
> spec, or does it refer to existing DMTF Redfish schema specs?
>

Can you link to the Redfish spec schemas?

As far as I know, the OpenBMC project does not have a separate spec for 
resource names (outside of the BMCWeb reference implementation).
BMCWeb: https://github.com/openbmc/bmcweb

Why do you ask?  OpenBMC members have expressed some interest in having 
the BMC control multiple hosts.  For example: system0, system1.  See
https://lore.kernel.org/openbmc/CACWQX82d9NqHatq4of=LrQoP6hfLvbMuZs948ydrThj1J1uhCg@mail.gmail.com/


Joseph

> Thank you!
>
> *Jeff Friedman*
> Sr. Field Systems Engineer | ZT Systems
>
> M: 206.819.2824
>
> ZT Systems <http://www.ztsystems.com/>
>
> This email and any files transmitted with it are 
> privileged/confidential and intended solely for the use of the 
> individual to whom they are addressed. If you have received this email 
> in error, you are not authorized to distribute it in whole or in part. 
> This communication does not constitute a contract offer, amendment, or 
> acceptance of a contract offer, unless explicitly stated.
>

