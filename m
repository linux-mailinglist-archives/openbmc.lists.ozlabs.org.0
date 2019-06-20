Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D8B4CAF4
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 11:34:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TxVg3BJ1zDr41
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 19:34:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TxH769RZzDr7J
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 19:24:45 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5K9Mm4R074067
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 05:24:42 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t877a8ntv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 05:24:41 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Thu, 20 Jun 2019 10:24:40 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 20 Jun 2019 10:24:37 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5K9OaBr26149052
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jun 2019 09:24:36 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C97852059;
 Thu, 20 Jun 2019 09:24:36 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.199.203.20])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id E935052051;
 Thu, 20 Jun 2019 09:24:35 +0000 (GMT)
Subject: Re: Platform telemetry and health monitoring
To: Neeraj Ladkani <neladk@microsoft.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <BL0PR2101MB0932AE0C63ADC3CBDAE0CF16C8060@BL0PR2101MB0932.namprd21.prod.outlook.com>
 <4d082cf8-c99c-22ac-9a60-85f70abb8bd6@linux.vnet.ibm.com>
 <CAGMNF6W+W1VPnqa3J1Y_wqc=BcnkBCi4-h9rG4tjUUrCk3zR8g@mail.gmail.com>
 <CALXe31mBvxQTaUkuFJsMozBYLiVTur18pMsTUfHY2t02Xp34wg@mail.gmail.com>
 <CAGMNF6XSD2U-qAe5ibotCkYW-U21vV+tL5-rJwvjPUvWwHA1hw@mail.gmail.com>
 <20190605124935.ywwwoj26fk46e6qu@thinkpad.dyn.fuzziesquirrel.com>
 <ab42831d-e2a9-c13d-9061-fd39b807ace2@yadro.com>
 <CAGMNF6UpQ9WpHhZa8_NxRvraYG2mz=YgVjf+jYySigLXBzQTog@mail.gmail.com>
 <BL0PR2101MB0932ECD784D96485087196F4C8EC0@BL0PR2101MB0932.namprd21.prod.outlook.com>
 <cf878393-615b-c87a-7e15-de9d1fce2375@linux.vnet.ibm.com>
 <BL0PR2101MB0932DE1118B5BD98447A0EC2C8EA0@BL0PR2101MB0932.namprd21.prod.outlook.com>
 <BL0PR2101MB093231A9C83BC1477B5DD323C8E50@BL0PR2101MB0932.namprd21.prod.outlook.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Thu, 20 Jun 2019 14:54:35 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <BL0PR2101MB093231A9C83BC1477B5DD323C8E50@BL0PR2101MB0932.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19062009-4275-0000-0000-00000344068E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062009-4276-0000-0000-000038543569
Message-Id: <582a29cf-e3bf-f7d3-2e78-c743c3a6a2d2@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-20_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=955 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906200069
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

On 19/06/19 11:11 AM, Neeraj Ladkani wrote:
> In last meeting, we discussed that telemetry data can be collected using “tools” and exported using binary “blobs”,
> 
> Should we define a standard data format so that information can be parsed through standard mechanism and help taking specific actions.
> 
> Host CPU
> Memory
> Network Adapter
> GPUs/IPUs
> BMCs
> 

Redfish has a work-in-progress [1] Telemetry schema, and I believe via 
this schema, one can pull out telemetry information, as well as have the 
BMC push out Telemetry information via server-sent events. Are you 
looking at this as an option?

[1] 
https://www.dmtf.org/documents/redfish-spmf/redfish-telemetry-white-paper-010a

Regards,
Deepak

> Thanks
> Neeraj

