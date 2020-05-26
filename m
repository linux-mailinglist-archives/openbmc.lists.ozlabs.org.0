Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D921E2277
	for <lists+openbmc@lfdr.de>; Tue, 26 May 2020 14:58:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WYtM4wn5zDqQc
	for <lists+openbmc@lfdr.de>; Tue, 26 May 2020 22:58:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WYsL203QzDqGN
 for <openbmc@lists.ozlabs.org>; Tue, 26 May 2020 22:57:41 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04QCXZIv132221; Tue, 26 May 2020 08:56:34 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 316vqfy36c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 May 2020 08:56:34 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04QCpwxw025807;
 Tue, 26 May 2020 12:56:32 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 316uf85xa8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 May 2020 12:56:31 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04QCuTYe65208500
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 May 2020 12:56:29 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EEED4C058;
 Tue, 26 May 2020 12:56:29 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2299F4C04E;
 Tue, 26 May 2020 12:56:28 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.246.120])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 May 2020 12:56:27 +0000 (GMT)
Subject: D-Bus interface to provide data to entity manager (was: Processing
 PLDM FRU information with entity manager)
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 James Feist <james.feist@linux.intel.com>,
 "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 "Bhat, Sumanth" <sumanth.bhat@intel.com>,
 Patrick Williams <patrick@stwcx.xyz>
References: <7d8ba039-377f-c567-6a3d-5a18c4789df2@linux.vnet.ibm.com>
Message-ID: <5fc67500-b0f4-c964-fc9a-d3f5346e47ab@linux.vnet.ibm.com>
Date: Tue, 26 May 2020 18:26:27 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <7d8ba039-377f-c567-6a3d-5a18c4789df2@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-26_02:2020-05-26,
 2020-05-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 cotscore=-2147483648 mlxscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005260095
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

On 19/05/20 9:10 am, Deepak Kodihalli wrote:
> Hi,
> 
> IBM systems have a requirement to consume FRU information sent down via 
> the host firmware and then relay that onto D-Bus (and then onto 
> Redfish). The host firmware will send down FRU information using PLDM.
> 
> We wanted to use entity manager to enable transforming the PLDM FRU data 
> to D-Bus properties that fall under D-Bus inventory interfaces such as 
> the xyz.openbmc_project.Inventory.Decorator.Asset interface. I have an 
> update to the PLDM design doc to capture this flow [1], and some D-Bus 
> interfaces [2] proposed on Gerrit. Would appreciate feedback on the 
> same. The high level idea is that the pldm daemon will host raw PLDM FRU 
> information on D-Bus, and via JSON configs, entity manager can convert 
> those to D-Bus inventory objects (which then can be found by bmcweb).
> 
>  From an entity manager perspective, I had few questions :
> - I see there is provision for persistence, but it looks like applying 
> the persisted information works only if "D-Bus probes" succeed. We have 
> a requirement to make the host-sent inventory information available even 
> when the host is powered off. Now if the host has sent this, then powers 
> off, and then BMC reboots, the BMC will no longer have the raw PLDM FRU 
> information on D-Bus and hence the entity manager probe on the same will 
> fail. Question is, can the probes be made optional when reading the 
> persisted config (system.json)?
> 
> - How are hierarchical relationships between FRUs supposed to be 
> represented? Is that based on D-Bus pathnames? Or making use of 
> something like the D-Bus Associations interface? Any thoughts on how 
> representing such parent-child relation can be achieved via entity 
> manager configs?
> 
> [1] https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/32532/
> [2] 
> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/32533/ 
> 
> 
> Thanks,
> Deepak
> 

I've got some feedback on the proposal above, which is primarily 
directed at/impacts how the PLDM daemon provides FRU information to the 
entity manager daemon. Wanted to discuss the same here.

Very briefly, the proposal was :
a) The PLDM daemon will parse PLDM FRU format data and host the same on 
D-Bus as a set of PLDM FRU properties (similar to how the FruDevice 
daemon hosts properties under xyz.openbmc_project.FruDevice).
b) Apply EM system/board specific configurations on a) to be able to 
create specific inventory D-Bus objects (this is how EM works today).


To do a) above, there are 3 options:

1) Propose a D-Bus interface in phosphor-dbus-interfaces. This was [2] 
in my original email above. The concern raised by Patrick here is that 
this interface is very specific to a protocol (PLDM in this case), 
whereas the phosphor D-Bus interfaces are mostly abstract and protocol 
agnostic.

In my opinion, PLDM is also a data model, so PLDM specific D-Bus 
interfaces can enable two apps that are PLDM aware (for eg a PLDM 
requester app talking to the PLDM daemon) to talk to each other. I do 
see other protocol specific D-Bus interfaces as well (for eg related to 
SMBIOS). So I don't really understand the concern. The protocol specific 
interfaces do not preclude other abstract interfaces.



2) Propose a generic/abstract 'FRU properties' kind of D-Bus interface. 
This is something that both the PLDM daemon and FRU device daemon could 
use to host FRU information on D-Bus, and to provide the same as an 
intermediate FRU format data to apps like EM. The suggestion on the docs 
commit above [2] was to have an interface like {Enum[Protocol], 
array[byte]}. I think instead this could be a dict[string, 
variant[string, int64]], for a FRU property to value mapping.

While this sounds interesting, are the maintainers of EM and FruDevice 
interested in such an interface? Based on how this interface is 
designed, it might imply changes to FruDevice and Entity Manager. I 
might be interested in chasing this based on the feedback received, and 
if this will really have users other than the PLDM daemon.



3) If everyone thinks option 1 is a bad idea, and if the interest in 
option 2 is limited, I could do this based on how the FruDevice daemon 
and EM interact today, which is based on kind of a private D-Bus 
interface between the two apps. I don't think the Fru device daemon is 
tied up to EM though, it could even be in its own repository.


Thanks,
Deepak
