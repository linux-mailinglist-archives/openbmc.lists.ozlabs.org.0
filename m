Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB5514A131
	for <lists+openbmc@lfdr.de>; Mon, 27 Jan 2020 10:50:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 485lP21tgpzDqDd
	for <lists+openbmc@lfdr.de>; Mon, 27 Jan 2020 20:50:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 485lNB25q7zDqD9
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jan 2020 20:50:01 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00R9aex2043646
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jan 2020 04:49:58 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xrk3bbqsx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jan 2020 04:49:57 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Mon, 27 Jan 2020 09:49:55 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 27 Jan 2020 09:49:53 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00R9noWL12583004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jan 2020 09:49:50 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62ACC4C040;
 Mon, 27 Jan 2020 09:49:50 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A27A4C044;
 Mon, 27 Jan 2020 09:49:49 +0000 (GMT)
Received: from [9.122.210.117] (unknown [9.122.210.117])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Jan 2020 09:49:48 +0000 (GMT)
Subject: Re: Summarizing Meeting on BMC Aggregation
To: Richard Hanley <rhanley@google.com>, Neeraj Ladkani <neladk@microsoft.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAH1kD+ZLYHqc8jVWVYjCPCRC3eanb4EZ7xgW_-sOLm2GhnSfzg@mail.gmail.com>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Mon, 27 Jan 2020 15:19:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAH1kD+ZLYHqc8jVWVYjCPCRC3eanb4EZ7xgW_-sOLm2GhnSfzg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20012709-0012-0000-0000-00000380FE3C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012709-0013-0000-0000-000021BD4D58
Message-Id: <4bd424fa-aafd-7526-e555-4355c0dca132@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-27_02:2020-01-24,
 2020-01-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 spamscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001270082
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
Cc: "sgundura@in.ibm.com" <sgundura@in.ibm.com>,
 "shahjsha@in.ibm.com" <shahjsha@in.ibm.com>,
 "vikantan@in.ibm.com" <vikantan@in.ibm.com>,
 "kusripat@in.ibm.com" <kusripat@in.ibm.com>, murunata@in.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Richard,

Thanks for capturing and sharing the discussion here. If I am reading it 
all correct, it looks like the aggregator here is an external entity and 
not part of one of the BMCs in the domain. To somewhat relate, this is 
kind of an aggregator like Nagios. Did I get it correct ?

The email mentions "data and control". Could you give an example 
solution on how below problem statements may be seen and executed by the 
proposed aggregator ?

*Hypothetical Problems*:

Case-1 : I have 4 Nodes in the rack, with each having a BMC inside, 
responsible for doing things for THAT node.
I want to power-on all the nodes in the rack and I want to use RedFish 
from a Management console.
Where is the aggregator in this setup and how is it orchestrated ?

Case-2 : Some BMC fails to power on the container node and it needs to 
report the error back to the initiator.

Thank you very much for taking this initiative,

!! Vishwa !!

On 1/17/20 1:45 AM, Richard Hanley wrote:
> Hi everyone,
>
> We had a meeting today to talk about BMC aggregation.  I wanted to 
> thank everyone who joined.
>
> Below is my summary of the topics we discussed, and some of the action 
> items I took from the meeting.  Please let me know if there was 
> something important that I missed or miss-characterized.
> ------------------------------------------------------------------------------------------------------
>
> There is a strong need to aggregate data and control features from 
> multiple BMCs into a single uniform view of a "machine."
>
> The definition of a machine here is relatively opaque, but it can be 
> thought of as an atomic physical unit for management.  A machine is 
> then split into multiple domains, each of which is managed by some 
> management controller (most cases it would be a BMC).  There may be 
> some cases where a domain has multiple BMCs for redundancy.
>
> Domains are relatively close to each other physically. Sometimes they 
> will be in the same chassis/enclosure, while other cases they will be 
> in an adjacent tray.
>
> One key point that was discussed in this meeting was that the data and 
> transport of these domains is relatively unconstrained.  Domains may 
> be connected to the aggregator via a LAN, but there is a 
> community need to support other transports like SMBus and PCIe.
>
> An aggregator will likely need to be split up into three layers:
>
> 1) The lowest layer would detect, import, and transform individual 
> domains into a common data model.  We would need to provide a 
> specification for that data model and tooling for implementers to 
> create their own instance of a domain's data.
>
> 2) An aggregation layer would take the instances of these domain level 
> data models, and aggregate them into a single view or graph of the 
> system.  This process could be relatively automated graph manipulation.
>
> 3) A presentation layer would take that aggregate, and expose it to 
> the outside world.  This presentation layer could be Redfish, but 
> there is some divergence on that (see below). Regardless, we would 
> need tooling to program against the data model for implementers to 
> modify their presentation layers as needed.
>
> There is fairly broad agreement that Layer 1 would need to support 
> multiple protocols including; Redfish, PLDM/MCTP, and legacy IPMI 
> systems.  There would need to be support for creating custom drivers 
> for importing these various transports into a common data model.
>
> There is some diverging needs when it comes to the presentation 
> layer.  Here at Google, we were planning to have the presentation 
> layer be primarily Redfish and the common data model would be more 
> Redfish focused.  Neeraj pointed out that there are some needs for 
> other presentation layers besides Redfish.
>
> Some other design considerations include the hardware target for this 
> aggregator.  This aggregator will have to run on an OpenBMC platform, 
> but Google has some need for an aggregator to run on host linux 
> machines for legacy platforms without an out of band connection.
>
> Another consideration is the security of this aggregator. The 
> aggregation layer will have the primary responsibility of 
> adjudicating authentication and authorization for the sub-ordinate nodes.
>
> One of the key takeaways (for me anyways) from this meeting is that 
> there is a community interest in keeping this aggregator generic, and 
> not tied to closely to a particular protocol, transport, or 
> presentation layer.  There was mention of the CIM data model that may 
> be appropriate for this situation.
>
> We will be having follow-up meetings because this project is going to 
> take some time to scope out and design.  I will be researching prior 
> art for existing data models that we could build a presentation layer 
> off of.
>
> Regards,
> Richard

