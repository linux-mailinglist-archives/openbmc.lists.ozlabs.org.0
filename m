Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C6B6E3D8E
	for <lists+openbmc@lfdr.de>; Mon, 17 Apr 2023 04:51:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0BQy50zVz3cMb
	for <lists+openbmc@lfdr.de>; Mon, 17 Apr 2023 12:51:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YE4uHb1g;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YE4uHb1g;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0BQM2DmBz3bh8
	for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2023 12:51:22 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33GNTX5U001455;
	Mon, 17 Apr 2023 02:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=1FleEfL+fayopvSLTWXuEl9soY2wi7t8L7Rv9gkAvWk=;
 b=YE4uHb1gkXTYLhMRwzfvJkB2HY/AE4qw+7CFeQybtqPcJKfOUS1SBkUtgu5nqeWPVEbH
 qLTXs9r7gHwZ0pLXu1+aB2ES1D1FOn7b3mVNfD+TVVOM1pxnSLMoD/HY7ptpkFXpkMl3
 nH5Q7XjYycSRSjuM+jaYQbThuFejvMLsxFBtDCiNUpBYXY6Zhhm3HJKFiZ/z12ZAn+tf
 AyAKxJLit2iBhB7iS9cF8sFto2uVXIlNNNpygY71XZlELSkJxC+2KIdTgE1fGOqOW70m
 aaIxhfXvirE8A3z+eehs5kyduZd9kIFzljS0ZaAuTr0CLUXEDg1crI7rT87oMk0CkcdJ uA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q0deyvbp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Apr 2023 02:51:16 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33H1eSVC003686;
	Mon, 17 Apr 2023 02:51:15 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3pykj7jxq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Apr 2023 02:51:15 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33H2pEKH11534972
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Apr 2023 02:51:14 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E7B95804B;
	Mon, 17 Apr 2023 02:51:14 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2EA6E58059;
	Mon, 17 Apr 2023 02:51:14 +0000 (GMT)
Received: from [9.163.80.110] (unknown [9.163.80.110])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Apr 2023 02:51:14 +0000 (GMT)
Message-ID: <0b16ce93-e51d-deaa-d4a8-16db3c7b740c@linux.vnet.ibm.com>
Date: Sun, 16 Apr 2023 20:51:15 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Help Required]Unsupported routes and properties present on
 Redfish Interface
To: Aishwary Joshi <aishwaryj@nvidia.com>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <CY5PR12MB60833AEB2F2FA388F05E4AD8CC989@CY5PR12MB6083.namprd12.prod.outlook.com>
Content-Language: en-US
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
In-Reply-To: <CY5PR12MB60833AEB2F2FA388F05E4AD8CC989@CY5PR12MB6083.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EWf3nq6R_IXoNObYLV8tu2I7KmNp476H
X-Proofpoint-GUID: EWf3nq6R_IXoNObYLV8tu2I7KmNp476H
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-16_16,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304170022
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

On 4/13/2023 6:59 AM, Aishwary Joshi wrote:
> 
> Problem Statement
> 
> 1. Unsupported routes getting activated on the platform
> 
> 2. Redfish resources contain properties  which are initialized with 
> default values which causes misleading info present on redfish interface.
> 
> *For problem #1,*
> 
> We have seen that in the current bmcweb implementation, certain 
> collection routes are enabled by default
> 
> Eg requestRoutesTriggerCollection, requestRoutesCableCollection etc. 
> which are not must have routes on our platforms but gets enabled by 
> default. We know that when redfish api for the collection will not 
> return any member on platform where backend support is absent  but since 
> /redfish/v1 has links to these collection routes. It creates an 
> impression about feature is being supported and when actually its not.

When a client queries a Redfish resource collection with no 
corresponding D-Bus objects, the resource collection is empty. This 
isn't enough?
https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/cable.hpp#L125

I am open to doing something here, but it is extra code, so I want to 
ensure it is needed. Would we do this for all Redfish resources? Only 
select resources? How do we determine which ones?

> 
> *Suggestion 1: Feature Flag(already present for some of the routes)*
> 
> Enable/disable such routes through compile time flags for given platform.
> 
> But this could make bmcweb code difficult to manage especially to 
> support multiple platforms with varied configurations


Another choice is to look at if there aren't any corresponding  D-Bus 
objects; the link is left off. E.g., in service_root.hpp, look for 
xyz.openbmc_project.Inventory.Item.Cable to determine if 
asyncResp->res.jsonValue["Cables"]["@odata.id"] = "/redfish/v1/Cables"; 
is there. This does mean extra calls in service_root.hpp


> 
> *For problem #2*
> 
> We have a use case where certain platform supports multiple redfish 
> Chassis resource and only on few of redfish Chassis resource we want to 
> populate Links.ComputerSystems . As per redfish schema 
> Links.ComputerSystems is not mandatory property as for Chassis resource 
> these are the only required fields which we are adhering to.
> 
>        - ChassisType
> 
>        - '@odata.id'
> 
>        - '@odata.type'
> 
>        - Id
> 
>        - Name
> 
> Code Ref: 
> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/chassis.hpp#L456
> 
> DONOT want to tie this problem statement to just Chassis resource. The 
> example mentioned above is just one code block where we have observed 
> the issue but exist for few of the redfish properties in other redfish 
> resources also.
> 
> *Suggestion 2: To use d-bus based discovery checks to populate such 
> Links/Properties instead of having any default value in the bmcweb*
> 
> Dbus based discovery can be through following checks (but not limited to):
> 
> - dbus property checks on an interface
> 
> - Association checks
> 
> - dbus interface checks
> 
> This would ensure that on any redfish resource there are no default 
> values and Links/Properties are populated only when backend service 
> actually supports it.
> 

Yeah, I think we should use associations for Redfish Links. We have been 
documenting associations in PDI. I think that is a great place to start.

E.g. 
https://github.com/openbmc/phosphor-dbus-interfaces/commit/36b527af49cf87d0bc7097ea6faba4904fbf8878

https://github.com/openbmc/bmcweb/issues/225 is an issue for the reverse 
Link (System to Chassis)

Thanks,
Gunnar
